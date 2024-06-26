{
  stdenv,
  lib,
  fetchFromGitHub,
  libcap,
  acl,
  file,
  readline,
  python3,
}:

stdenv.mkDerivation rec {
  pname = "clifm";
  version = "cd8bb247bb389b8db11fc21334babc9720934c41"; # commit

  src = fetchFromGitHub {
    owner = "leo-arch";
    repo = pname;
    rev = "${version}";
    hash = "sha256-JFmosmlg7Gaac3n4WfR3fBEhwC/NiDp9i9LY1dATYbI=";
  };

  buildInputs = [
    libcap
    acl
    file
    readline
    python3
  ];

  makeFlags = [
    "PREFIX=${placeholder "out"}"
    "DATADIR=${placeholder "out"}/share"
  ];

  enableParallelBuilding = true;

  meta = with lib; {
    homepage = "https://github.com/leo-arch/clifm";
    description = "CliFM is a CLI-based, shell-like, and non-curses terminal file manager written in C: simple, fast, extensible, and lightweight as hell";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ nadir-ishiguro ];
    platforms = platforms.unix;
    mainProgram = "clifm";
  };
}
