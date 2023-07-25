# Dockerfile
# DO NOT MODIFY THIS FILE
FROM tiangolo/uwsgi-nginx-flask:python3.8

# These will be replace d in the automatic deployment process
ENV LISTEN_PORT opsport 80
ENV PYTHONUNBUFFERED 1
EXPOSE 80

COPY ./app /app

RUN apt-get update
RUN apt-get install libatlas3-base libgfortran5
RUN apt-get install ffmpeg libsm6 libxext6 python3-dev -y
RUN apt-get install gcc musl-dev -y
RUN pip install numpy==1.19.5
RUN pip install opencv-python==4.5.1.48
RUN pip install -r requirements.txt
RUN pip list
CMD ["python", "/app/main.py"]