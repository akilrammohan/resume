#import "@preview/basic-resume:0.2.8": *

#let data = yaml("./resume.yaml")

#let to-align(s) = if s == "left" { left } else if s == "right" { right } else { left }

#show: resume.with(
  author: data.personal.name,
  // All the lines below are optional.
  // For example, if you want to to hide your phone number:
  // feel free to comment those lines out and they will not show.
  location: data.personal.location,
  email: data.personal.email,
  github: data.personal.github,
  linkedin: data.personal.linkedin,
  phone: data.personal.phone,
  personal-site: data.personal.personal_site,
  accent-color: data.settings.accent_color,
  font: data.settings.font,
  paper: data.settings.paper,
  author-position: to-align(data.settings.author_position),
  personal-info-position: to-align(data.settings.personal_info_position),
)

/*
* Lines that start with == are formatted into section headings
* You can use the specific formatting functions if needed
* The following formatting functions are listed below
* #edu(dates: "", degree: "", gpa: "", institution: "", location: "", consistent: false)
* #work(company: "", dates: "", location: "", title: "")
* #project(dates: "", name: "", role: "", url: "")
* certificates(name: "", issuer: "", url: "", date: "")
* #extracurriculars(activity: "", dates: "")
* There are also the following generic functions that don't apply any formatting
* #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
* #generic-one-by-two(left: "", right: "")
*/
== Education

#for edu-item in data.education [
  #edu(
    institution: edu-item.institution,
    location: edu-item.location,
    dates: dates-helper(start-date: edu-item.dates.start, end-date: edu-item.dates.end),
    degree: edu-item.degree,
  )
  #if edu-item.bullets != none [
    #for b in edu-item.bullets [
      - #b
    ]
  ]
]

== Work Experience

#for job in data.work [
  #work(
    title: job.title,
    location: job.location,
    company: job.company,
    dates: dates-helper(start-date: job.dates.start, end-date: job.dates.end),
  )
  #if job.bullets != none [
    #for b in job.bullets [
      - #b
    ]
  ]
]

== Projects

#for p in data.projects [
  #project(
    name: p.name,
  )
  #if p.bullets != none [
    #for b in p.bullets [
      - #b
    ]
  ]
]

// == Extracurricular Activities
//
// #extracurriculars(
//   activity: "Capture The Flag Competitions",
//   dates: dates-helper(start-date: "Jan 2021", end-date: "Present"),
// )
// - Founder of Les Amateurs (#link("https://amateurs.team")[amateurs.team]), currently ranked \#4 US, \#33 global on CTFTime (2023: \#4 US, \#42 global)
// - Organized AmateursCTF 2023 and 2024, with 1000+ teams solving at least one challenge and \$2000+ in cash prizes
//   - Scaled infrastructure using GCP, Digital Ocean with Kubernetes and Docker; deployed custom software on fly.io
// - Qualified for DEFCON CTF 32 and CSAW CTF 2023, two of the most prestigious cybersecurity competitions globally

// #extracurriculars(
//   activity: "Science Olympiad Volunteering",
//   dates: "Sep 2023 --- Present"
// )
// - Volunteer and write tests for tournaments, including LA Regionals and SoCal State \@ Caltech

// #certificates(
//   name: "OSCP",
//   issuer: "Offensive Security",
//   // url: "",
//   date: "Oct 2024",
// )

== Skills
- *Programming Languages*: #data.skills.programming_languages
- *Technologies*: #data.skills.technologies
