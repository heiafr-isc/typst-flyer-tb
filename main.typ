// Example flyer for HEIA-FR Bachelor thesis summary
// Jacques Supcik, July 2025

#import "lib/flyer.typ": flyer, summary

#show: flyer.with(
  year: 2025,
  student_label: [Étudiant],
  students: ([Einstein Albert],),
  professors: ([Supcik Jacques], [Ayer Serge]),
  client: [Société de Physique],
  int_contact: [Institut iSIS],
  acronym: [$e=m c^2$],
  number: [3.14],
  theme: [Physique],
  experts: ([Curie Marie], [Tesla Nikola]),
  sdg_goals: (4,),
  title: [La théorie de la relativité],
)

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

