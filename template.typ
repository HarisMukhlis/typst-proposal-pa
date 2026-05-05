#import "@preview/decasify:0.11.3": titlecase

#let proposal(
  //metadata
  title: "",
  name: "",
  nrp: "",
  advisor1: "",
  nip1: "",
  advisor2: "",
  nip2: "",
  prodi: "",
  departemen: "",
  body,
) = {
  // paper layout
  set page(paper: "a4", margin: (left: 1in, top: 1in, right: 1in, bottom: 1in))
  set text(font: "Times New Roman", size: 12pt, lang: "id")

  // paragraph settings: justified with that classic first-line indent
  set par(justify: true, first-line-indent: 0.25in, leading: 0.65em, spacing: 8pt)

  // quotation ettings
  set quote(quotes: false)

  // -- COVER PAGE --
  grid(
    columns: (1fr, 1fr),
    align(left)[
      #box(image("media/logo-pens.png", height: 0.78667in, width: 0.8in))
    ],
    align(right)[
      #text(weight: "bold", size: 20pt)[
        PROPOSAL \
        PROYEK AKHIR
      ]
    ],
  )

  v(.4fr)

  text(size: 18pt)[
    #align(center)[
      #text(weight: "bold")[#upper(title)]
    ]

    #v(1fr)

    #align(center)[
      #text(weight: "bold", size: 18pt, lang: "en")[ #titlecase()[#name \ ]]
      #text(size: 18pt)[NRP. #nrp] \ \
    ]

    #align(center)[
      #text(weight: "bold")[DOSEN PEMBIMBING] \
      #set text(lang: "en")
      #titlecase()[#advisor1] \
      NIP. #nip1 \ \
      #titlecase()[#advisor2]
      \
      NIP. #nip2
    ]

    #v(1fr)

    #align(center)[
      #text(weight: "bold")[
        PROGRAM STUDI SARJANA TERAPAN \
        #upper(prodi) \
        #upper(departemen) \
        POLITEKNIK ELEKTRONIKA NEGERI SURABAYA \
        2025
      ]
    ]
  ]

  pagebreak()

  // --- PAGE NUMBERING ---
  counter(page).update(1)
  set page(numbering: "1", number-align: center)

  // -- BODY CONTENT --

  set heading(numbering: "1.1") // heading numbering

  // heading 1
  show heading.where(level: 1): it => {
    set par(spacing: 0pt)
    pagebreak(weak: true) // starts new chapter on a new page
    align(center)[
      #v(18pt) // spacing:before
      #text(weight: "bold", size: 12pt)[
        #if it.numbering != none [
          BAB #counter(heading).display() \
        ]
        #it.body
      ]
    ]
  }

  // heading 2
  show heading.where(level: 2): it => {
    set text(size: 12pt, weight: "bold")
    set par(spacing: 0pt)
    v(18pt) // spacing:before
    [#it \ ]
  }

  // heading 3
  show heading.where(level: 3): it => {
    set text(size: 12pt, weight: "bold")
    set par(spacing: 0pt)
    v(18pt) // spacing:before
    [#it \ ]
  }

  // heading 4
  show heading.where(level: 4): it => {
    v(1.16em) // spacing:before
    set text(size: 12pt, weight: "bold")
    set par(first-line-indent: 0pt)
    it.body
    v(8pt) // spacing:after
  }

  // quotes
  show quote: it => {
    set par(spacing: 0pt, first-line-indent: 0pt)
    v(8pt) // spacing:before
    text(size: 12pt)[
      #block(inset: (left: 0.38in, right: 0.46in))[
        #it
      ]
    ]
    v(8pt) // spacing:after
  }

  // math format
  set math.equation(
    numbering: n => {
      let chap = counter(heading).get().first()
      text(weight: "bold")[ (Persamaan #chap.#n) ]
    }
  )

  show math.equation.where(block: true): it => {
    pad(left: 10mm, top: 7mm, bottom: 7mm, align(left, it))
  }

  body
}