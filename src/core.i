/////////////////////////////////////////////////////////////////////////////
// Name:        core.i
// Purpose:     SWIG interface file for the CORE wxPython classes and stuff.
//
// Author:      Robin Dunn
//
// Created:     22-May-1998
// RCS-ID:      $Id$
// Copyright:   (c) 1998 by Total Control Software
// Licence:     wxWindows license
/////////////////////////////////////////////////////////////////////////////

%module core


%{
#include "wx/wxPython/wxPython_int.h"
#include "wx/wxPython/pyclasses.h"
%}


//---------------------------------------------------------------------------

#ifndef SWIGXML
%include typemaps.i
%include my_typemaps.i

%include _core_api.i
%include _core_rename.i



%native(_wxPySetDictionary)   __wxPySetDictionary;

%pythoncode {
%#// Give a reference to the dictionary of this module to the C++ extension
%#// code.
_core._wxPySetDictionary(vars())

%#// A little trick to make 'wx' be a reference to this module so wx.Names can
%#// be used here.
import sys as _sys
wx = _sys.modules[__name__]
}

#endif

//---------------------------------------------------------------------------

%{
    DECLARE_DEF_STRING(EmptyString);
//    DECLARE_DEF_STRING(PanelNameStr);
%}

//---------------------------------------------------------------------------
// Include all the files that make up the core module

// wxObject, functions and other base stuff
%include _defs.i
%include _obj.i
%include _gdicmn.i
%include _streams.i
%include _filesys.i
%include _image.i


// Events, event handlers, base Windows and such
%include _evthandler.i
%include _event.i
%include _app.i
%include _accel.i
%include _window.i
%include _validator.i
%include _menu.i
%include _control.i


// Layout
%include _sizers.i
%include _gbsizer.i
%include _constraints.i


%pythoncode "_core_ex.py"

//---------------------------------------------------------------------------
// This code gets added to the module initialization function

%init %{
    // Initialize threading, some globals and such
    __wxPyPreStart(d);
    

    // Although these are defined in __version__ they need to be here too so
    // that an assert can be done to ensure that the wxPython and the wxWindows
    // versions match.
    PyDict_SetItemString(d,"MAJOR_VERSION", PyInt_FromLong((long)wxMAJOR_VERSION ));
    PyDict_SetItemString(d,"MINOR_VERSION", PyInt_FromLong((long)wxMINOR_VERSION ));
    PyDict_SetItemString(d,"RELEASE_VERSION", PyInt_FromLong((long)wxRELEASE_NUMBER ));
%}
 
//---------------------------------------------------------------------------
