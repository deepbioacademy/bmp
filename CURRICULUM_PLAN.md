# BMP Cohort 02 — Curriculum Material Master Plan

## Context

The **Bioinformatics Mentorship Program (BMP)** Cohort 02 runs 24 live sessions
over 12 weeks (Fri + Sat, 9–11am, starting July 3, 2026). Source of truth:
`BMP Schedule [Cohort 02 Live] - Session Timeline.csv`.

Goal: produce **university-level, self-study markdown guides** for **absolute
beginners** — learners who may have never opened a terminal. Each guide must be a
**full textbook-style lab**: theory explained plainly, then copy-paste commands
with expected output, checkpoints, troubleshooting, and exercises. A learner
should be able to complete a session alone from the guide, using the 2h live
session for Q&A and the listed self-study hours for practice.

The repo currently has only `day1/resources/` (git + markdown cheatsheets) — no
lesson content yet. This document is the **master plan**; individual session
guides get written afterward, day by day, following the template below.

---

## Curriculum map (24 sessions → 6 modules)

| Day | Date | Session | Module |
|-----|------|---------|--------|
| 1 | Jul 3 | Bioinformatics Workflow Setup: Building Your Computational Foundation | **M0 Setup** |
| 2 | Jul 4 | Command Line: Basic Unix + NGS Data Formats | **M1 Linux** |
| 3 | Jul 10 | Command Line: Sequences & Genomic Features | M1 Linux |
| 4 | Jul 11 | Command Line: Alignment & Sequence Variation | M1 Linux |
| 5 | Jul 17 | Command Line: Tools for Transcriptomics | M1 Linux |
| 6 | Jul 18 | Programming: Python Fundamentals | **M2 Programming** |
| 7 | Jul 24 | Programming: R Fundamentals | M2 Programming |
| 8 | Jul 25 | Prompt & Context Engineering for Bioinformatics (AI) | **M3 AI** |
| 9 | Jul 31 | Bulk RNA-seq: Fastq → Counts Matrix | **M4 Bulk RNA-seq** |
| 10 | Aug 1 | Bulk RNA-seq: Counts → Differential Expression | M4 Bulk RNA-seq |
| 11 | Aug 7 | Bulk RNA-seq: DEG → Pathways | M4 Bulk RNA-seq |
| 12 | Aug 8 | Bulk RNA-seq: Batch Effects & Complex Designs | M4 Bulk RNA-seq |
| 13 | Aug 14 | Bulk RNA-seq: Meta-Analysis of Public GEO Data | M4 Bulk RNA-seq |
| 14 | Aug 15 | Single-Cell: FASTQ → Count Matrix | **M5 Single-Cell** |
| 15 | Aug 21 | Single-Cell: QC & Cell Filtering | M5 Single-Cell |
| 16 | Aug 22 | Single-Cell: Integration & Clustering | M5 Single-Cell |
| 17 | Aug 28 | Single-Cell: Cell Type Identification | M5 Single-Cell |
| 18 | Aug 29 | Single-Cell: Cell-Type DE, Proportion, Pathways | M5 Single-Cell |
| 19 | Sep 4 | Single-Cell: Harmonized Public Data | M5 Single-Cell |
| 20 | Sep 5 | Deep Learning: Foundations | **M6 Deep Learning** |
| 21 | Sep 11 | Deep Learning: Single-Cell Genomics | M6 Deep Learning |
| 22 | Sep 12 | Deep Learning: Drug Discovery | M6 Deep Learning |
| 23 | Sep 18 | Deep Learning: In Silico Toxicology | M6 Deep Learning |
| 24 | Sep 19 | Wrap-up: Road to Publication | **M7 Capstone** |

### Module learning outcomes

- **M0 Setup (Day 1)** — install and verify a working bioinformatics
  environment (terminal, conda/mamba, git, a code editor); understand the shape
  of a bioinformatics workflow end-to-end.
- **M1 Linux (Days 2–5)** — navigate the shell, manipulate text streams, and
  operate on real NGS file formats (FASTA/FASTQ, BED/GFF/GTF, SAM/BAM, VCF)
  using core Unix tools + samtools/bcftools/bedtools.
- **M2 Programming (Days 6–7)** — read and write basic Python and R; load,
  manipulate, and plot tabular biological data.
- **M3 AI (Day 8)** — use LLMs responsibly as a bioinformatics copilot: prompt
  patterns, context engineering, verifying generated code, avoiding hallucinated
  tools/params.
- **M4 Bulk RNA-seq (Days 9–13)** — run a full differential-expression pipeline:
  QC → align/quantify → counts → DESeq2 → pathway/GSEA → batch correction →
  reuse public GEO data.
- **M5 Single-Cell (Days 14–19)** — process scRNA-seq from raw reads to biology:
  cellranger/count matrix → QC → integration/clustering → annotation → DE &
  composition → public atlas reuse.
- **M6 Deep Learning (Days 20–23)** — grasp DL foundations and apply models to
  single-cell genomics, drug discovery, and toxicology.
- **M7 Capstone (Day 24)** — assemble results into a reproducible, publishable
  form; figures, methods, reproducibility, submission workflow.

