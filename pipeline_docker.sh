LOCAL_HOME=/Users/ecerami/dev/nextflow_sandbox
DOCKER_HOME=/var/log/samtools
IMAGE=mgibio/samtools:1.9

echo "Mounting $LOCAL_HOME to $DOCKER_HOME"
docker run -v $LOCAL_HOME:$DOCKER_HOME $IMAGE view -b -S -o $DOCKER_HOME/alignments/sim_reads_aligned_1.bam $DOCKER_HOME/alignments/sim_reads_aligned_1.sam

echo "Sorting BAM"
docker run -v $LOCAL_HOME:$DOCKER_HOME $IMAGE sort -o $DOCKER_HOME/alignments/sim_reads_aligned_1.sorted.bam $DOCKER_HOME/alignments/sim_reads_aligned_1.bam

echo "Indexing BAM"
docker run -v $LOCAL_HOME:$DOCKER_HOME $IMAGE index $DOCKER_HOME/alignments/sim_reads_aligned_1.sorted.bam

echo "Checking files created"
ls -l alignments