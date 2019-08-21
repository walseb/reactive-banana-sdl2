{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, stdenv, base, linear, reactive-banana, resourcet, sdl2, sdl2-image, sdl2-ttf, text, vector

      }:
        mkDerivation {
          pname = "reactive-banana-sdl2-BSD";
          version = "0.1.0.0";
          src = ./.;
          isLibrary = false;
          isExecutable = true;
          executableHaskellDepends = [
            # base linear reactive-banana sdl2 sdl2-image sdl2-sprite lens monad-loops cabal-install extra
            base linear reactive-banana resourcet sdl2 sdl2-image sdl2-ttf text vector
          ];
          license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});

in

  if pkgs.lib.inNixShell then drv.env else drv
