Return-Path: <linux-media+bounces-39460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6108FB216AB
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 22:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67F9A2A63FD
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 20:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3167A2E2EE7;
	Mon, 11 Aug 2025 20:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pcfb0f2f"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8822E285D;
	Mon, 11 Aug 2025 20:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944985; cv=fail; b=EFwnyJj+lSSR2KVdoqm5mrA8L+qngKAJ9imWx/22DsaC1iMUaEQTJQeedEMrhMo6YmuEeLlQwYuqrYq9tJlEzlS8kV+4uXhftV18W+uieCPar0uFkVJA+GDf8nEsUYe3x7If3FQkU+Lm6vN7ffZBKlRTf/+dspGnrvSN8+gMf5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944985; c=relaxed/simple;
	bh=px8Tg9rLpkg8QmPmAtkqsJ7drZb5Ok0Z2kjWm/PC1sQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Jg0JQ5ctrcDZiehR4lMRcx3sKMUlMt79f/wLKFV0VWINUOn4ebpbkZUHks6jOZ/XGcCNEAnBx2g7rTbPiL61s6FxHhLBlxuwYxiGLGAbMZ9MPiCl+o6vId4bYIYfUsh6vfiKe77aIqJhwYRVL0fgjozhoaH1/4Eu9TQnazEvFSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pcfb0f2f; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfVUdevAFBoX5+IAxVzWC/9wgC4bgZ/b6I7WSWzQplAR3zsTw/h5Jn952Ipn3zLTtMI5kViPEoJyLCfW4E0kFljIeWZJQ/eiD5dcGCVEzcgR8WyoxswEDOvZ4YrgfTf1SUKSEU52Ddvrhif+o9fc4edk/VoMp/PG9rIhPFV0t21NdSi3hKT69Z8YbeBBjC7Dr/VOuzwHs4feKdnZIZeW1dCTzKhuPwJe66GWNS5dDX9QtOIKECBT2PqbUFf70tewbbgg9+aCbxV41CM3+dF55l2K6AeajhPjUfKKcVAAYTYYazDj/Jmb/kF4QJ94HAoPUaxkQqcsW4NSs21kdt3ipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgDqRUSuBrlR1WcNhxNwov/M9V2u8NJmD8oAdusKipI=;
 b=hM3NbDiGS6FyjiMWMjC/1NLdBuR2S/WBxR+GiYjA0mDcHqIH38qjNIo3g8OYn2e58CwFaJ4FID8PQlvzYDd0Wsc3A/CAvInnecSUrqzTuxc63BaiaOZV3b21wodqe61NCyApwV2CS1soMWd2J3HAvpoEsUKpTo5uZAVM2so7UW28DWwYWKI3FhK0kpgpvgIrG8RAIHmjBN6MTGewnwinHz1tntIPFzNoVlWE/u3EiEQ/LZw/m7J35tMfJeU+28HI6+bqch5eNwG1p/y2p2Dtnis2c69lXW6bhfmrh3KWcyVEcTz0oEmlGJUaO6mIIhUi3RtVo22agYd0u2DLnRQXJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgDqRUSuBrlR1WcNhxNwov/M9V2u8NJmD8oAdusKipI=;
 b=Pcfb0f2fiBWAMIT/0eb8sx1/aUbIqobeqMsgsQg1n6rDt8As0Le07sV2HydTPNakkl5dU2xZcmWztoLXEk2+YyKDSun98UkA4nbQ79hM4G9swfbR44omycifvA04In+F1icsgkc2yEWtCSLBFqGV8Tyq2tjgmHKclGr2GUw9KuxU1wijaWMqPqfjuyDRcjJ3Vmo3OCNMHs48e4jvHHIe+T4AfTTpbYvzchKr0U3AQVZ1i9Du18YGz8KaYMq217WXFTSqnVjlucR5AZO+Gp8cmTF+z5A9Fw04h3rdlT5M4ZX+RseXirgDl34Eh/8UUK4FLOI9CEB1n1knFRtWz5dwbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7747.eurprd04.prod.outlook.com (2603:10a6:20b:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.11; Mon, 11 Aug
 2025 20:42:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.011; Mon, 11 Aug 2025
 20:42:58 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 11 Aug 2025 16:42:30 -0400
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add bindings for AP1302
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-ap1302-v4-1-80cc41b91662@nxp.com>
References: <20250811-ap1302-v4-0-80cc41b91662@nxp.com>
In-Reply-To: <20250811-ap1302-v4-0-80cc41b91662@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kumar M <anil.mamidala@xilinx.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Stefan Hladnik <stefan.hladnik@gmail.com>, 
 Florian Rebaudo <frebaudo@witekio.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754944973; l=6886;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=QSQ4elkO2aGqVRoI6FHTmKuApSZBvDaJYOaP1CUcVLw=;
 b=rp4wcLwoLZ+zFLtwPE//PqgYB0FB8FxArEDFuHzm2yZNG1SjuAWJnP5A7+aAC4YwziRO2XWKD
 U2c4ZvrJmMAAFupQtQ0NoABktmgjgxpxtUH6WOHxmdwJVVGdLk4Pxfp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AS9PR06CA0746.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: ec680f3c-d723-4f1a-676a-08ddd917a80a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZXRZUHMwTWQxVFNKaFkrSi9hbEpHcXhwTmROb3NVeVhCZnZLd3E4QmtrQzl1?=
 =?utf-8?B?RmlxdXN3NVl5d1FBdGVJTXA2aDFmR0xiSVZhOWFHNElpdWVBTUMxOEIyaUVw?=
 =?utf-8?B?Vy9wZnhYVTlUdzBDckZkMW93M21BOWgwaWljdGsvcU8vU3R1UnFMNGlTZ3p1?=
 =?utf-8?B?TVM4UHhYNXI0WUNFQ0hpVW56U1FpR21QY0ZsV3lEYk9CNjdiSlRHMmdSeUJT?=
 =?utf-8?B?Q3VuQjErbUJ2NHZkaTNJY3YzL1hhazJ0R1k4aEdRUzNBUS9vTW9zbUp6ZWFG?=
 =?utf-8?B?c08waDZvS2ZnUzIxc0pZR1E3aDVxUmViY1B5OWxIaUFpcUpaejdzVUdHZklS?=
 =?utf-8?B?WXZldU5HY0RYcFJ1ZkpBWWRoMkdRRTJQRkFuVXEwa2RSSVgxR1hBMkdDS2c3?=
 =?utf-8?B?Vk9WQllTQlg2MW5sNjkwbkdBRDh6Mkd1bW04TEl1MERmdXgyNDhBMXcxZ01T?=
 =?utf-8?B?cHkxMnkwYXowT0cxOWppSWVVY1R4V1dYdGRFRzFmTk1KL2NyRE5nTkE3bTI1?=
 =?utf-8?B?Tlh0d1RJZDNZZmRjb1hIWW5LQjZUMnJVeXhLMkk3Yk44OVAydC9RMFFuL0RB?=
 =?utf-8?B?dXlKU25VY0dzaTNLV1FqaXZ0WGxzYzU1SGFxREMwaHNBekJwWVE1L1hqWk9G?=
 =?utf-8?B?QTF3eDlxbEIyeUxqNE1ML3ZRL0tPVGtkTHZQaitoSzI5ZWdFL2RCdFBhOXFM?=
 =?utf-8?B?WDdFOHhtemRHRmdac1pzTWtBU2VkOEVDYy9aOHJpSDE3M2g2dEVxMGNKRmxn?=
 =?utf-8?B?d3RqVis2d2FDTDVnVGtoa0hIdnhYbkhCREtDMmF3WmlIbXBYdjlpWnAxZ3RM?=
 =?utf-8?B?SEgzRWRFbThxNFowa3RMWVE1TUlGcUNiemp5U0drcWJsNjh5SmlOSFdJMnA3?=
 =?utf-8?B?VjBiVnZUTjlaZUdqdzArM3c5a0hXRlJjQzh6YWlXOTl4UUR0NjBwTjFMOU83?=
 =?utf-8?B?NWhyTmUyM09nZGNrZXdYbWFHeTJ0TFlYR3c5bjVtdnNOT1hiVGRIdmRmSGF1?=
 =?utf-8?B?MmJINHhTRmlNMDRmcmd1cHFid2RzSVFYc0xFR2toWGpudGdnblJDUkRUd2dk?=
 =?utf-8?B?U09NNS9wNDYwWk5MNlhPaEpoV0xBL0VSM1MrdEp3eFlKZHA4dTVuSVVNMmJC?=
 =?utf-8?B?QkVMYlRkZ1A3UC9ONXNxUzF1Z2ZuSkhGWFhXeTVWamsvYVN5NHJhbFdSYUlP?=
 =?utf-8?B?WDdOVVhoNEkrdlQxVWZQUURETHk5L1BOTWRVaWVJblB4VXdOL0Z1ZEJXZ1d3?=
 =?utf-8?B?L1pJWWlqQUV1Ui96Uk5udHdEcUg3VXBYNGpzL291b2JXRWdTWDJUZzUwVkJL?=
 =?utf-8?B?aVVNNXhJR1dnVE4vTTVwcDVSZmJiektScStRUWluTFNCdFZQQUFTbTBEckZk?=
 =?utf-8?B?eFpnRlprZ0VpVDY5MjUveVlsVUQwV1VpQzdHeTdkMjE0VVl5cWR2ZWkyOGcy?=
 =?utf-8?B?SFJUbzBVUDRzbWs1NERENCt1Y3ZZRVdxOElKbXBzYWwyZGNWQnJwcXdyL1ZD?=
 =?utf-8?B?WVV5NkloWHdXMXZGUENzaTk0Y3Zsd0gxajlMRXlxK3Z3bVk5YzJISWJ2N0F0?=
 =?utf-8?B?QnJ2c0FHbzA1Mzg3UG1ORVFzL2dPdktXWWRXM1JOMGNLWml1YWVSYVl0eXRw?=
 =?utf-8?B?NlhNa3ZtS2E2am1CMjhyaElnTTRJNmNuTzhzelFnWE1TVDdXUW5EbXVnTTV5?=
 =?utf-8?B?cDJiTlJ3Wks3YUU2OFF2RFM2SG5wSG1ka0NXdVhYSXVYTDRZaW1kNFhRcTI4?=
 =?utf-8?B?bURCd3dlOTJkSXptaUZQdnl5UmxnRENXYmRJTVJpcW5xSWlWQnRpaC84S3pQ?=
 =?utf-8?B?aUhYV0xnZVF6WDdCMW5pdmVSMnJENHIzOHR1b3ByRXJPMW5VaU8zMWhHU0d4?=
 =?utf-8?B?Z2YwQVVodFFkaHRjUnZwNWVMd0JmM05Wci8vTXpZRnNGbHVCaVNSTTJKK25k?=
 =?utf-8?Q?rLkNm2OBGvg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OUlDcWxzdE14Rm1QRCtGMWJSQWxkRjMzeXh2cEluQlVHNEJXZWNRMHhobmtu?=
 =?utf-8?B?WDZQNE5qbkpxQkI2alUyeUxFWkFOQzVhRCsyM2grOGUvTXNwY3Vpa0kwdnVG?=
 =?utf-8?B?NUNRZ3lyci9zeDQzb2NGK3AyaWdtdElkdE5QUkVQWnU2ejAxMk1OWWh5aUdo?=
 =?utf-8?B?N09YM09lTE9meGJCdWI1NTBRUENRRGNoRXVoWE1DbXN1MzRXaXhxMnl2bHFq?=
 =?utf-8?B?RWZwcnBvckZEQUd4a0l2YnpqUHVWb3phZDFJd3RaQ2NaQituZWdhUkdoZ1ZD?=
 =?utf-8?B?THp0UWo4dWtjKy90QUdCNzdFSVdVS0xobTV2Y2YyVFQxL1NWN0UvT3ova01j?=
 =?utf-8?B?eFBXcUxTajluVXlWcm5IRzdvclZYeWZydWY3SUoyOTBrTXFyL3R4TlljdXJS?=
 =?utf-8?B?QStCTStCMVRVcVNlQzN2RjlLek1aQ2Y4cmNFaTFOYUZPYTRLL2VhbVVGOVVB?=
 =?utf-8?B?VGdxdk1HV29YL0RIZFZRbTd3c2UzYS9YMEIreHBIczBCdC9NZHVDUytmZVNS?=
 =?utf-8?B?ekxaVVdZc1ZaU2RjTjg4aFZOWDlKUzI1QXF3Q2VhSHJEUHpTMW82eDF3Z003?=
 =?utf-8?B?NVFPalZ2RXNveHF1blY1L2JobFhZVG42dEQvcEYyTU5zSHZuaXZiS1FmNDBY?=
 =?utf-8?B?K1V5ckhzUHhDVzlUbW0zRDlKU3d0ZzI4UU96d0pOSm84K0N6OUFrVFAxRG96?=
 =?utf-8?B?WUVGWTRlY2JuMytzdHh0ZFo0aE9qVzdUU1Y5OFdiWEhPNVNadVRJRjBlVWZr?=
 =?utf-8?B?VXM2NUx5V2VKZUQvd0dkYXR5S3FUTVdyRzhncnpOaGtoaFVLMXlERVF3NFY0?=
 =?utf-8?B?di91K3d0WlJpVVZJdTg5UzA3K3JoNk55bGo0bEVrbjl4SC9ZeU05djZScVZ2?=
 =?utf-8?B?RFQrN2psRng5RWs1WEZ2OHg2eE1CMmlpeE9idEJGMW9JT1JWQi81eE11Y2JF?=
 =?utf-8?B?V21JTmhldHlkWWlEQjA4dGZoL3Y0NzI4NEhUVkNYMG05d3R1blVWcGg0N0RQ?=
 =?utf-8?B?amNSUGhXM3pFK3JRVWFpaGREdVZ6RDdQeG5tQWpYVHBLdFFFcTBrKzBUaWd0?=
 =?utf-8?B?SjhBdmltcEJLMlJ0R1JNNkptU2lVTjlDa0dpSUJyM2hjMlZraW1zUVgyRXFx?=
 =?utf-8?B?Z1A3dEJNU3RqKzVKR0poZ1BoRjVVK21OcklkL2ZWalJGOUR2V3NXdzBGdnls?=
 =?utf-8?B?bDFPS1htenZxOHJ1TnZFQ3BxSzRlcmhZUkVKWVE5eW0vWDluWm41aW1UeEdT?=
 =?utf-8?B?K3NBR1FvekREVEZFVzZHcnN0R1RIM29nM0JTRzdvUWxOWjcxcXNHcUM4TUo5?=
 =?utf-8?B?OXNST1Z0ZTN2SURJcE9aL29hb2ZyT2ZSUG41VVFVMWtuYXdsSGM5ZVowQjZU?=
 =?utf-8?B?Y3E0R3lHSlJDbzN5TmRSdSswS1NMcDFieksycmdjVVhDRHVUMEVYSHJiL20v?=
 =?utf-8?B?b3Q2S2w2cnhIUjVMNm5IYmFSQnllamV3KzJKN29xZmw0NWR1STZpK1BWSjlx?=
 =?utf-8?B?bU9WdTRhSmV2ZnJpVUljL3dkWXN4YzJUSDZGREhibnk5ckJXbmJFT3RNNDU3?=
 =?utf-8?B?QmIzRzdJN0JUTTE4K1RnaDBJWGI1dGRET3JFWStBaEV4Tm50Rk9HYzdCbElB?=
 =?utf-8?B?QmhGeWZ4Q09FZ2wrMTRkWkoxaEJNVU1pWkl1aTZmVjkrUURZT3dMUUx2WWNy?=
 =?utf-8?B?Z3ZMMjFzazF0d0VBQldleVlwRG05dFpXK0Y2ZHlkNFZxOVovV3RNTURTS0dz?=
 =?utf-8?B?NVA2Y2J4dStOUytWU3hlcU5tL1pVM3RnN0NuelBUbmR6ZVVwdDhPZDdKdUNo?=
 =?utf-8?B?dTU1aXBKaFZEYnZFR2xVNmtWanl6RU0yTGMvTWdsekVRdnZFZHNhZDZaUHZr?=
 =?utf-8?B?cWZnUXNMLy96cHZ1SHdWa3g3RzQ4cWZXcUJ1ckhDTjNkaEhaQTBGUjh3SFRX?=
 =?utf-8?B?YTY4Qmo1eGUwcUJoNXVPY0V5VTdTSG1yM0Z3N2ZGTTRPWlBudlJaR0s0N0NP?=
 =?utf-8?B?M1h1VUZJZEd2QnpwTENudXM5TkhUbmxZbTBDMEcyRlZtbDNXODlKYmV5SWQ1?=
 =?utf-8?B?Ri9vU01Xdm5pTHZ2RjZMaVlaMWlpOGhxeFRoTllmMUtTTVhWQUVrNnBSTjJh?=
 =?utf-8?Q?+gpU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec680f3c-d723-4f1a-676a-08ddd917a80a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 20:42:58.4857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1O+gwEh0TgXgCPjkuxe3BSoheQeTb/R5JR2UIfGWyUueWuKTDbX3l1h9116AmTLqwyweid3RGUOf7vK+tD1tbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7747

From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>

The AP1302 is a standalone ISP for ON Semiconductor sensors, which can
connect RAW sensors (AR0144).

Add corresponding DT bindings.

Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Previous try:
https://lore.kernel.org/linux-media/1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com/

Change in v4:
- base on discussion https://lore.kernel.org/imx/CAL_JsqLUj2h1OxUokOGFL34czroJnJ33cpvn9jO8b8=cu8Fz0g@mail.gmail.com/
  change to use onnn,model property to descript connected raw sensor
- Overall roll back to v2, move raw sensor information under "sensor" from
  ports.
- regs use enum [0, 1] to restrict address range
- add supply name from sensor

Change in v3:
- Move sensors under ports
- use compatible string to indentify connected raw sensors
- Add onnn,ar0144.yaml
---
 .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 184 +++++++++++++++++++++
 MAINTAINERS                                        |   8 +
 2 files changed, 192 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d66962d2eadca3f4d86c99a68d5ae7996bd1a522
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AP1302 Advanced Image Coprocessor
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
+  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
+  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
+  Frames are output side by side or on two virtual channels.
+
+  The sensors must be identical. They are connected to the AP1302 on dedicated
+  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
+  from the host.
+
+properties:
+  compatible:
+    const: onnn,ap1302
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description:
+          Reference to the CLK clock.
+
+  enable-gpios:
+    items:
+      - description:
+          Reference to the GPIO connected to the EN pin (active high).
+
+  reset-gpios:
+    items:
+      - description:
+          Reference to the GPIO connected to the RST pin (active low).
+
+  standby-gpios:
+    items:
+      - description:
+          Reference to the GPIO connected to the STANDBY pin (active high).
+
+  dvdd-supply: true
+
+  hmisc-supply: true
+
+  smisc-supply: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: MIPI CSI-2 output interface to the host.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+        required:
+          - data-lanes
+
+  sensors:
+    type: object
+    additionalProperties: false
+    description: List of connected sensors
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      onnn,model:
+        enum:
+          - onnn,ar0144
+          - onnn,ar0330
+          - onnn,ar1335
+        description:
+          Model of the connected sensors. Must be a valid compatible string.
+
+          If no sensor is connected, this property must no be specified, and
+          the AP1302 can be used with it's internal test pattern generator.
+
+    patternProperties:
+      "^sensor@[01]":
+        type: object
+        additionalProperties: false
+        description:
+          Sensors connected to the first and second input, with one node per
+          sensor.
+
+        properties:
+          reg:
+            description: AP1302 input port number
+            items:
+              - enum: [0, 1]
+
+          vaa-supply: true
+
+          vdd-supply: true
+
+          vddio-supply: true
+
+          vddpll-supply: true
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+  - sensors
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@3c {
+            compatible = "onnn,ap1302";
+            reg = <0x3c>;
+
+            clocks = <&clk24mhz>;
+
+            reset-gpios = <&pio 102 GPIO_ACTIVE_LOW>;
+            standby-gpios = <&pio 40 GPIO_ACTIVE_HIGH>;
+
+            port {
+                isp1_out: endpoint {
+                    remote-endpoint = <&seninf_in1>;
+                    data-lanes = <1 2 3 4>;
+                };
+            };
+
+            sensors {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                onnn,model = "onnn,ar0144";
+
+                sensor@0 {
+                    reg = <0>;
+
+                    vdd-supply = <&mt6358_vcamd_reg>;
+                    vaa-supply = <&mt6358_vcama1_reg>;
+                    vddio-supply = <&reg_1p8v_ext>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index fb578b329b72f8765b856e39e9633c1ff90cc0a4..fb2bcd73117d5bbc9fc33355cc86f945da1ce48f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1811,6 +1811,14 @@ L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	sound/aoa/
 
+AP1302 ON SEMICONDUCTOR ISP DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+R:	Frank Li <Frank.Li@nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
+
 APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
 M:	William Breathitt Gray <wbg@kernel.org>
 L:	linux-iio@vger.kernel.org

-- 
2.34.1


