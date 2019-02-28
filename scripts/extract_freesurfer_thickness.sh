#!/bin/bash

ml load biology; ml load freesurfer

export SUBJECTS_DIR=/oak/stanford/groups/menon/projects/cdla/2018_longitudinal/subjs/

for hemi in lh rh; do
	for parc in aparc aparc.2009s aparc.DKTatlas40; do 
		aparcstats2table --subjects `ls -d 0* 1* 2* 3* 4*` --meas thickness --hemi ${hemi} --parc ${parc} --tablefile aparc_stats_${parc}_${hemi}.txt; 
done; 
done
