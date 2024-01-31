# This file was @generated by cargo2nix 0.11.0.
# It is not intended to be manually edited.

args@{
  release ? true,
  rootFeatures ? [
    "quad/default"
  ],
  rustPackages,
  buildRustPackages,
  hostPlatform,
  hostPlatformCpu ? null,
  hostPlatformFeatures ? [],
  target ? null,
  codegenOpts ? null,
  profileOpts ? null,
  cargoUnstableFlags ? null,
  rustcLinkFlags ? null,
  rustcBuildFlags ? null,
  mkRustCrate,
  rustLib,
  lib,
  workspaceSrc,
  ignoreLockHash,
}:
let
  nixifiedLockHash = "33c5fa668b49745d85ad4c81304c4c937b6b5b1b39213fa5fb6ca1e5a9c64360";
  workspaceSrc = if args.workspaceSrc == null then ./. else args.workspaceSrc;
  currentLockHash = builtins.hashFile "sha256" (workspaceSrc + /Cargo.lock);
  lockHashIgnored = if ignoreLockHash
                  then builtins.trace "Ignoring lock hash" ignoreLockHash
                  else ignoreLockHash;
in if !lockHashIgnored && (nixifiedLockHash != currentLockHash) then
  throw ("Cargo.nix ${nixifiedLockHash} is out of sync with Cargo.lock ${currentLockHash}")
