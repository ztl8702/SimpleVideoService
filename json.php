<?php
    $str = '{"playerOptions": "{\"playbackRates\": [0.25 ,0.5, 1, 1.5, 2, 5], \"autoplay\": true, \"preload\": true, \"techOrder\": [\"html5\",\"flash\"]}"}';
    //$tmp = array("playOptions" => '\'{"playbackRates": [0.25 ,0.5, 1, 1.5, 2, 5], "autoplay": true, "preload": true, "techOrder": ["html5","flash"]}\'');
    //echo json_encode($tmp);
    echo $str;
    $arr = json_decode($str, TRUE);
    echo var_dump($arr);

?>

