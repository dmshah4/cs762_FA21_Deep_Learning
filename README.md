# cs762_FA21_Deep_Learning
This is the final project implementation for CS762 Advanced Deep Learning at UW Madison

## Table of Contents
* [Project Structure](#project-structure)
* [Set Up](#set-up)
* [Usage](#usage)
* [Tips](#tips)
* [References](#references)

## Project Structure
    .
    ├── datasets                       # Manually curated image datasets used in the work
        └── Manual_Co_Occurance           # Dataset for research question 4
        ├── Manual_MSCOCO                 # Dataset for research question 1 and 2
        ├── Manual_Q5_dataset             # Unshuffled images for research question 3
        └── Manual_Q5_Shuffled            # Dataset for research question 3
    ├── Q1                             # Python notebook for research question 1 (DETR vs YOLOv3)
        └── output_images                 # Where output images from notebook are stored
    ├── Q2                             # Python notebooks for research question 2
        └── q2_deit_vs_resnet.ipynb       # Notebook to compare deit to resnet
        ├── q2_iou_visualization.ipynb    # Notebook to visualize Grad-CAM and ground truth bounding boxes on images
        ├── q2_iou.ipynb                  # Notebook to compute the IOU between Grad-CAM and ground truth bounding boxes
        └── output_images                 # Where output images from notebook are stored
    ├── Q5                             # Python notebooks for research question 3
        ├── picShuffle.ipynb              # Notebook to generated shuffled images
        ├── q5_deit_vs_resnet.ipynb       # Notebook to compare DEIT and resnet
        ├── q5_detr_vs_yolo.ipynb         # Notebook to compute DETR and YOLOv3
        ├── MATLAB_code                   # Contains all matlab scripts to draw bounding boxes on images and save to csv file
        └── output_images                 # Where output images from notebook are stored
    ├── Q7                             # Python notebooks for research question 4
        ├── q7_detr_vs_yolo.ipynb         # Notebook to test co-occurrence from Manual_Co_Occurance dataset
        ├── q7_trial_2.ipynb              # Notebook to test co-occurrence using object masking from new_dataset
        ├── cooccurrence_matrix           # Co-occurrence matrix for MSCOCO along with label information
        ├── new_dataset                   # Dataset for co-occurrence testing using object masking
        └── output_images                 # Where output images from notebook are stored
    ├── yolov3                          # Contains our modified implementation of YOLOv3 along with yolo weights and other configs
    ├── deit_bbox.csv                   # CSV containing Grad-CAM bounding box information for DEIT images for research question 2
    ├── detr_bbox.csv                   # CSV containing Grad-CAM bounding box information for DETR images for research question 2
    ├── resnet_bbox.csv                 # CSV containing Grad-CAM bounding box information for Resnet images for research question 2
    ├── yolo_bbox.csv                   # CSV containing Grad-CAM bounding box information for YOLOv3 images for research question 2
    ├── double.csv                      # CSV containing bounding box information for dataset Manual_Co_Occurance for research question 4
    └── fullBBOX.xlsx                   # Spreadsheet file containing bounding box information for data Manual_MSCOCO for research questions 1 and 2

* Note: we originally had 7 questions for this study, but filtered them
  down to just 4. As such, folders Q5 and Q7 refer to research questions 3
  and 4 in our work, respectively.

## Set Up
To use this repository to recreate the work shown in our paper, it should be fairly straight forward.
If you keep the provided project strucutre, all you should need to modify is the `dir_uri` variable near the
top of each of the notebooks which specifies the path to the root of this project to your own path.

## Usage
We ran these notebooks on goodle drive using google collab. To get the best recreation results, please do the same.

## Tips
Those with a keen eye will notice that there is much improvement for code optimization in this work.
It should be fairly simple to improve the runtime efficiency of the provided notebooks if one wishes to do so.

## References
Kathuria, A. (2021). Tutorial on implementing YOLO v3 from scratch in PyTorch. Retrieved 21 December 2021, from https://blog.paperspace.com/how-to-implement-a-yolo-object-detector-in-pytorch/
