FROM python:3
USER root

RUN apt update && \
    apt -y install locales jupyter-notebook ruby ruby-ffi-rzmq && \
		localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 && \
		gem install iruby && \
		iruby register --force
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9

CMD ["jupyter-notebook", "--port", "8000", "--ip=0.0.0.0", "--allow-root"]
