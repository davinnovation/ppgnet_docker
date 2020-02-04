python main.py \
--exp-name line_weighted_wo_focal_junc --backbone resnet50 \
--backbone-kwargs '{"encoder_weights": "ckpt/backbone/encoder_epoch_20.pth", "decoder_weights": "ckpt/backbone/decoder_epoch_20.pth"}' \
--dim-embedding 256 --junction-pooling-threshold 0.2 \
--junc-pooling-size 64 --attention-sigma 1.5 --block-inference-size 128 \
--data-root /data/path --junc-sigma 3 \
--batch-size 16 --gpus 0,1,2,3 --num-workers 10 --resume-epoch latest \
--is-train-junc True --is-train-adj True \
--vis-junc-th 0.1 --vis-line-th 0.1 \
    - train --end-epoch 9 --solver SGD --lr 0.2 --weight-decay 5e-4 --lambda-heatmap 1. --lambda-adj 5. \
    - train --end-epoch 15 --solver SGD --lr 0.02 --weight-decay 5e-4 --lambda-heatmap 1. --lambda-adj 10. \
    - train --end-epoch 30 --solver SGD --lr 0.002 --weight-decay 5e-4 --lambda-heatmap 1. --lambda-adj 10. \
    - end
