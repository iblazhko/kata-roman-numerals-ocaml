FROM ubuntu:jammy as opam-base
RUN apt-get update && \
    apt-get upgrade -y && \
    apt install apt-utils -y && \
    apt install gcc build-essential curl unzip bubblewrap opam -y

# In case latest OPAM is needed:
# RUN curl -fsSL -o /tmp/opam-install.sh https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh && \
#     chmod +x /tmp/opam-install.sh && \
#     echo "" | /tmp/opam-install.sh && \
#     rm /tmp/opam-install.sh

FROM opam-base as ocaml-dev
RUN useradd -ms /bin/bash ocaml-dev
USER ocaml-dev
WORKDIR /home/ocaml-dev
RUN /bin/yes | opam init --disable-sandboxing && \
    eval $(opam env) && \
    opam switch create 5.0.0 --jobs=1 && \
    eval $(opam env --switch=5.0.0) && \
    opam install ocaml-lsp-server ocamlformat alcotest -y
