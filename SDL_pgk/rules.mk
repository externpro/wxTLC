# <sdlOwner name='David Russak' email='david.russak@sdl.usu.edu' />
-include $(C_DEPENDS) $(CPP_DEPENDS)

%.d: %.c 
	$(MAKE_DIR)/depend.sh $< $@ "$(CPPFLAGS) $(CXXFLAGS) $(USER_SPECIALS)"

%.dpp: %.cpp 
	$(MAKE_DIR)/depend.sh $< $@ "$(CPPFLAGS) $(CXXFLAGS) $(USER_SPECIALS)"

%.o : %.c 
	$(CC) $(CFLAGS) $(INC) $< -o $@

%.o : %.cpp 
	$(CXX) $(CPPFLAGS) $(INC) $< -o $@

# don't make Makefile or *.mk
Makefile : ;
%.mk :: ;

