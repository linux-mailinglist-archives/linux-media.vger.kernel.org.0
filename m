Return-Path: <linux-media+bounces-42646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 653F8B803CB
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 16:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF8F51C04293
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 08:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7A02D5C7A;
	Wed, 17 Sep 2025 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wABO6szw"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346FF303A21;
	Wed, 17 Sep 2025 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096925; cv=fail; b=DT0yzpOThQ3X3PywPGxf2haUbRi0MPzkGkLPsVuGMTntWdn8jzjPA0Zyh0nIzTSFRJxukjLzH/gZadg1OLMDuuuPuaa/O/c97HDkt1kPO4+7YT09y+btdpG46s8Nss3Ac+rv9WkDQp8oady4CrWokBfBQQH4DFTGuLFWv8T+3aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096925; c=relaxed/simple;
	bh=d4knq0lcdnN1Fbav+OWNj8+uh6Wf0JLG3X74bRrTva4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=LmrTFoN5SZJ75UT99vPx10N7eLnlAizNXPmruAV7Xd8gcWPlNg96rj7AkXEiQ7koJZK3vWS7xNvNHCfi2B8ZVFueZ+5Xp8KOdyE0x0w4Ez33L4OeF/nlHntoJWpujGCuRxm5NNidVCVpCzHr7HBIHhjzwZsUQlkOLbQy/gkZNSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wABO6szw; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIKGiBgBfckIDRbLiSo1a83lovZgzllJFOuJBZKO+9DEon4y/N6DKW90BsYurN+aSu4jAhY6ntjCsqg9/nUrJCattoN4/frYYnvRvcAkd8zq/Jb7UErPwLEdTBzHafVogEi7Dl4DfjQAOqdLpnMdQaC1GtMXOrhrT/Iy89DnZyHvr2Gp695CBMxoVyGCcTOZF7uZwH/d/s3dA2j8a60HfFAA/PGFelqOfrw8qGZQoi9/ZjLxi9cW14lMBjpmrt5YoKOhWZhfp1FMWRm3wbxWEaOpHff70d7OkWAFj5k/64rukhGGn7mjO4MvTqbii1hAEhokXy41dQy4Tn1r3jro8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whnIO9anpUuf2u0KMk5ppOp/3yJ4Ve6YfeODKDkf4rY=;
 b=zDxyDS2j2gMvGr6TmsuMd2Pal1A+nZBq2Zs6jieDxSRqsdBeU2UEYyTCkefV7XWDM1Tsbpgzk0kCCTsZR5Y8bTjWBwhEzvXZoNoggCIstrIDjqwW4A/FrLW6Cq6X7mhkBQDOqmUj2cPPPWi+Pa/k7crh787x9mBXe4RalAOvzo+G4/eT95fVVGtKek2croGfkveHtQBzl5/dQZvwsZrL2iloXF6qJF5z2ujVdeW0QsGwKYHJFGxTXrD0QovcczXvdXv49/vLIvPEtWDXE6pd29Z7n+f2EGVhsOTk5IHEKIgaNckk6FBi81huRRWYJF/tsNRnEgjBme9V26SSMZuTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whnIO9anpUuf2u0KMk5ppOp/3yJ4Ve6YfeODKDkf4rY=;
 b=wABO6szwZV1vzZQRkAIeNUu1iENSIP+y9W8DWdcejQS2qoc9700mh71QtZe2KNt+xyDNdf6NO56ZL/ipQa/5o/POhlRwaM4w/4jkA6dNYBDmPXKh7saQtyaZP31QVbF4/RmCtgFIkvfgpHrsJ50OyGnoHZz8jgAsPuXC3d63GUtFdsFxS6UTlcCrE5xbDf3i9SVzpgNMQYLeaaHE+ftU8bAq1XgKElpNnT8s6cO4AhCJ6upEz0Cwk/1GFm7wrN0VWgg6LpDe9geF6+CDwYInXcgFqxMXju4OXBRAitSmMiwI1puYy5aeSafN+Ka4CndjZr1PqgLRb5IuKDBt2BBHaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Wed, 17 Sep
 2025 08:15:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9137.010; Wed, 17 Sep 2025
 08:15:17 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v6 0/5] Add MIPI CSI-2 support for i.MX8ULP
