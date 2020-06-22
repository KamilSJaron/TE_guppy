# define $DATADIR and $DATABASE before/when calling this script, e.g.:


# qsub -v DATADIR=/data/charlesworth/guppy/analyses/database/47731/ -v DATABASE=guppy -cwd -N Repeatmodeler -V -pe smp 50 -b yes 'bash repeatmodeler1.sh'


WORKDIR=/scratch/$USER/repeatmodeler/$JOB_ID
MY_DATA_DIR=/data/charlesworth/guppy/analyses/repeatmodeler
  mkdir -p $WORKDIR
  cp -r $DATADIR $WORKDIR
  cd $WORKDIR/47731
  /ceph/software/repeatmodeler/RepeatModeler.v2.0.1/RepeatModeler -engine ncbi -pa 32 -database $DATABASE
  cd $MY_DATA_DIR
  rsync -avhP /scratch/$USER/repeatmodeler/$JOB_ID . && rm -r  /scratch/$USER/repeatmodeler/$JOB_ID && touch repeatmodeler.done

  # 47617 is unmasked database(all uppercase)
  # 47225 is masked database(with lowercase softmask)