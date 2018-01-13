<?php

    $DBUser = 'cc';
    $DBPass = 'MIF0N77YXhhmgk0ABFs6';
    $DBHost = 'localhost';
    $DBName = 'cc';
    $token = 'something-easy-yet-secure';


    // Function to generate random names/ids
    function randomString($length = 6) {
        $str = "";
        $characters = array_merge(range('A','Z'), range('a','z'), range('0','9'));
        $max = count($characters) - 1;
        for ($i = 0; $i < $length; $i++) {
            $rand = mt_rand(0, $max);
            $str .= $characters[$rand];
        }
        return $str;
    }

    // This handles the upload part
    if(isset($_POST['upload']) && $_POST['token'] == $token) {
        $con = new mysqli($DBHost, $DBUser, $DBPass, $DBName);

        if ($con->connect_error) {
            die("Connection failed: " . $con->connect_error);
        }

        $stmt = $con->prepare("INSERT INTO `data`(`id`, `data`) VALUES (?, ?)");
        $stmt->bind_param("ss", $named, $contentd);

        $named = randomString(6);
        $contentd = $_POST['data'];
        $stmt->execute();

        $stmt->close();
        $con->close();

        echo $named;

    } elseif($_POST['token'] !== $token) {
        http_response_code(204);
    }


    if(isset($_GET['download'])) {

        $con = new mysqli($DBHost, $DBUser, $DBPass, $DBName);

        if ($con->connect_error) {
            die("Connection failed: " . $con->connect_error);
        }

        $id = $_GET['download'];

        $stmt = $con->prepare("SELECT `data` FROM `data` WHERE `id` = ?");
        $stmt->bind_param("s", $id);
        $stmt->execute();
        $stmt->bind_result($contentd);
        $stmt->fetch();

        $stmt->close();
        $con->close();

        if($contentd !== null) {
            header('Content-Type: text/plain');
            http_response_code(200);
            echo $contentd;
        } else {
            http_response_code(204);
        }

    }
?>
