Return-Path: <linux-media+bounces-62767-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJzBAoBiFWpbUwcAu9opvQ
	(envelope-from <linux-media+bounces-62767-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:06:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 546395D2F31
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BE7F3064730
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F7F3CFF45;
	Tue, 26 May 2026 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KNTm4WIk"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2063CF027;
	Tue, 26 May 2026 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785704; cv=fail; b=Flk83Uqbv5kO7zSHpEiY+ObUIFqhJSxxTf4heHGbU0mCGlXwXr9XXVwK66LJvytJcEvWTUvSgtzjz5AoMsdTpR6RdBOeXmq8gj35088knRPjlQOL/JKw9VLMSdUPO9Oy8hjgRJ9kF+atdAjqi7Wi2OjwWQNfgL/mb3wVuyZ/Ivg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785704; c=relaxed/simple;
	bh=gSf0de9tAE8LLXaiPdFb8Ptw7kobdISzIHVWxBZrIJE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DWI5Lq+TPrpxYTfTOtVl+7jFghWms7XtHPZIoZUdHNbMu6XhJ4shgRSkNvV5B5A6PvwBYiE9OwHjrsffqzDntXGwEfz0BdbUfhN7zlEmjagWGkBFVnNNBQAWV+gy+iR6jMDpf6Pv32o5HwEqswjfAkelypHqY2ssOlG/FiUwhzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KNTm4WIk; arc=fail smtp.client-ip=52.101.65.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFR/JqczTLpSW028j8A92WOpBF9YXAOMKu+gdI5cmSNymJr50HBIXTZgb/S7F8nz8arb0rsC7N48KmJlSPpAmUxHkThJHR+lF66L7WsXIpEtrGO5TCRkv/txcC57rUvxt3Gvv8kuKz7RWpbaOTh0WeGrIFooQ0OmaRD3wb5r9ZMoUsgFqN97MhPGgBnUgHeGrldoP8r+n0t8+DR6qdiqIArBmiGga3KarvOX/GBzvSFPSNiA/5zr8cxwrcLnEIwtZISIBaQ3+Ptjo8xO5ijYCgyVZ8ACypnldTJIlW5hNO6hLY00U/HeKU6fJpW22Bw0JlSP7d4W5erkYSAjaJA6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZlt8KkRcGv/aaRgP27TgYwsTdg9xMXlPg0N0EUk0PU=;
 b=OYHV+/+c4Ul7/Vat7LLVsjCNnjbyJbcUmvg+pXYsBtrupd4tYvvYGEpeCjgw7Ujr3a1lT1I4QkREAGKJwdAtD+Gj0Hs3nw7813R0Wi1pNPVk5nqYdg/jalwYp2hH8XLSWExPVB++8y+XxSQmxH/oCg6ML9YYYtI4k5g5fYqq0FVCyPwlj/8b/eg2Xa4RPfPq5qhbM6CNcX7wvDlzC/EabMOxSovTHG9fEr7VhmYaGXdmAY6kSsJnQDMAOW3rNW87N1B3jqH7qy4jrCWdb/+22KGwFBcYS8osENXymw0Nfbz5T0E0ZAyo78YjtMmRp/wOWauDbxB2dMuobHD7jtSSfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZlt8KkRcGv/aaRgP27TgYwsTdg9xMXlPg0N0EUk0PU=;
 b=KNTm4WIkajojung3SSyl8AsYdJYH/xDUoI6Mw15bPVw7VFTSsryEA4XSEtFSe1TvE+YcwZbK4d1aB0ECjgOlrmsxkpplJU0CMDjZOW2dLz/xqYTfgzOWc/rzl39QXbYfpdpbCOZidYjDO/ODarf3Mz2Vooc3NRXtV595m4EYLMU0wdA9/c6grz7nI63FnCRIRyB6QXg6ev55ep8skSutx5gDalVVqnLWwoeuX5wcD9RIuKrjvUQT/0q3SURn04suxB9yQc2/OaAtfEqLubNsXWmB2OHn5ttozB/4x3cW3am8RDTcSXWullr8PxTPNSwx1zHokQBPufTyfbgXixOULA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA2PR04MB10446.eurprd04.prod.outlook.com (2603:10a6:102:415::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 08:55:00 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 08:55:00 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 26 May 2026 16:57:21 +0800
Subject: [PATCH v9 2/3] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-csi_formatter-v9-2-ca3d8c334c39@oss.nxp.com>
References: <20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com>
In-Reply-To: <20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779785861; l=3588;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=HmOt4CRFaRGoOVn3zoZQJT4JDXtng4IAa3MKVQnujRg=;
 b=bZiMiZ4yMEHu7ldN8EJ0MsP3z/U8dwrCNtkr3L9dA5MTT9iUf1eBfhZFzk4vbTgby5J4kZuYK
 QtEaLgzguMaCyjAMfQyAYKoOmMl5XvG3H3dzZeMvtpjgYUsGD9AjAjb
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA2PR04MB10446:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e667e9-ca72-4584-adc6-08debb0477f0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|11063799006|3023799007|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 mHJxxgpJxIuDUA6RY9dn0gu294KhQ80t8kTbZYkLOVPLTOiEiFObyP2sjstl7ka2gRwwpm6PQ5fjzEkqxMgHR0D8eNGiV0m2xLqJL64ZauLh1BbBHBRcfP3hISYlp7Now05vjFTLkyn9BpxY2DecuW9w5VQlEqb/zKNMWguVawPqlNclcyud7+d+0T3dJiU+uTnecfsU3TTOnthnhTin5c3seqFGvygkzwbLVpnvkNcihIwl3v3+D/mB/2CCA0GEfUrMYTjmpZCgy8xunZTsYoVvhBNHEiUDhSgtNwa1YCIFdXqWxxsoJo5PWKdUzy1ffoowHv+g3CYON3LLww3u8iAU7Of3E/jehpXxKlfwve/w7ALcnV3uejPYD50C2NSQe2TomhISc9nIzBZNP3KQtKIHc8OO0ybnt4p5S7FunVVbbQDTglEjGZ3L4lY5z+aLF1R5QOsp4CWsEwHul8GVVRneV5OIq7ZMoqU23FsUvSAw45r4Si5wv0hAOyqeNXm6uEIQCs61FXPWbvP/5u7PETlASUT8Ofv0q1iLV1qbtb/Ml/P1CeiCiSzAHoZVFsjJ0T3qnuxFKqnBUK08IkEOo3gJNiL5mcxsjENoDLBDBpAYpekFYFOEYGO+gbvB8lmB/FyvcoPL2hesVflD7rV+PtxwP9h0qTorlOj1sNQMvyBMsvAvEAuv6TbWFwLF6xsMY+mrCR/WCUJZWBoxANVsoA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(11063799006)(3023799007)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TVY2WFRWSEQ4QkVYcmRkNmtnUzAyc1hRaGlTak9kTE1seFFpRXN3NkJUUzJy?=
 =?utf-8?B?MGNTdFNuY3VxQTJ1b3FUQ0lmU3pkbys2NXl1WmhXQWFNR1NKaXFRazdjS2Fk?=
 =?utf-8?B?OWYxV2E5Qjg1NklJNENEUERqVGoyWGNDRERhQUVDZCtxOUdLL2VLVUdlbTZL?=
 =?utf-8?B?OUp6SzdiVy9HSXVxcnUrekh4TldVRC81VU5iMVRDUDdtc0Y3ejhnZU85T1hu?=
 =?utf-8?B?Qk5NZUxIaDlNVHJqZ0oxNUVMRWVZdHdibkUrcjdqSWcwTm9VRzlXVFZBU1Bz?=
 =?utf-8?B?U2I2RHpjTnRHbzRWYWpNcE1XUldLbkVsaFRhMWJvcjVDRmhDSzE2ekRxbC8v?=
 =?utf-8?B?Rm9RVWt2ZXM0Q3FQYVc4eVVUd1pKVjJqNlVMS012V1VZRm95OXk2Rmc3OUdX?=
 =?utf-8?B?d1pJQmNydG81UTFtNklvZS9jYWJOYnh5UHRrUUpOYU9qTnlhdjhTQ0crdkNE?=
 =?utf-8?B?Nk9kNnppczlhTVZTaU1VYW5Sb2pOcjRmVFZDdCtYNVF2dHV5bzRVcHhkVVhm?=
 =?utf-8?B?bXJFb2N2bVFiclVxdWl3Y0ZQRFlwajlEVk5VMnZmYUt5NFVaZXg0SHBtYlNU?=
 =?utf-8?B?Rnh5ODJ5T3gwRS9tVml1UUo4Y2R1Z1R1STdNSS80SnpmTUNGUU1NeUxTWG5Y?=
 =?utf-8?B?dVgvUzdiSjRCLzBzM2dXaGx5Uk1MaEFhalcvSWFpbFB1eFMrSnJyR3JRUmVO?=
 =?utf-8?B?YWRmRkhiRllGekQrUkFwUDRKWi96NkpjR2VUVnJib0U5VGhvUm1oWFJVSmRr?=
 =?utf-8?B?MXdaYUN1MklZM0FnWTZNSTQ0RFlNK1VXQ2UyUGprZnBrSkVyOEVreHE1RzFV?=
 =?utf-8?B?UThMZ0djT085M2dyUVI2RFpUR2lPVmVZZWxhZVl3bDRrRTBMdDNLRFdOMllQ?=
 =?utf-8?B?UE81RTEyeWVENnBBYysyOUFtNyszWm9wWWs1ZmFyRkxSRDdORGlVMnNuN3Z6?=
 =?utf-8?B?K29sMjFZcGxiN2NNSUtyMkhYMHlKWUJvTm9QbVpUTitRY0RaWjk4d0ZLR0Fr?=
 =?utf-8?B?QTlzaW93cXFZSXJSQnhtTm00WWExYnNvL09xL1FCOXphNVl0TllGMzErc0Ux?=
 =?utf-8?B?djZoTzRKVGpobTRZWXN2UUpyVEJLUkpJYWdJYzVISXRiQVVUSGhZbXl4cGJU?=
 =?utf-8?B?M3h4Q2pSclRmSEp4RStMMVBLd1dRNmFrNEZSYmFCU2MzQ2NRMFJOSHR0TXJ1?=
 =?utf-8?B?bmpXVzQxUkRQQWYzY0tEWkFGSmowMHNYK0ZCM1YxWUN2QzU5eTNqdXN5NDht?=
 =?utf-8?B?KzUvc0ozcFFzZHR5ZmRmYklNWkt2OSttc0pDUmo2Y09XamxuOURqWHIyZTZF?=
 =?utf-8?B?S1dLc250akpTSmdGVGdWbklRcFBLc2tpbHdVaU9kN1BsbkViTEZRSFB0ZEpw?=
 =?utf-8?B?eWtqYWV1dU9TZzc1UGNwWVpVK0lqSXZjb2U5NUNnQ0hPQmU5RitCZFFlbXEy?=
 =?utf-8?B?N2h2YUJOSzZ6cnZpd2Nha2MvcGVvdk5FdG55TTZZSFcyTC9ENG9jRERSUXNF?=
 =?utf-8?B?LzNjdllFaEdodExOd1g5V2dISXFIYkRkQXEya2tHV0xrKy9ybGt2R0dFR2R6?=
 =?utf-8?B?aGx3MnhGVk0xUmY3RGpUVUZWTmVFV0s3RkZCTzliMzNXUmw0MVNOOEJCQUlV?=
 =?utf-8?B?MG5wMjkxZEEzdEIrK1Q4V1FGcFVucnQwV1VjV3pCV0p5cWZ4ZFhIUS9iOFNr?=
 =?utf-8?B?Wm5CYTc2Vkdac2o1S3o4UVJDS2MvVm5DejZUaFEycFhUQ01sbXZiMitNTE1M?=
 =?utf-8?B?VG1vaWpZaGcyZGY1OTBYVmhCREgwdXpCYkVkRFR4STV4RmVtTWlvZnJQZkdn?=
 =?utf-8?B?eWN4N2o0TXd3YUV4SCtPT3o5RGc2VFFIcHhvQTdWWmVRbTdEcHhaMkNLV0Vj?=
 =?utf-8?B?dDRGWFZ6NGd0Tm9jSEIxTjNDNWFON1ZhZUU4UHlhUmdRcWt1Vm5VWVd1eEpJ?=
 =?utf-8?B?Z1l3WldIMVFFR05KWWphMU1OeEtXbWNmb0NkSWE4a3drYi9xZlY3QnlDdjFE?=
 =?utf-8?B?Z0FQaHRkdk5hV0VNTWNRSFBEWXZIU2dYczk4S1RRVnFBNmJmLzZURWtpTDBn?=
 =?utf-8?B?VmNtODV4dVFWei94b004M3h3MWZ2S2U0a0FIVVBZR0c5OWMxSE02NDQ0cDV1?=
 =?utf-8?B?UC9IRGp6ZjBhdmlscXlmNCtpQXpqVFlqdDUwKzVGQUpRdVFGdHRYeHR0TEM5?=
 =?utf-8?B?U0xVNW1DVHRMbCtUcDBUdmdYTWZ4alBxa2g0YlcrNlB5WEtsOFR5THZzZU93?=
 =?utf-8?B?MkRGZUVaK3h6WXQ2eEpGQ3BWa0owcUV0enEwN09ZMU9WMlNxVWVjZ01PTGN0?=
 =?utf-8?B?U0IzQ0ZWUWJuRjI0TzA3L1l1dkhZbjMzazk0bGlLTHRCRW5ZR0VSUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e667e9-ca72-4584-adc6-08debb0477f0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 08:55:00.1330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hG04iA5l5K0hQG5tE5zUetKiA/QDdjkLK9C9fYhEaMAAPcp7Trm8gyw3/eKsImzbJ+hT+f+0pGMlQ9r+JmITQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10446
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com];
	TAGGED_FROM(0.00)[bounces-62767-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,nxp.com:email,oss.nxp.com:mid,qualcomm.com:email,4c100000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.20:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 546395D2F31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX95 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v8:
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Add required constraints for port@0 and port@1 in ports node

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
---
 .../bindings/media/fsl,imx95-csi-formatter.yaml    | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
new file mode 100644
index 000000000000..61068ea0a69a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
@@ -0,0 +1,96 @@
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
+        description: MIPI CSI-2 RX IDI interface
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Pixel Link Interface
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
+    syscon@4c100000 {
+        compatible = "nxp,imx95-camera-csr", "syscon";
+        reg = <0x4ac10000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #clock-cells = <1>;
+        clocks = <&scmi_clk 62>;
+        power-domains = <&scmi_devpd 3>;
+
+        formatter@20{
+            compatible = "fsl,imx95-csi-formatter";
+            reg = <0x20 0x100>;
+            clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+            power-domains = <&scmi_devpd 3>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&mipi_csi_0_out>;
+                    };
+
+               };
+
+                port@1 {
+                    reg = <1>;
+
+                    endpoint {
+                        remote-endpoint = <&isi_in_2>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


