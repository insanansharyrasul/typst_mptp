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

### 3. Definisikan variabel global (direkomendasikan)

Karena judul, nama, NIM, dll. diulang di banyak halaman, definisikan sekali di atas file:

```typst
#let judul_indonesia = "Judul Karya Ilmiah Anda"
#let judul_english   = "Title of Thesis"
#let nim             = "NXXXXXXXXX"
#let nama-penulis    = "Nama Lengkap Penulis"
#let program-studi   = "Nama Program Studi"
#let fakultas        = "Nama Fakultas"

#let date  = datetime(year: 2024, month: 1, day: 15)
#let bulan = bulan-id.at(date.month() - 1)  // "Januari"
```

### 4. Aktifkan format PPKI

```typst
#show: ppki.with(
  judul:         judul_indonesia,
  nama-penulis:  nama-penulis,
  nim:           nim,
  jenis-karya:   "skripsi",          // "laporan-akhir" | "skripsi" | "tesis" | "disertasi"
  program-studi: program-studi,
  departemen:    "",                 // kosongkan ("") jika tidak ada departemen
  fakultas:      fakultas,
  tahun:         date.year(),        // int atau string, mis. 2024 atau "2024"
)
```

---

## Struktur Dokumen

Dokumen PPKI terdiri atas tiga fase penomoran halaman:

```
Pra-Bagian Awal  → tanpa nomor halaman (sampul, judul, pernyataan)
Bagian Awal      → nomor halaman Romawi kecil: i, ii, iii, …
Bagian Isi       → nomor halaman Arab: 1, 2, 3, …
```

### Urutan Halaman (PPKI Bab III)

**Pra-Bagian Awal** — letakkan *sebelum* `#show: bagian-awal` (tanpa nomor halaman):

| Urutan | Halaman                        | Fungsi                       |
| ------ | ------------------------------ | ---------------------------- |
| 1      | Halaman sampul                 | `#halaman-sampul(...)`       |
| 2      | Halaman judul (salinan putih)  | `#halaman-judul(...)`        |
| 3      | Pernyataan keaslian            | `#halaman-pernyataan(...)`   |

**Bagian Awal** — aktifkan dengan `#show: bagian-awal` (nomor Romawi):

| Urutan | Halaman                        | Fungsi                       |
| ------ | ------------------------------ | ---------------------------- |
| 4      | Abstrak (Indonesia)            | `#abstrak(...)`              |
| 5      | Abstract (Inggris)             | `#abstract-en(...)`          |
| 6      | Halaman hak cipta              | `#halaman-hak-cipta(...)`    |
| 7      | Halaman judul dalam            | `#halaman-judul-dalam(...)`  |
| 8      | Halaman penguji                | `#halaman-penguji(...)`      |
| 9      | Lembar pengesahan              | `#lembar-pengesahan(...)`    |
| 10     | Prakata                        | `#prakata[...]`              |
| 11     | Daftar isi                     | `#daftar-isi()`              |
| 12     | Daftar tabel (jika tabel > 1)  | `#daftar-tabel()`            |
| 13     | Daftar gambar (jika gambar > 1)| `#daftar-gambar()`           |
| 14     | Daftar lampiran (jika ada)     | `#daftar-lampiran()`         |

### Contoh Lengkap

