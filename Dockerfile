FROM public.ecr.aws/lambda/java:11

RUN yum clean all
RUN yum install -y wget unzip libX11
RUN yum list |grep -i chrome

RUN yum install -y xorg-x11-drv-openchrome.x86_64

#RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#    ls \
#    && \
#    yum install -y ./google-chrome-stable_current_amd64.deb
#RUN ls
#RUN mv -i google-chrome-stable_current_amd64.deb /usr/local/bin/
#RUN yum install -y /usr/local/bin/google-chrome-stable_current_amd64.deb
#RUN ls

RUN CHROME_DRIVER_VERSION =`curl -sS https://chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

RUN ls

COPY target/DockerLambdaSample-1.0-SNAPSHOT-jar-with-dependencies.jar ${LAMBDA_TASK_ROOT}/lib/

RUN cd lib

RUN ls

RUN java -jar ${LAMBDA_TASK_ROOT}/lib/DockerLambdaSample-1.0-SNAPSHOT-jar-with-dependencies.jar

RUN ls
#COPY target/dependency/* ${LAMBDA_TASK_ROOT}/lib/

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile2)
CMD [ "org.example.LambdaHandler::handleRequest"]