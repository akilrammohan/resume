// Resume template - no external packages
#let data = yaml("./resume.yaml")

// Check if this is a public build (phone number will be masked)
#let is-public = sys.inputs.at("public", default: "false") == "true"

// Settings from YAML
#let accent-color = rgb(data.settings.accent_color)

// Mask phone number for public builds
#let display-phone = if is-public { "+1 (XXX) XXX-XXXX" } else { data.personal.phone }

// Helper function to format date ranges
#let dates-helper(start, end) = {
  start + " — " + end
}

// Section heading with small caps, accent color, and underline
#let section-heading(title) = {
  v(0.2em)
  text(fill: accent-color, weight: "regular", size: 10pt)[
    #smallcaps(title)
  ]
  v(-0.6em)
  line(length: 100%, stroke: 0.5pt + accent-color)
  v(0.15em)
}

// Two-column row helper (left and right aligned)
#let two-col(left-content, right-content) = {
  grid(
    columns: (1fr, auto),
    gutter: 1em,
    left-content,
    align(right, right-content)
  )
}

// Education entry
#let edu-entry(institution: "", location: "", degree: "", dates: "", bullets: ()) = {
  two-col(
    text(weight: "bold")[#institution],
    text()[#location]
  )
  v(-0.6em)
  two-col(
    text(style: "italic")[#degree],
    text(style: "italic")[#dates]
  )
  if bullets.len() > 0 {
    v(-0.4em)
    for b in bullets {
      [- #b]
    }
  }
}

// Work entry
#let work-entry(title: "", company: "", location: "", dates: "", bullets: ()) = {
  two-col(
    text(weight: "bold")[#title],
    text()[#dates]
  )
  v(-0.6em)
  two-col(
    text()[#company],
    text(style: "italic")[#location]
  )
  if bullets.len() > 0 {
    v(-0.4em)
    for b in bullets {
      [- #b]
    }
  }
}

// Project entry
#let project-entry(name: "", bullets: ()) = {
  text(weight: "bold")[#name]
  if bullets.len() > 0 {
    v(-0.4em)
    for b in bullets {
      [- #b]
    }
  }
}

// Document setup
#set document(
  title: "Resume - " + data.personal.name,
  author: data.personal.name,
)

#set page(
  paper: data.settings.paper,
  margin: (x: 0.5in, y: 0.35in),
)

#set text(
  font: data.settings.font,
  size: 10pt,
)

#set par(
  justify: false,
  leading: 0.5em,
)

// Style links with accent color
#show link: it => text(fill: accent-color)[#underline(it)]

// Reduce list spacing
#set list(
  tight: true,
  indent: 0.2em,
  body-indent: 0.4em,
  spacing: 0.3em,
)

// ===== HEADER =====
#grid(
  columns: (1fr, auto),
  align(left)[
    #text(size: 24pt, weight: "bold")[
      #underline(stroke: 1pt, offset: 3pt)[#data.personal.name]
    ]
  ],
  align(right + horizon)[
    #text(size: 10pt)[
      #display-phone #h(0.3em) | #h(0.3em) #data.personal.location
    ]
  ]
)

#v(-0.3em)

// Contact info line (links only)
#text(size: 9.5pt)[
  #link("mailto:" + data.personal.email)[#data.personal.email]
  #h(0.3em) | #h(0.3em)
  #link("https://" + data.personal.github)[#data.personal.github]
  #h(0.3em) | #h(0.3em)
  #link("https://" + data.personal.linkedin)[#data.personal.linkedin]
  #h(0.3em) | #h(0.3em)
  #link("https://" + data.personal.personal_site)[#data.personal.personal_site]
]

// ===== EDUCATION =====
#section-heading("Education")

#for edu in data.education {
  edu-entry(
    institution: edu.institution,
    location: edu.location,
    degree: edu.degree,
    dates: dates-helper(edu.start_date, edu.end_date),
    bullets: if edu.bullets != none { edu.bullets } else { () }
  )
}

// ===== WORK EXPERIENCE =====
#section-heading("Work Experience")

#for job in data.work {
  work-entry(
    title: job.title,
    company: job.company,
    location: job.location,
    dates: dates-helper(job.start_date, job.end_date),
    bullets: if job.bullets != none { job.bullets } else { () }
  )
  v(0.1em)
}

// ===== PROJECTS =====
#section-heading("Projects")

#for p in data.projects {
  project-entry(
    name: p.name,
    bullets: if p.bullets != none { p.bullets } else { () }
  )
  v(0.1em)
}

// ===== SKILLS =====
#section-heading("Skills")

- *Programming Languages*: #data.skills.programming_languages
- *Technologies*: #data.skills.technologies
