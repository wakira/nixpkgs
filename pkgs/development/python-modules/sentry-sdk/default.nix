{ stdenv, buildPythonPackage, fetchPypi, isPy3k, urllib3, certifi, django, flask, tornado, bottle, rq, falcon, celery, pyramid, sanic, aiohttp }:

buildPythonPackage rec {
  pname = "sentry-sdk";
  version = "0.13.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "f6e850f304382d87c5c52c01db8c0004d2ced6a0b073df2f2257168cf31b31aa";
  };

  checkInputs = [ django flask tornado bottle rq falcon ]
  ++ stdenv.lib.optionals isPy3k [ celery pyramid sanic aiohttp ];

  propagatedBuildInputs = [ urllib3 certifi ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/getsentry/sentry-python";
    description = "New Python SDK for Sentry.io";
    license = licenses.bsd2;
    maintainers = with maintainers; [ gebner ];
  };
}
