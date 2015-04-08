NAME=Main
DIR=.
SOURCE_DIR=$(DIR)/src/main/java
TEST_DIR=$(DIR)/src/test/java
LIB_DIR=$(DIR)/lib
JUNIT=$(LIB_DIR)/junit/junit-4.12.jar:$(LIB_DIR)/junit/hamcrest-core-1.3.jar
CLASSPATH=$(SOURCE_DIR):$(TEST_DIR):$(JUNIT)
JAVA_OPTIONS=-cp $(CLASSPATH)
SOURCE_FILES=$(NAME).java Dollar.java
SOURCES=$(addprefix $(SOURCE_DIR)/, $(SOURCE_FILES))
CLASSES=$(SOURCES:.java=.class)
TEST_NAMES=TestMain
TEST_FILES=$(TEST_NAMES:=.java)
TEST_SOURCES=$(addprefix $(TEST_DIR)/, $(TEST_FILES))
TEST_CLASSES=$(TEST_SOURCES:.java=.class)

run: all
	java $(JAVA_OPTIONS) $(NAME) 

all: $(CLASSES)

docs: $(SOURCES)
	javadoc $(SOURCES) -d doc

$(CLASSES): $(SOURCES)
	javac $(SOURCES)

test: $(TEST_CLASSES)
	java $(JAVA_OPTIONS) org.junit.runner.JUnitCore $(TEST_NAMES)

$(TEST_CLASSES): $(SOURCES) $(TEST_SOURCES)
	javac $(JAVA_OPTIONS) $(TEST_SOURCES)

clean:
	rm -rf doc
	rm -rf submit
	rm $(SOURCE_DIR)/*.class $(TEST_DIR)/*.class
