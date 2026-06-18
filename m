Return-Path: <linux-media+bounces-65158-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wEZDMIG9M2qwFgYAu9opvQ
	(envelope-from <linux-media+bounces-65158-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:42:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF8069EF53
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:42:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=DcEL0dBF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65158-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65158-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF366306B7FD
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53243DD864;
	Thu, 18 Jun 2026 09:39:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C53DC4D9;
	Thu, 18 Jun 2026 09:39:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781775547; cv=fail; b=BiwhfwrSqnPSan8MBJUFuCUutVUGBpN6rYtdlEh+9Ep+vX8wDCoUek4Lm7LJ/ySFmavvMclzhjILLss8xvyvSGtfzkSyqsjgZH7x24wpn6os+FLIqNOOlR/wLev9u4+FxmQpMsRp+ZuErMY57vzMxchhgE8tth4DAXjSH7paTLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781775547; c=relaxed/simple;
	bh=IRJvewJz6+TtRcmEYnjlB2WRqqsJnp145ko/PKUvs/A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cBA6++9Cvwmk1uOvECgzK56a3jfTBdyWMLu6DvVKSCfiXeqJ2bEIaT4KtSkz1kUhcY9Y4IW/Sl6XhEzWKnCH2XDEs2Vgi0ooAvb4jzQsnBFT1Hzm6U04MNOKVGRHe8EdYqxoJgYKtYenodERwz75qPd0gorAYdWsAZv7KQqW9jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DcEL0dBF; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjxlHKx7QWTz36GYRECasBBpE62IJG8hgCQLpxvzCgPaRf81MX8x37I9cfc2VOUIpn+tvcTwBlvt7pnNPv0X712kn2CVmEbVahHT6kKW8+Qul/A+e0WGhkpTWyQ/vBsydXEaIqnHHpo/mZQm0fn2qutiWmo0QdqwnfsWdDs8oTma+awpbzyzfSzQpqjHKlPxX6k6TwBQluWyQqGBaBsDXHoWVEOW9TcV+exOVIqZCJuH0UG+LdYbi++NoxONNSsHVBOlmSuVzRFUQBi+9IYnxzPLM6iTaCcQtMYvBywuSU2e0PvhD7FlhhiS/vTf0LFdgKN6de1p2lU5UtOFR/j5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tflgO5LyU3BP/sYiUsNiv2ynalQbgxeGMrh16XTNuRc=;
 b=qikXVKxqL0aL1fANuKHm9CdxZpMb5XEBqOhxJ/qGxJrYwAPtpv6L3+EMb4dY89n7b/mO+zZRMNaum5FxSFuaNrLOTpcfSe04my0YMnKOcpjgSQ9roe+aEwOdhtjQnkKGnJiuvWcXjQd10e3CcM2j2I1MnZKT2JODXQ1KEc/68p9lIP+o+g6EA+oRVsKUQkwNo27DJ2hHfXVBBw0YyRJNrJVg8alKhES6agPDfLmTl5BOMyjrMwdfmhzDQn0gY52yx1VxD7GCyHUH0aKLCosYnsV7V1KcSeSD8OcVy0ieYB+jFfghHnLmeeHyOQ2KLmSksjvHfzM66dAI71EkvtHmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tflgO5LyU3BP/sYiUsNiv2ynalQbgxeGMrh16XTNuRc=;
 b=DcEL0dBFSyIyAEAjhVQQCzGOpLVQioKStVilJXfS4OEibwbHj/OmV6MOUQIj7I/y5dvnTFOn2ZsKqO3BuTV8nedn5R53ul02wPX5fEvee+5yc+YjSBPtCM9cURVbGJ89NaqJjQN6iy3QcZSFQyaX/Qf6eQ4qe/8va6wyNVhOVgQhpbqGfrdp+sWCi7BOFjgc5JSOSFBLLkZ7oVecKDokN+3jiSb7zE5ShVETQo9KLrnLfZcYgJnUmPShuLxPcJYszt5mWd/WH6CEE9DAxGiufQckpoRZt2PnhJIUcgf9mVqazfE9zi/mBtWNArTfspSBfIP9t5bF0rttZl8FM31cUw==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PAWPR04MB9813.eurprd04.prod.outlook.com (2603:10a6:102:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 09:38:56 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 09:38:56 +0000
From: guoniu.zhou@oss.nxp.com
Date: Thu, 18 Jun 2026 17:41:36 +0800
Subject: [PATCH v10 2/4] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-csi_formatter-v10-2-f23830312ba5@oss.nxp.com>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
In-Reply-To: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781775717; l=3690;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=+kZKKYqTooKdpNOrnJLaD+8r7kSixqWMgUbCX1EXQ1g=;
 b=gGOa2J+aUCkFPgvpKesmVhUS4PDNGpmbl3As8yfdMuhIEnnlwM8SpwGLHthvLvHp9dZEp9ys0
 R+ghaVoBg1JDQdKzhTpHLY6W4sBj7keSaBYrMjpA/DirFYadAGyhIRd
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::10) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PAWPR04MB9813:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe6124f-afbd-4b95-edb8-08decd1d6a99
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|19092799006|366016|56012099006|11063799006|22082099003|18002099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
 FeQO4srIuis+93eApFmKvxf3Hjd+w+NXLTrw+wn5NnLhm8mlC2I2Xdz+wPMHoPOTKvm89hlCTlaQGKbc58YX/PWqMPPKdBMOagmJmjzqIZHgoF6e89VLchthgx2kByCI4vivJ+0EjvbT6Sxefbx55UcSE37WCme04CgklFqaSUVnXoZmkUa5JCbbvsrlmE68dCVukrQbBpo6b8NspO6kVgtjtTAwE0Sx6VseUixUoQgGgywRR4QfhlyiAkH8b24Z/Otb4SRNvS/3GOlnsCYFgzy8MB1BsO9Ce61rzqi+oKYAwcsAkWw+MV3ipkOBoK6vJCqz7+7eE0xGa/xB7pUZK/cwwei+Q+Qq+jnt7lY/331cdLtev5aJtqZm2g+69B+GalPzWHGj9qPQEmbNk+v6XgWDdUNxZl3lBJ+uACCSe64qiniS4TYjAhUvjeE10P58WHd7VedI3/Hm4ZHthtUIEvIrfOAvwMBJ+Wn5dHND4547+AIsaRZkA/c8GxQsKPHdePXADIuLxtUPZd/D0hCRcCHXcVjdXw9nhx97Q9rzQ8mHwtG4CKgo5gD4szA62a9+6yxiSIwsTMOjDOBaf8vA7t/HtnYsp+74mqB3feBZ9xpKU8cgT8JWwDi0sUHEy1nDpuLu1dlUYH0pp7ZjixOUNpUs2rN/g7KBzLqO2JhsRZVGXxaWpXbI4yvbA5P37ZVp
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(19092799006)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?amE5MlN5SlVvckJRcTcrSHI4R01mY3ZnZDNMWlN0V1hFMWoycnJzdlRyK0JE?=
 =?utf-8?B?NVExNzNYTDNtVXhiUXVzcEhLNlRHRGlJQnRMb0R5bjg3aTBUTmU2Rk9KZ2tu?=
 =?utf-8?B?WkcveERrc3VxYXRqdUw3NThtU2M4eXNKKzdNOWNzL0V6WFhmOXQ0REpXcXhu?=
 =?utf-8?B?ME85cVp4eThzeXRTQ1VzQm5YYWR6dkZqM29PcktqUnVHUm1iTzJaSVFDazQ5?=
 =?utf-8?B?dm45cDVnV21GZ2lZQ09HUlJZcVRwdlBOSTFzNDFMaFgwb3pwTU1sUlhVdkNa?=
 =?utf-8?B?UmxrWGhDUUMvd0pUZDRVQ0lsd2JUbzJpNGNrSVI5NDRwY1JSdGVnZXRMVEhR?=
 =?utf-8?B?eFF4MGx5cHZlbHl0VFdRdHp2Q3MxbllnWGFqOGNmZUUrdEt1eDQ4Wmd0Mzg0?=
 =?utf-8?B?MWsxT21uUk1tK0YrK1JqUW9jeUM1VTdtWm1jTXErTjRVZDZsd1FIZUEyWnZy?=
 =?utf-8?B?bFhSOXRhT3pCMVFhbUxXWCszVU9UWCtKeHY4QTkwU0tIVitKOG15QmFpb3Js?=
 =?utf-8?B?aHpybDE4U2phcWFGaE9MQkNaTDFhVE9KeUc5dXFMV1I4MDJuVVM3N3B5akFB?=
 =?utf-8?B?ekc3S1BqWjZqOTh1RUVtK2FOVWFXVkh1eTFnbU0xdFJZdkt3ZitHenBSajdV?=
 =?utf-8?B?SDFMT1pyNHQrbjdKZiszYjBXR0ZRZklHeVpGeTg2ZWdpRVRtcmVlTzNsd3or?=
 =?utf-8?B?RXRERitjSXNSWjJjVzlGVlR0d0diVWUxa2lGL2pVU2JWam9uT1JsYXMrWjlw?=
 =?utf-8?B?TlRFdWpvNnVETk53QWVuUVRPTEtFTnRjUllBdDVLeFRtZGhRaDlOSXQwejdu?=
 =?utf-8?B?TjFlWFdacVFGRWs0UVF2QXNVNVhZM3pLaEx5NmJtMHBVbDUzSS91RmV2RUhh?=
 =?utf-8?B?M0hCODdlTlVuWXFvM1poU2cyS3pOUFg2OWVhYmw4Zk1ibys5K09FeUFsTzJ6?=
 =?utf-8?B?bFhBenBSUmhkazF3a2dsYmtmdkFnNVErNGFtdTBsOEwrenpPQUc1SmRKVkNE?=
 =?utf-8?B?ZlRVVTRVSThqWWVPVHhQeC9TUEY4YjcrZDIyQ1F4RHRDR1FCbmlzNEIxNnRC?=
 =?utf-8?B?RG1IWEh6MDR2RWpEV1pJOGxzSXVGcWJhN0ozaVl4VEhCR0k5OXBiUTVEa0Zm?=
 =?utf-8?B?cC9McHhZNjhYblFmL1haRURPTFlQbTlxSFBwVG9WSkpXbitOUVl2MjluaHpH?=
 =?utf-8?B?cnVjQ3B5eDB4cUdnRFdNR2RDQWd6SkZXaEM4K3Uxek5FTnFEcGc3NkIwOGNT?=
 =?utf-8?B?WXV6emxUWXUxLzdOcjY5am9zQUFRTlNENXB3R2lNM1V5N3lOMkdCNVppWFJG?=
 =?utf-8?B?eFh6Vjk4eVNxS25FdGdNQUJ0dGVMMjA5SmttcDNmV2ZpQVUzS1dQSVcybFJO?=
 =?utf-8?B?Tkt4VEVZRXFWVUdzSlAyMVFJbG5kNzhxNGczTjVzbEF0bTRzRUswTzJwYmFa?=
 =?utf-8?B?MzhhaG52RzdXc2dhb1NMeFc0UTMrWWVFbUtIaUtZMTJ5MVFRb1ZwR2ZGMkJw?=
 =?utf-8?B?aEQzd2c2SEhtMEJYVjdMY2NhdzlwdzBseHJPZTlyV25yOVQxWXRVNU9tOUh1?=
 =?utf-8?B?QXRvQkRyVkhSTUZUZzdLVFd1K0Q1dUFQWHBpVWtTS0RyQmp0WEJLWU9ZOUYy?=
 =?utf-8?B?czFkZVIyQi9TMXpSYThoVWw3YVhNZ1RUR1YwM3VMTTY3bjRMMU9VMTZoazE2?=
 =?utf-8?B?eXJtdkZSTXNVbzlrdVlxWllTRzlvL3g0YjJOd3YxZEVxTUhCUjVOR1cvbGhX?=
 =?utf-8?B?dUViOVZjSnpleHJlOTBrR01RbHFDWHY2NE56eTNoM09PNm5UZExPakFxQWJo?=
 =?utf-8?B?MHB3aGE5TFVyQmRQYnRadmtUR2JLZS9WWkUwRUJPQTdFSU1xUk9PcFlYd3Fv?=
 =?utf-8?B?ZDM2NzBoMFZ1d0pzWEpXQlVjSVFUYzg1R210aVliQThZY29qTkl5NGRieWZV?=
 =?utf-8?B?clZwRWIrRUhHTGVuZXJkaWU2azQyUFlYbU5vK0ZxT3FGbDR5ZDJFM242aFlN?=
 =?utf-8?B?NnBOTHNFRVNYWUs3R0dyL2R5SWw5MGNZcEZIekFrVEx2bkpiQkxDKy9DZlpS?=
 =?utf-8?B?aXRVOU9KUnNUaFY1N05lTUdBdTh3aEtiOEdwUEFZdGlBSkFwbzlnclJPOUtD?=
 =?utf-8?B?OHl3RWlhWThiN2tSYTVlcXpFQnhqM2lNdXJuZENtMGpJclZkbHZ1bGhDYkQx?=
 =?utf-8?B?SmJRb0MzZDlSQTRyZEE5MkVORXFNcmozQllieTZPN3ZIdStqeldiV2d2dHpR?=
 =?utf-8?B?Y0VuRE14TUwyMXlHY1NVUUZwQ01nSkZ0UGVhRGFlTlJESDY1S3RiN1lYamd6?=
 =?utf-8?B?T2c0LzA0aFhYZzFiYnZWRDRTY1BKYW1OUTJVSzhGT2RNRzFEdWlGZVMrdkd4?=
 =?utf-8?Q?2MKvMw5Hwg2hQ49j7KS1s4QGzOJ6y2lUaHgHH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe6124f-afbd-4b95-edb8-08decd1d6a99
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 09:38:56.1237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYangC0p2fpE+xWmeFanszvlDqBSzH7MgNYGaUdJ17ECl01mwmBJYj/HvcFBdG1J17ejnmOiLckfkB93UsZbOCYz69Oe4uOnbobrtTaXam029pmgafn6m+Vq3LamHrvs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9813
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65158-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:laurent.pinchart@ideasonboard.com,m:frank.li@nxp.com,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:guoniu.zhou@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,nxp.com:email,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FF8069EF53

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX95 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v10:
- Drop syscon parent node from example
- Drop Reviewed-by tags from Frank and Krzysztof due to binding changes
- Add description for reg property
- Add space after formatter@20 before opening brace in example
- Enhance the port description with more detailed information
- Delete the blank line immediately following the endpoint in example

Changes in v9:
- Use direct node instead of syscon wrapper in example

Changes in v8:
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Add required constraints for port@0 and port@1 in ports node

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
---
 .../bindings/media/fsl,imx95-csi-formatter.yaml    | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
new file mode 100644
index 000000000000..58c4e1cc056b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX95 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
+  and non-pixel data from the CSI-2 host controller and reformat them to
+  match Pixel Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx95-csi-formatter
+
+  reg:
+    maxItems: 1
+    description: Register offset and size within the parent syscon
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port, connects to MIPI CSI-2 receiver output (IDI interface)
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port, connects to ISI input via Pixel Link (PL)
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    formatter@20 {
+        compatible = "fsl,imx95-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1


