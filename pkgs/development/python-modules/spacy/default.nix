{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, pytest
, preshed
, ftfy
, numpy
, murmurhash
, plac
, ujson
, dill
, requests
, thinc
, regex
, cymem
, pathlib
, msgpack
, msgpack-numpy
, jsonschema
, blis
, wasabi
, srsly
, setuptools
}:

buildPythonPackage rec {
  pname = "spacy";
  version = "2.2.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "4a1b47a1af437f43987384cd6d8061f5b3e8985f0f2b323f9644ba8e733e79a4";
  };

  prePatch = ''
    substituteInPlace setup.cfg \
      --replace "plac<1.0.0,>=0.9.6" "plac>=0.9.6" \
      --replace "thinc>=7.1.1,<7.2.0" "thinc~=7.0"
  '';

  propagatedBuildInputs = [
   numpy
   murmurhash
   cymem
   preshed
   thinc
   plac
   ujson
   dill
   requests
   regex
   ftfy
   msgpack
   msgpack-numpy
   jsonschema
   blis
   wasabi
   srsly
   setuptools
  ] ++ lib.optional (pythonOlder "3.4") pathlib;

  checkInputs = [
    pytest
  ];

  doCheck = false;
  # checkPhase = ''
  #   ${python.interpreter} -m pytest spacy/tests --vectors --models --slow
  # '';

  meta = with lib; {
    description = "Industrial-strength Natural Language Processing (NLP) with Python and Cython";
    homepage = https://github.com/explosion/spaCy;
    license = licenses.mit;
    maintainers = with maintainers; [ danieldk sdll ];
    };
}
