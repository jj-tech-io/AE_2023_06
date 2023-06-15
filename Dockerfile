FROM tensorflow/tensorflow:latest-gpu
WORKDIR /AE_2023_06  # This specifies the directory to work
COPY requirements.txt ./requirements.txt
RUN apt-get update && apt-get install -y libgl1-mesa-glx
RUN pip install --upgrade pip
RUN pip install --upgrade -r requirements.txt
COPY . .
EXPOSE 8888
ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root","--no-browser"]
#run in vscode terminal
# CMD ["jupyter", "lab","--ip=-0,0,0,0","--allow-root","--no-browser"]
# #to build
# docker build .
# #to run
# docker-compose up
# #to stop
# docker-compose down

##build without cache
#docker-compose build --no-cache

##build and run
#docker-compose up --build