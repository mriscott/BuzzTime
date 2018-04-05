sdkroot=c:/users/u8006988/garminSDK
build :
	$(sdkroot)/bin/monkeyc  -y $(sdkroot)/keys/developer_key.der -o ./BuzzTime.prg -f ./monkey.jungle 

all: build
	$(sdkroot)/bin/connectiq
	$(sdkroot)/bin/monkeydo ./BuzzTime.prg fr920xt

rerun:	build
	$(sdkroot)/bin/monkeydo ./BuzzTime.prg fr920xt

clean:
	rm -f BuzzTime-settings.json BuzzTime.prg BuzzTime.prg.debug.xml
