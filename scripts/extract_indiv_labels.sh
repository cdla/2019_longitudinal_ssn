#!/bin/bash

ml load biology; ml load freesurfer

export SUBJECTS_DIR=/oak/stanford/groups/menon/projects/cdla/2018_longitudinal/subjs/

OUTDIR=/oak/stanford/groups/menon/projects/cdla/2018_longitudinal/ssn/data/indiv_labels

cd ${OUTDIR}

for subj in `cd ${SUBJECTS_DIR}; ls -d 0* 1* 2* 3* 4*`; do
    echo "working on subj ${subj}"
    for parc in aparc aparac.a2009s aparc.DKTatlas40; do
        echo "working on parc ${parc}"
        for hemi in lh rh; do

            mkdir -pv ${OUTDIR}/${subj}/${parc}
            mri_annotation2label --subject ${subj} --hemi ${hemi} --outdir ${OUTDIR}/${subj}/${parc} \
            --labelbase ${hemi}_${parc}_label

        done
    done
done;
