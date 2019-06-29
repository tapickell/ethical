for n in $(seq 0 255); do
  sh -c "sudo arping -c 1 -I wlp3s0 10.0.1.$n"
done
