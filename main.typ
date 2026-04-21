#import "lib/format_ppki.typ": *

#show: ppki.with(
  judul: "Judul Karya Ilmiah Maksimum Tiga Baris, Lima Belas Kata Tidak Termasuk Kata Depan Dan Kata Sambung",
  nama-penulis: "Nama Lengkap",
  nim: "NXXXXXXXXX",
  program-studi: "Program Studi",
  fakultas: "Nama Fakultas/Sekolah",
  tahun: "20XX",
  jenis-karya: "skripsi",
)

// ── Bagian Awal (nomor halaman Romawi: i, ii, iii, …) ──
#show: bagian-awal

#halaman-sampul(
  judul: "JUDUL KARYA ILMIAH MAKSIMUM TIGA BARIS, LIMA BELAS KATA TIDAK TERMASUK KATA DEPAN DAN KATA SAMBUNG",
  nama: "NAMA LENGKAP",
  nim: "NXXXXXXXXX",
  program-studi: "PROGRAM STUDI",
  fakultas: "Nama Fakultas/Sekolah",
  tahun: "20XX",
  logo: image("assets/logo-ipb.png", width: 2.5cm),
)

#pagebreak()
#linebreak()

#halaman-pernyataan(
  nama: "NAMA LENGKAP",
  nim: "NXXXXXXXXX",
  judul: "Judul Karya Ilmiah Tugas Akhir",
  jenis-karya: "skripsi",
  tanggal: "Bogor, Bulan Tahun 20XX",
)

#pagebreak()
#abstrak(
  nama: "NAMA MAHASISWA",
  judul: "Judul Skripsi dalam Bahasa Indonesia",
  pembimbing: ("NAMA PEMBIMBING 1", "NAMA PEMBIMBING 2"),
  isi: [
    Narasi disusun dalam satu paragraf, isi tidak lebih dari 200 kata, dan ditulis
    dalam satu halaman untuk abstrak dan _abstract_. Abstrak memuat latar belakang
    permasalahan (tentatif), tujuan penelitian, metode, hasil penelitian dengan
    penekanan pada temuan baru, dan implikasi yang disajikan secara informatif dan
    faktual. Tidak diperbolehkan mengacu pustaka, gambar, dan tabel. Singkatan hanya
    dikenalkan jika masih digunakan lagi dalam bagian lain Abstrak/_Abstract_.
  ],
  kata-kunci: "ditulis dalam bahasa Indonesia, disusun berdasarkan abjad, maksimum lima kata atau frasa",
)

#abstract-en(
  nama: "STUDENT NAME",
  judul: "Title of Thesis (skripsi)",
  pembimbing: ("NAME of 1st SUPERVISOR", "NAME of 2nd SUPERVISOR"),
  isi: [
    Narrative is written in a single paragraph, no more than 200 words, and
    presented in one page for the abstract and _abstract_. The abstract contains
    the background of the problem (tentative), research objectives, methods,
    research results with emphasis on new findings, and implications presented
    in an informative and factual manner. References, figures, and tables are
    not permitted. Abbreviations are only introduced if used again in other
    parts of the Abstract/_Abstract_.
  ],
  keywords: "written in English, arranged alphabetically, maximum five words or phrases",
)

#halaman-hak-cipta(tahun: "20XX")

#halaman-judul-dalam(
  judul: "Judul Karya Ilmiah Maksimum Tiga Baris, Lima Belas Kata Tidak Termasuk Kata Depan Dan Kata Sambung",
  nama: "NAMA LENGKAP",
  nim: "NXXXXXXXXX",
  jenis-karya: "skripsi",
  program-studi: "PROGRAM STUDI",
  fakultas: "Nama Fakultas/Sekolah",
  tahun: "20XX",
)


#pagebreak()

#halaman-penguji(
  penguji: ("Nama lengkap dan gelar", "Nama lengkap dan gelar"),
  judul: "Tim Penguji pada Ujian Skripsi:",
)



#lembar-pengesahan(
  judul: "Judul Karya Ilmiah Maksimum Tiga Baris, Lima Belas Kata Tidak Termasuk Kata Depan Dan Kata Sambung",
  nama: "Nama Lengkap",
  nim: "NXXXXXXXXX",
  jenis-karya: "skripsi",
  program-studi: "Program Studi",
  pembimbing: ("Nama lengkap dan gelar", "Nama lengkap dan gelar"),
  ketua: "Nama lengkap dan gelar",
  ketua-label: "Ketua Program Studi:",
  tanggal-ujian: "DD Bulan 20XX",
  tanggal-lulus: "DD Bulan 20XX",
)

