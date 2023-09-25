# Docker image for Code Composer Studio
This is a Docker image that manages Code Composer Studo instalation. It also allows to import project from remote repository and build.

## Build docker image
To build docker image from the Dockerfile run the following command:
``````
docker buildx build -t ccs_image .
``````

## Run docker image in container
To run the built image run the following command:
``````
docker run -it --name ccs_container ccs_image /bin/bash
``````
this command will create the docker container *ccs_container* from the image *ccs_image* then run it.
It will run in interactive mode (-i) and will open a **/bin/bach** terminal (-t) to acess the file system.

## Stop the running
Running in interative mode will keep the container running. To stop it run the following command in the terminal shell:
``````
exit
``````

## Run after stopping 
If you wish to run the caontainer once it was stoped, you can do it with the command:
``````
docker start -ai css_container
``````