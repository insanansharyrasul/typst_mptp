// ==============================================================
// format_ppki.typst
// Template Karya Ilmiah Tugas Akhir IPB
// Berdasarkan Pedoman Penulisan Karya Ilmiah (PPKI) Edisi ke-4
// IPB Press, Desember 2019
//
// Referensi utama: Lampiran 16 PPKI Edisi ke-4
//   (Ringkasan Ketentuan Pengetikan)
// ==============================================================
//
// CARA PENGGUNAAN
// ---------------
// Di file .typst lain, tulis:
//
//   #import "format_ppki.typst": *
//
//   #show: ppki.with(
//     judul:         "Judul Karya Ilmiah Anda",
//     nama-penulis:  "Nama Lengkap Penulis",
//     nim:           "NXXXXXXXXX",
//     program-studi: "Nama Program Studi",
//     departemen:    "Nama Departemen",   // kosongkan jika tidak ada
//     fakultas:      "Nama Fakultas",
//     tahun:         "2024",
//   )
//
//   // ── Bagian Awal (nomor halaman Romawi: i, ii, iii, …) ──
//   #show: bagian-awal
//
//   #halaman-sampul(
//     judul:         "Judul Karya Ilmiah",
//     nama:          "Nama Lengkap",
//     nim:           "NXXXXXXXXX",
//     program-studi: "Program Studi",
//     departemen:    "Departemen",
//     fakultas:      "Fakultas",
//     tahun:         "2024",
//     logo:          image("logo-ipb.png"),  // opsional
//   )
//
//   // ── Halaman Judul Dalam (Lampiran 7) — berbeda dari sampul ──
//   #halaman-judul-dalam(
//     judul:         "Judul Karya Ilmiah",
//     nama:          "Nama Lengkap",
//     jenis-karya:   "skripsi",        // atau "tesis" / "disertasi" / "laporan-akhir"
//     program-studi: "Program Studi",
//     departemen:    "Departemen",
//     fakultas:      "Fakultas",
//     tahun:         "2024",
//     // gelar: "Sarjana Komputer",     // opsional, override otomatis
//   )
//
//   // ── Halaman Hak Cipta (Lampiran 6) — wajib untuk tesis/disertasi ──
//   #halaman-hak-cipta(tahun: "2024")
//
//   // ── Halaman Penguji & Pengesahan (Lampiran 8 & 9) ──
//   #halaman-penguji(
//     penguji: ("Dr. Nama Penguji, M.Si.", "Dr. Nama Penguji 2, M.Si."),
//     judul:   "Tim Penguji pada Ujian Skripsi:",
//   )
//   #lembar-pengesahan(
//     judul:         "Judul Karya Ilmiah",
//     nama:          "Nama Lengkap",
//     nim:           "NXXXXXXXXX",
//     jenis-karya:   "skripsi",
//     program-studi: "Program Studi",
//     pembimbing:    ("Dr. Pembimbing 1, M.Si.", "Dr. Pembimbing 2, M.Si."),
//     ketua:         "Prof. Dr. Ketua Departemen, M.Si.",
//     ketua-label:   "Ketua Departemen Ilmu Komputer:",
//     // dekan:      "Prof. Dr. Dekan, M.Si.",   // tambahkan untuk tesis/disertasi
//     tanggal-ujian: "1 Januari 2024",
//     tanggal-lulus: "15 Januari 2024",
//   )
//
//   // ── Prakata (Lampiran 10) ──
//   #prakata[
//     Puji dan syukur penulis panjatkan kepada Allah subhanaahu wa ta'ala…
//   ]
//
//   #abstrak(
//     nama:        "NAMA MAHASISWA",
//     judul:       "Judul Skripsi dalam Bahasa Indonesia",
//     pembimbing:  ("Nama Pembimbing 1", "Nama Pembimbing 2"),
//     isi:         [Narasi abstrak maks. 200 kata, 1 paragraf.],
//     kata-kunci:  "kata1, kata2, kata3",
//   )
//
//   #abstract-en(
//     nama:       "STUDENT NAME",
//     judul:      "Thesis Title in English",
//     pembimbing: ("Supervisor Name 1", "Supervisor Name 2"),
//     isi:        [Abstract narrative, max 200 words, 1 paragraph.],
//     keywords:   "keyword1, keyword2, keyword3",
//   )
//
//   #daftar-isi()
//   #daftar-tabel()    // hapus baris ini jika tabel ≤ 1
//   #daftar-gambar()   // hapus baris ini jika gambar ≤ 1
//
//   // ── Bagian Isi (nomor halaman Arab: 1, 2, 3, …) ────────
//   #show: bagian-isi
//
//   = PENDAHULUAN
//   == Latar Belakang
//   Teks paragraf dimulai di sini …
//
//   == Tujuan Penelitian
//   ...
//
//   = TINJAUAN PUSTAKA
//   ...
//
//   #daftar-pustaka[
//     Satria A. 2015. Politik Kelautan dan Perikanan. Jakarta: Obor. \
//     Smith J, Doe A. 2020. Judul Artikel. J Nama Jurnal. 10(2):1−10. \
//   ]
//
//   #lampiran[
//     // Konten lampiran...
//   ]
//
//   #riwayat-hidup[
//     Penulis dilahirkan di … pada tanggal …
//   ]
//
// ==============================================================


// ─── Konstanta ───────────────────────────────────────────────

// Jenis huruf utama (PPKI Lampiran 16: Times New Roman)
#let _font = "Times New Roman"

// Ukuran huruf teks biasa: 12pt (PPKI Lampiran 16)
#let _sz-body = 12pt

// Ukuran huruf judul bab: 14pt (PPKI Lampiran 16)
#let _sz-bab = 14pt

// Jenis & ukuran huruf untuk tampilan hasil komputer
// (PPKI Lampiran 16: Courier New 11pt)
#let _font-mono = "Courier New"
#let _sz-mono = 11pt

// Jarak antarbaris (1 spasi). Nilai 0.65em adalah setara
// dengan "single spacing" pada Typst untuk teks 12pt.
#let _leading = 0.65em

// Label jenis karya untuk ditampilkan (Title Case)
#let _jenis-karya-title(jenis-karya) = {
  if jenis-karya == "laporan-akhir" {
    "Laporan Akhir"
  } else if jenis-karya == "tesis" {
    "Tesis"
  } else if jenis-karya == "disertasi" {
    "Disertasi"
  } else {
    "Skripsi"
  }
}

// Label jenis karya untuk teks naratif (lowercase)
#let _jenis-karya-lower(jenis-karya) = lower(_jenis-karya-title(jenis-karya))


