{.passC: gorge("root-config --cflags").}
{.passL: gorge("root-config --libs").}

type
  TObjectObj* {. header: "TObject.h", importcpp: "TObject", inheritable .} = object
  TObject* = ptr TObjectObj

proc GetName*(this: TObject): cstring {.importcpp: "const_cast<char*>(#.GetName())", nosideeffect.}
proc GetTitle*(this: TObject): cstring {.importcpp: "const_cast<char*>(#.GetTitle())", nosideeffect.}
proc Write*(this: TObject) {.importcpp: "#.Write()", nosideeffect.}
proc Delete*(obj: TObject) {.importcpp: "#.Delete()".}
proc Print*(obj: TObject, opt: cstring="") {.importcpp: "#.Print(@)".}

type
  TLorentzVectorObj {. header: "TLorentzVector.h", importcpp: "TLorentzVector" .} = object of TObjectObj
  TLorentzVector* = ptr TLorentzVectorObj

proc DeltaR*(l1: TLorentzVector, l2: TLorentzVector): cfloat {.importcpp: "#.DeltaR(*#)".}
proc E*(l1: TLorentzVector): cfloat {.importcpp: "#.E()".}
proc M*(l1: TLorentzVector): cfloat {.importcpp: "#.M()".}
proc X*(l1: TLorentzVector): cfloat {.importcpp: "#.X()".}
proc Y*(l1: TLorentzVector): cfloat {.importcpp: "#.Y()".}
proc Z*(l1: TLorentzVector): cfloat {.importcpp: "#.Z()".}
proc Px*(l1: TLorentzVector): cfloat {.importcpp: "#.Px()".}
proc Py*(l1: TLorentzVector): cfloat {.importcpp: "#.Py()".}
proc Pz*(l1: TLorentzVector): cfloat {.importcpp: "#.Pz()".}
proc P*(l1: TLorentzVector): cfloat {.importcpp: "#.P()".}
proc Pt*(l1: TLorentzVector): cfloat {.importcpp: "#.Pt()".}
proc Rho*(l1: TLorentzVector): cfloat {.importcpp: "#.Rho()".}
proc Eta*(l1: TLorentzVector): cfloat {.importcpp: "#.Eta()".}
proc Phi*(l1: TLorentzVector): cfloat {.importcpp: "#.Phi()".}

type
  TFileObj {. header: "TFile.h", importcpp: "TFile" .} = object of TObjectObj
  TFile* = ptr TFileObj

proc newTFile*(filename, options: cstring=""): TFile {.importcpp: "new TFile(@)".}
proc Close(f: TFile) {.importcpp: "#.Close()".}
proc close*(f: TFile) =
  f.Close
  f.Delete
proc ls*(f: TFile) {. importcpp: "#.ls()" .}
proc Get*(f: TFile, name: cstring): TObject {. importcpp: "#.Get(@)" .}
template get*[T](f: TFile, name: cstring): T = cast[T](f.Get(name))

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
proc Branch*(t: TTree, name: cstring, obj: untyped) {. importcpp: "#.Branch(@)" .}
proc Branch*(t: TTree, name: cstring, classname: cstring, obj: untyped) {. importcpp: "#.Branch(@)" .}
proc Fill*(t: TTree) {. importcpp: "#.Fill()" .}
proc SetBranchAddress*(t: TTree, name: cstring, obj: untyped) {. importcpp: "#.SetBranchAddress(@)" .}
template readBranch*[T](tree: TTree, name: cstring, vari): untyped =
  ## Creates vari and sets trees variable name to var's address
  var vari: T
  tree.SetBranchAddress(name, vari.addr)

proc GetEntry*(t: TTree, e: clong) {. importcpp: "#.GetEntry(@)" .}
proc GetEntries*(t: TTree): clong {. importcpp: "#.GetEntries()" .}
proc Draw*(t: TTree, exp: cstring, cut: cstring="", opt: cstring="") {.importcpp: "#.Draw(@)".}
# TODO: Should be a TDirectory
proc SetDirectory*(t: TTree, f: TFile) {. importcpp: "#.SetDirectory(@)" .}

type
  TH1Obj {. header: "TH1F.h", importcpp: "TH1F" .} = object of TStyledObj
  TH1* = ptr TH1Obj

proc Draw*(t: TH1, opt: cstring="") {.importcpp: "#.Draw(@)".}
proc Fill*(t: TH1, x, w: cfloat=1.0) {.importcpp: "#.Fill(@)".}

type
  TH1FObj {. header: "TH1F.h", importcpp: "TH1F" .} = object of TH1Obj
  TH1F* = ptr TH1FObj
proc newTH1F*(name, title: cstring, nbins: cint, st, en: cfloat): TH1F {. importcpp: "new TH1F(@)" .}

type
  TH1DObj {. header: "TH1D.h", importcpp: "TH1D" .} = object of TH1Obj
  TH1D* = ptr TH1DObj
proc newTH1D*(name, title: cstring, nbins: cint, st, en: cfloat): TH1D {. importcpp: "new TH1D(@)" .}

type
  TCanvasObj {. header: "TCanvas.h", importcpp: "TCanvas" .} = object of TObjectObj
  TCanvas* = ptr TCanvasObj

proc newTCanvas*(): TCanvas {.importcpp: "new TCanvas(@)".}
proc Print*(t: TCanvas, filename: cstring) {.importcpp: "#.Print(@)".}
proc SetLogy*(t: TCanvas, filename: bool) {.importcpp: "#.SetLogy(@)".}

type
  TEnvObj {. header: "TEnv.h", importcpp: "TEnv" .} = object of TObjectObj
  TEnv* = ptr TEnvObj

var gEnv* {.importcpp: "gEnv".}: TEnv

type
  TObjArrayObj {. header: "TObjArray.h", importcpp: "TObjArray", inheritable .} = object of TObjectObj
  TObjArray*[T] = ptr TObjArrayObj

proc at*(obj: TObjArray, i: clong): TObject {. importcpp: "#.At(@)" .}
# Use a template so we don't generate a Nim function call
template At*[T](obj: TObjArray[T], i: clong): untyped = cast[T](obj.at(i))
template `[]`*[T](obj: TObjArray[T], i: clong): untyped = cast[T](obj.at(i))
proc GetEntries*(obj: TObjArray): cint {. importcpp: "#.GetEntries()" .}
proc GetEntriesFast*(obj: TObjArray): cint {. importcpp: "#.GetEntriesFast()" .}

type
  TClonesArrayObj {. header: "TClonesArray.h", importcpp: "TClonesArray", inheritable .} = object of TObjArrayObj
  TClonesArray*[T] = ptr TClonesArrayObj
