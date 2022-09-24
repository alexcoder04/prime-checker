
NAME = prime-checker
TEMP_LUA = out.lua
OUT_FILE = $(NAME).tns
ADD_PATH = /home/alex/Scripts:/home/alex/.local/bin

all: clean build upload

build:
	nspire-merge --out $(TEMP_LUA) gui.lua main.lua
	luna $(TEMP_LUA) $(OUT_FILE)

clean:
	$(RM) $(TEMP_LUA) $(OUT_FILE)

upload:
	PATH=$(ADD_PATH):$(PATH) uploadnspire $(OUT_FILE)

