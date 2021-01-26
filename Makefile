BASE_DIR=$(shell pwd)
INSTALL_DIR=${BASE_DIR}/llvm-install
CONFIG_LLVM=--prefix=${INSTALL_DIR} CC=gcc CXX=g++ --enable-shared --enable-optimized --with-optimize-option=-O3 

all: build env

clean:
	rm -rf llvm

build: 
	mkdir -p llvm-objects &&\
	cd llvm-objects &&\
	/usr/bin/cmake ../llvm &&\
	/usr/bin/cmake --build . &&\
	/usr/bin/cmake -DCMAKE_INSTALL_PREFIX=../llvm-install/ -P cmake_install.cmake

env: llvmEnv

llvmEnv: 
	echo '##########################' > llvmEnv &&\
	echo '#   LLVM ENV VARIABLES   # ' > llvmEnv &&\
	echo '##########################' > llvmEnv &&\
	echo 'export LLVM_DIR=${BASE_DIR}' >> llvmEnv &&\
	echo 'export LLVM_SRC=${BASE_DIR}/llvm' >> llvmEnv &&\
	echo 'export LLVM_SRC_ROOT=${BASE_DIR}/llvm' >> llvmEnv &&\
	echo 'export LLVM_ROOT=${BASE_DIR}/llvm' >> llvmEnv &&\
	echo 'export LLVM_OBJ=${BASE_DIR}/llvm-objects' >> llvmEnv &&\
	echo 'export LLVM_OBJ_DIR=${BASE_DIR}/llvm-objects' >> llvmEnv &&\
	echo 'export LLVM_OBJ_ROOT=${BASE_DIR}/llvm-objects' >> llvmEnv &&\
	echo 'export LLVM_INSTALL_DIR=${BASE_DIR}/llvm-install' >> llvmEnv &&\
	echo 'export PATH=$$LLVM_INSTALL_DIR/bin:$$PATH' >> llvmEnv &&\
	cp llvmEnv ~/.llvmEnv  &&\
	echo "source ~/.llvmEnv" >> ~/.bashrc

