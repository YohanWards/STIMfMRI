#!/bin/bash
#19/10/2021
#Yohan Wards
# run fmriprep


ml singularity/3.5.0
/scratch/user/s4549155/neurocommand/local/fetch_containers.sh fmriprep 20.2.3 20210917
singularity run -B $HOME/scratch/tmp:/tmp \
--cleanenv scratch/user/4549155/images/fmriprep-latest.simg STIMMRI_BIDS/STIMMRI_BIDS/ data/derivatives/fmriprep participant participant_label sub-048 \
--t2s-coreg --use-syn-sdc --fs-license-file freesurfer.txt --output-spaces T1w MNI152NLin2009cAsym \
fsaverage fsnative --use-aroma --skip_bids_validation --fs-no-reconall
