#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, strong) NSTextField *textField;
@property (nonatomic, strong) NSButton *copyButton;
@property (nonatomic, strong) NSButton *pasteButton;

- (void)pasteText:(id)sender;
- (NSButton *)copyButton __attribute__((objc_method_family(none)));

@end
