Return-Path: <linux-media+bounces-26352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93037A3BB80
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98A7F7A67D3
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289721E8329;
	Wed, 19 Feb 2025 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="taXOEF1w"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11022091.outbound.protection.outlook.com [52.101.66.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952041DE4C9;
	Wed, 19 Feb 2025 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960222; cv=fail; b=foehNfsj2JLChpY/mAuSv1z8DRPiSltUXivr6d5hCQoqLNLLxo8PjwVEa0VrvlZRmFplcj5/fI6hjUJgiqIjUOyYl/4tzWWKms9CHMnpuTRc6XZISrGp7JmzkOhY52gUZUzaydyRw01B8mbppzL62+cZ47XVez3OEuzwTamCWV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960222; c=relaxed/simple;
	bh=JMzBYOKMxZG1zypK2Xw9X9mgiNJ0ITgNFxK18RCULX4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rU3yS43s9EA8C72/JXkCJ3kx7gSPKqsZSF6Iu8REiMHHd/ZZL+djCVQFc19G2w3MkqYfYWMlscChSOgEzAnU1+eZ+V9Oq9eC6qPQ2WL1T3D5XfMUAXCxP8FTMBuzrz6NNXTQKC8gnxBaHS4EQq3FwAlZFmS8bUCxadVA3JJyQgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=taXOEF1w; arc=fail smtp.client-ip=52.101.66.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9ZJ0ullV1uoHTYMrpbyd0tsYWdPZ2W2Yfz2ZIlt34tEGy+W7XO8IBaow3zQFNFBK3DDgC2/QnxUD3fLCiba3nyhAFVCu8Gg1mgY16ASUOL0JvcC1whCrSO52f8fBOXoUr2k5o95FnxyEtOMFzvonguRMmrfZoya2cMW74Gq0WjJ1S8F4XHw5rM1BgxKxLSNWgg7d77OGsuu7YG74d5+n6DmSDdt6On/WlCo5vGwTuhQludkC06VmubTX00+sGwgv7bpw93R/w68WRdQDsj6ugWJqNBIVfJcNNXL6p1QQ6xT/6GphkLMMxtYfF9MUcMTMHC5TYxhk3PLgszu0+9G9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GADnoYshuvKf8MjgcGBM075hZ+scoIrwJ3loAJXtSZE=;
 b=OWjGUSodPZB4Q+ZQ1ezeGXZn9d4VzKHX2xuXECgfHQNd4EHXAE7gBs95/gMCEOwqRafSOz/O97jFhPuKOddU+NO+vB/tlF+cXB0TBlI7ZCRfls9uBPUEwArdAGf8xCCeIl+YyJnMR28oAFazXqTRvOVCa0iy3fCA2h/KOuvNQog1nGH/1Gquzf6NSfsBaqt0gJQBy/vCyUccXA1U1UaKowrHmlnpnXM65XMSn4SylMZX2n/eYUskfYliX9ENEY3V4zS2bg+GwCG75eui40QNZ41oFDW0iCTYXZHUgpLq/wxLYJ/hrAkvDjwUcXBbHzi2qdfzEi4HaKzxDmLupj8j6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GADnoYshuvKf8MjgcGBM075hZ+scoIrwJ3loAJXtSZE=;
 b=taXOEF1w6KkdSQbt2FcEssv9S8CCLrqERlphNFHU6wgOoYufuKzdoSZzuuz7ENipFCb3U8QZbU/MNY0pqnTBlWgvrtzOYrXPkoL8BOXDJZsWONS3PQGH207E9+hQYWQSPJJ8Hwil3acllQq/XvaIqMQx6iDcfVruVTL9sIPCsOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB8384.eurprd08.prod.outlook.com (2603:10a6:20b:55b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 10:16:58 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 10:16:58 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 19 Feb 2025 11:16:42 +0100
Subject: [PATCH v4 11/11] arm64: dts: rockchip: enable vicap dvp on
 wolfvision pf5 io expander
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-v6-8-topic-rk3568-vicap-v4-11-e906600ae3b0@wolfvision.net>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739960197; l=1481;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=JMzBYOKMxZG1zypK2Xw9X9mgiNJ0ITgNFxK18RCULX4=;
 b=7WnAg+eHZ+LFC89UteTBJwUT95F7FgBKiuqPvM8Jyzwl45VtH9Ld2S/g9ueLoJImIKTqgCVpY
 Poe7qkKeeK0CKHy5+h1tzIZ4flJ1gwnU5fuGe+RU7hCDiR2MwRC+dj2
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::8) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a1d692-a5ae-4b3c-7128-08dd50ce8ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkVoejlTRDhpUS9ML29FR2ROdU10R0FkbDloelhibXJKQnA0WVRzRVBlNWNw?=
 =?utf-8?B?Y2JGcWgycjJvcmdPUTdpcWpaYVhqQitPZVFJL0NWVTJwdWsrdm03ZVA3QVBp?=
 =?utf-8?B?Q3dGS1hRRnFNMEZFbkpnUjFUVlBabGZPb0h2ZllMWDRiZFZNUy9DeSttZlhQ?=
 =?utf-8?B?dEI3dVdYNVpzMmFSSUpaQVJzWHZaNnFPQ3ZvYnBNdi95VVdMSVpQMWlzLzR2?=
 =?utf-8?B?S0tmQ2ZKYXE0VkFqb0VBNmxvUjc3NzIwQk85U3pGNVVyYUhvQStybnZvWCtp?=
 =?utf-8?B?TldSNGc3OXVUcXorSmxNcUY0aUlsU2FhMU56UWFieWNPMHhKalpYaDNrUFdq?=
 =?utf-8?B?QzhhYmxQSkY2SitrdXE1Mit6SnU2d2FJTmljWE9Ncjl6cG1mZklBRythMExn?=
 =?utf-8?B?L2Y3UVNJMDRIOFBCZmg1NUYwSGd5L29YWGxXQVB4YVRQYVR3Z2UrQVNFS0Y3?=
 =?utf-8?B?YTlDa1ZXaExLM3czK3poa2xjaWdNM1p3bloraGdqT0tiaHVaamd0Z2N5dERO?=
 =?utf-8?B?dHM3elRqK054K2tIK05aUnVYYkF4U1I2TkgrYjd0WW1OYWd6aDk3OHlNNkdu?=
 =?utf-8?B?Y3VqalJFaXA3RGZDS0c5V2R3TkNZaHAwRDUvYXNRME4raEtqTFdsSG9uNkFK?=
 =?utf-8?B?ZldtZHFXR3hIVnM0KzNheFVrTnhIQmJFekY2QzIvMW1JL1lrTDlOVHNLTHRh?=
 =?utf-8?B?am5PU2FjaXArbTkraWV3Qk5rNDdrdlR3bW1JQU1QOWpMbTZYMGJwTEJ1QXll?=
 =?utf-8?B?dnJmRGcvNTFtM1RmaExTeXppQmJDWVdUYjg3aTcxNklaRThmRmVvWmozRkp6?=
 =?utf-8?B?UmV0Rk9LZktlendCVlFFYUcrVDFPcjdNYzVjUnExSmRyTVRQVmJ1UUZXRm9G?=
 =?utf-8?B?VWZtemZoOWJsamU0R2F1dkVBeURLUjI0aXR2ZG9XUEtqb2psZHJESGRKaUJD?=
 =?utf-8?B?dUUwelpKRm56dnBnS2pWUzdicmtOcWxOVWl5TXhpWjZhYjlZcVVWVUhRd1Fq?=
 =?utf-8?B?Uit6TTg3a3NzUko0cUZBc2NRUHJ3VDVLYTdxOHJsa2NLbk51NldHRkk3Nms5?=
 =?utf-8?B?ZWFhTTQxdDRvRytMY3hTR3pONmpRbEwrRkcxajdiT0dOSEdrclNnNmRVbUVO?=
 =?utf-8?B?dnBDWUZURzRvenNudjdEZkN5UjQxMENxNndNTGtKVWFrT1VzSFFyOVlGUzBs?=
 =?utf-8?B?YlluOFNQUzZKaFIzbkNIYXRGSmxvMStjUXFKUjBodXMzNUc3cEhBT1hzRlJE?=
 =?utf-8?B?bTNCVmd3S3lJbmhtS1luSHFxTnJwNzhnalF6cy90Vno2NHlSeXVkU2F6MXdu?=
 =?utf-8?B?UjhwVUVvREZDMjU3M1BjOCttWWhBZEpuNUhuUlB6WG9sYURKWVJzQXFyMnZt?=
 =?utf-8?B?NUlYcnk1MEpiRWFVK3h2Yll1WW9PUFVVRHdCWHAxV05vYmozSTdJNTIyU0Nm?=
 =?utf-8?B?NHFyeXA2YVRZRnVzYlFxN2ZlSzBrbS9kbk9aVGwxb1p0dFhEZjVjZ1NJaGd1?=
 =?utf-8?B?ajRFSHJ0aFNXeElrMnBQdTd0cDBnaFNHSnQzd3FDM01PdlRVUXQ0N3NXeWdI?=
 =?utf-8?B?c1VkVjVTQkFtUVdwYUpSdVhWbExEbUM4RVVOUXEyQmlMWXVFK0JQcUJhU1RV?=
 =?utf-8?B?NFE4eTBwL29mR0h1WGk1TWtCZEdmajFyczRBamhnMlJTaUhKZU9oMFFRczhH?=
 =?utf-8?B?N0Z5NU1zbFNETVlWdHQwTGJvWEFBUzdmcm9SdnFEWFM1aWZUaVZwcjV5bU1w?=
 =?utf-8?B?blFMTmFsUUxFaS8vdjhiVHEvRkU1V2lxTzJEWXcydUhRY01BZ2NzYjJMWHQw?=
 =?utf-8?B?dW5ESlMwL25vN1NSdGMzSWhFZVQ2SllpWVBHdk5VclNwQzB6UnBZbnE1WmtF?=
 =?utf-8?B?dzR2bll1aHlBNjVmYVQwVnhKNGhKY21vb3Z5akxXaTVBSEJQd09EUHVKM2lB?=
 =?utf-8?B?YTc4dWVzdkdpYkNRYzh1TG9FWjdFdm5JOWM4L0JtWTVEUUhhVnlJRFc2WjM3?=
 =?utf-8?B?S0g3c3lVSkF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFowbDBadzFJc1VGMVJ1OFFoMjZHZkE0TjNBSzY5TGJDbmVac1dySStGWXJ6?=
 =?utf-8?B?WjZpclYyZmFNeDdxeTJIYWVwL3g4QW13WkZZalM0bDczRWNBTDFTZlRsbmlZ?=
 =?utf-8?B?NUtIYWFOdCtmdktoVzd1NjJyNTNPUU01U1NUbTBGbHRHZ25LY1VPaWJ3aTNM?=
 =?utf-8?B?aXVZc25LR3ZIa1Z0ellXRkttNUNxbFRmMmpiODBrckY0R2kvb1BaNG1lZTFP?=
 =?utf-8?B?QnM5TTUyS2Zjc0xhRlVkeU5WWWVuM2lhTHNqZnRudEI3Z0JmTmVTSjVSck8x?=
 =?utf-8?B?YmZPVVZsbVFCRlNRQW96S2ZoN0Y3UnJwUnZsWFUyUkU4QjUxV0tza1k2RHdN?=
 =?utf-8?B?UlIrVGZpazZaR0phbTRDT0VYWlEyNUZUbjBQQzVoNkRUbmpxTlllNzlHdFFp?=
 =?utf-8?B?Zm1QWkoxOHZjOWRYWmsvejZIV2pETWg3WDA5K29NWnpHeWlMSUQxZStxd0d4?=
 =?utf-8?B?QXBXa0NYbmpyNkt2VFYyUkVKV05ETzRGT0lpdHhPWU1qNUR4eHc3RWNzSkVD?=
 =?utf-8?B?RHhNUDVZNFpHQ0lpZGpEVHBWcUdQa0YvNCtBSjk4ZTBtd3BHY0tWUUxDektp?=
 =?utf-8?B?WCtwUUlranVrZ2R5S1BtdDByNjlYNFJQZkYyMEU0a2Z2amxUc1B6UnRuT0xF?=
 =?utf-8?B?bzU3RFdMTlRueDl4TGg3SXlseU5ROTJzVmd6bUUrQ3oraUcxd241b2swTTMv?=
 =?utf-8?B?ZElUdnByU3UwVEdmWkM1YXE0eThaT0tYUDljT09vNUNFOGduamY4VU5BQlk2?=
 =?utf-8?B?Y0tJMU56c0U4Sm5ySEUyK3VNd0pGcmFSMS9ralpiOFFRRFROK2o5TlFrdmVO?=
 =?utf-8?B?bFVBR0h5eVdiOThNOGlDZFI1ZFNSUm8yeCtGT29vMk5IM0xZNVg4YXhqb2RT?=
 =?utf-8?B?MzJXK1BORDM4eE5ILzY5enJ0OGo1VDRWQnRQclM2djNPa2RDZTRVSThRYVB0?=
 =?utf-8?B?YmpSVVhZZlZXb01Mb2s0OWFXczk0cEQwVGNPOEVQenFuUWxubkw2MDhjeWcw?=
 =?utf-8?B?ckNKNUpDR0xaKysyNjF2V1J0Y3JWYUVXbGFRdTREQVB4eUtSVEV6UHhYR0E3?=
 =?utf-8?B?M2pUSHU5M3FKQVd4cEtZZXd5RDErVXNBZDhzNlF6TG84M0tBTTNhZ1ZhbWl3?=
 =?utf-8?B?eG9qNjN3QUpUL1pZSUsvWHRsZlNHcXBaaW8wMDRDMXNQZEk4cW9yR0h6K00y?=
 =?utf-8?B?TURSc0ZZY2oyaVF4SjlhTUNpeXBzOUFGNFJWTTA0bDl1YlNVYTl5MkxpQmtl?=
 =?utf-8?B?cWcwV3UxQ1IwNEV1R1g3cHQxWGZaN0NJMm1WRkt2WlFjSlB0aDFwTUdJL2F3?=
 =?utf-8?B?dDBTbzZTcnppMnRkeFFoY3liSlFCZEdTSjREdmFwNmpnS1JpdlZyQUNDQ21B?=
 =?utf-8?B?dHlIcUNhWElnSmJiNWNKMVVGZ2xHeG9tbmRwOFRtNTZpejRLcDRSenREeS9y?=
 =?utf-8?B?MWQ3Z3l6YVBta0lNTjh3dGpnMzFCK3pjWTlQVW11VEpLWUlBTkVmRFBTV2t0?=
 =?utf-8?B?amhGTDg2YWtBODJVcSswUFdCdDRlVE9vK2VDSzIrVGtYWEptNzdjWlFkdXdy?=
 =?utf-8?B?NzJXUjErZFNwUnBLVVBWajk0RUJyMDIrcDltT0RONlpNcjFJY1cvVWJhNVlQ?=
 =?utf-8?B?R2JFM2Z0Mm9VQXhtd1VITEFaL1h3ZjU5dDJBcXIvU2NaZE12UTNtVVZ6cVY5?=
 =?utf-8?B?KysvSFhMVXZlN21XeC9JQ2thN2pyL2JuNWRIcXRtWEQ0Ny8vRHFHN3QvdE9L?=
 =?utf-8?B?K1A1VnBldXkzQTdrVkt3V0JCVmpCOVVEZ1lDcTdvd2N3MldtTWFTSENWVHpV?=
 =?utf-8?B?R1NHaURhQ2JRbkpzcHMyWnNLM3VzS1J3UU1RTzVtNWhEZFpsRTBuUzlEdmNV?=
 =?utf-8?B?VDB1QjVGak1GNzhEbHAza0ZKODRCQnNwbG5uRWRmNU9oSG9XZFJjQ2s1eVVw?=
 =?utf-8?B?VXRLS2RuczRlQUFwRVFybUlGb3JnNCtTRjJHbkNXL1BRYi8vSm9ZOEtTMFE4?=
 =?utf-8?B?SXp5N01jbkpOemE0WFVNdzI2N2lmelBtZ2dwSVczL0dsRkdQYVFhQXYwL284?=
 =?utf-8?B?WWxLOEw3NlE5TmZuZEVJK1hab2xCYUpwSmZUcW1QbE1vSFBZQWNWVkhOaXJU?=
 =?utf-8?B?b0dLZVBrTURhZ0NMK0pvK0lPbmZXSFp2dy9Hb3NvdFpIdFp0amthanY3ZCtw?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a1d692-a5ae-4b3c-7128-08dd50ce8ae6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 10:16:58.1973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAkq7sbLU1JG0jM0JYpKIj30b+S4CuhBkYxUllDxqh6nK3KQXhtFI7FEUNt06v++q1HFhVfaKOY+tvadNsTiYeZycy9A78bZvbcLEUiRHuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8384

The Digital Video Port (DVP, the 16-bit variant) of the RK3568 VICAP
is broken out to the PF5 mainboard expansion header.
Enable it in the device tree overlay for the WolfVision PF5 IO
Expander board.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../rockchip/rk3568-wolfvision-pf5-io-expander.dtso  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
index 048933de2943..411b06b534f8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/rk3568-cru.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -134,3 +135,22 @@ &usb2phy0_host {
 	phy-supply = <&usb_host_vbus>;
 	status = "okay";
 };
+
+&vicap {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cif_clk &cif_dvp_clk &cif_dvp_bus16>;
+	rockchip,cif-clk-delaynum = <10>;
+	status = "okay";
+};
+
+&vicap_dvp {
+	vicap_dvp_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_BT656>;
+		bus-width = <16>;
+		pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
+	};
+};
+
+&vicap_mmu {
+	status = "okay";
+};

-- 
2.34.1


