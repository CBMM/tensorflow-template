{ pkgs ? import <nixpkgs> {} }:

with pkgs;
let pypkgs = python3Packages;
    pyfull = python3Full;
in stdenv.mkDerivation {
  name = "sample-impure-env";
  buildInputs = with pypkgs; [
    # basic inputs
    pyfull
    pypkgs.virtualenv
    pypkgs.pip

    # project-specific
    tensorflowWithCuda
    ];
  src = null;
  shellHook = ''
    # set SOURCE_DATE_EPOCH so that we can use python wheels
    SOURCE_DATE_EPOCH=$(date +%s)
    virtualenv venv
    export PATH=$PWD/venv/bin:$PATH
    source activate
    # pip freeze --all > requirements.txt
    pip install -r requirements.txt -I
    pip install nose2 -I
  '';
}