// ─── Penomoran Halaman ────────────────────────────────────────

// Header mirror: nomor halaman di pojok kanan atas untuk halaman ganjil
// dan pojok kiri atas untuk halaman genap. Posisi: 2 cm dari atas kertas,
// 3 cm dari tepi kanan/kiri (PPKI Lampiran 16 butir 3, versi mirror).
#let _header-mirror(fmt) = context {
  let n = counter(page).get().first()
  let s = numbering(fmt, n)
  set text(font: _font, size: _sz-body)
  if calc.odd(n) {
    align(right, s)
  } else {
    align(left, s)
  }
}

/// Aktifkan penomoran halaman Romawi kecil (i, ii, iii, …).
/// Digunakan untuk bagian awal (abstrak s.d. daftar lampiran).
///
/// Gunakan: #show: bagian-awal
#let bagian-awal(body) = {
  set page(
    numbering: "i",
    footer: none,
    header: _header-mirror("i"),
    header-ascent: 1cm,
  )
  counter(page).update(1)
  body
}

/// Aktifkan penomoran halaman Arab (1, 2, 3, …).
/// Digunakan mulai dari Bab Pendahuluan.
///
/// Gunakan: #show: bagian-isi
#let bagian-isi(body) = {
  set page(
    numbering: "1",
    footer: none,
    header: _header-mirror("1"),
    header-ascent: 1cm,
  )
  counter(page).update(1)
  body
}


// ─── Template Utama ──────────────────────────────────────────

