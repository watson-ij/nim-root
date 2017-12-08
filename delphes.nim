import ROOT

{.passC: "-I/code/MG5_aMC_v2_6_0/Delphes".}
{.passL: "-L/code/MG5_aMC_v2_6_0/Delphes/ -lDelphes".}

type
  GenParticleObj {. header: "classes/DelphesClasses.h", importcpp: "GenParticle" .} = object of TObjectObj
    PID* {.importc: "PID".}: Int_t ##  particle HEP ID number | hepevt.idhep[number]
    Status* {.importc: "Status".}: Int_t ##  particle status | hepevt.isthep[number]
    IsPU* {.importc: "IsPU".}: Int_t ##  0 or 1 for particles from pile-up interactions
    M1* {.importc: "M1".}: Int_t ##  particle 1st mother | hepevt.jmohep[number][0] - 1
    M2* {.importc: "M2".}: Int_t ##  particle 2nd mother | hepevt.jmohep[number][1] - 1
    D1* {.importc: "D1".}: Int_t ##  particle 1st daughter | hepevt.jdahep[number][0] - 1
    D2* {.importc: "D2".}: Int_t ##  particle last daughter | hepevt.jdahep[number][1] - 1
    Charge* {.importc: "Charge".}: Int_t ##  particle charge
    Mass* {.importc: "Mass".}: Float_t ##  particle mass
    E* {.importc: "E".}: Float_t ##  particle energy | hepevt.phep[number][3]
    Px* {.importc: "Px".}: Float_t ##  particle momentum vector (x component) | hepevt.phep[number][0]
    Py* {.importc: "Py".}: Float_t ##  particle momentum vector (y component) | hepevt.phep[number][1]
    Pz* {.importc: "Pz".}: Float_t ##  particle momentum vector (z component) | hepevt.phep[number][2]
    P* {.importc: "P".}: Float_t ##  particle momentum
    PT* {.importc: "PT".}: Float_t ##  particle transverse momentum
    Eta* {.importc: "Eta".}: Float_t ##  particle pseudorapidity
    Phi* {.importc: "Phi".}: Float_t ##  particle azimuthal angle
    Rapidity* {.importc: "Rapidity".}: Float_t ##  particle rapidity
    CtgTheta* {.importc: "CtgTheta".}: Float_t ##  particle cotangent of theta
    D0* {.importc: "D0".}: Float_t ##  particle transverse impact parameter
    DZ* {.importc: "DZ".}: Float_t ##  particle longitudinal impact parameter
    T* {.importc: "T".}: Float_t ##  particle vertex position (t component) | hepevt.vhep[number][3]
    X* {.importc: "X".}: Float_t ##  particle vertex position (x component) | hepevt.vhep[number][0]
    Y* {.importc: "Y".}: Float_t ##  particle vertex position (y component) | hepevt.vhep[number][1]
    Z* {.importc: "Z".}: Float_t ##  particle vertex position (z component) | hepevt.vhep[number][2]
                             ## !
  GenParticle* = ptr GenParticleObj

proc P4*(this: GenParticle): TLorentzVector {.noSideEffect, importcpp: "&#.P4()", header: "classes/DelphesClasses.h".}

