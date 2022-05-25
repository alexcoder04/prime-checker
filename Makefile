
build:
	nspire-merge --out out.lua gui.lua main.lua
	luna out.lua prime-checker.tns

clean:
	$(RM) out.lua prime-checker.tns

.PHONY: clean build

