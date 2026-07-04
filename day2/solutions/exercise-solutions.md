# Day 2 — Exercise Solutions

> Try each exercise yourself first. Run everything inside `~/bmp/day2/data`.

## Exercise 1 — Count `months`

```bash
wc months        # lines words bytes
wc -l months     # lines only
```

**Output:**

```
12 12 86 months
12 months
```

12 lines (one month each), 12 words, 86 bytes.

## Exercise 2 — Wildcards: list genomes, count samples

```bash
ls *.genome
wc -l *.samples
```

**Output:**

```
apple.genome  peach.genome  pear.genome
 3 apple.samples
 1 peach.samples
 3 pear.samples
 7 total
```

`*` expands to every matching file; `wc` accepts the whole list at once and adds a `total`.

## Exercise 3 — Reverse sort, first 3

```bash
sort -r months | head -n 3
```

**Output:**

```
september
october
november
```

`sort -r` reverses alphabetical order; the pipe passes it to `head -n 3`.

## Exercise 4 — Genes in `pear.genes`

```bash
wc -l pear.genes                       # total genes
cut -f4 pear.genes | sort | uniq -c    # per strand
```

**Output:**

```
11 pear.genes
      6 -
      5 +
```

11 genes total; **5** on the `+` strand (6 on `-`).

## Exercise 5 — Apple genes per strand → file

```bash
mkdir -p results
cut -f4 apple.genes | sort | uniq -c > results/apple-strand-counts.txt
cat results/apple-strand-counts.txt
```

**Output:**

```
   2792 -
   2664 +
```

## Exercise 6 — Shared vs unique tissues (`comm`)

```bash
comm <(sort apple.samples) <(sort peach.samples)
```

**Output:** (col 1 = only apple, col 2 = only peach, col 3 = both)

```
		fruit
leaf
root
```

**fruit** is shared; **leaf** and **root** are apple-only; peach has nothing unique here.
`comm` needs sorted inputs, so each file is sorted on the fly with `<(sort ...)`.

## Exercise 7 — Archive the gene files (`tar`)

```bash
tar -czf genes.tar.gz *.genes
tar -tzf genes.tar.gz
```

**Output:**

```
apple.genes
peach.genes
pear.genes
```

`-czf` = **c**reate a g**z**ipped archive to a **f**ile; `-tzf` = lis**t** its contents. Extract later with `tar -xzf genes.tar.gz`.

## Exercise 8 — Reads in `demo.fastq`

```bash
echo $(( $(wc -l < demo.fastq) / 4 ))
```

**Output:**

```
1250000
```

FASTQ stores **4 lines per read**, so reads = lines ÷ 4 = 5,000,000 ÷ 4 = **1,250,000**.
(`wc -l < file` omits the filename so only the number is passed to the arithmetic.)

## Exercise 9 — First 5 chr2 gene IDs → file

```bash
grep "chr2" apple.genes | cut -f1 | head -n 5 > results/chr2-first5.txt
cat results/chr2-first5.txt
```

**Output:**

```
MDP0000261921
MDP0000151962
MDP0000234270
MDP0000234271
MDP0000285637
```

Pipeline: `grep` keeps chr2 lines → `cut -f1` takes the gene-ID column → `head -n 5` keeps the first five → `>` saves them.

---

# Reference exercises — gene analysis (`Mod1Lec11` / `Mod1Lec12`)

> Column 1 is the **gene name** in all three `.genes` files, but `peach.genes` and `pear.genes` use different column orders for the rest (peach: strand = col 6; pear: strand = col 4). These solutions only use column 1, so they are format-safe. Always `head` a file before trusting a column.

## Exercise 10 — Chromosomes in the apple genome

```bash
grep -c "^>" apple.genome
```

**Output:**

```
3
```

Each FASTA header (`^>`) is one chromosome/scaffold: `chr1`, `chr2`, `chr3` → **3**.

## Exercise 11 — Transcripts vs genes vs variants

```bash
wc -l apple.genes                              # one line per transcript
cut -f1 apple.genes | sort -u | wc -l          # distinct genes
cut -f1 apple.genes | sort | uniq -c | awk '$1>1'   # genes with >1 variant
```

**Output:**

```
5456 apple.genes
5453
      2 MDP0000025650
      2 MDP0000301110
      2 MDP0000575784
```

**5456** transcripts, **5453** distinct genes. Only **3** genes have multiple variants (2 each) — everything else is single-variant (5453 − 3 = **5450**). `uniq -c` needs sorted input; `awk '$1>1'` keeps the counts above 1.

## Exercise 12 — Which systems have a `Smell` / `Color` gene?

```bash
for f in apple peach pear; do
  printf '%s: Smell=%s Color=%s\n' "$f" \
    "$(cut -f1 $f.genes | grep -ixc Smell)" \
    "$(cut -f1 $f.genes | grep -ixc Color)"
done
```

**Output:**

```
apple: Smell=0 Color=0
peach: Smell=3 Color=2
pear:  Smell=0 Color=2
```

**Smell** gene: only **peach** (3 variant lines). **Color** gene: **peach and pear** → **2** plant systems. Apple (real *M. domestica* annotation) has neither. `grep -ix` matches the whole column, case-insensitively, so `Smell` does not also catch `Smell-1`-style names in other columns.

## Exercise 13 — Genes common vs specific: peach vs pear

```bash
comm -12 <(cut -f1 peach.genes | sort -u) <(cut -f1 pear.genes | sort -u)  # common
comm -23 <(cut -f1 peach.genes | sort -u) <(cut -f1 pear.genes | sort -u)  # peach-only
comm -13 <(cut -f1 peach.genes | sort -u) <(cut -f1 pear.genes | sort -u)  # pear-only
```

**Output:**

```
Color        # common
Shape
Size
Taste

pch1         # peach-only
pch2
Smell

pyr1         # pear-only
pyr2
pyr3
pyr4
```

Shared: **Color, Shape, Size, Taste**. Peach-only: **pch1, pch2, Smell**. Pear-only: **pyr1–pyr4**. `comm` needs sorted input; `-12/-23/-13` suppress columns to isolate common / first-only / second-only.

## Exercise 14 — Transcripts per scaffold in `peach.genes`

```bash
cut -f3 peach.genes | sort | uniq -c | sort -rn
```

**Output:**

```
      4 scaffold_5
      3 scaffold_2
      3 scaffold_3
      1 scaffold_1
      1 scaffold_4
      1 scaffold_6
```

**scaffold_5** carries the most (**4** transcripts). Final `sort -rn` orders by count, highest first. (Column 3 is the scaffold in peach's layout — confirm with `head peach.genes`.)
