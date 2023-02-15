FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev ffmpeg libsm6 libxext6 libxrender-dev
WORKDIR /server
ADD iWebLens_server.py /server
ADD yolo_tiny_configs/coco.names /server
ADD yolo_tiny_configs/yolov3-tiny.cfg /server
ADD yolo_tiny_configs/yolov3-tiny.weights /server
COPY requirements.txt requirements.txt
COPY . /server

RUN pip install --upgrade pip
RUN pip3 install opencv-python
RUN pip3 install flask
RUN pip3 install --upgrade numpy
RUN pip3 install -r requirements.txt


CMD ["python3", "/server/iWebLens_server.py", "yolo_tiny_configs/"]