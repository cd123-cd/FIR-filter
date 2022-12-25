import numpy as np

def fir_filter(signal, coefficients):
    # 初始化输出信号
    filtered_signal = np.zeros(len(signal))
    # 循环遍历每个输入信号样本
    for i in range(len(signal)):
        # 循环遍历每个系数
        for j in range(len(coefficients)):
            # 如果当前信号样本存在
            if i-j >= 0:
                # 计算卷积
                filtered_signal[i] += coefficients[j] * signal[i-j]
    return filtered_signal
import scipy.signal

# 生成低通滤波器系数
cutoff_frequency = 300  # 截止频率 (Hz)
sample_rate = 44100  # 采样率 (Hz)
coefficients = scipy.signal.firwin(51, cutoff_frequency, fs=sample_rate)
import wave

# 打开 .wav 文件
with wave.open("1.wav", "rb") as wav_file:
    # 读取 .wav 文件的格式信息
    sample_rate = wav_file.getframerate()
    sample_width = wav_file.getsampwidth()
    num_channels = wav_file.getnchannels()
    # 读取 .wav 文件的 PCM 数据
    pcm_data = wav_file.readframes(wav_file.getnframes())

# 将 PCM 数据解码为浮点数组
signal = np.frombuffer(pcm_data, dtype=np.int16) / (2**(sample_width * 8 - 1))

# 调用 FIR 过滤器函数
filtered_signal = fir_filter(signal, coefficients)
import wave

# 将过滤后的信号编码为 PCM 格式
pcm_data = (filtered_signal * (2**15 - 1)).astype(np.int16)

# 创建 wave 写入器
with wave.open("filtered.wav", "wb") as wav_file:
    # 设置 .wav 文件的格式信息
    wav_file.setframerate(sample_rate)
    wav_file.setsampwidth(2)
    wav_file.setnchannels(1)
    # 写入 PCM 数据
    wav_file.writeframes(pcm_data)
