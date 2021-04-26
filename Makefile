LIBS = `pkg-config --libs gtk+-3.0 gobject-2.0 gdk-pixbuf-2.0 x11`
CFLAGS = `pkg-config --cflags gtk+-3.0 gobject-2.0 gdk-pixbuf-2.0 x11`

SOURCE := src/main.c src/systray-box.c src/systray-manager.c src/systray-marshal.c src/systray-socket.c src/systray.c

OBJS = ${SOURCE:.c=.o}
EXECUTABLE := gtk3-systray

.PHONY: all
all: $(EXECUTABLE)

.PHONY: clean
clean:
	$(RM) $(EXECUTABLE) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(EXECUTABLE): $(OBJS)
	$(CC) -s $(CFLAGS) $^ $(LIBS) -lm -o $@