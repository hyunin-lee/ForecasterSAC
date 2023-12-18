import math
import torch
import numpy as np


def NSgenerator(ep):
    v_d = 1.0 + 0.2 * np.sin(0.001 * ep)
    return v_d

def compute_weight_X(past_length) :
    for i in range(past_length):
        if i == 0 :
            X = np.array([[i+1,1]])
        else :
            X = np.concatenate((X,np.array([[i+1,1]])),0)
    y = np.matmul(np.transpose(X), X)
    y_inv = np.linalg.inv(y)
    return torch.FloatTensor(np.matmul(y_inv,np.transpose(X)))

def create_log_gaussian(mean, log_std, t):
    quadratic = -((0.5 * (t - mean) / (log_std.exp())).pow(2))
    l = mean.shape
    log_z = log_std
    z = l[-1] * math.log(2 * math.pi)
    log_p = quadratic.sum(dim=-1) - log_z.sum(dim=-1) - 0.5 * z
    return log_p

def logsumexp(inputs, dim=None, keepdim=False):
    if dim is None:
        inputs = inputs.view(-1)
        dim = 0
    s, _ = torch.max(inputs, dim=dim, keepdim=True)
    outputs = s + (inputs - s).exp().sum(dim=dim, keepdim=True).log()
    if not keepdim:
        outputs = outputs.squeeze(dim)
    return outputs

def soft_update(target, source, tau):
    for target_param, param in zip(target.parameters(), source.parameters()):
        target_param.data.copy_(target_param.data * (1.0 - tau) + param.data * tau)

def hard_update(target, source):
    for target_param, param in zip(target.parameters(), source.parameters()):
        target_param.data.copy_(param.data)
