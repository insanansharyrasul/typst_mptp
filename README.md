# format_ppki.typ

Template [Typst](https://typst.app) untuk penulisan karya ilmiah tugas akhir mahasiswa IPB, sesuai **Pedoman Penulisan Karya Ilmiah (PPKI) Edisi ke-4** (IPB Press, Desember 2019).

---

## Prasyarat

- [Typst](https://typst.app) versi 0.11 ke atas 
  - Project ini dibuat berdasarkan versi `typst 0.15.0 (3ae52774)` 
  - Tinymist yang digunakan versi `0.15.2`
  - *Last update: 2026-06-27*
- Font **Times New Roman** (dibutuhkan oleh PPKI)
  ```bash
  # Ubuntu / Debian
  sudo apt install msttcorefonts
  ```

---

## Cara Penggunaan

### 1. Salin template ke direktori proyek

```
proyek-skripsi/
├── lib/
│   ├── format_ppki.typ   ← salin file ini
│   └── ipb.csl           ← salin file ini
├── assets/               ← untuk gambar/logo
├── reference/
│   └── reference.bib     ← data referensi
└── main.typ              ← file utama Anda
```

### 2. Impor di file utama

```typst
#import "lib/format_ppki.typ": *
```

### 3. Aktifkan format PPKI

```typst
#show: ppki.with(
  judul:         "Judul Karya Ilmiah Anda",
  nama-penulis:  "Nama Lengkap Penulis",
  nim:           "NXXXXXXXXX",
  jenis-karya:   "skripsi",          // "laporan-akhir" | "skripsi" | "tesis" | "disertasi"
  program-studi: "Nama Program Studi",
  departemen:    "Nama Departemen",  // kosongkan ("") jika tidak ada
  fakultas:      "Nama Fakultas",
  tahun:         "2024",
)
```

---

## Struktur Dokumen

Dokumen PPKI terdiri atas dua bagian utama dengan sistem penomoran halaman berbeda:

```
Bagian Awal  → nomor halaman Romawi kecil: i, ii, iii, …
Bagian Isi   → nomor halaman Arab: 1, 2, 3, …
```

### Urutan Halaman Bagian Awal (PPKI Bab III)

| Urutan | Halaman                        | Fungsi                       |
| ------ | ------------------------------ | ---------------------------- |
| 1      | Halaman sampul                 | `#halaman-sampul(...)`       |
| 2      | Pernyataan keaslian            | `#halaman-pernyataan(...)`   |
| 3      | Abstrak (Indonesia)            | `#abstrak(...)`              |
| 4      | Abstract (Inggris)             | `#abstract-en(...)`          |
| 5      | Halaman hak cipta              | `#halaman-hak-cipta(...)`    |
| 6      | Halaman judul dalam            | `#halaman-judul-dalam(...)`  |
| 7      | Halaman penguji                | `#halaman-penguji(...)`      |
| 8      | Lembar pengesahan              | `#lembar-pengesahan(...)`    |
| 9      | Prakata                        | `#prakata[...]`              |
| 10     | Daftar isi                     | `#daftar-isi()`              |
| 11     | Daftar tabel (jika tabel > 1)  | `#daftar-tabel()`            |
| 12     | Daftar gambar (jika gambar > 1)| `#daftar-gambar()`           |
| 13     | Daftar lampiran (jika ada)     | `#daftar-lampiran()`         |

### Contoh Lengkap

```typst
#import "lib/format_ppki.typ": *

#show: ppki.with(
  judul:         "Pengaruh Pupuk Organik terhadap Pertumbuhan Padi",
  nama-penulis:  "Budi Santoso",
  nim:           "A1234567",
  jenis-karya:   "skripsi",
  program-studi: "Agronomi dan Hortikultura",
  departemen:    "Agronomi dan Hortikultura",
  fakultas:      "Fakultas Pertanian",
  tahun:         "2024",
)

// ── BAGIAN AWAL ──────────────────────────────────────────────
#show: bagian-awal

#halaman-sampul(
  judul:         "PENGARUH PUPUK ORGANIK TERHADAP PERTUMBUHAN PADI",
  nama:          "BUDI SANTOSO",
  nim:           "A1234567",
  program-studi: "AGRONOMI DAN HORTIKULTURA",
  departemen:    "AGRONOMI DAN HORTIKULTURA",
  fakultas:      "Fakultas Pertanian",
  tahun:         "2024",
  logo:          image("assets/logo-ipb.png", width: 2.5cm),
)

#halaman-pernyataan(
  nama:        "BUDI SANTOSO",
  nim:         "A1234567",
  judul:       "Pengaruh Pupuk Organik terhadap Pertumbuhan Padi",
  jenis-karya: "skripsi",
  tanggal:     "Bogor, Januari 2024",
)

#abstrak(
  nama:       "BUDI SANTOSO",
  judul:      "Pengaruh Pupuk Organik terhadap Pertumbuhan Padi",
  pembimbing: ("Ahmad Rifai", "Siti Maryam"),
  isi:        [Narasi abstrak maks. 200 kata, satu paragraf. Memuat latar
               belakang, tujuan, metode, hasil, dan implikasi.],
  kata-kunci: "kata1, kata2, kata3",  // maks. 5, terurut abjad
)

#abstract-en(
  nama:       "BUDI SANTOSO",
  judul:      "Effect of Organic Fertilizer on Rice Growth",
  pembimbing: ("Ahmad Rifai", "Siti Maryam"),
  isi:        [Abstract narrative, max 200 words, one paragraph.],
  keywords:   "keyword1, keyword2, keyword3",
)

#halaman-hak-cipta(tahun: "2024")

#halaman-judul-dalam(
  judul:         "Pengaruh Pupuk Organik terhadap Pertumbuhan Padi",
  nama:          "BUDI SANTOSO",
  nim:           "A1234567",
  jenis-karya:   "skripsi",
  program-studi: "AGRONOMI DAN HORTIKULTURA",
  departemen:    "AGRONOMI DAN HORTIKULTURA",
  fakultas:      "Fakultas Pertanian",
  tahun:         "2024",
)

#halaman-penguji(
  penguji: ("Dr. Nama Penguji, M.Si.", "Dr. Nama Penguji 2, M.Si."),
  judul:   "Tim Penguji pada Ujian Skripsi:",
)

#lembar-pengesahan(
  judul:         "Pengaruh Pupuk Organik terhadap Pertumbuhan Padi",
  nama:          "Budi Santoso",
  nim:           "A1234567",
  jenis-karya:   "skripsi",
  program-studi: "Agronomi dan Hortikultura",
  pembimbing:    ("Dr. Ahmad Rifai, M.Si.", "Dr. Siti Maryam, M.Sc."),
  ketua:         "Prof. Dr. Ketua Program Studi, M.Si.",
  ketua-label:   "Ketua Program Studi Agronomi dan Hortikultura:",
  tanggal-ujian: "1 Januari 2024",
  tanggal-lulus: "15 Januari 2024",
)

#prakata[
  Puji dan syukur penulis panjatkan kepada Allah subhanaahu wa ta'ala atas segala
  karunia-Nya sehingga karya ilmiah ini berhasil diselesaikan. …

  #v(1em)
  #align(right)[
    Bogor, Januari 2024
    #v(2em)
    _Budi Santoso_
  ]
]

#daftar-isi()
#daftar-tabel()    // hapus jika tabel ≤ 1
#daftar-gambar()   // hapus jika gambar ≤ 1
#daftar-lampiran() // hapus jika tidak ada lampiran

// ── BAGIAN ISI ───────────────────────────────────────────────
#show: bagian-isi

= PENDAHULUAN

== Latar Belakang

Paragraf pertama dimulai di sini …

== Rumusan Masalah

...

== Tujuan Penelitian

...

= TINJAUAN PUSTAKA

...

= METODE

== Waktu dan Tempat

...

= HASIL DAN PEMBAHASAN

== Hasil

...

== Pembahasan

...

= SIMPULAN DAN SARAN

== Simpulan

...

== Saran

...

#daftar-pustaka("reference/reference.bib", style: "ipb.csl")

#lampiran[
  // Konten lampiran di sini
]

#riwayat-hidup[
  Penulis dilahirkan di Bogor pada tanggal 1 Januari 2000 sebagai
  anak pertama dari pasangan Bapak Ahmad dan Ibu Sari. …
]
```

---

## Referensi Fungsi

### Halaman Khusus

| Fungsi                         | Keterangan                      | Ref. PPKI        |
| ------------------------------ | ------------------------------- | ---------------- |
| `#halaman-sampul(...)`         | Halaman sampul                  | Lampiran 1b–1e   |
| `#halaman-pernyataan(...)`     | Pernyataan keaslian & hak cipta | Lampiran 3       |
| `#abstrak(...)`                | Abstrak bahasa Indonesia        | Lampiran 4a–4b   |
| `#abstract-en(...)`            | Abstract bahasa Inggris         | Lampiran 4a–4b   |
| `#ringkasan(...)`              | Ringkasan tesis/disertasi       | Lampiran 5c–5d   |
| `#summary(...)`                | Summary bahasa Inggris          | Lampiran 5e      |
| `#halaman-hak-cipta(...)`      | Halaman hak cipta               | Lampiran 6       |
| `#halaman-judul-dalam(...)`    | Halaman judul dalam             | Lampiran 7a–7e   |
| `#halaman-penguji(...)`        | Tim penguji / penguji luar      | Lampiran 8a–8d   |
| `#lembar-pengesahan(...)`      | Lembar pengesahan               | Lampiran 9a–9e   |
| `#prakata[...]`                | Prakata                         | Lampiran 10      |
| `#daftar-isi()`                | Daftar isi otomatis             | Lampiran 11      |
| `#daftar-tabel()`              | Daftar tabel otomatis           | Lampiran 12      |
| `#daftar-gambar()`             | Daftar gambar otomatis          | Lampiran 12      |
| `#daftar-lampiran()`           | Daftar lampiran otomatis        | Lampiran 12      |
| `#daftar-pustaka(...)`         | Daftar pustaka                  | Bab VII          |
| `#lampiran[...]`               | Halaman lampiran                | Bab III 3.3.1    |
| `#riwayat-hidup[...]`          | Riwayat hidup                   | Lampiran 14a–14b |

### Penomoran Halaman

| Fungsi               | Hasil                                                    |
| -------------------- | -------------------------------------------------------- |
| `#show: bagian-awal` | Nomor halaman Romawi: i, ii, iii, … (mulai ulang dari i) |
| `#show: bagian-isi`  | Nomor halaman Arab: 1, 2, 3, … (mulai ulang dari 1)      |

### Utilitas

| Fungsi              | Keterangan                                             |
| ------------------- | ------------------------------------------------------ |
| `#bertingkat[...]`  | Paragraf bertingkat dengan indentasi +0,5 cm           |

---

## Daftar Pustaka dan Sitasi

Template ini menggunakan Typst's built-in `bibliography()` dengan file BibTeX (`.bib`) dan format sitasi CSL (`.csl`).

### Struktur file

```
proyek-skripsi/
├── lib/
│   ├── format_ppki.typ
│   └── ipb.csl           ← gaya sitasi IPB
├── assets/
├── reference/
│   └── reference.bib     ← data referensi
└── main.typ
```

### Menambahkan referensi ke `reference.bib`

File `.bib` menggunakan format BibTeX. Contoh entri:

```bibtex
@book{satria2015,
  author    = {Satria, Arif},
  title     = {Politik Kelautan dan Perikanan},
  year      = {2015},
  publisher = {Obor},
  address   = {Jakarta},
}

@article{smith2020,
  author  = {Smith, John and Doe, Alice},
  title   = {Organic fertilizer effect on rice yield},
  journal = {Journal of Crop Science},
  year    = {2020},
  volume  = {10},
  number  = {2},
  pages   = {1--10},
  doi     = {10.1000/xyz},
}
```

### Sitasi dalam teks

Gunakan `@key` untuk menyitir referensi, di mana `key` adalah kunci entri BibTeX:

```typst
Menurut @satria2015, pengelolaan sumber daya kelautan …

Hasil penelitian sebelumnya menunjukkan peningkatan hasil panen @smith2020.
```

### Memanggil daftar pustaka

```typst
#daftar-pustaka("reference/reference.bib", style: "ipb.csl")
```

Hanya referensi yang disitasi dalam teks yang akan muncul di daftar pustaka.

### Menggunakan Zotero (direkomendasikan)

Jika kamu sudah familiar dengan [Zotero](https://www.zotero.org), kamu bisa memanfaatkannya untuk mengelola referensi dan mengekspor ke format BibTeX secara otomatis:

1. **Instal Zotero** dari [zotero.org](https://www.zotero.org/download/).
2. **Instal ekstensi Better BibTeX for Zotero** dari [retorque.re/zotero-better-bibtex](https://retorque.re/zotero-better-bibtex/installation/) — ekstensi ini menghasilkan kunci sitasi yang konsisten dan rapi.
3. **Tambahkan referensi** ke library Zotero (bisa drag-and-drop PDF, import DOI, atau tambah manual).
4. **Ekspor ke BibTeX**:
   - Klik kanan koleksi → *Export Collection…*
   - Pilih format **Better BibTeX** (atau **BibTeX** jika tidak menginstal ekstensi)
   - Centang **Keep updated** agar file `.bib` otomatis diperbarui setiap ada perubahan
   - Simpan sebagai `reference.bib` di direktori `reference/`
5. **Gunakan kunci sitasi** yang dihasilkan Zotero (misalnya `satria2015`) langsung di Typst dengan `@satria2015`.

> **Tip:** Dengan fitur *Keep updated*, kamu cukup menambah referensi di Zotero dan file `reference.bib` akan ikut diperbarui secara otomatis — tidak perlu ekspor ulang secara manual.

---

## Membuat Tabel

PPKI mensyaratkan tabel hanya memiliki tiga garis horizontal (tanpa garis vertikal), dengan judul di atas tabel.

```typst
#figure(
  caption: [Judul tabel singkat tanpa tanda titik di akhir],
  kind: table,
  table(
    columns: (auto, 1fr, 1fr),
    table.hline(stroke: 0.75pt),                    // garis atas
    [*Kolom 1*], [*Kolom 2*], [*Kolom 3*],
    table.hline(stroke: 0.75pt),                    // garis bawah header
    [Data A], [1.23], [4.56],
    [Data B], [7.89], [0.12],
    table.hline(stroke: 0.75pt),                    // garis bawah tabel
  ),
)
```

Untuk catatan kaki tabel (Times New Roman 10pt):
```typst
#text(size: 10pt)[#super[a] Keterangan catatan kaki.]
```

---

## Menyisipkan Gambar

Judul gambar diletakkan di bawah gambar secara otomatis.

```typst
#figure(
  image("grafik.png", width: 80%),
  caption: [Judul gambar singkat],
)
```

---

## Penomoran Bab dan Subbab

Typst menangani penomoran otomatis. Gunakan `=` untuk heading:

```typst
= JUDUL BAB         // → I, II, III, … (kapital, tebal, centered)

== Judul Subbab     // → 1.1, 1.2, … (tebal, kiri)

=== Judul Sub-subbab  // → 1.1.1, 1.1.2, … (regular, kiri)
```

Rincian dalam subbab menggunakan huruf (PPKI Lampiran 16 butir 8):
```
a) Poin pertama
b) Poin kedua
```

Untuk paragraf bertingkat (indentasi bertambah 0,5 cm per tingkat):
```typst
#bertingkat[
  Paragraf tingkat 1.
  #bertingkat[
    Paragraf tingkat 2.
  ]
]
```

---

## Kutipan

**Kutipan singkat (≤ 3 baris)** — langsung dalam teks:
```typst
"… merantau bagi orang Minangkabau …" (Naim 1984:284).
```

**Kutipan panjang (blok)** — dipisah dari teks, ukuran huruf lebih kecil:
```typst
#block(inset: (left: 1cm, right: 1cm))[
  #set text(size: 10pt)
  Teks kutipan panjang yang lebih dari tiga baris diletakkan
  sebagai paragraf tersendiri dengan indentasi kiri dan kanan …
]
```

---

## Spesifikasi Format (Lampiran 16 PPKI Edisi ke-4)

| Elemen                    | Ketentuan                                                  |
| ------------------------- | ---------------------------------------------------------- |
| Kertas                    | HVS 80 gram, A4 (21 × 29,7 cm)                             |
| Margin kiri               | 4 cm                                                       |
| Margin kanan, atas, bawah | 3 cm masing-masing                                         |
| Font teks                 | Times New Roman 12pt                                       |
| Font judul bab            | Times New Roman 14pt, tebal, kapital                       |
| Font kode/komputer        | Courier New 11pt                                           |
| Spasi                     | 1 spasi                                                    |
| Indentasi alinea          | 1 cm                                                       |
| Perataan                  | Rata kanan-kiri (justified)                                |
| Nomor halaman             | Pojok atas kanan/kiri (mirror); Romawi untuk bagian awal, Arab untuk isi |

---

## Kompilasi

```bash
typst compile main.typ skripsi.pdf

# Mode watch (auto-compile saat file berubah)
typst watch main.typ skripsi.pdf
```

---

## Lisensi

Template ini dilisensikan di bawah [GNU General Public License v3.0](LICENSE).

Kamu bebas menggunakan, menyalin, memodifikasi, dan mendistribusikan template ini, dengan syarat bahwa setiap karya turunan juga didistribusikan di bawah lisensi yang sama (GPLv3). Lihat file [LICENSE](LICENSE) untuk detail lengkap.
