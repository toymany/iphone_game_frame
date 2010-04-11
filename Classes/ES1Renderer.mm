//
//  ES1Renderer.m
//  iphone_game_frame
//
//  Created by 山屋 健 on 10/04/11.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ES1Renderer.h"
#import "graphicUtil.h"
#import "app.h"

@implementation ES1Renderer

// Create an ES 1.1 context
- (id) init
{
  if (self = [super init]){
    context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
        
    if (!context || ![EAGLContext setCurrentContext:context])
      {
	[self release];
	return nil;
      }
		
    // Create default framebuffer object. The backing will be allocated for the current layer in -resizeFromLayer
    glGenFramebuffersOES(1, &defaultFramebuffer);
    glGenRenderbuffersOES(1, &colorRenderbuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, defaultFramebuffer);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, colorRenderbuffer);

    m_pApp = new CApp();
  }
	
  return self;
}

- (void) render
{
  // Replace the implementation of this method to do your own custom drawing
	
  // This application only creates a single context which is already set current at this point.
  // This call is redundant, but needed if dealing with multiple contexts.
  [EAGLContext setCurrentContext:context];
    
  // This application only creates a single default framebuffer which is already bound at this point.
  // This call is redundant, but needed if dealing with multiple framebuffers.
  glBindFramebufferOES(GL_FRAMEBUFFER_OES, defaultFramebuffer);
  glViewport(0, 0, backingWidth, backingHeight);
    
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glOrthof( -1.0f, 1.0f, -1.5f, 1.5f, 0.5f, -0.5f );

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();
	
  glClearColor(0.5f, 0.5f, 1.0f, 1.0f);
  glClear(GL_COLOR_BUFFER_BIT);

  {
    //テキストの描画
    m_pApp->Draw();
  }
    
  // This application only creates a single color renderbuffer which is already bound at this point.
  // This call is redundant, but needed if dealing with multiple renderbuffers.
  glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
  [context presentRenderbuffer:GL_RENDERBUFFER_OES];
}

- (BOOL) resizeFromLayer:(CAEAGLLayer *)layer
{	
  // Allocate color buffer backing based on the current layer size
  glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
  [context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:layer];
  glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth);
  glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight);
	
  if (glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
    {
      NSLog(@"Failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
      return NO;
    }
    
  return YES;
}

- (void) dealloc
{
  SAFE_DELETE( m_pApp );

  // Tear down GL
  if (defaultFramebuffer)
    {
      glDeleteFramebuffersOES(1, &defaultFramebuffer);
      defaultFramebuffer = 0;
    }

  if (colorRenderbuffer)
    {
      glDeleteRenderbuffersOES(1, &colorRenderbuffer);
      colorRenderbuffer = 0;
    }
	
  // Tear down context
  if ([EAGLContext currentContext] == context)
    [EAGLContext setCurrentContext:nil];
	
  [context release];
  context = nil;
	
  [super dealloc];
}

@end
