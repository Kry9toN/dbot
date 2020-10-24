FROM ubuntu:focal
LABEL maintainer "Kry9toN <dhimasbagusprayoga@gmail.com>"

# Indonesian timezone (GMT+7)	
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Tidy-up
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
    wget openjdk-8-jdk openssl  git \
    && apt autoremove --yes

RUN git clone -b master https://github.com/Kry9toN/dbot /home/dbot
WORKDIR /home/dbot

CMD ["java", "-Dnogui=true", "-jar", "JMusicBot-0.2.10-Linux.jar"]
