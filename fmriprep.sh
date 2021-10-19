#!/bin/bash
#19/10/2021
#Yohan Wards
# run fmriprep


ml singularity/3.5.0
/scratch/user/s4549155/neurocommand/local/fetch_containers.sh fmriprep 20.2.3 20210917
singularity run -B /scratch/user/s4549155/tmp:/tmp \
-B /scratch/user/s4549155/STIMMRI_BIDS/STIMMRI_BIDS/:/STIMMRI_BIDS \
-B /scratch/user/s4549155/STIMMRI_fmriprep_output:/STIMMRI_fmriprep_output
--cleanenv /scratch/user/s4549155/images/fmriprep-latest-20210805.simg \
/STIMMRI_BIDS/ /STIMMRI_fmriprep_output participant participant_label sub-048 \
--t2s-coreg \
--use-syn-sdc \
--fs-license-file /scratch/user/s4549155/freesurfer/freesurfer.txt \
--output-spaces T1w MNI152NLin2009cAsym \
fsaverage fsnative \
--use-aroma \
--skip_bids_validation \
--fs-no-reconall
