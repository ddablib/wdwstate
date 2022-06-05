# Window State Components - Demo Projects

## Introduction

There are four demo projects included with these components. They are:

1. **`StandardDemo.dpr`** - Demonstrates how to use the components in the standard way, i.e. dropped on a form from the component palette.
2. **`StandAloneDemo.dpr`** - Demonstrates how to create and use the components dynamically.
3. **`UserDemo.dpr`** - Demonstrates how to use TPJUserWdwState and load and save data in the OnReadData and OnSaveData events.
4. **`MDIDemo.dpr`** - Demonstrates how to use the components with MDI applications. This demo uses TPJWdwState components with the woFitWorkArea option to keep MDI child forms within the main form's client area.

These demos require Delphi 7 or later to compile.

On Delphi XE2 and later the demos can be compiled for 64 bit Windows. Proceed as follows:

* Ensure the package where the Window State Components have been installed has been compiled for a Windows 64 bit target.
* Add a Windows 64 target to each demo project.
* Add the directory containing the appropriate 64 bit package to the each demo project's search path for the 64 bit target.

## `StandardDemo.dpr`

This demo can be found in the `Demos\1` sub-folder.

It has a main application window containing a button that, when clicked, displays a modal dialogue box. Both the main window and the dialogue contain a TPJRegWdwState component. The component in the main window is configured to persist window size, state and position. The dialogue's component only persists window position. Window positions are not adjusted to remain within the work space.

Both forms demonstrate the use of the OnReadWdwState event. The main form also shows how to use the OnGetRegDataEx, OnGettingRegData and OnPuttingRegData events and the AutoSaveRestore property.

## `StandAloneDemo.dpr`

This demo can be found in the `Demos\2` sub-folder.

It displays a single application window that dynamically creates a TPJWdwState component using the CreateStandAlone constructor. A check box is available that is used to toggle whether windows that are partially off-screen when closed are restored in exactly the same position or are restored so all the window is visible.

The program uses the TPJWdwState component's IniRootDir, IniFileName and Section properties to require that window information is stored in the `[Window]` section of an ini file named `StandAloneDemo.ini` in the `%AppData%\DelphiDabbler\Lib\PJWdwState` directory. It also shows how to use the IniFilePath method to get the full file spec. of the ini file.

## `UserDemo.dpr`

This demo can be found in the `Demos\3` sub-folder.

The program has a single main window that uses a TPJUserWdwState component to persist the window's state, size and position. The component is configured to automatically save and restore the window state. It is also set up to keep the window on screen.

The main form has event handlers for TPJUserWdwState's OnReadData and OnSaveData events. OnSaveData is used to write the content of the Data record passed to the event handler to a file as binary data. OnReadData reads any stored data back into the record.

## `MDIDemo.dpr`

This demo can be found in the `Demos\4` sub-folder.

This simple demo simply shows how to use the window state components with MDI applications. There are two forms in the project – a main form and a child form. Neither form has any code, but both forms have a TPJWdwState component set up to write to different sections of the same ini file. The main form has a toolbar, a menu bar and a status bar. These controls have been added to show that the window state components can make allowances for furniture displaye in the main window when keeping child forms within the available work area.

Experiment by removing or adding the main form's furniture controls to check how this affects the placing of the child form. Also try changing the properties of each window state component and seeing what difference this makes. You may also want to try removing the component from the main form and notice what effect this has on the result.

If have found a bug in any of the demo code, please report it on the [Issue Tracker](https://github.com/ddablib/wdwstate/issues).
