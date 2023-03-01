FROM ubuntu
RUN apt-get update  && apt-get upgrade -y && apt-get install libcairo2 libcurl3-gnutls fonts-liberation libgbm1 libgtk-3-0 libxdamage1 libxkbcommon0 xdg-utils libu2f-udev libpango-1.0-0 libu2f-udev libvulkan1 get dpkg openjdk-11-jdk maven git  -y

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&  dpkg -i google-chrome-stable_current_amd64.deb &&  rm ./google-chrome-stable_current_amd64.deb -f
RUN git --version && git clone https://github.com/gem-vivekanandtiwari/DockerLambdaSample.git && ls
WORKDIR "/DockerLambdaSample"
RUN ls && mvn clean install && java -jar ./target/DockerLambdaSample-1.0-SNAPSHOT-jar-with-dependencies.jar
RUN pwd
RUN ls
RUN java --version
RUN mvn --version
RUN google-chrome --version

