#import <UIKit/UIKit.h>
#import "GStreamerBackendDelegate.h"

@interface GSViewController : UIViewController <GStreamerBackendDelegate> {
  IBOutlet UILabel *message_label;
  IBOutlet UIBarButtonItem *play_button;
  IBOutlet UIBarButtonItem *pause_button;
  IBOutlet UIView *video_view;
  IBOutlet UIView *video_container_view;
  IBOutlet NSLayoutConstraint *video_width_constraint;
  IBOutlet NSLayoutConstraint *video_height_constraint;
}

@property (retain,nonatomic) NSString *uri;

-(IBAction) play:(id)sender;
-(IBAction) pause:(id)sender;

/* From GStreamerBackendDelegate */
-(void) gstreamerInitialized;
-(void) gstreamerSetUIMessage:(NSString *)message;

+(id) loadInstanceFromNib;

@end
