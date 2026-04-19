<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");

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

$result = $conn->query("SELECT * FROM expenses WHERE user_id=$user_id AND MONTH(created_at)=$month AND YEAR(created_at)=$year ORDER BY created_at DESC");
$expenses = [];
while ($row = $result->fetch_assoc()) {
    $expenses[] = $row;
}
echo json_encode(["status" => "success", "data" => $expenses]);
?>