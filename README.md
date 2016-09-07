# some_useful_scripts

## refine.sh 通过cppcheck的xml，用git blame提取提交者
```
用法 refine.sh cppcheck_output.xml | grep git_author
```
## new_service 通过init.d添加debian系列的service
来自[Sample service script for debianoids](https://gist.github.com/naholyr/4275302)

## nVidia_Multi_GPU_Fan_Control，无显示器系统上控制各个gpu风扇
来自[Nvidia GPU Coolness](https://sites.google.com/site/akohlmey/random-hacks/nvidia-gpu-coolness)

## sync_datetime.sh 使用ntp同步时间
```
```
## pngs_to_video.sh 使用ffmpeg把png序列合成m4v
```
用法 pngs_to_video.sh [out_name.m4v] [wxh] [framerate]，例如pngs_to_video.sh dataset_neg.m4v 640x360 25
```
## remove_less_then_100x100_pic.sh 对目标目录内图片按100x100规格切分，并移除边缘/余量不足的图片，输出到/tmp/crop_100x100_output_dir
```
用法 remove_less_then_100x100_pic.sh [folder] 例如 remove_less_then_100x100_pic.sh ./negative_label
```
## keyword_filter.sh 在指定文件夹内搜索符合关键字的文件，并移动到filter_out目录
```
用法 keyword_filter.sh [keyword_file.txt] [source_folder]
```
