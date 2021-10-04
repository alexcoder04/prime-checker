
build:
	luna main.lua prime-checker.tns

clean:
	$(RM) out.lua
	$(RM) prime-checker.tns

.PHONY: clean build

