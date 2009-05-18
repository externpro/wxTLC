################################################################################
# wxTreeListCtrl Makefile
# This script uses the multi-architecture build concept borrowed from the 
# website http://make.paulandlesley.org/multi-arch.html.
#
# Author: David Russak
#
# Version: $Id: Makefile 9695 2008-07-30 23:34:36Z pete $
#
################################################################################

# This make script is first called from the main source directory and then one 
# directory level down in the build directory. The variable SRCDIR, defined in 
# target.mk and is passed in to the second invocation of this makefile and is 
# used to detect the current directory level. 
ifdef SRCDIR
  SOLUTION_DIR := ../..
else
  SOLUTION_DIR := ..
endif

SHARED_DIR := $(SOLUTION_DIR)/../Shared
MAKE_DIR := $(SHARED_DIR)/make
ifeq ($(SDL_EXTERN),)
  SDL_EXTERN := $(SOLUTION_DIR)/../sdlExtern
endif

include $(MAKE_DIR)/exports.mk

# OUTPUT_DIR is used in this file and in target.mk
OUTPUT_DIR := $(strip $(SOLUTION_DIR)/$(LIB_DIR))

# If the current directory does not have an underscore then include target.mk.
ifeq (,$(filter _%,$(notdir $(CURDIR))))

  include $(MAKE_DIR)/target.mk

else

  include $(OUTPUT_DIR)/locals.mk

  # This is the portion of the script which will be run in the build 
  # directory. It uses VPATH to find the source files.

  .SUFFIXES:

  INC := -I$(SDL_EXTERN)/include -I$(SRCDIR)/include $(WX_INCLUDES) \
         -I$(OUTPUT_DIR)
  LIB := $(OUTPUT_DIR)/libTreeListCtrl$(BLD_LTR).a
  USER_SPECIALS := $(INC)

  VPATH := $(SRCDIR)/src
  CPP_SRC := treelistctrl.cpp

  include $(MAKE_DIR)/obj_dep.mk

  # Create the library
  $(LIB): $(CPP_OBJS)
	  @echo Creating library $(LIB).
	  $(AR) $(LIB) $(CPP_OBJS)

  include $(MAKE_DIR)/rules.mk

endif
