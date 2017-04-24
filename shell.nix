{ pkgs ? import <nixpkgs> {} }:

with pkgs;
stdenv.mkDerivation {
  name = "sample-impure-env";
  buildInputs = with python3Packages; [
    # basic inputs
    python3Full
    python3Packages.virtualenv
    python3Packages.pip
    python3Packages.nose2

    # project-specific
    tensorflow];
  src = null;
  shellHook = ''
    # set SOURCE_DATE_EPOCH so that we can use python wheels
    SOURCE_DATE_EPOCH=$(date +%s)
    virtualenv --no-setuptools venv
    export PATH=$PWD/venv/bin:$PATH
    pip freeze --all > requirements.txt
    pip install -r requirements.txt
    pip install nose2 -I
  '';
}
