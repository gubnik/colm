SCRIPT=colm

install: $(SCRIPT).sh
	cp $(SCRIPT).sh $(SCRIPT)
	chmod +x $(SCRIPT)
	install $(SCRIPT) /bin

uninstall:
	rm -f /bin/$(SCRIPT)
