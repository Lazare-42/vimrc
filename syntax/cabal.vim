" Vim syntax file
" Language:	Haskell Cabal Build file
" Maintainer:	Vincent Berthoux <twinside@gmail.com>
" File Types:	.cabal
" v1.4: Add benchmark support, thanks to Simon Meier
" v1.3: Updated to the last version of cabal
"       Added more highlighting for cabal function, true/false
"       and version number. Also added missing comment highlighting.
"       Cabal known compiler are highlighted too.
"
" V1.2: Added cpp-options which was missing. Feature implemented
"       by GHC, found with a GHC warning, but undocumented. 
"       Whatever...
"
" v1.1: Fixed operator problems and added ftdetect file
"       (thanks to Sebastian Schwarz)
"
" v1.0: Cabal syntax in vimball format
"       (thanks to Magnus Therning)

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match	cabalCategory	"^\c\<executable\>"
syn match	cabalCategory	"^\c\<library\>"
syn match	cabalCategory	"^\c\<foreign-library\>"
syn match	cabalCategory	"^\c\<benchmark\>"
syn match	cabalCategory	"^\c\<test-suite\>"
syn match	cabalCategory	"^\c\<source-repository\>"
syn match	cabalCategory	"^\c\<flag\>"
syn match	cabalCategory	"^\c\<custom-setup\>"

syn keyword     cabalConditional    if else elif
syn match       cabalOperator       "&&\|||\|!"
syn keyword     cabalFunction       os arch impl flag
syn match       cabalComment        /--.*$/
syn match       cabalVersion        "\(==\|>=\|<=\|<\|>\|\^>=\)\s*\d\+\(\.\(\d\)\+\)*\(\.\*\)\?"

syn match       cabalTruth      "\c\<true\>"
syn match       cabalTruth      "\c\<false\>"

syn match       cabalCompiler   "\c\<ghc\>"
syn match       cabalCompiler   "\c\<ghcjs\>"
syn match       cabalCompiler   "\c\<nhc\>"
syn match       cabalCompiler   "\c\<yhc\>"
syn match       cabalCompiler   "\c\<hugs\>"
syn match       cabalCompiler   "\c\<hbc\>"
syn match       cabalCompiler   "\c\<helium\>"
syn match       cabalCompiler   "\c\<jhc\>"
syn match       cabalCompiler   "\c\<lhc\>"

syn keyword cabalOs linux osx windows

" version and cabal-version are special, we match the number in them
syn match	cabalStatement	/^\c\s*\<cabal-version\s*:\s*\(>=\s*\)\?\d\+\(\.\d\+\)/
syn match	cabalStatement	/^\c\s*\<version\s*:\s*\d\+\(\.\d\+\)*/

syn match	cabalStatement	/^\c\s*\<default-language\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<default-extensions\s*:/me=e-1

syn match	cabalStatement	/^\c\s*\<asm-options\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<asm-sources\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<author\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<autogen-includes\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<autogen-modules\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<branch\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<bug-reports\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<build-depends\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<build-tool-depends\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<build-tools\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<build-type\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<buildable\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<c-sources\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<category\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<cc-options\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<copyright\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<cpp-options\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<cxx-options\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<cxx-sources\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<data-dir\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<data-files\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<default\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<description\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<exposed-modules\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<exposed\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<extensions\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<extra-bundled-libraries\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<extra-doc-files\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<extra-dynamic-library-flavours\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<extra-lib-dirs\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<extra-libraries\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<extra-library-flavours\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<extra-source-files\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<extra-tmp-files\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<for example\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<frameworks\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<ghc-options\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<ghc-prof-options\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<ghc-shared-options\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<homepage\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<hs-source-dirs\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<hugs-options\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<include-dirs\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<includes\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<install-includes\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<ld-options\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<license-file\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<license\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<location\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<main-is\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<maintainer\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<manual\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<mixins\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<module\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<name\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<nhc98-options\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<other-extensions\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<other-modules\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<package-url\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<pkgconfig-depends\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<setup-depends\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<stability\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<subdir\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<synopsis\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<tag\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<tested-with\s*:/me=e-1
syn match	cabalStatement	/^\c\s*\<type\s*:/me=e-1

syn match	cabalXStatement	/^\c\s*\<x-[a-z_\-]\+\s*:/me=e-1

