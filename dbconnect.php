<?php 
// isi nama host, username mysql, dan password mysql anda
$conn = mysqli_connect("localhost","root","","ptamu");

if(!$conn){
	echo "gagal konek database menn";
} else {
	
};



//publish product to Most View Product
if(isset($_POST['publish'])){
		$idp = $_POST['idproduk'];
   		$namaproduk  = $_POST['namaproduk'];
		$rate        = $_POST['rate'];

		$query = mysqli_query($conn,"SELECT * FROM produk ");
	

    if($query){
		$ums = mysqli_query($conn, "UPDATE msproduct WHERE idproduk='$idp'");
		echo '
        <script>alert ("berhasil");
        window.location.href="produk.php"
        </script>
        ';
        

    }else{
        echo '
        <script>alert ("gagal");
        window.location.href="produk.php"
        </script>
        ';
    }
}


?>