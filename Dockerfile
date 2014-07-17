FROM ubuntu:trusty
MAINTAINER Ocsigen Team <dev@ocsigen.org>
RUN apt-get -y update
RUN apt-get --no-install-recommends -y install adduser ca-certificates opam ocaml camlp4-extra wget curl sudo pkg-config git build-essential m4 unzip libpcre3-dev libssl-dev libsqlite3-dev
RUN adduser --disabled-password --gecos "" opam
RUN passwd -l opam
ADD opamsudo /etc/sudoers.d/opam
RUN chmod 440 /etc/sudoers.d/opam
RUN chown root:root /etc/sudoers.d/opam
USER opam
ENV HOME /home/opam
ENV OPAMVERBOSE 1
ENV OPAMYES 1
WORKDIR /home/opam
USER opam
RUN opam init
RUN opam repository add ocsigendev https://github.com/ocsigen/opam-ocsigen.git
RUN opam update
RUN opam install camlp4 eliom js_of_ocaml ocsigenserver
