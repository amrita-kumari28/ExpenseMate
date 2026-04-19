<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
include "../includes/db.php";

$data     = json_decode(file_get_contents("php://input"), true);
$user_id  = intval($data['user_id']);
$category = $conn->real_escape_string($data['category']);
$pct      = floatval($data['percentage']);
$limit    = floatval($data['monthly_limit']);
$month    = intval($data['month']);
$year     = intval($data['year']);

$check = $conn->query("SELECT id FROM budgets WHERE user_id=$user_id AND category='$category' AND month=$month AND year=$year");
if ($check->num_rows > 0) {
    $conn->query("UPDATE budgets SET percentage=$pct, monthly_limit=$limit WHERE user_id=$user_id AND category='$category' AND month=$month AND year=$year");
} else {
    $conn->query("INSERT INTO budgets (user_id,category,percentage,monthly_limit,month,year) VALUES ($user_id,'$category',$pct,$limit,$month,$year)");
}
echo json_encode(["status" => "success", "message" => "Budget saved"]);
?>