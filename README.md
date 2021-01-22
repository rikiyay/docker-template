## Instructions

You must be in this `ds_template` directory to run these commands.

1. Modify the `environment.yml` file

2.  Grant execution permissions on the shell scripts

> `chmod +x *.sh`

3. Build the image (may take ~ 10 minutes)

> `./build-image.sh`

4. Run a container with the image

> `./run-container.sh`

5. Run a jupyterLab in the container

> `./run-jupyter.sh`

6. Access jupyterLab at `http://localhost:8888` with a token of `mytoken`