
build:
	nspire-merge --in ../libnlmsgbox/msgbox.lua ./main.lua
	luna out.lua prime-checker.tns

clean:
	$(RM) out.lua
	$(RM) prime-checker.tns

.PHONY: clean build

