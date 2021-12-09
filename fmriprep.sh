#!/bin/bash
#19/10/2021
#Yohan Wards
# run fmriprep


ml singularity
singularity run -B /scratch/cvl/uqywards/tmp:/tmp \
-B /scratch/cvl/uqywards/data/bids/:/bids \
-B /scratch/cvl/uqywards/data/STIMMRI_fmriprep_output:/STIMMRI_fmriprep_output \
--cleanenv /scratch/cvl/uqywards/my_images/fmriprep-latest-20210805.simg \
/bids/ /STIMMRI_fmriprep_output participant \
--participant-label sub-047 \
--use-syn-sdc \
--fs-license-file /scratch/cvl/uqywards/freesurfer/freesurfer.txt \
--output-spaces T1w MNI152NLin2009cAsym \
fsaverage fsnative \
--use-aroma \
--skip_bids_validation \
--fs-no-reconall
