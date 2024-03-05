<?php 
function get_linechart_data($conn) {
  $timezone = 'Asia/Jakarta';
  $datetime = new DateTime("monday this week", new DateTimeZone($timezone));
  $monday = $datetime->format('Y-m-d');
  $tuesday = $datetime->modify('+1 day')->format('Y-m-d');
  $wednesday = $datetime->modify('+1 day')->format('Y-m-d');
  $thursday = $datetime->modify('+1 day')->format('Y-m-d');
  $friday = $datetime->modify('+1 day')->format('Y-m-d');
  $saturday = $datetime->modify('+1 day')->format('Y-m-d');
  $sunday = $datetime->modify('+1 day')->format('Y-m-d');

  $query = "
    SELECT (" . get_linechart_query_template($sunday) . ") AS minggu,
    (" . get_linechart_query_template($monday) . ") AS senin,
    (" . get_linechart_query_template($tuesday) . ") AS selasa,
    (" . get_linechart_query_template($wednesday) . ") AS rabu,
    (" . get_linechart_query_template($thursday) . ") AS kamis,
    (" . get_linechart_query_template($friday) . ") AS jumat,
    (" . get_linechart_query_template($saturday) . ") AS sabtu
  ";

  

  $mysql_query = mysqli_query($conn, $query);
	$result = (object) mysqli_fetch_assoc($mysql_query);

  return array($result->senin, $result->selasa, $result->rabu, $result->kamis, $result->jumat, $result->sabtu, $result->minggu);
}

function get_linechart_query_template($date) {
  return "SELECT COUNT(*) AS visitor_count FROM visitations WHERE DATE(created_at) = '$date'";
}