
process QUANT {
    tag "$pair_id"

    input:
    path index 
    tuple val(pair_id), path(reads) 

    output:
    path pair_id 

    script:
    """
    bash /anf/apps/breeze_2.13.5_x86_64_traceonly/trace-program.sh -f $HOME/traces --remote=all salmon quant --threads $task.cpus --libType=U -i $index -1 ${reads[0]} -2 ${reads[1]} -o $pair_id
    """
}
