//// Automatically Generated From SyntaxFactory.swift.gyb.
//// Do Not Edit Directly!
//===------- SyntaxFactory.swift - Syntax Factory implementations ---------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//
//
// This file defines the SyntaxFactory, one of the most important client-facing
// types in lib/Syntax and likely to be very commonly used.
//
// Effectively a namespace, SyntaxFactory is never instantiated, but is *the*
// one-stop shop for making new Syntax nodes. Putting all of these into a
// collection of static methods provides a single point of API lookup for
// clients' convenience.
//
//===----------------------------------------------------------------------===//

public enum SyntaxFactory {
  public static func makeToken(_ kind: TokenKind, presence: SourcePresence,
                               leadingTrivia: Trivia = [],
                               trailingTrivia: Trivia = []) -> TokenSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: kind, leadingTrivia: leadingTrivia,
      trailingTrivia: trailingTrivia, presence: presence)
    let data = SyntaxData.forRoot(raw)
    return TokenSyntax(data)
  }

  public static func makeUnknownSyntax(tokens: [TokenSyntax]) -> UnknownSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: .unknown,
      layout: tokens.map { $0.raw }, presence: .present)
    let data = SyntaxData.forRoot(raw)
    return UnknownSyntax(data)
  }

/// MARK: Syntax Node Creation APIs







  public static func makeBlankUnknownDecl(presence: SourcePresence = .present) -> UnknownDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .unknownDecl,
      layout: [
    ], length: .zero, presence: presence))
    return UnknownDeclSyntax(data)
  }

  public static func makeBlankUnknownExpr(presence: SourcePresence = .present) -> UnknownExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .unknownExpr,
      layout: [
    ], length: .zero, presence: presence))
    return UnknownExprSyntax(data)
  }

  public static func makeBlankUnknownStmt(presence: SourcePresence = .present) -> UnknownStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .unknownStmt,
      layout: [
    ], length: .zero, presence: presence))
    return UnknownStmtSyntax(data)
  }

  public static func makeBlankUnknownType(presence: SourcePresence = .present) -> UnknownTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .unknownType,
      layout: [
    ], length: .zero, presence: presence))
    return UnknownTypeSyntax(data)
  }

  public static func makeBlankUnknownPattern(presence: SourcePresence = .present) -> UnknownPatternSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .unknownPattern,
      layout: [
    ], length: .zero, presence: presence))
    return UnknownPatternSyntax(data)
  }

  public static func makeBlankMissing(presence: SourcePresence = .missing) -> MissingSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .missing,
      layout: [
    ], length: .zero, presence: presence))
    return MissingSyntax(data)
  }

  public static func makeBlankMissingDecl(presence: SourcePresence = .missing) -> MissingDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .missingDecl,
      layout: [
    ], length: .zero, presence: presence))
    return MissingDeclSyntax(data)
  }

  public static func makeBlankMissingExpr(presence: SourcePresence = .missing) -> MissingExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .missingExpr,
      layout: [
    ], length: .zero, presence: presence))
    return MissingExprSyntax(data)
  }

  public static func makeBlankMissingStmt(presence: SourcePresence = .missing) -> MissingStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .missingStmt,
      layout: [
    ], length: .zero, presence: presence))
    return MissingStmtSyntax(data)
  }

  public static func makeBlankMissingType(presence: SourcePresence = .missing) -> MissingTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .missingType,
      layout: [
    ], length: .zero, presence: presence))
    return MissingTypeSyntax(data)
  }

  public static func makeBlankMissingPattern(presence: SourcePresence = .missing) -> MissingPatternSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .missingPattern,
      layout: [
    ], length: .zero, presence: presence))
    return MissingPatternSyntax(data)
  }
  public static func makeCodeBlockItem(garbage garbageBeforeItem: GarbageNodesSyntax? = nil, item: Syntax, garbage garbageBetweenItemAndSemicolon: GarbageNodesSyntax? = nil, semicolon: TokenSyntax?, garbage garbageBetweenSemicolonAndErrorTokens: GarbageNodesSyntax? = nil, errorTokens: Syntax?) -> CodeBlockItemSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeItem?.raw,
      item.raw,
      garbageBetweenItemAndSemicolon?.raw,
      semicolon?.raw,
      garbageBetweenSemicolonAndErrorTokens?.raw,
      errorTokens?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.codeBlockItem,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CodeBlockItemSyntax(data)
  }

  public static func makeBlankCodeBlockItem(presence: SourcePresence = .present) -> CodeBlockItemSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .codeBlockItem,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return CodeBlockItemSyntax(data)
  }
  public static func makeCodeBlockItemList(
    _ elements: [CodeBlockItemSyntax]) -> CodeBlockItemListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.codeBlockItemList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CodeBlockItemListSyntax(data)
  }

  public static func makeBlankCodeBlockItemList(presence: SourcePresence = .present) -> CodeBlockItemListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .codeBlockItemList,
      layout: [
    ], length: .zero, presence: presence))
    return CodeBlockItemListSyntax(data)
  }
  public static func makeCodeBlock(garbage garbageBeforeLeftBrace: GarbageNodesSyntax? = nil, leftBrace: TokenSyntax, garbage garbageBetweenLeftBraceAndStatements: GarbageNodesSyntax? = nil, statements: CodeBlockItemListSyntax, garbage garbageBetweenStatementsAndRightBrace: GarbageNodesSyntax? = nil, rightBrace: TokenSyntax) -> CodeBlockSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftBrace?.raw,
      leftBrace.raw,
      garbageBetweenLeftBraceAndStatements?.raw,
      statements.raw,
      garbageBetweenStatementsAndRightBrace?.raw,
      rightBrace.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.codeBlock,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CodeBlockSyntax(data)
  }

  public static func makeBlankCodeBlock(presence: SourcePresence = .present) -> CodeBlockSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .codeBlock,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftBrace),
      nil,
      RawSyntax.missing(SyntaxKind.codeBlockItemList),
      nil,
      RawSyntax.missingToken(TokenKind.rightBrace),
    ], length: .zero, presence: presence))
    return CodeBlockSyntax(data)
  }
  public static func makeGarbageNodes(
    _ elements: [Syntax]) -> GarbageNodesSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.garbageNodes,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return GarbageNodesSyntax(data)
  }

  public static func makeBlankGarbageNodes(presence: SourcePresence = .present) -> GarbageNodesSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .garbageNodes,
      layout: [
    ], length: .zero, presence: presence))
    return GarbageNodesSyntax(data)
  }
  public static func makeInOutExpr(garbage garbageBeforeAmpersand: GarbageNodesSyntax? = nil, ampersand: TokenSyntax, garbage garbageBetweenAmpersandAndExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax) -> InOutExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAmpersand?.raw,
      ampersand.raw,
      garbageBetweenAmpersandAndExpression?.raw,
      expression.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.inOutExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return InOutExprSyntax(data)
  }

  public static func makeBlankInOutExpr(presence: SourcePresence = .present) -> InOutExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .inOutExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.prefixAmpersand),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return InOutExprSyntax(data)
  }
  public static func makePoundColumnExpr(garbage garbageBeforePoundColumn: GarbageNodesSyntax? = nil, poundColumn: TokenSyntax) -> PoundColumnExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundColumn?.raw,
      poundColumn.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundColumnExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundColumnExprSyntax(data)
  }

  public static func makeBlankPoundColumnExpr(presence: SourcePresence = .present) -> PoundColumnExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundColumnExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundColumnKeyword),
    ], length: .zero, presence: presence))
    return PoundColumnExprSyntax(data)
  }
  public static func makeTupleExprElementList(
    _ elements: [TupleExprElementSyntax]) -> TupleExprElementListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.tupleExprElementList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TupleExprElementListSyntax(data)
  }

  public static func makeBlankTupleExprElementList(presence: SourcePresence = .present) -> TupleExprElementListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .tupleExprElementList,
      layout: [
    ], length: .zero, presence: presence))
    return TupleExprElementListSyntax(data)
  }
  public static func makeArrayElementList(
    _ elements: [ArrayElementSyntax]) -> ArrayElementListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.arrayElementList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ArrayElementListSyntax(data)
  }

  public static func makeBlankArrayElementList(presence: SourcePresence = .present) -> ArrayElementListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .arrayElementList,
      layout: [
    ], length: .zero, presence: presence))
    return ArrayElementListSyntax(data)
  }
  public static func makeDictionaryElementList(
    _ elements: [DictionaryElementSyntax]) -> DictionaryElementListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.dictionaryElementList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DictionaryElementListSyntax(data)
  }

  public static func makeBlankDictionaryElementList(presence: SourcePresence = .present) -> DictionaryElementListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .dictionaryElementList,
      layout: [
    ], length: .zero, presence: presence))
    return DictionaryElementListSyntax(data)
  }
  public static func makeStringLiteralSegments(
    _ elements: [Syntax]) -> StringLiteralSegmentsSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.stringLiteralSegments,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return StringLiteralSegmentsSyntax(data)
  }

  public static func makeBlankStringLiteralSegments(presence: SourcePresence = .present) -> StringLiteralSegmentsSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .stringLiteralSegments,
      layout: [
    ], length: .zero, presence: presence))
    return StringLiteralSegmentsSyntax(data)
  }
  public static func makeTryExpr(garbage garbageBeforeTryKeyword: GarbageNodesSyntax? = nil, tryKeyword: TokenSyntax, garbage garbageBetweenTryKeywordAndQuestionOrExclamationMark: GarbageNodesSyntax? = nil, questionOrExclamationMark: TokenSyntax?, garbage garbageBetweenQuestionOrExclamationMarkAndExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax) -> TryExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeTryKeyword?.raw,
      tryKeyword.raw,
      garbageBetweenTryKeywordAndQuestionOrExclamationMark?.raw,
      questionOrExclamationMark?.raw,
      garbageBetweenQuestionOrExclamationMarkAndExpression?.raw,
      expression.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.tryExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TryExprSyntax(data)
  }

  public static func makeBlankTryExpr(presence: SourcePresence = .present) -> TryExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .tryExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.tryKeyword),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return TryExprSyntax(data)
  }
  public static func makeAwaitExpr(garbage garbageBeforeAwaitKeyword: GarbageNodesSyntax? = nil, awaitKeyword: TokenSyntax, garbage garbageBetweenAwaitKeywordAndExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax) -> AwaitExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAwaitKeyword?.raw,
      awaitKeyword.raw,
      garbageBetweenAwaitKeywordAndExpression?.raw,
      expression.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.awaitExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AwaitExprSyntax(data)
  }

  public static func makeBlankAwaitExpr(presence: SourcePresence = .present) -> AwaitExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .awaitExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.contextualKeyword("")),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return AwaitExprSyntax(data)
  }
  public static func makeDeclNameArgument(garbage garbageBeforeName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax) -> DeclNameArgumentSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeName?.raw,
      name.raw,
      garbageBetweenNameAndColon?.raw,
      colon.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.declNameArgument,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DeclNameArgumentSyntax(data)
  }

  public static func makeBlankDeclNameArgument(presence: SourcePresence = .present) -> DeclNameArgumentSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .declNameArgument,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.unknown("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
    ], length: .zero, presence: presence))
    return DeclNameArgumentSyntax(data)
  }
  public static func makeDeclNameArgumentList(
    _ elements: [DeclNameArgumentSyntax]) -> DeclNameArgumentListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.declNameArgumentList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DeclNameArgumentListSyntax(data)
  }

  public static func makeBlankDeclNameArgumentList(presence: SourcePresence = .present) -> DeclNameArgumentListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .declNameArgumentList,
      layout: [
    ], length: .zero, presence: presence))
    return DeclNameArgumentListSyntax(data)
  }
  public static func makeDeclNameArguments(garbage garbageBeforeLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndArguments: GarbageNodesSyntax? = nil, arguments: DeclNameArgumentListSyntax, garbage garbageBetweenArgumentsAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> DeclNameArgumentsSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndArguments?.raw,
      arguments.raw,
      garbageBetweenArgumentsAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.declNameArguments,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DeclNameArgumentsSyntax(data)
  }

  public static func makeBlankDeclNameArguments(presence: SourcePresence = .present) -> DeclNameArgumentsSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .declNameArguments,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.declNameArgumentList),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return DeclNameArgumentsSyntax(data)
  }
  public static func makeIdentifierExpr(garbage garbageBeforeIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndDeclNameArguments: GarbageNodesSyntax? = nil, declNameArguments: DeclNameArgumentsSyntax?) -> IdentifierExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndDeclNameArguments?.raw,
      declNameArguments?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.identifierExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return IdentifierExprSyntax(data)
  }

  public static func makeBlankIdentifierExpr(presence: SourcePresence = .present) -> IdentifierExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .identifierExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return IdentifierExprSyntax(data)
  }
  public static func makeSuperRefExpr(garbage garbageBeforeSuperKeyword: GarbageNodesSyntax? = nil, superKeyword: TokenSyntax) -> SuperRefExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeSuperKeyword?.raw,
      superKeyword.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.superRefExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SuperRefExprSyntax(data)
  }

  public static func makeBlankSuperRefExpr(presence: SourcePresence = .present) -> SuperRefExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .superRefExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.superKeyword),
    ], length: .zero, presence: presence))
    return SuperRefExprSyntax(data)
  }
  public static func makeNilLiteralExpr(garbage garbageBeforeNilKeyword: GarbageNodesSyntax? = nil, nilKeyword: TokenSyntax) -> NilLiteralExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeNilKeyword?.raw,
      nilKeyword.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.nilLiteralExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return NilLiteralExprSyntax(data)
  }

  public static func makeBlankNilLiteralExpr(presence: SourcePresence = .present) -> NilLiteralExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .nilLiteralExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.nilKeyword),
    ], length: .zero, presence: presence))
    return NilLiteralExprSyntax(data)
  }
  public static func makeDiscardAssignmentExpr(garbage garbageBeforeWildcard: GarbageNodesSyntax? = nil, wildcard: TokenSyntax) -> DiscardAssignmentExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeWildcard?.raw,
      wildcard.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.discardAssignmentExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DiscardAssignmentExprSyntax(data)
  }

  public static func makeBlankDiscardAssignmentExpr(presence: SourcePresence = .present) -> DiscardAssignmentExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .discardAssignmentExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.wildcardKeyword),
    ], length: .zero, presence: presence))
    return DiscardAssignmentExprSyntax(data)
  }
  public static func makeAssignmentExpr(garbage garbageBeforeAssignToken: GarbageNodesSyntax? = nil, assignToken: TokenSyntax) -> AssignmentExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAssignToken?.raw,
      assignToken.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.assignmentExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AssignmentExprSyntax(data)
  }

  public static func makeBlankAssignmentExpr(presence: SourcePresence = .present) -> AssignmentExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .assignmentExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.equal),
    ], length: .zero, presence: presence))
    return AssignmentExprSyntax(data)
  }
  public static func makeSequenceExpr(garbage garbageBeforeElements: GarbageNodesSyntax? = nil, elements: ExprListSyntax) -> SequenceExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeElements?.raw,
      elements.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.sequenceExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SequenceExprSyntax(data)
  }

  public static func makeBlankSequenceExpr(presence: SourcePresence = .present) -> SequenceExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .sequenceExpr,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.exprList),
    ], length: .zero, presence: presence))
    return SequenceExprSyntax(data)
  }
  public static func makeExprList(
    _ elements: [ExprSyntax]) -> ExprListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.exprList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ExprListSyntax(data)
  }

  public static func makeBlankExprList(presence: SourcePresence = .present) -> ExprListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .exprList,
      layout: [
    ], length: .zero, presence: presence))
    return ExprListSyntax(data)
  }
  public static func makePoundLineExpr(garbage garbageBeforePoundLine: GarbageNodesSyntax? = nil, poundLine: TokenSyntax) -> PoundLineExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundLine?.raw,
      poundLine.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundLineExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundLineExprSyntax(data)
  }

  public static func makeBlankPoundLineExpr(presence: SourcePresence = .present) -> PoundLineExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundLineExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundLineKeyword),
    ], length: .zero, presence: presence))
    return PoundLineExprSyntax(data)
  }
  public static func makePoundFileExpr(garbage garbageBeforePoundFile: GarbageNodesSyntax? = nil, poundFile: TokenSyntax) -> PoundFileExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundFile?.raw,
      poundFile.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundFileExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundFileExprSyntax(data)
  }

  public static func makeBlankPoundFileExpr(presence: SourcePresence = .present) -> PoundFileExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundFileExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundFileKeyword),
    ], length: .zero, presence: presence))
    return PoundFileExprSyntax(data)
  }
  public static func makePoundFileIDExpr(garbage garbageBeforePoundFileID: GarbageNodesSyntax? = nil, poundFileID: TokenSyntax) -> PoundFileIDExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundFileID?.raw,
      poundFileID.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundFileIDExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundFileIDExprSyntax(data)
  }

  public static func makeBlankPoundFileIDExpr(presence: SourcePresence = .present) -> PoundFileIDExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundFileIDExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundFileIDKeyword),
    ], length: .zero, presence: presence))
    return PoundFileIDExprSyntax(data)
  }
  public static func makePoundFilePathExpr(garbage garbageBeforePoundFilePath: GarbageNodesSyntax? = nil, poundFilePath: TokenSyntax) -> PoundFilePathExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundFilePath?.raw,
      poundFilePath.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundFilePathExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundFilePathExprSyntax(data)
  }

  public static func makeBlankPoundFilePathExpr(presence: SourcePresence = .present) -> PoundFilePathExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundFilePathExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundFilePathKeyword),
    ], length: .zero, presence: presence))
    return PoundFilePathExprSyntax(data)
  }
  public static func makePoundFunctionExpr(garbage garbageBeforePoundFunction: GarbageNodesSyntax? = nil, poundFunction: TokenSyntax) -> PoundFunctionExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundFunction?.raw,
      poundFunction.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundFunctionExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundFunctionExprSyntax(data)
  }

  public static func makeBlankPoundFunctionExpr(presence: SourcePresence = .present) -> PoundFunctionExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundFunctionExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundFunctionKeyword),
    ], length: .zero, presence: presence))
    return PoundFunctionExprSyntax(data)
  }
  public static func makePoundDsohandleExpr(garbage garbageBeforePoundDsohandle: GarbageNodesSyntax? = nil, poundDsohandle: TokenSyntax) -> PoundDsohandleExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundDsohandle?.raw,
      poundDsohandle.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundDsohandleExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundDsohandleExprSyntax(data)
  }

  public static func makeBlankPoundDsohandleExpr(presence: SourcePresence = .present) -> PoundDsohandleExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundDsohandleExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundDsohandleKeyword),
    ], length: .zero, presence: presence))
    return PoundDsohandleExprSyntax(data)
  }
  public static func makeSymbolicReferenceExpr(garbage garbageBeforeIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndGenericArgumentClause: GarbageNodesSyntax? = nil, genericArgumentClause: GenericArgumentClauseSyntax?) -> SymbolicReferenceExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndGenericArgumentClause?.raw,
      genericArgumentClause?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.symbolicReferenceExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SymbolicReferenceExprSyntax(data)
  }

  public static func makeBlankSymbolicReferenceExpr(presence: SourcePresence = .present) -> SymbolicReferenceExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .symbolicReferenceExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return SymbolicReferenceExprSyntax(data)
  }
  public static func makePrefixOperatorExpr(garbage garbageBeforeOperatorToken: GarbageNodesSyntax? = nil, operatorToken: TokenSyntax?, garbage garbageBetweenOperatorTokenAndPostfixExpression: GarbageNodesSyntax? = nil, postfixExpression: ExprSyntax) -> PrefixOperatorExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeOperatorToken?.raw,
      operatorToken?.raw,
      garbageBetweenOperatorTokenAndPostfixExpression?.raw,
      postfixExpression.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.prefixOperatorExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PrefixOperatorExprSyntax(data)
  }

  public static func makeBlankPrefixOperatorExpr(presence: SourcePresence = .present) -> PrefixOperatorExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .prefixOperatorExpr,
      layout: [
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return PrefixOperatorExprSyntax(data)
  }
  public static func makeBinaryOperatorExpr(garbage garbageBeforeOperatorToken: GarbageNodesSyntax? = nil, operatorToken: TokenSyntax) -> BinaryOperatorExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeOperatorToken?.raw,
      operatorToken.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.binaryOperatorExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return BinaryOperatorExprSyntax(data)
  }

  public static func makeBlankBinaryOperatorExpr(presence: SourcePresence = .present) -> BinaryOperatorExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .binaryOperatorExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.unknown("")),
    ], length: .zero, presence: presence))
    return BinaryOperatorExprSyntax(data)
  }
  public static func makeArrowExpr(garbage garbageBeforeAsyncKeyword: GarbageNodesSyntax? = nil, asyncKeyword: TokenSyntax?, garbage garbageBetweenAsyncKeywordAndThrowsToken: GarbageNodesSyntax? = nil, throwsToken: TokenSyntax?, garbage garbageBetweenThrowsTokenAndArrowToken: GarbageNodesSyntax? = nil, arrowToken: TokenSyntax) -> ArrowExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAsyncKeyword?.raw,
      asyncKeyword?.raw,
      garbageBetweenAsyncKeywordAndThrowsToken?.raw,
      throwsToken?.raw,
      garbageBetweenThrowsTokenAndArrowToken?.raw,
      arrowToken.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.arrowExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ArrowExprSyntax(data)
  }

  public static func makeBlankArrowExpr(presence: SourcePresence = .present) -> ArrowExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .arrowExpr,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.arrow),
    ], length: .zero, presence: presence))
    return ArrowExprSyntax(data)
  }
  public static func makeFloatLiteralExpr(garbage garbageBeforeFloatingDigits: GarbageNodesSyntax? = nil, floatingDigits: TokenSyntax) -> FloatLiteralExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeFloatingDigits?.raw,
      floatingDigits.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.floatLiteralExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return FloatLiteralExprSyntax(data)
  }

  public static func makeBlankFloatLiteralExpr(presence: SourcePresence = .present) -> FloatLiteralExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .floatLiteralExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.floatingLiteral("")),
    ], length: .zero, presence: presence))
    return FloatLiteralExprSyntax(data)
  }
  public static func makeTupleExpr(garbage garbageBeforeLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndElementList: GarbageNodesSyntax? = nil, elementList: TupleExprElementListSyntax, garbage garbageBetweenElementListAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> TupleExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndElementList?.raw,
      elementList.raw,
      garbageBetweenElementListAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.tupleExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TupleExprSyntax(data)
  }

  public static func makeBlankTupleExpr(presence: SourcePresence = .present) -> TupleExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .tupleExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.tupleExprElementList),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return TupleExprSyntax(data)
  }
  public static func makeArrayExpr(garbage garbageBeforeLeftSquare: GarbageNodesSyntax? = nil, leftSquare: TokenSyntax, garbage garbageBetweenLeftSquareAndElements: GarbageNodesSyntax? = nil, elements: ArrayElementListSyntax, garbage garbageBetweenElementsAndRightSquare: GarbageNodesSyntax? = nil, rightSquare: TokenSyntax) -> ArrayExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftSquare?.raw,
      leftSquare.raw,
      garbageBetweenLeftSquareAndElements?.raw,
      elements.raw,
      garbageBetweenElementsAndRightSquare?.raw,
      rightSquare.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.arrayExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ArrayExprSyntax(data)
  }

  public static func makeBlankArrayExpr(presence: SourcePresence = .present) -> ArrayExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .arrayExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftSquareBracket),
      nil,
      RawSyntax.missing(SyntaxKind.arrayElementList),
      nil,
      RawSyntax.missingToken(TokenKind.rightSquareBracket),
    ], length: .zero, presence: presence))
    return ArrayExprSyntax(data)
  }
  public static func makeDictionaryExpr(garbage garbageBeforeLeftSquare: GarbageNodesSyntax? = nil, leftSquare: TokenSyntax, garbage garbageBetweenLeftSquareAndContent: GarbageNodesSyntax? = nil, content: Syntax, garbage garbageBetweenContentAndRightSquare: GarbageNodesSyntax? = nil, rightSquare: TokenSyntax) -> DictionaryExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftSquare?.raw,
      leftSquare.raw,
      garbageBetweenLeftSquareAndContent?.raw,
      content.raw,
      garbageBetweenContentAndRightSquare?.raw,
      rightSquare.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.dictionaryExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DictionaryExprSyntax(data)
  }

  public static func makeBlankDictionaryExpr(presence: SourcePresence = .present) -> DictionaryExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .dictionaryExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftSquareBracket),
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
      nil,
      RawSyntax.missingToken(TokenKind.rightSquareBracket),
    ], length: .zero, presence: presence))
    return DictionaryExprSyntax(data)
  }
  public static func makeTupleExprElement(garbage garbageBeforeLabel: GarbageNodesSyntax? = nil, label: TokenSyntax?, garbage garbageBetweenLabelAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax?, garbage garbageBetweenColonAndExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax, garbage garbageBetweenExpressionAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> TupleExprElementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabel?.raw,
      label?.raw,
      garbageBetweenLabelAndColon?.raw,
      colon?.raw,
      garbageBetweenColonAndExpression?.raw,
      expression.raw,
      garbageBetweenExpressionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.tupleExprElement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TupleExprElementSyntax(data)
  }

  public static func makeBlankTupleExprElement(presence: SourcePresence = .present) -> TupleExprElementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .tupleExprElement,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return TupleExprElementSyntax(data)
  }
  public static func makeArrayElement(garbage garbageBeforeExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax, garbage garbageBetweenExpressionAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> ArrayElementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeExpression?.raw,
      expression.raw,
      garbageBetweenExpressionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.arrayElement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ArrayElementSyntax(data)
  }

  public static func makeBlankArrayElement(presence: SourcePresence = .present) -> ArrayElementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .arrayElement,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return ArrayElementSyntax(data)
  }
  public static func makeDictionaryElement(garbage garbageBeforeKeyExpression: GarbageNodesSyntax? = nil, keyExpression: ExprSyntax, garbage garbageBetweenKeyExpressionAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndValueExpression: GarbageNodesSyntax? = nil, valueExpression: ExprSyntax, garbage garbageBetweenValueExpressionAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> DictionaryElementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeKeyExpression?.raw,
      keyExpression.raw,
      garbageBetweenKeyExpressionAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndValueExpression?.raw,
      valueExpression.raw,
      garbageBetweenValueExpressionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.dictionaryElement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DictionaryElementSyntax(data)
  }

  public static func makeBlankDictionaryElement(presence: SourcePresence = .present) -> DictionaryElementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .dictionaryElement,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return DictionaryElementSyntax(data)
  }
  public static func makeIntegerLiteralExpr(garbage garbageBeforeDigits: GarbageNodesSyntax? = nil, digits: TokenSyntax) -> IntegerLiteralExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeDigits?.raw,
      digits.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.integerLiteralExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return IntegerLiteralExprSyntax(data)
  }

  public static func makeBlankIntegerLiteralExpr(presence: SourcePresence = .present) -> IntegerLiteralExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .integerLiteralExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.integerLiteral("")),
    ], length: .zero, presence: presence))
    return IntegerLiteralExprSyntax(data)
  }
  public static func makeBooleanLiteralExpr(garbage garbageBeforeBooleanLiteral: GarbageNodesSyntax? = nil, booleanLiteral: TokenSyntax) -> BooleanLiteralExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeBooleanLiteral?.raw,
      booleanLiteral.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.booleanLiteralExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return BooleanLiteralExprSyntax(data)
  }

  public static func makeBlankBooleanLiteralExpr(presence: SourcePresence = .present) -> BooleanLiteralExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .booleanLiteralExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.trueKeyword),
    ], length: .zero, presence: presence))
    return BooleanLiteralExprSyntax(data)
  }
  public static func makeTernaryExpr(garbage garbageBeforeConditionExpression: GarbageNodesSyntax? = nil, conditionExpression: ExprSyntax, garbage garbageBetweenConditionExpressionAndQuestionMark: GarbageNodesSyntax? = nil, questionMark: TokenSyntax, garbage garbageBetweenQuestionMarkAndFirstChoice: GarbageNodesSyntax? = nil, firstChoice: ExprSyntax, garbage garbageBetweenFirstChoiceAndColonMark: GarbageNodesSyntax? = nil, colonMark: TokenSyntax, garbage garbageBetweenColonMarkAndSecondChoice: GarbageNodesSyntax? = nil, secondChoice: ExprSyntax) -> TernaryExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeConditionExpression?.raw,
      conditionExpression.raw,
      garbageBetweenConditionExpressionAndQuestionMark?.raw,
      questionMark.raw,
      garbageBetweenQuestionMarkAndFirstChoice?.raw,
      firstChoice.raw,
      garbageBetweenFirstChoiceAndColonMark?.raw,
      colonMark.raw,
      garbageBetweenColonMarkAndSecondChoice?.raw,
      secondChoice.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.ternaryExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TernaryExprSyntax(data)
  }

  public static func makeBlankTernaryExpr(presence: SourcePresence = .present) -> TernaryExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .ternaryExpr,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      RawSyntax.missingToken(TokenKind.infixQuestionMark),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return TernaryExprSyntax(data)
  }
  public static func makeMemberAccessExpr(garbage garbageBeforeBase: GarbageNodesSyntax? = nil, base: ExprSyntax?, garbage garbageBetweenBaseAndDot: GarbageNodesSyntax? = nil, dot: TokenSyntax, garbage garbageBetweenDotAndName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndDeclNameArguments: GarbageNodesSyntax? = nil, declNameArguments: DeclNameArgumentsSyntax?) -> MemberAccessExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeBase?.raw,
      base?.raw,
      garbageBetweenBaseAndDot?.raw,
      dot.raw,
      garbageBetweenDotAndName?.raw,
      name.raw,
      garbageBetweenNameAndDeclNameArguments?.raw,
      declNameArguments?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.memberAccessExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return MemberAccessExprSyntax(data)
  }

  public static func makeBlankMemberAccessExpr(presence: SourcePresence = .present) -> MemberAccessExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .memberAccessExpr,
      layout: [
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.period),
      nil,
      RawSyntax.missingToken(TokenKind.unknown("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return MemberAccessExprSyntax(data)
  }
  public static func makeIsExpr(garbage garbageBeforeIsTok: GarbageNodesSyntax? = nil, isTok: TokenSyntax, garbage garbageBetweenIsTokAndTypeName: GarbageNodesSyntax? = nil, typeName: TypeSyntax) -> IsExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeIsTok?.raw,
      isTok.raw,
      garbageBetweenIsTokAndTypeName?.raw,
      typeName.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.isExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return IsExprSyntax(data)
  }

  public static func makeBlankIsExpr(presence: SourcePresence = .present) -> IsExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .isExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.isKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return IsExprSyntax(data)
  }
  public static func makeAsExpr(garbage garbageBeforeAsTok: GarbageNodesSyntax? = nil, asTok: TokenSyntax, garbage garbageBetweenAsTokAndQuestionOrExclamationMark: GarbageNodesSyntax? = nil, questionOrExclamationMark: TokenSyntax?, garbage garbageBetweenQuestionOrExclamationMarkAndTypeName: GarbageNodesSyntax? = nil, typeName: TypeSyntax) -> AsExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAsTok?.raw,
      asTok.raw,
      garbageBetweenAsTokAndQuestionOrExclamationMark?.raw,
      questionOrExclamationMark?.raw,
      garbageBetweenQuestionOrExclamationMarkAndTypeName?.raw,
      typeName.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.asExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AsExprSyntax(data)
  }

  public static func makeBlankAsExpr(presence: SourcePresence = .present) -> AsExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .asExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.asKeyword),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return AsExprSyntax(data)
  }
  public static func makeTypeExpr(garbage garbageBeforeType: GarbageNodesSyntax? = nil, type: TypeSyntax) -> TypeExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeType?.raw,
      type.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.typeExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TypeExprSyntax(data)
  }

  public static func makeBlankTypeExpr(presence: SourcePresence = .present) -> TypeExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .typeExpr,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return TypeExprSyntax(data)
  }
  public static func makeClosureCaptureItem(garbage garbageBeforeSpecifier: GarbageNodesSyntax? = nil, specifier: TokenListSyntax?, garbage garbageBetweenSpecifierAndName: GarbageNodesSyntax? = nil, name: TokenSyntax?, garbage garbageBetweenNameAndAssignToken: GarbageNodesSyntax? = nil, assignToken: TokenSyntax?, garbage garbageBetweenAssignTokenAndExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax, garbage garbageBetweenExpressionAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> ClosureCaptureItemSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeSpecifier?.raw,
      specifier?.raw,
      garbageBetweenSpecifierAndName?.raw,
      name?.raw,
      garbageBetweenNameAndAssignToken?.raw,
      assignToken?.raw,
      garbageBetweenAssignTokenAndExpression?.raw,
      expression.raw,
      garbageBetweenExpressionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.closureCaptureItem,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ClosureCaptureItemSyntax(data)
  }

  public static func makeBlankClosureCaptureItem(presence: SourcePresence = .present) -> ClosureCaptureItemSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .closureCaptureItem,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return ClosureCaptureItemSyntax(data)
  }
  public static func makeClosureCaptureItemList(
    _ elements: [ClosureCaptureItemSyntax]) -> ClosureCaptureItemListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.closureCaptureItemList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ClosureCaptureItemListSyntax(data)
  }

  public static func makeBlankClosureCaptureItemList(presence: SourcePresence = .present) -> ClosureCaptureItemListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .closureCaptureItemList,
      layout: [
    ], length: .zero, presence: presence))
    return ClosureCaptureItemListSyntax(data)
  }
  public static func makeClosureCaptureSignature(garbage garbageBeforeLeftSquare: GarbageNodesSyntax? = nil, leftSquare: TokenSyntax, garbage garbageBetweenLeftSquareAndItems: GarbageNodesSyntax? = nil, items: ClosureCaptureItemListSyntax?, garbage garbageBetweenItemsAndRightSquare: GarbageNodesSyntax? = nil, rightSquare: TokenSyntax) -> ClosureCaptureSignatureSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftSquare?.raw,
      leftSquare.raw,
      garbageBetweenLeftSquareAndItems?.raw,
      items?.raw,
      garbageBetweenItemsAndRightSquare?.raw,
      rightSquare.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.closureCaptureSignature,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ClosureCaptureSignatureSyntax(data)
  }

  public static func makeBlankClosureCaptureSignature(presence: SourcePresence = .present) -> ClosureCaptureSignatureSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .closureCaptureSignature,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftSquareBracket),
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.rightSquareBracket),
    ], length: .zero, presence: presence))
    return ClosureCaptureSignatureSyntax(data)
  }
  public static func makeClosureParam(garbage garbageBeforeName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> ClosureParamSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeName?.raw,
      name.raw,
      garbageBetweenNameAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.closureParam,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ClosureParamSyntax(data)
  }

  public static func makeBlankClosureParam(presence: SourcePresence = .present) -> ClosureParamSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .closureParam,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return ClosureParamSyntax(data)
  }
  public static func makeClosureParamList(
    _ elements: [ClosureParamSyntax]) -> ClosureParamListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.closureParamList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ClosureParamListSyntax(data)
  }

  public static func makeBlankClosureParamList(presence: SourcePresence = .present) -> ClosureParamListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .closureParamList,
      layout: [
    ], length: .zero, presence: presence))
    return ClosureParamListSyntax(data)
  }
  public static func makeClosureSignature(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndCapture: GarbageNodesSyntax? = nil, capture: ClosureCaptureSignatureSyntax?, garbage garbageBetweenCaptureAndInput: GarbageNodesSyntax? = nil, input: Syntax?, garbage garbageBetweenInputAndAsyncKeyword: GarbageNodesSyntax? = nil, asyncKeyword: TokenSyntax?, garbage garbageBetweenAsyncKeywordAndThrowsTok: GarbageNodesSyntax? = nil, throwsTok: TokenSyntax?, garbage garbageBetweenThrowsTokAndOutput: GarbageNodesSyntax? = nil, output: ReturnClauseSyntax?, garbage garbageBetweenOutputAndInTok: GarbageNodesSyntax? = nil, inTok: TokenSyntax) -> ClosureSignatureSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndCapture?.raw,
      capture?.raw,
      garbageBetweenCaptureAndInput?.raw,
      input?.raw,
      garbageBetweenInputAndAsyncKeyword?.raw,
      asyncKeyword?.raw,
      garbageBetweenAsyncKeywordAndThrowsTok?.raw,
      throwsTok?.raw,
      garbageBetweenThrowsTokAndOutput?.raw,
      output?.raw,
      garbageBetweenOutputAndInTok?.raw,
      inTok.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.closureSignature,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ClosureSignatureSyntax(data)
  }

  public static func makeBlankClosureSignature(presence: SourcePresence = .present) -> ClosureSignatureSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .closureSignature,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.inKeyword),
    ], length: .zero, presence: presence))
    return ClosureSignatureSyntax(data)
  }
  public static func makeClosureExpr(garbage garbageBeforeLeftBrace: GarbageNodesSyntax? = nil, leftBrace: TokenSyntax, garbage garbageBetweenLeftBraceAndSignature: GarbageNodesSyntax? = nil, signature: ClosureSignatureSyntax?, garbage garbageBetweenSignatureAndStatements: GarbageNodesSyntax? = nil, statements: CodeBlockItemListSyntax, garbage garbageBetweenStatementsAndRightBrace: GarbageNodesSyntax? = nil, rightBrace: TokenSyntax) -> ClosureExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftBrace?.raw,
      leftBrace.raw,
      garbageBetweenLeftBraceAndSignature?.raw,
      signature?.raw,
      garbageBetweenSignatureAndStatements?.raw,
      statements.raw,
      garbageBetweenStatementsAndRightBrace?.raw,
      rightBrace.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.closureExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ClosureExprSyntax(data)
  }

  public static func makeBlankClosureExpr(presence: SourcePresence = .present) -> ClosureExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .closureExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftBrace),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.codeBlockItemList),
      nil,
      RawSyntax.missingToken(TokenKind.rightBrace),
    ], length: .zero, presence: presence))
    return ClosureExprSyntax(data)
  }
  public static func makeUnresolvedPatternExpr(garbage garbageBeforePattern: GarbageNodesSyntax? = nil, pattern: PatternSyntax) -> UnresolvedPatternExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePattern?.raw,
      pattern.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.unresolvedPatternExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return UnresolvedPatternExprSyntax(data)
  }

  public static func makeBlankUnresolvedPatternExpr(presence: SourcePresence = .present) -> UnresolvedPatternExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .unresolvedPatternExpr,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingPattern),
    ], length: .zero, presence: presence))
    return UnresolvedPatternExprSyntax(data)
  }
  public static func makeMultipleTrailingClosureElement(garbage garbageBeforeLabel: GarbageNodesSyntax? = nil, label: TokenSyntax, garbage garbageBetweenLabelAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndClosure: GarbageNodesSyntax? = nil, closure: ClosureExprSyntax) -> MultipleTrailingClosureElementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabel?.raw,
      label.raw,
      garbageBetweenLabelAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndClosure?.raw,
      closure.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.multipleTrailingClosureElement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return MultipleTrailingClosureElementSyntax(data)
  }

  public static func makeBlankMultipleTrailingClosureElement(presence: SourcePresence = .present) -> MultipleTrailingClosureElementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .multipleTrailingClosureElement,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.closureExpr),
    ], length: .zero, presence: presence))
    return MultipleTrailingClosureElementSyntax(data)
  }
  public static func makeMultipleTrailingClosureElementList(
    _ elements: [MultipleTrailingClosureElementSyntax]) -> MultipleTrailingClosureElementListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.multipleTrailingClosureElementList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return MultipleTrailingClosureElementListSyntax(data)
  }

  public static func makeBlankMultipleTrailingClosureElementList(presence: SourcePresence = .present) -> MultipleTrailingClosureElementListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .multipleTrailingClosureElementList,
      layout: [
    ], length: .zero, presence: presence))
    return MultipleTrailingClosureElementListSyntax(data)
  }
  public static func makeFunctionCallExpr(garbage garbageBeforeCalledExpression: GarbageNodesSyntax? = nil, calledExpression: ExprSyntax, garbage garbageBetweenCalledExpressionAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax?, garbage garbageBetweenLeftParenAndArgumentList: GarbageNodesSyntax? = nil, argumentList: TupleExprElementListSyntax, garbage garbageBetweenArgumentListAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax?, garbage garbageBetweenRightParenAndTrailingClosure: GarbageNodesSyntax? = nil, trailingClosure: ClosureExprSyntax?, garbage garbageBetweenTrailingClosureAndAdditionalTrailingClosures: GarbageNodesSyntax? = nil, additionalTrailingClosures: MultipleTrailingClosureElementListSyntax?) -> FunctionCallExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeCalledExpression?.raw,
      calledExpression.raw,
      garbageBetweenCalledExpressionAndLeftParen?.raw,
      leftParen?.raw,
      garbageBetweenLeftParenAndArgumentList?.raw,
      argumentList.raw,
      garbageBetweenArgumentListAndRightParen?.raw,
      rightParen?.raw,
      garbageBetweenRightParenAndTrailingClosure?.raw,
      trailingClosure?.raw,
      garbageBetweenTrailingClosureAndAdditionalTrailingClosures?.raw,
      additionalTrailingClosures?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.functionCallExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return FunctionCallExprSyntax(data)
  }

  public static func makeBlankFunctionCallExpr(presence: SourcePresence = .present) -> FunctionCallExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .functionCallExpr,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.tupleExprElementList),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return FunctionCallExprSyntax(data)
  }
  public static func makeSubscriptExpr(garbage garbageBeforeCalledExpression: GarbageNodesSyntax? = nil, calledExpression: ExprSyntax, garbage garbageBetweenCalledExpressionAndLeftBracket: GarbageNodesSyntax? = nil, leftBracket: TokenSyntax, garbage garbageBetweenLeftBracketAndArgumentList: GarbageNodesSyntax? = nil, argumentList: TupleExprElementListSyntax, garbage garbageBetweenArgumentListAndRightBracket: GarbageNodesSyntax? = nil, rightBracket: TokenSyntax, garbage garbageBetweenRightBracketAndTrailingClosure: GarbageNodesSyntax? = nil, trailingClosure: ClosureExprSyntax?, garbage garbageBetweenTrailingClosureAndAdditionalTrailingClosures: GarbageNodesSyntax? = nil, additionalTrailingClosures: MultipleTrailingClosureElementListSyntax?) -> SubscriptExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeCalledExpression?.raw,
      calledExpression.raw,
      garbageBetweenCalledExpressionAndLeftBracket?.raw,
      leftBracket.raw,
      garbageBetweenLeftBracketAndArgumentList?.raw,
      argumentList.raw,
      garbageBetweenArgumentListAndRightBracket?.raw,
      rightBracket.raw,
      garbageBetweenRightBracketAndTrailingClosure?.raw,
      trailingClosure?.raw,
      garbageBetweenTrailingClosureAndAdditionalTrailingClosures?.raw,
      additionalTrailingClosures?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.subscriptExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SubscriptExprSyntax(data)
  }

  public static func makeBlankSubscriptExpr(presence: SourcePresence = .present) -> SubscriptExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .subscriptExpr,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      RawSyntax.missingToken(TokenKind.leftSquareBracket),
      nil,
      RawSyntax.missing(SyntaxKind.tupleExprElementList),
      nil,
      RawSyntax.missingToken(TokenKind.rightSquareBracket),
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return SubscriptExprSyntax(data)
  }
  public static func makeOptionalChainingExpr(garbage garbageBeforeExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax, garbage garbageBetweenExpressionAndQuestionMark: GarbageNodesSyntax? = nil, questionMark: TokenSyntax) -> OptionalChainingExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeExpression?.raw,
      expression.raw,
      garbageBetweenExpressionAndQuestionMark?.raw,
      questionMark.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.optionalChainingExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return OptionalChainingExprSyntax(data)
  }

  public static func makeBlankOptionalChainingExpr(presence: SourcePresence = .present) -> OptionalChainingExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .optionalChainingExpr,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      RawSyntax.missingToken(TokenKind.postfixQuestionMark),
    ], length: .zero, presence: presence))
    return OptionalChainingExprSyntax(data)
  }
  public static func makeForcedValueExpr(garbage garbageBeforeExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax, garbage garbageBetweenExpressionAndExclamationMark: GarbageNodesSyntax? = nil, exclamationMark: TokenSyntax) -> ForcedValueExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeExpression?.raw,
      expression.raw,
      garbageBetweenExpressionAndExclamationMark?.raw,
      exclamationMark.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.forcedValueExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ForcedValueExprSyntax(data)
  }

  public static func makeBlankForcedValueExpr(presence: SourcePresence = .present) -> ForcedValueExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .forcedValueExpr,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      RawSyntax.missingToken(TokenKind.exclamationMark),
    ], length: .zero, presence: presence))
    return ForcedValueExprSyntax(data)
  }
  public static func makePostfixUnaryExpr(garbage garbageBeforeExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax, garbage garbageBetweenExpressionAndOperatorToken: GarbageNodesSyntax? = nil, operatorToken: TokenSyntax) -> PostfixUnaryExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeExpression?.raw,
      expression.raw,
      garbageBetweenExpressionAndOperatorToken?.raw,
      operatorToken.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.postfixUnaryExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PostfixUnaryExprSyntax(data)
  }

  public static func makeBlankPostfixUnaryExpr(presence: SourcePresence = .present) -> PostfixUnaryExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .postfixUnaryExpr,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      RawSyntax.missingToken(TokenKind.postfixOperator("")),
    ], length: .zero, presence: presence))
    return PostfixUnaryExprSyntax(data)
  }
  public static func makeSpecializeExpr(garbage garbageBeforeExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax, garbage garbageBetweenExpressionAndGenericArgumentClause: GarbageNodesSyntax? = nil, genericArgumentClause: GenericArgumentClauseSyntax) -> SpecializeExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeExpression?.raw,
      expression.raw,
      garbageBetweenExpressionAndGenericArgumentClause?.raw,
      genericArgumentClause.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.specializeExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SpecializeExprSyntax(data)
  }

  public static func makeBlankSpecializeExpr(presence: SourcePresence = .present) -> SpecializeExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .specializeExpr,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      RawSyntax.missing(SyntaxKind.genericArgumentClause),
    ], length: .zero, presence: presence))
    return SpecializeExprSyntax(data)
  }
  public static func makeStringSegment(garbage garbageBeforeContent: GarbageNodesSyntax? = nil, content: TokenSyntax) -> StringSegmentSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeContent?.raw,
      content.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.stringSegment,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return StringSegmentSyntax(data)
  }

  public static func makeBlankStringSegment(presence: SourcePresence = .present) -> StringSegmentSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .stringSegment,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.stringSegment("")),
    ], length: .zero, presence: presence))
    return StringSegmentSyntax(data)
  }
  public static func makeExpressionSegment(garbage garbageBeforeBackslash: GarbageNodesSyntax? = nil, backslash: TokenSyntax, garbage garbageBetweenBackslashAndDelimiter: GarbageNodesSyntax? = nil, delimiter: TokenSyntax?, garbage garbageBetweenDelimiterAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndExpressions: GarbageNodesSyntax? = nil, expressions: TupleExprElementListSyntax, garbage garbageBetweenExpressionsAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> ExpressionSegmentSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeBackslash?.raw,
      backslash.raw,
      garbageBetweenBackslashAndDelimiter?.raw,
      delimiter?.raw,
      garbageBetweenDelimiterAndLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndExpressions?.raw,
      expressions.raw,
      garbageBetweenExpressionsAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.expressionSegment,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ExpressionSegmentSyntax(data)
  }

  public static func makeBlankExpressionSegment(presence: SourcePresence = .present) -> ExpressionSegmentSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .expressionSegment,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.backslash),
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.tupleExprElementList),
      nil,
      RawSyntax.missingToken(TokenKind.stringInterpolationAnchor),
    ], length: .zero, presence: presence))
    return ExpressionSegmentSyntax(data)
  }
  public static func makeStringLiteralExpr(garbage garbageBeforeOpenDelimiter: GarbageNodesSyntax? = nil, openDelimiter: TokenSyntax?, garbage garbageBetweenOpenDelimiterAndOpenQuote: GarbageNodesSyntax? = nil, openQuote: TokenSyntax, garbage garbageBetweenOpenQuoteAndSegments: GarbageNodesSyntax? = nil, segments: StringLiteralSegmentsSyntax, garbage garbageBetweenSegmentsAndCloseQuote: GarbageNodesSyntax? = nil, closeQuote: TokenSyntax, garbage garbageBetweenCloseQuoteAndCloseDelimiter: GarbageNodesSyntax? = nil, closeDelimiter: TokenSyntax?) -> StringLiteralExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeOpenDelimiter?.raw,
      openDelimiter?.raw,
      garbageBetweenOpenDelimiterAndOpenQuote?.raw,
      openQuote.raw,
      garbageBetweenOpenQuoteAndSegments?.raw,
      segments.raw,
      garbageBetweenSegmentsAndCloseQuote?.raw,
      closeQuote.raw,
      garbageBetweenCloseQuoteAndCloseDelimiter?.raw,
      closeDelimiter?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.stringLiteralExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return StringLiteralExprSyntax(data)
  }

  public static func makeBlankStringLiteralExpr(presence: SourcePresence = .present) -> StringLiteralExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .stringLiteralExpr,
      layout: [
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.stringQuote),
      nil,
      RawSyntax.missing(SyntaxKind.stringLiteralSegments),
      nil,
      RawSyntax.missingToken(TokenKind.stringQuote),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return StringLiteralExprSyntax(data)
  }
  public static func makeRegexLiteralExpr(garbage garbageBeforeRegex: GarbageNodesSyntax? = nil, regex: TokenSyntax) -> RegexLiteralExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeRegex?.raw,
      regex.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.regexLiteralExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return RegexLiteralExprSyntax(data)
  }

  public static func makeBlankRegexLiteralExpr(presence: SourcePresence = .present) -> RegexLiteralExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .regexLiteralExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.regexLiteral("")),
    ], length: .zero, presence: presence))
    return RegexLiteralExprSyntax(data)
  }
  public static func makeKeyPathExpr(garbage garbageBeforeBackslash: GarbageNodesSyntax? = nil, backslash: TokenSyntax, garbage garbageBetweenBackslashAndRootExpr: GarbageNodesSyntax? = nil, rootExpr: ExprSyntax?, garbage garbageBetweenRootExprAndExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax) -> KeyPathExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeBackslash?.raw,
      backslash.raw,
      garbageBetweenBackslashAndRootExpr?.raw,
      rootExpr?.raw,
      garbageBetweenRootExprAndExpression?.raw,
      expression.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.keyPathExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return KeyPathExprSyntax(data)
  }

  public static func makeBlankKeyPathExpr(presence: SourcePresence = .present) -> KeyPathExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .keyPathExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.backslash),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return KeyPathExprSyntax(data)
  }
  public static func makeKeyPathBaseExpr(garbage garbageBeforePeriod: GarbageNodesSyntax? = nil, period: TokenSyntax) -> KeyPathBaseExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePeriod?.raw,
      period.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.keyPathBaseExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return KeyPathBaseExprSyntax(data)
  }

  public static func makeBlankKeyPathBaseExpr(presence: SourcePresence = .present) -> KeyPathBaseExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .keyPathBaseExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.period),
    ], length: .zero, presence: presence))
    return KeyPathBaseExprSyntax(data)
  }
  public static func makeObjcNamePiece(garbage garbageBeforeName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndDot: GarbageNodesSyntax? = nil, dot: TokenSyntax?) -> ObjcNamePieceSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeName?.raw,
      name.raw,
      garbageBetweenNameAndDot?.raw,
      dot?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.objcNamePiece,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ObjcNamePieceSyntax(data)
  }

  public static func makeBlankObjcNamePiece(presence: SourcePresence = .present) -> ObjcNamePieceSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .objcNamePiece,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return ObjcNamePieceSyntax(data)
  }
  public static func makeObjcName(
    _ elements: [ObjcNamePieceSyntax]) -> ObjcNameSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.objcName,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ObjcNameSyntax(data)
  }

  public static func makeBlankObjcName(presence: SourcePresence = .present) -> ObjcNameSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .objcName,
      layout: [
    ], length: .zero, presence: presence))
    return ObjcNameSyntax(data)
  }
  public static func makeObjcKeyPathExpr(garbage garbageBeforeKeyPath: GarbageNodesSyntax? = nil, keyPath: TokenSyntax, garbage garbageBetweenKeyPathAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndName: GarbageNodesSyntax? = nil, name: ObjcNameSyntax, garbage garbageBetweenNameAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> ObjcKeyPathExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeKeyPath?.raw,
      keyPath.raw,
      garbageBetweenKeyPathAndLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndName?.raw,
      name.raw,
      garbageBetweenNameAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.objcKeyPathExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ObjcKeyPathExprSyntax(data)
  }

  public static func makeBlankObjcKeyPathExpr(presence: SourcePresence = .present) -> ObjcKeyPathExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .objcKeyPathExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundKeyPathKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.objcName),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return ObjcKeyPathExprSyntax(data)
  }
  public static func makeObjcSelectorExpr(garbage garbageBeforePoundSelector: GarbageNodesSyntax? = nil, poundSelector: TokenSyntax, garbage garbageBetweenPoundSelectorAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndKind: GarbageNodesSyntax? = nil, kind: TokenSyntax?, garbage garbageBetweenKindAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax?, garbage garbageBetweenColonAndName: GarbageNodesSyntax? = nil, name: ExprSyntax, garbage garbageBetweenNameAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> ObjcSelectorExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundSelector?.raw,
      poundSelector.raw,
      garbageBetweenPoundSelectorAndLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndKind?.raw,
      kind?.raw,
      garbageBetweenKindAndColon?.raw,
      colon?.raw,
      garbageBetweenColonAndName?.raw,
      name.raw,
      garbageBetweenNameAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.objcSelectorExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ObjcSelectorExprSyntax(data)
  }

  public static func makeBlankObjcSelectorExpr(presence: SourcePresence = .present) -> ObjcSelectorExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .objcSelectorExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundSelectorKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return ObjcSelectorExprSyntax(data)
  }
  public static func makePostfixIfConfigExpr(garbage garbageBeforeBase: GarbageNodesSyntax? = nil, base: ExprSyntax?, garbage garbageBetweenBaseAndConfig: GarbageNodesSyntax? = nil, config: IfConfigDeclSyntax) -> PostfixIfConfigExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeBase?.raw,
      base?.raw,
      garbageBetweenBaseAndConfig?.raw,
      config.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.postfixIfConfigExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PostfixIfConfigExprSyntax(data)
  }

  public static func makeBlankPostfixIfConfigExpr(presence: SourcePresence = .present) -> PostfixIfConfigExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .postfixIfConfigExpr,
      layout: [
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.ifConfigDecl),
    ], length: .zero, presence: presence))
    return PostfixIfConfigExprSyntax(data)
  }
  public static func makeEditorPlaceholderExpr(garbage garbageBeforeIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax) -> EditorPlaceholderExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeIdentifier?.raw,
      identifier.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.editorPlaceholderExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return EditorPlaceholderExprSyntax(data)
  }

  public static func makeBlankEditorPlaceholderExpr(presence: SourcePresence = .present) -> EditorPlaceholderExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .editorPlaceholderExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
    ], length: .zero, presence: presence))
    return EditorPlaceholderExprSyntax(data)
  }
  public static func makeObjectLiteralExpr(garbage garbageBeforeIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndArguments: GarbageNodesSyntax? = nil, arguments: TupleExprElementListSyntax, garbage garbageBetweenArgumentsAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> ObjectLiteralExprSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndArguments?.raw,
      arguments.raw,
      garbageBetweenArgumentsAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.objectLiteralExpr,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ObjectLiteralExprSyntax(data)
  }

  public static func makeBlankObjectLiteralExpr(presence: SourcePresence = .present) -> ObjectLiteralExprSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .objectLiteralExpr,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundColorLiteralKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.tupleExprElementList),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return ObjectLiteralExprSyntax(data)
  }
  public static func makeTypeInitializerClause(garbage garbageBeforeEqual: GarbageNodesSyntax? = nil, equal: TokenSyntax, garbage garbageBetweenEqualAndValue: GarbageNodesSyntax? = nil, value: TypeSyntax) -> TypeInitializerClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeEqual?.raw,
      equal.raw,
      garbageBetweenEqualAndValue?.raw,
      value.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.typeInitializerClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TypeInitializerClauseSyntax(data)
  }

  public static func makeBlankTypeInitializerClause(presence: SourcePresence = .present) -> TypeInitializerClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .typeInitializerClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.equal),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return TypeInitializerClauseSyntax(data)
  }
  public static func makeTypealiasDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndTypealiasKeyword: GarbageNodesSyntax? = nil, typealiasKeyword: TokenSyntax, garbage garbageBetweenTypealiasKeywordAndIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndGenericParameterClause: GarbageNodesSyntax? = nil, genericParameterClause: GenericParameterClauseSyntax?, garbage garbageBetweenGenericParameterClauseAndInitializer: GarbageNodesSyntax? = nil, initializer: TypeInitializerClauseSyntax, garbage garbageBetweenInitializerAndGenericWhereClause: GarbageNodesSyntax? = nil, genericWhereClause: GenericWhereClauseSyntax?) -> TypealiasDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndTypealiasKeyword?.raw,
      typealiasKeyword.raw,
      garbageBetweenTypealiasKeywordAndIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndGenericParameterClause?.raw,
      genericParameterClause?.raw,
      garbageBetweenGenericParameterClauseAndInitializer?.raw,
      initializer.raw,
      garbageBetweenInitializerAndGenericWhereClause?.raw,
      genericWhereClause?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.typealiasDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TypealiasDeclSyntax(data)
  }

  public static func makeBlankTypealiasDecl(presence: SourcePresence = .present) -> TypealiasDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .typealiasDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.typealiasKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.typeInitializerClause),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return TypealiasDeclSyntax(data)
  }
  public static func makeAssociatedtypeDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndAssociatedtypeKeyword: GarbageNodesSyntax? = nil, associatedtypeKeyword: TokenSyntax, garbage garbageBetweenAssociatedtypeKeywordAndIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndInheritanceClause: GarbageNodesSyntax? = nil, inheritanceClause: TypeInheritanceClauseSyntax?, garbage garbageBetweenInheritanceClauseAndInitializer: GarbageNodesSyntax? = nil, initializer: TypeInitializerClauseSyntax?, garbage garbageBetweenInitializerAndGenericWhereClause: GarbageNodesSyntax? = nil, genericWhereClause: GenericWhereClauseSyntax?) -> AssociatedtypeDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndAssociatedtypeKeyword?.raw,
      associatedtypeKeyword.raw,
      garbageBetweenAssociatedtypeKeywordAndIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndInheritanceClause?.raw,
      inheritanceClause?.raw,
      garbageBetweenInheritanceClauseAndInitializer?.raw,
      initializer?.raw,
      garbageBetweenInitializerAndGenericWhereClause?.raw,
      genericWhereClause?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.associatedtypeDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AssociatedtypeDeclSyntax(data)
  }

  public static func makeBlankAssociatedtypeDecl(presence: SourcePresence = .present) -> AssociatedtypeDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .associatedtypeDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.associatedtypeKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return AssociatedtypeDeclSyntax(data)
  }
  public static func makeFunctionParameterList(
    _ elements: [FunctionParameterSyntax]) -> FunctionParameterListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.functionParameterList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return FunctionParameterListSyntax(data)
  }

  public static func makeBlankFunctionParameterList(presence: SourcePresence = .present) -> FunctionParameterListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .functionParameterList,
      layout: [
    ], length: .zero, presence: presence))
    return FunctionParameterListSyntax(data)
  }
  public static func makeParameterClause(garbage garbageBeforeLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndParameterList: GarbageNodesSyntax? = nil, parameterList: FunctionParameterListSyntax, garbage garbageBetweenParameterListAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> ParameterClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndParameterList?.raw,
      parameterList.raw,
      garbageBetweenParameterListAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.parameterClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ParameterClauseSyntax(data)
  }

  public static func makeBlankParameterClause(presence: SourcePresence = .present) -> ParameterClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .parameterClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.functionParameterList),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return ParameterClauseSyntax(data)
  }
  public static func makeReturnClause(garbage garbageBeforeArrow: GarbageNodesSyntax? = nil, arrow: TokenSyntax, garbage garbageBetweenArrowAndReturnType: GarbageNodesSyntax? = nil, returnType: TypeSyntax) -> ReturnClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeArrow?.raw,
      arrow.raw,
      garbageBetweenArrowAndReturnType?.raw,
      returnType.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.returnClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ReturnClauseSyntax(data)
  }

  public static func makeBlankReturnClause(presence: SourcePresence = .present) -> ReturnClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .returnClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.arrow),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return ReturnClauseSyntax(data)
  }
  public static func makeFunctionSignature(garbage garbageBeforeInput: GarbageNodesSyntax? = nil, input: ParameterClauseSyntax, garbage garbageBetweenInputAndAsyncOrReasyncKeyword: GarbageNodesSyntax? = nil, asyncOrReasyncKeyword: TokenSyntax?, garbage garbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword: GarbageNodesSyntax? = nil, throwsOrRethrowsKeyword: TokenSyntax?, garbage garbageBetweenThrowsOrRethrowsKeywordAndOutput: GarbageNodesSyntax? = nil, output: ReturnClauseSyntax?) -> FunctionSignatureSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeInput?.raw,
      input.raw,
      garbageBetweenInputAndAsyncOrReasyncKeyword?.raw,
      asyncOrReasyncKeyword?.raw,
      garbageBetweenAsyncOrReasyncKeywordAndThrowsOrRethrowsKeyword?.raw,
      throwsOrRethrowsKeyword?.raw,
      garbageBetweenThrowsOrRethrowsKeywordAndOutput?.raw,
      output?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.functionSignature,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return FunctionSignatureSyntax(data)
  }

  public static func makeBlankFunctionSignature(presence: SourcePresence = .present) -> FunctionSignatureSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .functionSignature,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.parameterClause),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return FunctionSignatureSyntax(data)
  }
  public static func makeIfConfigClause(garbage garbageBeforePoundKeyword: GarbageNodesSyntax? = nil, poundKeyword: TokenSyntax, garbage garbageBetweenPoundKeywordAndCondition: GarbageNodesSyntax? = nil, condition: ExprSyntax?, garbage garbageBetweenConditionAndElements: GarbageNodesSyntax? = nil, elements: Syntax) -> IfConfigClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundKeyword?.raw,
      poundKeyword.raw,
      garbageBetweenPoundKeywordAndCondition?.raw,
      condition?.raw,
      garbageBetweenConditionAndElements?.raw,
      elements.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.ifConfigClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return IfConfigClauseSyntax(data)
  }

  public static func makeBlankIfConfigClause(presence: SourcePresence = .present) -> IfConfigClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .ifConfigClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundIfKeyword),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
    ], length: .zero, presence: presence))
    return IfConfigClauseSyntax(data)
  }
  public static func makeIfConfigClauseList(
    _ elements: [IfConfigClauseSyntax]) -> IfConfigClauseListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.ifConfigClauseList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return IfConfigClauseListSyntax(data)
  }

  public static func makeBlankIfConfigClauseList(presence: SourcePresence = .present) -> IfConfigClauseListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .ifConfigClauseList,
      layout: [
    ], length: .zero, presence: presence))
    return IfConfigClauseListSyntax(data)
  }
  public static func makeIfConfigDecl(garbage garbageBeforeClauses: GarbageNodesSyntax? = nil, clauses: IfConfigClauseListSyntax, garbage garbageBetweenClausesAndPoundEndif: GarbageNodesSyntax? = nil, poundEndif: TokenSyntax) -> IfConfigDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeClauses?.raw,
      clauses.raw,
      garbageBetweenClausesAndPoundEndif?.raw,
      poundEndif.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.ifConfigDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return IfConfigDeclSyntax(data)
  }

  public static func makeBlankIfConfigDecl(presence: SourcePresence = .present) -> IfConfigDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .ifConfigDecl,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.ifConfigClauseList),
      nil,
      RawSyntax.missingToken(TokenKind.poundEndifKeyword),
    ], length: .zero, presence: presence))
    return IfConfigDeclSyntax(data)
  }
  public static func makePoundErrorDecl(garbage garbageBeforePoundError: GarbageNodesSyntax? = nil, poundError: TokenSyntax, garbage garbageBetweenPoundErrorAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndMessage: GarbageNodesSyntax? = nil, message: StringLiteralExprSyntax, garbage garbageBetweenMessageAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> PoundErrorDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundError?.raw,
      poundError.raw,
      garbageBetweenPoundErrorAndLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndMessage?.raw,
      message.raw,
      garbageBetweenMessageAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundErrorDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundErrorDeclSyntax(data)
  }

  public static func makeBlankPoundErrorDecl(presence: SourcePresence = .present) -> PoundErrorDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundErrorDecl,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundErrorKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.stringLiteralExpr),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return PoundErrorDeclSyntax(data)
  }
  public static func makePoundWarningDecl(garbage garbageBeforePoundWarning: GarbageNodesSyntax? = nil, poundWarning: TokenSyntax, garbage garbageBetweenPoundWarningAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndMessage: GarbageNodesSyntax? = nil, message: StringLiteralExprSyntax, garbage garbageBetweenMessageAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> PoundWarningDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundWarning?.raw,
      poundWarning.raw,
      garbageBetweenPoundWarningAndLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndMessage?.raw,
      message.raw,
      garbageBetweenMessageAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundWarningDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundWarningDeclSyntax(data)
  }

  public static func makeBlankPoundWarningDecl(presence: SourcePresence = .present) -> PoundWarningDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundWarningDecl,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundWarningKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.stringLiteralExpr),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return PoundWarningDeclSyntax(data)
  }
  public static func makePoundSourceLocation(garbage garbageBeforePoundSourceLocation: GarbageNodesSyntax? = nil, poundSourceLocation: TokenSyntax, garbage garbageBetweenPoundSourceLocationAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndArgs: GarbageNodesSyntax? = nil, args: PoundSourceLocationArgsSyntax?, garbage garbageBetweenArgsAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> PoundSourceLocationSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundSourceLocation?.raw,
      poundSourceLocation.raw,
      garbageBetweenPoundSourceLocationAndLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndArgs?.raw,
      args?.raw,
      garbageBetweenArgsAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundSourceLocation,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundSourceLocationSyntax(data)
  }

  public static func makeBlankPoundSourceLocation(presence: SourcePresence = .present) -> PoundSourceLocationSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundSourceLocation,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundSourceLocationKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return PoundSourceLocationSyntax(data)
  }
  public static func makePoundSourceLocationArgs(garbage garbageBeforeFileArgLabel: GarbageNodesSyntax? = nil, fileArgLabel: TokenSyntax, garbage garbageBetweenFileArgLabelAndFileArgColon: GarbageNodesSyntax? = nil, fileArgColon: TokenSyntax, garbage garbageBetweenFileArgColonAndFileName: GarbageNodesSyntax? = nil, fileName: TokenSyntax, garbage garbageBetweenFileNameAndComma: GarbageNodesSyntax? = nil, comma: TokenSyntax, garbage garbageBetweenCommaAndLineArgLabel: GarbageNodesSyntax? = nil, lineArgLabel: TokenSyntax, garbage garbageBetweenLineArgLabelAndLineArgColon: GarbageNodesSyntax? = nil, lineArgColon: TokenSyntax, garbage garbageBetweenLineArgColonAndLineNumber: GarbageNodesSyntax? = nil, lineNumber: TokenSyntax) -> PoundSourceLocationArgsSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeFileArgLabel?.raw,
      fileArgLabel.raw,
      garbageBetweenFileArgLabelAndFileArgColon?.raw,
      fileArgColon.raw,
      garbageBetweenFileArgColonAndFileName?.raw,
      fileName.raw,
      garbageBetweenFileNameAndComma?.raw,
      comma.raw,
      garbageBetweenCommaAndLineArgLabel?.raw,
      lineArgLabel.raw,
      garbageBetweenLineArgLabelAndLineArgColon?.raw,
      lineArgColon.raw,
      garbageBetweenLineArgColonAndLineNumber?.raw,
      lineNumber.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundSourceLocationArgs,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundSourceLocationArgsSyntax(data)
  }

  public static func makeBlankPoundSourceLocationArgs(presence: SourcePresence = .present) -> PoundSourceLocationArgsSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundSourceLocationArgs,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missingToken(TokenKind.stringLiteral("")),
      nil,
      RawSyntax.missingToken(TokenKind.comma),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missingToken(TokenKind.integerLiteral("")),
    ], length: .zero, presence: presence))
    return PoundSourceLocationArgsSyntax(data)
  }
  public static func makeDeclModifierDetail(garbage garbageBeforeLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndDetail: GarbageNodesSyntax? = nil, detail: TokenSyntax, garbage garbageBetweenDetailAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> DeclModifierDetailSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndDetail?.raw,
      detail.raw,
      garbageBetweenDetailAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.declModifierDetail,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DeclModifierDetailSyntax(data)
  }

  public static func makeBlankDeclModifierDetail(presence: SourcePresence = .present) -> DeclModifierDetailSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .declModifierDetail,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return DeclModifierDetailSyntax(data)
  }
  public static func makeDeclModifier(garbage garbageBeforeName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndDetail: GarbageNodesSyntax? = nil, detail: DeclModifierDetailSyntax?) -> DeclModifierSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeName?.raw,
      name.raw,
      garbageBetweenNameAndDetail?.raw,
      detail?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.declModifier,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DeclModifierSyntax(data)
  }

  public static func makeBlankDeclModifier(presence: SourcePresence = .present) -> DeclModifierSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .declModifier,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.unknown("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return DeclModifierSyntax(data)
  }
  public static func makeInheritedType(garbage garbageBeforeTypeName: GarbageNodesSyntax? = nil, typeName: TypeSyntax, garbage garbageBetweenTypeNameAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> InheritedTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeTypeName?.raw,
      typeName.raw,
      garbageBetweenTypeNameAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.inheritedType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return InheritedTypeSyntax(data)
  }

  public static func makeBlankInheritedType(presence: SourcePresence = .present) -> InheritedTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .inheritedType,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return InheritedTypeSyntax(data)
  }
  public static func makeInheritedTypeList(
    _ elements: [InheritedTypeSyntax]) -> InheritedTypeListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.inheritedTypeList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return InheritedTypeListSyntax(data)
  }

  public static func makeBlankInheritedTypeList(presence: SourcePresence = .present) -> InheritedTypeListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .inheritedTypeList,
      layout: [
    ], length: .zero, presence: presence))
    return InheritedTypeListSyntax(data)
  }
  public static func makeTypeInheritanceClause(garbage garbageBeforeColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndInheritedTypeCollection: GarbageNodesSyntax? = nil, inheritedTypeCollection: InheritedTypeListSyntax) -> TypeInheritanceClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeColon?.raw,
      colon.raw,
      garbageBetweenColonAndInheritedTypeCollection?.raw,
      inheritedTypeCollection.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.typeInheritanceClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TypeInheritanceClauseSyntax(data)
  }

  public static func makeBlankTypeInheritanceClause(presence: SourcePresence = .present) -> TypeInheritanceClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .typeInheritanceClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.inheritedTypeList),
    ], length: .zero, presence: presence))
    return TypeInheritanceClauseSyntax(data)
  }
  public static func makeClassDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndClassKeyword: GarbageNodesSyntax? = nil, classKeyword: TokenSyntax, garbage garbageBetweenClassKeywordAndIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndGenericParameterClause: GarbageNodesSyntax? = nil, genericParameterClause: GenericParameterClauseSyntax?, garbage garbageBetweenGenericParameterClauseAndInheritanceClause: GarbageNodesSyntax? = nil, inheritanceClause: TypeInheritanceClauseSyntax?, garbage garbageBetweenInheritanceClauseAndGenericWhereClause: GarbageNodesSyntax? = nil, genericWhereClause: GenericWhereClauseSyntax?, garbage garbageBetweenGenericWhereClauseAndMembers: GarbageNodesSyntax? = nil, members: MemberDeclBlockSyntax) -> ClassDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndClassKeyword?.raw,
      classKeyword.raw,
      garbageBetweenClassKeywordAndIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndGenericParameterClause?.raw,
      genericParameterClause?.raw,
      garbageBetweenGenericParameterClauseAndInheritanceClause?.raw,
      inheritanceClause?.raw,
      garbageBetweenInheritanceClauseAndGenericWhereClause?.raw,
      genericWhereClause?.raw,
      garbageBetweenGenericWhereClauseAndMembers?.raw,
      members.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.classDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ClassDeclSyntax(data)
  }

  public static func makeBlankClassDecl(presence: SourcePresence = .present) -> ClassDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .classDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.classKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.memberDeclBlock),
    ], length: .zero, presence: presence))
    return ClassDeclSyntax(data)
  }
  public static func makeActorDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndActorKeyword: GarbageNodesSyntax? = nil, actorKeyword: TokenSyntax, garbage garbageBetweenActorKeywordAndIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndGenericParameterClause: GarbageNodesSyntax? = nil, genericParameterClause: GenericParameterClauseSyntax?, garbage garbageBetweenGenericParameterClauseAndInheritanceClause: GarbageNodesSyntax? = nil, inheritanceClause: TypeInheritanceClauseSyntax?, garbage garbageBetweenInheritanceClauseAndGenericWhereClause: GarbageNodesSyntax? = nil, genericWhereClause: GenericWhereClauseSyntax?, garbage garbageBetweenGenericWhereClauseAndMembers: GarbageNodesSyntax? = nil, members: MemberDeclBlockSyntax) -> ActorDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndActorKeyword?.raw,
      actorKeyword.raw,
      garbageBetweenActorKeywordAndIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndGenericParameterClause?.raw,
      genericParameterClause?.raw,
      garbageBetweenGenericParameterClauseAndInheritanceClause?.raw,
      inheritanceClause?.raw,
      garbageBetweenInheritanceClauseAndGenericWhereClause?.raw,
      genericWhereClause?.raw,
      garbageBetweenGenericWhereClauseAndMembers?.raw,
      members.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.actorDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ActorDeclSyntax(data)
  }

  public static func makeBlankActorDecl(presence: SourcePresence = .present) -> ActorDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .actorDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.contextualKeyword("")),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.memberDeclBlock),
    ], length: .zero, presence: presence))
    return ActorDeclSyntax(data)
  }
  public static func makeStructDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndStructKeyword: GarbageNodesSyntax? = nil, structKeyword: TokenSyntax, garbage garbageBetweenStructKeywordAndIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndGenericParameterClause: GarbageNodesSyntax? = nil, genericParameterClause: GenericParameterClauseSyntax?, garbage garbageBetweenGenericParameterClauseAndInheritanceClause: GarbageNodesSyntax? = nil, inheritanceClause: TypeInheritanceClauseSyntax?, garbage garbageBetweenInheritanceClauseAndGenericWhereClause: GarbageNodesSyntax? = nil, genericWhereClause: GenericWhereClauseSyntax?, garbage garbageBetweenGenericWhereClauseAndMembers: GarbageNodesSyntax? = nil, members: MemberDeclBlockSyntax) -> StructDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndStructKeyword?.raw,
      structKeyword.raw,
      garbageBetweenStructKeywordAndIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndGenericParameterClause?.raw,
      genericParameterClause?.raw,
      garbageBetweenGenericParameterClauseAndInheritanceClause?.raw,
      inheritanceClause?.raw,
      garbageBetweenInheritanceClauseAndGenericWhereClause?.raw,
      genericWhereClause?.raw,
      garbageBetweenGenericWhereClauseAndMembers?.raw,
      members.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.structDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return StructDeclSyntax(data)
  }

  public static func makeBlankStructDecl(presence: SourcePresence = .present) -> StructDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .structDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.structKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.memberDeclBlock),
    ], length: .zero, presence: presence))
    return StructDeclSyntax(data)
  }
  public static func makeProtocolDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndProtocolKeyword: GarbageNodesSyntax? = nil, protocolKeyword: TokenSyntax, garbage garbageBetweenProtocolKeywordAndIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndPrimaryAssociatedTypeClause: GarbageNodesSyntax? = nil, primaryAssociatedTypeClause: PrimaryAssociatedTypeClauseSyntax?, garbage garbageBetweenPrimaryAssociatedTypeClauseAndInheritanceClause: GarbageNodesSyntax? = nil, inheritanceClause: TypeInheritanceClauseSyntax?, garbage garbageBetweenInheritanceClauseAndGenericWhereClause: GarbageNodesSyntax? = nil, genericWhereClause: GenericWhereClauseSyntax?, garbage garbageBetweenGenericWhereClauseAndMembers: GarbageNodesSyntax? = nil, members: MemberDeclBlockSyntax) -> ProtocolDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndProtocolKeyword?.raw,
      protocolKeyword.raw,
      garbageBetweenProtocolKeywordAndIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndPrimaryAssociatedTypeClause?.raw,
      primaryAssociatedTypeClause?.raw,
      garbageBetweenPrimaryAssociatedTypeClauseAndInheritanceClause?.raw,
      inheritanceClause?.raw,
      garbageBetweenInheritanceClauseAndGenericWhereClause?.raw,
      genericWhereClause?.raw,
      garbageBetweenGenericWhereClauseAndMembers?.raw,
      members.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.protocolDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ProtocolDeclSyntax(data)
  }

  public static func makeBlankProtocolDecl(presence: SourcePresence = .present) -> ProtocolDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .protocolDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.protocolKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.memberDeclBlock),
    ], length: .zero, presence: presence))
    return ProtocolDeclSyntax(data)
  }
  public static func makeExtensionDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndExtensionKeyword: GarbageNodesSyntax? = nil, extensionKeyword: TokenSyntax, garbage garbageBetweenExtensionKeywordAndExtendedType: GarbageNodesSyntax? = nil, extendedType: TypeSyntax, garbage garbageBetweenExtendedTypeAndInheritanceClause: GarbageNodesSyntax? = nil, inheritanceClause: TypeInheritanceClauseSyntax?, garbage garbageBetweenInheritanceClauseAndGenericWhereClause: GarbageNodesSyntax? = nil, genericWhereClause: GenericWhereClauseSyntax?, garbage garbageBetweenGenericWhereClauseAndMembers: GarbageNodesSyntax? = nil, members: MemberDeclBlockSyntax) -> ExtensionDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndExtensionKeyword?.raw,
      extensionKeyword.raw,
      garbageBetweenExtensionKeywordAndExtendedType?.raw,
      extendedType.raw,
      garbageBetweenExtendedTypeAndInheritanceClause?.raw,
      inheritanceClause?.raw,
      garbageBetweenInheritanceClauseAndGenericWhereClause?.raw,
      genericWhereClause?.raw,
      garbageBetweenGenericWhereClauseAndMembers?.raw,
      members.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.extensionDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ExtensionDeclSyntax(data)
  }

  public static func makeBlankExtensionDecl(presence: SourcePresence = .present) -> ExtensionDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .extensionDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.extensionKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.memberDeclBlock),
    ], length: .zero, presence: presence))
    return ExtensionDeclSyntax(data)
  }
  public static func makeMemberDeclBlock(garbage garbageBeforeLeftBrace: GarbageNodesSyntax? = nil, leftBrace: TokenSyntax, garbage garbageBetweenLeftBraceAndMembers: GarbageNodesSyntax? = nil, members: MemberDeclListSyntax, garbage garbageBetweenMembersAndRightBrace: GarbageNodesSyntax? = nil, rightBrace: TokenSyntax) -> MemberDeclBlockSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftBrace?.raw,
      leftBrace.raw,
      garbageBetweenLeftBraceAndMembers?.raw,
      members.raw,
      garbageBetweenMembersAndRightBrace?.raw,
      rightBrace.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.memberDeclBlock,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return MemberDeclBlockSyntax(data)
  }

  public static func makeBlankMemberDeclBlock(presence: SourcePresence = .present) -> MemberDeclBlockSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .memberDeclBlock,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftBrace),
      nil,
      RawSyntax.missing(SyntaxKind.memberDeclList),
      nil,
      RawSyntax.missingToken(TokenKind.rightBrace),
    ], length: .zero, presence: presence))
    return MemberDeclBlockSyntax(data)
  }
  public static func makeMemberDeclList(
    _ elements: [MemberDeclListItemSyntax]) -> MemberDeclListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.memberDeclList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return MemberDeclListSyntax(data)
  }

  public static func makeBlankMemberDeclList(presence: SourcePresence = .present) -> MemberDeclListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .memberDeclList,
      layout: [
    ], length: .zero, presence: presence))
    return MemberDeclListSyntax(data)
  }
  public static func makeMemberDeclListItem(garbage garbageBeforeDecl: GarbageNodesSyntax? = nil, decl: DeclSyntax, garbage garbageBetweenDeclAndSemicolon: GarbageNodesSyntax? = nil, semicolon: TokenSyntax?) -> MemberDeclListItemSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeDecl?.raw,
      decl.raw,
      garbageBetweenDeclAndSemicolon?.raw,
      semicolon?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.memberDeclListItem,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return MemberDeclListItemSyntax(data)
  }

  public static func makeBlankMemberDeclListItem(presence: SourcePresence = .present) -> MemberDeclListItemSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .memberDeclListItem,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingDecl),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return MemberDeclListItemSyntax(data)
  }
  public static func makeSourceFile(garbage garbageBeforeStatements: GarbageNodesSyntax? = nil, statements: CodeBlockItemListSyntax, garbage garbageBetweenStatementsAndEOFToken: GarbageNodesSyntax? = nil, eofToken: TokenSyntax) -> SourceFileSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeStatements?.raw,
      statements.raw,
      garbageBetweenStatementsAndEOFToken?.raw,
      eofToken.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.sourceFile,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SourceFileSyntax(data)
  }

  public static func makeBlankSourceFile(presence: SourcePresence = .present) -> SourceFileSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .sourceFile,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.codeBlockItemList),
      nil,
      RawSyntax.missingToken(TokenKind.unknown("")),
    ], length: .zero, presence: presence))
    return SourceFileSyntax(data)
  }
  public static func makeInitializerClause(garbage garbageBeforeEqual: GarbageNodesSyntax? = nil, equal: TokenSyntax, garbage garbageBetweenEqualAndValue: GarbageNodesSyntax? = nil, value: ExprSyntax) -> InitializerClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeEqual?.raw,
      equal.raw,
      garbageBetweenEqualAndValue?.raw,
      value.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.initializerClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return InitializerClauseSyntax(data)
  }

  public static func makeBlankInitializerClause(presence: SourcePresence = .present) -> InitializerClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .initializerClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.equal),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return InitializerClauseSyntax(data)
  }
  public static func makeFunctionParameter(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndFirstName: GarbageNodesSyntax? = nil, firstName: TokenSyntax?, garbage garbageBetweenFirstNameAndSecondName: GarbageNodesSyntax? = nil, secondName: TokenSyntax?, garbage garbageBetweenSecondNameAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax?, garbage garbageBetweenColonAndType: GarbageNodesSyntax? = nil, type: TypeSyntax?, garbage garbageBetweenTypeAndEllipsis: GarbageNodesSyntax? = nil, ellipsis: TokenSyntax?, garbage garbageBetweenEllipsisAndDefaultArgument: GarbageNodesSyntax? = nil, defaultArgument: InitializerClauseSyntax?, garbage garbageBetweenDefaultArgumentAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> FunctionParameterSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndFirstName?.raw,
      firstName?.raw,
      garbageBetweenFirstNameAndSecondName?.raw,
      secondName?.raw,
      garbageBetweenSecondNameAndColon?.raw,
      colon?.raw,
      garbageBetweenColonAndType?.raw,
      type?.raw,
      garbageBetweenTypeAndEllipsis?.raw,
      ellipsis?.raw,
      garbageBetweenEllipsisAndDefaultArgument?.raw,
      defaultArgument?.raw,
      garbageBetweenDefaultArgumentAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.functionParameter,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return FunctionParameterSyntax(data)
  }

  public static func makeBlankFunctionParameter(presence: SourcePresence = .present) -> FunctionParameterSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .functionParameter,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return FunctionParameterSyntax(data)
  }
  public static func makeModifierList(
    _ elements: [DeclModifierSyntax]) -> ModifierListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.modifierList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ModifierListSyntax(data)
  }

  public static func makeBlankModifierList(presence: SourcePresence = .present) -> ModifierListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .modifierList,
      layout: [
    ], length: .zero, presence: presence))
    return ModifierListSyntax(data)
  }
  public static func makeFunctionDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndFuncKeyword: GarbageNodesSyntax? = nil, funcKeyword: TokenSyntax, garbage garbageBetweenFuncKeywordAndIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndGenericParameterClause: GarbageNodesSyntax? = nil, genericParameterClause: GenericParameterClauseSyntax?, garbage garbageBetweenGenericParameterClauseAndSignature: GarbageNodesSyntax? = nil, signature: FunctionSignatureSyntax, garbage garbageBetweenSignatureAndGenericWhereClause: GarbageNodesSyntax? = nil, genericWhereClause: GenericWhereClauseSyntax?, garbage garbageBetweenGenericWhereClauseAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax?) -> FunctionDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndFuncKeyword?.raw,
      funcKeyword.raw,
      garbageBetweenFuncKeywordAndIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndGenericParameterClause?.raw,
      genericParameterClause?.raw,
      garbageBetweenGenericParameterClauseAndSignature?.raw,
      signature.raw,
      garbageBetweenSignatureAndGenericWhereClause?.raw,
      genericWhereClause?.raw,
      garbageBetweenGenericWhereClauseAndBody?.raw,
      body?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.functionDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return FunctionDeclSyntax(data)
  }

  public static func makeBlankFunctionDecl(presence: SourcePresence = .present) -> FunctionDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .functionDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.funcKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.functionSignature),
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return FunctionDeclSyntax(data)
  }
  public static func makeInitializerDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndInitKeyword: GarbageNodesSyntax? = nil, initKeyword: TokenSyntax, garbage garbageBetweenInitKeywordAndOptionalMark: GarbageNodesSyntax? = nil, optionalMark: TokenSyntax?, garbage garbageBetweenOptionalMarkAndGenericParameterClause: GarbageNodesSyntax? = nil, genericParameterClause: GenericParameterClauseSyntax?, garbage garbageBetweenGenericParameterClauseAndSignature: GarbageNodesSyntax? = nil, signature: FunctionSignatureSyntax, garbage garbageBetweenSignatureAndGenericWhereClause: GarbageNodesSyntax? = nil, genericWhereClause: GenericWhereClauseSyntax?, garbage garbageBetweenGenericWhereClauseAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax?) -> InitializerDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndInitKeyword?.raw,
      initKeyword.raw,
      garbageBetweenInitKeywordAndOptionalMark?.raw,
      optionalMark?.raw,
      garbageBetweenOptionalMarkAndGenericParameterClause?.raw,
      genericParameterClause?.raw,
      garbageBetweenGenericParameterClauseAndSignature?.raw,
      signature.raw,
      garbageBetweenSignatureAndGenericWhereClause?.raw,
      genericWhereClause?.raw,
      garbageBetweenGenericWhereClauseAndBody?.raw,
      body?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.initializerDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return InitializerDeclSyntax(data)
  }

  public static func makeBlankInitializerDecl(presence: SourcePresence = .present) -> InitializerDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .initializerDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.initKeyword),
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.functionSignature),
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return InitializerDeclSyntax(data)
  }
  public static func makeDeinitializerDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndDeinitKeyword: GarbageNodesSyntax? = nil, deinitKeyword: TokenSyntax, garbage garbageBetweenDeinitKeywordAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax?) -> DeinitializerDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndDeinitKeyword?.raw,
      deinitKeyword.raw,
      garbageBetweenDeinitKeywordAndBody?.raw,
      body?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.deinitializerDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DeinitializerDeclSyntax(data)
  }

  public static func makeBlankDeinitializerDecl(presence: SourcePresence = .present) -> DeinitializerDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .deinitializerDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.deinitKeyword),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return DeinitializerDeclSyntax(data)
  }
  public static func makeSubscriptDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndSubscriptKeyword: GarbageNodesSyntax? = nil, subscriptKeyword: TokenSyntax, garbage garbageBetweenSubscriptKeywordAndGenericParameterClause: GarbageNodesSyntax? = nil, genericParameterClause: GenericParameterClauseSyntax?, garbage garbageBetweenGenericParameterClauseAndIndices: GarbageNodesSyntax? = nil, indices: ParameterClauseSyntax, garbage garbageBetweenIndicesAndResult: GarbageNodesSyntax? = nil, result: ReturnClauseSyntax, garbage garbageBetweenResultAndGenericWhereClause: GarbageNodesSyntax? = nil, genericWhereClause: GenericWhereClauseSyntax?, garbage garbageBetweenGenericWhereClauseAndAccessor: GarbageNodesSyntax? = nil, accessor: Syntax?) -> SubscriptDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndSubscriptKeyword?.raw,
      subscriptKeyword.raw,
      garbageBetweenSubscriptKeywordAndGenericParameterClause?.raw,
      genericParameterClause?.raw,
      garbageBetweenGenericParameterClauseAndIndices?.raw,
      indices.raw,
      garbageBetweenIndicesAndResult?.raw,
      result.raw,
      garbageBetweenResultAndGenericWhereClause?.raw,
      genericWhereClause?.raw,
      garbageBetweenGenericWhereClauseAndAccessor?.raw,
      accessor?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.subscriptDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SubscriptDeclSyntax(data)
  }

  public static func makeBlankSubscriptDecl(presence: SourcePresence = .present) -> SubscriptDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .subscriptDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.subscriptKeyword),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.parameterClause),
      nil,
      RawSyntax.missing(SyntaxKind.returnClause),
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return SubscriptDeclSyntax(data)
  }
  public static func makeAccessLevelModifier(garbage garbageBeforeName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndModifier: GarbageNodesSyntax? = nil, modifier: DeclModifierDetailSyntax?) -> AccessLevelModifierSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeName?.raw,
      name.raw,
      garbageBetweenNameAndModifier?.raw,
      modifier?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.accessLevelModifier,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AccessLevelModifierSyntax(data)
  }

  public static func makeBlankAccessLevelModifier(presence: SourcePresence = .present) -> AccessLevelModifierSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .accessLevelModifier,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return AccessLevelModifierSyntax(data)
  }
  public static func makeAccessPathComponent(garbage garbageBeforeName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndTrailingDot: GarbageNodesSyntax? = nil, trailingDot: TokenSyntax?) -> AccessPathComponentSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeName?.raw,
      name.raw,
      garbageBetweenNameAndTrailingDot?.raw,
      trailingDot?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.accessPathComponent,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AccessPathComponentSyntax(data)
  }

  public static func makeBlankAccessPathComponent(presence: SourcePresence = .present) -> AccessPathComponentSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .accessPathComponent,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return AccessPathComponentSyntax(data)
  }
  public static func makeAccessPath(
    _ elements: [AccessPathComponentSyntax]) -> AccessPathSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.accessPath,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AccessPathSyntax(data)
  }

  public static func makeBlankAccessPath(presence: SourcePresence = .present) -> AccessPathSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .accessPath,
      layout: [
    ], length: .zero, presence: presence))
    return AccessPathSyntax(data)
  }
  public static func makeImportDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndImportTok: GarbageNodesSyntax? = nil, importTok: TokenSyntax, garbage garbageBetweenImportTokAndImportKind: GarbageNodesSyntax? = nil, importKind: TokenSyntax?, garbage garbageBetweenImportKindAndPath: GarbageNodesSyntax? = nil, path: AccessPathSyntax) -> ImportDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndImportTok?.raw,
      importTok.raw,
      garbageBetweenImportTokAndImportKind?.raw,
      importKind?.raw,
      garbageBetweenImportKindAndPath?.raw,
      path.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.importDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ImportDeclSyntax(data)
  }

  public static func makeBlankImportDecl(presence: SourcePresence = .present) -> ImportDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .importDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.importKeyword),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.accessPath),
    ], length: .zero, presence: presence))
    return ImportDeclSyntax(data)
  }
  public static func makeAccessorParameter(garbage garbageBeforeLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> AccessorParameterSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndName?.raw,
      name.raw,
      garbageBetweenNameAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.accessorParameter,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AccessorParameterSyntax(data)
  }

  public static func makeBlankAccessorParameter(presence: SourcePresence = .present) -> AccessorParameterSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .accessorParameter,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return AccessorParameterSyntax(data)
  }
  public static func makeAccessorDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifier: GarbageNodesSyntax? = nil, modifier: DeclModifierSyntax?, garbage garbageBetweenModifierAndAccessorKind: GarbageNodesSyntax? = nil, accessorKind: TokenSyntax, garbage garbageBetweenAccessorKindAndParameter: GarbageNodesSyntax? = nil, parameter: AccessorParameterSyntax?, garbage garbageBetweenParameterAndAsyncKeyword: GarbageNodesSyntax? = nil, asyncKeyword: TokenSyntax?, garbage garbageBetweenAsyncKeywordAndThrowsKeyword: GarbageNodesSyntax? = nil, throwsKeyword: TokenSyntax?, garbage garbageBetweenThrowsKeywordAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax?) -> AccessorDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifier?.raw,
      modifier?.raw,
      garbageBetweenModifierAndAccessorKind?.raw,
      accessorKind.raw,
      garbageBetweenAccessorKindAndParameter?.raw,
      parameter?.raw,
      garbageBetweenParameterAndAsyncKeyword?.raw,
      asyncKeyword?.raw,
      garbageBetweenAsyncKeywordAndThrowsKeyword?.raw,
      throwsKeyword?.raw,
      garbageBetweenThrowsKeywordAndBody?.raw,
      body?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.accessorDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AccessorDeclSyntax(data)
  }

  public static func makeBlankAccessorDecl(presence: SourcePresence = .present) -> AccessorDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .accessorDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.unknown("")),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return AccessorDeclSyntax(data)
  }
  public static func makeAccessorList(
    _ elements: [AccessorDeclSyntax]) -> AccessorListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.accessorList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AccessorListSyntax(data)
  }

  public static func makeBlankAccessorList(presence: SourcePresence = .present) -> AccessorListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .accessorList,
      layout: [
    ], length: .zero, presence: presence))
    return AccessorListSyntax(data)
  }
  public static func makeAccessorBlock(garbage garbageBeforeLeftBrace: GarbageNodesSyntax? = nil, leftBrace: TokenSyntax, garbage garbageBetweenLeftBraceAndAccessors: GarbageNodesSyntax? = nil, accessors: AccessorListSyntax, garbage garbageBetweenAccessorsAndRightBrace: GarbageNodesSyntax? = nil, rightBrace: TokenSyntax) -> AccessorBlockSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftBrace?.raw,
      leftBrace.raw,
      garbageBetweenLeftBraceAndAccessors?.raw,
      accessors.raw,
      garbageBetweenAccessorsAndRightBrace?.raw,
      rightBrace.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.accessorBlock,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AccessorBlockSyntax(data)
  }

  public static func makeBlankAccessorBlock(presence: SourcePresence = .present) -> AccessorBlockSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .accessorBlock,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftBrace),
      nil,
      RawSyntax.missing(SyntaxKind.accessorList),
      nil,
      RawSyntax.missingToken(TokenKind.rightBrace),
    ], length: .zero, presence: presence))
    return AccessorBlockSyntax(data)
  }
  public static func makePatternBinding(garbage garbageBeforePattern: GarbageNodesSyntax? = nil, pattern: PatternSyntax, garbage garbageBetweenPatternAndTypeAnnotation: GarbageNodesSyntax? = nil, typeAnnotation: TypeAnnotationSyntax?, garbage garbageBetweenTypeAnnotationAndInitializer: GarbageNodesSyntax? = nil, initializer: InitializerClauseSyntax?, garbage garbageBetweenInitializerAndAccessor: GarbageNodesSyntax? = nil, accessor: Syntax?, garbage garbageBetweenAccessorAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> PatternBindingSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePattern?.raw,
      pattern.raw,
      garbageBetweenPatternAndTypeAnnotation?.raw,
      typeAnnotation?.raw,
      garbageBetweenTypeAnnotationAndInitializer?.raw,
      initializer?.raw,
      garbageBetweenInitializerAndAccessor?.raw,
      accessor?.raw,
      garbageBetweenAccessorAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.patternBinding,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PatternBindingSyntax(data)
  }

  public static func makeBlankPatternBinding(presence: SourcePresence = .present) -> PatternBindingSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .patternBinding,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingPattern),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return PatternBindingSyntax(data)
  }
  public static func makePatternBindingList(
    _ elements: [PatternBindingSyntax]) -> PatternBindingListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.patternBindingList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PatternBindingListSyntax(data)
  }

  public static func makeBlankPatternBindingList(presence: SourcePresence = .present) -> PatternBindingListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .patternBindingList,
      layout: [
    ], length: .zero, presence: presence))
    return PatternBindingListSyntax(data)
  }
  public static func makeVariableDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndLetOrVarKeyword: GarbageNodesSyntax? = nil, letOrVarKeyword: TokenSyntax, garbage garbageBetweenLetOrVarKeywordAndBindings: GarbageNodesSyntax? = nil, bindings: PatternBindingListSyntax) -> VariableDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndLetOrVarKeyword?.raw,
      letOrVarKeyword.raw,
      garbageBetweenLetOrVarKeywordAndBindings?.raw,
      bindings.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.variableDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return VariableDeclSyntax(data)
  }

  public static func makeBlankVariableDecl(presence: SourcePresence = .present) -> VariableDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .variableDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.letKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.patternBindingList),
    ], length: .zero, presence: presence))
    return VariableDeclSyntax(data)
  }
  public static func makeEnumCaseElement(garbage garbageBeforeIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndAssociatedValue: GarbageNodesSyntax? = nil, associatedValue: ParameterClauseSyntax?, garbage garbageBetweenAssociatedValueAndRawValue: GarbageNodesSyntax? = nil, rawValue: InitializerClauseSyntax?, garbage garbageBetweenRawValueAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> EnumCaseElementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndAssociatedValue?.raw,
      associatedValue?.raw,
      garbageBetweenAssociatedValueAndRawValue?.raw,
      rawValue?.raw,
      garbageBetweenRawValueAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.enumCaseElement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return EnumCaseElementSyntax(data)
  }

  public static func makeBlankEnumCaseElement(presence: SourcePresence = .present) -> EnumCaseElementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .enumCaseElement,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return EnumCaseElementSyntax(data)
  }
  public static func makeEnumCaseElementList(
    _ elements: [EnumCaseElementSyntax]) -> EnumCaseElementListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.enumCaseElementList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return EnumCaseElementListSyntax(data)
  }

  public static func makeBlankEnumCaseElementList(presence: SourcePresence = .present) -> EnumCaseElementListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .enumCaseElementList,
      layout: [
    ], length: .zero, presence: presence))
    return EnumCaseElementListSyntax(data)
  }
  public static func makeEnumCaseDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndCaseKeyword: GarbageNodesSyntax? = nil, caseKeyword: TokenSyntax, garbage garbageBetweenCaseKeywordAndElements: GarbageNodesSyntax? = nil, elements: EnumCaseElementListSyntax) -> EnumCaseDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndCaseKeyword?.raw,
      caseKeyword.raw,
      garbageBetweenCaseKeywordAndElements?.raw,
      elements.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.enumCaseDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return EnumCaseDeclSyntax(data)
  }

  public static func makeBlankEnumCaseDecl(presence: SourcePresence = .present) -> EnumCaseDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .enumCaseDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.caseKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.enumCaseElementList),
    ], length: .zero, presence: presence))
    return EnumCaseDeclSyntax(data)
  }
  public static func makeEnumDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndEnumKeyword: GarbageNodesSyntax? = nil, enumKeyword: TokenSyntax, garbage garbageBetweenEnumKeywordAndIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndGenericParameters: GarbageNodesSyntax? = nil, genericParameters: GenericParameterClauseSyntax?, garbage garbageBetweenGenericParametersAndInheritanceClause: GarbageNodesSyntax? = nil, inheritanceClause: TypeInheritanceClauseSyntax?, garbage garbageBetweenInheritanceClauseAndGenericWhereClause: GarbageNodesSyntax? = nil, genericWhereClause: GenericWhereClauseSyntax?, garbage garbageBetweenGenericWhereClauseAndMembers: GarbageNodesSyntax? = nil, members: MemberDeclBlockSyntax) -> EnumDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndEnumKeyword?.raw,
      enumKeyword.raw,
      garbageBetweenEnumKeywordAndIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndGenericParameters?.raw,
      genericParameters?.raw,
      garbageBetweenGenericParametersAndInheritanceClause?.raw,
      inheritanceClause?.raw,
      garbageBetweenInheritanceClauseAndGenericWhereClause?.raw,
      genericWhereClause?.raw,
      garbageBetweenGenericWhereClauseAndMembers?.raw,
      members.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.enumDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return EnumDeclSyntax(data)
  }

  public static func makeBlankEnumDecl(presence: SourcePresence = .present) -> EnumDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .enumDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.enumKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.memberDeclBlock),
    ], length: .zero, presence: presence))
    return EnumDeclSyntax(data)
  }
  public static func makeOperatorDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndOperatorKeyword: GarbageNodesSyntax? = nil, operatorKeyword: TokenSyntax, garbage garbageBetweenOperatorKeywordAndIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndOperatorPrecedenceAndTypes: GarbageNodesSyntax? = nil, operatorPrecedenceAndTypes: OperatorPrecedenceAndTypesSyntax?) -> OperatorDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndOperatorKeyword?.raw,
      operatorKeyword.raw,
      garbageBetweenOperatorKeywordAndIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndOperatorPrecedenceAndTypes?.raw,
      operatorPrecedenceAndTypes?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.operatorDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return OperatorDeclSyntax(data)
  }

  public static func makeBlankOperatorDecl(presence: SourcePresence = .present) -> OperatorDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .operatorDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.operatorKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.unspacedBinaryOperator("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return OperatorDeclSyntax(data)
  }
  public static func makeIdentifierList(
    _ elements: [TokenSyntax]) -> IdentifierListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.identifierList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return IdentifierListSyntax(data)
  }

  public static func makeBlankIdentifierList(presence: SourcePresence = .present) -> IdentifierListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .identifierList,
      layout: [
    ], length: .zero, presence: presence))
    return IdentifierListSyntax(data)
  }
  public static func makeOperatorPrecedenceAndTypes(garbage garbageBeforeColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndPrecedenceGroupAndDesignatedTypes: GarbageNodesSyntax? = nil, precedenceGroupAndDesignatedTypes: IdentifierListSyntax) -> OperatorPrecedenceAndTypesSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeColon?.raw,
      colon.raw,
      garbageBetweenColonAndPrecedenceGroupAndDesignatedTypes?.raw,
      precedenceGroupAndDesignatedTypes.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.operatorPrecedenceAndTypes,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return OperatorPrecedenceAndTypesSyntax(data)
  }

  public static func makeBlankOperatorPrecedenceAndTypes(presence: SourcePresence = .present) -> OperatorPrecedenceAndTypesSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .operatorPrecedenceAndTypes,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.identifierList),
    ], length: .zero, presence: presence))
    return OperatorPrecedenceAndTypesSyntax(data)
  }
  public static func makePrecedenceGroupDecl(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndModifiers: GarbageNodesSyntax? = nil, modifiers: ModifierListSyntax?, garbage garbageBetweenModifiersAndPrecedencegroupKeyword: GarbageNodesSyntax? = nil, precedencegroupKeyword: TokenSyntax, garbage garbageBetweenPrecedencegroupKeywordAndIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax, garbage garbageBetweenIdentifierAndLeftBrace: GarbageNodesSyntax? = nil, leftBrace: TokenSyntax, garbage garbageBetweenLeftBraceAndGroupAttributes: GarbageNodesSyntax? = nil, groupAttributes: PrecedenceGroupAttributeListSyntax, garbage garbageBetweenGroupAttributesAndRightBrace: GarbageNodesSyntax? = nil, rightBrace: TokenSyntax) -> PrecedenceGroupDeclSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndModifiers?.raw,
      modifiers?.raw,
      garbageBetweenModifiersAndPrecedencegroupKeyword?.raw,
      precedencegroupKeyword.raw,
      garbageBetweenPrecedencegroupKeywordAndIdentifier?.raw,
      identifier.raw,
      garbageBetweenIdentifierAndLeftBrace?.raw,
      leftBrace.raw,
      garbageBetweenLeftBraceAndGroupAttributes?.raw,
      groupAttributes.raw,
      garbageBetweenGroupAttributesAndRightBrace?.raw,
      rightBrace.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.precedenceGroupDecl,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PrecedenceGroupDeclSyntax(data)
  }

  public static func makeBlankPrecedenceGroupDecl(presence: SourcePresence = .present) -> PrecedenceGroupDeclSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .precedenceGroupDecl,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.precedencegroupKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.leftBrace),
      nil,
      RawSyntax.missing(SyntaxKind.precedenceGroupAttributeList),
      nil,
      RawSyntax.missingToken(TokenKind.rightBrace),
    ], length: .zero, presence: presence))
    return PrecedenceGroupDeclSyntax(data)
  }
  public static func makePrecedenceGroupAttributeList(
    _ elements: [Syntax]) -> PrecedenceGroupAttributeListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.precedenceGroupAttributeList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PrecedenceGroupAttributeListSyntax(data)
  }

  public static func makeBlankPrecedenceGroupAttributeList(presence: SourcePresence = .present) -> PrecedenceGroupAttributeListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .precedenceGroupAttributeList,
      layout: [
    ], length: .zero, presence: presence))
    return PrecedenceGroupAttributeListSyntax(data)
  }
  public static func makePrecedenceGroupRelation(garbage garbageBeforeHigherThanOrLowerThan: GarbageNodesSyntax? = nil, higherThanOrLowerThan: TokenSyntax, garbage garbageBetweenHigherThanOrLowerThanAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndOtherNames: GarbageNodesSyntax? = nil, otherNames: PrecedenceGroupNameListSyntax) -> PrecedenceGroupRelationSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeHigherThanOrLowerThan?.raw,
      higherThanOrLowerThan.raw,
      garbageBetweenHigherThanOrLowerThanAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndOtherNames?.raw,
      otherNames.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.precedenceGroupRelation,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PrecedenceGroupRelationSyntax(data)
  }

  public static func makeBlankPrecedenceGroupRelation(presence: SourcePresence = .present) -> PrecedenceGroupRelationSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .precedenceGroupRelation,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.precedenceGroupNameList),
    ], length: .zero, presence: presence))
    return PrecedenceGroupRelationSyntax(data)
  }
  public static func makePrecedenceGroupNameList(
    _ elements: [PrecedenceGroupNameElementSyntax]) -> PrecedenceGroupNameListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.precedenceGroupNameList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PrecedenceGroupNameListSyntax(data)
  }

  public static func makeBlankPrecedenceGroupNameList(presence: SourcePresence = .present) -> PrecedenceGroupNameListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .precedenceGroupNameList,
      layout: [
    ], length: .zero, presence: presence))
    return PrecedenceGroupNameListSyntax(data)
  }
  public static func makePrecedenceGroupNameElement(garbage garbageBeforeName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> PrecedenceGroupNameElementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeName?.raw,
      name.raw,
      garbageBetweenNameAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.precedenceGroupNameElement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PrecedenceGroupNameElementSyntax(data)
  }

  public static func makeBlankPrecedenceGroupNameElement(presence: SourcePresence = .present) -> PrecedenceGroupNameElementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .precedenceGroupNameElement,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return PrecedenceGroupNameElementSyntax(data)
  }
  public static func makePrecedenceGroupAssignment(garbage garbageBeforeAssignmentKeyword: GarbageNodesSyntax? = nil, assignmentKeyword: TokenSyntax, garbage garbageBetweenAssignmentKeywordAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndFlag: GarbageNodesSyntax? = nil, flag: TokenSyntax) -> PrecedenceGroupAssignmentSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAssignmentKeyword?.raw,
      assignmentKeyword.raw,
      garbageBetweenAssignmentKeywordAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndFlag?.raw,
      flag.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.precedenceGroupAssignment,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PrecedenceGroupAssignmentSyntax(data)
  }

  public static func makeBlankPrecedenceGroupAssignment(presence: SourcePresence = .present) -> PrecedenceGroupAssignmentSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .precedenceGroupAssignment,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missingToken(TokenKind.trueKeyword),
    ], length: .zero, presence: presence))
    return PrecedenceGroupAssignmentSyntax(data)
  }
  public static func makePrecedenceGroupAssociativity(garbage garbageBeforeAssociativityKeyword: GarbageNodesSyntax? = nil, associativityKeyword: TokenSyntax, garbage garbageBetweenAssociativityKeywordAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndValue: GarbageNodesSyntax? = nil, value: TokenSyntax) -> PrecedenceGroupAssociativitySyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAssociativityKeyword?.raw,
      associativityKeyword.raw,
      garbageBetweenAssociativityKeywordAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndValue?.raw,
      value.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.precedenceGroupAssociativity,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PrecedenceGroupAssociativitySyntax(data)
  }

  public static func makeBlankPrecedenceGroupAssociativity(presence: SourcePresence = .present) -> PrecedenceGroupAssociativitySyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .precedenceGroupAssociativity,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
    ], length: .zero, presence: presence))
    return PrecedenceGroupAssociativitySyntax(data)
  }
  public static func makeTokenList(
    _ elements: [TokenSyntax]) -> TokenListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.tokenList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TokenListSyntax(data)
  }

  public static func makeBlankTokenList(presence: SourcePresence = .present) -> TokenListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .tokenList,
      layout: [
    ], length: .zero, presence: presence))
    return TokenListSyntax(data)
  }
  public static func makeNonEmptyTokenList(
    _ elements: [TokenSyntax]) -> NonEmptyTokenListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.nonEmptyTokenList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return NonEmptyTokenListSyntax(data)
  }

  public static func makeBlankNonEmptyTokenList(presence: SourcePresence = .present) -> NonEmptyTokenListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .nonEmptyTokenList,
      layout: [
    ], length: .zero, presence: presence))
    return NonEmptyTokenListSyntax(data)
  }
  public static func makeCustomAttribute(garbage garbageBeforeAtSignToken: GarbageNodesSyntax? = nil, atSignToken: TokenSyntax, garbage garbageBetweenAtSignTokenAndAttributeName: GarbageNodesSyntax? = nil, attributeName: TypeSyntax, garbage garbageBetweenAttributeNameAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax?, garbage garbageBetweenLeftParenAndArgumentList: GarbageNodesSyntax? = nil, argumentList: TupleExprElementListSyntax?, garbage garbageBetweenArgumentListAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax?) -> CustomAttributeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAtSignToken?.raw,
      atSignToken.raw,
      garbageBetweenAtSignTokenAndAttributeName?.raw,
      attributeName.raw,
      garbageBetweenAttributeNameAndLeftParen?.raw,
      leftParen?.raw,
      garbageBetweenLeftParenAndArgumentList?.raw,
      argumentList?.raw,
      garbageBetweenArgumentListAndRightParen?.raw,
      rightParen?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.customAttribute,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CustomAttributeSyntax(data)
  }

  public static func makeBlankCustomAttribute(presence: SourcePresence = .present) -> CustomAttributeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .customAttribute,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.atSign),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return CustomAttributeSyntax(data)
  }
  public static func makeAttribute(garbage garbageBeforeAtSignToken: GarbageNodesSyntax? = nil, atSignToken: TokenSyntax, garbage garbageBetweenAtSignTokenAndAttributeName: GarbageNodesSyntax? = nil, attributeName: TokenSyntax, garbage garbageBetweenAttributeNameAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax?, garbage garbageBetweenLeftParenAndArgument: GarbageNodesSyntax? = nil, argument: Syntax?, garbage garbageBetweenArgumentAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax?, garbage garbageBetweenRightParenAndTokenList: GarbageNodesSyntax? = nil, tokenList: TokenListSyntax?) -> AttributeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAtSignToken?.raw,
      atSignToken.raw,
      garbageBetweenAtSignTokenAndAttributeName?.raw,
      attributeName.raw,
      garbageBetweenAttributeNameAndLeftParen?.raw,
      leftParen?.raw,
      garbageBetweenLeftParenAndArgument?.raw,
      argument?.raw,
      garbageBetweenArgumentAndRightParen?.raw,
      rightParen?.raw,
      garbageBetweenRightParenAndTokenList?.raw,
      tokenList?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.attribute,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AttributeSyntax(data)
  }

  public static func makeBlankAttribute(presence: SourcePresence = .present) -> AttributeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .attribute,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.atSign),
      nil,
      RawSyntax.missingToken(TokenKind.unknown("")),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return AttributeSyntax(data)
  }
  public static func makeAttributeList(
    _ elements: [Syntax]) -> AttributeListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.attributeList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AttributeListSyntax(data)
  }

  public static func makeBlankAttributeList(presence: SourcePresence = .present) -> AttributeListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .attributeList,
      layout: [
    ], length: .zero, presence: presence))
    return AttributeListSyntax(data)
  }
  public static func makeSpecializeAttributeSpecList(
    _ elements: [Syntax]) -> SpecializeAttributeSpecListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.specializeAttributeSpecList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SpecializeAttributeSpecListSyntax(data)
  }

  public static func makeBlankSpecializeAttributeSpecList(presence: SourcePresence = .present) -> SpecializeAttributeSpecListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .specializeAttributeSpecList,
      layout: [
    ], length: .zero, presence: presence))
    return SpecializeAttributeSpecListSyntax(data)
  }
  public static func makeAvailabilityEntry(garbage garbageBeforeLabel: GarbageNodesSyntax? = nil, label: TokenSyntax, garbage garbageBetweenLabelAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndAvailabilityList: GarbageNodesSyntax? = nil, availabilityList: AvailabilitySpecListSyntax, garbage garbageBetweenAvailabilityListAndSemicolon: GarbageNodesSyntax? = nil, semicolon: TokenSyntax) -> AvailabilityEntrySyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabel?.raw,
      label.raw,
      garbageBetweenLabelAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndAvailabilityList?.raw,
      availabilityList.raw,
      garbageBetweenAvailabilityListAndSemicolon?.raw,
      semicolon.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.availabilityEntry,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AvailabilityEntrySyntax(data)
  }

  public static func makeBlankAvailabilityEntry(presence: SourcePresence = .present) -> AvailabilityEntrySyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .availabilityEntry,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.availabilitySpecList),
      nil,
      RawSyntax.missingToken(TokenKind.semicolon),
    ], length: .zero, presence: presence))
    return AvailabilityEntrySyntax(data)
  }
  public static func makeLabeledSpecializeEntry(garbage garbageBeforeLabel: GarbageNodesSyntax? = nil, label: TokenSyntax, garbage garbageBetweenLabelAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndValue: GarbageNodesSyntax? = nil, value: TokenSyntax, garbage garbageBetweenValueAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> LabeledSpecializeEntrySyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabel?.raw,
      label.raw,
      garbageBetweenLabelAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndValue?.raw,
      value.raw,
      garbageBetweenValueAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.labeledSpecializeEntry,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return LabeledSpecializeEntrySyntax(data)
  }

  public static func makeBlankLabeledSpecializeEntry(presence: SourcePresence = .present) -> LabeledSpecializeEntrySyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .labeledSpecializeEntry,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missingToken(TokenKind.unknown("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return LabeledSpecializeEntrySyntax(data)
  }
  public static func makeTargetFunctionEntry(garbage garbageBeforeLabel: GarbageNodesSyntax? = nil, label: TokenSyntax, garbage garbageBetweenLabelAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndDeclname: GarbageNodesSyntax? = nil, declname: DeclNameSyntax, garbage garbageBetweenDeclnameAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> TargetFunctionEntrySyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabel?.raw,
      label.raw,
      garbageBetweenLabelAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndDeclname?.raw,
      declname.raw,
      garbageBetweenDeclnameAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.targetFunctionEntry,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TargetFunctionEntrySyntax(data)
  }

  public static func makeBlankTargetFunctionEntry(presence: SourcePresence = .present) -> TargetFunctionEntrySyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .targetFunctionEntry,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.declName),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return TargetFunctionEntrySyntax(data)
  }
  public static func makeNamedAttributeStringArgument(garbage garbageBeforeNameTok: GarbageNodesSyntax? = nil, nameTok: TokenSyntax, garbage garbageBetweenNameTokAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndStringOrDeclname: GarbageNodesSyntax? = nil, stringOrDeclname: Syntax) -> NamedAttributeStringArgumentSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeNameTok?.raw,
      nameTok.raw,
      garbageBetweenNameTokAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndStringOrDeclname?.raw,
      stringOrDeclname.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.namedAttributeStringArgument,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return NamedAttributeStringArgumentSyntax(data)
  }

  public static func makeBlankNamedAttributeStringArgument(presence: SourcePresence = .present) -> NamedAttributeStringArgumentSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .namedAttributeStringArgument,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.unknown("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
    ], length: .zero, presence: presence))
    return NamedAttributeStringArgumentSyntax(data)
  }
  public static func makeDeclName(garbage garbageBeforeDeclBaseName: GarbageNodesSyntax? = nil, declBaseName: Syntax, garbage garbageBetweenDeclBaseNameAndDeclNameArguments: GarbageNodesSyntax? = nil, declNameArguments: DeclNameArgumentsSyntax?) -> DeclNameSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeDeclBaseName?.raw,
      declBaseName.raw,
      garbageBetweenDeclBaseNameAndDeclNameArguments?.raw,
      declNameArguments?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.declName,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DeclNameSyntax(data)
  }

  public static func makeBlankDeclName(presence: SourcePresence = .present) -> DeclNameSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .declName,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return DeclNameSyntax(data)
  }
  public static func makeImplementsAttributeArguments(garbage garbageBeforeType: GarbageNodesSyntax? = nil, type: SimpleTypeIdentifierSyntax, garbage garbageBetweenTypeAndComma: GarbageNodesSyntax? = nil, comma: TokenSyntax, garbage garbageBetweenCommaAndDeclBaseName: GarbageNodesSyntax? = nil, declBaseName: Syntax, garbage garbageBetweenDeclBaseNameAndDeclNameArguments: GarbageNodesSyntax? = nil, declNameArguments: DeclNameArgumentsSyntax?) -> ImplementsAttributeArgumentsSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeType?.raw,
      type.raw,
      garbageBetweenTypeAndComma?.raw,
      comma.raw,
      garbageBetweenCommaAndDeclBaseName?.raw,
      declBaseName.raw,
      garbageBetweenDeclBaseNameAndDeclNameArguments?.raw,
      declNameArguments?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.implementsAttributeArguments,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ImplementsAttributeArgumentsSyntax(data)
  }

  public static func makeBlankImplementsAttributeArguments(presence: SourcePresence = .present) -> ImplementsAttributeArgumentsSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .implementsAttributeArguments,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.simpleTypeIdentifier),
      nil,
      RawSyntax.missingToken(TokenKind.comma),
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return ImplementsAttributeArgumentsSyntax(data)
  }
  public static func makeObjCSelectorPiece(garbage garbageBeforeName: GarbageNodesSyntax? = nil, name: TokenSyntax?, garbage garbageBetweenNameAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax?) -> ObjCSelectorPieceSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeName?.raw,
      name?.raw,
      garbageBetweenNameAndColon?.raw,
      colon?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.objCSelectorPiece,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ObjCSelectorPieceSyntax(data)
  }

  public static func makeBlankObjCSelectorPiece(presence: SourcePresence = .present) -> ObjCSelectorPieceSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .objCSelectorPiece,
      layout: [
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return ObjCSelectorPieceSyntax(data)
  }
  public static func makeObjCSelector(
    _ elements: [ObjCSelectorPieceSyntax]) -> ObjCSelectorSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.objCSelector,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ObjCSelectorSyntax(data)
  }

  public static func makeBlankObjCSelector(presence: SourcePresence = .present) -> ObjCSelectorSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .objCSelector,
      layout: [
    ], length: .zero, presence: presence))
    return ObjCSelectorSyntax(data)
  }
  public static func makeDifferentiableAttributeArguments(garbage garbageBeforeDiffKind: GarbageNodesSyntax? = nil, diffKind: TokenSyntax?, garbage garbageBetweenDiffKindAndDiffKindComma: GarbageNodesSyntax? = nil, diffKindComma: TokenSyntax?, garbage garbageBetweenDiffKindCommaAndDiffParams: GarbageNodesSyntax? = nil, diffParams: DifferentiabilityParamsClauseSyntax?, garbage garbageBetweenDiffParamsAndDiffParamsComma: GarbageNodesSyntax? = nil, diffParamsComma: TokenSyntax?, garbage garbageBetweenDiffParamsCommaAndWhereClause: GarbageNodesSyntax? = nil, whereClause: GenericWhereClauseSyntax?) -> DifferentiableAttributeArgumentsSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeDiffKind?.raw,
      diffKind?.raw,
      garbageBetweenDiffKindAndDiffKindComma?.raw,
      diffKindComma?.raw,
      garbageBetweenDiffKindCommaAndDiffParams?.raw,
      diffParams?.raw,
      garbageBetweenDiffParamsAndDiffParamsComma?.raw,
      diffParamsComma?.raw,
      garbageBetweenDiffParamsCommaAndWhereClause?.raw,
      whereClause?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.differentiableAttributeArguments,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DifferentiableAttributeArgumentsSyntax(data)
  }

  public static func makeBlankDifferentiableAttributeArguments(presence: SourcePresence = .present) -> DifferentiableAttributeArgumentsSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .differentiableAttributeArguments,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return DifferentiableAttributeArgumentsSyntax(data)
  }
  public static func makeDifferentiabilityParamsClause(garbage garbageBeforeWrtLabel: GarbageNodesSyntax? = nil, wrtLabel: TokenSyntax, garbage garbageBetweenWrtLabelAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndParameters: GarbageNodesSyntax? = nil, parameters: Syntax) -> DifferentiabilityParamsClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeWrtLabel?.raw,
      wrtLabel.raw,
      garbageBetweenWrtLabelAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndParameters?.raw,
      parameters.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.differentiabilityParamsClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DifferentiabilityParamsClauseSyntax(data)
  }

  public static func makeBlankDifferentiabilityParamsClause(presence: SourcePresence = .present) -> DifferentiabilityParamsClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .differentiabilityParamsClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
    ], length: .zero, presence: presence))
    return DifferentiabilityParamsClauseSyntax(data)
  }
  public static func makeDifferentiabilityParams(garbage garbageBeforeLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndDiffParams: GarbageNodesSyntax? = nil, diffParams: DifferentiabilityParamListSyntax, garbage garbageBetweenDiffParamsAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> DifferentiabilityParamsSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndDiffParams?.raw,
      diffParams.raw,
      garbageBetweenDiffParamsAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.differentiabilityParams,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DifferentiabilityParamsSyntax(data)
  }

  public static func makeBlankDifferentiabilityParams(presence: SourcePresence = .present) -> DifferentiabilityParamsSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .differentiabilityParams,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.differentiabilityParamList),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return DifferentiabilityParamsSyntax(data)
  }
  public static func makeDifferentiabilityParamList(
    _ elements: [DifferentiabilityParamSyntax]) -> DifferentiabilityParamListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.differentiabilityParamList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DifferentiabilityParamListSyntax(data)
  }

  public static func makeBlankDifferentiabilityParamList(presence: SourcePresence = .present) -> DifferentiabilityParamListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .differentiabilityParamList,
      layout: [
    ], length: .zero, presence: presence))
    return DifferentiabilityParamListSyntax(data)
  }
  public static func makeDifferentiabilityParam(garbage garbageBeforeParameter: GarbageNodesSyntax? = nil, parameter: Syntax, garbage garbageBetweenParameterAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> DifferentiabilityParamSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeParameter?.raw,
      parameter.raw,
      garbageBetweenParameterAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.differentiabilityParam,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DifferentiabilityParamSyntax(data)
  }

  public static func makeBlankDifferentiabilityParam(presence: SourcePresence = .present) -> DifferentiabilityParamSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .differentiabilityParam,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return DifferentiabilityParamSyntax(data)
  }
  public static func makeDerivativeRegistrationAttributeArguments(garbage garbageBeforeOfLabel: GarbageNodesSyntax? = nil, ofLabel: TokenSyntax, garbage garbageBetweenOfLabelAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndOriginalDeclName: GarbageNodesSyntax? = nil, originalDeclName: QualifiedDeclNameSyntax, garbage garbageBetweenOriginalDeclNameAndPeriod: GarbageNodesSyntax? = nil, period: TokenSyntax?, garbage garbageBetweenPeriodAndAccessorKind: GarbageNodesSyntax? = nil, accessorKind: TokenSyntax?, garbage garbageBetweenAccessorKindAndComma: GarbageNodesSyntax? = nil, comma: TokenSyntax?, garbage garbageBetweenCommaAndDiffParams: GarbageNodesSyntax? = nil, diffParams: DifferentiabilityParamsClauseSyntax?) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeOfLabel?.raw,
      ofLabel.raw,
      garbageBetweenOfLabelAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndOriginalDeclName?.raw,
      originalDeclName.raw,
      garbageBetweenOriginalDeclNameAndPeriod?.raw,
      period?.raw,
      garbageBetweenPeriodAndAccessorKind?.raw,
      accessorKind?.raw,
      garbageBetweenAccessorKindAndComma?.raw,
      comma?.raw,
      garbageBetweenCommaAndDiffParams?.raw,
      diffParams?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.derivativeRegistrationAttributeArguments,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DerivativeRegistrationAttributeArgumentsSyntax(data)
  }

  public static func makeBlankDerivativeRegistrationAttributeArguments(presence: SourcePresence = .present) -> DerivativeRegistrationAttributeArgumentsSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .derivativeRegistrationAttributeArguments,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.qualifiedDeclName),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return DerivativeRegistrationAttributeArgumentsSyntax(data)
  }
  public static func makeQualifiedDeclName(garbage garbageBeforeBaseType: GarbageNodesSyntax? = nil, baseType: TypeSyntax?, garbage garbageBetweenBaseTypeAndDot: GarbageNodesSyntax? = nil, dot: TokenSyntax?, garbage garbageBetweenDotAndName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndArguments: GarbageNodesSyntax? = nil, arguments: DeclNameArgumentsSyntax?) -> QualifiedDeclNameSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeBaseType?.raw,
      baseType?.raw,
      garbageBetweenBaseTypeAndDot?.raw,
      dot?.raw,
      garbageBetweenDotAndName?.raw,
      name.raw,
      garbageBetweenNameAndArguments?.raw,
      arguments?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.qualifiedDeclName,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return QualifiedDeclNameSyntax(data)
  }

  public static func makeBlankQualifiedDeclName(presence: SourcePresence = .present) -> QualifiedDeclNameSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .qualifiedDeclName,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return QualifiedDeclNameSyntax(data)
  }
  public static func makeFunctionDeclName(garbage garbageBeforeName: GarbageNodesSyntax? = nil, name: Syntax, garbage garbageBetweenNameAndArguments: GarbageNodesSyntax? = nil, arguments: DeclNameArgumentsSyntax?) -> FunctionDeclNameSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeName?.raw,
      name.raw,
      garbageBetweenNameAndArguments?.raw,
      arguments?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.functionDeclName,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return FunctionDeclNameSyntax(data)
  }

  public static func makeBlankFunctionDeclName(presence: SourcePresence = .present) -> FunctionDeclNameSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .functionDeclName,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return FunctionDeclNameSyntax(data)
  }
  public static func makeBackDeployAttributeSpecList(garbage garbageBeforeBeforeLabel: GarbageNodesSyntax? = nil, beforeLabel: TokenSyntax, garbage garbageBetweenBeforeLabelAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndVersionList: GarbageNodesSyntax? = nil, versionList: BackDeployVersionListSyntax) -> BackDeployAttributeSpecListSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeBeforeLabel?.raw,
      beforeLabel.raw,
      garbageBetweenBeforeLabelAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndVersionList?.raw,
      versionList.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.backDeployAttributeSpecList,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return BackDeployAttributeSpecListSyntax(data)
  }

  public static func makeBlankBackDeployAttributeSpecList(presence: SourcePresence = .present) -> BackDeployAttributeSpecListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .backDeployAttributeSpecList,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.backDeployVersionList),
    ], length: .zero, presence: presence))
    return BackDeployAttributeSpecListSyntax(data)
  }
  public static func makeBackDeployVersionList(
    _ elements: [BackDeployVersionArgumentSyntax]) -> BackDeployVersionListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.backDeployVersionList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return BackDeployVersionListSyntax(data)
  }

  public static func makeBlankBackDeployVersionList(presence: SourcePresence = .present) -> BackDeployVersionListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .backDeployVersionList,
      layout: [
    ], length: .zero, presence: presence))
    return BackDeployVersionListSyntax(data)
  }
  public static func makeBackDeployVersionArgument(garbage garbageBeforeAvailabilityVersionRestriction: GarbageNodesSyntax? = nil, availabilityVersionRestriction: AvailabilityVersionRestrictionSyntax, garbage garbageBetweenAvailabilityVersionRestrictionAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> BackDeployVersionArgumentSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAvailabilityVersionRestriction?.raw,
      availabilityVersionRestriction.raw,
      garbageBetweenAvailabilityVersionRestrictionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.backDeployVersionArgument,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return BackDeployVersionArgumentSyntax(data)
  }

  public static func makeBlankBackDeployVersionArgument(presence: SourcePresence = .present) -> BackDeployVersionArgumentSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .backDeployVersionArgument,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.availabilityVersionRestriction),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return BackDeployVersionArgumentSyntax(data)
  }
  public static func makeContinueStmt(garbage garbageBeforeContinueKeyword: GarbageNodesSyntax? = nil, continueKeyword: TokenSyntax, garbage garbageBetweenContinueKeywordAndLabel: GarbageNodesSyntax? = nil, label: TokenSyntax?) -> ContinueStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeContinueKeyword?.raw,
      continueKeyword.raw,
      garbageBetweenContinueKeywordAndLabel?.raw,
      label?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.continueStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ContinueStmtSyntax(data)
  }

  public static func makeBlankContinueStmt(presence: SourcePresence = .present) -> ContinueStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .continueStmt,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.continueKeyword),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return ContinueStmtSyntax(data)
  }
  public static func makeWhileStmt(garbage garbageBeforeLabelName: GarbageNodesSyntax? = nil, labelName: TokenSyntax?, garbage garbageBetweenLabelNameAndLabelColon: GarbageNodesSyntax? = nil, labelColon: TokenSyntax?, garbage garbageBetweenLabelColonAndWhileKeyword: GarbageNodesSyntax? = nil, whileKeyword: TokenSyntax, garbage garbageBetweenWhileKeywordAndConditions: GarbageNodesSyntax? = nil, conditions: ConditionElementListSyntax, garbage garbageBetweenConditionsAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax) -> WhileStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabelName?.raw,
      labelName?.raw,
      garbageBetweenLabelNameAndLabelColon?.raw,
      labelColon?.raw,
      garbageBetweenLabelColonAndWhileKeyword?.raw,
      whileKeyword.raw,
      garbageBetweenWhileKeywordAndConditions?.raw,
      conditions.raw,
      garbageBetweenConditionsAndBody?.raw,
      body.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.whileStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return WhileStmtSyntax(data)
  }

  public static func makeBlankWhileStmt(presence: SourcePresence = .present) -> WhileStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .whileStmt,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.whileKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.conditionElementList),
      nil,
      RawSyntax.missing(SyntaxKind.codeBlock),
    ], length: .zero, presence: presence))
    return WhileStmtSyntax(data)
  }
  public static func makeDeferStmt(garbage garbageBeforeDeferKeyword: GarbageNodesSyntax? = nil, deferKeyword: TokenSyntax, garbage garbageBetweenDeferKeywordAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax) -> DeferStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeDeferKeyword?.raw,
      deferKeyword.raw,
      garbageBetweenDeferKeywordAndBody?.raw,
      body.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.deferStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DeferStmtSyntax(data)
  }

  public static func makeBlankDeferStmt(presence: SourcePresence = .present) -> DeferStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .deferStmt,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.deferKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.codeBlock),
    ], length: .zero, presence: presence))
    return DeferStmtSyntax(data)
  }
  public static func makeExpressionStmt(garbage garbageBeforeExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax) -> ExpressionStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeExpression?.raw,
      expression.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.expressionStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ExpressionStmtSyntax(data)
  }

  public static func makeBlankExpressionStmt(presence: SourcePresence = .present) -> ExpressionStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .expressionStmt,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return ExpressionStmtSyntax(data)
  }
  public static func makeSwitchCaseList(
    _ elements: [Syntax]) -> SwitchCaseListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.switchCaseList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SwitchCaseListSyntax(data)
  }

  public static func makeBlankSwitchCaseList(presence: SourcePresence = .present) -> SwitchCaseListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .switchCaseList,
      layout: [
    ], length: .zero, presence: presence))
    return SwitchCaseListSyntax(data)
  }
  public static func makeRepeatWhileStmt(garbage garbageBeforeLabelName: GarbageNodesSyntax? = nil, labelName: TokenSyntax?, garbage garbageBetweenLabelNameAndLabelColon: GarbageNodesSyntax? = nil, labelColon: TokenSyntax?, garbage garbageBetweenLabelColonAndRepeatKeyword: GarbageNodesSyntax? = nil, repeatKeyword: TokenSyntax, garbage garbageBetweenRepeatKeywordAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax, garbage garbageBetweenBodyAndWhileKeyword: GarbageNodesSyntax? = nil, whileKeyword: TokenSyntax, garbage garbageBetweenWhileKeywordAndCondition: GarbageNodesSyntax? = nil, condition: ExprSyntax) -> RepeatWhileStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabelName?.raw,
      labelName?.raw,
      garbageBetweenLabelNameAndLabelColon?.raw,
      labelColon?.raw,
      garbageBetweenLabelColonAndRepeatKeyword?.raw,
      repeatKeyword.raw,
      garbageBetweenRepeatKeywordAndBody?.raw,
      body.raw,
      garbageBetweenBodyAndWhileKeyword?.raw,
      whileKeyword.raw,
      garbageBetweenWhileKeywordAndCondition?.raw,
      condition.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.repeatWhileStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return RepeatWhileStmtSyntax(data)
  }

  public static func makeBlankRepeatWhileStmt(presence: SourcePresence = .present) -> RepeatWhileStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .repeatWhileStmt,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.repeatKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.codeBlock),
      nil,
      RawSyntax.missingToken(TokenKind.whileKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return RepeatWhileStmtSyntax(data)
  }
  public static func makeGuardStmt(garbage garbageBeforeGuardKeyword: GarbageNodesSyntax? = nil, guardKeyword: TokenSyntax, garbage garbageBetweenGuardKeywordAndConditions: GarbageNodesSyntax? = nil, conditions: ConditionElementListSyntax, garbage garbageBetweenConditionsAndElseKeyword: GarbageNodesSyntax? = nil, elseKeyword: TokenSyntax, garbage garbageBetweenElseKeywordAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax) -> GuardStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeGuardKeyword?.raw,
      guardKeyword.raw,
      garbageBetweenGuardKeywordAndConditions?.raw,
      conditions.raw,
      garbageBetweenConditionsAndElseKeyword?.raw,
      elseKeyword.raw,
      garbageBetweenElseKeywordAndBody?.raw,
      body.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.guardStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return GuardStmtSyntax(data)
  }

  public static func makeBlankGuardStmt(presence: SourcePresence = .present) -> GuardStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .guardStmt,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.guardKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.conditionElementList),
      nil,
      RawSyntax.missingToken(TokenKind.elseKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.codeBlock),
    ], length: .zero, presence: presence))
    return GuardStmtSyntax(data)
  }
  public static func makeWhereClause(garbage garbageBeforeWhereKeyword: GarbageNodesSyntax? = nil, whereKeyword: TokenSyntax, garbage garbageBetweenWhereKeywordAndGuardResult: GarbageNodesSyntax? = nil, guardResult: ExprSyntax) -> WhereClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeWhereKeyword?.raw,
      whereKeyword.raw,
      garbageBetweenWhereKeywordAndGuardResult?.raw,
      guardResult.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.whereClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return WhereClauseSyntax(data)
  }

  public static func makeBlankWhereClause(presence: SourcePresence = .present) -> WhereClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .whereClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.whereKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return WhereClauseSyntax(data)
  }
  public static func makeForInStmt(garbage garbageBeforeLabelName: GarbageNodesSyntax? = nil, labelName: TokenSyntax?, garbage garbageBetweenLabelNameAndLabelColon: GarbageNodesSyntax? = nil, labelColon: TokenSyntax?, garbage garbageBetweenLabelColonAndForKeyword: GarbageNodesSyntax? = nil, forKeyword: TokenSyntax, garbage garbageBetweenForKeywordAndTryKeyword: GarbageNodesSyntax? = nil, tryKeyword: TokenSyntax?, garbage garbageBetweenTryKeywordAndAwaitKeyword: GarbageNodesSyntax? = nil, awaitKeyword: TokenSyntax?, garbage garbageBetweenAwaitKeywordAndCaseKeyword: GarbageNodesSyntax? = nil, caseKeyword: TokenSyntax?, garbage garbageBetweenCaseKeywordAndPattern: GarbageNodesSyntax? = nil, pattern: PatternSyntax, garbage garbageBetweenPatternAndTypeAnnotation: GarbageNodesSyntax? = nil, typeAnnotation: TypeAnnotationSyntax?, garbage garbageBetweenTypeAnnotationAndInKeyword: GarbageNodesSyntax? = nil, inKeyword: TokenSyntax, garbage garbageBetweenInKeywordAndSequenceExpr: GarbageNodesSyntax? = nil, sequenceExpr: ExprSyntax, garbage garbageBetweenSequenceExprAndWhereClause: GarbageNodesSyntax? = nil, whereClause: WhereClauseSyntax?, garbage garbageBetweenWhereClauseAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax) -> ForInStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabelName?.raw,
      labelName?.raw,
      garbageBetweenLabelNameAndLabelColon?.raw,
      labelColon?.raw,
      garbageBetweenLabelColonAndForKeyword?.raw,
      forKeyword.raw,
      garbageBetweenForKeywordAndTryKeyword?.raw,
      tryKeyword?.raw,
      garbageBetweenTryKeywordAndAwaitKeyword?.raw,
      awaitKeyword?.raw,
      garbageBetweenAwaitKeywordAndCaseKeyword?.raw,
      caseKeyword?.raw,
      garbageBetweenCaseKeywordAndPattern?.raw,
      pattern.raw,
      garbageBetweenPatternAndTypeAnnotation?.raw,
      typeAnnotation?.raw,
      garbageBetweenTypeAnnotationAndInKeyword?.raw,
      inKeyword.raw,
      garbageBetweenInKeywordAndSequenceExpr?.raw,
      sequenceExpr.raw,
      garbageBetweenSequenceExprAndWhereClause?.raw,
      whereClause?.raw,
      garbageBetweenWhereClauseAndBody?.raw,
      body.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.forInStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ForInStmtSyntax(data)
  }

  public static func makeBlankForInStmt(presence: SourcePresence = .present) -> ForInStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .forInStmt,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.forKeyword),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.missingPattern),
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.inKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.codeBlock),
    ], length: .zero, presence: presence))
    return ForInStmtSyntax(data)
  }
  public static func makeSwitchStmt(garbage garbageBeforeLabelName: GarbageNodesSyntax? = nil, labelName: TokenSyntax?, garbage garbageBetweenLabelNameAndLabelColon: GarbageNodesSyntax? = nil, labelColon: TokenSyntax?, garbage garbageBetweenLabelColonAndSwitchKeyword: GarbageNodesSyntax? = nil, switchKeyword: TokenSyntax, garbage garbageBetweenSwitchKeywordAndExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax, garbage garbageBetweenExpressionAndLeftBrace: GarbageNodesSyntax? = nil, leftBrace: TokenSyntax, garbage garbageBetweenLeftBraceAndCases: GarbageNodesSyntax? = nil, cases: SwitchCaseListSyntax, garbage garbageBetweenCasesAndRightBrace: GarbageNodesSyntax? = nil, rightBrace: TokenSyntax) -> SwitchStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabelName?.raw,
      labelName?.raw,
      garbageBetweenLabelNameAndLabelColon?.raw,
      labelColon?.raw,
      garbageBetweenLabelColonAndSwitchKeyword?.raw,
      switchKeyword.raw,
      garbageBetweenSwitchKeywordAndExpression?.raw,
      expression.raw,
      garbageBetweenExpressionAndLeftBrace?.raw,
      leftBrace.raw,
      garbageBetweenLeftBraceAndCases?.raw,
      cases.raw,
      garbageBetweenCasesAndRightBrace?.raw,
      rightBrace.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.switchStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SwitchStmtSyntax(data)
  }

  public static func makeBlankSwitchStmt(presence: SourcePresence = .present) -> SwitchStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .switchStmt,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.switchKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      RawSyntax.missingToken(TokenKind.leftBrace),
      nil,
      RawSyntax.missing(SyntaxKind.switchCaseList),
      nil,
      RawSyntax.missingToken(TokenKind.rightBrace),
    ], length: .zero, presence: presence))
    return SwitchStmtSyntax(data)
  }
  public static func makeCatchClauseList(
    _ elements: [CatchClauseSyntax]) -> CatchClauseListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.catchClauseList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CatchClauseListSyntax(data)
  }

  public static func makeBlankCatchClauseList(presence: SourcePresence = .present) -> CatchClauseListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .catchClauseList,
      layout: [
    ], length: .zero, presence: presence))
    return CatchClauseListSyntax(data)
  }
  public static func makeDoStmt(garbage garbageBeforeLabelName: GarbageNodesSyntax? = nil, labelName: TokenSyntax?, garbage garbageBetweenLabelNameAndLabelColon: GarbageNodesSyntax? = nil, labelColon: TokenSyntax?, garbage garbageBetweenLabelColonAndDoKeyword: GarbageNodesSyntax? = nil, doKeyword: TokenSyntax, garbage garbageBetweenDoKeywordAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax, garbage garbageBetweenBodyAndCatchClauses: GarbageNodesSyntax? = nil, catchClauses: CatchClauseListSyntax?) -> DoStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabelName?.raw,
      labelName?.raw,
      garbageBetweenLabelNameAndLabelColon?.raw,
      labelColon?.raw,
      garbageBetweenLabelColonAndDoKeyword?.raw,
      doKeyword.raw,
      garbageBetweenDoKeywordAndBody?.raw,
      body.raw,
      garbageBetweenBodyAndCatchClauses?.raw,
      catchClauses?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.doStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DoStmtSyntax(data)
  }

  public static func makeBlankDoStmt(presence: SourcePresence = .present) -> DoStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .doStmt,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.doKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.codeBlock),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return DoStmtSyntax(data)
  }
  public static func makeReturnStmt(garbage garbageBeforeReturnKeyword: GarbageNodesSyntax? = nil, returnKeyword: TokenSyntax, garbage garbageBetweenReturnKeywordAndExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax?) -> ReturnStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeReturnKeyword?.raw,
      returnKeyword.raw,
      garbageBetweenReturnKeywordAndExpression?.raw,
      expression?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.returnStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ReturnStmtSyntax(data)
  }

  public static func makeBlankReturnStmt(presence: SourcePresence = .present) -> ReturnStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .returnStmt,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.returnKeyword),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return ReturnStmtSyntax(data)
  }
  public static func makeYieldStmt(garbage garbageBeforeYieldKeyword: GarbageNodesSyntax? = nil, yieldKeyword: TokenSyntax, garbage garbageBetweenYieldKeywordAndYields: GarbageNodesSyntax? = nil, yields: Syntax) -> YieldStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeYieldKeyword?.raw,
      yieldKeyword.raw,
      garbageBetweenYieldKeywordAndYields?.raw,
      yields.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.yieldStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return YieldStmtSyntax(data)
  }

  public static func makeBlankYieldStmt(presence: SourcePresence = .present) -> YieldStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .yieldStmt,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.yield),
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
    ], length: .zero, presence: presence))
    return YieldStmtSyntax(data)
  }
  public static func makeYieldList(garbage garbageBeforeLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndElementList: GarbageNodesSyntax? = nil, elementList: ExprListSyntax, garbage garbageBetweenElementListAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?, garbage garbageBetweenTrailingCommaAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> YieldListSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndElementList?.raw,
      elementList.raw,
      garbageBetweenElementListAndTrailingComma?.raw,
      trailingComma?.raw,
      garbageBetweenTrailingCommaAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.yieldList,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return YieldListSyntax(data)
  }

  public static func makeBlankYieldList(presence: SourcePresence = .present) -> YieldListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .yieldList,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.exprList),
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return YieldListSyntax(data)
  }
  public static func makeFallthroughStmt(garbage garbageBeforeFallthroughKeyword: GarbageNodesSyntax? = nil, fallthroughKeyword: TokenSyntax) -> FallthroughStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeFallthroughKeyword?.raw,
      fallthroughKeyword.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.fallthroughStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return FallthroughStmtSyntax(data)
  }

  public static func makeBlankFallthroughStmt(presence: SourcePresence = .present) -> FallthroughStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .fallthroughStmt,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.fallthroughKeyword),
    ], length: .zero, presence: presence))
    return FallthroughStmtSyntax(data)
  }
  public static func makeBreakStmt(garbage garbageBeforeBreakKeyword: GarbageNodesSyntax? = nil, breakKeyword: TokenSyntax, garbage garbageBetweenBreakKeywordAndLabel: GarbageNodesSyntax? = nil, label: TokenSyntax?) -> BreakStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeBreakKeyword?.raw,
      breakKeyword.raw,
      garbageBetweenBreakKeywordAndLabel?.raw,
      label?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.breakStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return BreakStmtSyntax(data)
  }

  public static func makeBlankBreakStmt(presence: SourcePresence = .present) -> BreakStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .breakStmt,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.breakKeyword),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return BreakStmtSyntax(data)
  }
  public static func makeCaseItemList(
    _ elements: [CaseItemSyntax]) -> CaseItemListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.caseItemList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CaseItemListSyntax(data)
  }

  public static func makeBlankCaseItemList(presence: SourcePresence = .present) -> CaseItemListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .caseItemList,
      layout: [
    ], length: .zero, presence: presence))
    return CaseItemListSyntax(data)
  }
  public static func makeCatchItemList(
    _ elements: [CatchItemSyntax]) -> CatchItemListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.catchItemList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CatchItemListSyntax(data)
  }

  public static func makeBlankCatchItemList(presence: SourcePresence = .present) -> CatchItemListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .catchItemList,
      layout: [
    ], length: .zero, presence: presence))
    return CatchItemListSyntax(data)
  }
  public static func makeConditionElement(garbage garbageBeforeCondition: GarbageNodesSyntax? = nil, condition: Syntax, garbage garbageBetweenConditionAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> ConditionElementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeCondition?.raw,
      condition.raw,
      garbageBetweenConditionAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.conditionElement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ConditionElementSyntax(data)
  }

  public static func makeBlankConditionElement(presence: SourcePresence = .present) -> ConditionElementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .conditionElement,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return ConditionElementSyntax(data)
  }
  public static func makeAvailabilityCondition(garbage garbageBeforePoundAvailableKeyword: GarbageNodesSyntax? = nil, poundAvailableKeyword: TokenSyntax, garbage garbageBetweenPoundAvailableKeywordAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndAvailabilitySpec: GarbageNodesSyntax? = nil, availabilitySpec: AvailabilitySpecListSyntax, garbage garbageBetweenAvailabilitySpecAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> AvailabilityConditionSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundAvailableKeyword?.raw,
      poundAvailableKeyword.raw,
      garbageBetweenPoundAvailableKeywordAndLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndAvailabilitySpec?.raw,
      availabilitySpec.raw,
      garbageBetweenAvailabilitySpecAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.availabilityCondition,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AvailabilityConditionSyntax(data)
  }

  public static func makeBlankAvailabilityCondition(presence: SourcePresence = .present) -> AvailabilityConditionSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .availabilityCondition,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundAvailableKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.availabilitySpecList),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return AvailabilityConditionSyntax(data)
  }
  public static func makeMatchingPatternCondition(garbage garbageBeforeCaseKeyword: GarbageNodesSyntax? = nil, caseKeyword: TokenSyntax, garbage garbageBetweenCaseKeywordAndPattern: GarbageNodesSyntax? = nil, pattern: PatternSyntax, garbage garbageBetweenPatternAndTypeAnnotation: GarbageNodesSyntax? = nil, typeAnnotation: TypeAnnotationSyntax?, garbage garbageBetweenTypeAnnotationAndInitializer: GarbageNodesSyntax? = nil, initializer: InitializerClauseSyntax) -> MatchingPatternConditionSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeCaseKeyword?.raw,
      caseKeyword.raw,
      garbageBetweenCaseKeywordAndPattern?.raw,
      pattern.raw,
      garbageBetweenPatternAndTypeAnnotation?.raw,
      typeAnnotation?.raw,
      garbageBetweenTypeAnnotationAndInitializer?.raw,
      initializer.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.matchingPatternCondition,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return MatchingPatternConditionSyntax(data)
  }

  public static func makeBlankMatchingPatternCondition(presence: SourcePresence = .present) -> MatchingPatternConditionSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .matchingPatternCondition,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.caseKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingPattern),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.initializerClause),
    ], length: .zero, presence: presence))
    return MatchingPatternConditionSyntax(data)
  }
  public static func makeOptionalBindingCondition(garbage garbageBeforeLetOrVarKeyword: GarbageNodesSyntax? = nil, letOrVarKeyword: TokenSyntax, garbage garbageBetweenLetOrVarKeywordAndPattern: GarbageNodesSyntax? = nil, pattern: PatternSyntax, garbage garbageBetweenPatternAndTypeAnnotation: GarbageNodesSyntax? = nil, typeAnnotation: TypeAnnotationSyntax?, garbage garbageBetweenTypeAnnotationAndInitializer: GarbageNodesSyntax? = nil, initializer: InitializerClauseSyntax?) -> OptionalBindingConditionSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLetOrVarKeyword?.raw,
      letOrVarKeyword.raw,
      garbageBetweenLetOrVarKeywordAndPattern?.raw,
      pattern.raw,
      garbageBetweenPatternAndTypeAnnotation?.raw,
      typeAnnotation?.raw,
      garbageBetweenTypeAnnotationAndInitializer?.raw,
      initializer?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.optionalBindingCondition,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return OptionalBindingConditionSyntax(data)
  }

  public static func makeBlankOptionalBindingCondition(presence: SourcePresence = .present) -> OptionalBindingConditionSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .optionalBindingCondition,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.letKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingPattern),
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return OptionalBindingConditionSyntax(data)
  }
  public static func makeUnavailabilityCondition(garbage garbageBeforePoundUnavailableKeyword: GarbageNodesSyntax? = nil, poundUnavailableKeyword: TokenSyntax, garbage garbageBetweenPoundUnavailableKeywordAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndAvailabilitySpec: GarbageNodesSyntax? = nil, availabilitySpec: AvailabilitySpecListSyntax, garbage garbageBetweenAvailabilitySpecAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> UnavailabilityConditionSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundUnavailableKeyword?.raw,
      poundUnavailableKeyword.raw,
      garbageBetweenPoundUnavailableKeywordAndLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndAvailabilitySpec?.raw,
      availabilitySpec.raw,
      garbageBetweenAvailabilitySpecAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.unavailabilityCondition,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return UnavailabilityConditionSyntax(data)
  }

  public static func makeBlankUnavailabilityCondition(presence: SourcePresence = .present) -> UnavailabilityConditionSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .unavailabilityCondition,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundUnavailableKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.availabilitySpecList),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return UnavailabilityConditionSyntax(data)
  }
  public static func makeConditionElementList(
    _ elements: [ConditionElementSyntax]) -> ConditionElementListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.conditionElementList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ConditionElementListSyntax(data)
  }

  public static func makeBlankConditionElementList(presence: SourcePresence = .present) -> ConditionElementListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .conditionElementList,
      layout: [
    ], length: .zero, presence: presence))
    return ConditionElementListSyntax(data)
  }
  public static func makeDeclarationStmt(garbage garbageBeforeDeclaration: GarbageNodesSyntax? = nil, declaration: DeclSyntax) -> DeclarationStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeDeclaration?.raw,
      declaration.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.declarationStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DeclarationStmtSyntax(data)
  }

  public static func makeBlankDeclarationStmt(presence: SourcePresence = .present) -> DeclarationStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .declarationStmt,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingDecl),
    ], length: .zero, presence: presence))
    return DeclarationStmtSyntax(data)
  }
  public static func makeThrowStmt(garbage garbageBeforeThrowKeyword: GarbageNodesSyntax? = nil, throwKeyword: TokenSyntax, garbage garbageBetweenThrowKeywordAndExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax) -> ThrowStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeThrowKeyword?.raw,
      throwKeyword.raw,
      garbageBetweenThrowKeywordAndExpression?.raw,
      expression.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.throwStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ThrowStmtSyntax(data)
  }

  public static func makeBlankThrowStmt(presence: SourcePresence = .present) -> ThrowStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .throwStmt,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.throwKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return ThrowStmtSyntax(data)
  }
  public static func makeIfStmt(garbage garbageBeforeLabelName: GarbageNodesSyntax? = nil, labelName: TokenSyntax?, garbage garbageBetweenLabelNameAndLabelColon: GarbageNodesSyntax? = nil, labelColon: TokenSyntax?, garbage garbageBetweenLabelColonAndIfKeyword: GarbageNodesSyntax? = nil, ifKeyword: TokenSyntax, garbage garbageBetweenIfKeywordAndConditions: GarbageNodesSyntax? = nil, conditions: ConditionElementListSyntax, garbage garbageBetweenConditionsAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax, garbage garbageBetweenBodyAndElseKeyword: GarbageNodesSyntax? = nil, elseKeyword: TokenSyntax?, garbage garbageBetweenElseKeywordAndElseBody: GarbageNodesSyntax? = nil, elseBody: Syntax?) -> IfStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabelName?.raw,
      labelName?.raw,
      garbageBetweenLabelNameAndLabelColon?.raw,
      labelColon?.raw,
      garbageBetweenLabelColonAndIfKeyword?.raw,
      ifKeyword.raw,
      garbageBetweenIfKeywordAndConditions?.raw,
      conditions.raw,
      garbageBetweenConditionsAndBody?.raw,
      body.raw,
      garbageBetweenBodyAndElseKeyword?.raw,
      elseKeyword?.raw,
      garbageBetweenElseKeywordAndElseBody?.raw,
      elseBody?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.ifStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return IfStmtSyntax(data)
  }

  public static func makeBlankIfStmt(presence: SourcePresence = .present) -> IfStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .ifStmt,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.ifKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.conditionElementList),
      nil,
      RawSyntax.missing(SyntaxKind.codeBlock),
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return IfStmtSyntax(data)
  }
  public static func makeElseIfContinuation(garbage garbageBeforeIfStatement: GarbageNodesSyntax? = nil, ifStatement: IfStmtSyntax) -> ElseIfContinuationSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeIfStatement?.raw,
      ifStatement.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.elseIfContinuation,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ElseIfContinuationSyntax(data)
  }

  public static func makeBlankElseIfContinuation(presence: SourcePresence = .present) -> ElseIfContinuationSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .elseIfContinuation,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.ifStmt),
    ], length: .zero, presence: presence))
    return ElseIfContinuationSyntax(data)
  }
  public static func makeElseBlock(garbage garbageBeforeElseKeyword: GarbageNodesSyntax? = nil, elseKeyword: TokenSyntax, garbage garbageBetweenElseKeywordAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax) -> ElseBlockSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeElseKeyword?.raw,
      elseKeyword.raw,
      garbageBetweenElseKeywordAndBody?.raw,
      body.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.elseBlock,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ElseBlockSyntax(data)
  }

  public static func makeBlankElseBlock(presence: SourcePresence = .present) -> ElseBlockSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .elseBlock,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.elseKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.codeBlock),
    ], length: .zero, presence: presence))
    return ElseBlockSyntax(data)
  }
  public static func makeSwitchCase(garbage garbageBeforeUnknownAttr: GarbageNodesSyntax? = nil, unknownAttr: AttributeSyntax?, garbage garbageBetweenUnknownAttrAndLabel: GarbageNodesSyntax? = nil, label: Syntax, garbage garbageBetweenLabelAndStatements: GarbageNodesSyntax? = nil, statements: CodeBlockItemListSyntax) -> SwitchCaseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeUnknownAttr?.raw,
      unknownAttr?.raw,
      garbageBetweenUnknownAttrAndLabel?.raw,
      label.raw,
      garbageBetweenLabelAndStatements?.raw,
      statements.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.switchCase,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SwitchCaseSyntax(data)
  }

  public static func makeBlankSwitchCase(presence: SourcePresence = .present) -> SwitchCaseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .switchCase,
      layout: [
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
      nil,
      RawSyntax.missing(SyntaxKind.codeBlockItemList),
    ], length: .zero, presence: presence))
    return SwitchCaseSyntax(data)
  }
  public static func makeSwitchDefaultLabel(garbage garbageBeforeDefaultKeyword: GarbageNodesSyntax? = nil, defaultKeyword: TokenSyntax, garbage garbageBetweenDefaultKeywordAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax) -> SwitchDefaultLabelSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeDefaultKeyword?.raw,
      defaultKeyword.raw,
      garbageBetweenDefaultKeywordAndColon?.raw,
      colon.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.switchDefaultLabel,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SwitchDefaultLabelSyntax(data)
  }

  public static func makeBlankSwitchDefaultLabel(presence: SourcePresence = .present) -> SwitchDefaultLabelSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .switchDefaultLabel,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.defaultKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
    ], length: .zero, presence: presence))
    return SwitchDefaultLabelSyntax(data)
  }
  public static func makeCaseItem(garbage garbageBeforePattern: GarbageNodesSyntax? = nil, pattern: PatternSyntax, garbage garbageBetweenPatternAndWhereClause: GarbageNodesSyntax? = nil, whereClause: WhereClauseSyntax?, garbage garbageBetweenWhereClauseAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> CaseItemSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePattern?.raw,
      pattern.raw,
      garbageBetweenPatternAndWhereClause?.raw,
      whereClause?.raw,
      garbageBetweenWhereClauseAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.caseItem,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CaseItemSyntax(data)
  }

  public static func makeBlankCaseItem(presence: SourcePresence = .present) -> CaseItemSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .caseItem,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingPattern),
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return CaseItemSyntax(data)
  }
  public static func makeCatchItem(garbage garbageBeforePattern: GarbageNodesSyntax? = nil, pattern: PatternSyntax?, garbage garbageBetweenPatternAndWhereClause: GarbageNodesSyntax? = nil, whereClause: WhereClauseSyntax?, garbage garbageBetweenWhereClauseAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> CatchItemSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePattern?.raw,
      pattern?.raw,
      garbageBetweenPatternAndWhereClause?.raw,
      whereClause?.raw,
      garbageBetweenWhereClauseAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.catchItem,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CatchItemSyntax(data)
  }

  public static func makeBlankCatchItem(presence: SourcePresence = .present) -> CatchItemSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .catchItem,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return CatchItemSyntax(data)
  }
  public static func makeSwitchCaseLabel(garbage garbageBeforeCaseKeyword: GarbageNodesSyntax? = nil, caseKeyword: TokenSyntax, garbage garbageBetweenCaseKeywordAndCaseItems: GarbageNodesSyntax? = nil, caseItems: CaseItemListSyntax, garbage garbageBetweenCaseItemsAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax) -> SwitchCaseLabelSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeCaseKeyword?.raw,
      caseKeyword.raw,
      garbageBetweenCaseKeywordAndCaseItems?.raw,
      caseItems.raw,
      garbageBetweenCaseItemsAndColon?.raw,
      colon.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.switchCaseLabel,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SwitchCaseLabelSyntax(data)
  }

  public static func makeBlankSwitchCaseLabel(presence: SourcePresence = .present) -> SwitchCaseLabelSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .switchCaseLabel,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.caseKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.caseItemList),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
    ], length: .zero, presence: presence))
    return SwitchCaseLabelSyntax(data)
  }
  public static func makeCatchClause(garbage garbageBeforeCatchKeyword: GarbageNodesSyntax? = nil, catchKeyword: TokenSyntax, garbage garbageBetweenCatchKeywordAndCatchItems: GarbageNodesSyntax? = nil, catchItems: CatchItemListSyntax?, garbage garbageBetweenCatchItemsAndBody: GarbageNodesSyntax? = nil, body: CodeBlockSyntax) -> CatchClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeCatchKeyword?.raw,
      catchKeyword.raw,
      garbageBetweenCatchKeywordAndCatchItems?.raw,
      catchItems?.raw,
      garbageBetweenCatchItemsAndBody?.raw,
      body.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.catchClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CatchClauseSyntax(data)
  }

  public static func makeBlankCatchClause(presence: SourcePresence = .present) -> CatchClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .catchClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.catchKeyword),
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.codeBlock),
    ], length: .zero, presence: presence))
    return CatchClauseSyntax(data)
  }
  public static func makePoundAssertStmt(garbage garbageBeforePoundAssert: GarbageNodesSyntax? = nil, poundAssert: TokenSyntax, garbage garbageBetweenPoundAssertAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndCondition: GarbageNodesSyntax? = nil, condition: ExprSyntax, garbage garbageBetweenConditionAndComma: GarbageNodesSyntax? = nil, comma: TokenSyntax?, garbage garbageBetweenCommaAndMessage: GarbageNodesSyntax? = nil, message: TokenSyntax?, garbage garbageBetweenMessageAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> PoundAssertStmtSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePoundAssert?.raw,
      poundAssert.raw,
      garbageBetweenPoundAssertAndLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndCondition?.raw,
      condition.raw,
      garbageBetweenConditionAndComma?.raw,
      comma?.raw,
      garbageBetweenCommaAndMessage?.raw,
      message?.raw,
      garbageBetweenMessageAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.poundAssertStmt,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PoundAssertStmtSyntax(data)
  }

  public static func makeBlankPoundAssertStmt(presence: SourcePresence = .present) -> PoundAssertStmtSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .poundAssertStmt,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.poundAssertKeyword),
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return PoundAssertStmtSyntax(data)
  }
  public static func makeGenericWhereClause(garbage garbageBeforeWhereKeyword: GarbageNodesSyntax? = nil, whereKeyword: TokenSyntax, garbage garbageBetweenWhereKeywordAndRequirementList: GarbageNodesSyntax? = nil, requirementList: GenericRequirementListSyntax) -> GenericWhereClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeWhereKeyword?.raw,
      whereKeyword.raw,
      garbageBetweenWhereKeywordAndRequirementList?.raw,
      requirementList.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.genericWhereClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return GenericWhereClauseSyntax(data)
  }

  public static func makeBlankGenericWhereClause(presence: SourcePresence = .present) -> GenericWhereClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .genericWhereClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.whereKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.genericRequirementList),
    ], length: .zero, presence: presence))
    return GenericWhereClauseSyntax(data)
  }
  public static func makeGenericRequirementList(
    _ elements: [GenericRequirementSyntax]) -> GenericRequirementListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.genericRequirementList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return GenericRequirementListSyntax(data)
  }

  public static func makeBlankGenericRequirementList(presence: SourcePresence = .present) -> GenericRequirementListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .genericRequirementList,
      layout: [
    ], length: .zero, presence: presence))
    return GenericRequirementListSyntax(data)
  }
  public static func makeGenericRequirement(garbage garbageBeforeBody: GarbageNodesSyntax? = nil, body: Syntax, garbage garbageBetweenBodyAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> GenericRequirementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeBody?.raw,
      body.raw,
      garbageBetweenBodyAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.genericRequirement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return GenericRequirementSyntax(data)
  }

  public static func makeBlankGenericRequirement(presence: SourcePresence = .present) -> GenericRequirementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .genericRequirement,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return GenericRequirementSyntax(data)
  }
  public static func makeSameTypeRequirement(garbage garbageBeforeLeftTypeIdentifier: GarbageNodesSyntax? = nil, leftTypeIdentifier: TypeSyntax, garbage garbageBetweenLeftTypeIdentifierAndEqualityToken: GarbageNodesSyntax? = nil, equalityToken: TokenSyntax, garbage garbageBetweenEqualityTokenAndRightTypeIdentifier: GarbageNodesSyntax? = nil, rightTypeIdentifier: TypeSyntax) -> SameTypeRequirementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftTypeIdentifier?.raw,
      leftTypeIdentifier.raw,
      garbageBetweenLeftTypeIdentifierAndEqualityToken?.raw,
      equalityToken.raw,
      garbageBetweenEqualityTokenAndRightTypeIdentifier?.raw,
      rightTypeIdentifier.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.sameTypeRequirement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SameTypeRequirementSyntax(data)
  }

  public static func makeBlankSameTypeRequirement(presence: SourcePresence = .present) -> SameTypeRequirementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .sameTypeRequirement,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      RawSyntax.missingToken(TokenKind.spacedBinaryOperator("")),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return SameTypeRequirementSyntax(data)
  }
  public static func makeLayoutRequirement(garbage garbageBeforeTypeIdentifier: GarbageNodesSyntax? = nil, typeIdentifier: TypeSyntax, garbage garbageBetweenTypeIdentifierAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndLayoutConstraint: GarbageNodesSyntax? = nil, layoutConstraint: TokenSyntax, garbage garbageBetweenLayoutConstraintAndLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax?, garbage garbageBetweenLeftParenAndSize: GarbageNodesSyntax? = nil, size: TokenSyntax?, garbage garbageBetweenSizeAndComma: GarbageNodesSyntax? = nil, comma: TokenSyntax?, garbage garbageBetweenCommaAndAlignment: GarbageNodesSyntax? = nil, alignment: TokenSyntax?, garbage garbageBetweenAlignmentAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax?) -> LayoutRequirementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeTypeIdentifier?.raw,
      typeIdentifier.raw,
      garbageBetweenTypeIdentifierAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndLayoutConstraint?.raw,
      layoutConstraint.raw,
      garbageBetweenLayoutConstraintAndLeftParen?.raw,
      leftParen?.raw,
      garbageBetweenLeftParenAndSize?.raw,
      size?.raw,
      garbageBetweenSizeAndComma?.raw,
      comma?.raw,
      garbageBetweenCommaAndAlignment?.raw,
      alignment?.raw,
      garbageBetweenAlignmentAndRightParen?.raw,
      rightParen?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.layoutRequirement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return LayoutRequirementSyntax(data)
  }

  public static func makeBlankLayoutRequirement(presence: SourcePresence = .present) -> LayoutRequirementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .layoutRequirement,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return LayoutRequirementSyntax(data)
  }
  public static func makeGenericParameterList(
    _ elements: [GenericParameterSyntax]) -> GenericParameterListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.genericParameterList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return GenericParameterListSyntax(data)
  }

  public static func makeBlankGenericParameterList(presence: SourcePresence = .present) -> GenericParameterListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .genericParameterList,
      layout: [
    ], length: .zero, presence: presence))
    return GenericParameterListSyntax(data)
  }
  public static func makeGenericParameter(garbage garbageBeforeAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax?, garbage garbageBetweenColonAndInheritedType: GarbageNodesSyntax? = nil, inheritedType: TypeSyntax?, garbage garbageBetweenInheritedTypeAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> GenericParameterSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndName?.raw,
      name.raw,
      garbageBetweenNameAndColon?.raw,
      colon?.raw,
      garbageBetweenColonAndInheritedType?.raw,
      inheritedType?.raw,
      garbageBetweenInheritedTypeAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.genericParameter,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return GenericParameterSyntax(data)
  }

  public static func makeBlankGenericParameter(presence: SourcePresence = .present) -> GenericParameterSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .genericParameter,
      layout: [
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return GenericParameterSyntax(data)
  }
  public static func makePrimaryAssociatedTypeList(
    _ elements: [PrimaryAssociatedTypeSyntax]) -> PrimaryAssociatedTypeListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.primaryAssociatedTypeList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PrimaryAssociatedTypeListSyntax(data)
  }

  public static func makeBlankPrimaryAssociatedTypeList(presence: SourcePresence = .present) -> PrimaryAssociatedTypeListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .primaryAssociatedTypeList,
      layout: [
    ], length: .zero, presence: presence))
    return PrimaryAssociatedTypeListSyntax(data)
  }
  public static func makePrimaryAssociatedType(garbage garbageBeforeName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> PrimaryAssociatedTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeName?.raw,
      name.raw,
      garbageBetweenNameAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.primaryAssociatedType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PrimaryAssociatedTypeSyntax(data)
  }

  public static func makeBlankPrimaryAssociatedType(presence: SourcePresence = .present) -> PrimaryAssociatedTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .primaryAssociatedType,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return PrimaryAssociatedTypeSyntax(data)
  }
  public static func makeGenericParameterClause(garbage garbageBeforeLeftAngleBracket: GarbageNodesSyntax? = nil, leftAngleBracket: TokenSyntax, garbage garbageBetweenLeftAngleBracketAndGenericParameterList: GarbageNodesSyntax? = nil, genericParameterList: GenericParameterListSyntax, garbage garbageBetweenGenericParameterListAndRightAngleBracket: GarbageNodesSyntax? = nil, rightAngleBracket: TokenSyntax) -> GenericParameterClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftAngleBracket?.raw,
      leftAngleBracket.raw,
      garbageBetweenLeftAngleBracketAndGenericParameterList?.raw,
      genericParameterList.raw,
      garbageBetweenGenericParameterListAndRightAngleBracket?.raw,
      rightAngleBracket.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.genericParameterClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return GenericParameterClauseSyntax(data)
  }

  public static func makeBlankGenericParameterClause(presence: SourcePresence = .present) -> GenericParameterClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .genericParameterClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftAngle),
      nil,
      RawSyntax.missing(SyntaxKind.genericParameterList),
      nil,
      RawSyntax.missingToken(TokenKind.rightAngle),
    ], length: .zero, presence: presence))
    return GenericParameterClauseSyntax(data)
  }
  public static func makeConformanceRequirement(garbage garbageBeforeLeftTypeIdentifier: GarbageNodesSyntax? = nil, leftTypeIdentifier: TypeSyntax, garbage garbageBetweenLeftTypeIdentifierAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndRightTypeIdentifier: GarbageNodesSyntax? = nil, rightTypeIdentifier: TypeSyntax) -> ConformanceRequirementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftTypeIdentifier?.raw,
      leftTypeIdentifier.raw,
      garbageBetweenLeftTypeIdentifierAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndRightTypeIdentifier?.raw,
      rightTypeIdentifier.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.conformanceRequirement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ConformanceRequirementSyntax(data)
  }

  public static func makeBlankConformanceRequirement(presence: SourcePresence = .present) -> ConformanceRequirementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .conformanceRequirement,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return ConformanceRequirementSyntax(data)
  }
  public static func makePrimaryAssociatedTypeClause(garbage garbageBeforeLeftAngleBracket: GarbageNodesSyntax? = nil, leftAngleBracket: TokenSyntax, garbage garbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList: GarbageNodesSyntax? = nil, primaryAssociatedTypeList: PrimaryAssociatedTypeListSyntax, garbage garbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket: GarbageNodesSyntax? = nil, rightAngleBracket: TokenSyntax) -> PrimaryAssociatedTypeClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftAngleBracket?.raw,
      leftAngleBracket.raw,
      garbageBetweenLeftAngleBracketAndPrimaryAssociatedTypeList?.raw,
      primaryAssociatedTypeList.raw,
      garbageBetweenPrimaryAssociatedTypeListAndRightAngleBracket?.raw,
      rightAngleBracket.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.primaryAssociatedTypeClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return PrimaryAssociatedTypeClauseSyntax(data)
  }

  public static func makeBlankPrimaryAssociatedTypeClause(presence: SourcePresence = .present) -> PrimaryAssociatedTypeClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .primaryAssociatedTypeClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftAngle),
      nil,
      RawSyntax.missing(SyntaxKind.primaryAssociatedTypeList),
      nil,
      RawSyntax.missingToken(TokenKind.rightAngle),
    ], length: .zero, presence: presence))
    return PrimaryAssociatedTypeClauseSyntax(data)
  }
  public static func makeSimpleTypeIdentifier(garbage garbageBeforeName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndGenericArgumentClause: GarbageNodesSyntax? = nil, genericArgumentClause: GenericArgumentClauseSyntax?) -> SimpleTypeIdentifierSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeName?.raw,
      name.raw,
      garbageBetweenNameAndGenericArgumentClause?.raw,
      genericArgumentClause?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.simpleTypeIdentifier,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return SimpleTypeIdentifierSyntax(data)
  }

  public static func makeBlankSimpleTypeIdentifier(presence: SourcePresence = .present) -> SimpleTypeIdentifierSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .simpleTypeIdentifier,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return SimpleTypeIdentifierSyntax(data)
  }
  public static func makeMemberTypeIdentifier(garbage garbageBeforeBaseType: GarbageNodesSyntax? = nil, baseType: TypeSyntax, garbage garbageBetweenBaseTypeAndPeriod: GarbageNodesSyntax? = nil, period: TokenSyntax, garbage garbageBetweenPeriodAndName: GarbageNodesSyntax? = nil, name: TokenSyntax, garbage garbageBetweenNameAndGenericArgumentClause: GarbageNodesSyntax? = nil, genericArgumentClause: GenericArgumentClauseSyntax?) -> MemberTypeIdentifierSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeBaseType?.raw,
      baseType.raw,
      garbageBetweenBaseTypeAndPeriod?.raw,
      period.raw,
      garbageBetweenPeriodAndName?.raw,
      name.raw,
      garbageBetweenNameAndGenericArgumentClause?.raw,
      genericArgumentClause?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.memberTypeIdentifier,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return MemberTypeIdentifierSyntax(data)
  }

  public static func makeBlankMemberTypeIdentifier(presence: SourcePresence = .present) -> MemberTypeIdentifierSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .memberTypeIdentifier,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      RawSyntax.missingToken(TokenKind.period),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return MemberTypeIdentifierSyntax(data)
  }
  public static func makeClassRestrictionType(garbage garbageBeforeClassKeyword: GarbageNodesSyntax? = nil, classKeyword: TokenSyntax) -> ClassRestrictionTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeClassKeyword?.raw,
      classKeyword.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.classRestrictionType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ClassRestrictionTypeSyntax(data)
  }

  public static func makeBlankClassRestrictionType(presence: SourcePresence = .present) -> ClassRestrictionTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .classRestrictionType,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.classKeyword),
    ], length: .zero, presence: presence))
    return ClassRestrictionTypeSyntax(data)
  }
  public static func makeArrayType(garbage garbageBeforeLeftSquareBracket: GarbageNodesSyntax? = nil, leftSquareBracket: TokenSyntax, garbage garbageBetweenLeftSquareBracketAndElementType: GarbageNodesSyntax? = nil, elementType: TypeSyntax, garbage garbageBetweenElementTypeAndRightSquareBracket: GarbageNodesSyntax? = nil, rightSquareBracket: TokenSyntax) -> ArrayTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftSquareBracket?.raw,
      leftSquareBracket.raw,
      garbageBetweenLeftSquareBracketAndElementType?.raw,
      elementType.raw,
      garbageBetweenElementTypeAndRightSquareBracket?.raw,
      rightSquareBracket.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.arrayType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ArrayTypeSyntax(data)
  }

  public static func makeBlankArrayType(presence: SourcePresence = .present) -> ArrayTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .arrayType,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftSquareBracket),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      RawSyntax.missingToken(TokenKind.rightSquareBracket),
    ], length: .zero, presence: presence))
    return ArrayTypeSyntax(data)
  }
  public static func makeDictionaryType(garbage garbageBeforeLeftSquareBracket: GarbageNodesSyntax? = nil, leftSquareBracket: TokenSyntax, garbage garbageBetweenLeftSquareBracketAndKeyType: GarbageNodesSyntax? = nil, keyType: TypeSyntax, garbage garbageBetweenKeyTypeAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndValueType: GarbageNodesSyntax? = nil, valueType: TypeSyntax, garbage garbageBetweenValueTypeAndRightSquareBracket: GarbageNodesSyntax? = nil, rightSquareBracket: TokenSyntax) -> DictionaryTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftSquareBracket?.raw,
      leftSquareBracket.raw,
      garbageBetweenLeftSquareBracketAndKeyType?.raw,
      keyType.raw,
      garbageBetweenKeyTypeAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndValueType?.raw,
      valueType.raw,
      garbageBetweenValueTypeAndRightSquareBracket?.raw,
      rightSquareBracket.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.dictionaryType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return DictionaryTypeSyntax(data)
  }

  public static func makeBlankDictionaryType(presence: SourcePresence = .present) -> DictionaryTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .dictionaryType,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftSquareBracket),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      RawSyntax.missingToken(TokenKind.rightSquareBracket),
    ], length: .zero, presence: presence))
    return DictionaryTypeSyntax(data)
  }
  public static func makeMetatypeType(garbage garbageBeforeBaseType: GarbageNodesSyntax? = nil, baseType: TypeSyntax, garbage garbageBetweenBaseTypeAndPeriod: GarbageNodesSyntax? = nil, period: TokenSyntax, garbage garbageBetweenPeriodAndTypeOrProtocol: GarbageNodesSyntax? = nil, typeOrProtocol: TokenSyntax) -> MetatypeTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeBaseType?.raw,
      baseType.raw,
      garbageBetweenBaseTypeAndPeriod?.raw,
      period.raw,
      garbageBetweenPeriodAndTypeOrProtocol?.raw,
      typeOrProtocol.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.metatypeType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return MetatypeTypeSyntax(data)
  }

  public static func makeBlankMetatypeType(presence: SourcePresence = .present) -> MetatypeTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .metatypeType,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      RawSyntax.missingToken(TokenKind.period),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
    ], length: .zero, presence: presence))
    return MetatypeTypeSyntax(data)
  }
  public static func makeOptionalType(garbage garbageBeforeWrappedType: GarbageNodesSyntax? = nil, wrappedType: TypeSyntax, garbage garbageBetweenWrappedTypeAndQuestionMark: GarbageNodesSyntax? = nil, questionMark: TokenSyntax) -> OptionalTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeWrappedType?.raw,
      wrappedType.raw,
      garbageBetweenWrappedTypeAndQuestionMark?.raw,
      questionMark.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.optionalType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return OptionalTypeSyntax(data)
  }

  public static func makeBlankOptionalType(presence: SourcePresence = .present) -> OptionalTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .optionalType,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      RawSyntax.missingToken(TokenKind.postfixQuestionMark),
    ], length: .zero, presence: presence))
    return OptionalTypeSyntax(data)
  }
  public static func makeConstrainedSugarType(garbage garbageBeforeSomeOrAnySpecifier: GarbageNodesSyntax? = nil, someOrAnySpecifier: TokenSyntax, garbage garbageBetweenSomeOrAnySpecifierAndBaseType: GarbageNodesSyntax? = nil, baseType: TypeSyntax) -> ConstrainedSugarTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeSomeOrAnySpecifier?.raw,
      someOrAnySpecifier.raw,
      garbageBetweenSomeOrAnySpecifierAndBaseType?.raw,
      baseType.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.constrainedSugarType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ConstrainedSugarTypeSyntax(data)
  }

  public static func makeBlankConstrainedSugarType(presence: SourcePresence = .present) -> ConstrainedSugarTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .constrainedSugarType,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return ConstrainedSugarTypeSyntax(data)
  }
  public static func makeImplicitlyUnwrappedOptionalType(garbage garbageBeforeWrappedType: GarbageNodesSyntax? = nil, wrappedType: TypeSyntax, garbage garbageBetweenWrappedTypeAndExclamationMark: GarbageNodesSyntax? = nil, exclamationMark: TokenSyntax) -> ImplicitlyUnwrappedOptionalTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeWrappedType?.raw,
      wrappedType.raw,
      garbageBetweenWrappedTypeAndExclamationMark?.raw,
      exclamationMark.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.implicitlyUnwrappedOptionalType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ImplicitlyUnwrappedOptionalTypeSyntax(data)
  }

  public static func makeBlankImplicitlyUnwrappedOptionalType(presence: SourcePresence = .present) -> ImplicitlyUnwrappedOptionalTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .implicitlyUnwrappedOptionalType,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      RawSyntax.missingToken(TokenKind.exclamationMark),
    ], length: .zero, presence: presence))
    return ImplicitlyUnwrappedOptionalTypeSyntax(data)
  }
  public static func makeCompositionTypeElement(garbage garbageBeforeType: GarbageNodesSyntax? = nil, type: TypeSyntax, garbage garbageBetweenTypeAndAmpersand: GarbageNodesSyntax? = nil, ampersand: TokenSyntax?) -> CompositionTypeElementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeType?.raw,
      type.raw,
      garbageBetweenTypeAndAmpersand?.raw,
      ampersand?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.compositionTypeElement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CompositionTypeElementSyntax(data)
  }

  public static func makeBlankCompositionTypeElement(presence: SourcePresence = .present) -> CompositionTypeElementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .compositionTypeElement,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return CompositionTypeElementSyntax(data)
  }
  public static func makeCompositionTypeElementList(
    _ elements: [CompositionTypeElementSyntax]) -> CompositionTypeElementListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.compositionTypeElementList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CompositionTypeElementListSyntax(data)
  }

  public static func makeBlankCompositionTypeElementList(presence: SourcePresence = .present) -> CompositionTypeElementListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .compositionTypeElementList,
      layout: [
    ], length: .zero, presence: presence))
    return CompositionTypeElementListSyntax(data)
  }
  public static func makeCompositionType(garbage garbageBeforeElements: GarbageNodesSyntax? = nil, elements: CompositionTypeElementListSyntax) -> CompositionTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeElements?.raw,
      elements.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.compositionType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return CompositionTypeSyntax(data)
  }

  public static func makeBlankCompositionType(presence: SourcePresence = .present) -> CompositionTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .compositionType,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.compositionTypeElementList),
    ], length: .zero, presence: presence))
    return CompositionTypeSyntax(data)
  }
  public static func makeTupleTypeElement(garbage garbageBeforeInOut: GarbageNodesSyntax? = nil, inOut: TokenSyntax?, garbage garbageBetweenInOutAndName: GarbageNodesSyntax? = nil, name: TokenSyntax?, garbage garbageBetweenNameAndSecondName: GarbageNodesSyntax? = nil, secondName: TokenSyntax?, garbage garbageBetweenSecondNameAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax?, garbage garbageBetweenColonAndType: GarbageNodesSyntax? = nil, type: TypeSyntax, garbage garbageBetweenTypeAndEllipsis: GarbageNodesSyntax? = nil, ellipsis: TokenSyntax?, garbage garbageBetweenEllipsisAndInitializer: GarbageNodesSyntax? = nil, initializer: InitializerClauseSyntax?, garbage garbageBetweenInitializerAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> TupleTypeElementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeInOut?.raw,
      inOut?.raw,
      garbageBetweenInOutAndName?.raw,
      name?.raw,
      garbageBetweenNameAndSecondName?.raw,
      secondName?.raw,
      garbageBetweenSecondNameAndColon?.raw,
      colon?.raw,
      garbageBetweenColonAndType?.raw,
      type.raw,
      garbageBetweenTypeAndEllipsis?.raw,
      ellipsis?.raw,
      garbageBetweenEllipsisAndInitializer?.raw,
      initializer?.raw,
      garbageBetweenInitializerAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.tupleTypeElement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TupleTypeElementSyntax(data)
  }

  public static func makeBlankTupleTypeElement(presence: SourcePresence = .present) -> TupleTypeElementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .tupleTypeElement,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return TupleTypeElementSyntax(data)
  }
  public static func makeTupleTypeElementList(
    _ elements: [TupleTypeElementSyntax]) -> TupleTypeElementListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.tupleTypeElementList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TupleTypeElementListSyntax(data)
  }

  public static func makeBlankTupleTypeElementList(presence: SourcePresence = .present) -> TupleTypeElementListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .tupleTypeElementList,
      layout: [
    ], length: .zero, presence: presence))
    return TupleTypeElementListSyntax(data)
  }
  public static func makeTupleType(garbage garbageBeforeLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndElements: GarbageNodesSyntax? = nil, elements: TupleTypeElementListSyntax, garbage garbageBetweenElementsAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> TupleTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndElements?.raw,
      elements.raw,
      garbageBetweenElementsAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.tupleType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TupleTypeSyntax(data)
  }

  public static func makeBlankTupleType(presence: SourcePresence = .present) -> TupleTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .tupleType,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.tupleTypeElementList),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return TupleTypeSyntax(data)
  }
  public static func makeFunctionType(garbage garbageBeforeLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndArguments: GarbageNodesSyntax? = nil, arguments: TupleTypeElementListSyntax, garbage garbageBetweenArgumentsAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax, garbage garbageBetweenRightParenAndAsyncKeyword: GarbageNodesSyntax? = nil, asyncKeyword: TokenSyntax?, garbage garbageBetweenAsyncKeywordAndThrowsOrRethrowsKeyword: GarbageNodesSyntax? = nil, throwsOrRethrowsKeyword: TokenSyntax?, garbage garbageBetweenThrowsOrRethrowsKeywordAndArrow: GarbageNodesSyntax? = nil, arrow: TokenSyntax, garbage garbageBetweenArrowAndReturnType: GarbageNodesSyntax? = nil, returnType: TypeSyntax) -> FunctionTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndArguments?.raw,
      arguments.raw,
      garbageBetweenArgumentsAndRightParen?.raw,
      rightParen.raw,
      garbageBetweenRightParenAndAsyncKeyword?.raw,
      asyncKeyword?.raw,
      garbageBetweenAsyncKeywordAndThrowsOrRethrowsKeyword?.raw,
      throwsOrRethrowsKeyword?.raw,
      garbageBetweenThrowsOrRethrowsKeywordAndArrow?.raw,
      arrow.raw,
      garbageBetweenArrowAndReturnType?.raw,
      returnType.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.functionType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return FunctionTypeSyntax(data)
  }

  public static func makeBlankFunctionType(presence: SourcePresence = .present) -> FunctionTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .functionType,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.tupleTypeElementList),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.arrow),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return FunctionTypeSyntax(data)
  }
  public static func makeAttributedType(garbage garbageBeforeSpecifier: GarbageNodesSyntax? = nil, specifier: TokenSyntax?, garbage garbageBetweenSpecifierAndAttributes: GarbageNodesSyntax? = nil, attributes: AttributeListSyntax?, garbage garbageBetweenAttributesAndBaseType: GarbageNodesSyntax? = nil, baseType: TypeSyntax) -> AttributedTypeSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeSpecifier?.raw,
      specifier?.raw,
      garbageBetweenSpecifierAndAttributes?.raw,
      attributes?.raw,
      garbageBetweenAttributesAndBaseType?.raw,
      baseType.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.attributedType,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AttributedTypeSyntax(data)
  }

  public static func makeBlankAttributedType(presence: SourcePresence = .present) -> AttributedTypeSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .attributedType,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return AttributedTypeSyntax(data)
  }
  public static func makeGenericArgumentList(
    _ elements: [GenericArgumentSyntax]) -> GenericArgumentListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.genericArgumentList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return GenericArgumentListSyntax(data)
  }

  public static func makeBlankGenericArgumentList(presence: SourcePresence = .present) -> GenericArgumentListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .genericArgumentList,
      layout: [
    ], length: .zero, presence: presence))
    return GenericArgumentListSyntax(data)
  }
  public static func makeGenericArgument(garbage garbageBeforeArgumentType: GarbageNodesSyntax? = nil, argumentType: TypeSyntax, garbage garbageBetweenArgumentTypeAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> GenericArgumentSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeArgumentType?.raw,
      argumentType.raw,
      garbageBetweenArgumentTypeAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.genericArgument,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return GenericArgumentSyntax(data)
  }

  public static func makeBlankGenericArgument(presence: SourcePresence = .present) -> GenericArgumentSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .genericArgument,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return GenericArgumentSyntax(data)
  }
  public static func makeGenericArgumentClause(garbage garbageBeforeLeftAngleBracket: GarbageNodesSyntax? = nil, leftAngleBracket: TokenSyntax, garbage garbageBetweenLeftAngleBracketAndArguments: GarbageNodesSyntax? = nil, arguments: GenericArgumentListSyntax, garbage garbageBetweenArgumentsAndRightAngleBracket: GarbageNodesSyntax? = nil, rightAngleBracket: TokenSyntax) -> GenericArgumentClauseSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftAngleBracket?.raw,
      leftAngleBracket.raw,
      garbageBetweenLeftAngleBracketAndArguments?.raw,
      arguments.raw,
      garbageBetweenArgumentsAndRightAngleBracket?.raw,
      rightAngleBracket.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.genericArgumentClause,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return GenericArgumentClauseSyntax(data)
  }

  public static func makeBlankGenericArgumentClause(presence: SourcePresence = .present) -> GenericArgumentClauseSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .genericArgumentClause,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftAngle),
      nil,
      RawSyntax.missing(SyntaxKind.genericArgumentList),
      nil,
      RawSyntax.missingToken(TokenKind.rightAngle),
    ], length: .zero, presence: presence))
    return GenericArgumentClauseSyntax(data)
  }
  public static func makeTypeAnnotation(garbage garbageBeforeColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndType: GarbageNodesSyntax? = nil, type: TypeSyntax) -> TypeAnnotationSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeColon?.raw,
      colon.raw,
      garbageBetweenColonAndType?.raw,
      type.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.typeAnnotation,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TypeAnnotationSyntax(data)
  }

  public static func makeBlankTypeAnnotation(presence: SourcePresence = .present) -> TypeAnnotationSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .typeAnnotation,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return TypeAnnotationSyntax(data)
  }
  public static func makeEnumCasePattern(garbage garbageBeforeType: GarbageNodesSyntax? = nil, type: TypeSyntax?, garbage garbageBetweenTypeAndPeriod: GarbageNodesSyntax? = nil, period: TokenSyntax, garbage garbageBetweenPeriodAndCaseName: GarbageNodesSyntax? = nil, caseName: TokenSyntax, garbage garbageBetweenCaseNameAndAssociatedTuple: GarbageNodesSyntax? = nil, associatedTuple: TuplePatternSyntax?) -> EnumCasePatternSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeType?.raw,
      type?.raw,
      garbageBetweenTypeAndPeriod?.raw,
      period.raw,
      garbageBetweenPeriodAndCaseName?.raw,
      caseName.raw,
      garbageBetweenCaseNameAndAssociatedTuple?.raw,
      associatedTuple?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.enumCasePattern,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return EnumCasePatternSyntax(data)
  }

  public static func makeBlankEnumCasePattern(presence: SourcePresence = .present) -> EnumCasePatternSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .enumCasePattern,
      layout: [
      nil,
      nil,
      nil,
      RawSyntax.missingToken(TokenKind.period),
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return EnumCasePatternSyntax(data)
  }
  public static func makeIsTypePattern(garbage garbageBeforeIsKeyword: GarbageNodesSyntax? = nil, isKeyword: TokenSyntax, garbage garbageBetweenIsKeywordAndType: GarbageNodesSyntax? = nil, type: TypeSyntax) -> IsTypePatternSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeIsKeyword?.raw,
      isKeyword.raw,
      garbageBetweenIsKeywordAndType?.raw,
      type.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.isTypePattern,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return IsTypePatternSyntax(data)
  }

  public static func makeBlankIsTypePattern(presence: SourcePresence = .present) -> IsTypePatternSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .isTypePattern,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.isKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return IsTypePatternSyntax(data)
  }
  public static func makeOptionalPattern(garbage garbageBeforeSubPattern: GarbageNodesSyntax? = nil, subPattern: PatternSyntax, garbage garbageBetweenSubPatternAndQuestionMark: GarbageNodesSyntax? = nil, questionMark: TokenSyntax) -> OptionalPatternSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeSubPattern?.raw,
      subPattern.raw,
      garbageBetweenSubPatternAndQuestionMark?.raw,
      questionMark.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.optionalPattern,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return OptionalPatternSyntax(data)
  }

  public static func makeBlankOptionalPattern(presence: SourcePresence = .present) -> OptionalPatternSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .optionalPattern,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingPattern),
      nil,
      RawSyntax.missingToken(TokenKind.postfixQuestionMark),
    ], length: .zero, presence: presence))
    return OptionalPatternSyntax(data)
  }
  public static func makeIdentifierPattern(garbage garbageBeforeIdentifier: GarbageNodesSyntax? = nil, identifier: TokenSyntax) -> IdentifierPatternSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeIdentifier?.raw,
      identifier.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.identifierPattern,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return IdentifierPatternSyntax(data)
  }

  public static func makeBlankIdentifierPattern(presence: SourcePresence = .present) -> IdentifierPatternSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .identifierPattern,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.selfKeyword),
    ], length: .zero, presence: presence))
    return IdentifierPatternSyntax(data)
  }
  public static func makeAsTypePattern(garbage garbageBeforePattern: GarbageNodesSyntax? = nil, pattern: PatternSyntax, garbage garbageBetweenPatternAndAsKeyword: GarbageNodesSyntax? = nil, asKeyword: TokenSyntax, garbage garbageBetweenAsKeywordAndType: GarbageNodesSyntax? = nil, type: TypeSyntax) -> AsTypePatternSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePattern?.raw,
      pattern.raw,
      garbageBetweenPatternAndAsKeyword?.raw,
      asKeyword.raw,
      garbageBetweenAsKeywordAndType?.raw,
      type.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.asTypePattern,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AsTypePatternSyntax(data)
  }

  public static func makeBlankAsTypePattern(presence: SourcePresence = .present) -> AsTypePatternSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .asTypePattern,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingPattern),
      nil,
      RawSyntax.missingToken(TokenKind.asKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingType),
    ], length: .zero, presence: presence))
    return AsTypePatternSyntax(data)
  }
  public static func makeTuplePattern(garbage garbageBeforeLeftParen: GarbageNodesSyntax? = nil, leftParen: TokenSyntax, garbage garbageBetweenLeftParenAndElements: GarbageNodesSyntax? = nil, elements: TuplePatternElementListSyntax, garbage garbageBetweenElementsAndRightParen: GarbageNodesSyntax? = nil, rightParen: TokenSyntax) -> TuplePatternSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLeftParen?.raw,
      leftParen.raw,
      garbageBetweenLeftParenAndElements?.raw,
      elements.raw,
      garbageBetweenElementsAndRightParen?.raw,
      rightParen.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.tuplePattern,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TuplePatternSyntax(data)
  }

  public static func makeBlankTuplePattern(presence: SourcePresence = .present) -> TuplePatternSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .tuplePattern,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.leftParen),
      nil,
      RawSyntax.missing(SyntaxKind.tuplePatternElementList),
      nil,
      RawSyntax.missingToken(TokenKind.rightParen),
    ], length: .zero, presence: presence))
    return TuplePatternSyntax(data)
  }
  public static func makeWildcardPattern(garbage garbageBeforeWildcard: GarbageNodesSyntax? = nil, wildcard: TokenSyntax, garbage garbageBetweenWildcardAndTypeAnnotation: GarbageNodesSyntax? = nil, typeAnnotation: TypeAnnotationSyntax?) -> WildcardPatternSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeWildcard?.raw,
      wildcard.raw,
      garbageBetweenWildcardAndTypeAnnotation?.raw,
      typeAnnotation?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.wildcardPattern,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return WildcardPatternSyntax(data)
  }

  public static func makeBlankWildcardPattern(presence: SourcePresence = .present) -> WildcardPatternSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .wildcardPattern,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.wildcardKeyword),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return WildcardPatternSyntax(data)
  }
  public static func makeTuplePatternElement(garbage garbageBeforeLabelName: GarbageNodesSyntax? = nil, labelName: TokenSyntax?, garbage garbageBetweenLabelNameAndLabelColon: GarbageNodesSyntax? = nil, labelColon: TokenSyntax?, garbage garbageBetweenLabelColonAndPattern: GarbageNodesSyntax? = nil, pattern: PatternSyntax, garbage garbageBetweenPatternAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> TuplePatternElementSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabelName?.raw,
      labelName?.raw,
      garbageBetweenLabelNameAndLabelColon?.raw,
      labelColon?.raw,
      garbageBetweenLabelColonAndPattern?.raw,
      pattern.raw,
      garbageBetweenPatternAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.tuplePatternElement,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TuplePatternElementSyntax(data)
  }

  public static func makeBlankTuplePatternElement(presence: SourcePresence = .present) -> TuplePatternElementSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .tuplePatternElement,
      layout: [
      nil,
      nil,
      nil,
      nil,
      nil,
      RawSyntax.missing(SyntaxKind.missingPattern),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return TuplePatternElementSyntax(data)
  }
  public static func makeExpressionPattern(garbage garbageBeforeExpression: GarbageNodesSyntax? = nil, expression: ExprSyntax) -> ExpressionPatternSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeExpression?.raw,
      expression.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.expressionPattern,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ExpressionPatternSyntax(data)
  }

  public static func makeBlankExpressionPattern(presence: SourcePresence = .present) -> ExpressionPatternSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .expressionPattern,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.missingExpr),
    ], length: .zero, presence: presence))
    return ExpressionPatternSyntax(data)
  }
  public static func makeTuplePatternElementList(
    _ elements: [TuplePatternElementSyntax]) -> TuplePatternElementListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.tuplePatternElementList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return TuplePatternElementListSyntax(data)
  }

  public static func makeBlankTuplePatternElementList(presence: SourcePresence = .present) -> TuplePatternElementListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .tuplePatternElementList,
      layout: [
    ], length: .zero, presence: presence))
    return TuplePatternElementListSyntax(data)
  }
  public static func makeValueBindingPattern(garbage garbageBeforeLetOrVarKeyword: GarbageNodesSyntax? = nil, letOrVarKeyword: TokenSyntax, garbage garbageBetweenLetOrVarKeywordAndValuePattern: GarbageNodesSyntax? = nil, valuePattern: PatternSyntax) -> ValueBindingPatternSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLetOrVarKeyword?.raw,
      letOrVarKeyword.raw,
      garbageBetweenLetOrVarKeywordAndValuePattern?.raw,
      valuePattern.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.valueBindingPattern,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return ValueBindingPatternSyntax(data)
  }

  public static func makeBlankValueBindingPattern(presence: SourcePresence = .present) -> ValueBindingPatternSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .valueBindingPattern,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.letKeyword),
      nil,
      RawSyntax.missing(SyntaxKind.missingPattern),
    ], length: .zero, presence: presence))
    return ValueBindingPatternSyntax(data)
  }
  public static func makeAvailabilitySpecList(
    _ elements: [AvailabilityArgumentSyntax]) -> AvailabilitySpecListSyntax {
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.availabilitySpecList,
      layout: elements.map { $0.raw }, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AvailabilitySpecListSyntax(data)
  }

  public static func makeBlankAvailabilitySpecList(presence: SourcePresence = .present) -> AvailabilitySpecListSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .availabilitySpecList,
      layout: [
    ], length: .zero, presence: presence))
    return AvailabilitySpecListSyntax(data)
  }
  public static func makeAvailabilityArgument(garbage garbageBeforeEntry: GarbageNodesSyntax? = nil, entry: Syntax, garbage garbageBetweenEntryAndTrailingComma: GarbageNodesSyntax? = nil, trailingComma: TokenSyntax?) -> AvailabilityArgumentSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeEntry?.raw,
      entry.raw,
      garbageBetweenEntryAndTrailingComma?.raw,
      trailingComma?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.availabilityArgument,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AvailabilityArgumentSyntax(data)
  }

  public static func makeBlankAvailabilityArgument(presence: SourcePresence = .present) -> AvailabilityArgumentSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .availabilityArgument,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return AvailabilityArgumentSyntax(data)
  }
  public static func makeAvailabilityLabeledArgument(garbage garbageBeforeLabel: GarbageNodesSyntax? = nil, label: TokenSyntax, garbage garbageBetweenLabelAndColon: GarbageNodesSyntax? = nil, colon: TokenSyntax, garbage garbageBetweenColonAndValue: GarbageNodesSyntax? = nil, value: Syntax) -> AvailabilityLabeledArgumentSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeLabel?.raw,
      label.raw,
      garbageBetweenLabelAndColon?.raw,
      colon.raw,
      garbageBetweenColonAndValue?.raw,
      value.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.availabilityLabeledArgument,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AvailabilityLabeledArgumentSyntax(data)
  }

  public static func makeBlankAvailabilityLabeledArgument(presence: SourcePresence = .present) -> AvailabilityLabeledArgumentSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .availabilityLabeledArgument,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      RawSyntax.missingToken(TokenKind.colon),
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
    ], length: .zero, presence: presence))
    return AvailabilityLabeledArgumentSyntax(data)
  }
  public static func makeAvailabilityVersionRestriction(garbage garbageBeforePlatform: GarbageNodesSyntax? = nil, platform: TokenSyntax, garbage garbageBetweenPlatformAndVersion: GarbageNodesSyntax? = nil, version: VersionTupleSyntax?) -> AvailabilityVersionRestrictionSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforePlatform?.raw,
      platform.raw,
      garbageBetweenPlatformAndVersion?.raw,
      version?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.availabilityVersionRestriction,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return AvailabilityVersionRestrictionSyntax(data)
  }

  public static func makeBlankAvailabilityVersionRestriction(presence: SourcePresence = .present) -> AvailabilityVersionRestrictionSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .availabilityVersionRestriction,
      layout: [
      nil,
      RawSyntax.missingToken(TokenKind.identifier("")),
      nil,
      nil,
    ], length: .zero, presence: presence))
    return AvailabilityVersionRestrictionSyntax(data)
  }
  public static func makeVersionTuple(garbage garbageBeforeMajorMinor: GarbageNodesSyntax? = nil, majorMinor: Syntax, garbage garbageBetweenMajorMinorAndPatchPeriod: GarbageNodesSyntax? = nil, patchPeriod: TokenSyntax?, garbage garbageBetweenPatchPeriodAndPatchVersion: GarbageNodesSyntax? = nil, patchVersion: TokenSyntax?) -> VersionTupleSyntax {
    let layout: [RawSyntax?] = [
      garbageBeforeMajorMinor?.raw,
      majorMinor.raw,
      garbageBetweenMajorMinorAndPatchPeriod?.raw,
      patchPeriod?.raw,
      garbageBetweenPatchPeriodAndPatchVersion?.raw,
      patchVersion?.raw,
    ]
    let raw = RawSyntax.createAndCalcLength(kind: SyntaxKind.versionTuple,
      layout: layout, presence: SourcePresence.present)
    let data = SyntaxData.forRoot(raw)
    return VersionTupleSyntax(data)
  }

  public static func makeBlankVersionTuple(presence: SourcePresence = .present) -> VersionTupleSyntax {
    let data = SyntaxData.forRoot(RawSyntax.create(kind: .versionTuple,
      layout: [
      nil,
      RawSyntax.missing(SyntaxKind.unknown),
      nil,
      nil,
      nil,
      nil,
    ], length: .zero, presence: presence))
    return VersionTupleSyntax(data)
  }

