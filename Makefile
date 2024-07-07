SCRIPT=colm

install: $(SCRIPT).sh
	cp $(SCRIPT).sh $(SCRIPT)
	chmod +x $(SCRIPT)
	install $(SCRIPT) /bin
