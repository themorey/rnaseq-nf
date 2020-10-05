
process INDEX {
    tag "$transcriptome.simpleName"

    input:
    path transcriptome 

    output:
    path 'index' 

    script:
    """
    bash /anf/apps/breeze_2.13.5_x86_64_traceonly/trace-program.sh -f $HOME/traces --remote=all salmon index --threads $task.cpus -t $transcriptome -i index
    """
}
