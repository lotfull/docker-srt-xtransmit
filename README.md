# 🐳 SRT Docker image

[![docker status](https://dockeri.co/image/Lotfull/srtx)](https://hub.docker.com/r/Lotfull/srtx)

Docker build for [SRT-xtransmit](https://github.com/maxsharabayko/srt-xtransmit) on Alpine. `srt-xtransmit` is a testing utility with support for SRT and UDP network protocols.

- srt-xtransmit
- Alpine 3.13


## Usage

- Pull image and receive live:
```
docker run --rm -p 4200:4200/udp lotfull/srtx:latest srt-xtransmit receive "srt://:4200?transtype=live&rcvbuf=1000000000&sndbuf=1000000000" --msgsize 1316 --statsfile stats-rcv.csv --statsfreq 100ms
```

- Pull image and send (generate) live:
```
docker run --rm --net=host lotfull/srtx:latest srt-xtransmit generate "srt://127.0.0.1:4200?transtype=live&rcvbuf=1000000000&sndbuf=1000000000" --msgsize 1316 --sendrate 15Mbps --duration 10s --statsfile stats-snd.csv --statsfreq 100ms
```