/// Fungsi pembungkus format dokumen PPKI. Terapkan dengan:
///   #show: ppki.with(...)
///
/// Parameter:
///   judul          - Judul karya ilmiah
///   nama-penulis   - Nama lengkap penulis
///   nim            - Nomor Induk Mahasiswa
///   jenis-karya    - "laporan-akhir" | "skripsi" | "tesis" | "disertasi"
///   program-studi  - Nama program studi
///   departemen     - Nama departemen (boleh kosong)
///   fakultas       - Nama fakultas/sekolah
///   tahun          - Tahun lulus (string, mis. "2024")
#let ppki(
  judul: "",
  nama-penulis: "",
  nim: "",
  jenis-karya: "skripsi",
  program-studi: "",
  departemen: "",
  fakultas: "",
  tahun: "",
  body,
) = {
  // ── Kertas & Pias (Margin) ────────────────────────────────
  // A4: 21,0 cm × 29,7 cm  (PPKI Lampiran 16: Bahan dan Ukuran Kertas)
  // Pias dalam (inside) 4 cm, luar (outside) 3 cm — mirror/selang-seling
  // mengikuti sisi jilid. Atas 3 cm, bawah 3 cm (PPKI Lampiran 16 butir 2).
  set page(
    paper: "a4",
    margin: (
      inside: 4cm,
      outside: 3cm,
      top: 3cm,
      bottom: 3cm,
    ),
    binding: left,
    numbering: none,
  )

  // ── Jenis & Ukuran Huruf ─────────────────────────────────
  // Times New Roman 12pt (PPKI Lampiran 16 butir 1)
  set text(
    font: _font,
    size: _sz-body,
    lang: "id",
  )

  // Tampilan hasil komputer (kode, nama berkas, perintah) menggunakan
  // Courier New 11pt (PPKI Lampiran 16).
  show raw: set text(font: _font-mono, size: _sz-mono)

  // ── Paragraf ─────────────────────────────────────────────
  // • Jarak baris: 1 spasi (PPKI Lampiran 16 butir 5)
  // • Alinea pertama menjorok 1 cm dari batas kiri bidang tulisan (butir 6)
  // • Rata kanan-kiri / justified (butir 6)
  // • Tidak ada spasi ekstra antarparagraf
  set par(
    leading: _leading,
    spacing: _leading,
    first-line-indent: 1cm,
    justify: true,
  )

  // ── Penomoran Heading ─────────────────────────────────────
  // Level 1 (Bab)        → angka Romawi kapital, contoh: II
  // Level 2 (Subbab)     → angka Arab berpola 1.1, contoh: 2.1
  // Level 3 (Sub-subbab) → angka Arab berpola 1.1.1, contoh: 2.1.1
  // (PPKI Lampiran 16 butir 8 dan Lampiran 17)
  set heading(numbering: (..nums) => {
    let n = nums.pos()
    if n.len() == 1 {
      numbering("I", n.at(0))
    } else if n.len() == 2 {
      numbering("1.1", ..nums)
    } else if n.len() >= 3 {
      numbering("1.1.1", ..nums)
    }
  })

  // ── Tampilan Judul Bab (Level 1) ──────────────────────────
  // • Times New Roman 14pt, tebal (bold), huruf kapital semua
  // • Posisi: di tengah (centered)
  // • Setiap bab baru dimulai di halaman baru
  // • Jarak sebelum judul bab: before 6pt (PPKI aturan "spasi 1 dan before 6")
  // (PPKI Lampiran 16 butir 9 dan Lampiran 17)
  show heading.where(level: 1): it => {
    // Bab bernomor selalu mulai halaman baru; heading tanpa nomor (Daftar Tabel,
    // Daftar Gambar, Daftar Lampiran) mengalir ke halaman yang sama.
    if it.numbering != none { pagebreak(weak: true) }
    set par(first-line-indent: 0pt, spacing: 0pt, leading: _leading)
    v(if it.numbering != none { 6pt } else { 2 * _leading })
    align(
      center,
      text(font: _font, size: _sz-bab, weight: "bold")[
        #if it.numbering != none {
          context counter(heading).display("I")
          h(1em)
        }
        #upper(it.body)
      ],
    )
    v(_leading)
  }

  // ── Tampilan Judul Subbab (Level 2) ───────────────────────
  // • Times New Roman 12pt, tebal (bold), kapital tiap kata
  // • Posisi: kiri (left-aligned)
  // • 2 spasi dari konten di atas, 1 spasi dari konten di bawah
  // (PPKI Lampiran 16 butir 10)
  show heading.where(level: 2): it => {
    set par(first-line-indent: 0pt, spacing: 0pt, leading: _leading)
    v(2 * _leading)
    text(font: _font, size: _sz-body, weight: "bold")[
      #if it.numbering != none {
        context counter(heading).display("1.1")
        h(0.75em)
      }
      #it.body
    ]
    v(_leading)
  }

  // ── Tampilan Judul Sub-subbab (Level 3) ───────────────────
  // • Times New Roman 12pt, TIDAK tebal (regular), kapital tiap kata
  // • Posisi: kiri (left-aligned)
  // • 1,5 spasi dari konten di atas, 1 spasi dari konten di bawah
  // (PPKI Lampiran 16 butir 11)
  show heading.where(level: 3): it => {
    set par(first-line-indent: 0pt, spacing: 0pt, leading: _leading)
    v(1.5 * _leading)
    text(font: _font, size: _sz-body, weight: "regular")[
      #if it.numbering != none {
        context counter(heading).display("1.1.1")
        h(0.75em)
      }
      #it.body
    ]
    v(_leading)
  }

  // ── Tampilan Judul Sub-sub-subbab (Level 4) ───────────────
  // • Times New Roman 12pt, tidak tebal (regular)
  // • Hanya huruf PERTAMA judul yang kapital (bukan title case)
  // • Posisi: kiri (left-aligned)
  // • Tidak disarankan, hanya jika benar-benar diperlukan
  // (PPKI Lampiran 17: catatan "Pengebaban 4 tingkat tidak disarankan")
  show heading.where(level: 4): it => {
    set par(first-line-indent: 0pt, spacing: 0pt, leading: _leading)
    v(1.5 * _leading)
    text(font: _font, size: _sz-body, weight: "regular")[
      #if it.numbering != none {
        context counter(heading).display("1.1.1.1")
        h(0.75em)
      }
      #it.body
    ]
    v(_leading)
  }

  // ── Tabel ────────────────────────────────────────────────
  // • Caption/judul tabel di ATAS tabel (PPKI Bab VI butir 6.1)
  // • Hanya tiga garis horizontal; tidak ada garis vertikal
  // • Catatan kaki tabel: Times New Roman 10pt (PPKI 6.1.1d butir 7)
  show figure.where(kind: table): set figure(supplement: [Tabel])
  show figure.where(kind: image): set figure(supplement: [Gambar])
  //
  // Cara membuat tabel dengan format PPKI (contoh 3 garis horizontal):
  //   #figure(
  //     caption: [Judul tabel singkat],
  //     kind: table,
  //     table(
  //       columns: (auto, 1fr),
  //       table.hline(stroke: 0.75pt),       // ← garis atas
  //       [*Kolom 1*], [*Kolom 2*],
  //       table.hline(stroke: 0.75pt),       // ← garis bawah header
  //       [Data 1],    [Data 2],
  //       table.hline(stroke: 0.75pt),       // ← garis bawah tabel
  //     ),
  //   )
  show figure.where(kind: table): set figure.caption(position: top)
  set table(stroke: none) // garis diatur manual dengan table.hline()

  // ── Gambar ───────────────────────────────────────────────
  // • Caption/judul gambar di BAWAH gambar (PPKI Bab VI butir 6.2)
  show figure.where(kind: image): set figure.caption(position: bottom)

  // Caption satu baris → center; caption multi-baris → hanging indent kiri.
  show figure.caption: it => {
    set par(first-line-indent: 0pt)
    layout(size => context {
      let prefix = [#it.supplement #it.counter.display(it.numbering)]
      let full = [#prefix #it.body]
      if measure(full).width <= size.width {
        align(center, full)
      } else {
        set align(left)
        grid(
          columns: (auto, 1fr),
          column-gutter: 0.4em,
          align: top,
          prefix, it.body,
        )
      }
    })
  }

  // ── Mulai Konten ─────────────────────────────────────────
  body
}


// ─── Halaman Sampul ──────────────────────────────────────────

/// Membuat halaman sampul karya ilmiah.
/// Referensi: Lampiran 1b (skripsi), 1d (tesis), 1e (disertasi) PPKI.
///
/// Parameter:
///   judul         - Judul dalam HURUF KAPITAL, maks. 3 baris, ≤ 15 kata
///   nama          - Nama lengkap mahasiswa (nama akhir tidak disingkat)
///   nim           - NIM (ditampilkan di punggung sampul, bukan di muka)
///   program-studi - Nama program studi
///   departemen    - Nama departemen (boleh kosong)
///   fakultas      - Nama fakultas/sekolah
///   institusi     - Default: "INSTITUT PERTANIAN BOGOR"
///   kota          - Default: "BOGOR"
///   tahun         - Tahun lulus
///   logo          - Konten logo IPB (diameter 2,5 cm). Contoh:
///                    image("logo-ipb.png", height: 2.5cm)
///                   Jika dikosongkan, akan ditampilkan kotak placeholder.
///
/// Catatan: Halaman ini tidak memiliki nomor halaman.
/// Pengukuran vertikal berdasarkan Lampiran 1b PPKI:
///   ±5 cm dari atas kertas → judul
///   ±12 cm dari atas kertas → nama
///   ±18 cm dari atas kertas → logo
///   ±23,7 cm dari atas kertas → nama departemen/fakultas/institusi
#let halaman-sampul(
  judul: "",
  nama: "",
  nim: "",
  program-studi: "",
  departemen: "",
  fakultas: "",
  institusi: "INSTITUT PERTANIAN BOGOR",
  kota: "BOGOR",
  tahun: "",
  logo: none,
  judul-size: _sz-bab,
) = {
  set page(
    paper: "a4",
    margin: (left: 4cm, right: 3cm, top: 0pt, bottom: 0pt),
    numbering: none,
    header: none,
    footer: none,
  )
  set text(font: _font, size: _sz-bab)
  set par(leading: _leading, first-line-indent: 0pt, justify: false)
  set align(center)

  // ±5 cm dari atas kertas → judul
  v(5cm)

  // Judul: Times New Roman 14pt, kapital semua, spasi 1, center
  // (PPKI Lampiran 1b: "Times New Roman 14, kapital, maksimal 3 baris, spasi satu, posisi center")
  text(size: judul-size, weight: "bold")[#upper(judul)]

  // ±12 cm dari atas kertas → nama (jarak 7 cm dari posisi judul)
  v(5.5cm)

  // Nama: Times New Roman 14pt
  text(weight: "bold")[#nama]

  // ±18 cm dari atas kertas → logo (jarak 6 cm dari nama)
  v(5cm)

  // Logo IPB: diameter 2,5 cm (PPKI Lampiran 16: "Logo IPB sesuai Statuta berdiameter 2,5 cm")
  if logo != none {
    logo
  } else {
    // Placeholder bila logo tidak disediakan
    box(
      width: 2.5cm,
      height: 2.5cm,
      stroke: 0.5pt,
    )
  }

  // ±23,7 cm dari atas kertas → nama departemen/prodi/institusi (jarak 5,7 cm dari logo)
  v(3.5cm)

  // Program Studi, Departemen (jika ada), Fakultas, Institusi, Kota, Tahun
  // Times New Roman 14pt (PPKI Lampiran 1b)
  let dept-line = if departemen != "" { "\n" + upper(departemen) } else { "" }
  text(weight: "bold")[
    #(
      upper(program-studi)
        + dept-line
        + "\n"
        + upper(fakultas)
        + "\n"
        + upper(institusi)
        + "\n"
        + upper(kota)
        + "\n"
        + tahun
    )
  ]

  v(3cm)
}

/// Halaman Judul (white-paper copy of cover).
/// Referensi: PPKI 3.1.2 — "Halaman Judul merupakan salinan dari halaman sampul,
/// dicetak di kertas berwarna putih."
///
/// Parameter: sama dengan halaman-sampul (kecuali logo tidak ditampilkan)
#let halaman-judul(
  judul: "",
  nama: "",
  nim: "",
  program-studi: "",
  departemen: "",
  fakultas: "",
  institusi: "INSTITUT PERTANIAN BOGOR",
  kota: "BOGOR",
  tahun: "",
  judul-size: _sz-bab,
) = {
  pagebreak(weak: true)
  set page(
    paper: "a4",
    margin: (left: 4cm, right: 3cm, top: 0pt, bottom: 0pt),
    numbering: none,
    header: none,
    footer: none,
  )
  set text(font: _font, size: _sz-bab)
  set par(leading: _leading, first-line-indent: 0pt, justify: false)
  set align(center)

  v(5cm)
  text(size: judul-size, weight: "bold")[#upper(judul)]
  v(5.5cm)
  text(weight: "bold")[#nama]
  v(5cm)

  // No logo for white-paper copy

  v(3.5cm)

  let dept-line = if departemen != "" { "\n" + upper(departemen) } else { "" }
  text(weight: "bold")[
    #(
      upper(program-studi)
        + dept-line
        + "\n"
        + upper(fakultas)
        + "\n"
        + upper(institusi)
        + "\n"
        + upper(kota)
        + "\n"
        + tahun
    )
  ]

  v(3cm)
}

/// Halaman Judul Dalam — cetakan di kertas putih, berbeda dari sampul.
/// Referensi: Lampiran 7a (laporan akhir), 7b (skripsi), 7d (tesis), 7e (disertasi) PPKI.
///
/// Perbedaan dari halaman-sampul: tidak ada logo; ada kalimat syarat memperoleh gelar
/// di antara nama dan blok institusi.
///
/// Parameter:
///   judul         - Judul dalam HURUF KAPITAL
///   nama          - Nama lengkap mahasiswa
///   nim           - NIM (tidak ditampilkan di halaman ini, disimpan untuk konsistensi)
///   jenis-karya   - "laporan-akhir" | "skripsi" | "tesis" | "disertasi"
///   program-studi - Nama program studi
///   departemen    - Nama departemen (boleh kosong)
///   fakultas      - Nama fakultas/sekolah
///   institusi     - Default: "INSTITUT PERTANIAN BOGOR"
///   kota          - Default: "BOGOR"
///   tahun         - Tahun lulus
///   gelar         - Override gelar (mis. "Sarjana Komputer"). Jika kosong,
///                   ditentukan otomatis: laporan-akhir→"Ahli Madya",
///                   skripsi→"Sarjana", tesis→"Magister Sains", disertasi→"Doktor"
#let halaman-judul-dalam(
  judul: "",
  nama: "",
  nim: "",
  jenis-karya: "skripsi",
  program-studi: "",
  departemen: "",
  fakultas: "",
  institusi: "INSTITUT PERTANIAN BOGOR",
  kota: "BOGOR",
  tahun: "",
  gelar: "",
) = {
  pagebreak(weak: true)
  set page(
    paper: "a4",
    margin: (left: 4cm, right: 3cm, top: 0pt, bottom: 0pt),
    footer: none,
  )
  set text(font: _font, size: _sz-bab)
  set par(leading: _leading, first-line-indent: 0pt, justify: false)

  let _gelar = if gelar != "" { gelar } else if jenis-karya == "laporan-akhir" {
    "Ahli Madya"
  } else if jenis-karya == "tesis" {
    "Magister Sains"
  } else if jenis-karya == "disertasi" {
    "Doktor"
  } else {
    "Sarjana"
  }

  let _jenis-kapital = _jenis-karya-title(jenis-karya)

  // ── Judul dan Nama ─────────────────────────────────
  align(center)[
    #v(5cm)
    #text(weight: "bold")[#upper(judul)]
    #v(4.5cm)
    #text(weight: "bold")[#nama]
  ]

  // ── Kalimat syarat memperoleh gelar ────────────────
  align(center)[
    #v(2cm)
    #text(size: _sz-body)[
      #_jenis-kapital \
      sebagai salah satu syarat untuk memperoleh gelar \
      #_gelar pada \
      Program Studi #program-studi
    ]
  ]

  // ── Blok institusi (bawah halaman) ─────────────────
  let dept-line = if departemen != "" { "\n" + upper(departemen) } else { "" }
  place(
    bottom + center,
    dy: -3cm,
    text(weight: "bold", size: _sz-bab)[
      #(
        upper(program-studi)
          + dept-line
          + "\n"
          + upper(fakultas)
          + "\n"
          + upper(institusi)
          + "\n"
          + upper(kota)
          + "\n"
          + tahun
      )
    ],
  )
}


