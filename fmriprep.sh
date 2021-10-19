screen singularity run -B $HOME/scratch/tmp:/tmp \
--cleanenv my_images/fmriprep-latest.simg bids preprocessed participant \
--t2s-coreg --use-syn-sdc --fs-license-file freesurfer.txt --output-spaces T1w MNI152NLin2009cAsym \
fsaverage fsnative --use-aroma --skip_bids_validation --fs-no-reconall
