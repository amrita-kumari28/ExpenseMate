<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

$host = "localhost";
$db   = "expense_manager";
$user = "root";
$pass = "";
$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    echo json_encode(["status" => "error", "message" => "DB failed"]);
    exit;
}

$data     = json_decode(file_get_contents("php://input"), true);
$user_id  = intval($data['user_id']);
$category = $conn->real_escape_string($data['category']);
$amount   = floatval($data['amount']);
$note     = $conn->real_escape_string($data['note'] ?? '');
$month    = date('n');
$year     = date('Y');

$budget = $conn->query("SELECT monthly_limit FROM budgets WHERE user_id=$user_id AND category='$category' AND month=$month AND year=$year")->fetch_assoc();
if (!$budget) {
    echo json_encode(["status" => "error", "message" => "No budget set for this category"]);
    exit;
}

$spent = $conn->query("SELECT SUM(amount) as total FROM expenses WHERE user_id=$user_id AND category='$category' AND MONTH(created_at)=$month AND YEAR(created_at)=$year")->fetch_assoc();
$total_spent = floatval($spent['total']);
$limit = floatval($budget['monthly_limit']);

if ($total_spent + $amount > $limit) {
    echo json_encode([
        "status"    => "error",
        "message"   => "Limit exceeded! Spent: Rs.$total_spent / Rs.$limit",
        "remaining" => round($limit - $total_spent, 2)
    ]);
    exit;
}

$conn->query("INSERT INTO expenses (user_id,category,amount,note) VALUES ($user_id,'$category',$amount,'$note')");
$new_spent = $total_spent + $amount;
$pct_used  = ($new_spent / $limit) * 100;
$warning   = $pct_used >= 75 ? "Warning: ".round($pct_used)."% of $category budget used!" : null;

echo json_encode([
    "status"    => "success",
    "message"   => "Expense added",
    "warning"   => $warning,
    "spent"     => $new_spent,
    "remaining" => round($limit - $new_spent, 2)
]);
?>