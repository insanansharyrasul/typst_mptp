#import "lib/format_ppki.typ": *
#import "appendices/lampiran.typ": lampiran_content
#import "appendices/riwayat-hidup.typ": riwayat_hidup_content

#let back_matter(cfg) = [
  #daftar-pustaka(cfg.bib_path, style: cfg.csl_path)

  #lampiran_content()
  #riwayat_hidup_content()
]
