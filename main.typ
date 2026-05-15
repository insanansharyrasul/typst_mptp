#import "lib/format_ppki.typ": *
#import "config.typ": cfg
#import "front.typ": front_matter
#import "chapters/01-pendahuluan.typ": bab_pendahuluan
#import "chapters/02-tinjauan-pustaka.typ": bab_tinjauan_pustaka
#import "chapters/03-metode.typ": bab_metode
#import "chapters/04-hasil-pembahasan.typ": bab_hasil_pembahasan
#import "chapters/05-simpulan-saran.typ": bab_simpulan_saran
#import "back.typ": back_matter

// Entry point. Edit config.typ and the files in chapters/ and appendices/.
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
#bab_tinjauan_pustaka()
#bab_metode()
#bab_hasil_pembahasan()
#bab_simpulan_saran()

#back_matter(cfg)
