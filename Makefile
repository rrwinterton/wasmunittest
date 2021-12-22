#example unit test makefile
PROJECT_NAME = main
EXECUTABLE_NAME = main

#emcc compiler
CXX = emcc

#basic compiler flags
CXXFLAGS = -s FETCH=1 -s STANDALONE_WASM=1 -s WASM=2 -O3 -s -msimd128 -s ASSERTIONS=1 -s WASM_BIGINT \
	-s EXPORTED_FUNCTIONS='["_UnitTest1", "_main"]' \
	-s EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'
D8 = d8
D8FLAGS = --no-wasm-async-compilation

SRCS = main.cpp
HEADERS = 

all: $(EXECUTABLE_NAME).js $(EXECUTABLE_NAME).wasm

$(EXECUTABLE_NAME).js $(EXECUTABLE_NAME).wasm: $(SRCS) $(HEADERS)
	export EMCC_WASM_BACKEND=2
	$(CXX) --bind $(SRCS) $(CXXFLAGS) -o $(EXECUTABLE_NAME).js

run: $(EXECUTABLE_NAME).js $(EXECUTABLE_NAME).wasm
	$(D8) $(D8FLAGS) $(EXECUTABLE_NAME).js

clean:
	 rm -f $(EXECUTABLE_NAME).js $(EXECUTABLE_NAME).wasm $(EXECUTABLE_NAME).js.mem $(EXECUTABLE_NAME).wasm.js

.PHONY: all run clean