/// MARK: Token Creation APIs


  public static func makeAssociatedtypeKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.associatedtypeKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeClassKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.classKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeDeinitKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.deinitKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeEnumKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.enumKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeExtensionKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.extensionKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeFuncKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.funcKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeImportKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.importKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeInitKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.initKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeInoutKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.inoutKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeLetKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.letKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeOperatorKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.operatorKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePrecedencegroupKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.precedencegroupKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeProtocolKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.protocolKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStructKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.structKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSubscriptKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.subscriptKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeTypealiasKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.typealiasKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeVarKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.varKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeFileprivateKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.fileprivateKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeInternalKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.internalKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePrivateKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.privateKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePublicKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.publicKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStaticKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.staticKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeDeferKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.deferKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeIfKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.ifKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeGuardKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.guardKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeDoKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.doKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRepeatKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.repeatKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeElseKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.elseKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeForKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.forKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeInKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.inKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeWhileKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.whileKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeReturnKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.returnKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeBreakKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.breakKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeContinueKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.continueKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeFallthroughKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.fallthroughKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSwitchKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.switchKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeCaseKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.caseKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeDefaultKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.defaultKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeWhereKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.whereKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeCatchKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.catchKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeThrowKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.throwKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeAsKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.asKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeAnyKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.anyKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeFalseKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.falseKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeIsKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.isKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeNilKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.nilKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRethrowsKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.rethrowsKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSuperKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.superKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSelfKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.selfKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeCapitalSelfKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.capitalSelfKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeTrueKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.trueKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeTryKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.tryKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeThrowsKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.throwsKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func make__FILE__Keyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.__file__Keyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func make__LINE__Keyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.__line__Keyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func make__COLUMN__Keyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.__column__Keyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func make__FUNCTION__Keyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.__function__Keyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func make__DSO_HANDLE__Keyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.__dso_handle__Keyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeWildcardKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.wildcardKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeLeftParenToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.leftParen, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRightParenToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.rightParen, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeLeftBraceToken(
    leadingTrivia: Trivia = .space,
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.leftBrace, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRightBraceToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.rightBrace, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeLeftSquareBracketToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.leftSquareBracket, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRightSquareBracketToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.rightSquareBracket, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeLeftAngleToken(
    leadingTrivia: Trivia = .space,
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.leftAngle, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRightAngleToken(
    leadingTrivia: Trivia = .space,
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.rightAngle, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePeriodToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.period, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePrefixPeriodToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.prefixPeriod, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeCommaToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.comma, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeEllipsisToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.ellipsis, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeColonToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.colon, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSemicolonToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.semicolon, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeEqualToken(
    leadingTrivia: Trivia = .space,
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.equal, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeAtSignToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.atSign, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.pound, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePrefixAmpersandToken(
    leadingTrivia: Trivia = .space,
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.prefixAmpersand, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeArrowToken(
    leadingTrivia: Trivia = .space,
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.arrow, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeBacktickToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.backtick, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeBackslashToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.backslash, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeExclamationMarkToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.exclamationMark, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePostfixQuestionMarkToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.postfixQuestionMark, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeInfixQuestionMarkToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.infixQuestionMark, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStringQuoteToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.stringQuote, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSingleQuoteToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.singleQuote, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeMultilineStringQuoteToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.multilineStringQuote, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundKeyPathKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundKeyPathKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundLineKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundLineKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundSelectorKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundSelectorKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundFileKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundFileKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundFileIDKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundFileIDKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundFilePathKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundFilePathKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundColumnKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundColumnKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundFunctionKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundFunctionKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundDsohandleKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundDsohandleKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundAssertKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundAssertKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundSourceLocationKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundSourceLocationKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundWarningKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundWarningKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundErrorKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundErrorKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundIfKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundIfKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundElseKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundElseKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundElseifKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundElseifKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundEndifKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundEndifKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundAvailableKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundAvailableKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundUnavailableKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundUnavailableKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundFileLiteralKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundFileLiteralKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundImageLiteralKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundImageLiteralKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundColorLiteralKeyword(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.poundColorLiteralKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeIntegerLiteral(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.integerLiteral(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeFloatingLiteral(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.floatingLiteral(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStringLiteral(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.stringLiteral(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRegexLiteral(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.regexLiteral(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeUnknown(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.unknown(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeIdentifier(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.identifier(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeUnspacedBinaryOperator(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.unspacedBinaryOperator(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSpacedBinaryOperator(
    _ text: String,
    leadingTrivia: Trivia = .space,
    trailingTrivia: Trivia = .space
  ) -> TokenSyntax {
    return makeToken(.spacedBinaryOperator(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePostfixOperator(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.postfixOperator(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePrefixOperator(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.prefixOperator(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeDollarIdentifier(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.dollarIdentifier(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeContextualKeyword(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.contextualKeyword(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRawStringDelimiter(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.rawStringDelimiter(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStringSegment(
    _ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.stringSegment(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStringInterpolationAnchorToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.stringInterpolationAnchor, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeYieldToken(
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []
  ) -> TokenSyntax {
    return makeToken(.yield, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }

/// MARK: Convenience APIs

  public static func makeVoidTupleType() -> TupleTypeSyntax {
    return makeTupleType(leftParen: makeLeftParenToken(),
                         elements: makeBlankTupleTypeElementList(),
                         rightParen: makeRightParenToken())
  }

  public static func makeTupleTypeElement(name: TokenSyntax?,
    colon: TokenSyntax?, type: TypeSyntax,
    trailingComma: TokenSyntax?) -> TupleTypeElementSyntax {
    return makeTupleTypeElement(inOut: nil, name: name, secondName: nil,
                                colon: colon, type: type, ellipsis: nil,
                                initializer: nil, trailingComma: trailingComma)
  }

  public static func makeTupleTypeElement(type: TypeSyntax,
    trailingComma: TokenSyntax?) -> TupleTypeElementSyntax  {
    return makeTupleTypeElement(name: nil, colon: nil, 
                                type: type, trailingComma: trailingComma)
  }

  public static func makeGenericParameter(name: TokenSyntax,
      trailingComma: TokenSyntax) -> GenericParameterSyntax {
    return makeGenericParameter(attributes: nil, name: name, colon: nil,
                                inheritedType: nil,
                                trailingComma: trailingComma)
  }

  public static func makeTypeIdentifier(_ name: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TypeSyntax {
    let identifier = makeIdentifier(name, leadingTrivia: leadingTrivia, 
                                    trailingTrivia: trailingTrivia)
    let typeIdentifier = makeSimpleTypeIdentifier(name: identifier,
                                                  genericArgumentClause: nil)
    return TypeSyntax(typeIdentifier)
  }

  public static func makeAnyTypeIdentifier(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TypeSyntax {
    return makeTypeIdentifier("Any", leadingTrivia: leadingTrivia, 
                              trailingTrivia: trailingTrivia)
  }

  public static func makeSelfTypeIdentifier(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TypeSyntax {
    return makeTypeIdentifier("Self", leadingTrivia: leadingTrivia, 
                              trailingTrivia: trailingTrivia)
  }

  public static func makeTypeToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeIdentifier("Type", leadingTrivia: leadingTrivia, 
                          trailingTrivia: trailingTrivia)
  }

  public static func makeProtocolToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeIdentifier("Protocol", leadingTrivia: leadingTrivia,
                          trailingTrivia: trailingTrivia)
  }

  public static func makeBinaryOperator(_ name: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.spacedBinaryOperator(name),
                     presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }

  public static func makeStringLiteralExpr(_ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> StringLiteralExprSyntax {
    let string = makeStringSegment(text)
    let segment = makeStringSegment(content: string)
    let segments = makeStringLiteralSegments([Syntax(segment)])
    let openQuote = makeStringQuoteToken(leadingTrivia: leadingTrivia)
    let closeQuote = makeStringQuoteToken(trailingTrivia: trailingTrivia)
    return makeStringLiteralExpr(openDelimiter: nil,
                                 openQuote: openQuote,
                                 segments: segments,
                                 closeQuote: closeQuote,
                                 closeDelimiter: nil)
  }

  public static func makeVariableExpr(_ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> IdentifierExprSyntax {
    let string = makeIdentifier(text,
      leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
    return makeIdentifierExpr(identifier: string,
                              declNameArguments: nil)
  }
}
