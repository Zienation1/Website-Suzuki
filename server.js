const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Menyajikan file statis dari seluruh direktori root proyek
app.use(express.static(path.join(__dirname)));

// Mengarahkan root URL (/) langsung ke halaman Beranda Suzuki
app.get('/', (req, res) => {
    res.redirect('/BERANDA/index_beranda.html');
});

// Koneksi ke Database MySQL
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

db.connect((err) => {
    if (err) {
        console.error('Koneksi ke database gagal: ' + err.stack);
        return;
    }
    console.log('Berhasil terhubung ke Database');
});

// ==================== ENDPOINT API ====================

// 1. API Login Admin
app.post('/api/login', (req, res) => {
    const { username, password } = req.body;
    const sql = "SELECT * FROM admins WHERE username = ? AND password = ?";
    
    db.query(sql, [username, password], (err, result) => {
        if (err) return res.status(500).json({ success: false, message: err.message });
        
        if (result.length > 0) {
            res.json({ success: true, message: 'Login berhasil!', user: result[0] });
        } else {
            res.status(401).json({ success: false, message: 'Username atau Password salah!' });
        }
    });
});

// 2. API Mengambil Semua Data Motor & Summary Dashboard (DENGAN VARIAN)
app.get('/api/motors', (req, res) => {
    const sqlMotors = "SELECT * FROM motors";
    const sqlSummary = `
        SELECT 
            COUNT(id) AS total_motor, 
            AVG(harga) AS rata_harga, 
            MAX(updated_at) AS terakhir_update 
        FROM motors
    `;

    db.query(sqlMotors, async (err, motorsResult) => {
        if (err) return res.status(500).json({ error: err.message });

        // Loop untuk mengambil data varian dari tabel motor_variants untuk setiap motor
        for (let motor of motorsResult) {
            motor.variants = await new Promise((resolve) => {
                db.query("SELECT * FROM motor_variants WHERE motor_id = ?", [motor.id], (err, results) => {
                    resolve(err ? [] : results);
                });
            });
        }

        db.query(sqlSummary, (err, summaryResult) => {
            if (err) return res.status(500).json({ error: err.message });

            // Mengirim data gabungan (motors + variants + summary)
            res.json({
                motors: motorsResult,
                summary: summaryResult[0]
            });
        });
    });
});

// 3. API Update Harga OTR, Harga OP, dan Spesifikasi
app.put('/api/motors/:id', (req, res) => {
    const { id } = req.params;
    const fields = req.body;

    // Filter out fields that are undefined or not in the database schema
    const allowedFields = ['harga', 'mesin', 'transmisi', 'konsumsi_bbm', 'berat', 'keunggulan'];
    const updateParts = [];
    const values = [];

    for (const key of allowedFields) {
        if (fields[key] !== undefined) {
            updateParts.push(`${key} = ?`);
            values.push(fields[key]);
        }
    }

    if (updateParts.length === 0) {
        return res.status(400).json({ success: false, message: 'Tidak ada data yang dikirim untuk diperbarui' });
    }

    // Selalu update waktu updated_at
    updateParts.push(`updated_at = NOW()`);
    values.push(id); // push id for WHERE clause

    const sqlUpdate = `
        UPDATE motors 
        SET ${updateParts.join(', ')} 
        WHERE id = ?
    `;
    
    db.query(sqlUpdate, values, (err, result) => {
        if (err) return res.status(500).json({ success: false, error: err.message });
        
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Data motor tidak ditemukan!' });
        }
        
        res.json({ success: true, message: 'Data motor berhasil diperbarui!' });
    });
});

// 4. API Mengambil Detail 1 Motor berdasarkan ID
app.get('/api/motors/:id', (req, res) => {
    const { id } = req.params;
    const sql = "SELECT * FROM motors WHERE id = ?";
    
    db.query(sql, [id], (err, result) => {
        if (err) return res.status(500).json({ error: err.message });
        if (result.length === 0) return res.status(404).json({ message: 'Motor tidak ditemukan' });
        
        res.json(result[0]);
    });
});

// Menjalankan Server
app.listen(PORT, () => {
    console.log(`Server backend berjalan di http://localhost:${PORT}`);
});

module.exports = app;