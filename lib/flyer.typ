#import "@preview/oxifmt:1.0.0": strfmt

#let heia_blue = rgb("#007CB7")
#let heia_grey = rgb("#ACA39A")
  
#let header(
  year: none,
  students: (),
  student_label: [Étudiant]
) = [
#box(
  width: 100%,
  height: 16mm,
  fill: heia_blue,
  [
    #place(
      left+horizon,
      dx: 3mm,
       image(
         "logo-heia.svg",
         height: 12mm     
       )
    )
    #place(
      right+horizon,
      dx: -4mm,
       image(
         "logo-hesso.svg",
         height: 4.5mm     
       )
    )
    #place(
      center+horizon,
      dy: 8mm,
       image(
         "logo-isc.svg",
         height: 18mm     
       )
    )
  ]  
)
#set text(fill: heia_blue)
#box(
  width: 100%,[
  #place(
    top+left,[
      #text(size: 8pt, weight: "bold", student_label)\
      #text(size: 10pt, weight: "regular", students.join(" / "))\
    ]
  )
  #place(
    top+right, [
      #text(size: 8pt, weight: "bold", [Résumé travail de Bachelor #year])\
      #text(size: 9.5pt, weight: "regular", [INFORMATIQUE ET SYSTÈMES DE COMMUNICATION])\
    ]
  )]
)
]


#let footer() = [
  #set text(fill: heia_blue, size: 8.5pt)
  #line(stroke: heia_blue + 0.1mm, length: 100%)
   Haute école d'ingénierie et d'architecture de Fribourg #sym.circle.filled.tiny
   Bd de Pérolles 80 #sym.circle.filled.tiny
   CH-1700 Fribourg #sym.circle.filled.tiny
   +41 26 429 66 11 #sym.circle.filled.tiny
   #link("info@hefr.ch")
]

#let title_frame(
  professors: (),
  client: none,
  int_contact: none,
  acronym: none,
  number: none,
  theme: none,
  experts: (),
  sdg_goals: (1,2,3,4,5),
) = [
  #set text(fill: heia_blue, size: 10pt, )
  #grid(
    columns: (1fr, 1fr),
    align: left+horizon,
    stroke: heia_grey + .1mm,
    inset: 2mm,
    
    grid.hline(stroke: heia_blue + .3mm),
    grid.vline(stroke: heia_blue + .3mm),
    grid.cell(colspan: 2, [
      #upper([Professeur-es]) :
      #text(weight: "bold", professors.join(", "))]),
    grid.cell(colspan: 2, [
      #upper([Mandant]) :
      #text(weight: "bold", client)]),
    grid.vline(stroke: heia_blue + .3mm),
    grid.cell(colspan: 2, [
      #upper([Contact Interne]) :
      #text(weight: "bold", int_contact)]),

    [#upper([Acronyme du projet]) : #text(weight: "bold", acronym)],
    [#upper([No interne ou filière]) : #text(weight: "bold", number)],
    [#upper([Thématique]) : #text(weight: "bold", theme)],
    [#upper([Expert-es]) : #text(weight: "bold", experts.join(", "))],
    
    grid.cell(colspan: 2, 

    
    upper([Objectifs de développement durable :
    #box(baseline: 35%,
      [
        #for i in sdg_goals [
          #box(height: 8mm, image(
            strfmt("sdg/fr/sdg-fr-{:#02}.jpg", i)
          ))  
        ]
      ])
    ])
    
  ),

    grid.hline(stroke: heia_blue + .3mm),
  )
]

#let summary(
  doc
) = [
  #set text(fill: heia_blue, weight: "semibold", size: 11pt)
  #doc
]

#let flyer(
  student_label: [Étudiant],
  students: (),
  professors: (),
  client: none,
  year: 2025,
  int_contact: none,
  acronym: none,
  number: none,
  theme: none,
  experts: (),
  sdg_goals: (),
  title: none,
  doc
) = [
  
  #set page(margin: (x: 10mm, top:40mm))
  #set text(lang: "fr", font: "Noto Sans")
  #set page(
    header: header(
      year: year,
      student_label: student_label,
      students: (students)),
    footer: footer(),
  )

  #title_frame(
    professors: professors,
    client: client,
    int_contact: int_contact,
    acronym: acronym,
    number: number,
    theme: theme,
    experts: experts,
    sdg_goals: sdg_goals,
  )

  #show heading.where(level: 1): set text(fill: heia_blue, size: 17pt)
  #show heading.where(level: 2): set text(size: 11.5pt)

  = #title
  #v(5mm)

  #set par(justify: true)

  #columns(
  2, doc)
]



