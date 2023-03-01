FROM ubuntu
RUN apt-get update  && apt-get upgrade -y
RUN apt-get install libcairo2 libcurl3-gnutls fonts-liberation libgbm1 libgtk-3-0 libxdamage1 libxkbcommon0 xdg-utils libu2f-udev libpango-1.0-0 libu2f-udev libvulkan1 -y
RUN apt-get install wget dpkg -y
RUN apt-get install git -y
RUN apt-get install openjdk-11-jdk -y
RUN apt-get install maven -y
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN apt-get install -f
RUN rm ./google-chrome-stable_current_amd64.deb -f
RUN git --version
RUN git clone https://github.com/gem-vivekanandtiwari/DockerLambdaSample.git
RUN ls
WORKDIR "/DockerLambdaSample"
RUN ls
RUN mvn clean package
RUN java -jar ./target/DockerLambdaSample-1.0-SNAPSHOT-jar-with-dependencies.jar
RUN pwd
RUN ls
RUN java --version
RUN mvn --version
RUN google-chrome --version