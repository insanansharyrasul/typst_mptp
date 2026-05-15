# format_ppki.typ

Template [Typst](https://typst.app) untuk penulisan karya ilmiah tugas akhir mahasiswa IPB, sesuai **Pedoman Penulisan Karya Ilmiah (PPKI) Edisi ke-4** (IPB Press, Desember 2019).

## Quick start (beginner)

1. Edit `config.typ` untuk judul, nama, dan isi bagian awal.
2. Tulis isi bab di folder `chapters/` (satu file per bab).
3. Jika perlu, ubah lampiran dan riwayat hidup di folder `appendices/`.
4. Kompilasi `main.typ`.

Struktur proyek yang baru:

```
typst_mptp/
├── main.typ
├── config.typ
├── front.typ
├── back.typ
├── chapters/
│   ├── 01-pendahuluan.typ
│   ├── 02-tinjauan-pustaka.typ
│   ├── 03-metode.typ
│   ├── 04-hasil-pembahasan.typ
│   └── 05-simpulan-saran.typ
├── appendices/
│   ├── lampiran.typ
│   └── riwayat-hidup.typ
├── assets/
├── lib/
└── reference.bib
```

---

## Prasyarat

- [Typst](https://typst.app) versi 0.11 ke atas
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
├── main.typ
├── config.typ
├── front.typ
├── back.typ
├── chapters/
│   ├── 01-pendahuluan.typ
│   ├── 02-tinjauan-pustaka.typ
│   ├── 03-metode.typ
│   ├── 04-hasil-pembahasan.typ
│   └── 05-simpulan-saran.typ
├── appendices/
│   ├── lampiran.typ
│   └── riwayat-hidup.typ
├── assets/
├── lib/
│   ├── format_ppki.typ
│   └── ipb.csl
└── reference.bib
```

### 2. Isi metadata di config.typ

```typst
#let cfg = (
  judul: "Judul Karya Ilmiah Anda",
  nama: "Nama Lengkap Penulis",
  nim: "NXXXXXXXXX",
  jenis_karya: "skripsi",          // "laporan-akhir" | "skripsi" | "tesis" | "disertasi"
  program_studi: "Nama Program Studi",
  departemen: "",                  // kosongkan jika tidak ada
  fakultas: "Nama Fakultas",
  tahun: "2024",
)
```

### 3. Tulis isi bab dan lampiran

- Bab ada di `chapters/`.
- Lampiran dan riwayat hidup ada di `appendices/`.

### 4. Entry point (main.typ)

`main.typ` sudah berisi wiring; biasanya tidak perlu diubah. Strukturnya:

```typst
#import "lib/format_ppki.typ": *
#import "config.typ": cfg
#import "front.typ": front_matter
#import "chapters/01-pendahuluan.typ": bab_pendahuluan
#import "back.typ": back_matter

#show: ppki.with(
  judul: cfg.judul,
  nama-penulis: cfg.nama,
  nim: cfg.nim,
  jenis-karya: cfg.jenis_karya,
  program-studi: cfg.program_studi,
  departemen: cfg.departemen,
  fakultas: cfg.fakultas,
  tahun: cfg.tahun,
)

#front_matter(cfg)
#show: bagian-isi
#bab_pendahuluan()
#back_matter(cfg)
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

### Contoh Minimal (modular)

`main.typ`:

```typst
#import "config.typ": cfg
#import "front.typ": front_matter
#import "chapters/01-pendahuluan.typ": bab_pendahuluan
#import "back.typ": back_matter

#show: ppki.with(
  judul: cfg.judul,
  nama-penulis: cfg.nama,
  nim: cfg.nim,
  jenis-karya: cfg.jenis_karya,
  program-studi: cfg.program_studi,
  departemen: cfg.departemen,
  fakultas: cfg.fakultas,
  tahun: cfg.tahun,
)

#front_matter(cfg)
#show: bagian-isi
#bab_pendahuluan()
#back_matter(cfg)
```

`config.typ`:

```typst
#let cfg = (
  judul: "Pengaruh Pupuk Organik terhadap Pertumbuhan Padi",
  nama: "Budi Santoso",
  nim: "A1234567",
  jenis_karya: "skripsi",
  program_studi: "Agronomi dan Hortikultura",
  departemen: "Agronomi dan Hortikultura",
  fakultas: "Fakultas Pertanian",
  tahun: "2024",
)
```

`chapters/01-pendahuluan.typ`:

```typst
#let bab_pendahuluan() = [
= PENDAHULUAN
== Latar Belakang
Paragraf pertama dimulai di sini ...
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
├── reference.bib         ← data referensi
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
#daftar-pustaka("reference.bib", style: "lib/ipb.csl")
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
