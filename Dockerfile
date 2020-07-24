FROM centos

WORKDIR /root

RUN yum update -y && yum group install -y "Development Tools"

RUN yum install -y wget cmake valgrind vim gdb net-tools tmux

RUN echo 'alias ls="ls --color"' >> ~/.bashrc
COPY .tmux.conf /root
# java-1.8.0-openjdk-devel maven

# ENV LC_CTYPE="en_US.UTF-8"
# Set the locale
# RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
#     locale-gen
# ENV LANG=en_US.UTF-8  
# ENV LANGUAGE=en_US:en  
# ENV LC_ALL=en_US.UTF-8 

ENV TZ="Asia/Shanghai"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["/bin/bash"]