type
  JetObj {. header: "classes/DelphesClasses.h", importcpp: "Jet" .} = object of TObjectObj
    PT* {.importc: "PT".}: Float_t ##  jet transverse momentum
    Eta* {.importc: "Eta".}: Float_t ##  jet pseudorapidity
    Phi* {.importc: "Phi".}: Float_t ##  jet azimuthal angle
    T* {.importc: "T".}: Float_t ## particle arrival time of flight
    Mass* {.importc: "Mass".}: Float_t ##  jet invariant mass
    DeltaEta* {.importc: "DeltaEta".}: Float_t ##  jet radius in pseudorapidity
    DeltaPhi* {.importc: "DeltaPhi".}: Float_t ##  jet radius in azimuthal angle
    Flavor* {.importc: "Flavor".}: UInt_t ##  jet flavor
    FlavorAlgo* {.importc: "FlavorAlgo".}: UInt_t ##  jet flavor
    FlavorPhys* {.importc: "FlavorPhys".}: UInt_t ##  jet flavor
    BTag* {.importc: "BTag".}: UInt_t ##  0 or 1 for a jet that has been tagged as containing a heavy quark
    BTagAlgo* {.importc: "BTagAlgo".}: UInt_t ##  0 or 1 for a jet that has been tagged as containing a heavy quark
    BTagPhys* {.importc: "BTagPhys".}: UInt_t ##  0 or 1 for a jet that has been tagged as containing a heavy quark
    TauTag* {.importc: "TauTag".}: UInt_t ##  0 or 1 for a jet that has been tagged as a tau
    Charge* {.importc: "Charge".}: Int_t ##  tau charge
    EhadOverEem* {.importc: "EhadOverEem".}: Float_t ##  ratio of the hadronic versus electromagnetic energy deposited in the calorimeter
    NCharged* {.importc: "NCharged".}: Int_t ##  number of charged constituents
    NNeutrals* {.importc: "NNeutrals".}: Int_t ##  number of neutral constituents
    Beta* {.importc: "Beta".}: Float_t ##  (sum pt of charged pile-up constituents)/(sum pt of charged constituents)
    BetaStar* {.importc: "BetaStar".}: Float_t ##  (sum pt of charged constituents coming from hard interaction)/(sum pt of charged constituents)
    MeanSqDeltaR* {.importc: "MeanSqDeltaR".}: Float_t ##  average distance (squared) between constituent and jet weighted by pt (squared) of constituent
    PTD* {.importc: "PTD".}: Float_t ##  average pt between constituent and jet weighted by pt of constituent
    FracPt* {.importc: "FracPt".}: array[5, Float_t] ##  (sum pt of constituents within a ring 0.1*i < DeltaR < 0.1*(i+1))/(sum pt of constituents)
    Tau* {.importc: "Tau".}: array[5, Float_t] ##  N-subjettiness
    TrimmedP4* {.importc: "TrimmedP4".}: array[5, TLorentzVector] ##  first entry (i = 0) is the total Trimmed Jet 4-momenta and from i = 1 to 4 are the trimmed subjets 4-momenta
    PrunedP4* {.importc: "PrunedP4".}: array[5, TLorentzVector] ##  first entry (i = 0) is the total Pruned Jet 4-momenta and from i = 1 to 4 are the pruned subjets 4-momenta
    SoftDroppedP4* {.importc: "SoftDroppedP4".}: array[5, TLorentzVector] ##  first entry (i = 0) is the total SoftDropped Jet 4-momenta and from i = 1 to 4 are the pruned subjets 4-momenta
    NSubJetsTrimmed* {.importc: "NSubJetsTrimmed".}: Int_t ##  number of subjets trimmed
    NSubJetsPruned* {.importc: "NSubJetsPruned".}: Int_t ##  number of subjets pruned
    NSubJetsSoftDropped* {.importc: "NSubJetsSoftDropped".}: Int_t ##  number of subjets soft-dropped
    Constituents* {.importc: "Constituents".}: TRefArray ##  references to constituents
    Particles* {.importc: "Particles".}: TRefArray ##  references to generated particles
                                               ## !
    Area* {.importc: "&#.Area".}: TLorentzVector ##  ClassDef(Jet, 3)
  Jet* = ptr JetObj

proc P4*(this: Jet): TLorentzVector {.noSideEffect, importcpp: "&#.P4()", header: "classes/DelphesClasses.h".}

type
  MissingETObj {.importcpp: "MissingET", header: "classes/DelphesClasses.h".} = object of TObjectObj
    MET* {.importc: "MET".}: Float_t ##  mising transverse energy
    Eta* {.importc: "Eta".}: Float_t ##  mising energy pseudorapidity
    Phi* {.importc: "Phi".}: Float_t ##  mising energy azimuthal angle
  MissingET* = ptr MissingETObj
  
proc P4*(this: MissingET): TLorentzVector {.noSideEffect, importcpp: "&#.P4()", header: "classes/DelphesClasses.h".}

