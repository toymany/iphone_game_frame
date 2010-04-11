/*
 *  graphicUtil.cpp
 *  iphone_game_frame
 *
 *  Created by 山屋 健 on 10/04/11.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */
#include "graphicUtil.h"


void drawSquare()
{

  static const GLfloat squareVertices[] = {
    -0.5f,  -0.5f,
    0.5f,  -0.5f,
    -0.5f,   0.5f,
    0.5f,   0.5f,
  };
    
  static const GLfloat squareColorsFloat[] = {
    0.5,   0,   0,  1, 
    1,   0.5,   0,  1, 
    1,   0,   0,  1, 
    1,   0,   0,  1, 
  };
    
  glVertexPointer(2, GL_FLOAT, 0, squareVertices);
  glEnableClientState(GL_VERTEX_ARRAY);
  glColorPointer(4, GL_FLOAT, 0, squareColorsFloat);
  glEnableClientState(GL_COLOR_ARRAY);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

}
