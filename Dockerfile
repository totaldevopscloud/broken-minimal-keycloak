FROM python:3.8-slim

WORKDIR /app

COPY app/.flaskdotenv app/app.py app/requirements.txt  ./

COPY wsgi.py ./

RUN pip install --no-cache-dir -r ./requirements.txt
ENV FLASK_ENV production


CMD [ "gunicorn" , "-w" , "4",  "-b" , ":8000" , "app:app" ]
#ENV PYTHONUNBUFFERED=1
#RUN mkdir /var/www
#COPY requirements.txt /var/www/
#RUN cd /var/www && \
#    python3 -m pip install -r requirements.txt
#COPY app.py .
#ENTRYPOINT ["gunicorn", "app:app", "--bind=0.0.0.0:8000", "--workers=4", "--log-level=debug", "--reload"]
