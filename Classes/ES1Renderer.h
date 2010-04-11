//
//  ES1Renderer.h
//  iphone_game_frame
//
//  Created by 山屋 健 on 10/04/11.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ESRenderer.h"

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

class CApp;
@interface ES1Renderer : NSObject <ESRenderer>
{
@private
	EAGLContext *context;
	
	// The pixel dimensions of the CAEAGLLayer
	GLint backingWidth;
	GLint backingHeight;
	
	// The OpenGL names for the framebuffer and renderbuffer used to render to this view
	GLuint defaultFramebuffer, colorRenderbuffer;
	CApp* m_pApp;
}

- (void) render;
- (BOOL) resizeFromLayer:(CAEAGLLayer *)layer;


@end
