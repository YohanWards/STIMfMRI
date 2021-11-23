#!/bin/bash
#19/10/2021
#Yohan Wards
# run fmriprep

scratch_space=/scratch/project/stimmri/data/
ml singularity/3.5.0
#/scratch/user/s4549155/neurocommand/local/fetch_containers.sh fmriprep 20.2.3 20210917
singularity run -B ${scratch_space}/tmp:/tmp \
-B ${scratch_space}/bids/:/bids \
-B ${scratch_space}/STIMMRI_fmriprep_output:/STIMMRI_fmriprep_output \
-B ${scratch_space}/freesurfer:/freesurfer \
--cleanenv ${scratch_space}/containers/fmriprep-latest.simg \
/bids/ /STIMMRI_fmriprep_output participant  \
--use-syn-sdc \
--fs-license-file /freesurfer/freesurfer.txt \
--output-spaces T1w MNI152NLin2009cAsym fsaverage fsnative \
--use-aroma \
--skip_bids_validation \
--fs-no-reconall

