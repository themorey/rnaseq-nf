
process INDEX {
    tag "$transcriptome.simpleName"

    input:
    path transcriptome 

    output:
    path 'index' 

    script:
    """
    /tmp/trace-program.sh -f $HOME/traces --remote=all salmon index --threads $task.cpus -t $transcriptome -i index
    """
}
