Return-Path: <linux-media+bounces-60551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBXBLzgC+2liVQMAu9opvQ
	(envelope-from <linux-media+bounces-60551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:56:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C25854D82C6
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84566303E0C7
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B18D3ECBDC;
	Wed,  6 May 2026 08:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MHthLIoR"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C85C3EB80E;
	Wed,  6 May 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057564; cv=fail; b=K5W+M7jH4i5W5QdHrwbZvSiG/2hYsEPyRBOKFelTbr058wv1I9EVGiRGMQn4L+VdBu0lYrv1+cqgPEIgMbJx/3yoJ1CC7aGvuambHdwvnU8xGHmdZm/nxryqr0acNUf5kGLz8c+w2u2xerJWFxHfghkTNNXQkDGN0Y8N1ahUFVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057564; c=relaxed/simple;
	bh=AE4PaahouWjZreOZZRzcYWdvLx785VlseqsjPZgnaHg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=syIZThgsfoY1OQNI9BkkNCbIDR0CUpEY57zCY0fW1al34JrZD9SzjBxANaAiEL86et6RFi25MU8G70xywUTdWDAmOp2WyQgyIfYE3uPA+VHj4Neca3h/hFjsUYu5j1Vt25pQ9n1IqD8g3JLC310H6/Sa5PMO3Pt6DXqqQrgGDO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MHthLIoR; arc=fail smtp.client-ip=52.101.69.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykATgLE13lI8BYIq4553Pd92ggytTVQRp3si+mr/4QeRG43TFRF0DHt9zSR/hgRifeXIRcZtdSnjGE6gJ1u7ZmdpryQRAS97U84kkAjdP6vh+A2JMX0NSqycqmS/DsMMh35bgnPo0A1Rp/r7kP0Ia/DLKHZX8vMvVIo3bLPUs67yAtQmkXpm2IyYS874YC/0Q3PBjHvtdxCJBYQkJ6+coTQcB0dSzZVrpNj2IVxLELpqSyhMwz/d8aCd8dI2smTp93C9pQi+BpUOh03MTM/DRYQvMUBVENPpFoZWgI8ETvu+cl0FJG4ZTRW78i8VoidslkvMdOPAYByzh+ruDWqhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJcSVohbUkwkgcdcZbXX1y7BWvybsmj0AYa5siIqFds=;
 b=ojhvo6ffVga5oGnl0MFZGJnXtH7AOj5fYVKP87KkJDbJPYuV7uuJSgcGnpbzhPplvT973SwNPghtuPdo1WRUMwqQJGkLHh4pH1f4c+fRBIYE/3cAny7Nf8fHpxTfP2VtxFtKTgog9WUx8C2Jzchjxx/kGnro/qcgFyFNcnw//Feimc1YEHE8/oQO+qDkmbWQpO0nFEaLOyupNrjNao/Uavdg7OiovmfGGyfm6uDV2ESm+he3JzF/B3RrxcvP+rkl3tmYw0Ueo9L1WVAkuuCkM94zPVQ5DqNKucAJZwXAula7B7bO6F3BiA7NalZm00YYQG+XIjtY4nMonTCasNOGkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJcSVohbUkwkgcdcZbXX1y7BWvybsmj0AYa5siIqFds=;
 b=MHthLIoR3WV2ZUWnbMRnsnSPS6a1ISdiEgT6qwnudt88kAHp8+MWpxsb+FBkmpJFH9XOUwblSPE13Ytjnm0erN4M9pKIsQrhXRKdSSqj0rECprkL0l2aBCvlcv6o3QrmOKqNRAago+WvZKJIVtNeCe2g8d+r7FKZg/NwK+pzTkq0BkY7uAVlGBGPcuyxn06JqT19mGM4aXXMc30zMoUBTUR4LBn495UsePf4n1qXsw4clxrIIflb8H650eHjrwGq6xm3PCMt3eVGOTq/XWjHaZdqf3Hzlpd5AuZCPIzjo4L+ghdoZN6fnENaokKzccIjqrNpfhLMUiwRAyPDoixFzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10915.eurprd04.prod.outlook.com (2603:10a6:102:492::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:52:34 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:52:34 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 06 May 2026 16:54:05 +0800
Subject: [PATCH v3 6/7] media: dt-bindings: add NXP i.MX95 compatible
 string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-csi2_imx95-v3-6-953b6e1a80dd@oss.nxp.com>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
In-Reply-To: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057665; l=2223;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=AE4PaahouWjZreOZZRzcYWdvLx785VlseqsjPZgnaHg=;
 b=NbrlYcNhVa1tapavdkOAD0ZwT7fCoavG9XLYRIgubjnes5pS9OVKIRR0nKlcCvgA9g3j9wCOF
 T31eBehb9gqCM6UhPn+KznznsM6GjdAPicQnJ70IBrSTAVvm3ToFenz
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10915:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e6d55a-9b40-45fb-b79d-08deab4cd0e2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 2oDcTaCKLWme7ckhW8g8HmNXLzrRMqgdeaQASpyghhLGbSWnczHrhVeHrmLPekzNild78q5fnAJvHh4W2nMddHYz3ITGFvKL1dcp849Znw2qw+DOYy55a4y+15emRdV/JhfFvozN/z+wkNchC05HcTsw9sEMpYLnfyOKLINSZXvf06pUXwAqd0KsV3FxvfZ7i7ViBoh4U+yA16AApwImgshU7tG+koQSdXvHW5G87QA78R7R7VOg3JJV2SWS3TWCCxNfWqP7wM2X3QrsF89bblxYyFLAQGsNmDdEsslEkGT9XT2ryyvEeVD4rqn9gPCgRbb9XBevJOwNEYrREKR4gwc3Cw17hFNo3IX0KLqA1itnKMTzmAgGGpOEUoBBjLOmhx1lFfXfWuyBLhMuBDDfAAXdnpCr48RyCelqnKXtX2Svou2RgUTJEEWbatS5E8vEDm80ihxTHQ4rNp39GYHLFZ5maQ/YeSCJvM0Pkbk99OvHNe0VS9d9n5hACslpSxdRMr+heYBEis3/1M7VKeJQzsVtrCbhh8DlrRlsRjkkPjfd68NGXIgtB4OTvCdMUkiibKaTzjk55uhNMhgdvFlwW9m9kphPjJC0UiuaJoGIZrEsEWqWnkSApFh8Lw+62k3HiquIXyIhDpbSbu3tKBDBaCmHUGulUNLY1yUGvGLs1zCvV2ssDh4WuU7SzeCDD5FTYlGz6jOscgnsysFw6uen2WqVwBrOOP1ZXSxofRQR7xhuIEwwdZ6k6B4BtThJ+F78lK7OzsW3N+U7+rKHWW3Bog==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?amkrTFZyRkNYd0g2TGprbUpJSHlaNzZZTStvUTJOSktHd0RaSy9GMkQvL2dD?=
 =?utf-8?B?dFRnLzNCeFJhT05tVVp6OElyckszdEFGQ0J2ZHdhNVVKeGc4dDU4eGxub1d1?=
 =?utf-8?B?MWxoN1R5aTVENlU5RDRHY0VWYzJEMnNEWE9JUnhEWndSdzJKMlJvZ2F1NTVm?=
 =?utf-8?B?VjNSa1JMc3VobHRDMU5BdW1UMEZmTVFPV2tjd3RkSDB5TWh0VWtoTnVYWGEx?=
 =?utf-8?B?T2tiYnNPbXdKNUVNZVRtZHd5R3RKRktFdFdNdkZMVmI5MVNoK2ZmZHZBT2JJ?=
 =?utf-8?B?d1lsNnppcVlPbVBKL1ljNzRCSG9RUXg1Y3hCQm84QVV2LzRuRDAwZm40bTRm?=
 =?utf-8?B?VnBNejQwZmhROXRHK3d2OXA4ZmlISlpXSHhXTUhhajQ1c1hNcVNaKzcrc1FZ?=
 =?utf-8?B?VVh5a0xnUkIzaU9zTURFTS9LUitaY1lxSW40UmJMejRKdzh4WlhjQm42NGRs?=
 =?utf-8?B?MWlwdTMzcGRtTldNRTJKcnhaZzFLZE9uT1hwTGJ2azBUZkphQzdUZHB6c01s?=
 =?utf-8?B?dUJUVWI0MjZZRUtUVVpRckpmUjB5NmUrSnJZMnlNd3VOWFdObFkwVWxFSHNV?=
 =?utf-8?B?Z21LeEk5WFdvdFkyMUFBRnUyU3BEUTlGVGVodzRDOHZ6NzJtNzVzcXhBVGVw?=
 =?utf-8?B?dEh5R0hSR1pqbnJWT2JneWpGZUY4UXpvOHdabnVlUzg1RURraGdoOHI2aHRl?=
 =?utf-8?B?dk05ZlliQmNLbkpqK2NCdlVGUFhyNlZiNFZoekdiQ2dQVTZkYThXRy85NUZv?=
 =?utf-8?B?MG83a0dqRFBPU1FjOVZlaVhILzdhVk15MCtpQ0dhOE5FNFAvVFZiQTJvNFlF?=
 =?utf-8?B?ekF1TlFEMDJQbWY3Z2UxaDYzREovNlc3aEYzaFh0SXl5dkREMHdLb3pGc3dh?=
 =?utf-8?B?RWtqck1XNzVIam1XZ2t0NmR5eUU4V2dFNzdLemx0RGljcnJJVDl2Qk82d2tN?=
 =?utf-8?B?TU5RMS9qOFVXVWo4QjBpYWhYcjV2QmtpUnZJWVQzdlQ2QlB2bkxsWlA0VjNy?=
 =?utf-8?B?c0pPb3VQbS9DSndTUHRWNHVnTGk0cTRjYkFqcE5CS3NGaGNmaWJ3TUVpcE9w?=
 =?utf-8?B?Z0xmVU1qNHhOTEZERmlEKytwNk1zaDJtVTNzQytjM1Q1bEJHZlpQcEIvYWtL?=
 =?utf-8?B?WEMzR2l5cVV4VVVpMW9qVmRZUHZUVnhhaXV6RG9UZ25vTmZQSFBtdUFjZkFI?=
 =?utf-8?B?VDhsbVVod05KazF4VHR1R25PNHRjcmVyc1ZhWEVDNkhFSDZkbDZ6bzNSN3ZN?=
 =?utf-8?B?N3Fnc1JYUnBMUFRzdTF4UVRPWkZ3OFFYNWNZSnhIOW11NjJMdDZENll1bGUv?=
 =?utf-8?B?elhCSnJXRFk5NG5LbkU5dkhSM1BzTG1XZUpUQ1BrenhYS2IrT1NuaE54VVJv?=
 =?utf-8?B?bzRKMFptNlFpUVhwMGgrUE15Vk1KbGFTbUgzQVZleXJjdHl0c1JjOGVNb3pV?=
 =?utf-8?B?cnhuY3hjb0piWWJPLzBBNG45SXR1bHdmOGhGN1lSM3dPUGdkRlJubTR5SG0r?=
 =?utf-8?B?ckpFRVZhT1hYam5OT3Bjc1dtbDVLaEh5T2M2UTJhOUx0cU13MHBKZVJFS3NP?=
 =?utf-8?B?WDd0ZWlRRm80UjdPeWhnaEVOVkxXNi9iWlBTYmlXYkVZaXFabGRuRE54R0Fs?=
 =?utf-8?B?NDY0U0x6QnU0OGp1S2htNmhpdi9JWHZ6V3BkbG52bWcyMHAyL1NUTitJY3I4?=
 =?utf-8?B?TU9JdHc0UU9PVitsYmZpb014bFg3L1F2UVdRM0hpdEpFMmFnVWZsOXh0WTV4?=
 =?utf-8?B?UmRLTFdhWUY2anVZejBnN0ZPdFgzeFQ0Skw4ZzY4eE5BOHRjK3B3bllyWThs?=
 =?utf-8?B?SWZvN3cxVnBwc0tDRjF1SnhGZ0hwZE5OT3E1UVJ2cS9aTUxkdlZZVU5pbnBZ?=
 =?utf-8?B?ekc0Y1FuWHhnWmxvK0RHWTRHdk1vL2FadERVbHRqRzJtV0IvY0NPb3Q0Nzc5?=
 =?utf-8?B?QmZ5ZmVCN2htTnFqY1p6R0dWbE8zTTVtdjRWNDNvUFdXZjFNUnU3dUYyNklp?=
 =?utf-8?B?dVVibVVmQURPTWxDbjRielcxVGkzL3BrMUZTQjk3T2FMaEgrNmFNYmk5TXRk?=
 =?utf-8?B?S1c5c2ZZZ0xDZVF2cStkNEhKZmF4TzNDTkJoQWh2OGQ0V1hyekFzODRzUm5X?=
 =?utf-8?B?b0RlTHpScEhSYndUNTEzS3A5eFJ2U2pVczBUV0Y4eEkxaFVqY2lUZzNUVWRV?=
 =?utf-8?B?UHdQUGt5K21MemN4a1hJVWpoRDJUM2R4NVRPWnJHZnMxZUR5cWpMaDFqTmFR?=
 =?utf-8?B?NWFpNkVoQy9oaGxHaWNYSTFxdktTY3UyVmxHU2l6cDkzZzI1MUZ6VlJOd3JS?=
 =?utf-8?B?cnpVODdGSVVic21rbzBqTnlQb053NzBYSE04K0ZzTjQ0SW85QzRqQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e6d55a-9b40-45fb-b79d-08deab4cd0e2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:52:34.5128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4MOWYd4g+W5t+YSEssZZxfrhrzyxvGe2yM912c/NNxD5jPxIT7ajIhYstG4o2gw+d9crgCnlSFbZba5nqWnig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10915
X-Rspamd-Queue-Id: C25854D82C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60551-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid]

The i.MX95 CSI-2 controller is nearly identical to i.MX93, with the
main difference being the data output interface:

i.MX93 use IPI (Image Pixel Interface), which requires:
- Pixel clock input
- Software configuration through registers

i.MX95 uses IDI (Image Data Interface), which:
- Does not require pixel clock
- Is software transparent (no register configuration needed)

Due to these differences in register layout and initialization needs,
the two variants cannot share the same compatible string. The driver
needs to distinguish between them to handle the interface correctly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Add Reviewed-by tag from Krzysztof Kozlowski

Changes in v2:
- Add dedicated constraint block for i.MX95 to reflect different clock
  requirements (only per clock needed vs i.MX93 which needs both per
  and pixel clocks)
- Update commit message to include more details about interface differences
---
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 4ac4a3b6f406..4e0bc75c2136 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - fsl,imx93-mipi-csi2
+      - fsl,imx95-mipi-csi2
       - rockchip,rk3568-mipi-csi2
 
   reg:
@@ -135,6 +136,21 @@ allOf:
         clock-names:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-mipi-csi2
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names: false
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 examples:
   - |
     #include <dt-bindings/clock/rk3568-cru.h>

-- 
2.34.1


