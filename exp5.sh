for futureQ in 0; do
  for lr in 0.0003 0.0007 ;do
    for tau in 0.003;do
      for alpha in 0.05;do
          for pi_update_freq in 5; do
            for FL in 5 10 15 20; do
              for updateratio in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0; do
                echo $lr
                echo $tau
                echo $alpha
                echo $futureQ
                echo $pi_update_freq
                echo $FL
                # echo Dlgusdls96$ | sudo -S sh -c 'echo 1 >/proc/sys/vm/drop_caches' && sudo -S sh -c 'echo 2 >/proc/sys/vm/drop_caches' && sudo -S sh -c 'echo 3 >/proc/sys/vm/drop_caches';
                python main.py --futureQ $futureQ --lr $lr --tau $tau --alpha $alpha --pi_update_freq $pi_update_freq --futurelength FL --updateratio $updateratio ;
              done
			      done
			    done
			done
		done
	done
done

