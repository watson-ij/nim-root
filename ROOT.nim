{.passC: gorge("root-config --cflags").}
{.passL: gorge("root-config --libs").}

type
  TObjectObj {. header: "TObject.h", importcpp: "TObject", inheritable .} = object
  TObject* = ptr TObjectObj

proc GetName*(this: TObject): cstring {.importcpp: "const_cast<char*>(#.GetName())", nosideeffect.}
proc GetTitle*(this: TObject): cstring {.importcpp: "const_cast<char*>(#.GetTitle())", nosideeffect.}
proc Write*(this: TObject) {.importcpp: "#.Write()", nosideeffect.}
proc Delete*(obj: TObject) {.importcpp: "#.Delete()".}
proc Print*(obj: TObject, opt: cstring="") {.importcpp: "#.Print(@)".}

type
  TFileObj {. header: "TFile.h", importcpp: "TFile" .} = object of TObjectObj
  TFile* = ptr TFileObj

proc newTFile*(filename, options: cstring=""): TFile {.importcpp: "new TFile(@)".}
proc Close(f: TFile) {.importcpp: "#.Close()".}
proc close*(f: TFile) =
  f.Close
  f.Delete
proc ls*(t: TFile) {. importcpp: "#.ls()" .}
proc Get*(t: TFile, name: cstring): TObject {. importcpp: "#.Get(@)" .}

type
  TStyledObj {. header: "TH1.h", importcpp: "TStyled" .} = object of TObjectObj
  TStyled* = ptr TStyledObj

const # Fill Style
  kFEmpty* = 0
  kFSolid* = 1
  kFDotted1* = 3001
  kFDotted2* = 3002
  kFDotted3* = 3003
  kFHatched1* = 3004
  kHatched2* = 3005
  kFHatched3* = 3006
  kFHatched4* = 3007
  kFWicker* = 3008
  kFScales* = 3009
  kFBricks* = 3010
  kFSnowflakes* = 3011
  kFCircles* = 3012
  kFTiles* = 3013
  kFMondrian* = 3014
  kFDiamonds* = 3015
  kFWaves1* = 3016
  kFDashed1* = 3017
  kFDashed2* = 3018
  kFAlhambra* = 3019
  kFWaves2* = 3020
  kFStars1* = 3021
  kFStars2* = 3022
  kFPyramids* = 3023
  kFFrieze* = 3024
  kFMetopes* = 3025

proc GetFillColor*(obj: TStyled, color: cshort) {. importcpp: "#.GetFillColor(@)" .}
proc SetFillColor*(obj: TStyled, color: cshort) {. importcpp: "#.SetFillColor(@)" .}
proc GetFillStyle*(obj: TStyled, color: cshort) {. importcpp: "#.GetFillStyle(@)" .}
proc SetFillStyle*(obj: TStyled, color: cshort) {. importcpp: "#.SetFillStyle(@)" .}

const # Marker Style
  kDot* = 1
  kPlus* = 2
  kStar* = 3
  kCircle* = 4
  kMultiply* = 5
  kFullDotSmall* = 6
  kFullDotMedium* = 7
  kFullDotLarge* = 8
  kFullCircle* = 20
  kFullSquare* = 21
  kFullTriangleUp* = 22
  kFullTriangleDown* = 23
  kOpenCircle* = 24
  kOpenSquare* = 25
  kOpenTriangleUp* = 26
  kOpenDiamond* = 27
  kOpenCross* = 28
  kFullStar* = 29
  kOpenStar* = 30
  kOpenTriangleDown* = 32
  kFullDiamond* = 33
  kFullCross* = 34
  kOpenDiamondCross* = 35
  kOpenSquareDiagonal* = 36
  kOpenThreeTriangles* = 37
  kOctagonCross* = 38
  kFullThreeTriangles* = 39
  kOpenFourTrianglesX* = 40
  kFullFourTrianglesX* = 41
  kOpenDoubleDiamond* = 42
  kFullDoubleDiamond* = 43
  kOpenFourTrianglesPlus* = 44
  kFullFourTrianglesPlus* = 45
  kOpenCrossX* = 46
  kFullCrossX* = 47
  kFourSquaresX* = 48
  kFourSquaresPlus* = 49

proc GetMarkerColor*(obj: TStyled, color: cshort) {. importcpp: "#.GetMarkerColor(@)" .}
proc SetMarkerColor*(obj: TStyled, color: cshort) {. importcpp: "#.SetMarkerColor(@)" .}
proc GetMarkerStyle*(obj: TStyled, color: cshort) {. importcpp: "#.GetMarkerStyle(@)" .}
proc SetMarkerStyle*(obj: TStyled, color: cshort) {. importcpp: "#.SetMarkerStyle(@)" .}
proc GetMarkerSize*(obj: TStyled, size: cfloat) {. importcpp: "#.GetMarkerSize(@)" .}
proc SetMarkerSize*(obj: TStyled, size: cfloat) {. importcpp: "#.SetMarkerSize(@)" .}

const
  kSolid* = 1
  kDashed* = 2
  kDotted* = 3
  kDashDotted* = 4

proc GetLineColor*(obj: TStyled, color: cshort) {. importcpp: "#.GetLineColor(@)" .}
proc SetLineColor*(obj: TStyled, color: cshort) {. importcpp: "#.SetLineColor(@)" .}
proc GetLineStyle*(obj: TStyled, color: cshort) {. importcpp: "#.GetLineStyle(@)" .}
proc SetLineStyle*(obj: TStyled, color: cshort) {. importcpp: "#.SetLineStyle(@)" .}
proc GetLineWidth*(obj: TStyled, size: cshort) {. importcpp: "#.GetLineWidth(@)" .}
proc SetLineWidth*(obj: TStyled, size: cshort) {. importcpp: "#.SetLineWidth(@)" .}

type
  TTreeObj {. header: "TTree.h", importcpp: "TTree" .} = object of TStyledObj
  TTree* = ptr TTreeObj  

proc newTTree*(name: cstring="", title: cstring=""): TTree {.importcpp: "new TTree(@)".}
proc Branch*(t: TTree, name: cstring, obj: pointer, leaves: cstring) {. importcpp: "#.Branch(@)" .}
proc Fill*(t: TTree) {. importcpp: "#.Fill()" .}
proc SetBranchAddress*(t: TTree, name: cstring, obj: pointer) {. importcpp: "#.SetBranchAddress(@)" .}
proc GetEntry*(t: TTree, e: clong) {. importcpp: "#.GetEntry(@)" .}
proc GetEntries*(t: TTree): clong {. importcpp: "#.GetEntries()" .}
proc Draw*(t: TTree, exp: cstring, cut: cstring="", opt: cstring="") {.importcpp: "#.Draw(@)".}

type
  TH1FObj {. header: "TH1F.h", importcpp: "TH1F" .} = object of TStyledObj
  TH1F* = ptr TH1FObj

proc Draw*(t: TH1F, opt: cstring="") {.importcpp: "#.Draw(@)".}

type
  TCanvasObj {. header: "TCanvas.h", importcpp: "TCanvas" .} = object of TObjectObj
  TCanvas* = ptr TCanvasObj

proc newTCanvas*(): TCanvas {.importcpp: "new TCanvas(@)".}
proc Print*(t: TH1F, filename: cstring) {.importcpp: "#.Write(@)".}
