
process INDEX {
    tracePath = "/tmp/traces/trace-index-${SLURM_JOB_ID}"
    tag "$transcriptome.simpleName"

    input:
    path transcriptome 

    output:
    path 'index' 

    script:
    """
    /tmp/trace-program.sh -f $tracePath --remote=all salmon index --threads $task.cpus -t $transcriptome -i index
    """
}
