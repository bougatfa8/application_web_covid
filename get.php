<?php
   require_once("db.php");
   $query='SELECT * FROM posts';
   $stm=$db->prepare($query);
   $stm->execute();
   $result = array();
   $row = $stm->fetch(PDO::FETCH_ASSOC);
   $result[] = $row;

   echo json_encode($result);
?>
