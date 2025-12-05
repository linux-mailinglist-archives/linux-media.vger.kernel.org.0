Return-Path: <linux-media+bounces-48307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540FCA6DDD
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 10:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C500B312C1C1
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 09:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC238301481;
	Fri,  5 Dec 2025 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JBrSn4Zr"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305F2FBE02;
	Fri,  5 Dec 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925698; cv=fail; b=jJIhrkefzsYR8f6TD+rkmhw9UiPjExYXQd97h7CeOJUXWgS8anVw7ApUBI2PfX1fpsMsuT6hW/rBTvIIK1MjewCG0U3PKwUvwNJBaY7DEWlGixKBmCFevb0U7O7OLvqZlMr+xzlIJHyOh35u8Yh8Gddd4URUAyhQwzNAa44VOzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925698; c=relaxed/simple;
	bh=6+XCMZeY4F0Uy8bQNKk19ir9wTTr1Qs0dWv3BjwF/FA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=flhsRDvEBmHo74L+ZglsAzGCmdGTjnnaePjqvhFkkus0qNT8cyaVsfeO8v2TjsUdIRyeLlVdh8KdNOhfStOop0gM9UzFgufCU0AaOMgTm97ytFjZgxfE8PPM5cI6isWVffN/TQjD0iU2g/OeE1c8pZTdRu2hxvKvZBW8hhTJVMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JBrSn4Zr; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aljz45YddMI7vHgIN/X1i/06pfwpSYzjNRNc7pp+t1vL1Pm6eOKNFTBYTkV1Jtvu54ieNyXJCLz/pnbHOmsxDtUwcj1bgPN+HtMd8BAJVVwN36pCUFoLYuz6uhJAHvQ9rAJSlg/ifdQcoFZs1QgapuqsBV/IH9vzQY0PtK1oEj5KUCsw//ee4kqZEGs+WK4L7A7rkxcjKf1zeMdGVOsOvSp1fWiy89DDriEPLVvCIV5Z8eSNdDRooCu4apOhSkgLWVOnlyLafQaXTW2J2ZqER+26O2I00j0GPJlsYUgNNuHx7bgnfnj7Rd929FyJytCCLGo/2YWLLdnp/NRXSSYr0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjNwXg6ZCU23o2vpdodylug/Oy/9idUpy1/6RbRc92g=;
 b=jPgtwWkN79A40aUSYvQUxaXBxJY+ESi/pZNbedFEpMHLxtap4OFdrnYNoSse/c0AchokbA4Jr/QGb/mHMJGx3TrNngMxLYqx/tmNgQJBXCF60GeUY+5iJe1vCD2mcIDx5WeWbc81OFoLW6PDzTnj/2sNJMe/XqajNHgHPVNKCHdVUO/qSO/a5xUFbn44P23yKv+l+6ero+LKA2caOxtVnyb+KgNdJ0pHQ1X8JEWE8ayG96PmrVhPVSxshAV1fZnB88qZdg5dqDyB9Wl3crpIISNUlTFxd0FEumZLfUbyuUJW4Vxml0P+4/mpQq6RAGOKhRaFc1QPHXsr4YxcapeuEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjNwXg6ZCU23o2vpdodylug/Oy/9idUpy1/6RbRc92g=;
 b=JBrSn4ZrBsDjtE5o5AVRU5tz4585KOH/lkKR7mNIXqri922DrKw2pIYQbY+F6O/+XZScifItofdsB2VWeueOKQcAJjHa1obxhNcBFC/AY8yqCAX2kXdjcEgdDsBHUEdIXFDhGMluABEfFyEO8mOv2eqNXz9sWSe3xhX0Bz68Na6eOIpCGXOl28iIDzjfuH08HnSOFIcDqQE9AHiTEn5TGehh4+mmZ8dWeep3vAZEHqGeCgrb7RxvAd/ncyNoTA0vSa3pQIpgiHwbuq1tMBq9eQR43QsmZrVv2O1vlpF4NVFEkyJ3ot3OG8C8QDu5FUkKDT8PtLTIyYLzaFmY+pRZ9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB11042.eurprd04.prod.outlook.com (2603:10a6:150:21f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 09:07:28 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 09:07:28 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 05 Dec 2025 17:07:46 +0800
Subject: [PATCH v10 4/5] media: imx8mq-mipi-csi2: Add support for i.MX8ULP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-csi2_imx8ulp-v10-4-190cdadb20a3@nxp.com>
References: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
In-Reply-To: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764925696; l=1214;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=8rujAzeS896IioXjs6gAJ782LE95lr3S+gi4TDdcKRM=;
 b=DGvYtZnM2J5bh4TlfivXVGCn1Xm5I0LpC8cyo3VszlM9Tn1xLCmd6nGrAQ4WPLfLQ3ldW3bwr
 c4LoqQyokGsBVPlMSmDByCyv4cjs4dk2Gbd19lTIXFopBqOWpHqaCXe
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB11042:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da2db20-1742-4a5c-6434-08de33ddb6f6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MlBSZ3RpbXRGUEx0dlJZZ0N5bndjdDhubXVuUm51dHgyZTg0dmFtbzZJNCtE?=
 =?utf-8?B?cWduR2dFY21aV2FyZU0rTDhPV1hTYVJ5cDVmTEdjdlRCTmJ4NE5QWDBac0Q3?=
 =?utf-8?B?S3JwNmlYbXZiMWpwaU5ESTB0SkV5YVFtSDdFSnExRUoxVUUyY2F2RXpDZVVE?=
 =?utf-8?B?SGhxMWdjNWFQMGpWa2ZVbHp6SitmSzVEL3pQZkxwcGpOZHErRnUxNkNjZ05m?=
 =?utf-8?B?UTVFcjYyRUM5a1RQQ2lHZGhGSzV0dS91S2dkNWdCSW1MZFhpZTU2NHBoK29P?=
 =?utf-8?B?QzJITjU5N2FONXFXWUNobUZkYUJOOGt1dmcrUXl5L0NnZVRva3Y1SFlGRnJx?=
 =?utf-8?B?TFFUZEs5M2c0UytBTkYwd2U2Yms3bGlJMmhvSFJKOWZ1SHNRNXllQm8xbmpT?=
 =?utf-8?B?T2JkVldXaC81OUV6NVBBakdUVWZ4TmZyUDJoVzdUeURnblNsK0RrZWNzeXMw?=
 =?utf-8?B?QmJlR0xxOXVvNmM3K2ZKVGljRkVpbEQ1bVhFTm9FeDR5VjYzaEdmdm9IMEVu?=
 =?utf-8?B?cS81akpKa1RJUzNxeExnbVdabXdCS1h1OVcwaFl1b29PNnoxaE10bGd6THJS?=
 =?utf-8?B?djZ0M3hjTm5HZGozQWVUQ1FRK3dDV1dLYW1vby9jM09MN0tvWE0xM0RKZkR1?=
 =?utf-8?B?MFZrVGZndWp2UGRTT2dIK1FLajBHc25TSUF4aFNza21xK0JZdWhDd2w0bTh2?=
 =?utf-8?B?anVFanRRMGJoMmgvYnV3QXhESTFDR2RrVU91SkpQU2NkcEx2V2hWNFg1bzZQ?=
 =?utf-8?B?TFdMZ3NrTzJnMjYzN1pkMGp5NkNpc0VDQ2J4ZDVJbUdkM1lTTkdUdEE2WkMv?=
 =?utf-8?B?MFhackFQRVc5bjZLVEg1RlUrckE3S0VYOUNFU0xscjNvREtzOXJvenhIZ3ZD?=
 =?utf-8?B?aVRZMjBoZk1uUHU2dGFLK0hQVDZwaCtIeVQzZ0J1S2dSdnZHQ2JIRm02Ty9M?=
 =?utf-8?B?bXNoeURYalZibWs2RGZlaXZIQjdDdjVpQ1NsMFVUd1hvdXlybjJRaHF2bjJJ?=
 =?utf-8?B?QTVhajVFcDVKeU9lalQzTVBick5oby9RRXZSU0pUMzF2MHdmWTF0ZVJVcU5v?=
 =?utf-8?B?Y0VHL1ZZbzJoN1BYZ01LM0NLek5HYndCVm82QlpkS1JETWhsWTFpaFVmcG9J?=
 =?utf-8?B?K2lmQjNYczRkWVNLbmlKMkQvWG9Sa28zV24wbjQ5N1VQa2V1cDJvUzZwQjdT?=
 =?utf-8?B?UmZxK29FSHdWcDl1UTFHb1JQVmQ5NzVXTVo4M2tBZXJMSWw4SVRqSHB6UUUy?=
 =?utf-8?B?MHFremxNWlFFbFNvRElkQlltZk5heFR4SVE3TlZmakdXaXF1VEI1RTlleWNX?=
 =?utf-8?B?M1N6QWZFc1IzWFoxK09NekVIQld3SHFNcHBTbU5jb1ZxNVVvZjd4N3NWODRN?=
 =?utf-8?B?RytKUHA3aWx0bVFVVGlBUDk1VWVsYjYyblpNQWRYZ29vSW9SK1hLZ1prSGJZ?=
 =?utf-8?B?a2d1SmY3blNUUmQzb1lYeHUxOEs4c2xwWVlMcFNnSmdkdnRaSlpuZ2tHemtJ?=
 =?utf-8?B?WWgrV2VSRHRIRjMySVM5aU45bGhFUTQvVlpkZWJuVjVUcXJ3eE9pNHJwa1ht?=
 =?utf-8?B?MWpKVnpUTWRDS2J0OUJEU1VJQ3oveEVmRFJuYTlkNFpYbTRiYnlYZndUeVMx?=
 =?utf-8?B?R0tFTnFuQ3p4V0tLTFdZaEtlSWt4R2k1dzA1aGhtWVhlN0daay9iRFBMWTdr?=
 =?utf-8?B?UzJHRDRjUTFzVjFya0diNTBaL1JTNWl0cW9TYUpPemZ5elZVL0txdlE1b1VL?=
 =?utf-8?B?OGNkUHFYdnZSUktsdEFzOTRiZDlUVmlvaGUzRnlER2doVDM2ckZtRjFtU0Fh?=
 =?utf-8?B?NzFhdDgxSFFNUEUzeERDV3loeVJ2N2tPSThhNlNJcTZBZHpjalJ2K3hPNWNG?=
 =?utf-8?B?dVN3Qk14OG9rMlBDeEhuTVBGcnlGeUxnWFlzTExWeEhLUCs2OWI3Y2ovdmNa?=
 =?utf-8?B?QWgzQWY4K281a2ZkRzRzR01MTEw1ZFRaNG5HMjFoQkRDM0NnZFpBNlo4RkpW?=
 =?utf-8?B?OGo5YjhmWFhFRkRYK3NNZ2pZc2JJdENCSG9NU2t6YzNadTZZWXhDR2NyeE5n?=
 =?utf-8?B?TjNSbUJlNklNcit2Wm41VG9nQUhiSjlPTzF3QT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VlZDWGJTNTltZnRZRjZ3cUlhaC9Ydnh1a0tVZUpQYStpR0hLbTBYS1pvU1FY?=
 =?utf-8?B?cGhHck4wYWN5QndBKzltYk1ySjh5WXFyZEIvM3JIVmg0QU1DOXlmUXdMcXIy?=
 =?utf-8?B?S291SERzQmgvSDZqSXM3ZWFXSjRocnRGb0FrQ2NTeXk5YnU2TUZYQndzYUtU?=
 =?utf-8?B?T1o0RGdSZWJmVWl2NU42bXlhZnFqUWNKVTdNcEV2bW9OQmtQRXNJdXNDMkcv?=
 =?utf-8?B?c3p3N2Q3YlhwUlEzWU9ZUm55MEJtS1Fhb1VoY0IyZjJ4SzVFYyt2MkJMMjdS?=
 =?utf-8?B?NFBrSllGZGpYeFFrUUZGSDFibitwWGplN0QwNHpsYnhxYjh5Z1I3LzFMRTlx?=
 =?utf-8?B?YTFXbVBEa2NPNjN1NlpMY29yRHBmajV5NDVsRWNYVE5Rc2JsNmwvUnBtQStt?=
 =?utf-8?B?QnJiN202SFpLWGFzdk5WaVYyUklobUhVdTc4dDdBeitmK0prcGVRbzk0ZmhM?=
 =?utf-8?B?Q1ArMHFDaUpKSmtNQlp0UEtMUWRRNEJxam1iK1N1Y3FzaWFZVzBYbWkyV3Vk?=
 =?utf-8?B?aWRzSnFkaEhVSzA1V1FUbzFyVmlFcWNyVStOdDQvYk9JalQzbXFWV1psTzYz?=
 =?utf-8?B?N3dKdE9GZEtmR3g5QW1PNzgxajJnQm5VUTZ4ZUVaREJVcEg1aUgvWjBzT0xJ?=
 =?utf-8?B?bUtnVTFSZWVPQjNUWVg4RWR2eEhSNlFEUUtZUjJWNkpuWWxHQnowWG40b2Rq?=
 =?utf-8?B?TjhvSWxWNzR6NEFXVHhDQ20yMVZSbEZRMDJvV0xrSVI1WC8vZXJkSWdFTW9Q?=
 =?utf-8?B?OVh5eVhSTkg4M0hqY3p2T2NuM2dqUFdZZXVBS3hNb1VURHR1Y29HR0NQMjIy?=
 =?utf-8?B?ckpNN09kZWhIZS9rTWZOanRTRHFvcGsyOHJmQkxqNzYxMklkc3BUR0FvbnY0?=
 =?utf-8?B?NW14UVpUQXNCREY5aGQ5cXVnMGlDSVd6MDZqTTRFV2xQZHBPcnBiY25KUWhK?=
 =?utf-8?B?NTdCbXpKemFOQ0szbU85RGsvNUg0L29yRUZTQ09ESkNjQWtvT3BVWFN2eXll?=
 =?utf-8?B?ekFQbnNNdk5hZ1ptc0JBSTBYYWVNTGZNaFRHcVpKY2pzQ2VtZ2RzU01MazlP?=
 =?utf-8?B?UmVuNFYzaDJkV2VzWklIdGxTMUM0VEl2SjkvR1piV1ZSOWdSVCtHaDY3WkRq?=
 =?utf-8?B?VVUwK3dOQ2N3RzlEN0gxWnE3bThOL1VaaVNwZFI2cklBNDVCanZBNlRYVXRS?=
 =?utf-8?B?ZThDWnhMQVBXNWtMTnQrdDU5R3RyMDUzU1pzSDVtbXNiRkIzNDNLWDMvempK?=
 =?utf-8?B?RDJlOGh6VkVmK1JLNktYY21jdDIwdEdJNVhUNTlnOUZCaU5WNy9BUC81OGMx?=
 =?utf-8?B?NHM5RGk3RDVLc1ZWa3ZnUlJtK0VHcDRNWFU0NVA3VHorM1JFQi9jU2dZZnZU?=
 =?utf-8?B?ZFE0SytaZW50OUQrWjVhZ0ZZSURoMzNlcG9OUTAyeEQreW5NSWp4QlBuYzMx?=
 =?utf-8?B?R2d4dUVkR0t5SXk2RzRpazlYN0xIcU00bjNFUjRxcU9iUU5lejRCWGQvOW1F?=
 =?utf-8?B?S0draTdjL2ZhSmhCM09KV0hKS0tYczBmY3VXUG5kcmpVdVNLY0l3R0J3YXg3?=
 =?utf-8?B?ZXU2R0dUN3EyN1lhd3lnbTlKZUEwZkpzdWtiMzR6QWsxZjRqQ3hLVEs4T1I3?=
 =?utf-8?B?REZzU0VwUmZJV1RESjFDS2hMRHd1azIrdU1MaExnVGJwR1EwelpIc0Zpd3Jt?=
 =?utf-8?B?dHFFZUVZQXVPQ2lOWUJDZFJrY2NrOXR0V1pwcGpzeHF4M2VrY3YyYzlwZTc0?=
 =?utf-8?B?VkZ5U2NGV0dIS09uZFpWWWdPY05kYzIzUEl2a3ZvQ2FZam5XeTA0MFYxVkR2?=
 =?utf-8?B?ZERLcjZmU3VFU05XOEtUb3ZRdHBNTWdEQnoycS9YRzRiMyt3cjN3ajliK1pJ?=
 =?utf-8?B?TUNuSzZQVDZqUVVvN1dWZU9QRjc4L2pvV2lILzBLSXRRNzU0dmdqbjJ4Ukkv?=
 =?utf-8?B?RTFSWWxQT0tOeUZiV2RmMHdZdnRYY0xrd094VWpocVRyK1lSUXg4aVVkUTJJ?=
 =?utf-8?B?MlF4UUlocytkY200aE0zclBwRDhGQTlPUzdsMVNYMUwyTGMwNkFmS0RvczVB?=
 =?utf-8?B?U0RTelhsUHpBUW9HNE00V044SkhIMkRkb01BVWJ6Snc5amZKVHROVDFjWitL?=
 =?utf-8?Q?n6vGLqkuG/I63KQleJXzTu3H5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da2db20-1742-4a5c-6434-08de33ddb6f6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:07:28.5003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xj0YTxMJjOcOOMbZjl4TjTEuwr0TS983PivBdt1FSxSnhVuGXmh+U1Rsbjbe25Tc0KltDExDJJevWEPwoFs+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11042

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 receiver in i.MX8ULP is almost same as i.MX8QXP/QM except
clocks and resets, so add compatible string for i.MX8ULP to handle
the difference and reuse platform data of i.MX8QXP/QM.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 0ede273f7ff82f288404316c9fd7f1e751e169c5..1b80e872cf38293c03d216cbee869eaa02e55458 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -1076,6 +1076,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
 	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
+	{ .compatible = "fsl,imx8ulp-mipi-csi2", .data = &imx8qxp_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


