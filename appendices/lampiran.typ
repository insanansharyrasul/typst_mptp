#import "../lib/format_ppki.typ": *

#let lampiran_content() = [
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
]
