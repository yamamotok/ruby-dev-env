#!/usr/bin/env bash

IMAGE_NAME='yamamotok/ruby-dev-env'
CONTAINER_NAME='ruby_dev_env'

build() {
    docker build -t ${IMAGE_NAME} .
    if [ $1 -a $1 == 'push' ]; then
        docker push ${IMAGE_NAME}
    fi
}

run() {
    docker rm -f ${CONTAINER_NAME}
    docker run -d -p 2222:22 -p 3000:3000 --name ${CONTAINER_NAME} ${IMAGE_NAME}
    sleep 2
    echo -e 'user:password' | docker exec -i ${CONTAINER_NAME} chpasswd
    echo 'Try `ssh user@localhost -p 2222` (password is "password")'
}

commit() {
    docker commit ${CONTAINER_NAME} "${IMAGE_NAME}:temp"
    if [ $1 -a $1 == 'push' ]; then
        docker push "${IMAGE_NAME}:temp"
    fi
}

if [ $1 -a $1 == "build" ]; then
    if [ $2 -a $2 == "push" ]; then
        build 'push'
    else
        build
    fi
    build
elif [ $1 -a $1 == "run" ]; then
    if [ $2 -a $2 == "pull" ]; then
        docker pull ${IMAGE_NAME}
    fi
    run
elif [ $1 -a $1 == "commit" ]; then
    if [ $2 -a $2 == "push" ]; then
        commit 'push'
    fi
    commit
else
    echo 'Usage: ./main.sh (build|run|commit)'
fi
