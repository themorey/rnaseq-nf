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
    bash /anf/apps/breeze_2.13.5_x86_64_traceonly/trace-program.sh -f $HOME/traces --remote=all fastqc -o fastqc_${sample_id}_logs -f fastq -q ${reads}
    """
}
