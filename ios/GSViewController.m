#import "GSViewController.h"
#import "GStreamerBackend.h"
#import <UIKit/UIKit.h>

@interface GSViewController () {
  GStreamerBackend *gst_backend;
  int media_width;
  int media_height;
  Boolean is_local_media;
  Boolean is_playing_desired;
}

@end

@implementation GSViewController

@synthesize uri;

/*
 * Methods from UIViewController
 */

-(void)viewDidLoad
{
  [super viewDidLoad];
  
  play_button.enabled = FALSE;
  pause_button.enabled = FALSE;
  
  /* Make these constant for now, later tutorials will change them */
  media_width = 320;
  media_height = 240;
  
  uri = @"http://mirrors.standaloneinstaller.com/video-sample/jellyfish-25-mbps-hd-hevc.mp4";
  
  gst_backend = [[GStreamerBackend alloc] init:self videoView:video_view];
}

-(void)viewDidDisappear:(BOOL)animated
{
  if (gst_backend) {
    [gst_backend deinit];
  }
}

-(void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/* Called when the Play button is pressed */
-(IBAction) play:(id)sender
{
  [gst_backend play];
  is_playing_desired = YES;
}

/* Called when the Pause button is pressed */
-(IBAction) pause:(id)sender
{
  [gst_backend pause];
  is_playing_desired = NO;
}

-(void)viewDidLayoutSubviews
{
  CGFloat view_width = video_container_view.bounds.size.width;
  CGFloat view_height = video_container_view.bounds.size.height;
  
  CGFloat correct_height = view_width * media_height / media_width;
  CGFloat correct_width = view_height * media_width / media_height;
  
  if (correct_height < view_height) {
    video_height_constraint.constant = correct_height;
    video_width_constraint.constant = view_width;
  } else {
    video_width_constraint.constant = correct_width;
    video_height_constraint.constant = view_height;
  }
}

/*
 * Methods from GstreamerBackendDelegate
 */

-(void) gstreamerInitialized
{
  dispatch_async(dispatch_get_main_queue(), ^{
    play_button.enabled = TRUE;
    pause_button.enabled = TRUE;
    message_label.text = @"Ready";
    [gst_backend setUri:uri];
    is_local_media = [uri hasPrefix:@"file://"];
    is_playing_desired = NO;
  });
}

-(void) gstreamerSetUIMessage:(NSString *)message
{
  dispatch_async(dispatch_get_main_queue(), ^{
    message_label.text = message;
  });
}

-(void) mediaSizeChanged:(NSInteger)width height:(NSInteger)height
{
  media_width = width;
  media_height = height;
  dispatch_async(dispatch_get_main_queue(), ^{
    [self viewDidLayoutSubviews];
    [video_view setNeedsLayout];
    [video_view layoutIfNeeded];
  });
}

+(id) loadInstanceFromNib {
  
  NSString *className = NSStringFromClass([self class]);
  UIViewController *controller = [[[self class] alloc] initWithNibName:className bundle:nil];
  return controller;
}

@end
