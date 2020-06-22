# qsub -v DATADIR=/data/charlesworth/guppy/analyses/repeatmodeler/47620/ -v SEQFILE=guppy-families.fa -cwd -N DeepTE -V -pe smp 32 -b yes 'bash deepTE.sh'


WORKDIR=/scratch/$USER/DeepTE/$JOB_ID
MY_DATA_DIR=/data/charlesworth/guppy/analyses/deepTE
  mkdir -p $WORKDIR
  cp $DATADIR/$SEQFILE $WORKDIR
  cd $WORKDIR
  # -sp  P or M or F or O. P:Plants, M:Metazoans, F:Fungi, and O: Others.
  # -i   Input sequences that are unknown TE or DNA sequences.
  # 
  python /ceph/users/kyang/bin/DeepTE-master/DeepTE.py -i $SEQFILE -sp M -m_dir /ceph/users/kyang/bin/DeepTE-master/Metazoans_model/
  cd $MY_DATA_DIR
  rsync -avhP /scratch/$USER/DeepTE/$JOB_ID . && rm -r  /scratch/$USER/DeepTE/$JOB_ID && touch repeatmodeler.done