```typst
#import "lib/format_ppki.typ": *

// ── VARIABEL GLOBAL ────────────────────────────────────────────
#let judul_indonesia = "Pengaruh Pupuk Organik terhadap Pertumbuhan Padi"
#let judul_english   = "Effect of Organic Fertilizer on Rice Growth"
#let nim             = "A1234567"
#let nama-penulis    = "Budi Santoso"
#let program-studi   = "Agronomi dan Hortikultura"
#let fakultas        = "Fakultas Pertanian"

#let date  = datetime(year: 2024, month: 1, day: 15)
#let bulan = bulan-id.at(date.month() - 1)  // "Januari"

// ── FORMAT PPKI ────────────────────────────────────────────────
#show: ppki.with(
  judul:         judul_indonesia,
  nama-penulis:  nama-penulis,
  nim:           nim,
  jenis-karya:   "skripsi",
  program-studi: program-studi,
  departemen:    "",              // kosongkan jika tidak ada departemen
  fakultas:      fakultas,
  tahun:         date.year(),
)

// ── PRA-BAGIAN AWAL (tanpa nomor halaman) ─────────────────────
#halaman-sampul(
  judul:         judul_indonesia,
  nama:          nama-penulis,
  nim:           nim,
  program-studi: program-studi,
  fakultas:      fakultas,
  tahun:         date.year(),
  logo:          image("assets/logo-ipb.png", width: 2.5cm),
)

#halaman-judul(
  judul:         judul_indonesia,
  nama:          nama-penulis,
  nim:           nim,
  program-studi: program-studi,
  fakultas:      fakultas,
  tahun:         date.year(),
)

#halaman-pernyataan(
  nama-penulis: nama-penulis,
  nim:          nim,
  judul:        judul_indonesia,
  jenis-karya:  "skripsi",
  tanggal:      [Bogor, #bulan #date.year()],
)

// ── BAGIAN AWAL (nomor halaman Romawi: i, ii, iii, …) ─────────
#show: bagian-awal

#abstrak(
  nama:       nama-penulis,
  judul:      judul_indonesia,
  pembimbing: ("Ahmad Rifai", "Siti Maryam"),
  isi:        [Narasi abstrak maks. 200 kata, satu paragraf. Memuat latar
               belakang, tujuan, metode, hasil, dan implikasi.],
  kata-kunci: [kata1, kata2, kata3],   // gunakan [...] agar bisa dicetak miring; maks. 5, terurut abjad
)

#abstract-en(
  nama:       nama-penulis,
  judul:      judul_english,
  pembimbing: ("Ahmad Rifai", "Siti Maryam"),
  isi:        [Abstract narrative, max 200 words, one paragraph.],
  keywords:   [keyword1, keyword2, keyword3],
)

#halaman-hak-cipta(tahun: date.year())

#halaman-judul-dalam(
  judul:         judul_indonesia,
  nama:          nama-penulis,
  nim:           nim,
  jenis-karya:   "skripsi",
  program-studi: program-studi,
  fakultas:      fakultas,
  tahun:         date.year(),
)

#halaman-penguji(
  penguji: "Dr. Nama Penguji, M.Si.",  // satu string, atau tuple ("Dr. A", "Dr. B") jika lebih dari satu
  judul:   "Tim Penguji pada Ujian Skripsi:",
)

#lembar-pengesahan(
  judul:         judul_indonesia,
  nama-penulis:  nama-penulis,
  nim:           nim,
  jenis-karya:   "skripsi",
  program-studi: program-studi,
  pembimbing:    ("Dr. Ahmad Rifai, M.Si.", "Dr. Siti Maryam, M.Sc."),
  ketua:         "Prof. Dr. Ketua Program Studi, M.Si.",
  ketua-label:   "Ketua Program Studi Agronomi dan Hortikultura:",
  ketua-nip:     "19XX0101 XXXXXXX X XXX",             // opsional
  dekan:         "Prof. Dr. Ketua Departemen, M.Si.",  // opsional; tampil sebagai "Atau (pilih salah satu)"
  dekan-label:   "Ketua Departemen Agronomi dan Hortikultura:",
  dekan-nip:     "19XX0101 XXXXXXX X XXX",             // opsional
  tanggal-ujian: [#bulan #date.year()],
  tanggal-lulus: [#bulan #date.year()],
)

#prakata[
  Puji dan syukur penulis panjatkan kepada Allah subhanaahu wa ta'ala atas segala
  karunia-Nya sehingga karya ilmiah ini berhasil diselesaikan. …

  #v(1em)
  #align(right)[
    Bogor, #bulan #date.year()
    #v(2em)
    _#nama-penulis_
  ]
]

#daftar-isi()
#daftar-tabel()    // hapus jika tabel ≤ 1
#daftar-gambar()   // hapus jika gambar ≤ 1
#daftar-lampiran() // hapus jika tidak ada lampiran

// ── BAGIAN ISI (nomor halaman Arab: 1, 2, 3, …) ───────────────
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
| `#halaman-sampul(...)`         | Halaman sampul (dengan logo)    | Lampiran 1b–1e   |
| `#halaman-judul(...)`          | Salinan sampul di kertas putih (tanpa logo) | PPKI 3.1.2 |
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

| Fungsi / Variabel      | Keterangan                                                      |
| ---------------------- | --------------------------------------------------------------- |
| `#bertingkat[...]`     | Paragraf bertingkat dengan indentasi +0,5 cm                    |
| `bulan-id`             | Array nama bulan Indonesia: `("Januari", …, "Desember")`. Akses dengan `bulan-id.at(date.month() - 1)` |

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
= JUDUL BAB           // → I, II, III, … (kapital, tebal, centered)

== Judul Subbab       // → 1.1, 1.2, … (tebal, kiri)

=== Judul Sub-subbab  // → 1.1.1, 1.1.2, … (regular, kiri)

==== Judul Tingkat 4  // → 1.1.1.1, … (regular, kiri) — tidak disarankan (PPKI Lampiran 17)
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