// ─── Halaman Hak Cipta ───────────────────────────────────────

/// Membuat halaman Hak Cipta.
/// Wajib untuk tesis dan disertasi; opsional untuk skripsi dan laporan akhir.
/// Referensi: Lampiran 6 PPKI.
///
/// Parameter:
///   tahun  - Tahun karya ilmiah
#let halaman-hak-cipta(tahun: "") = {
  pagebreak(weak: true)
  set par(first-line-indent: 1cm, leading: _leading, spacing: _leading, justify: true)
  set text(font: _font, size: _sz-body)

  v(1fr)

  align(center)[
    © Hak Cipta milik IPB, tahun #tahun \
    Hak Cipta dilindungi Undang-Undang
  ]

  v(_leading)

  [
    Dilarang mengutip sebagian atau seluruh karya tulis ini tanpa mencantumkan atau
    menyebutkan sumbernya. Pengutipan hanya untuk kepentingan pendidikan, penelitian,
    penulisan karya ilmiah, penyusunan laporan, penulisan kritik, atau tinjauan suatu
    masalah, dan pengutipan tersebut tidak merugikan kepentingan IPB.
  ]

  v(_leading)

  [
    Dilarang mengumumkan dan memperbanyak sebagian atau seluruh karya tulis ini
    dalam bentuk apa pun tanpa izin IPB.
  ]
}


