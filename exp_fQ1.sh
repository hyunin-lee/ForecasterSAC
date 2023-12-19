# python main.py --lr 0.0005 --futureQ True; 
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --lr 0.0007 --futureQ True;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --lr 0.0009 --futureQ True;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --lr 0.0005 --futureQ False;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --lr 0.0007 --futureQ False;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --lr 0.0009 --futureQ False;

# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --tau 0.003 --futureQ True;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --tau 0.007 --futureQ True;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --tau 0.009 --futureQ True;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --tau 0.003 --futureQ False;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --tau 0.007 --futureQ False;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --tau 0.008 --futureQ False;

# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --alpha 0.05 --futureQ True;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --alpha 0.10 --futureQ True;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --alpha 0.15 --futureQ True;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --alpha 0.05 --futureQ False;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --alpha 0.10 --futureQ False;
# sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
# python main.py --alpha 0.15 --futureQ False;

for futureQ in 1; do
  for lr in 0.0003 0.0007;do
    for tau in 0.003 ;do
      for alpha in 0.05 ;do
          for pi_update_freq in 5 10 20 ; do
            for updateratio in 0.2 0.4 0.6 0.8 ; do
              echo $lr
              echo $tau
              echo $alpha
              echo $futureQ
              echo $pi_update_freq
              # echo Dlgusdls96$ | sudo -S sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo -S sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo -S sh -c 'echo 3 >/proc/sys/vm/drop_caches';
              python main.py --lr $lr --tau $tau --alpha $alpha --futureQ $futureQ --pi_update_freq $pi_update_freq --updateratio $updateratio ;
			      done
			    done
			done
		done
	done
done
