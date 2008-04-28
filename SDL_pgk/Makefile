.SUFFIXES:

ARCH=`uname -s`

# Determine if the 'b' macro contains 'r', meaning a release build
ifneq (,$(findstring r,$(b)))
  OUTPUT_DIR := ../../lib/_SunOS_Release
  CPPFLAGS := -c -O -DNDEBUG
  WXINC := $(shell bash wx-config --prefix=$(SDL_EXTERN) --unicode=no --debug=no --cxxflags)
else
  OUTPUT_DIR := ../../lib/_SunOS_Debug
  CPPFLAGS := -c -g -D_DEBUG
  WXINC := $(shell bash wx-config --prefix=$(SDL_EXTERN) --unicode=no --debug=yes --cxxflags)
  BLD_LTR := d
endif

include obj_dep.mk
AR := ar rcv
CXX := g++
CC := gcc

INC := -I../include \
       -I../src \
       -I$(SDL_EXTERN)/include \
       $(WXINC)
VPATH := ../src
MAKE_DIR := .
USER_SPECIALS := $(INC)
LIB := $(OUTPUT_DIR)/libTreeListCtrl$(BLD_LTR).a

# ServerTools source
CPP_SRC := treelistctrl.cpp

include $(MAKE_DIR)/obj_dep.mk

# Create the library
$(LIB): $(OUTPUT_DIR) $(C_OBJS) $(CPP_OBJS)
	@echo Creating library $(LIB).
	$(AR) $(LIB) $(C_OBJS) $(CPP_OBJS)

$(OUTPUT_DIR):
	+@[ -d $@ ] || mkdir $@

# A do nothing rule for libraries.
%.a: ;

clean:
	rm -fr *.o *.dpp
	rm $(OUTPUT_DIR)/libTreeListCtrl$(BLD_LTR).a

include rules.mk
