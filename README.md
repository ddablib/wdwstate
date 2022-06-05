# Window State Components

## Contents

* [Overview](#overview)
* [Installation](#installation)
* [Demo Projects](#demo-projects)
* [Change log](#change-log)
* [License and Credits](#license-and-credits)
* [Bugs and Feature Requests](#bugs-and-feature-requests)
* [About the Author](#about-the-author)

## Overview

The _Window State Components_ can save and restore a window's size, position and state (minimized, maximized or normal) between program executions. Three components are provided that use different means of recording the window's information. They are:

* _TPJWdwState_

    This component records window information in an ini file. The user has control over the ini file name (via the _IniFileName_ property), the root path used when the specified file name is relative (via the _IniRootPath_ and the name of the section of the file where window information is recorded (using the _Section_ property). Alternatively the ini file name and section names can be configured by handling the _OnGetIniData_ or _OnGetIniDataEx_ events that are triggered immediately before the ini file is read or written.

* _TPJRegWdwState_†

    This component uses the Windows registry to record window information. The registry root key and sub key where the information is stored are controlled by the _RootKeyEx_†† and _SubKey_ properties, or by handling the _OnGetRegDataEx_††† event. This event is triggered just before the registry is accessed. Additional application defined data can be read from or written to the registry by handling the _OnGettingRegData_ and _OnPuttingRegData_ events that are triggered after the component reads or writes the registry.

    > † You are discouraged from using _TPJRegWdwState_ for programs compiled with Delphi 5 and earlier that may be run on 64 bit Windows, because the component may not be able to access the 64 bit registry view correctly and window state may be lost.
    >
    > †† As of v5.6.0 the _RootKeyEx_ property superseded _RootKey_. The new property takes an enumerated value to set the required root key instead of the numerical value used for _RootKey_. This makes _RootKeyEx_ much easier to use in the Delphi Object Inspector because the user selects between user friendly value names instead of having to enter an integer value. Note that the RootKey property has been retained for backward compatibility.
    >
    > ††† As of v5.6.0 the _OnGetRegDataEx_ event superseded _OnGetRegData_. Like _RootKeyEx_, _OnGetRegDataEx_ takes an enumerated root key value instead of the numerical value passed to _OnGetRegData_. The older event is still present, but any event handler is only called if _OnGetRegDataEx_ does not have a handler.

* _TPJUserWdwState_

    This component relies on the user to handle saving and reading the window state data to or from persistent storage. The component gives the most flexibility of all the components at the expense of placing the storage burden on the user. The component triggers _OnReadData_ and _OnSaveData_ events when ready to read or save data.

All components implement the same core functionality that is controlled by some common properties and events:

* The components can automatically restore and save windows when the program starts up and closes down (using the _AutoSaveRestore_ property). If _AutoSaveRestore_ is set to False then the _Restore_ and _Save_ methods must be called from the host application.
* The _Options_ property can be used to customise the way the window is restored as follows:
  * The components can be instructed to ignore the saved window state – the window is then displayed in the normal state.
  * The window's saved size can be ignored and the default size of the form used instead. This is useful for dialogue boxes and fixed size windows.
  * The window can be kept within the current work area of the desktop. This option works with multiple monitors. If the form containing the window state component is a MDI child form this option keeps the window within the parent form's client area, after allowing for any menu, tool-bars or status bar etc.
  * When the form is to be restored in a minimized state it briefly appears on screen in the normal state before being minimized. The _MinimizeDelay_ property controls the delay between the window appearing and being minimized.

_TPJWdwState_ and _TPJRegWdwState_ also support the _OnReadWdwState_ event. Handling this event enables the stored window's state, size and position values to be changed before the window is restored. This event is called after reading the data and before sizing the window. _TPJUserWdwState_ does not expose this event because the user is in charge of reading the data and can therefore modify it, if required, in the _OnReadData_ event.

The components are fully documentation [online](https://delphidabbler.com//url/wdwstate-docs).

### Compatibility

The components are compatible with the Delphi Windows 32 bit and 64 bit compiler. They have been tested using Delphi 5, Delphi 7 and Delphi 2006 through to Delphi XE4. The components _might_ compile on Delphi 4, but that has not been tested.

The components are for use with the VCL only: they are not compatible with FireMonkey.

.NET and non-Windows platforms are not supported.

## Installation

The _Window State Components_ are supplied in a zip file. Before installing you need to extract all the files from the zip file, preserving the directory structure. The following files will be extracted:

* **`PJWdwState.pas`** – component source code.
* **`PJWdwState.dcr`** – resource file containing component palette glyphs.
* `PJWdwState.hlp` – component help file that integrates with the Delphi 4 to 7 OpenHelp system.
* `PJWdwState.als` – a-link keyword file for integration with the Delphi 6 or 7 OpenHelp system.
* `README.md` – this file.
* `MPL-2.txt` – the Mozilla Public License.
* `CHANGELOG.md` – component's change log.
* `Documentation.URL` – short-cut to the component's online documentation.

In addition to the above files you will find the the source code of four [demo projects](#demo-projects), along with read-me files in the `Demos` directory and its `1`, `2`, `3` and `4` sub-directories.

You can now install the components into the Delphi IDE. If you need help doing this [see here](https://delphidabbler.com/url/install-comp).

Note that the help file included in the download can only integrate with the IDE in Delphi 4-7 and _**will not work at all on Windows 10 & 11**_. For information on how to do this, see [this article](https://delphidabbler.com/articles/article-15). Users of other versions of Delphi can either use the help file as a stand-alone file (in which case some links won't work) or you can use the Window State Components [online documentation](https://delphidabbler.com//url/wdwstate-docs) that can be accessed via the provided Internet short-cut.

> **NOTE:** The help file is deprecated and is no longer being updated. The last update was in the v5.4.1 release. Changes and new features added since then have not been included in the help file. For up to date documentation please refer to the [online documentation](https://delphidabbler.com//url/wdwstate-docs).

## Demo Projects

There are four demo projects included with these components. They are:

1. `StandardDemo.dpr` - Demonstrates how to use the components in the standard way, i.e. dropped on a form from the component palette. This demo uses _TPJRegWdwState_.
2. `StandAloneDemo.dpr` - Demonstrates how to create and use the components dynamically using the _CreateStandAlone_ constructor. This demo uses _TPJWdwState_.
3. `UserDemo.dpr` - Demonstrates how to use _TPJUserWdwState_ and load and save data in the _OnReadData_ and _OnSaveData_ events.
4. `MDIDemo.dpr` - Demonstrates the use of _TPJWdwState_ with MDI applications.

Further information about the demo programs can be found in the file [`Demos\README.md`](https://github.com/ddablib/wdwstate/blob/main/Demos/README.md) that is included in the download.

## Change log

A complete change log is provided in [`CHANGELOG.md`](https://github.com/ddablib/wdwstate/blob/main/CHANGELOG.md) that is included in the download..

## License and Credits

These components are released under the terms of the [Mozilla Public License v2.0](https://www.mozilla.org/MPL/2.0/).

Thanks to the following who have contributed to this project:

* Stefan Winter
* Enrico Bortolazzi
* Bruce J Miller
* Craig Symons

All relevant trademarks are acknowledged.

## Bugs and Feature Requests

Bugs can be reported or new features requested via the project's [Issue Tracker](https://github.com/ddablib/wdwstate/issues). A GitHub account is required.

Please check if an issue has already been created for a similar report or request. If so then please add a comment containing as much information as you can to the existing issue, or if you've nothing to add, just add a :+1: (`:+1:`) comment. If there is no suitable existing issue then please add a new issue and give as much information as possible.

## About the Author

I'm Peter Johnson – a hobbyist programmer living in Ceredigion in West Wales, UK, writing mainly in Delphi. My programs and other library code are available from: [https://delphidabbler.com/](https://delphidabbler.com/).

This document is copyright © 2005-2022, [P D Johnson](https://gravatar.com/delphidabbler).
