SOURCES := $(wildcard src/*.coffee)
LIBS    := $(subst src,lib,$(SOURCES:.coffee=.js))
COFFEE  := ./node_modules/.bin/coffee

all: $(LIBS)

$(LIBS): $(COFFEE) $(SOURCES)
	$(COFFEE) --map --compile --output lib src

$(COFFEE):
	npm install

clean:
	rm -r lib
	rm -r node_modules
