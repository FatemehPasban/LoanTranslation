sed -r 's/(@@ )|(@@ ?$)//g' $bpefile > $bpefile.debpe
$MOSE/scripts/tokenizer/detokenizer.perl -l $src < $bpefile.debpe > $bpefile.debpe.detok
paste -d "\n" $bpefile $bpefile.debpe.detok > $bpefile.in
cat $bpefile.in | python interactive.py -s $src -t $tgt \
--buffer-size 1024 --batch-size 128 --beam 5 --remove-bpe  > output.log