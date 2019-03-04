echo "Converting SAM to BAM"
samtools view -b -S -o alignments/sim_reads_aligned_1.bam alignments/sim_reads_aligned_1.sam

echo "Sorting BAM"
samtools sort -o alignments/sim_reads_aligned_1.sorted.bam alignments/sim_reads_aligned_1.bam

echo "Indexing BAM"
samtools index alignments/sim_reads_aligned_1.sorted.bam

echo "Checking files created"
ls -l alignments