FROM fedora:latest

RUN dnf update -y && dnf install -y curl scala make && dnf clean all
RUN curl -L -O https://piccolo.link/sbt-1.3.3.tgz
RUN tar -xzvf sbt-1.3.3.tgz && rm -f *.tgz && cp /sbt/bin/* /bin && \
	cp -r sbt/lib/* /lib && rm -rf sbt && touch  build.sbt && sbt reload --batch && \
	rm -f build.sbt

CMD ["/bin/bash"]
