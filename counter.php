<?php

function add_visitation(&$conn, $page_id) {
    
    $conn->query("INSERT INTO visitations (page_id, created_at) VALUES('$page_id',  NOW())");
}
