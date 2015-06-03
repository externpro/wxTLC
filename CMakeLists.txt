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
set_wxxtarget_properties(${lib_name})
#######################################
# install
install(TARGETS ${lib_name} DESTINATION lib)
install(FILES ${treelist_hdrs} DESTINATION include/${wxinc}/wx/treelistctrl)
