# Package
version       = "1.0.0"
author        = "whenyou77"
description   = "Raylib game template"
license       = "License"
srcDir        = "src"

# Dependencies
requires "naylib"

include "build_android.nims"

task setupAndroid, "":
  setupTask()

task buildAndroid, "":
  compileTask()