Date: Wed, 17 Sep 2025 16:14:49 +0800
Message-Id: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPltymgC/13OzY6DIBiF4VtpWA9GPn6Ernofk0kDgpVkFAPV2
 Gm898FmJlWXZ/G8OU+UXPQuofPpiaKbfPKhz0N8nFDd6v7msLd5IyiBl5IoXCcPV9/NcvwesLK
 GSmGtMLZBmQzRNX5+5T6/8m5i6PC9jU5vI7CGgBakJIoyjgm+jaH3Y/HThvESUir6eSjq0K3J1
 qd7iI/XwQnW8F8GYP9lAlxiEJoxRhVTgl/+K+uTiW4pP1CaKeVScm20AFPvKdtSeaAsUw2Nqgz
 hxii5p/xNVUkOlGcqKiWYJawiDX3TZVl+AbCE7xeaAQAA
X-Change-ID: 20250819-csi2_imx8ulp-9db386dd6bdf
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
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758096930; l=2794;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=d4knq0lcdnN1Fbav+OWNj8+uh6Wf0JLG3X74bRrTva4=;
 b=OT4utFXnt5oYYo9vac2OZfHKPZzghhP201W4FQ5i3EfF+OFXT4kk6hVh09qZr/BiKvSJ/5Jvj
 X3TZi4BLUGoAvE1z4Tsz+NXDnWESziC8x+2L7NEXLG6bhgOKcix29ui
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: c73138c5-69fb-401e-b918-08ddf5c255d7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RjVSSkVPTXQyY1dSMm1tQlN5RnNLT1Q2RGtpc3NFM0pERVlKYnBiZ0RhVGxM?=
 =?utf-8?B?NldkZmR3UmUrbGQvSjhXaGJQVndHL01HRmMrK3BQSWZRYnNDMnpKVGZabzc0?=
 =?utf-8?B?Q3lzTXFwSXlZZ0dBbkY5eEw5Nnd4NFgrNVpOOHZYODQ2WExXaFVHMG51VU9w?=
 =?utf-8?B?b2svT3E4enpQd1FTSUdWNXdwakkxeFZzeENWUTVKd01ZRGk3VXFEK3JMbzQ1?=
 =?utf-8?B?b0FtbitsS3dPUnFLeVNYVlRxRDRiakxNMzNESU5nMERZNXg5M1pEeWU1ZnRo?=
 =?utf-8?B?QXpGd0E1ek5jY3c5WTZvU3VhWUR0WUg4Ty9lVHAyazdnV1NNU3FFZnY5K3Nq?=
 =?utf-8?B?MTA5SFR4VUV3L0pqL2hPa0FLSENiSS9RZ05YcTlYSkVuMCtBTUhDR2ZrZzR3?=
 =?utf-8?B?MFRRdytZZ0s0TlNUKzFnZUl1b05ERWZ1Qnh2K2ZONGhtbWxVRm5DNHFlejUz?=
 =?utf-8?B?MFBuOHczNXFEYmxTWGl0L3RINWtHbFVPUmJLOWZCeVJqZWJvcnEraXdONjdk?=
 =?utf-8?B?RUJyT1FicE9idFRrQklIRVdLM3ZKUHIwWTU1NHF4Zmo1ZjVrc2NUaUJiN2Jj?=
 =?utf-8?B?dC9sYzdVaTVUSVZlN2RoRmxmV20yV3VqVjFkWVJFWkhSOUJuckhVb0dzYWEy?=
 =?utf-8?B?ZHpWQlBsY0RQOURCOUhJWXd2OXRFZlBra2x2cXhKSFNnRTVaNkZzUkoxdkM1?=
 =?utf-8?B?d3FnaGZyT1NUZTNRczEvbXpUajVlMGpmb1ovWGpMaFBPejFZY3FkbW9sckZt?=
 =?utf-8?B?VE1zaUlJM3ZJdmxxQ2NRUUtNNjhOV0FoaHAyWk5PY1VLYWlZd282Szd2Tlli?=
 =?utf-8?B?Z045YmRoUGtpeTNNWjI1RnBFTEJlRVVPc0pEYk5aQWNCZGYyWEF3MXdMcnJz?=
 =?utf-8?B?S28ycTZvb0Z5V3dIMnNxbHNUUDlObjJpaDFKZ2JJb09yR21HbHdNLzNETTlN?=
 =?utf-8?B?eWFrakZPOEljbnZkRGFCTTFsTElpM3JndGN2dEk1bmZIRGkveEdPR0xoSEsr?=
 =?utf-8?B?R0hidEZRSDhNTkdkU3FLQk82MndNdFF2MCtuK0c0NDV2aUlhWHFxa3pBYStI?=
 =?utf-8?B?N0hEdjZya0V1K2E0cDZsY2NPWGFSaDVtd200dzc0cis2MGh0QTFDd0N3ZWlP?=
 =?utf-8?B?U3kwdWdRSmtwZzhlVS9GMytQeGthRWZmRUJuYXlOREtvcTFtdnhYcStRSis1?=
 =?utf-8?B?MWdlNnFGZURBcks0THNaRElyT2EyRjEwNmU3K0psbjBBeXpFTjRuaEZEWGlE?=
 =?utf-8?B?NXhZZmVqNjNReTJpL2tjTjN3WE1PYmNMTUlZQUQ2SUhyM1laV0tVUCtKaGVP?=
 =?utf-8?B?ZHBPTTQ2aUY5ZUZUNzNVYjVUT3EyL3ozdXBRb3FUMlFKUHRiU2pHUFVzSStz?=
 =?utf-8?B?VldKcEhJMzRDOVhqVUhvektEOGtxNjRoT2dQYjc0ME1paWJhcnVDbXBkYjRl?=
 =?utf-8?B?dUd2MXRvdTY1alRIYUMwYWVkODJrYWRsb3Zib1htZndiUEF6N2d4dk5oSEd3?=
 =?utf-8?B?R2kxOWE3Qmdpei8xaXErMUkrbDF6cWpuVGJBS25QVmJYZWw4aVdDbmJPRmYy?=
 =?utf-8?B?TWdLeUUwWkVZVk1GUytLQkZmRkpIYkJQUzdiRGNFR1pDWkhMeEpoVlA5Ly9s?=
 =?utf-8?B?K0ZoSjhxMFQwZjhoaWkwRXFKYVZhY2UvVjVCRTdpTVZJb3ZYVm5mWE1mM3dG?=
 =?utf-8?B?QXU4WlVLSEdnT091SXRUWjZlSFBCWXM1bU9iOVVtTUtkUzlNSno0R2g0a2tG?=
 =?utf-8?B?WXFDcDhIamdzcGZDMmdNRHBlaGdaSyt6WjBnSWY3TUg1c3lmZjFxNCt1WmVX?=
 =?utf-8?B?bDFxZHJpbTh1TVptdDdvaE1haGg1RXRzeGZXQjdvaFY1WmdULzVtVDhISlMx?=
 =?utf-8?B?dUJOOUR0c3lDeDRid2RPak41S0xJSWU1WDFkbVoyaGhUK2l1NlRXYjNVZSsx?=
 =?utf-8?Q?v/STpPYEXNV5LiI2Ofwba9ZehTIXqNlI?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UDhEL0dFemhES2RVbllROVhncTZleDA1cGFsVm5EUXhHa1pQZXIvOWY5YS9O?=
 =?utf-8?B?ckVxc0p0cTcrNEJEMDFzeDl4Y0xEcCtrcTZZVFlNMmxkUCtvSlA0NkJaQVFN?=
 =?utf-8?B?UVZXK0xiVlVTVm1HUTBJZ0tJYzJRV1JVS1RNaVdhRVhZcU51ZERIMDE1c2xZ?=
 =?utf-8?B?WGZnWXgxUmFLbkNpM1RsS1UxbjVURCswNitpdUJYN0FrUk1wdk1tUWlsTnpI?=
 =?utf-8?B?aG9rWGl3VE9BanNGeFEwZVVHVmV2K1BndVJFTGlsY1U2d2w0SHhHMXgzcVRs?=
 =?utf-8?B?UUYwampzWUZjL0FqQThROWUzZ2ZhbllhQm14TlVvMlJZanZ0dDg3UTFsWTlN?=
 =?utf-8?B?QmVuOHRyenFGdUc1d3NOTnJCNVlNdE9rTmhuQllHT2xVZzZhb2ZJYTNwdFNE?=
 =?utf-8?B?bkd6Q2s2QmpzVE1USExWNW5zSHYyVGlBMDJKUnRUdkNqZE1MZTBhZDQ2cCs2?=
 =?utf-8?B?alA1ZW9MV05yWGRzeEtQQ0pLcTRJZklvV3dZK2d0WDN2eU9XNG9rRzlyMWVp?=
 =?utf-8?B?NS9tQnBWZ0RwM3I4djI4SEtKRVdoZTRXbzloUGVUYThPM3lsN1AwVTRVV2Vn?=
 =?utf-8?B?WlNPR083MjlwclVjL1oySXRaaitPNHBhUHJvbkR1VElobTYxTm92K0JUdVhD?=
 =?utf-8?B?VC8xN2g0L0FNa0RaSStZT2tEckFoSnQzS3hWOUV6dTJWbHo3UHdibUNvMDFH?=
 =?utf-8?B?WitET2RPaEhzRU9EVU4rV1NkbHV6UGFIN1hvUDZUWXJkQWxqcTlqQUpQZGZh?=
 =?utf-8?B?R1hOSFREMEJDdit6bysvalFqL01JSHdUdzI4Vm93UEdPTU5rWnhxSGlMc0ha?=
 =?utf-8?B?MnVLK2t5d3Q2cW5zSFZhQTYrUDJGWnhjRW9kUU1XcnZhYldDMzIzbWlrS2tM?=
 =?utf-8?B?cy9oVUVSMTA5aFFtTkk0VXo0dVgvNHVUZGxkdWp6OG12OG4wajlzcU5kM3Bh?=
 =?utf-8?B?MzF0RGpRRUZYbEt6MnZ4cFRQTk9mcTNEOTdiMlFKT0ZVLzl0d0RVN2QwZzNU?=
 =?utf-8?B?ZlpZMzlZcFNiL0Y1eGhmNmNuTDNNRDdyT3IwdTRtZ3A3M2xicERFcHBpY1ls?=
 =?utf-8?B?eHVRcGVzYlU4c3Y5eU9mVWRIc0ZobjVKZStuWHpMUzhOakRtK1g2Q3hsamMx?=
 =?utf-8?B?QW81dDRXWXBIVEFKWjNMMm8wSXBwSWNOQzNIc1p2eENSWkxhWjJ0V3dCekMw?=
 =?utf-8?B?VWtlQUxDRWlydk1HK0xJUVlIN2NPZk82MTJMbUEyUUNvSlNSNWlWMC9pZU10?=
 =?utf-8?B?ZGR2czF0UTIwNjc2dmVOQnJrZ2MybkdVSWx6U3Y0SThNRFNEOU1YYU1YejNO?=
 =?utf-8?B?dFJWRlh3WjNreDBiaE1oRGkxdUs2dUJ2NHVpdVhRa3RpNE80WlhPNmw4MUlT?=
 =?utf-8?B?Zk9zenRRMUFrWVZIOFJKVm9xYlhLTWg2bGNIdk4wOHJJQUtEVm5TNXlvYVQz?=
 =?utf-8?B?K3cwY01vRzlubXgwWWVPZjByNE5UTWhiNHhMd09EbzZOUlVrNHV6cWgvdEh0?=
 =?utf-8?B?NDBJV3pGQ2haaXVQb2RCcXpBalpYTGN4ckdtQ1dyYXlHcHQvNGxTVGJHNzFY?=
 =?utf-8?B?WlhjbmNNRzh2bzlvNXhEaUZRMXoxMFI0ZnZjbmlXTitqZDBhSDlzVjE2N1kr?=
 =?utf-8?B?SGtjUmVNb2laRWNJdzFsR3AvR2FnaS9wclcrbE5OYmFqNGtQQVhyQUR4eFl4?=
 =?utf-8?B?N3FQV0ovbEhpNHM0SG13V1g1OEU3bmRvWk9oODNOa1VGZHFDWjlpZjlrYUxu?=
 =?utf-8?B?OWdtOTh3MjZodjNXY1IrdEFYYmp6bVJ2WHlRdEtHY0xobGxlYVFkUVlxY1B4?=
 =?utf-8?B?TUtQbm5LN0I4Yy9RcVAvRlVTb3RBWHEyTk5TejFwSDU2bmNubkw4akpGVDlK?=
 =?utf-8?B?aDU5TDIyZ25HYVVxRFdTTEgwWThhckVham1GQlJiVVR3VVlDaktibzc2ZS9V?=
 =?utf-8?B?T3VZMlU2VlRBWjJiaFQ0alVFUWp3eTErUWNIUzZGVU9EemtRT29aL1Y2VmdM?=
 =?utf-8?B?ODVaTnJERDJIczN3ejJFN0NrS3ZIYTh0RE80ZGhlS2J2TDRsaEF2cVM5TWQ1?=
 =?utf-8?B?eW5FT3JnSlQwY0ZsUlFiUnBiMzRaRDRuMThnZXJhSm5XaEF1T1JJU3pQVjA4?=
 =?utf-8?Q?3x01TdE0fYdqvp36YzZtO+W53?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73138c5-69fb-401e-b918-08ddf5c255d7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:15:17.1040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YIHSbUJAyQotenLIPKQnoijVLQZZcdwiSIQH9e2EFeFUGM3GfXw7WsXCKRamPe+0Dnp4o0I8lUF3iP9+4fSxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958