### Prerequisite chain
`Setup → Linux → Programming → AI` are the foundation. `Bulk RNA-seq` depends on
all four. `Single-Cell` depends on Bulk. `Deep Learning` depends on Programming +
some RNA-seq context. `Capstone` depends on everything.

---

## Folder structure (one folder per day)

```
G:\bmp\
├─ README.md                         # program overview + index of all sessions
├─ BMP Schedule ... .csv             # existing schedule (source of truth)
├─ templates/
│  └─ session-guide-template.md      # canonical per-session skeleton
├─ day1/
│  ├─ guide.md                       # the full lab guide (main deliverable)
│  ├─ resources/                     # cheat sheets, slides, PDFs (day1 already has git+md)
│  ├─ data/                          # small example datasets or download script
│  └─ solutions/                     # worked answers to exercises
├─ day2/
│  ├─ guide.md
│  ├─ resources/
│  ├─ data/
│  └─ solutions/
├─ ...
└─ day24/
```

- `guide.md` is the single self-study document per session.
- `data/` holds tiny example files or a `download.sh` for larger datasets (never
  commit big NGS files — link to public sources / GEO / SRA accessions).
- `solutions/` is separated so learners can attempt exercises first.
- Reuse the existing `day1/resources/` (git + markdown cheat sheets) in Day 1.

---

## Per-session guide template (full textbook lab guide)

Every `guide.md` follows this fixed skeleton (stored in
`templates/session-guide-template.md`):

1. **Header** — Session title, Week/Day, date, live duration + self-study hours
   (from CSV), Zoom/Recording code (`BMP-C02-Sxx`).
2. **Learning objectives** — 3–6 "By the end you will be able to…" bullets.
3. **Prerequisites** — prior days/skills + tools that must already be installed;
   a one-line self-check command.
4. **Why this matters** — short biological/research framing so beginners see the
   point before the mechanics.
5. **Concept primer** — plain-language theory, analogies, diagrams
   (mermaid where helpful). Define every new term on first use.
6. **Setup check** — commands to confirm the environment is ready + expected
   output.
7. **Step-by-step walkthrough** — numbered steps. Each step: what + why, exact
   copy-paste command/code block, **expected output**, and a ✅ checkpoint
   ("you should now see…").
8. **Common errors & troubleshooting** — table of error message → cause → fix.
9. **Exercises** — 2–4 graded tasks (guided → independent). Answers in
   `solutions/`.
10. **Recap / key takeaways** — bullet summary.
11. **Glossary** — new terms introduced this session.
12. **Further reading** — curated links, docs, papers, the `Readings` column.

Formatting rules: fenced code blocks with language tags; annotate every command;
show real expected output; call out OS differences (this cohort is on **Windows**
— provide WSL/Git Bash guidance alongside macOS/Linux); keep prose readable for
non-native English speakers.

---

## Tooling per module (to standardize across guides)

- **M0/M1**: WSL2 / Git Bash, conda or mamba, git, VS Code; coreutils,
  `samtools`, `bcftools`, `bedtools`, `seqkit`.
- **M2**: Python (pandas, numpy, matplotlib), R (tidyverse, ggplot2), Jupyter/RStudio.
- **M4 Bulk**: `fastqc`, `fastp`, `salmon`/`STAR`, `DESeq2` (or `pydeseq2`),
  `clusterProfiler`/GSEA, `GEOquery`.
- **M5 Single-cell**: `cellranger`/`STARsolo`, `scanpy` + `anndata`,
  optionally `Seurat`, `scvi-tools` for integration.
- **M6 DL**: PyTorch, `scvi-tools`, `torchdrug`/`deepchem`, `rdkit`.

Relevant installed Claude skills that can accelerate authoring/checking content:
`scanpy`, `anndata`, `pydeseq2`, `scvi-tools`, `rdkit`, `deepchem`, `torchdrug`,
`geo-database`, `biopython`, `markdown-mermaid-writing`.

---

## Build order (after this plan is approved)

1. `templates/session-guide-template.md` + top-level `README.md` (index).
2. Day 1 (setup) — highest leverage; unblocks everyone.
3. Days 2–5 (Linux) in sequence.
4. Then modules M2 → M7 in day order.

Each session guide is written to its `dayN/guide.md`, with example data scripts
and exercise solutions.

---

## Verification

- **Structure check**: confirm every `dayN/` folder exists with `guide.md` and
  the four subfolders; `README.md` links all 24 sessions; template file present.
- **Content lint**: each `guide.md` contains all 12 template sections
  (grep for the section headers).
- **Runnable commands**: on a clean Windows + WSL2 setup, run the Day-1 setup
  guide start-to-finish; every command must produce the documented expected
  output. For later sessions, run walkthrough commands against the provided tiny
  `data/` examples before publishing.
- **Beginner readability**: no undefined jargon (every new term appears in the
  session Glossary); a non-bioinformatician can follow each numbered step.
- **Cross-reference CSV**: each guide header matches the CSV row (title, date,
  durations, `BMP-C02-Sxx` code).
