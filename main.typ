#import "lib/format_ppki.typ": *

#show: ppki.with(
  judul: "Judul Karya Ilmiah Anda",
  nama-penulis: "Insan Anshary Rasul",
  nim: "G6401231132",
  program-studi: "Ilmu Komputer",
  fakultas: "Sekolah Sains Data Matematika dan Informatika",
  tahun: "2026",
  jenis-karya: "laporan-akhir",
)

// ── Bagian Awal (nomor halaman Romawi: i, ii, iii, …) ──
#show: bagian-awal

#halaman-sampul(
  judul: "analisis performa aplikasi flutter dengan menggunakan foreign function interface bahasa c",
  nama: "INSAN ANSHARY RASUL",
  nim: "G6401231132",
  program-studi: "ILMU KOMPUTER",
  fakultas: "Sekolah Sains Data Matematika dan Informatika",
  tahun: "2026",
  logo: image("assets/logo-ipb.png", width: 2.5cm),
)

#daftar-isi()
#daftar-tabel()    // hapus baris ini jika tabel ≤ 1
#daftar-gambar()   // hapus baris ini jika gambar ≤ 1

// ── Bagian Isi (nomor halaman Arab: 1, 2, 3, …) ────────
#show: bagian-isi

= PENDAHULUAN
== Latar Belakang

#lorem(100)

#lorem(100)

== Rumusan Masalah

1. #lorem(10)
2. #lorem(10)
3. #lorem(10)

== Tujuan Penelitian
1. #lorem(10)
2. #lorem(10)
3. #lorem(10)

== Manfaat
1. #lorem(10)
2. #lorem(10)
3. #lorem(10)

#pagebreak()

== Ruang Lingkup
1. #lorem(10)
2. #lorem(10)
3. #lorem(10)


= TINJAUAN PUSTAKA

== Judul Subbab 1

#lorem(100)

#lorem(100) @smith2020novel

== Judul Subbab 2

#lorem(100)

#lorem(80)

= METODE PENELITIAN

== Waktu dan Tempat Penelitian
== Alat dan Bahan
== Prosedur Kerja
== Analisis Data

#daftar-pustaka("../reference/reference.bib", style: "ipb.csl")

#lampiran[
]
