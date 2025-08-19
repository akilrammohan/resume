#import "@preview/basic-resume:0.2.8": *

// Put your personal information here, replacing mine
#let name = "Akilan Rammohan"
#let location = "Los Altos, CA"
#let email = "akilan.rammohan@gmail.com"
#let github = "github.com/akilrammohan"
#let linkedin = "linkedin.com/in/akilan-rammohan-950818219"
#let phone = "+1 (650) 518-9684"
#let personal-site = "akil.foo"

#show: resume.with(
  author: name,
  // All the lines below are optional.
  // For example, if you want to to hide your phone number:
  // feel free to comment those lines out and they will not show.
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#26428b",
  font: "New Computer Modern",
  paper: "us-letter",
  author-position: left,
  personal-info-position: left,
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

#edu(
  institution: "University of Wisconsin-Madison",
  location: "Madison, WI",
  dates: dates-helper(start-date: "Sep 2022", end-date: "May 2026"),
  degree: "Bachelor's of Arts, Computer Science and Data Science",

  // Uncomment the line below if you want edu formatting to be consistent with everything else
  // consistent: true
)
// - Cumulative GPA: 4.0\/4.0 | Dean's List, Harvey S. Mudd Merit Scholarship, National Merit Scholarship
- Relevant Coursework: Algorithms, Data Structures, Machine Organization, Compiler Design, Computer Engineering, Discrete Math, Linear Algebra, Machine Learning, Deep Learning/Generative Models, Theory of Programming Languages

== Work Experience

#work(
  title: "AI Engineering Intern",
  location: "Mountain View, CA",
  company: "Appfaktors",
  dates: dates-helper(start-date: "May 2025", end-date: "Present"),
)
- Build RAG pipeline for unstructured enterprise software architecture data
- Architect data ingestion, vector embedding, and storage pipeline
- Test and evaluate dozens of permutations of LLMs and embedding models on structured architecture generation tasks
- Technologies: CrewAI, PostgreSQL/pgvector, Docker, OpenRouter, OpenAI and huggingface embeddings

#work(
  title: "SAIL Fellow",
  location: "Madison, WI",
  company: "School of Computer, Data, and Information Sciences (CDIS)",
  dates: dates-helper(start-date: "May 2025", end-date: "Aug 2025"),
)
- Developed an agentic news aggregator, with the goal of developing a shared information canon
- Prompted agents to embed the intuition of a newspaper editorial board in their news sourcing efforts
- Sourced news data using RSS feeds, web scraping, and news APIs
- Technologies: CrewAI, Weaviate, Docker, OpenAI API, Next.js, FastAPI

#work(
  title: "Data Analyst",
  location: "Los Altos, CA",
  company: "Think Fast Talk Smart, the podcast",
  dates: dates-helper(start-date: "May 2025", end-date: "Present"),
)
- Determine best evaluation metrics, use classical machine learning models to predict episode performance
- Explore optimal episode posting cadence and episode titling patterns
- Create insightful and clear visualizations for business team to understand
- Technologies: Python, SQL, matplotlib, pandas, Weaviate, OpenAI API, scikit-learn

#work(
  title: "Undergraduate Researcher",
  location: "Madison, WI",
  company: "NeuroErgonomics Lab",
  dates: dates-helper(start-date: "May 2024", end-date: "May 2025"),
)
- Built a robust VR app for police training, and deployed to HTC Vive and Meta Quest 3
- Implemented LLM-enabled AI NPCs to replace in-person acting requirements of contemporary police training
- Developed prompt engineering framework through robust testing to ensure consistent AI behavior
- Technologies: Unity, C\#, InworldAI, ConvAI, Python, R, Tobii, Pupil Labs

== Projects

#project(
  name: "Deepfake Audio Detection (huggingface, pandas, Kaggle, librosa)",
  // Role is optional
  // role: "Maintainer",
  // Dates is optional
  // dates: dates-helper(start-date: "Nov 2023", end-date: "Present"),
  // URL is also optional
  // url: "hyperschedule.io",
)
- Compared CNN, transformer, and conformer neural network architectures for deepfake audio detection
- Finetuned downstream classifiers in open source wav2vec2 and wav2vec2-conformer sequence classification models

#project(
  name: "TAVRFinder (Swift, SwiftUI)",
  // Role is optional
  // role: "Maintainer",
  // Dates is optional
  // dates: dates-helper(start-date: "Nov 2023", end-date: "Present"),
  // URL is also optional
  // url: "hyperschedule.io",
)
- Developed iOS app that uses sizing algorithms to properly size transcatheter aortic valve replacement devices
- Available on App Store (with adjustments for HIPAA compliancy, full app is in use at local hospitals

#project(
  name: "NBA Win Predictor (scikit-learn, PyTorch, pandas, Kaggle)",
  // Role is optional
  // role: "Maintainer",
  // Dates is optional
  // dates: dates-helper(start-date: "Nov 2023", end-date: "Present"),
  // URL is also optional
  // url: "hyperschedule.io",
)
- Neural network classifier to predict a win or loss for a team given their matchup and season stats up to that point
- Achieved 64\% prediction accuracy after hyperparameter search and other model improvements

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
- *Programming Languages*: Python, Java, JavaScript/TypeScript, C, R, C\#, Haskell, Swift
- *Technologies*: Git/Github, huggingface, Docker, CrewAI, Docker, FastAPI, PyTorch, Next.js, RAG
