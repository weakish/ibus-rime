sharedir = $(DESTDIR)/usr/share
libexecdir = $(DESTDIR)/usr/lib

all: ibus-engine-rime

ibus-engine-rime:
	#if [ ! -e cmake ]; then ln -s ../librime/cmake; fi
	mkdir -p build
	(cd build; cmake .. && make)
	@echo ':)'

install:
	mkdir -p $(sharedir)/ibus/component
	cp rime.xml $(sharedir)/ibus/component/
	mkdir -p $(libexecdir)/ibus-rime
	cp -f build/ibus-engine-rime $(libexecdir)/ibus-rime/
	mkdir -p $(sharedir)/ibus-rime
	#cp -rf data/* $(sharedir)/ibus-rime/
	mkdir -p $(sharedir)/ibus-rime/icons
	cp -f zhung.svg $(sharedir)/ibus-rime/icons/

uninstall:
	rm $(sharedir)/ibus/component/rime.xml
	rm -R $(sharedir)/ibus-rime
	rm -R $(libexecdir)/ibus-rime

clean:
	if  [ -e build ]; then rm -R build; fi
