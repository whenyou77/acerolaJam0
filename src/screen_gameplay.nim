# ****************************************************************************************
#
#   raylib - Advance Game template
#
#   Gameplay Screen Functions Definitions (Init, Update, Draw, Unload)
#
#   Copyright (c) 2014-2022 Ramon Santamaria (@raysan5)
#
#   This software is provided "as-is", without any express or implied warranty. In no event
#   will the authors be held liable for any damages arising from the use of this software.
#
#   Permission is granted to anyone to use this software for any purpose, including commercial
#   applications, and to alter it and redistribute it freely, subject to the following restrictions:
#
#     1. The origin of this software must not be misrepresented; you must not claim that you
#     wrote the original software. If you use this software in a product, an acknowledgment
#     in the product documentation would be appreciated but is not required.
#
#     2. Altered source versions must be plainly marked as such, and must not be misrepresented
#     as being the original software.
#
#     3. This notice may not be removed or altered from any source distribution.
#
# ****************************************************************************************

import raylib, screens, std/lenientops, raymath

# ----------------------------------------------------------------------------------------
# Module Variables Definition (local)
# ----------------------------------------------------------------------------------------

const
  tileSize = Vector2(x:16.0,y:16.0)
  sizeRatio* = 2.0

var
  framesCounter: int32 = 0
  finishScreen: int32 = 0
  pos: Vector2 = Vector2()
  vel: Vector2 = Vector2()
  camera: Camera2D = Camera2D(zoom:1.0)

# ----------------------------------------------------------------------------------------
# Gameplay Screen Functions Definition
# ----------------------------------------------------------------------------------------

proc initGameplayScreen* =
  # Gameplay Screen Initialization logic
  # TODO: Initialize GAMEPLAY screen variables here!
  framesCounter = 0
  finishScreen = 0
  pos = Vector2()

proc updateGameplayScreen* =
  # Gameplay Screen Update logic
  # TODO: Update GAMEPLAY screen variables here!
  # Press enter or tap to change to ENDING screen
  if isKeyPressed(Enter) or isGestureDetected(Tap):
    finishScreen = 1
    playSound(fxCoin)

proc drawGameplayScreen* =
  # Gameplay Screen Draw logic
  # TODO: Draw GAMEPLAY screen here!
  if isKeyDown(D): vel.x = 2.0
  elif isKeyDown(A): vel.x = -2.0
  else: vel.x = 0.0
  vel.y += 0.4
  if isKeyPressed(W): vel.y = -8.0
  pos += vel
  camera.offset.x = -pos.x+getScreenWidth()/sizeRatio
  beginTextureMode(filter)
  drawRectangle(0,0,getScreenWidth(),getScreenHeight(),SkyBlue)
  #beginMode2D(camera)
  drawText("PRESS ENTER or TAP to JUMP to ENDING SCREEN", 130, 100, 20, Maroon)
  drawTexture(texPlayer,pos,White)
  #endMode2D()
  endTextureMode()
  drawTexture(filter.texture,Rectangle(x:0.0,y:0.0,width:getScreenWidth() / sizeRatio,height:getScreenHeight() / -sizeRatio),Rectangle(x:0.0,y:0.0,width:getScreenWidth().float32,height: getScreenHeight().float32),Vector2(),0.0,White)
  #drawText(font, "GAMEPLAY SCREEN", Vector2(x: 20, y: 10), font.baseSize*3'f32, 4, Maroon)
  drawText("PRESS ENTER or TAP to JUMP to ENDING SCREEN", 130, 220, 20, Maroon)

proc unloadGameplayScreen* =
  # Gameplay Screen Unload logic
  # TODO: Unload GAMEPLAY screen variables here!
  discard

proc finishGameplayScreen*: int32 =
  # Gameplay Screen should finish?
  return finishScreen
