# nim-root

Nim Bindings for the CERN ROOT library

Also includes some std:: and Delphes bindings that I've needed to
use. You'll have to set the includes and library paths by hand in
`delphes.nim`.

*Note* On linux you will need to add `{.passC: "-DgEnv=_gEnv".}` in
the main module to rename the Nim's internal gEnv variable to _gEnv,
otherwise it collides with ROOTs one. (Not sure if this will mean you
can't use environment variables from Nim though).
