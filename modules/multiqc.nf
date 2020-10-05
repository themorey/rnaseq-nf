params.outdir = 'results'

process MULTIQC {
    publishDir params.outdir, mode:'copy'

    input:
    path('*') 
    path(config) 

    output:
    path('multiqc_report.html')

    script:
    """
    cp $config/* .
    echo "custom_logo: \$PWD/logo.png" >> multiqc_config.yaml
    /tmp/trace-program.sh -f /tmp/traces/trace-$SLURM_JOB_ID --remote=all multiqc .
    """
}
