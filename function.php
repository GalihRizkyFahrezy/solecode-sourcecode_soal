public function denda($anggota_id)
{
    $denda = DB::select("SELECT peminjaman.id as id, user.nama as nama, peminjaman.buku_id as buku_id,DATEDIFF(tanggal_pinjam+14, tanggal_pinjam) as batas_pinjam ,IF(DATEDIFF(tanggal_kembali, tanggal_pinjam+14)>0, 
    DATEDIFF(tanggal_kembali, tanggal_batas_kembali)* 1000, 0) as denda from peminjaman inner join user
    on user.id = peminjaman.anggota_id where peminjaman.anggota_id =".$anggota_id);

    $totaldenda = 0;

    foreach($denda as $tambahdenda)
    {
        if($tambahdenda->denda > 0)
        $totaldenda = $totaldenda + $tambahdenda->denda;
    }

    return view('denda',compact('denda','totaldenda'));
}
