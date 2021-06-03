import numpy as np 
import pandas as pd 
import matplotlib.pyplot as plt 
import math 
# we define a function to calculate dp and bdp 
def result_cal(aa , bb) :        # 我们需要传入两个列表参数 ：aa , bb 
  aa_squra = [x * x for x in aa] # 返回aa 每一个对象平方后的结果 
  bb_squra = [x * x for x in bb] # 同理，此处针对 bb 操作 
  divisor_aa = math.sqrt(sum(aa_squra))  # 返回的是 
