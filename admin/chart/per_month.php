<?php
function get_doughnutcart_data($conn) {
  $timezone = 'Asia/Jakarta';
  $datetime = new DateTime("january", new DateTimeZone($timezone));
  $year = $datetime->format('Y');
  $january = $datetime->format('m');
  $february = $datetime->modify('+1 month')->format('m');
  $march = $datetime->modify('+1 month')->format('m');
  $april = $datetime->modify('+1 month')->format('m');
  $may = $datetime->modify('+1 month')->format('m');
  $june = $datetime->modify('+1 month')->format('m');
  $july = $datetime->modify('+1 month')->format('m');
  $august = $datetime->modify('+1 month')->format('m');
  $september = $datetime->modify('+1 month')->format('m');
  $october = $datetime->modify('+1 month')->format('m');
  $november = $datetime->modify('+1 month')->format('m');
  $december = $datetime->modify('+1 month')->format('m');

  $query = "
    SELECT (" . get_doughnutchart_query_template($january, $year) . ") AS januari,
    (" . get_doughnutchart_query_template($february, $year) . ") AS februari,
    (" . get_doughnutchart_query_template($march, $year) . ") AS maret,
    (" . get_doughnutchart_query_template($april, $year) . ") AS april,
    (" . get_doughnutchart_query_template($may, $year) . ") AS mei,
    (" . get_doughnutchart_query_template($june, $year) . ") AS juni,
    (" . get_doughnutchart_query_template($july, $year) . ") AS juli,
    (" . get_doughnutchart_query_template($august, $year) . ") AS agustus,
    (" . get_doughnutchart_query_template($september, $year) . ") AS september,
    (" . get_doughnutchart_query_template($october, $year) . ") AS oktober,
    (" . get_doughnutchart_query_template($november, $year) . ") AS november,
    (" . get_doughnutchart_query_template($december, $year) . ") AS desember
  ";

  $mysql_query = mysqli_query($conn, $query);
	$result = mysqli_fetch_assoc($mysql_query);

  return array_values($result);
}

function get_doughnutchart_query_template($month, $year) {
  return "SELECT COUNT(*) AS visitor_count FROM visitations WHERE MONTH(created_at) = '$month' AND YEAR(created_at) = '$year'";
}