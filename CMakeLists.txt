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
target_include_directories(${lib_name} PUBLIC $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )
target_link_libraries(${lib_name} PUBLIC wx::core)
list(TRANSFORM WXX_OUTPUT_NAME REPLACE "@TARGET@" "${lib_name}")
set_target_properties(${lib_name} PROPERTIES OUTPUT_NAME ${WXX_OUTPUT_NAME})
#######################################
install(TARGETS ${lib_name} EXPORT ${targetsFile}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  )
install(FILES ${treelist_hdrs} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/wx/treelistctrl)
#######################################
set(samples_treelisttest_srcs
  samples/treelisttest/BuildInfo.txt
  samples/treelisttest/treelisttest.cpp
  samples/treelisttest/treelisttest.rc
  samples/treelisttest/treelisttest.xpm
  )
foreach(sample
  samples_treelisttest
  )
  add_executable(${sample} WIN32 ${${sample}_srcs})
  target_link_libraries(${sample} PRIVATE ${lib_name})
endforeach()
