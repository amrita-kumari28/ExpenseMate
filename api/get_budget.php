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

$user_id = intval($_GET['user_id']);
$month   = intval($_GET['month']);
$year    = intval($_GET['year']);

$result = $conn->query("SELECT * FROM budgets WHERE user_id=$user_id AND month=$month AND year=$year");
$budgets = [];
while ($row = $result->fetch_assoc()) {
    $budgets[] = $row;
}
echo json_encode(["status" => "success", "data" => $budgets]);
?>