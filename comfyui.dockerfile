FROM artcoding/python:3.12.9-ubuntu
COPY . /home/app/comfyui

RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu126

RUN cd /home/app/comfyui && pip3 install -r requirements.txt
WORKDIR /home/app/comfyui
CMD [ "python", "main.py", "--listen","0.0.0.0" ]
