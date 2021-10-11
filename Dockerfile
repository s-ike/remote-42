FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y \
        bash \
        clang-9 \
        curl \
        git \
        libbsd-dev \
        libssl-dev \
        libx11-dev \
        libxext-dev \
        lldb \
        llvm \
        make \
        python-pip \
        python3-pip \
        python3.8 \
        valgrind \
        vim \
        x11proto-core-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR "/work/"

# # Install norminette
RUN set -eux; \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1; \
    python3 -m pip install --upgrade pip setuptools; \
    python3 -m pip install norminette==3.3.2

# # Install 42header vim plugin
RUN set -eux; \
    mkdir -p ~/.vim/plugin/; \
    curl -o ~/.vim/plugin/stdheader.vim https://raw.githubusercontent.com/42Paris/42header/master/vim/stdheader.vim;

# # Alias gcc to clang to reflect mac behavior
RUN set -eux; \
    echo "alias clang='clang-9'" >> ~/.bashrc; \
    echo "alias gcc='clang'" >> ~/.bashrc

ENTRYPOINT ["/bin/bash"]