The serial adds MIPI CSI-2 support for i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v6:
- s/existed/existing/ in patch 1 commit log.
- Delete the compatible between 8ulp and 8qxp since 8ulp need one more clock.
- Update compatible string in dts for csi node.
- Add one new patch to handle 8ulp in driver.
    media: imx8mq-mipi-csi2: Add support for i.MX8ULP
- Link to v5: https://lore.kernel.org/r/20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com

Changes in v5:
- Delete else: block and move clock constrains to each case.
- List exact cases, but put imx8qxp/qm in one if:then: block to avoid
  repetitive code since they are same.
- Link to v4: https://lore.kernel.org/all/20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com

Changes in v4:
- Change csr clock name to pclk which is more readability.
- Add restriction to i.MX8ULP and the other variants remain the same as previous versions.
- Update commit log in patch 1 to describe why add new compatible string for i.MX8ULP.
- Link to v3: https://lore.kernel.org/all/20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com

Changes in v3:
- Correct the order of "fsl,imx8qm-mipi-csi2","fsl,imx8qm-mipi-csi2".
- Correct the order of minItems and maxItems.
- Restict all variants.
- Change pclk clock name to csr to match IP port name.
- Align description about csr clock with IP datasheet.
- Add reasons for adding a fourth clock(csr) in patch 1 commit log.
- Link to v2: https://lore.kernel.org/all/20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com

Changes in v2:
- Add more description about pclk clock.
- Change minItems/maxItems to 2 for resets property.
- Better to handle "fsl,imx8ulp-mipi-csi2" variant.
- Move comment to the top of reset_control_deassert().
- Move dts patch as the last one.
- Add "fsl,imx8qxp-mipi-csi2" to compatible string list of csi node.
- Remove patch 5 in v1.
- Link to v1: https://lore.kernel.org/all/20250812081923.1019345-1-guoniu.zhou@oss.nxp.com

---
Guoniu Zhou (5):
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8ULP compatible string
      media: imx8mq-mipi-csi2: Add support for i.MX8ULP
      media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
      media: imx8mq-mipi-csi2: Explicitly release reset
      arm64: dts: imx8ulp: Add CSI and ISI Nodes

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 41 ++++++++++++-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 67 ++++++++++++++++++++++
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 61 ++++++--------------
 3 files changed, 124 insertions(+), 45 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250819-csi2_imx8ulp-9db386dd6bdf

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


