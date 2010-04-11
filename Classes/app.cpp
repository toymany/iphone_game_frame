
#include "app.h"
#include "graphicUtil.h"

void CApp::Main()
{
}

void CApp::Draw()
{
  static float transY = 0.0f;
  glRotatef( transY, 0,0,1 );
  transY += 0.5f;
  drawSquare();
}

