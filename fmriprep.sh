#!/bin/bash
#19/10/2021
#Yohan Wards
# run fmriprep


ml singularity/3.5.0
#/scratch/cvl/uqywards/neurocommand/local/fetch_containers.sh fmriprep 20.2.3 20210917
singularity run -B /scratch/user/s4549155/tmp:/tmp \
-B /scratch/cvl/uqywards/data/bids:/bids \
-B /scratch/cvl/uqywards/data/STIMMRI_fmriprep_output:/STIMMRI_fmriprep_output
--cleanenv /scratch/cvl/uqywards/my_images/fmriprep-latest-20210805.simg \
/bids/ /STIMMRI_fmriprep_output participant \
--t2s-coreg \
--use-syn-sdc \
--fs-license-file /scratch/cvl/uqywards/freesurfer/freesurfer.txt \
--output-spaces T1w MNI152NLin2009cAsym \
fsaverage fsnative \
--use-aroma \
--skip_bids_validation \
--fs-no-reconall
