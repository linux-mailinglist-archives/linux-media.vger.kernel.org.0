Return-Path: <linux-media+bounces-61075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPkKLR+mAWpKhAEAu9opvQ
	(envelope-from <linux-media+bounces-61075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:49:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEA250B49E
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A9A630888E4
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207CE309EFF;
	Mon, 11 May 2026 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G3c0YZe6"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1483BED24;
	Mon, 11 May 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492472; cv=fail; b=gXCkLB58toazojx/i22rzy5lS71ykjj3Uo7uW7mPHlxR5yPKV2J1dGJ5iGHzGuIQ30zXZxhOZe7eUhaBWct3zSLiicBM6zJwhFmnDaTZobyVpJ84x4YL9AUq7i/2EsaCOxSERKoeHWp1DADWtLQIccVPvrvfu//86fKS1LvAhqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492472; c=relaxed/simple;
	bh=BVHG3uWR6afl1Jbo1VG28HHr/BEBpBG85yMrjztWWF4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qLThfGdRKdvGuMBY1qpZD6jS0q0bekf1NAFtsfcucFIXZ6ttuAo6L45aVTs5u46OSu6duI+9solHYHQkn6Dqd/Fkk7OnlfZvjGFAAW4IQNtdsUhDdm6H5B+9bH+Gxqu41i4J65SZTLHbppthfnsXtYynkRt3eyw/i9CNni1FYsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G3c0YZe6; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhnuDDKk6eK5EKjpqzTj2q/SuHAAZ6RKNWD4GmAY676bacADsHq5zv3Up1RCZGOMBedDX9C++vJHeskUaWQXI04GdIWGnE2oFayBp0s1vyKlxokalPbTljUTnHT4evw7eypFWvUe/MCnlzXrCWK36BvKv0Q0Xt/C5iLQK48xLtLTF58Ps/UdcKTeX3dVZkjrF/8lkdpBfaeSOuniAEXyosTGGkWlvMgIt4cXw1kCNWry3r/g0h7PM2pTO+S+/eR0BgkKFoR10XAvMapR831Mj64rMXfzpi7CuP/jy4Z62xFqv2PXO1hka6Tsc8vHaqpWf4YEr5jsMx3SLXsKAyTDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UJ71kl2EAYE6qOEWGz7RKAhCNmQRE2s0LDohEzSp+w=;
 b=fqkFgJRoC1aVdFE5NsvGYUMQ9kL9g9sTm5x2NDnUTGS2NQhKYXwLMjVqo4BMs7aH0DlG1QslmMGLjI4HRJx814P5nfK/4w2ue/h0ZXp5Hbs0OAe5tc1Q16Q2sYWfyCzXY4hg1/raQHfo8Lh5/4EJqOybYwJOeQ1AfUS+0kO6QdLtoWOmRKjCqh8zAYttu4UhfC9kMnxUi+kySf96I367BjO5eK9AgSDj8kxX2CWFLQkWAF5zMCQD1xRAq4rurzX59Qyj8JrsAlBlqJFzSvKo0XnPRREHfuyfXrYcJT3sNoT86m5RXMI9P6qMBdB7KQA5+b7ECvhadcSIoFyoVtlnZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UJ71kl2EAYE6qOEWGz7RKAhCNmQRE2s0LDohEzSp+w=;
 b=G3c0YZe6UzsaqeCejzKME/PKNPemvUlngZvzZJJ7Fej7q/bRKQDgxASE3dVocAf/eK+moCMIjxxutY6LPtxURMrR2/3NJSryTFvayBNqcBAAEcxVhpqRq8Ek93MmctczH4tjy0296l9HHssrE2mFtU73zfEB9QDE1ssoBqH9Z7iqL2YPQ2c77Y7QCXtSFBSMF3FNnzAOMtQ77yQpm0PrGL6dytP6xyf4roRu03dDJneuVKcfok5jsDnSQ/o1eKJ+9DBJkiZN+VpY5Pe5s9+R2suFR+9eJmDmFVwK5i8FaBctPt0G4h9hENIWgaJe9hgGJV0gTXvZ4FB/CU33C5eleQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAWPR04MB10030.eurprd04.prod.outlook.com (2603:10a6:102:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 09:41:06 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:41:06 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 11 May 2026 17:43:41 +0800
Subject: [PATCH v6 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-csi_formatter-v6-1-01028e312e2b@oss.nxp.com>
References: <20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com>
In-Reply-To: <20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778492631; l=2828;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=kmJKrwKN0R/LWrPeMaVm+Cbjo5g+tbVw7z3HYWXQFNI=;
 b=3V/Dp1Us62NnyvTbaCKACXprgVoXXslwaIXM8UP3IMmjN/CAZjguus5/HwpYqElONqBoXJzOc
 JIUIzhe7kUBCXSa3HdSWU6Nbw1O0cWx+S46FG66/ev8U8oErkhC5mmX
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAWPR04MB10030:EE_
X-MS-Office365-Filtering-Correlation-Id: d552a4b4-1036-47e5-907b-08deaf416c58
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|18002099003|3023799003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 PTzU/dIxF3BZVjqPthZgcUTBmozVT4J0zS1gjAcj6Tdq3Qodd4I8hXL9NzntcEWqyC5PkrVwexKItNoY3JbJXJgm51X3wRbggvENgeeRf7YeIwjGuvW8/96NtyN2XjgFP1WbEUmyeys1CKZTOpRK/XfFETgm6NeKtm+sr+5YZXdTnhbeml0BTVwwTecnLgSEX5FFwyrYkMFmrECcHVRbbY6emlDKZ6/8pOyMpGU6ZkdDGdRABYhxnyUEVkI+5uXpC4vmlrZRsKxFGflYodMBlBHLYfnUqFVS7zZCQjz7+caxt9jSvn67b8eLxLVpR2iDQbYtAKNiimRdAaKpZiOPx3KxJRbFl6vyIrxc+8HLPFMOksuc9Af8kyvyY+V5wSsWjE51vLXBQzMLRrMmNH1BOObfR3JzaTh9bfUqRS+PwtBcZSCd4jXigHtVrkDkhKTMu9TdKlu/oVRd82dpqyQCa9HXNJ7MencYOy400Nin0Mc+hUmJe7dzz5VhWlSwstMLDsRnwgXxGX5xkgT5VMeOJUC8m3LjS5hoJCNGbcaREkeI7jdqYIF/imvKLtGT1UuvZHx7n2bEDa0a4NFebm3l2n+xw620RAGnmLvakXVZMBW7WDy7csyghsky3K6scoC91EIlaTK4QLRiZEvVvrhnrI2BffMiFSbUGHzOelzH/88idAO4Pgc2ppUfYbjloDgkWNH4RZ8NUTn1lbk9q5QBDA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(18002099003)(3023799003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YnpZelJRaWI3WEl5U202YVJDVXM0aStFWXdILzFlN1pXb290cnVjU01uLzJN?=
 =?utf-8?B?ckFwVkZjNHdmTng1RkZhQSt6RTYzT01DUlVxbGZ4L1NxengrSmpLWDV0aGpk?=
 =?utf-8?B?QlRHWWRSZjdWN1pBNFVjZUYxaWNHTWtvWEZRMjVEZ2EzQkFBZGhBR0xYeWV5?=
 =?utf-8?B?ZUpJcFd6Ly95MHozZ0lScCtvdHdEamdQQzFQY2RqdDA4aWFyVVFYdm14K2Rz?=
 =?utf-8?B?cmtadloxZ0dkeWN4TVpINk5SeXBxeWdEamF2aDZKSURYbHc0UWNKaHg3akhH?=
 =?utf-8?B?U01nSFlJRDZCMEVseHVNM2pRRHY4YWxMbWJXelpJbk9NRkpMdWNrM29US00w?=
 =?utf-8?B?OFZzYS85c2k0N2s1YnQ5U3NnWFhHTFBVVlRsK0JPSFVOUWh5cmJDVWw3c3Y1?=
 =?utf-8?B?dCs0WExiV3FlaDJ2b1lHdlRCZ2c3Q3B5anl2TzA3VUlMZm1tckNWOURNQzQ5?=
 =?utf-8?B?NmsrY3JpMXVOSHRuYkRGRlZ0QkdEVjhjRk5uazR2UE13UlVPT3RtUGNzM0U2?=
 =?utf-8?B?d3NsT3N0UEdtZDJGQWdQazJmMDZNaUU4TmJxcXF4KzhPam9xem1SL2EybVYz?=
 =?utf-8?B?dG5CZjJBL0Q3ak5UWFR3d2tIcUZ0R2JMTzFBSVlWamJFZmJRY3dPQm5Xcytr?=
 =?utf-8?B?dFpvcXhkWlpEdVJ3VlNwN1QvRHBMV28vK1V2cEdxaWRHLzRzSndvWUdYNkNs?=
 =?utf-8?B?eStkb2VjNExXK0R0d1c2QTVZSDZOSTEyUjB3cEE5THA2YnlIaVAzM0ZuOG9V?=
 =?utf-8?B?NUUvVmpGRXlJcStlbEpTMkpmdnNwM2F1TVFMVVRGMnQ2TkVyeVNKVGpJNUw5?=
 =?utf-8?B?T05aSG5hdkpmTmN6QjVFRS8vVCtJZHhCRkNRdlJDZ29YTmxSTnVkek1nUHAr?=
 =?utf-8?B?NnY0c21RZnZBbXFZVWF5Nis2N1ViK3VmYm9ybmlXREFTbEJCKy9VZFowM3hh?=
 =?utf-8?B?OXR1RHBzVFdJT3NhQ1lwZU5rRlhkVmNKM2V6dG5YQ0VqWnNkNkN1NCtMVFZZ?=
 =?utf-8?B?WUhrSzQrcVlzcGhrc09HS0srYng1NEFxaFhmK3RYRHpmV2dPeHdGY2I4dGpS?=
 =?utf-8?B?b0JVQjFFSC9lc05tL1ZYbTB3L0Q1Q0pLVUZRMUNYc3R4Unl6WGNua0tIdnJq?=
 =?utf-8?B?QUlySjBvQnpZbkhlbGVMYWZyRURoU0pSQks2QlIzTHFMS3dJc1lCTktnQU45?=
 =?utf-8?B?MnFyVVhPcVZOS1pHZCs5amJMbFo1Z081OWx1NGQ1ejNNRkUvRjRNUDA1cmFY?=
 =?utf-8?B?ZE5rQ01NQkdQTE80cmJuZGtLMi9CUHM1REs2Zm5MS2FLS1hTSzg3bDN2S3NW?=
 =?utf-8?B?Njl6elgrUU15YUhxazNpK0lNZ0dmTFUvcWgxN21qTEFKL2IvVHpBR0p1c0lv?=
 =?utf-8?B?dXMvb3BaY3VuQTU1NzdPekdDSUh1aThMZ2J6WGFZbG9iQzNtYUNHZ1FxWDBt?=
 =?utf-8?B?N2ZodUxubzN0Y2NaallseVlhdHFLWFF6NE96cVN6bHRWV25JbEM4OXhuSkJK?=
 =?utf-8?B?NG5ZSjcxSmpIM3Rma1NRUitJbnVpVVdDSE1SNzlFU01BcDNsUXVlb3U4T2hk?=
 =?utf-8?B?SXVrQ2dsZ3lRbk04bWUrdHNEOVZNNU44OTM2TGUzWlVZazVUdUNuODR5M2FS?=
 =?utf-8?B?MUdyN2E3MEU2VVFOVGdmU3Uwa0hRNm9sRGl2YVdaMDJ3Zm9BTE1NNTM5dnkr?=
 =?utf-8?B?Q2xIL0pZd1lqaWNoM3RGYU8yaDlvV09uaGppT2pBcklZQnFyWUZMcEpmb213?=
 =?utf-8?B?RGhPVEhsRVRBdjZaTVFFejhOOEw3UGdSdTJvOVZvb3Q1ODhwdnhPWURhbm8r?=
 =?utf-8?B?OFk3dnZQN0tmOEFCWHZIbUNHR1ZHKzVjYUF5Ymc4UDVibTNsR0VTTzVRTXRm?=
 =?utf-8?B?WTlkZ3BQSlhEOG4vUDlsU1oyOHRnTjRxSFNKUWd1ODcyZEQ0cEh3SEtKckRk?=
 =?utf-8?B?TU1nUkduUlorcG9lVXQ1dS8xeGVhZ1JWQUs0UTdzQjFuNlRVTk1tanYxaVFp?=
 =?utf-8?B?dmpIRFRnUjBZV3FOY3h6MGozNkVuczBCV3I4SFNweGpxNENwTGlIMzEzL1Zv?=
 =?utf-8?B?S0JvNEM5WVIyRDRPcnh1Vzd1c1FEbml2UzB3dTQzS2NXQnVGQ24wK3FXUUpz?=
 =?utf-8?B?TUtBZmNZSGdpKy9SSS9OTUQ0T21JaUtEbi85OFE0R1pTMnE0SEgzODlONUZR?=
 =?utf-8?B?ajIrMXJSbXBYcW5hdG81YmFFcW4xMjQ4S1A3aDRoZ01uQ2pwVjNPdGtnY1M0?=
 =?utf-8?B?V09DL3VVSGJJUis5bmdoTm16UG0wUTloNi90SlhEaVFqMU1Rc1pFeThQRkYz?=
 =?utf-8?B?NEJrWmM4eURLNTQvcU9iSEE5LzVwd2pzZUdLdTM3VlpvaFE5Um5KQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d552a4b4-1036-47e5-907b-08deaf416c58
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:41:06.0371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugafwQ0kKa/66mLow3fC07lT+/DRwPPPb0SFa268u4aRR6lzfIt2VY/klxXjz82otpFQbkjPv2dVwdtbOGk5OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10030
X-Rspamd-Queue-Id: 2BEA250B49E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	TAGGED_FROM(0.00)[bounces-61075-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_PROHIBIT(0.00)[0.0.0.20:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.nxp.com:mid,0.0.0.0:email,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email,NXP1.onmicrosoft.com:dkim,devicetree.org:url]
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX9 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/fsl,imx9-csi-formatter.yaml     | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
new file mode 100644
index 000000000000..774d37d2b987
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx9-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX9 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module uses packet info, pixel and non-pixel
+  data from the CSI-2 host controller and reformat them to match Pixel
+  Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx9-csi-formatter
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
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: MIPI CSI-2 RX IDI interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Pixel Link Interface
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
+        compatible = "fsl,imx9-csi-formatter";
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


