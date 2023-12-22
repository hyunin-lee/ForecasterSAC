import numpy as np
import matplotlib.pyplot as plt
folder = "runs/2023-12-22_08-48-54_SAC_HalfCheetah-v2_tau_0.003_lr_0.0003_alp_0.05_PIfreq_5_UR_0.2_FL_10_fQ_1_NSr_1"

ep = np.load(folder +"/ep_reward.npy")
r = np.load(folder +"/reward.npy")
critic1_loss = np.load(folder +"/critic1_loss.npy")

plt.plot(ep,r)
plt.xlabel("episode")
plt.ylabel("reward")
plt.show()
