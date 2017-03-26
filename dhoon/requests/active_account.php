<?php

include("../includes/config.php");



if (empty($_GET['token']) || empty($_GET['a'])) {

	return false;

}



if ($_GET['token'] != md5($CONF['salt'] . $_GET['a'])) {

	return false;

}



$db = new mysqli($CONF['host'], $CONF['user'], $CONF['pass'], $CONF['name']);

$db->query("update users set verified = 1 where idu=".$_GET['a']);

$res = $db->query("select username, password from users where idu=".$_GET['a']);

$row = $res->fetch_assoc();

session_start();

$_SESSION['username'] = $row['username'];

$_SESSION['password'] = $row['password'];

header('Location: ' . $CONF['url']);

?>