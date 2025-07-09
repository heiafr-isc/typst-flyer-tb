// Flyer template for HEIA-FR Bachelor thesis summary
// Jacques Supcik, July 2025

#import "@preview/oxifmt:1.0.0": strfmt

#let heia_blue = rgb("#007CB7")
#let heia_grey = rgb("#ACA39A")

#let gender_code(persons: ()) = {
  let g = if persons.map(p => p.gender).all(g => g == "M") { "M" } else if persons
    .map(p => p.gender)
    .all(g => g == "F") { "F" } else { "X" }
  let c = if persons.len() <= 1 {
    "S"
  } else { "P" }
  g + c
}

#let header(
  program: "ISC",
  year: none,
  students: (),
) = [

  #let subtitle = context (
    if text.lang == "fr" {
      "Résumé du travail de Bachelor"
    } else if text.lang == "de" {
      "Zusammenfassung Bachelorarbeit"
    } else {
      "Bachelor Abstract"
    }
  )

  #let program_label = context (
    if text.lang == "fr" {
      if program == "ISC" {
        "Informatique et Systèmes de Communication"
      } else if program == "GE" {
        "Génie Électrique"
      } else if program == "GM" {
        "Génie Mécanique"
      } else {
        "UNKNOWN PROGRAM : " + program
      }
    } else if text.lang == "de" {
      if program == "ISC" {
        "Informatik und Kommunikationssysteme"
      } else if program == "GE" {
        "Elektrotechnik"
      } else if programm = "GM" {
        "Maschinentechnik"
      } else {
        "UNKNOWN PROGRAM" + program
      }
    } else {
      if program == "ISC" {
        "Computer Science and Communication Systems"
      } else if program == "GE" {
        "Electrical Engineering"
      } else if program = "GM" {
        "Mechanical Engineering"
      } else {
        "UNKNOWN PROGRAM" + program
      }
    }
  )

  #let student_label = context {
    let gc = gender_code(persons: students)
    if text.lang == "fr" {
      if gc == "MS" {
        "Étudiant"
      } else if gc == "FS" {
        "Étudiante"
      } else if gc == "MP" {
        "Étudiants"
      } else if gc == "FP" {
        "Étudiantes"
      } else if gc == "XS" {
        "Étudiant-e"
      } else if gc == "XP" {
        "Étudiant-e-s"
      }
    } else if text.lang == "de" {
      if gc == "MS" {
        "Student"
      } else if gc == "FS" {
        "Studentin"
      } else if gc == "MP" {
        "Studenten"
      } else if gc == "FP" {
        "Studentinnen"
      } else if gc == "XS" {
        "Student-in"
      } else if gc == "XP" {
        "Student-in-nen"
      }
    } else {
      if gc == "MS" {
        "Student"
      } else if gc == "FS" {
        "Student"
      } else if gc == "MP" {
        "Students"
      } else if gc == "FP" {
        "Students"
      } else if gc == "XS" {
        "Student"
      } else if gc == "XP" {
        "Students"
      }
    }
  }

  #box(width: 100%, height: 16mm, fill: heia_blue, [
    #place(left + horizon, dx: 3mm, image(
      "logo-heia.svg",
      height: 12mm,
    ))
    #place(right + horizon, dx: -4mm, image(
      "logo-hesso.svg",
      height: 4.5mm,
    ))
    #place(center + horizon, dy: 8mm, image(
      if program == "ISC" {
        "logo-isc.svg"
      } else if program == "GE" {
        "logo-ge.svg"
      } else if program == "GM" {
        "logo-gm.svg"
      } else {
        "logo-isc.svg"
      },
      height: 18mm,
    ))
  ])
  #set text(fill: heia_blue)
  #box(width: 100%, [
    #place(top + left, [
      #text(size: 8pt, weight: "bold", student_label)\
      #text(size: 10pt, weight: "regular", students.map(s => s.first_name + " " + s.last_name).join(" / "))\
    ])
    #place(top + right, [
      #text(size: 8pt, weight: "bold", [#subtitle #year])\
      #text(size: 9.5pt, weight: "regular", [#upper(program_label)])\
    ])])
]


#let footer() = [
  #set text(fill: heia_blue, size: 8.5pt)
  #line(stroke: heia_blue + 0.1mm, length: 100%)
  #context (
    if text.lang == "fr" [
      Haute école d'ingénierie et d'architecture de Fribourg #sym.circle.filled.tiny
      Bd de Pérolles 80 #sym.circle.filled.tiny
      CH-1700 Fribourg #sym.circle.filled.tiny
      +41 26 429 66 11 #sym.circle.filled.tiny
      #link("info@hefr.ch")
    ] else if text.lang == "de" [
      Hochschule für Technik und Architektur Freiburg #sym.circle.filled.tiny
      Pérolles 80 #sym.circle.filled.tiny
      CH-1700 Freiburg #sym.circle.filled.tiny
      +41 26 429 66 11 #sym.circle.filled.tiny
      #link("info@hefr.ch")
    ] else [
      School of Engineering and Architecture of Fribourg #sym.circle.filled.tiny
      Bd de Pérolles 80 #sym.circle.filled.tiny
      CH-1700 Fribourg #sym.circle.filled.tiny
      +41 26 429 66 11 #sym.circle.filled.tiny
      #link("info@hefr.ch")
    ]
  )
]

