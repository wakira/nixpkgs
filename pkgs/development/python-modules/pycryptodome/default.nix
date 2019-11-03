{ stdenv, fetchPypi, buildPythonPackage }:

buildPythonPackage rec {
  version = "3.9.1";
  pname = "pycryptodome";

  src = fetchPypi {
    inherit pname version;
    sha256 = "3500826dc3b9a8fdb762bebe551106081a6bdecd4181a3d1bd0206e48bba8974";
  };

  meta = {
    homepage = https://www.pycryptodome.org/;
    description = "Python Cryptography Toolkit";
    platforms = stdenv.lib.platforms.unix;
  };
}