else let
  inherit (rustLib) fetchCratesIo fetchCrateLocal fetchCrateGit fetchCrateAlternativeRegistry expandFeatures decideProfile genDrvsByProfile;
  profilesByName = {
  };
  rootFeatures' = expandFeatures rootFeatures;
  overridableMkRustCrate = f:
    let
      drvs = genDrvsByProfile profilesByName ({ profile, profileName }: mkRustCrate ({ inherit release profile hostPlatformCpu hostPlatformFeatures target profileOpts codegenOpts cargoUnstableFlags rustcLinkFlags rustcBuildFlags; } // (f profileName)));
    in { compileMode ? null, profileName ? decideProfile compileMode release }:
      let drv = drvs.${profileName}; in if compileMode == null then drv else drv.override { inherit compileMode; };
in
{
  cargo2nixVersion = "0.11.0";
  workspace = {
    quad = rustPackages.unknown.quad."0.1.0";
  };
  "registry+https://github.com/rust-lang/crates.io-index".adler."1.0.2" = overridableMkRustCrate (profileName: rec {
    name = "adler";
    version = "1.0.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ahash."0.8.7" = overridableMkRustCrate (profileName: rec {
    name = "ahash";
    version = "0.8.7";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "77c3a9648d43b9cd48db467b3f87fdd6e146bcc88ab0180006cef2179fe11d01"; };
    dependencies = {
      cfg_if = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".cfg-if."1.0.0" { inherit profileName; }).out;
      ${ if !((hostPlatform.parsed.cpu.name == "armv6l" || hostPlatform.parsed.cpu.name == "armv7l") && hostPlatform.parsed.kernel.name == "none") then "once_cell" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".once_cell."1.19.0" { inherit profileName; }).out;
      zerocopy = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".zerocopy."0.7.32" { inherit profileName; }).out;
    };
    buildDependencies = {
      version_check = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".version_check."0.9.4" { profileName = "__noProfile"; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" = overridableMkRustCrate (profileName: rec {
    name = "autocfg";
    version = "1.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".bitflags."1.3.2" = overridableMkRustCrate (profileName: rec {
    name = "bitflags";
    version = "1.3.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".bumpalo."3.14.0" = overridableMkRustCrate (profileName: rec {
    name = "bumpalo";
    version = "3.14.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "7f30e7476521f6f8af1a1c4c0b8cc94f0bee37d91763d0ca2665f299b6cd8aec"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".bytemuck."1.14.1" = overridableMkRustCrate (profileName: rec {
    name = "bytemuck";
    version = "1.14.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "ed2490600f404f2b94c167e31d3ed1d5f3c225a0f3b80230053b3e0b7b962bd9"; };
    features = builtins.concatLists [
      [ "extern_crate_alloc" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".byteorder."1.5.0" = overridableMkRustCrate (profileName: rec {
    name = "byteorder";
    version = "1.5.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".cfg-if."1.0.0" = overridableMkRustCrate (profileName: rec {
    name = "cfg-if";
    version = "1.0.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".color_quant."1.1.0" = overridableMkRustCrate (profileName: rec {
    name = "color_quant";
    version = "1.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".crc32fast."1.3.2" = overridableMkRustCrate (profileName: rec {
    name = "crc32fast";
    version = "1.3.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "b540bd8bc810d3885c6ea91e2018302f68baba2129ab3e88f32389ee9370880d"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
    dependencies = {
      cfg_if = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".cfg-if."1.0.0" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".fdeflate."0.3.4" = overridableMkRustCrate (profileName: rec {
    name = "fdeflate";
    version = "0.3.4";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "4f9bfee30e4dedf0ab8b422f03af778d9612b63f502710fc500a334ebe2de645"; };
    dependencies = {
      simd_adler32 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".simd-adler32."0.3.7" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".flate2."1.0.28" = overridableMkRustCrate (profileName: rec {
    name = "flate2";
    version = "1.0.28";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "46303f565772937ffe1d394a4fac6f411c6013172fadde9dcdb1e147a086940e"; };
    features = builtins.concatLists [
      [ "any_impl" ]
      [ "default" ]
      [ "miniz_oxide" ]
      [ "rust_backend" ]
    ];
    dependencies = {
      crc32fast = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".crc32fast."1.3.2" { inherit profileName; }).out;
      miniz_oxide = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".miniz_oxide."0.7.1" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".fontdue."0.7.3" = overridableMkRustCrate (profileName: rec {
    name = "fontdue";
    version = "0.7.3";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "0793f5137567643cf65ea42043a538804ff0fbf288649e2141442b602d81f9bc"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "simd" ]
    ];
    dependencies = {
      hashbrown = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".hashbrown."0.13.2" { inherit profileName; }).out;
      ttf_parser = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".ttf-parser."0.15.2" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".glam."0.21.3" = overridableMkRustCrate (profileName: rec {
    name = "glam";
    version = "0.21.3";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "518faa5064866338b013ff9b2350dc318e14cc4fcd6cb8206d7e7c9886c98815"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "scalar-math" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".hashbrown."0.13.2" = overridableMkRustCrate (profileName: rec {
    name = "hashbrown";
    version = "0.13.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "43a3c133739dddd0d2990f9a4bdf8eb4b21ef50e4851ca85ab661199821d510e"; };
    features = builtins.concatLists [
      [ "ahash" ]
      [ "default" ]
      [ "inline-more" ]
    ];
    dependencies = {
      ahash = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".ahash."0.8.7" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".image."0.24.8" = overridableMkRustCrate (profileName: rec {
    name = "image";
    version = "0.24.8";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "034bbe799d1909622a74d1193aa50147769440040ff36cb2baa947609b0a4e23"; };
    features = builtins.concatLists [
      [ "png" ]
      [ "tga" ]
    ];
    dependencies = {
      bytemuck = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".bytemuck."1.14.1" { inherit profileName; }).out;
      byteorder = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".byteorder."1.5.0" { inherit profileName; }).out;
      color_quant = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".color_quant."1.1.0" { inherit profileName; }).out;
      num_traits = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".num-traits."0.2.17" { inherit profileName; }).out;
      png = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".png."0.17.11" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".libc."0.2.152" = overridableMkRustCrate (profileName: rec {
    name = "libc";
    version = "0.2.152";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".macroquad."0.4.4" = overridableMkRustCrate (profileName: rec {
    name = "macroquad";
    version = "0.4.4";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "a0bf249d79f5080e200334fe30ffca25582d682ee2e180768ad7f121ba9f8caa"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
    dependencies = {
      bumpalo = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".bumpalo."3.14.0" { inherit profileName; }).out;
      fontdue = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".fontdue."0.7.3" { inherit profileName; }).out;
      glam = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".glam."0.21.3" { inherit profileName; }).out;
      image = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".image."0.24.8" { inherit profileName; }).out;
      macroquad_macro = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".macroquad_macro."0.1.7" { profileName = "__noProfile"; }).out;
      miniquad = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".miniquad."0.4.0-alpha.10" { inherit profileName; }).out;
      quad_rand = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".quad-rand."0.2.1" { inherit profileName; }).out;
      slotmap = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".slotmap."1.0.7" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".macroquad_macro."0.1.7" = overridableMkRustCrate (profileName: rec {
    name = "macroquad_macro";
    version = "0.1.7";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "f5cecfede1e530599c8686f7f2d609489101d3d63741a6dc423afc997ce3fcc8"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".malloc_buf."0.0.6" = overridableMkRustCrate (profileName: rec {
    name = "malloc_buf";
    version = "0.0.6";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb"; };
    dependencies = {
      libc = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.152" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".miniquad."0.4.0-alpha.10" = overridableMkRustCrate (profileName: rec {
    name = "miniquad";
    version = "0.4.0-alpha.10";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "18742c400c9aa2d9b4ca72d366a38c9e2d896386e50c2e6d905b6028543a0a0b"; };
    features = builtins.concatLists [
      [ "log-impl" ]
    ];
    dependencies = {
      ${ if hostPlatform.parsed.kernel.name == "android" || hostPlatform.parsed.kernel.name == "linux" then "libc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.152" { inherit profileName; }).out;
      ${ if hostPlatform.parsed.kernel.name == "android" then "ndk_sys" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".ndk-sys."0.2.2" { inherit profileName; }).out;
      ${ if hostPlatform.parsed.kernel.name == "darwin" || hostPlatform.parsed.kernel.name == "ios" then "objc" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".objc."0.2.7" { inherit profileName; }).out;
      ${ if hostPlatform.isWindows then "winapi" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.9" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".miniz_oxide."0.7.1" = overridableMkRustCrate (profileName: rec {
    name = "miniz_oxide";
    version = "0.7.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "e7810e0be55b428ada41041c41f32c9f1a42817901b4ccf45fa3d4b6561e74c7"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "simd" ]
      [ "simd-adler32" ]
      [ "with-alloc" ]
    ];
    dependencies = {
      adler = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".adler."1.0.2" { inherit profileName; }).out;
      simd_adler32 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".simd-adler32."0.3.7" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ndk-sys."0.2.2" = overridableMkRustCrate (profileName: rec {
    name = "ndk-sys";
    version = "0.2.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "e1bcdd74c20ad5d95aacd60ef9ba40fdf77f767051040541df557b7a9b2a2121"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".num-traits."0.2.17" = overridableMkRustCrate (profileName: rec {
    name = "num-traits";
    version = "0.2.17";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "39e3200413f237f41ab11ad6d161bc7239c84dcb631773ccd7de3dfe4b5c267c"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
    buildDependencies = {
      autocfg = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" { profileName = "__noProfile"; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".objc."0.2.7" = overridableMkRustCrate (profileName: rec {
    name = "objc";
    version = "0.2.7";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "915b1b472bc21c53464d6c8461c9d3af805ba1ef837e1cac254428f4a77177b1"; };
    dependencies = {
      malloc_buf = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".malloc_buf."0.0.6" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".once_cell."1.19.0" = overridableMkRustCrate (profileName: rec {
    name = "once_cell";
    version = "1.19.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"; };
    features = builtins.concatLists [
      [ "alloc" ]
      [ "race" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".png."0.17.11" = overridableMkRustCrate (profileName: rec {
    name = "png";
    version = "0.17.11";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "1f6c3c3e617595665b8ea2ff95a86066be38fb121ff920a9c0eb282abcd1da5a"; };
    dependencies = {
      bitflags = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".bitflags."1.3.2" { inherit profileName; }).out;
      crc32fast = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".crc32fast."1.3.2" { inherit profileName; }).out;
      fdeflate = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".fdeflate."0.3.4" { inherit profileName; }).out;
      flate2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".flate2."1.0.28" { inherit profileName; }).out;
      miniz_oxide = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".miniz_oxide."0.7.1" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.78" = overridableMkRustCrate (profileName: rec {
    name = "proc-macro2";
    version = "1.0.78";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "proc-macro" ]
    ];
    dependencies = {
      unicode_ident = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.12" { inherit profileName; }).out;
    };
  });
  
  "unknown".quad."0.1.0" = overridableMkRustCrate (profileName: rec {
    name = "quad";
    version = "0.1.0";
    registry = "unknown";
    src = fetchCrateLocal workspaceSrc;
    dependencies = {
      macroquad = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".macroquad."0.4.4" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".quad-rand."0.2.1" = overridableMkRustCrate (profileName: rec {
    name = "quad-rand";
    version = "0.2.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "658fa1faf7a4cc5f057c9ee5ef560f717ad9d8dc66d975267f709624d6e1ab88"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".quote."1.0.35" = overridableMkRustCrate (profileName: rec {
    name = "quote";
    version = "1.0.35";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "proc-macro" ]
    ];
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.78" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".simd-adler32."0.3.7" = overridableMkRustCrate (profileName: rec {
    name = "simd-adler32";
    version = "0.3.7";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe"; };
    features = builtins.concatLists [
      [ "const-generics" ]
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".slotmap."1.0.7" = overridableMkRustCrate (profileName: rec {
    name = "slotmap";
    version = "1.0.7";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "dbff4acf519f630b3a3ddcfaea6c06b42174d9a44bc70c620e9ed1649d58b82a"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
    buildDependencies = {
      version_check = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".version_check."0.9.4" { profileName = "__noProfile"; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".syn."2.0.48" = overridableMkRustCrate (profileName: rec {
    name = "syn";
    version = "2.0.48";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"; };
    features = builtins.concatLists [
      [ "clone-impls" ]
      [ "default" ]
      [ "derive" ]
      [ "parsing" ]
      [ "printing" ]
      [ "proc-macro" ]
      [ "quote" ]
    ];
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.78" { inherit profileName; }).out;
      quote = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.35" { inherit profileName; }).out;
      unicode_ident = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.12" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ttf-parser."0.15.2" = overridableMkRustCrate (profileName: rec {
    name = "ttf-parser";
    version = "0.15.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "7b3e06c9b9d80ed6b745c7159c40b311ad2916abb34a49e9be2653b90db0d8dd"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.12" = overridableMkRustCrate (profileName: rec {
    name = "unicode-ident";
    version = "1.0.12";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".version_check."0.9.4" = overridableMkRustCrate (profileName: rec {
    name = "version_check";
    version = "0.9.4";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.9" = overridableMkRustCrate (profileName: rec {
    name = "winapi";
    version = "0.3.9";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"; };
    features = builtins.concatLists [
      [ "errhandlingapi" ]
      [ "hidusage" ]
      [ "libloaderapi" ]
      [ "shellscalingapi" ]
      [ "winbase" ]
      [ "windef" ]
      [ "windowsx" ]
      [ "wingdi" ]
      [ "winuser" ]
    ];
    dependencies = {
      ${ if hostPlatform.config == "i686-pc-windows-gnu" then "winapi_i686_pc_windows_gnu" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi-i686-pc-windows-gnu."0.4.0" { inherit profileName; }).out;
      ${ if hostPlatform.config == "x86_64-pc-windows-gnu" then "winapi_x86_64_pc_windows_gnu" else null } = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi-x86_64-pc-windows-gnu."0.4.0" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi-i686-pc-windows-gnu."0.4.0" = overridableMkRustCrate (profileName: rec {
    name = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi-x86_64-pc-windows-gnu."0.4.0" = overridableMkRustCrate (profileName: rec {
    name = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".zerocopy."0.7.32" = overridableMkRustCrate (profileName: rec {
    name = "zerocopy";
    version = "0.7.32";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "74d4d3961e53fa4c9a25a8637fc2bfaf2595b3d3ae34875568a5cf64787716be"; };
    features = builtins.concatLists [
      [ "simd" ]
    ];
    dependencies = {
      ${ if false then "zerocopy_derive" else null } = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".zerocopy-derive."0.7.32" { profileName = "__noProfile"; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".zerocopy-derive."0.7.32" = overridableMkRustCrate (profileName: rec {
    name = "zerocopy-derive";
    version = "0.7.32";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "9ce1b18ccd8e73a9321186f97e46f9f04b778851177567b1975109d26a08d2a6"; };
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.78" { inherit profileName; }).out;
      quote = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.35" { inherit profileName; }).out;
      syn = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".syn."2.0.48" { inherit profileName; }).out;
    };
  });
  
}