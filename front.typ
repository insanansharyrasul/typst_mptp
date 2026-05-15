#import "lib/format_ppki.typ": *

#let front_matter(cfg) = [
  #show: bagian-awal

  #let judul_upper = upper(cfg.judul)
  #let nama_upper = upper(cfg.nama)
  #let program_upper = upper(cfg.program_studi)
  #let logo = if cfg.logo_path != "" { image(cfg.logo_path, width: 2.5cm) } else { none }

  #halaman-sampul(
    judul: judul_upper,
    nama: nama_upper,
    nim: cfg.nim,
    program-studi: program_upper,
    fakultas: cfg.fakultas,
    tahun: cfg.tahun,
    logo: logo,
  )

  #halaman-judul(
    judul: judul_upper,
    nama: nama_upper,
    nim: cfg.nim,
    program-studi: program_upper,
    fakultas: cfg.fakultas,
    tahun: cfg.tahun,
  )

  #halaman-pernyataan(
    nama: nama_upper,
    nim: cfg.nim,
    judul: cfg.judul,
    jenis-karya: cfg.jenis_karya,
    tanggal: cfg.pernyataan_tanggal,
  )

  #abstrak(
    nama: cfg.abstrak_id.nama,
    judul: cfg.abstrak_id.judul,
    pembimbing: cfg.pembimbing,
    isi: cfg.abstrak_id.isi,
    kata-kunci: cfg.abstrak_id.kata_kunci,
  )

  #abstract-en(
    nama: cfg.abstrak_en.nama,
    judul: cfg.abstrak_en.judul,
    pembimbing: cfg.pembimbing,
    isi: cfg.abstrak_en.isi,
    keywords: cfg.abstrak_en.keywords,
  )

  #halaman-hak-cipta(tahun: cfg.tahun)

  #halaman-judul-dalam(
    judul: cfg.judul,
    nama: cfg.nama,
    nim: cfg.nim,
    jenis-karya: cfg.jenis_karya,
    program-studi: program_upper,
    fakultas: cfg.fakultas,
    tahun: cfg.tahun,
  )

  #halaman-penguji(
    penguji: cfg.penguji,
    judul: "Tim Penguji pada Ujian Skripsi:",
  )

  #lembar-pengesahan(
    judul: cfg.judul,
    nama: cfg.nama,
    nim: cfg.nim,
    jenis-karya: cfg.jenis_karya,
    program-studi: cfg.program_studi,
    pembimbing: cfg.pembimbing,
    ketua: cfg.ketua,
    ketua-label: cfg.ketua_label,
    ketua-nip: cfg.ketua_nip,
    dekan: cfg.dekan,
    dekan-label: cfg.dekan_label,
    dekan-nip: cfg.dekan_nip,
    tanggal-ujian: cfg.tanggal_ujian,
    tanggal-lulus: cfg.tanggal_lulus,
  )

  #prakata[cfg.prakata]

  #daftar-isi()
  #daftar-tabel()    // hapus baris ini jika tabel <= 1
  #daftar-gambar()   // hapus baris ini jika gambar <= 1
  #daftar-lampiran() // hapus baris ini jika tidak ada lampiran
]
