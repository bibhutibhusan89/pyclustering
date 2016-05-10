# Unit-test project for CCORE PyClustering library

include makefile.include

CC = g++
LD = g++

# Toolchain arguments
CFLAGS = -O3 -MMD -MP -std=c++1y -fPIC -c
LFLAGS = -O3 -pthread


# Project sources
SOURCES += tst/main.cpp
SOURCES += tst/samples.cpp
SOURCES += tools/gtest/gtest-all.cpp

OBJECTS = $(SOURCES:.cpp=.o)

INCLUDES += -I./ -Itst/ -Itools/


# The dependency file names
DEPS = $(OBJECTS:.o=.d)


# Output name of executable file
EXECUTABLE = tst/utcore.exe


utcore: $(EXECUTABLE)


clean:
	rm utcore/*.o tst/utcore.exe


$(EXECUTABLE): $(OBJECTS)
	$(LD) $(OBJECTS) $(LFLAGS) -o $(EXECUTABLE)


.cpp.o:
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@


-include $(DEPS)

