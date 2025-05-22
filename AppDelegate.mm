#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Create the window
    self.window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, 400, 200)
                                             styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable
                                               backing:NSBackingStoreBuffered
                                                 defer:NO];
    [self.window setTitle:@"Clipboard App"];
    [self.window center];

    // Ensure the app icon is shown in the Dock and the app has a menu bar
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

    // Create the text field
    self.textField = [[NSTextField alloc] initWithFrame:NSMakeRect(20, 100, 360, 24)];
    [self.textField setBezeled:YES];
    [self.textField setDrawsBackground:YES];
    [self.textField setEditable:YES];
    [self.textField setSelectable:YES];
    [[self.window contentView] addSubview:self.textField];

    // Create the copy button
    self.copyButton = [[NSButton alloc] initWithFrame:NSMakeRect(20, 50, 80, 30)];
    [self.copyButton setTitle:@"Copy"];
    [self.copyButton setBezelStyle:NSBezelStyleRounded];
    // [self.copyButton setTarget:self];
    // [self.copyButton setAction:@selector(copyText:)]; // Action to be implemented
    [[self.window contentView] addSubview:self.copyButton];

    // Create the paste button
    self.pasteButton = [[NSButton alloc] initWithFrame:NSMakeRect(120, 50, 80, 30)];
    [self.pasteButton setTitle:@"Paste"];
    [self.pasteButton setBezelStyle:NSBezelStyleRounded];
    [self.pasteButton setTarget:self];
    [self.pasteButton setAction:@selector(pasteText:)];
    [[self.window contentView] addSubview:self.pasteButton];

    // Create the Open Privacy Settings button
    self.privacySettingsButton = [[NSButton alloc] initWithFrame:NSMakeRect(220, 50, 160, 30)];
    [self.privacySettingsButton setTitle:@"Open Privacy Settings"];
    [self.privacySettingsButton setBezelStyle:NSBezelStyleRounded];
    [self.privacySettingsButton setTarget:self];
    [self.privacySettingsButton setAction:@selector(openPrivacySettings:)];
    [[self.window contentView] addSubview:self.privacySettingsButton];

    [self.window makeKeyAndOrderFront:nil];
    [NSApp activateIgnoringOtherApps:YES];
}

- (void)pasteText:(id)sender {
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    NSString *clipboardText = [pasteboard stringForType:NSPasteboardTypeString];
    if (clipboardText) {
        [self.textField setStringValue:clipboardText];
    }
}

- (void)openPrivacySettings:(id)sender {
    NSString *urlString = @"x-apple.systempreferences:com.apple.preference.security?Privacy_Pasteboard";
    NSURL *url = [NSURL URLWithString:urlString];
    [[NSWorkspace sharedWorkspace] openURL:url];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
