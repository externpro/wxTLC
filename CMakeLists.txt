set(lib_name tlc) # wxTreeListCtrl
#######################################
set(treelist_srcs
  src/treelistctrl.cpp
  )
list(APPEND ${lib_name}_libsrcs ${treelist_srcs})
########################
set(treelist_hdrs
  include/wx/treelistctrl.h
  )
list(APPEND ${lib_name}_libsrcs ${treelist_hdrs})
#######################################
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
target_include_directories(${lib_name} PUBLIC $<INSTALL_INTERFACE:$<INSTALL_PREFIX>/${wxInc}>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )
target_link_libraries(${lib_name} PUBLIC wx::core)
list(TRANSFORM WXX_OUTPUT_NAME REPLACE "@TARGET@" "${lib_name}")
set_target_properties(${lib_name} PROPERTIES OUTPUT_NAME ${WXX_OUTPUT_NAME})
#######################################
install(TARGETS ${lib_name} EXPORT ${targetsFile}
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )
install(FILES ${treelist_hdrs} DESTINATION ${wxInc}/wx/treelistctrl)
if(DEFINED XP_NAMESPACE)
  set(nameSpace NAMESPACE ${XP_NAMESPACE}::)
endif()
install(EXPORT ${targetsFile} DESTINATION lib/cmake ${nameSpace})
