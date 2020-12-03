export CUDA_VISIBLE_DEVICES=3

#DOMAIN=taxi
#DOMAIN=train
#DOMAIN=tv
#DOMAIN=hotel
#DOMAIN=laptop
#DOMAIN=restaurant
#DOMAIN=attraction
DOMAIN=$1

MODEL_SAVE_PATH=./models.${DOMAIN}.pre_train/
#MODEL_SAVE_PATH=./models.hotel/

python generate.py \
	--model_type=gpt2 \
	--model_name_or_path=${MODEL_SAVE_PATH} \
	--num_samples 5 \
	--input_file=data/${DOMAIN}/test.txt \
	--top_p 0.5 \
	--output_file=results_${DOMAIN}.json \
	--length 80