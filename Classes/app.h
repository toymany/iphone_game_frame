/**
   \file   app.h

   

   \author Yamaya Takeshi
   \date   2010-04-12
*/



#import <UIKit/UIKit.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>


#define SAFE_DELETE( p )  if( p ){ delete p ; p = NULL; }


class CApp
{
 public:
  CApp();

  void Main();
  void Draw();
 private:
  GLuint m_Texture;
  GLuint m_NumberTexture;
};




