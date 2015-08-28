<?php
require_once('db.php');
require('smarty/Smarty.class.php');
$smarty = new Smarty;
$smarty->template_dir = 'templates/';
$smarty->compile_dir = 'templates_c/';
$smarty->config_dir = 'configs/';
$smarty->cache_dir = 'cache/';

$db = new MyDB();

$data = json_decode($db->getVideoJson($_GET["vid"]),TRUE); 


$smarty->assign("chapterList", $data["chapters"]);


$smarty->assign("sourceList", $data["sources"]);

$smarty->assign("trackList", $data["tracks"]);


$smarty->assign
("title",$data["videoTitle"]." | ".$db->getSetting('title'));
$smarty->assign("siteName",$db->getSetting('siteName'));
$smarty->assign("videoTitle",$data["videoTitle"]);
$smarty->assign("videoDescription",$data["videoDescription"]);
$smarty->assign("playerOptions", $data["playerOptions"]);
$smarty->display('video.tpl');
?>