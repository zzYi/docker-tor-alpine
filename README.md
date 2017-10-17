# docker-tor-alpine
tor with meek.it still has some warning,help me make it better

meek git from https://github.com/arlolra/meek

goptlib git from https://github.com/Yawning/goptlib/

## Start
build docker 

`docker build -t docker-tor-alpine docker-tor-alpine`

run docker server on 9050

`docker run -p 127.0.0.1:9050:9050 docker-tor-alpine`
