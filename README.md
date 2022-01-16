# note
Minecraft bedrock-server dockerfile.

# use

## step 1:build docker
```
docker build -t mountcloud.org/mcbedrock-server:1.0 .
```

## step 2:download linux server
https://www.minecraft.net/zh-hans/download/server/bedrock

## step 3:unzip linux server
demo：
```
unzip -d bedrock-server bedrock-server-1.18.2.03.zip
```

## step 4:run docker
My Server path is:/data/game/mc/bedrock-server

19132 and 19133 is server.properties port!
```
docker run -d --name mc-bedrock-server -p 19132:19132/udp -p 19133:19133/udp -v /data/game/mc/bedrock-server:/bedrock-server mountcloud.org/mcbedrock-server:1.0
```

# Operation and maintenance

## in docker
```
docker exec -it mc-bedrock-server /bin/bash
```

## open game server console
```
tmux attach -t mc-server
```
