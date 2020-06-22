FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt

COPY fakeNewsDetect.py news.csv ./

CMD [ "python", "./fakeNewsDetect.py"]
