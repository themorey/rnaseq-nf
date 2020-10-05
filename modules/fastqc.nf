params.outdir = 'results'

process FASTQC {
    tag "FASTQC on $sample_id"
    publishDir params.outdir

    input:
    tuple val(sample_id), path(reads)

    output:
    path "fastqc_${sample_id}_logs" 

    script:
    """
    mkdir fastqc_${sample_id}_logs
    /tmp/trace-program.sh -f /tmp/traces/trace-$(date +"%Y%m%d") --remote=all fastqc -o fastqc_${sample_id}_logs -f fastq -q ${reads}
    """
}
