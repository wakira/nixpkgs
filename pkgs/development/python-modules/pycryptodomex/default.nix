{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "pycryptodomex";
  version = "3.9.1";

  meta = {
    description = "A self-contained cryptographic library for Python";
    homepage = https://www.pycryptodome.org;
    license = lib.licenses.bsd2;
  };

  src = fetchPypi {
    inherit pname version;
    sha256 = "478cce6245e8ff8cda8f733ef1a1161ee6bf5aaa45312e1ace6c7b80fbc1e01f";
  };
}
