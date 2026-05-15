#let bab_tinjauan_pustaka() = [
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
    image("../assets/gambar_1.png"),
  )
]
