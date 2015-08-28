<?php

class MyDB extends SQLite3
{
    function __construct()
    {
        $this->open('db.s3db');
        
    }
    
    function getVideoJson($vid)
    {
        $result = $this->query('SELECT * FROM videos WHERE id='.trim($vid));
        $row = $result->fetchArray();
        return $row["json"];
    }
    
    function getSetting($key)
    {
        
        $result = $this ->query('SELECT * FROM settings WHERE key="'.trim($key).'"');
        $row = $result->fetchArray();
        return $row["value"];
    }
}

?>
