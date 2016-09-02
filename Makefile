BUILD_DIR = build.make

all:
	$(MAKE) $(BUILD_DIR)/Makefile
	$(MAKE) -C $(BUILD_DIR) all

run: all
	( cd bin/; ./main )

$(BUILD_DIR)/Makefile: $(BUILD_DIR) CMakeLists.txt
	( cd $(BUILD_DIR); cmake -G "Unix Makefiles" .. )

$(BUILD_DIR):
	mkdir $@

clean:
	$(RM) -R $(BUILD_DIR)
	$(RM) -R bin
