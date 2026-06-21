<?php

session_start();


session_unset();


session_destroy();


header("Location: login.php?message=" . urlencode("Anda telah logout. Silahkan login kembali."));
exit;
?>