#let title_frame(
  professors: (),
  client: none,
  int_contact: none,
  acronym: none,
  number: none,
  theme: none,
  experts: (),
  sdg_goals: (1, 2, 3, 4, 5),
) = [
  #set text(fill: heia_blue, size: 10pt)

  #let prof_label = context {
    let gc = gender_code(persons: professors)
    if text.lang == "fr" {
      if gc == "MS" {
        "Professeur"
      } else if gc == "FS" {
        "Professeure"
      } else if gc == "MP" {
        "Professeurs"
      } else if gc == "FP" {
        "Professeures"
      } else if gc == "XS" {
        "Professeur-e"
      } else if gc == "XP" {
        "Professeur-e-s"
      }
    } else if text.lang == "de" {
      if gc == "MS" {
        "Dozent"
      } else if gc == "FS" {
        "Dozentin"
      } else if gc == "MP" {
        "Dozenten"
      } else if gc == "FP" {
        "Dozentinnen"
      } else if gc == "XS" {
        "Dozenten-in"
      } else if gc == "XP" {
        "Dozenten-in-nen"
      }
    } else {
      if gc == "MS" {
        "Supervisor"
      } else if gc == "FS" {
        "Supervisor"
      } else if gc == "MP" {
        "Supervisors"
      } else if gc == "FP" {
        "Supervisors"
      } else if gc == "XS" {
        "Supervisor"
      } else if gc == "XP" {
        "Supervisors"
      }
    }
  }

  #let client_label = context (
    if text.lang == "fr" {
      "Mandant"
    } else if text.lang == "de" {
      "Auftraggeber/in"
    } else {
      "Commissionned by"
    }
  )

  #let int_contact_label = context (
    if text.lang == "fr" {
      "Contact interne"
    } else if text.lang == "de" {
      "Interner Kontakt"
    } else {
      "Internal contact"
    }
  )
  #let theme_label = context (
    if text.lang == "fr" {
      "Thématique"
    } else if text.lang == "de" {
      "Thema"
    } else {
      "Theme"
    }
  )

  #let acronym_label = context (
    if text.lang == "fr" {
      "Acronyme du projet"
    } else if text.lang == "de" {
      "Kurzzeichen Projekt"
    } else {
      "Project Abbreviation"
    }
  )

  #let number_label = context (
    if text.lang == "fr" {
      "No interne ou filière"
    } else if text.lang == "de" {
      "Interne Projekt-nr."
    } else {
      "Internal project Nr."
    }
  )

  #let expert_label = context {
    let gc = gender_code(persons: experts)
    if text.lang == "fr" {
      if gc == "MS" {
        "Expert"
      } else if gc == "FS" {
        "Experte"
      } else if gc == "MP" {
        "Experts"
      } else if gc == "FP" {
        "Expertes"
      } else if gc == "XS" {
        "Expert-e"
      } else if gc == "XP" {
        "Expert-e-s"
      }
    } else if text.lang == "de" {
      if gc == "MS" {
        "Experte"
      } else if gc == "FS" {
        "Expertin"
      } else if gc == "MP" {
        "Experten"
      } else if gc == "FP" {
        "Expertinnen"
      } else if gc == "XS" {
        "Experte/Expertin"
      } else if gc == "XP" {
        "Experte-n/Expertin-nen"
      }
    } else {
      if gc == "MS" {
        "Expert"
      } else if gc == "FS" {
        "Expert"
      } else if gc == "MP" {
        "Experts"
      } else if gc == "FP" {
        "Experts"
      } else if gc == "XS" {
        "Expert"
      } else if gc == "XP" {
        "Experts"
      }
    }
  }

  #let sdg_label = context (
    if text.lang == "fr" {
      "Objectifs de développement durable"
    } else if text.lang == "de" {
      "Nachhltigkeitziele"
    } else {
      "Sustainability goals"
    }
  )

  #grid(
    columns: (1fr, 1fr),
    align: left + horizon,
    stroke: heia_grey + .1mm,
    inset: 2mm,

    grid.hline(stroke: heia_blue + .3mm),
    grid.vline(stroke: heia_blue + .3mm),
    grid.cell(colspan: 2, [
      #upper([#prof_label]) :
      #text(weight: "bold", professors.map(p => p.first_name + " " + p.last_name).join(", "))]),
    grid.cell(colspan: 2, [
      #upper([#client_label]) :
      #text(weight: "bold", client)]),
    grid.vline(stroke: heia_blue + .3mm),
    grid.cell(colspan: 2, [
      #upper([#int_contact_label]) :
      #text(weight: "bold", int_contact)]),

    [#upper([#acronym_label]) : #text(weight: "bold", acronym)],
    [#upper([#number_label]) : #text(weight: "bold", number)],
    [#upper([#theme_label]) : #text(weight: "bold", theme)],
    [#upper([#expert_label]) : #text(weight: "bold", experts.map(e => e.first_name + " " + e.last_name).join(", "))],

    grid.cell(colspan: 2, upper([#sdg_label :
      #box(baseline: 35%, [
        #for i in sdg_goals [
          #context (
            [
              #if text.lang == "fr" {
                box(height: 8mm, image(strfmt("sdg/fr/sdg-fr-{:#02}.jpg", i)))
              } else if text.lang == "de" {
                box(height: 8mm, image(strfmt("sdg/de/sdg-de-{:#02}.jpg", i)))
              } else {
                box(height: 8mm, image(strfmt("sdg/en/sdg-en-{:#02}.jpg", i)))
              }
            ]
          )
        ]
      ])
    ])),
    grid.hline(stroke: heia_blue + .3mm),
  )
]

#let summary(
  doc,
) = [
  #set text(fill: heia_blue, weight: "semibold", size: 11pt)
  #doc
]

#let flyer(
  program: "ISC",
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
  doc,
) = [

  #set page(margin: (x: 10mm, top: 40mm))
  #set text(font: "Noto Sans")
  #set page(
    header: header(
      program: program,
      year: year,
      students: (students),
    ),
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
  #doc
]



