

FROM python:3.8-slim-buster

WORKDIR /appeferf

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
sd
COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
