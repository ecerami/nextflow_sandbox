#!/usr/bin/env nextflow

sam_channel = Channel.fromPath('alignments/*.sam')

process convertSam2Bam {
	input:
	file sam_file from sam_channel
	
	output:
	file "aligned.bam" into bam_channel
	
	"""
	samtools view -b -S -o aligned.bam ${sam_file}
	"""
}

process sortBam {
	input:
	file bam_file from bam_channel

	output:
	file "aligned.sorted.bam" into bam_sorted_channel
	
	"""
	samtools sort -o aligned.sorted.bam ${bam_file}
	"""
}

process indexBam {
	input:
	file bam_sorted_file from bam_sorted_channel

	"""
	samtools index ${bam_sorted_file}
	"""
}