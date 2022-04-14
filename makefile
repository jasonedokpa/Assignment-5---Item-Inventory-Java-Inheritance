# Gradle Wrapper Makefile

ASSIGNMENT=Storage

all:
	chmod a+rx gradlew
	./gradlew test jar

test:
	./gradlew test

retroguard:
	./gradlew jar
	cp  build/libs/$(ASSIGNMENT).jar temp.jar
	java -cp .:/home/zeil/src/retroguard/retroguard.jar RetroGuard temp.jar $(ASSIGNMENT)-obfuscated.jar
	rm temp.jar

run: $(ASSIGNMENT).jar
	chmod a+rx gradlew
	./gradlew run

clean:
	chmod a+rx gradlew
	./gradlew clean

grading:
	cp Armour.java src/main/java/edu/odu/cs/cs330/items/
	cp Consumable.java src/main/java/edu/odu/cs/cs330/items/
	cp build.notGradle build.gradle
	chmod a+rx gradlew
	./gradlew jar test

gradingNoRename:
	unzip inventory_java_1.zip
	cp Armour.java src/main/java/edu/odu/cs/cs330/items/
	cp Consumable.java src/main/java/edu/odu/cs/cs330/items/
	chmod a+rx gradlew
	./gradlew --no-daemon jar test

zip:
	-rm -f inventory_java_1.zip
	zip -9 -r inventory_java_1.zip gradlew gradlew.bat src gradle config build.gradle gradle.properties