#prakata[
  Puji dan syukur penulis panjatkan kepada Allah subhanaahu wa ta'ala atas segala
  karunia-Nya sehingga karya ilmiah ini berhasil diselesaikan. Tema yang dipilih
  dalam penelitian yang dilaksanakan sejak bulan .... 20XX sampai bulan .... 20XX ini
  ialah .........., dengan judul "..........................................
  ............................................".

  Terima kasih penulis ucapkan kepada para pembimbing, ... (nama lengkap dan gelar)
  yang telah membimbing dan banyak memberi saran. Ucapan terima kasih juga
  disampaikan kepada pembimbing akademik, moderator seminar, dan penguji luar komisi
  pembimbing. Di samping itu, penghargaan penulis sampaikan kepada ... (nama lengkap
  dan gelar dari lembaga/instansi/perusahaan yang telah memberi izin penelitian),
  (nama dan gelar atau bapak/ibu jika tidak ada gelar) beserta staf Laboratorium
  ..... dan seterusnya .... yang telah membantu selama pengumpulan data. Ungkapan
  terima kasih juga disampaikan kepada ayah, ibu, serta seluruh keluarga
  (istri/suami/anak jika sudah menikah) yang telah memberikan dukungan, doa, dan
  kasih sayangnya .... dan seterusnya.

  Semoga karya ilmiah ini bermanfaat bagi pihak yang membutuhkan dan bagi kemajuan
  ilmu pengetahuan.

  #v(1em)
  #align(right)[
    Bogor, Bulan Tahun
    #v(2em)
    _Nama penulis_
  ]
]

#pagebreak()


#daftar-isi()
#daftar-tabel()    // hapus baris ini jika tabel ≤ 1
#daftar-gambar()   // hapus baris ini jika gambar ≤ 1
#daftar-lampiran() // hapus baris ini jika tidak ada lampiran

// ── Bagian Isi (nomor halaman Arab: 1, 2, 3, …) ────────
#show: bagian-isi

= PENDAHULUAN

Bab pendahuluan memuat latar belakang atau alasan kuat dilakukannya penelitian,
tujuan, dan hipotesis jika ada. Di dalam pendahuluan dijelaskan pula perumusan
atau pendekatan penyelesaian masalah dan alasan pemilihan metode yang digunakan.
Bergantung pada proses perumusan masalah penelitian, bagian Kerangka Pikir dan
Hipotesis dapat ditulis di sini, tidak ditulis dalam bab tersendiri.

Paparan tidak berbelit-belit atau dimulai dengan latar belakang yang terlalu umum.
Pernyataan mengenai apa yang diteliti dan apa yang diharapkannya diawali dengan
pemikiran logis. Tujuan penelitian ditulis di bagian akhir bab ini dengan memilih
kata kerja yang hasilnya dapat diukur dan dilihat, seperti: _menguraikan,
menerangkan, membuktikan, menjajaki, menguji, membuktikan, atau menerapkan suatu
gejala, konsep atau dugaan_, atau bahkan _membuat suatu prototipe_. Jangan
menggunakan kata kerja mengetahui atau memahami.

== Latar Belakang

Latar Belakang memuat ulasan singkat mengapa penelitian perlu dilakukan. Uraian
dimulai dengan hal yang unik, fakta, masalah, dan pendapat yang mendasari
dilakukannya penelitian. Di dalamnya diuraikan juga alasan teoretis dan alasan
praktis dari perlunya penelitian dilakukan, dan bagaimana masalah tersebut dapat
dipecahkan dan manfaat dari penyelesaian masalah.

== Rumusan Masalah

Berbekalkan latar belakang dan kerangka pikir, masalah yang diteliti dapat
dirumuskan. Masalah yang dirumuskan harus jelas dan fokus pada kata kunci utama
yang unik. Dalam merumuskan masalah, deskripsi lokasi studi terutama keunikannya
sudah termasuk dalam pertimbangan. Untuk memperjelas perumusan masalah, dapat
juga dibuat beberapa pertanyaan yang hendak dijawab dalam penelitian itu.

== Tujuan

Pernyataan tujuan penelitian ialah pernyataan singkat dan jelas tentang tujuan
yang akan dicapai sebagai upaya pemecahan masalah maupun memahami gejala
(fenomena) yang dijelaskan dalam latar belakang. Gunakan kata kerja yang hasilnya
dapat diukur. Bila ada atau memungkinkan, dapat ditulis manfaat atau kegunaan
hasil penelitian bagi kepentingan pengembangan ipteks, pertimbangan dalam
mengambil kebijakan, kepentingan profesi maupun masyarakat pada umumnya.

