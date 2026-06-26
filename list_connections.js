const mysql = require('mysql2');

const db = mysql.createConnection({
    host: 'b4qdjas6nzukduzcos2l-mysql.services.clever-cloud.com',
    user: 'udys9x8byrqqzae9',
    password: 'ejOl01oKUCQw50wasc4V',
    database: 'b4qdjas6nzukduzcos2l'
});

db.connect((err) => {
    if (err) {
        console.error('Koneksi gagal:', err.message);
        process.exit(1);
    }
    console.log('Koneksi sukses!');
    
    db.query('SHOW PROCESSLIST', (err, results) => {
        if (err) {
            console.error('Gagal menjalankan SHOW PROCESSLIST:', err.message);
        } else {
            console.log('Koneksi aktif:');
            console.log(results);
        }
        db.end();
    });
});
