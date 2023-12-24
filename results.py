import numpy as np
import os
import matplotlib.pyplot as plt
import pprint
import itertools

def check_AUC(reward_list):
    modified_reward = [reward + 1600 for reward in reward_list]
    return sum(modified_reward) / len(modified_reward)


# Function to compute moving average
def moving_average(data, window_size):
    return np.convolve(data, np.ones(window_size), 'valid') / window_size

folder = "./runs2"

folder_list =  os.listdir(folder)
print(folder)
dic = {}
for f in folder_list :
    idx = f.split('_')[0]
    if idx not in dic.keys():
        dic[idx] = []
    dic[idx].append(f)

def getmeanstd(X,Y) :
    X = np.array(X)
    Y = np.array(Y)
    unique_X = np.unique(X)
    means = [np.mean(Y[X == ux]) for ux in unique_X]
    std_devs = [np.std(Y[X == ux]) for ux in unique_X]
    return unique_X, means,std_devs

idx_list = ['1','2','3','4','5','6']
idx_combinations = []
for i in range(len(idx_list)) :
    if i > 0 :
        idx_combinations.append(list(itertools.combinations(idx_list, i)))

print(1)
def compareAUC(dic):
    UF_list_FQ1 = []
    AUC_list_FQ1=  []
    UF_list_FQ0 = []
    AUC_list_FQ0=  []

    for key, value in dic.items():
        for folder_name in dic[key]:
            idx = folder_name.split('_')[0]
            if idx not in ["2","5"]:
                break
            UR = folder_name.split('_')[14]
            FQ = folder_name.split('_')[18]
            file_name = "UR:" + UR + "/FQ:" + FQ
            if FQ == "1":
                r = np.load(folder + "/" + folder_name + "/reward.npy")
                AUC = check_AUC(r)
                UF_list_FQ1.append(float(UR))
                AUC_list_FQ1.append(AUC)
            elif  FQ == "0":
                r = np.load(folder + "/" + folder_name + "/reward.npy")
                AUC = check_AUC(r)
                UF_list_FQ0.append(float(UR))
                AUC_list_FQ0.append(AUC)
            else :
                raise NotImplemented

    unique_FQ0,means_FQ0,std_devs_FQ0 = getmeanstd(UF_list_FQ0,AUC_list_FQ0)
    unique_FQ1, means_FQ1, std_devs_FQ1 = getmeanstd(UF_list_FQ1, AUC_list_FQ1)

    unique_FQ0 = [x - 0.007 for x in unique_FQ0]
    unique_FQ1 = [x + 0.007 for x in unique_FQ1]

    plt.figure(figsize=(5, 3))
    plt.errorbar(unique_FQ0, means_FQ0, yerr=std_devs_FQ0, fmt='o', color='darkorange', ecolor='#FFD580', elinewidth=3, capsize=0)
    plt.errorbar(unique_FQ1, means_FQ1, yerr=std_devs_FQ1, fmt='o', color='blue', ecolor="#ADD8E6", elinewidth=3,
                 capsize=0)

    plt.xlabel('Update Frequency')
    plt.ylabel('AUC')
    plt.title('["1","2","3"]')
    plt.tight_layout()
    plt.show()

compareAUC(dic)
exit()
for key,value in dic.items():
    dic_key = {}
    for folder_name in dic[key]:
        UR = folder_name.split('_')[14]
        FQ = folder_name.split('_')[18]
        file_name = "UR:" + UR + "/FQ:" + FQ
        #plt.figure(figsize=(10, 6))
        #plt.xlabel('Episode')
        #plt.ylabel('Reward')
        #plt.title('Data Smoothing Using Moving Average')
        if FQ == "1" :
            ep = np.load(folder +"/"+folder_name+"/ep_reward.npy")
            r =  np.load(folder +"/"+folder_name+"/reward.npy")
            window_size = 50  # Number of points for the moving average
            r_smoothed = moving_average(r, window_size)
            AUC = check_AUC(r)

            dic_key[UR] = AUC

            plt.plot(ep, r,label = UR)
        sorted_dict = dict(sorted(dic_key.items()))
    pprint.pprint(sorted_dict)
    plt.xlabel('Episode')
    plt.ylabel('Reward')
    plt.title("Reward")
    plt.legend()
    plt.show()



print(1)




# Smoothing the data


# Plotting
# plt.figure(figsize=(10, 6))
# plt.plot(x, y, label='Original Data', alpha=0.5)
# plt.plot(x_smoothed, y_smoothed, label='Smoothed Data', color='red')
# plt.xlabel('X-axis')
# plt.ylabel('Y-axis')
# plt.title('Data Smoothing Using Moving Average')
# plt.legend()
# plt.show()
