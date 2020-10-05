
process INDEX {
    tag "$transcriptome.simpleName"

    input:
    path transcriptome 

    output:
    path 'index' 

    script:
    """
    /tmp/trace-program.sh -f /tmp/traces/trace-20201005 --remote=all salmon index --threads $task.cpus -t $transcriptome -i index
    """
}
