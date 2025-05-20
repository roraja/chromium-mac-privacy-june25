# Simple Clipboard Mac App

This is a simple macOS application written in Objective-C++ that demonstrates basic clipboard operations (copy and paste) with a text input field.

## Prerequisites

- macOS (tested on M2)
- Xcode Command Line Tools (provides clang and other necessary build tools)

To install Xcode Command Line Tools, open Terminal and run:
```bash
xcode-select --install
```

## Building the App

1.  **Navigate to the project directory:**
    Open Terminal and change to the directory where you saved the source files (`AppDelegate.h`, `AppDelegate.mm`, `main.mm`).

    ```bash
    cd /path/to/your/mac_test_clipapp
    ```

2.  **Compile the source code:**
    Use clang++ to compile the Objective-C++ files and link against the Cocoa framework. This command will create an executable file named `ClipboardApp`.

    ```bash
    clang++ -std=c++17 -fobjc-arc -framework Cocoa main.mm AppDelegate.mm -o ClipboardApp
    ```

    **Explanation of the compile command:**
    *   `clang++`: The C++ compiler (part of Clang/LLVM).
    *   `-std=c++17`: Specifies the C++ standard to use (C++17 in this case).
    *   `-fobjc-arc`: Enables Automatic Reference Counting (ARC) for Objective-C objects, which helps manage memory automatically.
    *   `-framework Cocoa`: Links the Cocoa framework, which provides the necessary classes for building macOS GUI applications (NSWindow, NSButton, NSTextField, etc.).
    *   `main.mm AppDelegate.mm`: The source files to compile.
    *   `-o ClipboardApp`: Specifies the name of the output executable file.

## Running the App

1.  **Execute the compiled application:**
    After successful compilation, you can run the app directly from the Terminal:

    ```bash
    ./ClipboardApp
    ```

    This will launch the application, and you should see a window with a text input field and two buttons: "Copy" and "Paste".

## How it Works

*   **`main.mm`**: This is the entry point of the application. It sets up the `NSApplication` instance and assigns an `AppDelegate` to handle application lifecycle events.
*   **`AppDelegate.h`**: This is the header file for the `AppDelegate` class. It declares the properties for the window, text field, and buttons, as well as the action method for the paste button.
*   **`AppDelegate.mm`**: This is the implementation file for the `AppDelegate` class.
    *   `applicationDidFinishLaunching:`: This method is called when the application has finished launching. It's where the UI elements (window, text field, buttons) are created, configured, and added to the window's content view.
    *   `pasteText:`: This method is triggered when the "Paste" button is clicked. It accesses the system's general pasteboard (`NSPasteboard`), retrieves the string content, and sets it as the value of the text field.
    *   `applicationShouldTerminateAfterLastWindowClosed:`: This method ensures that the application quits when its last window is closed.

## Functionality

*   **Window**: A simple application window titled "Clipboard App".
*   **Text Input**: An `NSTextField` where you can type or paste text.
*   **Paste Button**: When clicked, it retrieves text from the system clipboard and displays it in the text input field.
*   **Copy Button**: (Currently not implemented in the provided code snippet, but the button is visually present). To implement copy functionality, you would:
    1.  Add an action method (e.g., `copyText:`) to `AppDelegate`.
    2.  In `copyText:`, get the string value from `self.textField`.
    3.  Get the general pasteboard.
    4.  Clear the existing contents of the pasteboard.
    5.  Declare the type of data to be copied (e.g., `NSPasteboardTypeString`).
    6.  Set the string on the pasteboard.
    7.  Connect this action method to the `copyButton`'s target and action in `applicationDidFinishLaunching:`.

This provides a basic foundation for a macOS clipboard utility.
