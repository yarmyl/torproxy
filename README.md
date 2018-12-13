# torproxy

## BUILD

docker build -t tor .

## RUN

docker run --name tor --net host -d tor
