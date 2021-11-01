
build:
	nspire-merge --in ./main.lua --out out.lua
	luna out.lua prime-checker.tns

clean:
	$(RM) out.lua
	$(RM) prime-checker.tns

.PHONY: clean build

