#ELM_FLAGS = --optimize
ELM_FLAGS =
SRC_DIR = ./src
TARGET = helloworld.js

target: $(TARGET)

env:
	npm install

$(SRC_DIR)/elm.js: $(SRC_DIR)/Main.elm
	npm run-script elm -- make src/Main.elm --output $(SRC_DIR)/elm.js $(ELM_FLAGS)

$(TARGET): $(SRC_DIR)/worker.js $(SRC_DIR)/elm.js
	npm run-script browserify -- $(SRC_DIR)/worker.js --outfile $(TARGET)

run:
	node $(TARGET)

clean:
	rm $(TARGET)
	rm $(SRC_DIR)/elm.js

reset:
	rm $(TARGET)
	rm $(SRC_DIR)/elm.js
	rm -r node_modules
	rm -r elm-stuff

