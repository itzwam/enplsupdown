.PHONY: compress install install_service  

ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

all:
	@echo This is bash dont need to compile anything

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

install_systemd:
	install -d $(DESTDIR)/etc
	install -d $(DESTDIR)/etc/systemd
	install -d $(DESTDIR)/etc/systemd/system
	install -m 640 systemd/enplsupdown.service $(DESTDIR)/etc/systemd/system/

install_dhcpcd:
	install -d $(DESTDIR)/usr
	install -d $(DESTDIR)/usr/lib
	install -d $(DESTDIR)/usr/lib/dhcpcd
	install -d $(DESTDIR)/usr/lib/dhcpcd/dhcpcd-hooks
	install -m 750 dhcpcd/40-wireguard $(DESTDIR)/usr/lib/dhcpcd/dhcpcd-hooks/

.PHONY: compress
compress:
	tar --exclude='./.git' --exclude='*.tar.gz' -cvzf ./enplsupdown_linux_all.tar.gz .

.PHONY: clean
clean:
	rm -v ./enplsupdown_linux_*.tar.gz