type
  PhotonObj {.importcpp: "Photon", header: "classes/DelphesClasses.h", bycopy.} = object of TObjectObj
    PT* {.importc: "PT".}: Float_t ##  photon transverse momentum
    Eta* {.importc: "Eta".}: Float_t ##  photon pseudorapidity
    Phi* {.importc: "Phi".}: Float_t ##  photon azimuthal angle
    E* {.importc: "E".}: Float_t ##  photon energy
    T* {.importc: "T".}: Float_t ##  particle arrival time of flight
    EhadOverEem* {.importc: "EhadOverEem".}: Float_t ##  ratio of the hadronic versus electromagnetic energy deposited in the calorimeter
    Particles* {.importc: "Particles".}: TRefArray ##  references to generated particles
    IsolationVar* {.importc: "IsolationVar".}: Float_t ##  isolation variable
    IsolationVarRhoCorr* {.importc: "IsolationVarRhoCorr".}: Float_t ##  isolation variable
    SumPtCharged* {.importc: "SumPtCharged".}: Float_t ##  isolation variable
    SumPtNeutral* {.importc: "SumPtNeutral".}: Float_t ##  isolation variable
    SumPtChargedPU* {.importc: "SumPtChargedPU".}: Float_t ##  isolation variable
    SumPt* {.importc: "SumPt".}: Float_t ##  isolation variable
                                     ## !
  Photon* = ptr PhotonObj

proc P4*(this: Photon): TLorentzVector {.noSideEffect, importcpp: "&#.P4()", header: "classes/DelphesClasses.h".}

type
  ElectronObj {.importcpp: "Electron", header: "classes/DelphesClasses.h", bycopy.} = object of TObjectObj
    PT* {.importc: "PT".}: Float_t ##  electron transverse momentum
    Eta* {.importc: "Eta".}: Float_t ##  electron pseudorapidity
    Phi* {.importc: "Phi".}: Float_t ##  electron azimuthal angle
    T* {.importc: "T".}: Float_t ##  particle arrival time of flight
    Charge* {.importc: "Charge".}: Int_t ##  electron charge
    EhadOverEem* {.importc: "EhadOverEem".}: Float_t ##  ratio of the hadronic versus electromagnetic energy deposited in the calorimeter
    Particle* {.importc: "Particle".}: TRef ##  reference to generated particle
    IsolationVar* {.importc: "IsolationVar".}: Float_t ##  isolation variable
    IsolationVarRhoCorr* {.importc: "IsolationVarRhoCorr".}: Float_t ##  isolation variable
    SumPtCharged* {.importc: "SumPtCharged".}: Float_t ##  isolation variable
    SumPtNeutral* {.importc: "SumPtNeutral".}: Float_t ##  isolation variable
    SumPtChargedPU* {.importc: "SumPtChargedPU".}: Float_t ##  isolation variable
    SumPt* {.importc: "SumPt".}: Float_t ##  isolation variable
                                     ## !
  Electron* = ptr ElectronObj

proc P4*(this: Electron): TLorentzVector {.noSideEffect, importcpp: "&#.P4()", header: "classes/DelphesClasses.h".}


type
  MuonObj {.importcpp: "Muon", header: "classes/DelphesClasses.h", bycopy.} = object of TObjectObj
    PT* {.importc: "PT".}: Float_t ##  muon transverse momentum
    Eta* {.importc: "Eta".}: Float_t ##  muon pseudorapidity
    Phi* {.importc: "Phi".}: Float_t ##  muon azimuthal angle
    T* {.importc: "T".}: Float_t ##  particle arrival time of flight
    Charge* {.importc: "Charge".}: Int_t ##  muon charge
    Particle* {.importc: "Particle".}: TRef ##  reference to generated particle
    IsolationVar* {.importc: "IsolationVar".}: Float_t ##  isolation variable
    IsolationVarRhoCorr* {.importc: "IsolationVarRhoCorr".}: Float_t ##  isolation variable
    SumPtCharged* {.importc: "SumPtCharged".}: Float_t ##  isolation variable
    SumPtNeutral* {.importc: "SumPtNeutral".}: Float_t ##  isolation variable
    SumPtChargedPU* {.importc: "SumPtChargedPU".}: Float_t ##  isolation variable
    SumPt* {.importc: "SumPt".}: Float_t ##  isolation variable
                                     ## !
  Muon* = ptr MuonObj

proc P4*(this: Muon): TLorentzVector {.noSideEffect, importcpp: "&#.P4()", header: "classes/DelphesClasses.h".}
