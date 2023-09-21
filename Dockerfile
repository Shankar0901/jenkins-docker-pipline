FROM python
RUN pip install flask
WORKDIR /the/workdir/path
COPY App.py .
EXPOSE 5000
ENTRYPOINT [ "python" , "App.py" ]
