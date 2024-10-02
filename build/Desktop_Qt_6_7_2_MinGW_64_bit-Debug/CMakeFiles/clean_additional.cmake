# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\DigitalCluster_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\DigitalCluster_autogen.dir\\ParseCache.txt"
  "DigitalCluster_autogen"
  )
endif()
