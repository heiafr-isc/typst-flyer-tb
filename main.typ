// Example flyer for HEIA-FR Bachelor thesis summary
// Jacques Supcik, July 2025

#import "lib/flyer.typ": flyer, summary
#import "lib/profs.typ": AYR, SUP
#set text(lang: "fr")

#let student = (
  first_name: "Albert",
  last_name: "Einstein",
  gender: "M",
)

#let marie = (
  first_name: "Marie",
  last_name: "Curie",
  gender: "F",
)

#let nikola = (
  first_name: "Nikola",
  last_name: "Tesla",
  gender: "M",
)

#show: flyer.with(
  program: "ISC",
  year: 2025,
  students: (student,),
  professors: (SUP, AYR),
  client: [Société de Physique],
  int_contact: [Institut iSIS],
  acronym: [$e=m c^2$],
  number: [3.14],
  theme: [Physique],
  experts: (marie, nikola),
  sdg_goals: (4,),
  title: [La théorie de la relativité],
)

#columns(2, [

  #summary([
    #lorem(40)
  ])

  == Sous-titre
  #lorem(70)

  == Sous-titre
  #lorem(50)

  == Sous-titre
  #lorem(90)

  == Sous-titre
  #lorem(120)

  == Sous-titre
  #lorem(80)

  == Sous-titre
  #lorem(110)

  == Sous-titre
  #lorem(140)

])
