# Bioinformatics Mentorship Program — Cohort 02

University-level, self-study bioinformatics lab guides for **absolute beginners**.
24 live sessions over 12 weeks (Fri + Sat, 9–11am, starting **July 3, 2026**).

Each session has a full textbook-style lab guide in `dayN/guide.md`: plain-language
theory, copy-paste commands with expected output, checkpoints, troubleshooting,
and exercises. The 2-hour live session is for Q&A; self-study hours are for practice.

> **Planning docs**: see [`CURRICULUM_PLAN.md`](CURRICULUM_PLAN.md) for the full
> master plan and [`templates/session-guide-template.md`](templates/session-guide-template.md)
> for the guide skeleton.

## How to use these materials

1. Do the sessions **in order** — each builds on the last.
2. Read the guide before the live session; run every command yourself.
3. Attempt the **Exercises** before checking `dayN/solutions/`.
4. This cohort runs on **Windows** — guides give WSL2 / Git Bash steps alongside
   macOS/Linux.

## Curriculum index

| Day | Date | Session | Module | Guide |
|-----|------|---------|--------|-------|
| 1 | Jul 3 | Bioinformatics Workflow Setup | M0 Setup | [day1](day1/guide.md) |
| 2 | Jul 4 | Command Line: Basic Unix + NGS Formats | M1 Linux | [day2](day2/guide.md) |
| 3 | Jul 10 | Command Line: Sequences & Genomic Features | M1 Linux | [day3](day3/guide.md) |
| 4 | Jul 11 | Command Line: Alignment & Sequence Variation | M1 Linux | [day4](day4/guide.md) |
| 5 | Jul 17 | Command Line: Tools for Transcriptomics | M1 Linux | [day5](day5/guide.md) |
| 6 | Jul 18 | Programming: Python Fundamentals | M2 Programming | [day6](day6/guide.md) |
| 7 | Jul 24 | Programming: R Fundamentals | M2 Programming | [day7](day7/guide.md) |
| 8 | Jul 25 | Prompt & Context Engineering for Bioinformatics | M3 AI | [day8](day8/guide.md) |
| 9 | Jul 31 | Bulk RNA-seq: Fastq → Counts Matrix | M4 Bulk RNA-seq | [day9](day9/guide.md) |
| 10 | Aug 1 | Bulk RNA-seq: Counts → Differential Expression | M4 Bulk RNA-seq | [day10](day10/guide.md) |
| 11 | Aug 7 | Bulk RNA-seq: DEG → Pathways | M4 Bulk RNA-seq | [day11](day11/guide.md) |
| 12 | Aug 8 | Bulk RNA-seq: Batch Effects & Complex Designs | M4 Bulk RNA-seq | [day12](day12/guide.md) |
| 13 | Aug 14 | Bulk RNA-seq: Meta-Analysis of Public GEO Data | M4 Bulk RNA-seq | [day13](day13/guide.md) |
| 14 | Aug 15 | Single-Cell: FASTQ → Count Matrix | M5 Single-Cell | [day14](day14/guide.md) |
| 15 | Aug 21 | Single-Cell: QC & Cell Filtering | M5 Single-Cell | [day15](day15/guide.md) |
| 16 | Aug 22 | Single-Cell: Integration & Clustering | M5 Single-Cell | [day16](day16/guide.md) |
| 17 | Aug 28 | Single-Cell: Cell Type Identification | M5 Single-Cell | [day17](day17/guide.md) |
| 18 | Aug 29 | Single-Cell: Cell-Type DE, Proportion, Pathways | M5 Single-Cell | [day18](day18/guide.md) |
| 19 | Sep 4 | Single-Cell: Harmonized Public Data | M5 Single-Cell | [day19](day19/guide.md) |
| 20 | Sep 5 | Deep Learning: Foundations | M6 Deep Learning | [day20](day20/guide.md) |
| 21 | Sep 11 | Deep Learning: Single-Cell Genomics | M6 Deep Learning | [day21](day21/guide.md) |
| 22 | Sep 12 | Deep Learning: Drug Discovery | M6 Deep Learning | [day22](day22/guide.md) |
| 23 | Sep 18 | Deep Learning: In Silico Toxicology | M6 Deep Learning | [day23](day23/guide.md) |
| 24 | Sep 19 | Wrap-up: Road to Publication | M7 Capstone | [day24](day24/guide.md) |

## Modules

- **M0 Setup** (Day 1) — working bioinformatics environment + workflow overview.
- **M1 Linux** (Days 2–5) — shell, text streams, NGS formats (FASTA/FASTQ, BED/GFF/GTF, SAM/BAM, VCF).
- **M2 Programming** (Days 6–7) — Python & R for tabular biological data.
- **M3 AI** (Day 8) — LLMs as a responsible bioinformatics copilot.
- **M4 Bulk RNA-seq** (Days 9–13) — QC → quantify → DESeq2 → pathways → batch → GEO reuse.
- **M5 Single-Cell** (Days 14–19) — raw reads → QC → clustering → annotation → DE → atlases.
- **M6 Deep Learning** (Days 20–23) — foundations → single-cell → drug discovery → toxicology.
- **M7 Capstone** (Day 24) — reproducible, publishable results.

## Repository layout

```
day1/ ... day24/
  guide.md      # the self-study lab guide
  resources/    # cheat sheets, slides, PDFs
  data/         # tiny example data or download script (no large NGS files)
  solutions/    # worked exercise answers
templates/      # session guide skeleton
CURRICULUM_PLAN.md
```