syn keyword cabalLanguage Haskell2010 Haskell98
syn match   cabalType     /exitcode-stdio-1.0/
syn keyword cabalExtension
  \ Safe
  \ Trustworthy
  \ Unsafe
  \ AllowAmbiguousTypes
  \ ApplicativeDo
  \ Arrows
  \ AutoDeriveTypeable
  \ BangPatterns
  \ BinaryLiterals
  \ BlockArguments
  \ CApiFFI
  \ CPP
  \ ConstrainedClassMethods
  \ ConstraintKinds
  \ DataKinds
  \ DatatypeContexts
  \ DefaultSignatures
  \ DeriveAnyClass
  \ DeriveDataTypeable
  \ DeriveFoldable
  \ DeriveFunctor
  \ DeriveGeneric
  \ DeriveLift
  \ DeriveTraversable
  \ DerivingStrategies
  \ DerivingVia
  \ DisambiguateRecordFields
  \ DoAndIfThenElse
  \ DoRec
  \ DuplicateRecordFields
  \ EmptyCase
  \ EmptyDataDecls
  \ EmptyDataDeriving
  \ ExistentialQuantification
  \ ExplicitForAll
  \ ExplicitNamespaces
  \ ExtendedDefaultRules
  \ ExtensibleRecords
  \ FlexibleContexts
  \ FlexibleInstances
  \ ForeignFunctionInterface
  \ FunctionalDependencies
  \ GADTSyntax
  \ GADTs
  \ GHCForeignImportPrim
  \ GeneralisedNewtypeDeriving
  \ GeneralizedNewtypeDeriving
  \ Generics
  \ HereDocuments
  \ HexFloatLiterals
  \ ImplicitParams
  \ ImplicitPrelude
  \ ImpredicativeTypes
  \ IncoherentInstances
  \ InstanceSigs
  \ InterruptibleFFI
  \ JavaScriptFFI
  \ KindSignatures
  \ LambdaCase
  \ LiberalTypeSynonyms
  \ MagicHash
  \ MonadComprehensions
  \ MonadFailDesugaring
  \ MonoLocalBinds
  \ MonoPatBinds
  \ MonomorphismRestriction
  \ MultiParamTypeClasses
  \ MultiWayIf
  \ NPlusKPatterns
  \ NamedFieldPuns
  \ NamedWildCards
  \ NegativeLiterals
  \ NewQualifiedOperators
  \ NondecreasingIndentation
  \ NullaryTypeClasses
  \ NumDecimals
  \ NumericUnderscores
  \ OverlappingInstances
  \ OverloadedLabels
  \ OverloadedLists
  \ OverloadedStrings
  \ PackageImports
  \ ParallelArrays
  \ ParallelListComp
  \ PartialTypeSignatures
  \ PatternGuards
  \ PatternSignatures
  \ PatternSynonyms
  \ PolyKinds
  \ PolymorphicComponents
  \ PostfixOperators
  \ QuantifiedConstraints
  \ QuasiQuotes
  \ Rank2Types
  \ RankNTypes
  \ RebindableSyntax
  \ RecordPuns
  \ RecordWildCards
  \ RecursiveDo
  \ RegularPatterns
  \ RelaxedPolyRec
  \ RestrictedTypeSynonyms
  \ RoleAnnotations
  \ SafeImports
  \ ScopedTypeVariables
  \ StandaloneDeriving
  \ StarIsType
  \ StaticPointers
  \ Strict
  \ StrictData
  \ TemplateHaskell
  \ TemplateHaskellQuotes
  \ TraditionalRecordSyntax
  \ TransformListComp
  \ TupleSections
  \ TypeApplications
  \ TypeFamilies
  \ TypeFamilyDependencies
  \ TypeInType
  \ TypeOperators
  \ TypeSynonymInstances
  \ UnboxedSums
  \ UnboxedTuples
  \ UndecidableInstances
  \ UndecidableSuperClasses
  \ UnicodeSyntax
  \ UnliftedFFITypes
  \ ViewPatterns
  \ XmlSyntax
  \ NoAllowAmbiguousTypes
  \ NoApplicativeDo
  \ NoArrows
  \ NoAutoDeriveTypeable
  \ NoBangPatterns
  \ NoBinaryLiterals
  \ NoBlockArguments
  \ NoCApiFFI
  \ NoCPP
  \ NoConstrainedClassMethods
  \ NoConstraintKinds
  \ NoDataKinds
  \ NoDatatypeContexts
  \ NoDefaultSignatures
  \ NoDeriveAnyClass
  \ NoDeriveDataTypeable
  \ NoDeriveFoldable
  \ NoDeriveFunctor
  \ NoDeriveGeneric
  \ NoDeriveLift
  \ NoDeriveTraversable
  \ NoDerivingStrategies
  \ NoDerivingVia
  \ NoDisambiguateRecordFields
  \ NoDoAndIfThenElse
  \ NoDoRec
  \ NoDuplicateRecordFields
  \ NoEmptyCase
  \ NoEmptyDataDecls
  \ NoEmptyDataDeriving
  \ NoExistentialQuantification
  \ NoExplicitForAll
  \ NoExplicitNamespaces
  \ NoExtendedDefaultRules
  \ NoExtensibleRecords
  \ NoFlexibleContexts
  \ NoFlexibleInstances
  \ NoForeignFunctionInterface
  \ NoFunctionalDependencies
  \ NoGADTSyntax
  \ NoGADTs
  \ NoGHCForeignImportPrim
  \ NoGeneralisedNewtypeDeriving
  \ NoGeneralizedNewtypeDeriving
  \ NoGenerics
  \ NoHereDocuments
  \ NoHexFloatLiterals
  \ NoImplicitParams
  \ NoImplicitPrelude
  \ NoImpredicativeTypes
  \ NoIncoherentInstances
  \ NoInstanceSigs
  \ NoInterruptibleFFI
  \ NoJavaScriptFFI
  \ NoKindSignatures
  \ NoLambdaCase
  \ NoLiberalTypeSynonyms
  \ NoMagicHash
  \ NoMonadComprehensions
  \ NoMonadFailDesugaring
  \ NoMonoLocalBinds
  \ NoMonoPatBinds
  \ NoMonomorphismRestriction
  \ NoMultiParamTypeClasses
  \ NoMultiWayIf
  \ NoNPlusKPatterns
  \ NoNamedFieldPuns
  \ NoNamedWildCards
  \ NoNegativeLiterals
  \ NoNewQualifiedOperators
  \ NoNondecreasingIndentation
  \ NoNullaryTypeClasses
  \ NoNumDecimals
  \ NoNumericUnderscores
  \ NoOverlappingInstances
  \ NoOverloadedLabels
  \ NoOverloadedLists
  \ NoOverloadedStrings
  \ NoPackageImports
  \ NoParallelArrays
  \ NoParallelListComp
  \ NoPartialTypeSignatures
  \ NoPatternGuards
  \ NoPatternSignatures
  \ NoPatternSynonyms
  \ NoPolyKinds
  \ NoPolymorphicComponents
  \ NoPostfixOperators
  \ NoQuantifiedConstraints
  \ NoQuasiQuotes
  \ NoRank2Types
  \ NoRankNTypes
  \ NoRebindableSyntax
  \ NoRecordPuns
  \ NoRecordWildCards
  \ NoRecursiveDo
  \ NoRegularPatterns
  \ NoRelaxedPolyRec
  \ NoRestrictedTypeSynonyms
  \ NoRoleAnnotations
  \ NoSafeImports
  \ NoScopedTypeVariables
  \ NoStandaloneDeriving
  \ NoStarIsType
  \ NoStaticPointers
  \ NoStrict
  \ NoStrictData
  \ NoTemplateHaskell
  \ NoTemplateHaskellQuotes
  \ NoTraditionalRecordSyntax
  \ NoTransformListComp
  \ NoTupleSections
  \ NoTypeApplications
  \ NoTypeFamilies
  \ NoTypeFamilyDependencies
  \ NoTypeInType
  \ NoTypeOperators
  \ NoTypeSynonymInstances
  \ NoUnboxedSums
  \ NoUnboxedTuples
  \ NoUndecidableInstances
  \ NoUndecidableSuperClasses
  \ NoUnicodeSyntax
  \ NoUnliftedFFITypes
  \ NoViewPatterns
  \ NoXmlSyntax


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_cabal_syn_inits")
  if version < 508
    let did_cabal_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cabalVersion       Number
  HiLink cabalTruth         Boolean
  HiLink cabalComment       Comment
  HiLink cabalStatement     Statement
  HiLink cabalXStatement    Keyword
  HiLink cabalCategory      Type
  HiLink cabalFunction      Function
  HiLink cabalConditional   Conditional
  HiLink cabalOperator      Operator
  HiLink cabalCompiler      Constant
  HiLink cabalOs            Constant
  HiLink cabalLanguage      Constant
  HiLink cabalType          Constant
  HiLink cabalExtension     Constant

  delcommand HiLink
endif

let b:current_syntax = "cabal"

" vim: ts=8