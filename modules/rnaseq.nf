params.outdir = 'results'

include { INDEX } from './index'
include { QUANT } from './quant'
include { FASTQC } from './fastqc'

workflow RNASEQ {
  take:
    transcriptome
    read_pairs_ch
 
  main: 
    bash /anf/apps/breeze_2.13.5_x86_64_traceonly/trace-program.sh -f $HOME/traces --remote=all INDEX(transcriptome)
    bash /anf/apps/breeze_2.13.5_x86_64_traceonly/trace-program.sh -f $HOME/traces --remote=all FASTQC(read_pairs_ch)
    bash /anf/apps/breeze_2.13.5_x86_64_traceonly/trace-program.sh -f $HOME/traces --remote=all QUANT(INDEX.out, read_pairs_ch)

  emit: 
     QUANT.out | concat(FASTQC.out) | collect
}
