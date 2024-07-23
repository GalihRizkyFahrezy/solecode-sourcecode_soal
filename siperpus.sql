INSERT INTO user (nama, alamat, no_ktp, no_hp, email) VALUES
	("user 1","tangerang","0001","0801","anita@email.com"),
	("user 2","tangerang","0002","0802","bayu@email.com"),
	("user 3","pamulang","0003","0803","cyntia@email.com"),
	("user 4","ciledug","0004","0804","dhani@email.com"),
	("user 5","ciputat","0005","0805","erika@email.com");

INSERT INTO kategori (nama) VALUES ("fiksi"), ("action"), ("mystery"), ("fantasy"), ("novel");

INSERT INTO buku (judul, pengarang, penerbit, isbn, tahun_terbit, jumlah_tersedia,kategori_id) VALUES
                    ("buku 1","Corvo Attano", "Defy Team","0001","2017",15, 5),
		    ("buku 2","Hans Clark", "Redemption House","0002","1971",10, 3),
                    ("buku 3","Daniel Porter", "Redemption House","0003","1998",8, 3),
                    ("buku 4","Corvo Attano", "Bethesda","0004","2011",12, 5),
                    ("buku 5","Corvo Attano", "Bethesda","0005","2013",15, 5),
                    ("buku 6","Pantalone Sirius", "Redemption House","0006","2015",40, 4),
                    ("buku 7","Crud Flies", "Defy Team","0007","1992",7, 2),
                    ("buku 8","Samuel Mili", "Bethesda","0008","2008",9, 2),
                    ("buku 9","Samuel Mili", "Bethesda","0009","2001",8, 2),
                    ("buku 10","Corvo Attano", "Defy Team","0010","2017",15, 5);

INSERT INTO peminjaman (anggota_id, buku_id, tanggal_pinjam, tanggal_batas_kembali, tanggal_kembali, denda) VALUES
                    (1,1,"2024-05-01","2024-05-12","2024-05-14",2000),
                    (1,2,"2024-05-01","2024-05-12","2024-05-16",4000),
                    (1,3,"2024-05-01","2024-05-12","2024-05-11",0),
                    (2,4,"2024-06-01","2024-06-12","2024-06-11",0),
                    (2,5,"2024-06-01","2024-06-12","2024-06-7",0),
                    (2,6,"2024-06-01","2024-06-12","2024-06-15",3000),
                    (3,7,"2024-07-01","2024-07-12","2024-07-20",8000),
                    (3,8,"2024-07-01","2024-07-12","2024-07-19",7000),
                    (3,9,"2024-07-01","2024-07-12","2024-07-2",0);
                    

SELECT judul as Buku FROM buku LEFT JOIN peminjaman ON buku.id = peminjaman.buku_id  where peminjaman.buku_id IS null;

SELECT user.nama ,IF(DATEDIFF(tanggal_kembali, tanggal_batas_kembali)>0, DATEDIFF(tanggal_kembali, tanggal_batas_kembali)* 1000, 0) as denda from peminjaman inner join user on user.id = peminjaman.anggota_id where denda > 0;

select user.id, user.nama as User, GROUP_CONCAT(CONCAT(buku.judul) SEPARATOR ', ') AS Buku
FROM user inner join peminjaman on user.id = peminjaman.anggota_id inner join  buku on buku.id = peminjaman.buku_id GROUP BY peminjaman.anggota_id;
