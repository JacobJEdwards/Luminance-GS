SCENE_DIR="/workspace/360_v2"
RESULT_DIR="/workspace/lum"
SCENE_LIST="garden bicycle stump bonsai counter kitchen room" # treehill flowers
POSTFIXES="_contrast _multiexposure _variance"

for POSTFIX in $POSTFIXES;
do
for SCENE in $SCENE_LIST;
do

    if [ "$SCENE" = "bonsai" ] || [ "$SCENE" = "counter" ] || [ "$SCENE" = "kitchen" ] || [ "$SCENE" = "room" ]; then
        DATA_FACTOR=2
    else
        DATA_FACTOR=4
    fi

    echo "Running $SCENE"

    # train without eval
    CUDA_VISIBLE_DEVICES=0 python simple_trainer_ours.py --disable_viewer --data_factor $DATA_FACTOR \
        --data_dir $SCENE_DIR/$SCENE/ \
        --postfix $POSTFIX \
        --result_dir $RESULT_DIR/$POSTFIX/$SCENE/
done
done