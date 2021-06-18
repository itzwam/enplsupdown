.PHONY: install compress

ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

all:
	@echo lolilol

install:
	install -d $(DESTDIR)$(PREFIX)/bin/
	install -m 750 networking $(DESTDIR)$(PREFIX)/bin/enplsupdown
	install -d $(DESTDIR)$(PREFIX)/share/
	install -d $(DESTDIR)$(PREFIX)/share/enplsupdown/
	install -d $(DESTDIR)$(PREFIX)/share/enplsupdown/plugins
	install -m 640 plugins/* $(DESTDIR)$(PREFIX)/share/enplsupdown/plugins/
	install -d $(DESTDIR)/etc/plsnetwork
	install -d $(DESTDIR)/etc/plsnetwork/interfaces
	install -d $(DESTDIR)/etc/plsnetwork/auto

install_service:
	install -d $(DESTDIR)/etc
	install -d $(DESTDIR)/etc/systemd
	install -d $(DESTDIR)/etc/systemd/system
	install -m 640 systemd/enplsupdown.service $(DESTDIR)/etc/systemd/system/

compress:
	tar -cvzf ./enplsupdown_linux_all.tar.gz .

clean:
	rm -v ./enplsupdown_linux_*.tar.gz