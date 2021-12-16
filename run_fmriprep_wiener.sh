#!/bin/bash
#Script for running on Wiener CVL
#open the Neurodesk cvl fmriprep container and run this script in there like this:


# bash /scratch/cvl/uqywards/scripts/STIMfMRI/run_fmriprep_wiener.sh


########################################### change this part #################################
subjName=`cat /scratch/cvl/uqywards/scripts/STIMfMRI/subjnames.csv | head -n 20 | tail -n 20`
run_number="1"
###############################################################################################
#each time you can make an addition to the head parameter - so run 2 will be ` head -n 40 | tail -n 20 `
#and so on (it takes the first 40 entries with head and then the last 20 entries with tail)
################################################################################################
#dont touch below this



export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=6
bids_dir="/scratch/cvl/$USER/data/bids"
out_dir="/scratch/cvl/$USER/data/STIMMRI_fmriprep_output"
work_dir="/scratch/cvl/$USER/data/work_dir_${run_number}"
fs_dir="/scratch/cvl/$USER/freesurfer"
base_dir="/scratch/cvl/$USER/data/"
rdm="/afm01/Q1/Q1876/data/derivatives/fmriprep/"

fmriprep --use-syn-sdc --fs-license-file ${fs_dir}/freesurfer.txt \
--output-spaces T1w MNI152NLin2009cAsym fsaverage fsnative \
--skip_bids_validation \
--longitudinal \
--fs-no-reconall \
--nprocs 6 \
--omp-nthreads 6 \
--participant_label ${subjname} \
-w ${work_dir} \
${bids_dir} \
${out_dir} \
participant && \
cd ${base_dir} && \
zip work_dir_${run_number}.zip work_dir_${run_number} && \
mv work_dir_${run_number}.zip ${rdm} && \
echo "done"
