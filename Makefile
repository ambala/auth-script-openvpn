CC		:= gcc
CFLAGS	:= -std=c99 -Wall -Wextra
LDFLAGS	:= -fPIC -shared

all: plugin

plugin: auth_script.c
	$(CC) $(CFLAGS) $(LDFLAGS) -I. -c auth_script.c
	$(CC) $(CFLAGS) $(LDFLAGS) -Wl,-soname,auth_script=.so -o auth_script.so auth_script.o

clean:
	rm -f *.o *.so
