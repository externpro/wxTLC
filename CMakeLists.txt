set(lib_name tlc) # wxTreeListCtrl
set(wx_dir ${CMAKE_CURRENT_SOURCE_DIR}/../..)
#######################################
# include directories
include_directories( 
  ${wx_dir}/include
  include
)
if(MSVC)
  include_directories(
    ${wx_dir}/wxx # to find the MSVC-specific wx/setup.h
  )
endif()
#######################################
# library sources
########################
# source
set(treelist_srcs
  src/treelistctrl.cpp
)
list(APPEND ${lib_name}_libsrcs ${treelist_srcs})
########################
# headers
set(treelist_hdrs
  include/wx/treelistctrl.h
)
list(APPEND ${lib_name}_libsrcs ${treelist_hdrs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_target_properties(${lib_name} PROPERTIES OUTPUT_NAME ${wxbasename}_${lib_name}-${wxversion})

