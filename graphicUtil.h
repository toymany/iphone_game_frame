/*
 *  graphicUtil.h
 *  iphone_game_frame
 *
 *  Created by 山屋 健 on 10/04/11.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */


#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>




void drawSquare();
void drawSquare( unsigned int color );

class NSString;
void loadTexture( NSString*  filename );

#define SAFE_DELETE( p )  if( p ){ delete p ; p = NULL; }

class CApp
{
 public:
  void Main();
  void Draw();
};
