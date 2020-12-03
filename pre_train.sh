#export CUDA_VISIBLE_DEVICES=1,2,3,0
export CUDA_VISIBLE_DEVICES=1

EPOCH=10
LR=1e-5
DOMAIN=$1.pre_train
PRE_TRAINED_MODEL_PATH=gpt2-medium
MODEL_SAVE_PATH=./models.${DOMAIN}/

python train.py \
	--output_dir=${MODEL_SAVE_PATH} \
	--model_type=gpt2 \
	--do_train \
	--do_eval \
	--model_name_or_path=${PRE_TRAINED_MODEL_PATH} \
	--eval_data_file=data/${DOMAIN}/train.txt \
	--per_gpu_train_batch_size 8 \
	--num_train_epochs ${EPOCH} \
	--learning_rate ${LR} \
	--overwrite_cache \
	--use_tokenize \
	--train_data_file=data/${DOMAIN}/train.txt \
	--overwrite_output_dir