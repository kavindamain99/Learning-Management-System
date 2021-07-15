<?php
require ("config.php");

session_start();

if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: login.php");
    exit;
}

$first_name = $last_name = $name = $email = $qualification = $contact_number = "";

$teacher_id = $_SESSION["id"];

$sql = "SELECT * FROM teacher WHERE teacherId = '$teacher_id'";
$query_result = $conn->query($sql);

if ($query_result->num_rows == 1) {
    while ($query_result_row = $query_result->fetch_assoc()) {
        $student_id = $query_result_row["teacherId"];
        $first_name = $query_result_row["firstName"];
        $last_name = $query_result_row["lastName"];
        $email = $query_result_row["email"];
        $qualification = $query_result_row["qualification"];
        $contact_number = $query_result_row["contactNumber"];

        $name = $first_name." ".$last_name;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/Profiles.css">
        <title>Update Details</title>
    </head>
    <body>
        <?php require("sideBar.php") ?>

        <div class="container">
            <h1>My Profile</h1>
            <table>
                <tr>
                    <td>&nbsp;&nbsp;Name</td>
                    <td>:&nbsp;&nbsp;<?php echo $name ?></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Teacher ID</td>
                    <td>:&nbsp;&nbsp;<?php echo $teacher_id ?></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Email</td>
                    <td>:&nbsp;&nbsp;<?php echo $email ?></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Qualification</td>
                    <td>:&nbsp;&nbsp;<?php echo $qualification ?></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;Contact Number</td>
                    <td>:&nbsp;&nbsp;<?php echo $contact_number ?></td>
                </tr>
            </table>

            <a href="Teacher_Update_Details.php"><input type="button" name="update_details" value="Update Details"></a>
            <a href="Teacher_Update_Password.php"><input type="button" name="update_password" value="Update Password"></a><br>
            <a href="Teacher_Delete_Account.php"><input type="button" name="delete_account" value="Delete Account"></a>
        </div>
    </body>
</html>