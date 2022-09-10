CUDA_VISIBLE_DEVICES=0 python train.py ./processedData -a transformers2 --optimizer adam --lr 0.0005 -s fa -t pa --label-smoothing 0.1 \
--dropout 0.3 --max-tokens 4000 --min-lr '1e-09' --lr-scheduler inverse_sqrt --weight-decay 0.0001 \
--criterion label_smoothed_cross_entropy --max-update 150000 --warmup-updates 4000 --warmup-init-lr '1e-07' \
--adam-betas '(0.9,0.98)' --save-dir ./checkpoints/transformers2 --tensorboard_logdir ./tensorboard_logdir --share-all-embeddings \
--encoder-bert-dropout --encoder-bert-dropout-ratio 0.5 | tee -a ./checkpoints/transformers2/training.log


Namespace(no_progress_bar=False, log_interval=1000, log_format=None, tensorboard_logdir='', tbmf_wrapper=False, seed=1, cpu=False, fp16=False, memory_efficient_fp16=False, fp16_init_scale=128, fp16_scale_window=None, fp16_scale_tolerance=0.0, min_loss_scale=0.0001, threshold_loss_scale=None, user_dir=None, criterion='label_smoothed_cross_entropy', optimizer='adam', lr_scheduler='inverse_sqrt', task='translation', num_workers=0, skip_invalid_size_inputs_valid_test=False, max_tokens=4000, max_sentences=None, required_batch_size_multiple=8, dataset_impl='cached', train_subset='train', valid_subset='valid', validate_interval=1, disable_validation=False, max_sentences_valid=None, curriculum=0, distributed_world_size=2, distributed_rank=0, distributed_backend='nccl', distributed_init_method='tcp://localhost:11674', distributed_port=-1, device_id=0, distributed_no_spawn=False, ddp_backend='c10d', bucket_cap_mb=25, fix_batches_to_gpus=False, find_unused_parameters=False, arch='transformers2', max_epoch=0, max_update=150000, clip_norm=25, sentence_avg=False, update_freq=[1], lr=[0.0005], min_lr=1e-09, save_dir='./checkpoints/transformers2', restore_file='checkpoint_last.pt', reset_dataloader=False, reset_lr_scheduler=False, reset_meters=False, reset_optimizer=False, optimizer_overrides='{}', save_interval=1, save_interval_updates=0, keep_interval_updates=-1, keep_last_epochs=-1, no_save=False, no_epoch_checkpoints=False, no_token_positional_embeddings=False, label_smoothing=0.1, adam_betas='(0.9,0.98)', adam_eps=1e-08, weight_decay=0.0001, warmup_updates=4000, warmup_init_lr=1e-07, data='./processedData', source_lang='fa', target_lang='pa', lazy_load=False, raw_text=False, left_pad_source='True', left_pad_target='False', max_source_positions=1024, max_target_positions=1024, upsample_primary=1, bert_model_name='bert-base-uncased', encoder_ratio=1.0, bert_ratio=1.0, finetune_bert=False, mask_cls_sep=False, warmup_from_nmt=False, warmup_nmt_file='checkpoint_nmt.pt', bert_gates=[1, 1, 1, 1, 1, 1], bert_first=True, encoder_bert_dropout=True, encoder_bert_dropout_ratio=0.5, bert_output_layer=-1, encoder_bert_mixup=False, decoder_no_bert=False, dropout=0.3, share_all_embeddings=True, encoder_embed_path=None, encoder_embed_dim=512, encoder_ffn_embed_dim=2048, encoder_layers=6, encoder_attention_heads=8, encoder_normalize_before=False, encoder_learned_pos=False, decoder_embed_path=None, decoder_embed_dim=512, decoder_ffn_embed_dim=2048, decoder_layers=6, decoder_attention_heads=8, decoder_normalize_before=False, decoder_learned_pos=False, attention_dropout=0.0, activation_dropout=0.0, activation_fn='relu', adaptive_softmax_cutoff=None, adaptive_softmax_dropout=0, share_decoder_input_output_embed=False, adaptive_input=False, decoder_output_dim=512, decoder_input_dim=512)
Traceback (most recent call last):
  File "/mnt/disk2/fatemeh.pasban/Loan/train.py", line 315, in <module>
    cli_main()
  File "/mnt/disk2/fatemeh.pasban/Loan/train.py", line 304, in cli_main
    torch.multiprocessing.spawn(
  File "/mnt/miniconda3/envs/Loan/lib/python3.9/site-packages/torch/multiprocessing/spawn.py", line 240, in spawn
    return start_processes(fn, args, nprocs, join, daemon, start_method='spawn')
  File "/mnt/miniconda3/envs/Loan/lib/python3.9/site-packages/torch/multiprocessing/spawn.py", line 198, in start_processes
    while not context.join():
  File "/mnt/miniconda3/envs/Loan/lib/python3.9/site-packages/torch/multiprocessing/spawn.py", line 160, in join
    raise ProcessRaisedException(msg, error_index, failed_process.pid)
torch.multiprocessing.spawn.ProcessRaisedException:

-- Process 1 terminated with the following error:
Traceback (most recent call last):
  File "/mnt/miniconda3/envs/Loan/lib/python3.9/site-packages/torch/multiprocessing/spawn.py", line 69, in _wrap
    fn(i, *args)
  File "/mnt/disk2/fatemeh.pasban/Loan/train.py", line 274, in distributed_main
    main(args, init_distributed=True)
  File "/mnt/disk2/fatemeh.pasban/Loan/train.py", line 42, in main
    task = tasks.setup_task(args)
  File "/mnt/disk2/fatemeh.pasban/Loan/fairseq/tasks/__init__.py", line 19, in setup_task
    return TASK_REGISTRY[args.task].setup_task(args, **kwargs)
  File "/mnt/disk2/fatemeh.pasban/Loan/fairseq/tasks/translation.py", line 182, in setup_task
    src_dict = cls.load_dictionary(os.path.join(paths[0], 'dict.{}.txt'.format(args.source_lang)))
  File "/mnt/disk2/fatemeh.pasban/Loan/fairseq/tasks/fairseq_task.py", line 36, in load_dictionary
    return Dictionary.load(filename)
  File "/mnt/disk2/fatemeh.pasban/Loan/fairseq/data/dictionary.py", line 181, in load
    raise fnfe
  File "/mnt/disk2/fatemeh.pasban/Loan/fairseq/data/dictionary.py", line 175, in load
    with open(f, 'r', encoding='utf-8') as fd:
FileNotFoundError: [Errno 2] No such file or directory: './processedData/dict.fa.txt'

(Loan) fatemeh.pasban@nlp-30-dev:/mnt/disk2/fatemeh.pasban/Loan$ python train.py ./processedData -a transformers2 --optimizer adam --lr 0.0005 -s fa -t pa --label-smoothing 0.1 --dropout 0.3 --max-tokens 4000 --min-lr '1e-09' --lr-scheduler inverse_sqrt --weight-decay 0.0001 --criterion label_smoothed_cross_entropy --max-update 150000 --warmup-updates 4000 --warmup-init-lr '1e-07' --adam-betas '(0.9,0.98)' --save-dir ./checkpoints/transformers2 --share-all-embeddings --encoder-bert-dropout --encoder-bert-dropout-ratio 0.5 | tee -a ./checkpoints/transformers2/training.log
tee: ./checkpoints/transformers2/training.log: No such file or directory
| distributed init (rank 1): tcp://localhost:18081
| distributed init (rank 0): tcp://localhost:18081
| initialized host nlp-30-dev.part2.psg.network as rank 0
| initialized host nlp-30-dev.part2.psg.network as rank 1
Model name 'bert-base-uncased' was not found in model name list (bert-base-uncased, bert-large-uncased, bert-base-cased, bert-large-cased, bert-base-multilingual-uncased, bert-base-multilingual-cased, bert-base-chinese, bert-base-german-cased). We assumed 'https://s3.amazonaws.com/models.huggingface.co/bert/bert-base-uncased-vocab.txt' was a path or url but couldn't find any file associated to this path or url.
Model name 'bert-base-uncased' was not found in model name list (bert-base-uncased, bert-large-uncased, bert-base-cased, bert-large-cased, bert-base-multilingual-uncased, bert-base-multilingual-cased, bert-base-chinese, bert-base-german-cased). We assumed 'https://s3.amazonaws.com/models.huggingface.co/bert/bert-base-uncased-vocab.txt' was a path or url but couldn't find any file associated to this path or url.
Model name 'bert-base-uncased' was not found in model name list (bert-base-uncased, bert-large-uncased, bert-base-cased, bert-large-cased, bert-base-multilingual-uncased, bert-base-multilingual-cased, bert-base-chinese, bert-base-german-cased). We assumed 'https://s3.amazonaws.com/models.huggingface.co/bert/bert-base-uncased.tar.gz' was a path or url but couldn't find any file associated to this path or url.
Model name 'bert-base-uncased' was not found in model name list (bert-base-uncased, bert-large-uncased, bert-base-cased, bert-large-cased, bert-base-multilingual-uncased, bert-base-multilingual-cased, bert-base-chinese, bert-base-german-cased). We assumed 'https://s3.amazonaws.com/models.huggingface.co/bert/bert-base-uncased.tar.gz' was a path or url but couldn't find any file associated to this path or url.
Namespace(no_progress_bar=False, log_interval=1000, log_format=None, tensorboard_logdir='', tbmf_wrapper=False, seed=1, cpu=False, fp16=False, memory_efficient_fp16=False, fp16_init_scale=128, fp16_scale_window=None, fp16_scale_tolerance=0.0, min_loss_scale=0.0001, threshold_loss_scale=None, user_dir=None, criterion='label_smoothed_cross_entropy', optimizer='adam', lr_scheduler='inverse_sqrt', task='translation', num_workers=0, skip_invalid_size_inputs_valid_test=False, max_tokens=4000, max_sentences=None, required_batch_size_multiple=8, dataset_impl='cached', train_subset='train', valid_subset='valid', validate_interval=1, disable_validation=False, max_sentences_valid=None, curriculum=0, distributed_world_size=2, distributed_rank=0, distributed_backend='nccl', distributed_init_method='tcp://localhost:18081', distributed_port=-1, device_id=0, distributed_no_spawn=False, ddp_backend='c10d', bucket_cap_mb=25, fix_batches_to_gpus=False, find_unused_parameters=False, arch='transformers2', max_epoch=0, max_update=150000, clip_norm=25, sentence_avg=False, update_freq=[1], lr=[0.0005], min_lr=1e-09, save_dir='./checkpoints/transformers2', restore_file='checkpoint_last.pt', reset_dataloader=False, reset_lr_scheduler=False, reset_meters=False, reset_optimizer=False, optimizer_overrides='{}', save_interval=1, save_interval_updates=0, keep_interval_updates=-1, keep_last_epochs=-1, no_save=False, no_epoch_checkpoints=False, no_token_positional_embeddings=False, label_smoothing=0.1, adam_betas='(0.9,0.98)', adam_eps=1e-08, weight_decay=0.0001, warmup_updates=4000, warmup_init_lr=1e-07, data='./processedData', source_lang='fa', target_lang='pa', lazy_load=False, raw_text=False, left_pad_source='True', left_pad_target='False', max_source_positions=1024, max_target_positions=1024, upsample_primary=1, bert_model_name='bert-base-uncased', encoder_ratio=1.0, bert_ratio=1.0, finetune_bert=False, mask_cls_sep=False, warmup_from_nmt=False, warmup_nmt_file='checkpoint_nmt.pt', bert_gates=[1, 1, 1, 1, 1, 1], bert_first=True, encoder_bert_dropout=True, encoder_bert_dropout_ratio=0.5, bert_output_layer=-1, encoder_bert_mixup=False, decoder_no_bert=False, dropout=0.3, share_all_embeddings=True, encoder_embed_path=None, encoder_embed_dim=512, encoder_ffn_embed_dim=2048, encoder_layers=6, encoder_attention_heads=8, encoder_normalize_before=False, encoder_learned_pos=False, decoder_embed_path=None, decoder_embed_dim=512, decoder_ffn_embed_dim=2048, decoder_layers=6, decoder_attention_heads=8, decoder_normalize_before=False, decoder_learned_pos=False, attention_dropout=0.0, activation_dropout=0.0, activation_fn='relu', adaptive_softmax_cutoff=None, adaptive_softmax_dropout=0, share_decoder_input_output_embed=False, adaptive_input=False, decoder_output_dim=512, decoder_input_dim=512)

=False, warmup_nmt_file='checkpoint_nmt.pt', bert_gates=[1, 1, 1, 1, 1, 1], bert_first=True, encoder_bert_dropout=True, encoder_bert_dropout_ratio=0.5, bert_output_layer=-1, encoder_bert_mixup=False, decoder_no_bert=False, dropout=0.3, share_all_embeddings=True, encoder_embed_path=None, encoder_embed_dim=512, encoder_ffn_embed_dim=2048, encoder_layers=6, encoder_attention_heads=8, encoder_normalize_before=False, encoder_learned_pos=False, decoder_embed_path=None, decoder_embed_dim=512, decoder_ffn_embed_dim=2048, decoder_layers=6, decoder_attention_heads=8, decoder_normalize_before=False, decoder_learned_pos=False, attention_dropout=0.0, activation_dropout=0.0, activation_fn='relu', adaptive_softmax_cutoff=None, adaptive_softmax_dropout=0, share_decoder_input_output_embed=False, adaptive_input=False, decoder_output_dim=512, decoder_input_dim=512)