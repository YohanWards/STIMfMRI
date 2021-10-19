#!/bin/bash
#19/10/2021
#Yohan Wards
# run fmriprep

ml singularity
ml fmriprep
screen singularity run -B $HOME/scratch/tmp:/tmp \
--cleanenv my_images/fmriprep-latest.simg STIMMRI_BIDS/STIMMRI_BIDS/ data/derivatives/fmriprep participant participant_label sub-048 \
--t2s-coreg --use-syn-sdc --fs-license-file freesurfer.txt --output-spaces T1w MNI152NLin2009cAsym \
fsaverage fsnative --use-aroma --skip_bids_validation --fs-no-reconall
