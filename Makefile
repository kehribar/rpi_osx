# -----------------------------------------------------------------------------
#
#
# -----------------------------------------------------------------------------

# ...
RSYNCBIN = /opt/homebrew/opt/rsync/bin/rsync
RPI_USERNAME = pi
RPI_ADDRESS = raspberrypi.local

# ...
project:
	rm -rf build && cd build && cmake -DCMAKE_TOOLCHAIN_FILE=../CrossCompile.cmake ..

# ...
clean:
	rn -rf build

# ...
update_sysroot:
	$(RSYNCBIN) -rzLR --info=progress2 --safe-links \
		$(RPI_USERNAME)@$(RPI_ADDRESS):/usr/lib \
		$(RPI_USERNAME)@$(RPI_ADDRESS):/usr/include \
		$(RPI_USERNAME)@$(RPI_ADDRESS):/usr/share/pkgconfig \
		sysroot

	cd sysroot && rm -rf lib && ln -s ./usr/lib lib
