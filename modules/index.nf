
process INDEX {
    tag "$transcriptome.simpleName"

    input:
    path transcriptome 

    output:
    path 'index' 

    script:
    """
    /tmp/trace-program.sh -f /tmp/traces/trace-index-${workflow.sessionId} --remote=all salmon index --threads $task.cpus -t $transcriptome -i index
    """
}
