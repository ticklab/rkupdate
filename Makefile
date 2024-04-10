PROJECT_DIR := $(shell pwd)
PROM = rkupdate 
OBJ =   CRC.o \
	MD5Checksum.o \
	RKAndroidDevice.o \
	RKBoot.o \
	RKComm.o \
	RKDevice.o \
	RKImage.o \
	RKLog.o \
	Upgrade.o \
	main.o

LIBS = -luuid

$(PROM): $(OBJ)
	$(CXX) -o $(PROM) $(OBJ) $(CFLAGS) $(LIBS)

%.o: %.c
	$(CXX) -c $< -o $@ $(CFLAGS)

clean:
	rm -rf $(OBJ) $(PROM)

install:
	sudo install -D -m 755 recovery -t /usr/bin/
