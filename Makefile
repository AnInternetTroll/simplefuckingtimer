override PREFIX ?= /usr/local

override CXX ?= g++

override CXXFLAGS ?= -O2 -Wall -Wextra -Werror
override CXXFLAGS += -std=c++11 -Iinclude

LD_FLAGS := $(shell pkg-config --libs-only-L sdl2 SDL2_ttf x11 fontconfig)
LD_LIBS := $(shell pkg-config --libs-only-l sdl2 SDL2_ttf x11 fontconfig) -lstdc++ -pthread

SRC := src/main.cpp src/timer.cpp src/hotkeys.cpp
OBJ := $(SRC:.cpp=.o)

all: simplefuckingtimer

simplefuckingtimer: $(OBJ)
	$(CXX) $(CXXFLAGS) $(LD_FLAGS) -o $@ $(OBJ) $(LD_LIBS)

clean:
	rm -f $(OBJ) simplefuckingtimer

install: simplefuckingtimer
	install -Dm755 simplefuckingtimer $(DESTDIR)$(PREFIX)/bin/simplefuckingtimer
	install -Dm644 assets/sft-logo-256.png $(DESTDIR)$(PREFIX)/share/pixmaps/sft-logo-256.png
	install -Dm644 simplefuckingtimer.desktop $(DESTDIR)$(PREFIX)/share/applications/simplefuckingtimer.desktop

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/simplefuckingtimer
	rm -f $(DESTDIR)$(PREFIX)/share/pixmaps/sft-logo-256.png
	rm -f $(DESTDIR)$(PREFIX)/share/applications/simplefuckingtimer.desktop
