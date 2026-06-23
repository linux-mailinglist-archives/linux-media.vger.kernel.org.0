Return-Path: <linux-media+bounces-65432-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DvSmEmUDOmpD0AcAu9opvQ
	(envelope-from <linux-media+bounces-65432-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 05:54:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F476B3E55
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 05:54:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=wWM+ZVq1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65432-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65432-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 107D23023FBB
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 03:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E0938E8A6;
	Tue, 23 Jun 2026 03:53:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD038D3F6;
	Tue, 23 Jun 2026 03:53:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782186810; cv=fail; b=q86e50+l+EFuKlH7O0eCTmWbl83Z1YYcEJN22Czglkvzrs8N97Mcrj21WbbuIJxRKJVyuXMWJ38MlLTMeVTCvms18gRk+0a/N7FkEKop+HGX18o0s8hb0/+MN/pXuQ3gQyt2wukjBqNRkLQp+nY4bZW7wWGGwvzmTx/syQU5CWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782186810; c=relaxed/simple;
	bh=GurUQJzJvtJT8FF2gPhOa+H7mYaadlr+RdjiABwCVS0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=D0dtHI/lpXjHwXwQ+qXIZhX4KGGEtAFQqmBe0ETPHayjAUDbEPjT/HdtawAIQ26i5UJjywqcweLawuXhK0aul25Bzus+ZsJ2w47OEGhHNYNfLwopm1rhAq3afEV5n1VVnbQW4o8oED5JrfgCE2kfdH4HtBPUc997IXxebTHsDoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wWM+ZVq1; arc=fail smtp.client-ip=40.107.162.66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5oC+TtUjmA2xqyRB4NY3KwmtAamrqgEmkMH8EdGqMWeqMzRky7JNNM6RzFRFYPetfGPmOi/khD30J68dPVxS4QmV8p2BBROv60jMlYl+rfkXW51/RFVZUOm0/AL5g9Wtmgrs7VyA2RvKD91eSxXiBiGd7lGISLSE2ru3Xd9v6H4Fh+IWrdYH9qPI/yLmFmeq4qa/09HMQrb3oolq/XxAec8BHEHyidZPtUO6D4q90f9biFJ02m3BinihLGv/tqlS47GB2q4pKhbx0D2bYl55flR87CaSGfcAXBdXpws1nfy+vs3IgihMm2fjUB31thhnvP1Xt9QueSW2shWjEspyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV5SLMS3H6B6AaR8xKi61QDL+J00STIokT8tvBZpedU=;
 b=VUdjol/iufiO8cn/yEH8ZlzZS1ILjdCqKKxZQi2wgkg7tmqKwDLEPFUOd0FhTxGJKaOi+TO7y2JHSm9KYEMi3HKuBEoLSI1Xm44whE82RNErY6lYlbdrRE7CKFPUQWqN/gzxdwvrOHt6qN1//IgN8g+25FVtmK7J+BMSWBphd8OcB4zlXBGI6wDo1vNuJ4mXGaedoKk/LbMbKIjXzIP8StJUERdpp4u/KM5yMSoK/wBpNjQKRhN31eaTfLZN3DkoPAp9aTxjcg2uHaF9i+bRREiCZoOjfAYtbRSRqClIzDzIe42cbnzbY4wBCAtESXDbNhOttsz6p4UF1tIx5Ljj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV5SLMS3H6B6AaR8xKi61QDL+J00STIokT8tvBZpedU=;
 b=wWM+ZVq16UsVcAFGQ75LERlcREsklbj736WXctRowye1nV0hFJboRokGpANoKX0bZoHIEsnLn5tfz4+rRjqLbb6NLVi4X2YTXIfltUY+NyUfS96RHdE1c6f5cGX8gxEDvoP8eig3TKm4LC2MA/oncCRm4PACUTQk0TLkXPJFwcn0/hEHEfhtbLotE2b6p2txKYa1dbAJ67AKcNIblIP1XczMuz8yupIwPobsMz6Z8RboruXQasqYUo/d+pfNvRr4OxK1fyEETyFGtYEQyahGFllFbUzf4BoiEkpbdCYeiMp2RAf6nrUyCfVI4mipThdSqImZA/06wkgOtIHIeGwxCg==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by GV2PR04MB12270.eurprd04.prod.outlook.com (2603:10a6:150:321::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 03:53:24 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 03:53:24 +0000
From: guoniu.zhou@oss.nxp.com
Date: Tue, 23 Jun 2026 11:56:31 +0800
Subject: [PATCH v11 1/3] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-csi_formatter-v11-1-a792fe9c1502@oss.nxp.com>
References: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
In-Reply-To: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
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
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782186996; l=3877;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=/Ko4SnCdgWFQqzXj40GCNla/+xzXD7beCnJKpA2ezSA=;
 b=bu6M8KfYs0et03u1e7Qus/iXacBNPu4LY8fqCxpcE0kInVkicSYiJH3HBBknFOjawIeFNSDw7
 UtUHuRaPwC8A3qTMKTkmJRLe83Hx3mg0YpDgsZtOTWQIDJht33iL1/2
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0313.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::17) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|GV2PR04MB12270:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad9199e-e583-4994-4f1b-08ded0daf9a0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|19092799006|18002099003|22082099003|56012099006|11063799006|921020|3023799007;
X-Microsoft-Antispam-Message-Info:
 I+1KgwmdFhP6X5dkGl3N6NgEaDPSpIOXtI5ywhJHRJj6tzzGM2MI+qwK4vaYE6h22g6eMrqT7vcMECpY6JefFK4EYGff/dhZPSAvIm4+45/GcRh9U29/qhZb8mVkeUyPxbmWHQjE7aiV9JKzzy5LZD+gHQCEi21YX1AXlovQEdRBxV6FnySmrpuaP5XAmpPRnCo1T/lf/zLg6ZNF5gN1oZmb+DMDvMlCWOFgCAH9jbf7E9cdoqU9D2FSs5m0DRsk+cr1aBPxBVAKDV8PwoRFDuhrbaqrv/VZZADcK7S8HDbMUPPRV/Jgm8Opjvm/OaC0L/mcV1n5oC5S9zqIuFHsqJJYZHshBPsOB9pM0NRR546KliZ92AI65Ps4Jed7xsrzBeB48ArLbMm6kqV09ojGA/7OecYYT9Y5TtkPKTZPCNDdsCrC3qW/ddIn/KBt9jjMzeoRR93sZPj4qv9uKj/rG4YS9KZ75akNHHrRR2ZvuI6Jw6oHtXZw8F2li39QSjbKp4F022WN8oo0Cvsd1ZNNYiBjfOeotyEfWA2CmK/FADTlgfx0s70TXABTCKjnn6KLOARpY7bisiXI3Ch8IJ8o7O3tS+aBOE/YcZ9xXUq2g3URAWrHejKQXgNKETQNx3e0wtQlLDDARDnWMElDb2ovVrQnvAbwbwiCszexME6gJY0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(11063799006)(921020)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?T25xMVMvUENncVRKWGdhbDJsekFNcnB0QlVVWjZ1bWNVcksrekQ1cnFnMm1o?=
 =?utf-8?B?dzJ0L21jMEwxQkYyWG5HdDVYU3FHOVpYOUpGVHF5ZXp5ZmFtMDBIMkVraE5t?=
 =?utf-8?B?UEppaCtFcnpKN1FyazVSTzU3S2ZPdGF4ZXhiRHFzZWtOYmNNdS93TnlxUiti?=
 =?utf-8?B?WlR2WTh1T0JBQnhxRzViUFdlT3ZQTHg0d1pvY2gyNFFSNkJsMkRWM3F0ZEZP?=
 =?utf-8?B?K2xWaXplOTZoQTZkMkZvS0trak9nNGsxcmF1YkZXc2JRblZjZllYZHlMaVYz?=
 =?utf-8?B?V0ZDVC9IWm90R0NYOURwcjh3RytaMktmcXRWeTVnVEs3aVdBbGZBaWZWTlNj?=
 =?utf-8?B?aW1lY2pOWTgvL2Y0Q1gxSS9JbHZQUUxhdXhDZkFqdk56dHFGdEpoNjVuUFlu?=
 =?utf-8?B?cmVvS3MwNkFCNWJsTnFBY0NOcUpoM3VEc1hvNElMQUtScTFXSlQyaTZuTnpJ?=
 =?utf-8?B?RWQ4U0s2aFJ3KytTVDBJTTBQdHdCbVhCN1kwZ3BoTnd0V0ZiakZmSXlTMmQ0?=
 =?utf-8?B?TmlGZk5qQTkzcnJvYzl1N3BQbHJpanpwME1iUXJSWkREMWVwYkcxbTJEcFNJ?=
 =?utf-8?B?N0xQMXB0WWdjaXBDdjRPQ0pxRGNkbVZrcW90N2dxRHBzb2lxckxmWHhoUkJZ?=
 =?utf-8?B?d3ZGVVVLR29qS2xwa0RoMmZYNzlScy94bWJxNFQ4akhTMHpqNDg1NllQb2F1?=
 =?utf-8?B?K3VieVdrSUF5MFVPZFp0YjFnTXZZaFoxTC9DLzlhd0w5RmR6YUxaNkVEOEt0?=
 =?utf-8?B?U3dWSWxIT3NpVVo5WXcydk9yS1gybzd6bDNRckF2TkRvZHd1Ykc2QXQvZVoz?=
 =?utf-8?B?YzN3ejVxNVgzSTIzMWRoamhWRFFLSkxDaE12THJvcjVzbGZtbGhVZi9MZnlv?=
 =?utf-8?B?UmFqN2J2WW0vQ2g0SDFpUmYweE4rQTExWTdvc0tOcXJrTTByZExXR0E2WG56?=
 =?utf-8?B?blJLUlpPN3hyNU9ZRHNtU0Z6MGxBODg3TEs1RHBnY3d4dFJDazhMNEJmS0NY?=
 =?utf-8?B?a0k1L0drSDl1ekdMZkFVeTBmcW85ZU1FSDd4ckRQMTJDWVY4ZnY1amEzdHJn?=
 =?utf-8?B?NWUvUk9SQW1KTUZibFBzdXU4OVIvQkcyNUVPU2hHYjhJTDlIanBGTUxFeW9D?=
 =?utf-8?B?VDlZRVNqNzNMMlV3YXhJcVBXMG0vdjkxTERKQ3JvTXVFbUsxTDNUdWhyeGl4?=
 =?utf-8?B?UzIvWjhvT0R0TmFFUlFWZUQ5UHhOaHRZTUlvbTZxallRb1BVRyttRW9RZ2ho?=
 =?utf-8?B?RGlKTGtMR3MwcHBjcXUxRmQzQUlsMmdlMVdtTDVVL2xqTkNiaWVWRklqSlRm?=
 =?utf-8?B?Zk9MdnJhZy9ld0o1NGl1OW0xN0FyRm90dWJvTUsxOGQ1ZzdCcE5vNTFqblJC?=
 =?utf-8?B?aVdYTEYyY1k2dm1KYnZrRUdTNDg2Uy92ekhjaE5NSHFkRlR4Wk9rSGg4d1Zk?=
 =?utf-8?B?K1VZSG51RzNsN0VsWVFSSmFGbUFwYjdHQVhWQ3JabHFneHdzRkkyUkRzZWp0?=
 =?utf-8?B?WUhlRmgvVFdsM1hITXAwZW9LbkpuSUxRUnJad3doa29JemFybmpmNTE1K0U2?=
 =?utf-8?B?UGZHM3BlMnBLNHR4dUU0QzZzRkZSTko0SWg1ZEMyaWg1Q3lBaGg4b083UDVN?=
 =?utf-8?B?K1ZGSWRYNHVJNDNydEY4RmMzN0U4R0dEMCtWQVRmdFZhUUJnSEFzVHFDMXQx?=
 =?utf-8?B?aFRQVnhFYnN6c3gvNytSTk16WkFWZHRJZVJ4L1lNL1E2Q3FKcEhJaGJzSG5y?=
 =?utf-8?B?cTFIaWNqQWNGMlRUWDNHSlVpNEwxcnhiU1BLd1ZzZE5GcnU5V2Rsais5M0gv?=
 =?utf-8?B?cTFjbjBXRWtveGZkeWNXZ0VNeE1OaEwvUG8zcEZ2aUpJUGNYMFVsamtBS09j?=
 =?utf-8?B?ZHo2Mmt3dTdYYnk5dU5QTWdiTmlLTFVMaGVLZ1hMVCsrVWQ0Y3JlTGJwZjZP?=
 =?utf-8?B?N3pCcnBwdkZCRDVuQktSOURCZk9aNnRUNHhsY1VEYm9yakduKy9TT09DMFZU?=
 =?utf-8?B?NTROcDhOV2RrdC9Fc3FqOFBqQ2ZSQ3NxS0x3M0F6RjhnL0Z1ZDFqb2xTdE9i?=
 =?utf-8?B?OE0rTUp6QnozaHBKRklIOW5ycS84TzJNb2ViQ1dDWkFWSnZDWFg4RWVMWFgw?=
 =?utf-8?B?ak5TM1NtdjJIRXUyUmJwQ0JDK0dBdTVzdjdUZXNSTGx5anNIbUFBdklmU1Bz?=
 =?utf-8?B?RHJIbXBKdkRjaUQ3SlByYnBDOVZoamNVbkVhTGVSd1Y2SzlEaWtqaHlvaGhs?=
 =?utf-8?B?SDZkVE00V1N3dWJEeUM1WFZWeSs5NDBJNDNZM3N0cGU2dW1GN2lGMUV2b2JQ?=
 =?utf-8?B?b0dHUTFHMUo3OHRaT3YyY2ZDOGduU3BHaHhnTVRBdGkzU25OWXZCUDBjMW90?=
 =?utf-8?Q?HLs0lI8v4ZROb15+MeVbIyMPyVlnnRt0uI9Y4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad9199e-e583-4994-4f1b-08ded0daf9a0
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 03:53:24.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRlbcWgElMHLUDR2GfYYvPTqM19qyhuiXKgUaJ2kXGLXyHymh0vnorbRQOPLdMVJ0OlUWc8hke04waNGEGxCypIMKC/lypwYd35K0dwX+hiiDrA7R9wnQqjLG7BZ9qFZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12270
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65432-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:laurent.pinchart@ideasonboard.com,m:frank.li@nxp.com,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,vger.kernel.org:from_smtp,qualcomm.com:email,NXP1.onmicrosoft.com:dkim,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8F476B3E55

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX95 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v11:
- Add Rb tags from Frank Li and Krzysztof Kozlowski

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


