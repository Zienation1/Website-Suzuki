<?php
// Mengizinkan file HTML dari folder lain (seperti BERANDA) untuk membaca data ini
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// --- KONFIGURASI KONEKSI DATABASE (SESUAI GAMBAR ANDA) ---
$host = "localhost"; // Biarkan default
$username = "root"; // User default XAMPP
$password = ""; // Password default XAMPP (kosong)
$database = "db_suzuki"; // Nama database Anda di phpMyAdmin

// Menjalankan koneksi
$koneksi = mysqli_connect($host, $username, $password, $database);

// 🔍 [PENGECEKAN ERROR DI SINI] - Inilah penyebab error merah di browser Anda
if (!$koneksi) {
    // Jika koneksi gagal, kirim kode status error ke JavaScript
    http_response_code(500); 
    echo json_encode([
        "error" => "MySQL Connection Error: " . mysqli_connect_error()
    ]);
    exit(); // Stop script
}

// --- JIKA KONEKSI SUKSES, AMBIL DATA ---

// Query SQL untuk mengambil data motor. 
// LIMIT 3 agar hanya mengambil 3 motor teratas untuk ditampilkan di beranda.
// Pastikan nama kolom (id, nama_motor, harga, gambar_motor) sama persis dengan phpMyAdmin Anda.
$query = "SELECT id, nama_motor, harga, gambar_motor FROM motors LIMIT 3";
$result = mysqli_query($koneksi, $query);

// Menyiapkan array kosong untuk menampung data
$data = [];

// Jika query berhasil dan ada datanya
if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        // Mengubah nama properti objek agar sesuai dengan HTML (nama, harga, gambar)
        // Kita juga tambahkan link dinamis untuk tombol 'Lihat Detail'
        $data[] = [
            "id" => $row['id'],
            "nama" => $row['nama_motor'],
            "harga" => $row['harga'],
            // Jalur gambar disesuaikan dengan struktur folder (keluar dari KATALOG masuk ke folder asal gambar)
            "gambar" => "IMG/" . $row['gambar_motor'], 
            // Membuat link detail dinamis (contoh: detail_motor.html?id=1)
            "link_detail" => "../SPESIFIKASI/detail_motor.html?id=" . $row['id']
        ];
    }
}

// Mengubah array PHP menjadi format JSON yang dimengerti JavaScript
echo json_encode($data);

// Menutup koneksi
mysqli_close($koneksi);
?>