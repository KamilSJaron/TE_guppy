# define $DATADIR and $DATABASE before/when calling this script, e.g.:


# qsub -v DATADIR=/data/charlesworth/guppy/raw/PacBio_male/ -v SEQFILE=guppy_pacbio_male.unmasked.fasta -v DATABASE=guppy -cwd -N Repeatmodeler_Database -V -pe smp 32 -b yes 'bash database.sh'

# 46165 without define engine
# 47115 engine ncbi

WORKDIR=/scratch/$USER/repeatmodeler_database/$JOB_ID
MY_DATA_DIR=/data/charlesworth/guppy/analyses/database
  mkdir -p $WORKDIR
  cp $DATADIR/$SEQFILE $WORKDIR
  cd $WORKDIR
  /ceph/software/repeatmodeler/RepeatModeler.v2.0.1/BuildDatabase -engine ncbi -name $DATABASE $SEQFILE  
  cd $MY_DATA_DIR
  rsync -avhP /scratch/$USER/repeatmodeler_database/$JOB_ID . && rm -r  /scratch/$USER/repeatmodeler_database/$JOB_ID && touch repeatmodeler_database.done