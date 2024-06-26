{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "pylint-venv";
  version = "3.0.3";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "jgosmann";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-dsVEHJawsTNKVCVmeOa61wOU5GPeyzAU/eUDFrK9PPg=";
  };

  nativeBuildInputs = [ poetry-core ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [ "pylint_venv" ];

  meta = with lib; {
    description = "Module to make pylint respect virtual environments";
    homepage = "https://github.com/jgosmann/pylint-venv/";
    changelog = "https://github.com/jgosmann/pylint-venv/blob/v${version}/CHANGES.md";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
