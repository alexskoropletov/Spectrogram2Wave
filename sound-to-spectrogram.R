library(tuneR)
library(seewave)

songObject <- readWave("song.wav")
print(songObject)

songSpectrogram <- spectro(songObject, plot = FALSE, complex = TRUE, norm = FALSE, dB = NULL)
print(songSpectrogram)
dput(songSpectrogram, file = "spectrogram.txt")

newSongObject <- istft(songSpectrogram$amp, f=songObject@samp.rate, ovlp=50, wl=512, output = "Wave")
savewav(newSongObject, file="new_song.wav")