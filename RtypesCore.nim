##  @(#)root/base:$Id$
## ************************************************************************
##  Copyright (C) 1995-2014, Rene Brun and Fons Rademakers.               *
##  All rights reserved.                                                  *
##                                                                        *
##  For the licensing terms see $ROOTSYS/LICENSE.                         *
##  For the list of contributors see $ROOTSYS/README/CREDITS.             *
## ***********************************************************************

## ////////////////////////////////////////////////////////////////////////
##                                                                       //
##  RtypesCore                                                           //
##                                                                       //
##  Basic types used by ROOT and required by TInterpreter.               //
##                                                                       //
## ////////////////////////////////////////////////////////////////////////

# import
#   RConfig

## ---- Tag used by rootcling to determine constructor used for I/O.

discard "forward decl of TRootIOCtor"
type
  Char_t* = char

## Signed Character 1 byte (char)

type
  UChar_t* = cuchar

## Unsigned Character 1 byte (unsigned char)

type
  Short_t* = cshort

## Signed Short integer 2 bytes (short)

type
  UShort_t* = cushort

## Unsigned Short integer 2 bytes (unsigned short)

when defined(RINT16):
  type
    Int_t* = clong
  ## Signed integer 4 bytes
  type
    UInt_t* = culong
  ## Unsigned integer 4 bytes
else:
  type
    Int_t* = cint
  ## Signed integer 4 bytes (int)
  type
    UInt_t* = cuint
  ## Unsigned integer 4 bytes (unsigned int)
when defined(RB64):          ##  Note: Long_t and ULong_t are currently not portable types
  type
    Seek_t* = cint
  ## File pointer (int)
  type
    Long_t* = clong
  ## Signed long integer 8 bytes (long)
  type
    ULong_t* = culong
  ## Unsigned long integer 8 bytes (unsigned long)
else:
  type
    Seek_t* = cint
  ## File pointer (int)
  type
    Long_t* = clong
  ## Signed long integer 4 bytes (long)
  type
    ULong_t* = culong
  ## Unsigned long integer 4 bytes (unsigned long)
type
  Float_t* = cfloat

## Float 4 bytes (float)

type
  Float16_t* = cfloat

## Float 4 bytes written with a truncated mantissa

type
  Double_t* = cdouble

## Double 8 bytes

type
  Double32_t* = cdouble

## Double 8 bytes in memory, written as a 4 bytes float

type
  LongDouble_t* = clongdouble

## Long Double

type
  Text_t* = char

## General string (char)

type
  Bool_t* = bool

## Boolean (0=false, 1=true) (bool)

type
  Byte_t* = cuchar

## Byte (8 bits) (unsigned char)

type
  Version_t* = cshort

## Class version identifier (short)

type
  Option_t* = char

## Option string (const char)

type
  Ssiz_t* = cint

## String size (int)

type
  Real_t* = cfloat

## TVector and TMatrix element type (float)

when defined(RWIN32) and not defined(CINT):
  ## typedef __int64          Long64_t;  //Portable signed long integer 8 bytes
  ## typedef unsigned __int64 ULong64_t; //Portable unsigned long integer 8 bytes
  type
    Long64_t* = int64
    ULong64_t* = uint64
else:
  type
    Long64_t* = clonglong
  ## Portable signed long integer 8 bytes
  type
    ULong64_t* = culonglong
  ## Portable unsigned long integer 8 bytes
type
  Axis_t* = cdouble

## Axis values type (double)

type
  Stat_t* = cdouble

## Statistics type (double)

type
  Font_t* = cshort

## Font number (short)

type
  Style_t* = cshort

## Style number (short)

type
  Marker_t* = cshort

## Marker number (short)

type
  Width_t* = cshort

## Line width (short)

type
  Color_t* = cshort

## Color number (short)

type
  SCoord_t* = cshort

## Screen coordinates (short)

type
  Coord_t* = cdouble

## Pad world coordinates (double)

type
  Angle_t* = cfloat

## Graphics angle (float)

type
  Size_t* = cfloat

## Attribute size (float)
## ---- constants ---------------------------------------------------------------

var kTRUE* {.importcpp: "kTRUE", header: "RtypesCore.h".}: Bool_t

var kFALSE* {.importcpp: "kFALSE", header: "RtypesCore.h".}: Bool_t

var kMaxUChar* {.importcpp: "kMaxUChar", header: "RtypesCore.h".}: Int_t

var kMaxChar* {.importcpp: "kMaxChar", header: "RtypesCore.h".}: Int_t

var kMinChar* {.importcpp: "kMinChar", header: "RtypesCore.h".}: Int_t

var kMaxUShort* {.importcpp: "kMaxUShort", header: "RtypesCore.h".}: Int_t

var kMaxShort* {.importcpp: "kMaxShort", header: "RtypesCore.h".}: Int_t

var kMinShort* {.importcpp: "kMinShort", header: "RtypesCore.h".}: Int_t

var kMaxUInt* {.importcpp: "kMaxUInt", header: "RtypesCore.h".}: UInt_t

var kMaxInt* {.importcpp: "kMaxInt", header: "RtypesCore.h".}: Int_t

var kMinInt* {.importcpp: "kMinInt", header: "RtypesCore.h".}: Int_t

var kMaxULong* {.importcpp: "kMaxULong", header: "RtypesCore.h".}: ULong_t

var kMaxLong* {.importcpp: "kMaxLong", header: "RtypesCore.h".}: Long_t

var kMinLong* {.importcpp: "kMinLong", header: "RtypesCore.h".}: Long_t

var kMaxULong64* {.importcpp: "kMaxULong64", header: "RtypesCore.h".}: ULong64_t

var kMaxLong64* {.importcpp: "kMaxLong64", header: "RtypesCore.h".}: Long64_t

var kMinLong64* {.importcpp: "kMinLong64", header: "RtypesCore.h".}: Long64_t

var kBitsPerByte* {.importcpp: "kBitsPerByte", header: "RtypesCore.h".}: csize

var kNPOS* {.importcpp: "kNPOS", header: "RtypesCore.h".}: Ssiz_t
