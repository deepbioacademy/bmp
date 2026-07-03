# Day 1 — Exercise Solutions

> Try each exercise yourself first. Your version strings/core counts will differ — that is expected.

## Exercise 1 — Prove local Linux works

```bash
uname -a
nproc
```

**Sample output:**

```
Linux PC 5.15.153.1-microsoft-standard-WSL2 #1 SMP x86_64 GNU/Linux
8
```

- Kernel string ends in `microsoft-standard-WSL2`, confirming you are inside WSL2.
- `nproc` prints the number of CPU cores WSL can use (8 here).

## Exercise 2 — QC environment from Bioconda

```bash
mamba create -n bmp-qc fastqc multiqc -y
mamba activate bmp-qc
fastqc --version
```

**Sample output:**

```
FastQC v0.12.1
```

## Exercise 3 — Pinned environment.yml + lock

`environment.yml`:

```yaml
name: bmp-ex3
channels:
  - conda-forge
  - bioconda
  - defaults
dependencies:
  - python=3.10
  - pysam
  - seqkit
```

Build and export:

```bash
mamba env create -f environment.yml
mamba activate bmp-ex3
mamba env export --no-builds > environment.lock.yml
```

`environment.lock.yml` will list `pysam`, `seqkit`, and every dependency with exact versions.
Submit both `environment.yml` and `environment.lock.yml`.

## Exercise 4 — uv project with Biopython

```bash
mkdir ~/day1-practice && cd ~/day1-practice
uv init
uv add biopython
```

`revcomp.py`:

```python
from Bio.Seq import Seq

seq = Seq("ATGC")
print(seq.reverse_complement())
```

Run it:

```bash
uv run python revcomp.py
```

**Expected output:**

```
GCAT
```

> Reverse-complement of `ATGC`: complement `TACG`, then reverse → `GCAT`.
