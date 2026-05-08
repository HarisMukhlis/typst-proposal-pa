# Template Proposal Proyek Akhir PENS (Typst)

Repositori ini berisi *template* Typst untuk menulis Proposal Proyek Akhir (PA) Sarjana Terapan di Politeknik Elektronika Negeri Surabaya (PENS). 

Template ini udah sesuai sama **Buku Panduan Proposal PA PENS**, mencakup format cover, penomoran bab, format gambar/tabel, ampe gaya sitasi *(pens.csl)*. Kamu bisa fokus menulis konten, dan tujuan Typst buat ngurusin formatnya.

---

## Panduan

### Lewat web Typst (Tanpa Install)

Kalo kamu gak ingin repot menginstal aplikasi di laptop, kamu bisa menggunakan Typst lewat browser:
1. Buka [Typst Web App](https://typst.app/).
2. Buat akun / Login.
3. Buat *Blank Project*, lalu *upload* semua file dari folder repositori ini ke dalam project tersebut. *(bisa langsung drag satu folder)*
4. Buka file `main.typ`, dan hasil proposalmu akan langsung terlihat di panel sebelah kanan.
5. File projek bisa didownload/export menjadi .PDF dengan tombol *"Quick Preview"* di pojok kanan atas preview.

### Local / Offline

Kalo kamu ingin lebih leluasa, ngerjakan tanpa perlu jaringan internet, pakai cara local:
1. Gunakan repo sebagai template (*"Use this template"* di pojok atas repo github ini)
2. Clone repo di local komputermu
3. Siapin VSCode
4. Install ekstensi [Tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)
5. Tekan tombol *Typst Preview: Preview Opened File* pada pojok kanan atas **saat membuka main.typ**. *(Atau bisa pakai shortcut `CTRL + K + V`)*
6. File projek bisa diexport menjadi .PDF dengan tombol *"Show exported PDF"* di kanan atas (di samping tombol preview). 

*(Alternatifnya, kamu bisa instal [Typst CLI](https://typst.app/docs/installation/) atau menggunakan ekstensi Typst di VS Code).*

---

## Apa Saja yang Perlu Diubah?

Kamu **hanya perlu mengedit 2 file utama**:

### 1. `main.typ` (Isi Proposal)
Di bagian paling atas file ini, kamu akan menemukan blok `#show: proposal.with(...)`. Ubah data-data di dalamnya dengan datamu sendiri:
```typst
#show: proposal.with(
  title: "JUDUL PROYEK AKHIR KAMU",
  name: "Nama Lengkap Kamu",
  nrp: "0123456789",
  advisor1: "Nama Dosen Pembimbing 1",
  nip1: "NIP Pembimbing 1",
  advisor2: "Nama Dosen Pembimbing 2",
  nip2: "NIP Pembimbing 2",
  prodi: "Teknik Informatika",
  departemen: "Departemen Teknik Informatika dan Komputer",
)
```
Selanjutnya, kamu tinggal mengganti teks di bawah = PENDAHULUAN, == LATAR BELAKANG, dst dengan tulisanmu sendiri.

### 2. `citation/refs.bib` (Daftar Pustaka)
Masukkan semua referensi jurnal, buku, atau website ke dalam file ini menggunakan format BibTeX. Kamu bisa mendapatkan format BibTeX dengan mudah dari Google Scholar (klik tombol kutip/cite -> pilih BibTeX).

---

## Fitur Bantuan (Fungsi Khusus)
Template ini udah menyediakan fungsi khusus agar format tabel dan gambar sesuai panduan PENS.

### Memasukkan Gambar:
Gunakan fungsi `#image-format` (jangan gunakan `#figure` bawaan Typst).

```typst
#image-format(
  "media/gambarmu.png", 
  "Ini adalah keterangan gambar", 
  source: [Sumber Gambar (opsional)],
  img-width: 50%
)
```

### Memasukkan Tabel:
Gunakan fungsi `#table-format`.

```typst
#table-format(
  "Judul Tabel",
  (1fr, 1fr), // Lebar kolom
  source: [Sumber Tabel (opsional)],
  [Kolom 1], [Kolom 2],
  [Isi 1], [Isi 2]
)
```

### Sitasi & Referensi:
Untuk memanggil sitasi di dalam paragraf, gunakan simbol `@` diikuti dengan ID referensi di file `refs.bib`. Contoh: `Menurut penelitian sebelumnya @jurnal_example...`

### AI Native Format dengan `AGENT.md`:
Repo ini udah dilengkapi file `AGENT.md` untuk memudahkan AI Agent *(seperti Claude, Cursor, atau Copilot)* memahami aturan ketat Typst dan panduan PENS. File ini tidak perlu dibaca, tapi buat bahan *feed* ke AI sebagai *System Instructions* atau *Context*.

Jadi, kalau pakai AI Agent, formatnya ga bakal berubah.