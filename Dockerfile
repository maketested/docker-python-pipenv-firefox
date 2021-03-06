FROM circleci/python:3.6.3-stretch-browsers

# Pipenv

RUN sudo pip install pipenv==8.3.2 && \
pipenv --version

# Firefox

RUN sudo wget https://ftp.mozilla.org/pub/firefox/releases/55.0/linux-x86_64/en-US/firefox-55.0.tar.bz2 && \
sudo tar -xjf firefox-55.0.tar.bz2 && \
sudo rm -rf /opt/firefox* && \
sudo rm firefox-55.0.tar.bz2 && \
sudo mv firefox /opt/firefox55 && \
sudo ln -sf /opt/firefox55/firefox-bin /usr/bin/firefox && \
firefox --version

RUN curl -L https://github.com/mozilla/geckodriver/releases/download/v0.19.0/geckodriver-v0.19.0-linux64.tar.gz \
| sudo tar xz -C /usr/local/bin && \
geckodriver --version
