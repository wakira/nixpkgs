{ lib
, stdenv
, buildPythonPackage
, fetchPypi
, aiofiles
, graphene
, itsdangerous
, jinja2
, pyyaml
, requests
, ujson
, pytest
, python
, uvicorn
, isPy27
, darwin
}:

buildPythonPackage rec {
  pname = "starlette";
  version = "0.12.12";
  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    sha256 = "65f2a3697a6c0d7917fa7e5bd9bfbef04bc1207fbf0b9e575d8de46c96964c26";
  };

  propagatedBuildInputs = [
    aiofiles
    graphene
    itsdangerous
    jinja2
    pyyaml
    requests
    ujson
    uvicorn
  ] ++ stdenv.lib.optional stdenv.isDarwin [ darwin.apple_sdk.frameworks.ApplicationServices ];

  checkPhase = ''
    ${python.interpreter} -c """
from starlette.applications import Starlette
app = Starlette(debug=True)
"""
  '';

  meta = with lib; {
    homepage = https://www.starlette.io/;
    description = "The little ASGI framework that shines";
    license = licenses.bsd3;
    maintainers = with maintainers; [ wd15 ];
  };
}
