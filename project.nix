{ mkDerivation, base, linear, reactive-banana, resourcet, sdl2
, sdl2-image, sdl2-ttf, stdenv, text, vector
}:
mkDerivation {
  pname = "reactive-banana-sdl2-BSD";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [
    base linear reactive-banana resourcet sdl2 sdl2-image sdl2-ttf text
    vector
  ];
  homepage = "https://github.com/FortOyer/reactive-banana-sdl2";
  license = stdenv.lib.licenses.bsd3;
}
