# -----------------------------------------------------------------------------
#
#
# -----------------------------------------------------------------------------

# ...
RPI_USERNAME = pi
RPI_ADDRESS = raspberrypi.local

# rsync that comes with macOS does not support multiple remote sources. Using
# the rsync installed via brew install rsync however does.
RSYNCBIN = /opt/homebrew/opt/rsync/bin/rsync

# ...
project:
	rm -rf build && mkdir build && cd build && \
	cmake -DCMAKE_TOOLCHAIN_FILE=../util/CrossCompile.cmake ..

# ...
sysroot_update:
	# Create symbolik link for lib folder
	cd sysroot && rm -rf lib && ln -s ./usr/lib lib

	# Sync remote folder. This may return some erros due to file permissions
	# but it shouldn't effect anything.
	$(RSYNCBIN) -rzLR --info=progress2 --safe-links \
		$(RPI_USERNAME)@$(RPI_ADDRESS):/usr/lib \
		$(RPI_USERNAME)@$(RPI_ADDRESS):/usr/include \
		$(RPI_USERNAME)@$(RPI_ADDRESS):/usr/share/pkgconfig \
		sysroot

# ...
clean:
	rm -rf build
