ifeq ($(OS),Windows_NT)
  # Specify compiler
  CC=gcc
  # Specify linker
  LINK=gcc
  # Specify the Compiler switches
  G++_FLAGS = -c -g -Wall
  # Specify the linked libraries
  LD_FLAGS = -lstdc++ -lsetupapi
  # Specify the target
  TARGET = HelloWorld.exe
else
  UNAME_S := $(shell uname -s)
  ifeq ($(UNAME_S),Darwin)
    # Specify compiler
    CC=clang
	  # Specify linker
	  LINK=clang
	  # Specify the Compiler switches
	  G++_FLAGS = -c -g -Wall
	  # Specify the linked libraries
	  LD_FLAGS = -lstdc++ -framework IOKit -framework CoreFoundation
	  # Specify the target
	  TARGET = HelloWorld.out
  endif
endif

# Specify the modules for linking
OBJECTS = HelloWorld.o

.PHONY : $(TARGET)
all : $(TARGET)
 
# Link the object files into a binary
$(TARGET): $(OBJECTS)
	$(LINK) -o $(TARGET) $(OBJECTS) $(LD_FLAGS)

# Compile the modules
%.o : %.c
	$(CC) $(G++_FLAGS) $<

# Clean target
clean :
	rm -f $(TARGET) $(OBJECTS) 
.PHONY : all clean