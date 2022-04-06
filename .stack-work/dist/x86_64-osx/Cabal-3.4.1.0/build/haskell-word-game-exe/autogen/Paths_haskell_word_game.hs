{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_haskell_word_game (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/macadmin/Code/haskell-word-game/.stack-work/install/x86_64-osx/e546c2190100397e37b574f3602f841215fe05dfe62b1aa5187eccb50755dbd2/9.0.2/bin"
libdir     = "/Users/macadmin/Code/haskell-word-game/.stack-work/install/x86_64-osx/e546c2190100397e37b574f3602f841215fe05dfe62b1aa5187eccb50755dbd2/9.0.2/lib/x86_64-osx-ghc-9.0.2/haskell-word-game-0.1.0.0-D3lvsSuaKGi7eMgykUyoN7-haskell-word-game-exe"
dynlibdir  = "/Users/macadmin/Code/haskell-word-game/.stack-work/install/x86_64-osx/e546c2190100397e37b574f3602f841215fe05dfe62b1aa5187eccb50755dbd2/9.0.2/lib/x86_64-osx-ghc-9.0.2"
datadir    = "/Users/macadmin/Code/haskell-word-game/.stack-work/install/x86_64-osx/e546c2190100397e37b574f3602f841215fe05dfe62b1aa5187eccb50755dbd2/9.0.2/share/x86_64-osx-ghc-9.0.2/haskell-word-game-0.1.0.0"
libexecdir = "/Users/macadmin/Code/haskell-word-game/.stack-work/install/x86_64-osx/e546c2190100397e37b574f3602f841215fe05dfe62b1aa5187eccb50755dbd2/9.0.2/libexec/x86_64-osx-ghc-9.0.2/haskell-word-game-0.1.0.0"
sysconfdir = "/Users/macadmin/Code/haskell-word-game/.stack-work/install/x86_64-osx/e546c2190100397e37b574f3602f841215fe05dfe62b1aa5187eccb50755dbd2/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_word_game_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_word_game_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "haskell_word_game_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "haskell_word_game_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_word_game_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_word_game_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