== Manfaat

Uraian manfaat penelitian mencakup kepentingan pengembangan ipteks, pertimbangan
dalam mengambil kebijakan, kepentingan profesi maupun masyarakat pada umumnya.

== Ruang Lingkup

Ruang lingkup penelitian menjelaskan batasan-batasan dari penelitian yang
dilakukan agar fokus dan terarah sesuai tujuan yang telah ditetapkan.

== Hipotesis

Hipotesis dapat ditulis secara eksplisit atau tersirat sesuai bidang ipteks yang
relevan. Hipotesis dapat menjadi bagian dari pendahuluan (untuk bidang eksakta
atau kajian eksperimental), atau merupakan bagian akhir dari tinjauan pustaka
(untuk bidang sosial dan ekonomi).


= TINJAUAN PUSTAKA

Pustaka yang digunakan dalam bab ini ialah acuan primer, diutamakan artikel
jurnal dan paten yang relevan dengan bidang yang diteliti, terkini, dan asli
(_state of the art_). Diktat dan buku ajar tidak termasuk acuan primer. Tinjauan
pustaka memuat telaah singkat, jelas, dan sistematis tentang kerangka teoretis,
kerangka pikir, temuan, postulat-postulat, prinsip, asumsi, dan hasil-hasil
penelitian yang relevan yang melandasi masalah penelitian atau gagasan guna
menggali pemahaman mengenai masalah penelitian dan pemecahan masalahnya. Oleh
karena itu, dari tinjauan pustaka harus dapat diturunkan kerangka pikir, hipotesis
penelitian, dan metode penelitian.

== Judul Subbab 1

Isi subbab tinjauan pustaka.

