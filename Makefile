packagename := snesdtb
packageversion := 1.0-1
fullname := $(packagename)_$(packageversion)

$(fullname).deb: build downloads

build: downloads
	mkdir -p $(fullname)/usr/local/bin
	mkdir -p $(fullname)/DEBIAN
	cp ./downloads/* $(fullname)/usr/local/bin
	cp ./control $(fullname)/DEBIAN
	dpkg-deb --build $(fullname)

downloads:
	./get-binaries

clean:
	- rm -rf downloads
	- rm -rf $(fullname)
	- rm -f $(fullname).deb 
