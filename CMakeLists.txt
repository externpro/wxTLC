set(lib_name tlc) # wxTreeListCtrl
#######################################
# include directories
include_directories(include)
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
#######################################
# install
install(TARGETS ${lib_name} DESTINATION lib${NUMBITS})
install(FILES ${treelist_hdrs} DESTINATION include/wx/treelistctrl)