// ─── Halaman Penguji Luar Komisi & Lembar Pengesahan ────────

/// Halaman penguji (tim penguji / penguji luar komisi). Diletakkan pada halaman
/// GENAP sehingga berhadapan dengan lembar pengesahan di halaman gasal berikutnya
/// pada cetak bolak-balik. (PPKI Lampiran 16 butir 4, Lampiran 8a-8d).
///
/// Panggil SEBELUM #lembar-pengesahan(...) agar urutannya benar:
///   halaman genap (penguji) di kiri, halaman gasal (pengesahan) di kanan.
///
/// Parameter:
///   penguji - Array nama penguji (satu atau lebih), mis. ("Dr A", "Dr B")
///   judul   - Judul/label halaman, mis.:
///               "Penguji pada ujian Laporan Akhir:"    (Lampiran 8a)
///               "Tim Penguji pada Ujian Skripsi:"      (Lampiran 8b)
///               "Tim Penguji pada Ujian Tesis:"        (Lampiran 8c)
///               "Penguji Luar Komisi Pembimbing pada Ujian Tertutup Disertasi:" (Lampiran 8d)
#let halaman-penguji(
  penguji: (),
  judul: "Tim Penguji pada Ujian Skripsi:",
  subtitle: "",
  subtitle2: "",
) = {
  pagebreak(to: "even", weak: true)
  set par(first-line-indent: 0pt, leading: _leading, spacing: _leading)
  set text(font: _font, size: _sz-body)

  v(1fr)

  [#judul]

  v(_leading)

  if subtitle != "" {
    v(_leading)
    [#subtitle]
    v(_leading)
  }

  for (i, p) in penguji.enumerate() {
    [#h(2.0em) #(i + 1) #h(0.5em) #p \ ]
  }

  if subtitle2 != "" {
    v(_leading)
    [#subtitle2]
  }
}

/// Lembar pengesahan. Dipaksa mulai pada halaman GASAL sehingga berhadapan
/// dengan halaman penguji luar komisi (halaman genap) pada cetak bolak-balik.
/// (PPKI Lampiran 16 butir 4, Lampiran 9a-9e).
///
/// Parameter:
///   judul          - Judul karya ilmiah
///   nama           - Nama penulis
///   nim            - NIM
///   jenis-karya    - "skripsi" | "tesis" | "disertasi" | "laporan akhir"
///   program-studi
///   pembimbing     - Array nama pembimbing, mis. ("Dr A", "Dr B")
///   pembimbing-nip - Array NIP pembimbing, paralel dengan `pembimbing` (opsional)
///   ketua          - Nama ketua departemen/program studi yang menandatangani
///   ketua-label    - Label jabatan ketua, mis.:
///                      "Ketua Program Studi:"           (default untuk skripsi)
///                      "Ketua Departemen Ilmu Komputer:"
///   ketua-nip      - NIP ketua (opsional)
///   dekan          - Nama penanda tangan alternatif (opsional). Jika diisi, ditampilkan
///                    sebagai pilihan kedua dengan prefiks italic "Atau (pilih salah satu)".
///   dekan-label    - Label jabatan alternatif (default: "Ketua Departemen .....:")
///   dekan-nip      - NIP alternatif (opsional)
///   tanggal-ujian
///   tanggal-lulus
#let lembar-pengesahan(
  judul: "",
  nama: "",
  nim: "",
  jenis-karya: "skripsi",
  program-studi: "",
  pembimbing: (),
  pembimbing-nip: (),
  ketua: "",
  ketua-label: "Ketua Program Studi:",
  ketua-nip: "",
  dekan: "",
  dekan-label: "Ketua Departemen .....:",
  dekan-nip: "",
  tanggal-ujian: "",
  tanggal-lulus: "",
) = {
  pagebreak(to: "odd", weak: true)
  set par(first-line-indent: 0pt, leading: _leading, spacing: _leading, justify: false)
  set text(font: _font, size: _sz-body)

  let _jenis-label = _jenis-karya-title(jenis-karya)

  // Blok info: label rata kiri dengan titik dua sejajar, isi menyambung
  grid(
    columns: (auto, 1em, 1fr),
    row-gutter: 0.4em,
    [Judul #_jenis-label], [ : ], [#judul],
    [Nama], [ : ], [#nama],
    [NIM], [ : ], [#nim],
  )

  v(1.5em)

  // Garis tanda tangan, rata kanan-bawah dalam sel
  let _sig = align(right + bottom, line(length: 6cm, stroke: 0.75pt))

  // Blok identitas penanda tangan: label, lalu nama (dan NIP) menjorok 1 em.
  // `prefix` opsional ditampilkan miring di atas label (mis. "Atau (pilih salah satu)").
  let _person(label, name, nip, prefix: none) = {
    set par(first-line-indent: 0pt)
    if prefix != none [#emph(prefix) \ ]
    [#label \ #h(1em)#name]
    if nip != "" [ \ #h(1em)NIP #nip]
  }

  // ── Disetujui oleh ──
  align(center)[Disetujui oleh]
  v(0.3em)

  let pembimbing-rows = ()
  for (i, p) in pembimbing.enumerate() {
    let label = if pembimbing.len() > 1 [Pembimbing #(i + 1):] else [Pembimbing:]
    let nip = if i < pembimbing-nip.len() { pembimbing-nip.at(i) } else { "" }
    pembimbing-rows.push(_person(label, p, nip))
    pembimbing-rows.push(_sig)
  }

  table(
    columns: (1fr, 7cm),
    align: (left + top, right + bottom),
    stroke: 0pt,
    inset: (x: 0.6em, y: 0.8em),
    ..pembimbing-rows,
  )

  v(1.5em)

  // ── Diketahui oleh ──
  align(center)[Diketahui oleh]
  v(0.3em)

  let diketahui-rows = (
    _person([#ketua-label], ketua, ketua-nip),
    _sig,
  )
  if dekan != "" {
    diketahui-rows.push(_person(
      [#dekan-label],
      dekan,
      dekan-nip,
      prefix: "Atau (pilih salah satu)",
    ))
    diketahui-rows.push(_sig)
  }

  table(
    columns: (1fr, 7cm),
    align: (left + top, right + bottom),
    stroke: 0pt,
    inset: (x: 0.6em, y: 0.8em),
    ..diketahui-rows,
  )

  // ── Tanggal Ujian / Tanggal Lulus, didorong ke bawah halaman ──
  v(1fr)

  table(
    columns: (1fr, 1fr),
    align: left + top,
    stroke: 0pt,
    inset: (x: 0.6em, y: 0.5em),
    [Tanggal Ujian: \ #tanggal-ujian], [Tanggal Lulus: \ #tanggal-lulus],
  )
}


// ─── Paragraf Bertingkat ─────────────────────────────────────

/// Membungkus konten sebagai paragraf bertingkat yang menjorok 0,5 cm
/// dari paragraf di atasnya (PPKI Lampiran 16 butir 7). Dapat disarangkan;
/// setiap tingkat menambah indentasi 0,5 cm dari tingkat sebelumnya.
///
/// Contoh:
///   Paragraf utama di sini.
///   #bertingkat[
///     Paragraf tingkat 1 (menjorok 0,5 cm).
///     #bertingkat[
///       Paragraf tingkat 2 (menjorok 1 cm total).
///     ]
///   ]
#let bertingkat(body) = pad(left: 0.5cm, body)


// ─── Prakata ─────────────────────────────────────────────────

/// Membuat halaman Prakata (halaman baru, tanpa nomor bab, masuk Daftar Isi).
/// Referensi: Lampiran 10 PPKI.
///
/// Contoh:
///   #prakata[
///     Puji dan syukur penulis panjatkan kepada Allah … sehingga karya ilmiah ini
///     berhasil diselesaikan. …
///
///     Bogor, Januari 2024
///
///     Penulis
///   ]
#let prakata(isi) = {
  pagebreak(weak: true)
  set par(first-line-indent: 0pt, leading: _leading, spacing: _leading, justify: true)
  set text(font: _font, size: _sz-body)

  heading(level: 1, numbering: none, outlined: false)[PRAKATA]
  counter(heading).update((ch, ..rest) => (calc.max(0, ch - 1),))

  v(_leading)
  set par(first-line-indent: 1cm, leading: _leading, spacing: _leading, justify: true)
  isi
}


// ─── Halaman Pernyataan dan Pelimpahan Hak Cipta ─────────────

/// Membuat halaman pernyataan keaslian dan pelimpahan hak cipta.
/// Referensi: Lampiran 3 PPKI.
///
/// Parameter:
///   nama        - Nama lengkap penulis
///   nim         - Nomor Induk Mahasiswa
///   judul       - Judul karya ilmiah (tanpa tanda petik)
///   jenis-karya - "laporan akhir" | "skripsi" | "tesis" | "disertasi"
///   tanggal     - Tempat dan tanggal tanda tangan, mis. "Bogor, Januari 2024"
#let halaman-pernyataan(
  nama: "",
  nim: "",
  judul: "",
  jenis-karya: "skripsi",
  tanggal: "",
) = {
  pagebreak(weak: true)
  set par(first-line-indent: 1cm, justify: true, leading: _leading, spacing: _leading)
  set text(font: _font, size: _sz-body)

  let _jenis-lower = _jenis-karya-lower(jenis-karya)

  {
    set par(first-line-indent: 0pt)
    align(center)[
      *#upper("PERNYATAAN MENGENAI " + _jenis-lower + linebreak() + " DAN SUMBER INFORMASI")*
      *#upper("SERTA PELIMPAHAN HAK CIPTA")*
    ]
  }

  v(1em)

  [
    Dengan ini saya menyatakan bahwa #_jenis-lower dengan judul
    "#judul" adalah karya saya dengan arahan dari dosen pembimbing dan belum
    diajukan dalam bentuk apa pun kepada perguruan tinggi mana pun. Sumber
    informasi yang berasal atau dikutip dari karya yang diterbitkan maupun
    tidak diterbitkan dari penulis lain telah disebutkan dalam teks dan
    dicantumkan dalam Daftar Pustaka di bagian akhir #_jenis-lower ini.
  ]

  v(_leading)

  [
    Dengan ini saya melimpahkan hak cipta dari karya tulis saya kepada
    Institut Pertanian Bogor.
  ]

  v(2em)

  align(right)[
    #tanggal
    #v(3em)
    #nama \
    NIM #nim
  ]
}


// ─── Halaman Abstrak (Indonesia) ─────────────────────────────

/// Membuat halaman Abstrak (bahasa Indonesia) untuk skripsi.
/// Referensi: Lampiran 4a dan 4b PPKI.
///
/// Parameter:
///   nama        - Nama mahasiswa ditulis KAPITAL
///   judul       - Judul karya ilmiah (bahasa Indonesia)
///   pembimbing  - Array nama pembimbing, mis. ("Ali", "Budi")
///   isi         - Narasi abstrak (maks. 200 kata, 1 paragraf)
///   kata-kunci  - Kata kunci dipisah koma, terurut abjad, maks. 5
///
/// Catatan: Ditulis 1 spasi, tidak ada before dan after (PPKI Lampiran 4b).
/// Halaman ini diberi nomor i tetapi nomor tidak dicetak.
#let abstrak(
  nama: "",
  judul: "",
  pembimbing: (),
  isi: [],
  kata-kunci: "",
) = {
  pagebreak(weak: true)
  set page(header: none)
  set par(
    leading: _leading,
    spacing: _leading,
    first-line-indent: 1cm,
    justify: true,
  )
  set text(font: _font, size: _sz-body)

  heading(level: 1, numbering: none, outlined: false)[ABSTRAK]
  counter(heading).update((ch, ..rest) => (calc.max(0, ch - 1),))

  v(0.5em)

  // Format nama pembimbing: dipisah "dan" jika lebih dari satu
  let db = if pembimbing.len() == 0 {
    ""
  } else if pembimbing.len() == 1 {
    upper(pembimbing.at(0))
  } else {
    pembimbing.slice(0, -1).map(upper).join(", ") + ", dan " + upper(pembimbing.last())
  }

  // Header abstrak: NAMA. Judul. Dibimbing oleh PEMBIMBING.
  [*#upper(nama).* #judul. Dibimbing oleh #db.]

  v(_leading)

  isi

  v(_leading)

  {
    set par(first-line-indent: 0pt)
    [Kata kunci: #kata-kunci]
  }
}


// ─── Halaman Abstract (Inggris) ──────────────────────────────

/// Membuat halaman Abstract (bahasa Inggris) untuk skripsi.
/// Referensi: Lampiran 4a dan 4b PPKI.
///
/// Parameter:
///   nama        - Nama mahasiswa ditulis CAPITAL
///   judul       - Judul karya ilmiah (bahasa Inggris)
///   pembimbing  - Array nama pembimbing, mis. ("Ali", "Budi")
///   isi         - Narasi abstrak (maks. 200 kata, 1 paragraf)
///   keywords    - Keywords dipisah koma, alphabetical order, maks. 5
#let abstract-en(
  nama: "",
  judul: "",
  pembimbing: (),
  isi: [],
  keywords: "",
) = {
  set page(header: none)
  set par(
    leading: _leading,
    spacing: _leading,
    first-line-indent: 1cm,
    justify: true,
  )
  set text(font: _font, size: _sz-body)

  heading(level: 1, numbering: none, outlined: false)[ABSTRACT]
  counter(heading).update((ch, ..rest) => (calc.max(0, ch - 1),))

  v(0.5em)

  let sv = if pembimbing.len() == 0 {
    ""
  } else if pembimbing.len() == 1 {
    upper(pembimbing.at(0))
  } else {
    pembimbing.slice(0, -1).map(upper).join(", ") + ", and " + upper(pembimbing.last())
  }

  [*#upper(nama).* #judul. Supervised by #sv.]

  v(_leading)

  isi

  v(_leading)

  {
    set par(first-line-indent: 0pt)
    [_Keywords:_ #keywords]
  }
}


// ─── Ringkasan dan Summary (Tesis / Disertasi) ───────────────

/// Membuat halaman Ringkasan (bahasa Indonesia) untuk tesis/disertasi.
/// Tidak lebih dari 2 halaman, ditulis 1 spasi dalam beberapa paragraf.
/// Referensi: Lampiran 5c dan 5d PPKI.
///
/// Parameter sama dengan abstrak().
#let ringkasan(
  nama: "",
  judul: "",
  pembimbing: (),
  isi: [],
  kata-kunci: "",
) = {
  pagebreak(weak: true)
  set par(leading: _leading, spacing: _leading, first-line-indent: 0pt, justify: true)
  set text(font: _font, size: _sz-body)

  align(center)[*RINGKASAN*]

  v(0.5em)

  let db = if pembimbing.len() == 0 {
    ""
  } else if pembimbing.len() == 1 {
    upper(pembimbing.at(0))
  } else {
    pembimbing.slice(0, -1).map(upper).join(", ") + ", dan " + upper(pembimbing.last())
  }

  [*#upper(nama).* #judul. Dibimbing oleh #db.]

  v(_leading)
  isi
  v(_leading)

  [*Kata kunci:* #kata-kunci]
}

/// Membuat halaman Summary (bahasa Inggris) untuk tesis/disertasi.
/// Tidak lebih dari 2 halaman, ditulis 1 spasi dalam beberapa paragraf.
/// Referensi: Lampiran 5e PPKI.
#let summary(
  nama: "",
  judul: "",
  pembimbing: (),
  isi: [],
  keywords: "",
) = {
  pagebreak(weak: true)
  set par(leading: _leading, spacing: _leading, first-line-indent: 0pt, justify: true)
  set text(font: _font, size: _sz-body)

  align(center)[*SUMMARY*]

  v(0.5em)

  let sv = if pembimbing.len() == 0 {
    ""
  } else if pembimbing.len() == 1 {
    upper(pembimbing.at(0))
  } else {
    pembimbing.slice(0, -1).map(upper).join(", ") + ", and " + upper(pembimbing.last())
  }

  [*#upper(nama).* #judul. Supervised by #sv.]

  v(_leading)
  isi
  v(_leading)

  [*Keywords:* #keywords]
}


// ─── Daftar Isi, Daftar Tabel, Daftar Gambar ─────────────────

/// Membuat halaman Daftar Isi otomatis (berdasarkan heading dalam naskah).
/// Referensi: Lampiran 11 PPKI.
///
/// Spasi yang diterapkan (PPKI Lampiran 11):
///   • Setelah judul DAFTAR ISI: 2 spasi
///   • Sebelum setiap entri bab (level 1): before 6pt
#let daftar-isi() = {
  pagebreak(weak: true)
  set par(first-line-indent: 0pt, leading: _leading, spacing: _leading)
  align(center)[
    #text(font: _font, size: _sz-bab, weight: "bold")[DAFTAR ISI]
  ]
  v(2 * _leading)
  // Tambah before 6pt sebelum setiap entri bab (level 1)
  show outline.entry.where(level: 1): it => {
    v(6pt, weak: true)
    it
  }
  outline(
    title: none,
    indent: 1cm,
  )
}

/// Membuat halaman Daftar Tabel otomatis.
/// Tampilkan jika jumlah tabel > 1 (PPKI Bab III 3.1.12).
///
/// Format entri: "1  Judul Tabel 1 ...... xx" (tanpa kata "Tabel" — PPKI Lampiran 12)
#let daftar-tabel() = {
  pagebreak()
  set par(first-line-indent: 0pt, leading: _leading, spacing: _leading)
  heading(level: 1, numbering: none, outlined: true)[DAFTAR TABEL]
  counter(heading).update((ch, ..rest) => (calc.max(0, ch - 1),))
  // Tampilkan hanya nomor urut (tanpa kata "Tabel") sesuai Lampiran 12
  show outline.entry: it => {
    let fig = it.element
    layout(size => context {
      let num = counter(figure.where(kind: table)).at(fig.location()).first()
      let prefix = [#num #h(0.5em)]
      let indent = measure(prefix).width
      grid(
        columns: (indent, 1fr, auto),
        gutter: 0.25em,
        prefix,
        [#set par(hanging-indent: 0pt); #link(fig.location())[#fig.caption.body] #box(width: 1fr, it.fill)],
        align(bottom)[#link(fig.location())[#context counter(page).at(fig.location()).first()]],
      )
    })
  }
  outline(
    title: none,
    target: figure.where(kind: table),
  )
}

/// Membuat halaman Daftar Gambar otomatis.
/// Tampilkan jika jumlah gambar > 1 (PPKI Bab III 3.1.12).
///
/// Format entri: "1  Judul Gambar 1 ...... xx" (tanpa kata "Gambar" — PPKI Lampiran 12)
#let daftar-gambar() = {
  set par(first-line-indent: 0pt, leading: _leading, spacing: _leading)
  heading(level: 1, numbering: none, outlined: true)[DAFTAR GAMBAR]
  counter(heading).update((ch, ..rest) => (calc.max(0, ch - 1),))
  // Tampilkan hanya nomor urut (tanpa kata "Gambar") sesuai Lampiran 12
  show outline.entry: it => {
    let fig = it.element
    layout(size => context {
      let num = counter(figure.where(kind: image)).at(fig.location()).first()
      let prefix = [#num #h(0.5em)]
      let indent = measure(prefix).width
      grid(
        columns: (indent, 1fr, auto),
        gutter: 0.25em,
        prefix,
        [#set par(hanging-indent: 0pt); #link(fig.location())[#fig.caption.body] #box(width: 1fr, it.fill)],
        align(bottom)[#link(fig.location())[#context counter(page).at(fig.location()).first()]],
      )
    })
  }
  outline(
    title: none,
    target: figure.where(kind: image),
  )
}

/// Membuat halaman Daftar Lampiran otomatis (opsional).
#let daftar-lampiran() = {
  set par(first-line-indent: 0pt, leading: _leading, spacing: _leading)
  heading(level: 1, numbering: none, outlined: true)[DAFTAR LAMPIRAN]
  counter(heading).update((ch, ..rest) => (calc.max(0, ch - 1),))
  // Tampilkan hanya nomor urut (tanpa kata "Lampiran")
  show outline.entry: it => {
    let fig = it.element
    layout(size => context {
      let num = counter(figure.where(kind: "lampiran")).at(fig.location()).first()
      let prefix = [#num #h(0.5em)]
      let indent = measure(prefix).width
      grid(
        columns: (indent, 1fr, auto),
        gutter: 0.25em,
        prefix,
        [#set par(hanging-indent: 0pt); #link(fig.location())[#fig.caption.body] #box(width: 1fr, it.fill)],
        align(bottom)[#link(fig.location())[#context counter(page).at(fig.location()).first()]],
      )
    })
  }
  // Lampiran dibuat sebagai figure dengan kind: "lampiran"
  outline(
    title: none,
    target: figure.where(kind: "lampiran"),
  )
}


// ─── Daftar Pustaka ───────────────────────────────────────────

/// Membuat halaman Daftar Pustaka (halaman baru, tanpa nomor bab).
/// Masuk dalam Daftar Isi.
///
/// Aturan penulisan daftar pustaka (PPKI Bab VII):
///   • Nama penulis dibalik (nama belakang dahulu): Satria A.
///   • Urutan: Penulis. Tahun. Judul. Kota: Penerbit.
///   • Format "hanging indent" 1 cm (baris pertama rata kiri, baris selanjutnya
///     menjorok ke dalam)
///
/// Parameter:
///   bibfile - Path ke file .bib (mis. "reference.bib")
///   style   - Path ke file .csl atau nama style bawaan (mis. "ipb.csl")
///
/// Contoh:
///   #daftar-pustaka("reference.bib", style: "ipb.csl")

// Penulisan daftar pustaka manual
// #let daftar-pustaka(isi) = {
//   pagebreak(weak: true)
//   // Heading level 1 tanpa nomor bab, tetap masuk outline (Daftar Isi)
//   heading(level: 1, numbering: none, outlined: true)[DAFTAR PUSTAKA]
//   // Reset counter agar bab berikutnya tidak terganggu
//   counter(heading).update((ch, ..rest) => (calc.max(0, ch - 1),))
//   set par(
//     first-line-indent: 0pt,
//     hanging-indent:    1cm,    // setiap entri: baris kedua dst. menjorok 1 cm
//     leading:           _leading,
//     spacing:           _leading,
//     justify:           true,
//   )
//   isi
// }

// Penulisan daftar pustaka dengan BetterBibTex
#let daftar-pustaka(bibfile, style: "ipb.csl") = {
  pagebreak(weak: true)
  // Heading level 1 tanpa nomor bab, tetap masuk outline (Daftar Isi)
  heading(level: 1, numbering: none, outlined: true)[DAFTAR PUSTAKA]
  // Reset counter agar bab berikutnya tidak terganggu
  counter(heading).update((ch, ..rest) => (calc.max(0, ch - 1),))
  set par(
    first-line-indent: 0pt,
    hanging-indent: 1cm, // setiap entri: baris kedua dst. menjorok 1 cm
    leading: _leading,
    spacing: _leading,
    justify: true,
  )
  bibliography(bibfile, title: none, style: style)
}


// ─── Lampiran ─────────────────────────────────────────────────

/// Membuat halaman Lampiran (halaman baru, tanpa nomor bab).
/// Masuk dalam Daftar Isi.
///
/// Untuk membuat lampiran bernomor, gunakan figure dengan kind: "lampiran":
///   #figure(
///     kind:      "lampiran",
///     supplement: [Lampiran],
///     caption:   [Judul Lampiran 1],
///   )[ konten lampiran ]
#let lampiran(isi) = {
  pagebreak(weak: true)
  heading(level: 1, numbering: none, outlined: true)[LAMPIRAN]
  counter(heading).update((ch, ..rest) => (calc.max(0, ch - 1),))
  set par(leading: _leading, spacing: _leading, justify: true)
  isi
}


// ─── Riwayat Hidup ────────────────────────────────────────────

/// Membuat halaman Riwayat Hidup (halaman baru, maks. 1 halaman).
/// Tidak masuk dalam Daftar Isi (outlined: false).
/// Referensi: Lampiran 14a (laporan akhir/skripsi) dan 14b (tesis/disertasi) PPKI.
///
/// Contoh:
///   #riwayat-hidup[
///     Penulis dilahirkan di Bogor pada tanggal 1 Januari 2000 sebagai
///     anak pertama dari pasangan Bapak X dan Ibu Y. …
///   ]
#let riwayat-hidup(isi) = {
  pagebreak(weak: true)
  align(center)[
    #text(font: _font, size: _sz-bab, weight: "bold")[RIWAYAT HIDUP]
  ]
  v(_leading)
  set par(leading: _leading, spacing: _leading, first-line-indent: 1cm, justify: true)
  isi
}


// ─── Catatan Penggunaan Tambahan ──────────────────────────────
//
// KUTIPAN DALAM TEKS (PPKI Bab VII)
// ----------------------------------
// Kutipan singkat (≤ 3 baris): langsung di dalam teks
//   "… merantau bagi orang Minangkabau …" (Naim 1984:284).
//
// Kutipan panjang (blok): huruf lebih kecil, dipisak dari teks
//   #block(
//     inset: (left: 1cm, right: 1cm),
//   )[
//     #set text(size: 10pt)
//     Teks kutipan panjang …
//   ]
//
// PENOMORAN DALAM SUBBAB (PPKI Lampiran 16 butir 8)
// --------------------------------------------------
// Jika ada rincian di dalam subbab, gunakan huruf: a, b, c
//   a) Poin pertama
//   b) Poin kedua
//
// Paragraf bertingkat (indentasi bertambah 0,5 cm dari paragraf di atasnya):
//   #pad(left: 0.5cm)[
//     Paragraf bertingkat …
//   ]
//
// UKURAN HURUF CATATAN KAKI TABEL (PPKI 6.1.1d butir 7)
// -------------------------------------------------------
// Times New Roman 10pt atau Arial 9pt:
//   #set text(size: 10pt) [Keterangan: xxx]
