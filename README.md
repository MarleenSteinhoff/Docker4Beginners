# Docker4Beginners
If you want to learn docker, this repo will help you to build your first container to run a python application. 

# Docker installation
For installing Docker on your PC, just follow the instruction in the offical Docker documentation. They will guide you through the installation process for Linux, Windows, Mac. https://docs.docker.com/get-docker/ 

# Hello World Container
Open a terminal and type "docker run hello-world". 
When you see "Hello World from Docker!" in your terminal, the installation was successfull.

# Pull the code
Pull the code from this repository inside a working directory on your PC. It should then have 5 files in your working directory: fakeNewsDetect.py, requirements.txt, news.csv, Dockerfile and REAMDME.md.

I got the python application and data from here: https://data-flair.training/blogs/advanced-python-project-detecting-fake-news/ 

# Dockerfile explained
---------------------
FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt

COPY fakeNewsDetect.py news.csv ./

CMD [ "python", "./fakeNewsDetect.py"]

--------------------

This Dockerfile will build an Docker image based on the python:3 image (https://hub.docker.com/_/python).

Then it created a working directory with the path /usr/src/app inside the container.

COPY copies the requirements.txt file into the container

RUN installs all the dependencies listed in the requirements.txt file, using the pip3 install command inside the container.

COPY copies the python code and the csv file from your working directory into the working directory of the container (we never left the directory after setting the WORKDIR)

The CMD executes the command "python" in the bash of the container, which opens a python terminal. Then, it runs the fakeNewsDetect.py application.

# Build the Docker image

Open a terminal an navigate to the working directory, where your Dockerfile is.
Run "docker build -t user/pythoncontainer:latest ."
This will build the Docker image from the Dockerfile and tag it with the name "user/pythoncontainer:latest". You can replace "user" with your own name (it's just a convention, not neccessary).

# Run the container

Open a terminal an navigate to the working directory, where your Dockerfile and the other files are.
Run "docker run --rm user/pythoncontainer:latest". Docker will buld a container from the Docker image we just created. --rm will remove the container automatically after the python job is done.
After a short time you will see the output inside the terminal.

Congrats! You ran your first application inside a container!

# Wanna take a look inside?
If you want to take a look how the container looks inside, run "docker run --rm -it user/pythoncontainer:latest /bin/bash" in your terminal. "-it" will start the container in an interactive mode, /bin/bash navigates you directly into the containers bash shell, inside the working directory. Now run "python3 fakeNewsDetect.py" to run the application. Leave the directory with "cd /" and type "ls" to see the directories inside the root directory.
You can leave the container with "exit" or Ctrl + C, Ctrl + D. 
