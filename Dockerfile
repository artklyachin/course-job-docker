FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    python3-pip \
    git \
    clang-tidy \
    clang-format 

WORKDIR /home/root

COPY . .
RUN rm -rf .git*
# RUN git clone https://github.com/ads-course-spring-2024/course-settings/ 
RUN git clone https://github.com/artklyachin/course-settings/ 
RUN pip3 install -r course-settings/requirements.txt

RUN cp ./course-settings/clang-format.json .clang-format
RUN cp ./course-settings/clang-tidy.json .clang-tidy

ENV GITHUB_TOKEN=""
ENV GITHUB_HEAD_REF=""

CMD ["python3", "course-settings/checker/main.py"]
# CMD ["/bin/bash"]

# docker build -t checker-image .
# docker run -it checker-image 