#figure(
  caption: [Tingkat kekerasan buah pisang raja pada suhu simpan yang berbeda dan pemberian putresina],
  kind: table,
  table(
    columns: (1fr, auto, auto, auto),
    align: (left, center, center, center),
    table.hline(stroke: 0.75pt),
    table.cell(rowspan: 2)[Perlakuan],
    table.cell(colspan: 3, align: center)[Kekerasan buah dan kandungan gula pada hari ke-],
    table.hline(stroke: 0.5pt, start: 1),
    [0], [7], [14],
    table.hline(stroke: 0.75pt),
    table.cell(colspan: 4, align: center)[Kekerasan buah (mm 50 g#super[-1] detik #super[-1])#super[a]],
    [Suhu Simpan], [], [], [],
    [#h(1em)15ºC], [9.20a], [13.40a], [11.83a],
    [#h(1em)28ºC], [10.64a], [11.22a], [80.43b],
    [Putresina], [], [], [],
    [#h(1em)Dengan putresina], [12.07a], [13.23a], [11.19a],
    [#h(1em)Tanpa putresina], [10.76a], [14.41a], [41.12b],
    table.hline(stroke: 0.75pt),
    table.cell(colspan: 4)[
      #set text(size: 10pt)
      #super[a]Angka-angka pada kolom yang sama yang diikuti oleh huruf yang sama tidak berbeda nyata pada taraf uji 5% (uji selang berganda Duncan).
    ],
  ),
)

=== Contoh Sub-subbab

Berikut adalah contoh sub-subbab. Pada sub-subbab ini posisi paragraf lebih
menjorok dari paragraf di subbab.

== Judul Subbab 2

Isi subbab tinjauan pustaka.

#figure(
  caption: [Contoh judul gambar lebih dari satu baris maka baris kedua dimulai tepat di bawah huruf pertama judul gambar],
  image("assets/image.png"),
)


= METODE

Bab ini dapat diawali dengan kerangka pendekatan studi. Metode penelitian dapat
berupa percobaan laboratorium, percobaan lapangan, dan survei lapangan yang
dirancang sesuai dengan tujuan atau jenis penelitian, seperti: eksploratif,
deskriptif, koreksional, kausal, komparatif, eksperimen, tindakan (_action
research_), pemodelan, analisis suatu teori, atau kombinasi dari berbagai jenis
penelitian tersebut. Untuk penelitian yang menggunakan metode kualitatif, jelaskan
pendekatan yang digunakan, proses pengumpulan dan analisis informasi, dan proses
penafsiran hasil penelitian. Maksud dari perincian ini ialah untuk menjamin
keterulangan hasil. @smith2020novel

== Waktu dan Tempat

== Alat dan Bahan

== Prosedur Kerja

== Analisis Data


= HASIL DAN PEMBAHASAN

Dalam penulisan hasil dan pembahasan dapat dipisah sebagai bab Hasil dan bab
Pembahasan, atau digabung menjadi bab Hasil dan Pembahasan. Pemisahan atau
penggabungan kedua bab ini bergantung pada bidang studi, atau sesuai dengan
arahan pembimbing.

== Hasil

== Pembahasan


= SIMPULAN DAN SARAN

== Simpulan

Simpulan merupakan jawaban dari tujuan yang sudah ditentukan dan tidak
dimaksudkan sebagai ringkasan hasil. Dalam Simpulan, penulis harus dan hanya
menjawab masalah dan tujuan penelitian yang telah dirumuskan pada Pendahuluan.
Simpulan merupakan generalisasi dari hasil penelitian dan argumentasi penulis,
atau pernyataan singkat yang merupakan hakikat dari bab Hasil dan Pembahasan atau
hasil pengujian berbagai hipotesis yang berkaitan.

Simpulan merupakan hasil penelitian yang boleh jadi telah dikemukakan dalam
perumusan masalah dan telah diberi jawaban sementara berupa hipotesis. Dalam
menulis simpulan, penulis harus membedakan dugaan, temuan, dan simpulan hasil
studi. Pernyataan simpulan harus dilakukan secara cermat dan hati-hati.

== Saran

Saran seyogianya mengarah ke implikasi atau tindakan lanjutan yang harus
dilakukan sehubungan dengan temuan atau simpulan penulis. Saran yang dikemukakan
harus berkaitan dengan pelaksanaan atau hasil penelitian. Dengan demikian saran
ini mengemukakan hal-hal yang perlu diteliti lebih lanjut terutama untuk
memperbaiki kelemahan atau kekurangan dalam penelitian yang dilakukan atau
perbaikan asumsi yang diambil sehingga didapatkan hasil yang lebih baik.

#daftar-pustaka("../reference/reference.bib", style: "ipb.csl")

#lampiran[
  #figure(
    kind: "lampiran",
    supplement: [Lampiran],
    caption: [Rata-rata dan simpangan baku beberapa sifat fisik dan kimia tanah dari 78 contoh tanah di Kebun Percobaan Ciheuleut],
  )[
    #table(
      columns: (1fr, auto, auto),
      table.hline(stroke: 0.75pt),
      [*Sifat*], [*Rata-rata*], [*Simpangan baku*],
      table.hline(stroke: 0.75pt),
      [Pasir (%)], [47.66], [23],
      [Lempung (%)], [21.80], [11],
      [Liat (%)], [30.72], [18],
      [C-organik (%)], [0.61], [0],
      [Rapatan isi (mg m#super[-3])], [1.43], [0],
      [KTK (mek 100 g#super[-1] tanah)], [18.08], [17],
      [KAT pada KL (g g#super[-1])], [23.62], [10],
      [KAT pada TLP (g g#super[-1])], [11.11], [9],
      table.hline(stroke: 0.75pt),
    )
    #set text(size: 10pt)
    Keterangan: KTK: kapasitas tukar kation, KAT: kadar air tanah, KL: kapasitas lapang, TLP: titik layu permanen.
  ]

  #figure(
    kind: "lampiran",
    supplement: [Lampiran],
    caption: [Umur, indeks luas daun, dan hasil biji kering jagung yang ditanam pada lima ketinggian tempat],
  )[
    #table(
      columns: (auto, auto, auto, auto),
      table.hline(stroke: 0.75pt),
      [*Ketinggian (m dpl)*], [*Umur (hari)*], [*Indeks luas daun*], [*Hasil (ton ha#super[-1])*],
      table.hline(stroke: 0.75pt),
      [856], [115], [3.10], [5],
      [605], [106], [3.09], [5],
      [400], [100], [2.47], [4],
      [210], [93], [2.46], [4],
      [10], [88], [2.12], [4],
      table.hline(stroke: 0.75pt),
    )
  ]
]

#riwayat-hidup[
  Penulis dilahirkan di kota .... pada tanggal bulan tahun sebagai anak ke ... dari
  pasangan bapak ... dan ibu .... Pendidikan sekolah menengah atas (SMA) ditempuh
  di sekolah ..., dan lulus pada tahun .... Pada tahun ..., penulis diterima
  sebagai mahasiswa program sarjana (S-1) di Program Studi/Fakultas/Sekolah ... di
  IPB.

  Selama mengikuti program S-1, penulis aktif menjadi ... (riwayat dan pengalaman
  organisasi, asisten akademik, dan sebagainya). Penulis juga pernah mengikuti
  lomba karya ... (riwayat kegiatan ilmiah) memperoleh atau pernah terpilih sebagai
  ... (riwayat prestasi akademik).
]
