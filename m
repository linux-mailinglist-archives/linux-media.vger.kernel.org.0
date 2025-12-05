Return-Path: <linux-media+bounces-48306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 728B7CA6DFE
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 10:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8CF531B0EE3
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 09:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EF1320CAD;
	Fri,  5 Dec 2025 09:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bMKCg5Zl"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7133E28695;
	Fri,  5 Dec 2025 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925692; cv=fail; b=aie5toZgefXZbXmOqkYLGmFD2bWoFlmXMsRWK2sShRpALp0XgFCR4W6qjHtG8LbuueWbKRgX+K3v31LnUvox+/FGFBghzEam0amd1DhARPWkW39pqqZHmcDhTtHcgwYHlubnbrFzSJZPg7uYBbot+xt8JPQsr7amNwUitWZnySQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925692; c=relaxed/simple;
	bh=3l+6CNFGrLCa5fcc6pzUKQPosn1a45Hc8q2W8Blt1+c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=f7H4jY1ZnLcE/ivgcwwebXvtjHeL8WtIvvgag0/If5oPxOjJdE0N09OsesYhWNBGP67+nbZstTI0Ba7DVXPKzSHLZ1GXbquq7j9856OYK2h314VcBHhxkrgzO2O1MeMjqZynEJKLic3CBEcGgPmZfnCauarTx2+fIV+BSqFamzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bMKCg5Zl; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8AITzh+eGk6ogqkgRnffhQNpSYRPmV5bm7umqz2eixSrD80GBWNDd8GzR4XRyj2DJXh6RiUSQP9/L7JLCAXVyCs8VueY7LNp92D9O5WXD5ZNhqka7rXAQSz8KMsZeOH3EBZ7Qa48BT12UJvrFMe5t/InNb6gR5I4ZIprWF8n46RH84Om9TQLh/D0diJdd1x7cVAarqQD9ExaLHgwvu+KAyGit3Etli9POHd99dmxoHg6VyzPjGRM+3dqjgix2HnF7J97soZGVqAJ6LP4MK/XAAR1xQSuXxy1nbxOqPb7FlQld/ZG8wE2qe11KKW82Dohd1tadxrimECdZ8XhBP/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMN+81vJQ5ysbfDoL1EcqWq1c9FZl8AjKoai/EeH2bM=;
 b=wjFgjqRaFBXojIOGbuliHs549NVuThsFU40qP0tHuWnYAf7RUj5ib0Q0I77vQTyOla5aJIQiJw8huUtM1i7cfy8pnNg/mZkyDuDOne6KZakYN6GGPxtJLyordrmluRB7K9z1fZBUYAlnUgJuGs8IqcvGf+fNaDorA7HZOShmJTQRAjCfWvVW7GH1hxix53O3s93F5OaCtPSdkVAksTr3/fREUPiAag4k4HsUoc0emtfdbB7KXSGCJdtTviuKNiGLYXjG9rtX1fja0abpVLNyZ1WgUZN0Ch/s1w/FaXB2CEPsZuB93Jwsh1SJsnKexsT5lAq1VY3aDixhYIBDZ558Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMN+81vJQ5ysbfDoL1EcqWq1c9FZl8AjKoai/EeH2bM=;
 b=bMKCg5ZlDeAW5lMF31nZPHtd87/YYIWPJzLSx3hMCLTujdrACnKXSzXjrq9tF09bf/UPJ9zktoWaktEpAYi3Thyn+HN4uOhDsDZNJrI04Z9c9K4mDerZ2Vt8NYOjB/LUrmQt8oCVmIDNJcpErUYwr/N6yBtQP2qaltcqlwgGT0nKGJtsOckDYO/NiDFLGP158Ukqg6luWL2UpL7ruGETmEAJsrdYDjH/rq2+lzgvTyIUTrWzXKP+oArOLnZql3oMcWTwlq/X3DJMcSoaiqWOchJewwwmfUWimcIggDPhq38w2rkN/PqqTIIUzdNUwU8Q7KHHHdeKaZNw0FKV5HaDoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB11042.eurprd04.prod.outlook.com (2603:10a6:150:21f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 09:07:23 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 09:07:23 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 05 Dec 2025 17:07:45 +0800
Subject: [PATCH v10 3/5] media: imx8mq-mipi-csi2: Explicitly release reset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-csi2_imx8ulp-v10-3-190cdadb20a3@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764925696; l=1388;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=3+Zfx6qHQl2zmLaiVHEdYYYqVwoAeYbUl2cOGK9if0c=;
 b=BLARK0w35cKLmw4iLI3h7kFI5J20jsJOfwUBLouh37TpJidnPxnvJpbC+Xb0lJn99T9QObDUw
 EEpqIFkKffID2TT9gAmnoAEPKdE4HVZXEBi6i7Ud/NYjRDprxn2YZ15
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
X-MS-Office365-Filtering-Correlation-Id: dd664149-a937-4b71-f3a7-08de33ddb3be
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YXZkcGs2OFZZU2ptWEx5aWliYjZlSHRmTU8wL2RnYys0UWt3dFZmN2xyQzhI?=
 =?utf-8?B?MjA3Z3Z3OWF5SHpVUkFHT0tnSkoyUTdsZXQ4SG9Td1AweFI0M2l4RlVPZ0Ey?=
 =?utf-8?B?YWxlN0dkamI4bGQ2QUlUblFOaVU0WWRNV2l4ZGtSQlBsZlFpWE5nOHJNVkZz?=
 =?utf-8?B?Ujdjd1V4ZHJlZnNNVDQrdHk2YkVVWUFHZzI4WTM3aURmdmZGT1JaZjZsWitw?=
 =?utf-8?B?R2xoQVJQQ2pMcjBqajhUR1Jvc0RUR3FkTlV3NlBzYXc3bVhTdU9ZV3pHRWll?=
 =?utf-8?B?UXA0QU96MTdVOXFGRklBNjFnZUJHYjdFZERkUkZ6U2ZoaTMzbXhhY2ZnWHlS?=
 =?utf-8?B?WURBQjNWb3NHNmpad1FnelRyenVPdjZDR3pJVko4NURtWFNYSVorNUZIL1Qw?=
 =?utf-8?B?RTBIUFUxMks1aVJSU0k4VXFtVHMrMFFWZ2RqOWFNcG9id0c3NXMvWmEvemNS?=
 =?utf-8?B?dkNzWnBLTnM3dnNHa280Nnp6aU9IVkIrZy9OZ2ppS1NYRzZuQ0pCdUlPWURm?=
 =?utf-8?B?ZFVVMk1SZGsreG56Mm5DdjlHeHc0K3JnajgwTGVZMjRleTd0WnFYMDIzQ1RX?=
 =?utf-8?B?cEtvTUprMjB2RDJ0Znh1akV0NGpqZmI3SkhsR00yWXB4VGxmdG1WK2ZocEEw?=
 =?utf-8?B?YjJ6a1R1c0dMVUs0Mk1Wc3prQnY4L2RtWmZFbHZtbmxCOUNVdC9HNTZ5cjc4?=
 =?utf-8?B?dmhraGVGK2ZxaERuUnZUQXBoLytMRXQ5Tk1CV20rK1ZiVzNYVFFaK2xPMW9L?=
 =?utf-8?B?L21vU3B0bEJZTStNWEV3d2FmNG1vMmtJeURnK0RibXZDSEFuRXkwOHZVck1D?=
 =?utf-8?B?bFUwa2NkWTB4cW9xbWZZYlpuVHMrZU9NUklpUVNEMVNGek9NR2ROYzNaV2JT?=
 =?utf-8?B?OU11ZGlpSDA0dnhpalozRHloZzl5RXlFWmc5NHl6NEZIM0tTN0FLb0dwdmJz?=
 =?utf-8?B?UHcraWM4N3gySHJNLzQ3djM1a21WbXVUU0ZrcFUrWjdSSHB0NXVXSmMvQ01S?=
 =?utf-8?B?d0VObmZ4c21Hd0JDTUc0WjRaV2padis4cUNvSThrWmJLODhNRjNkcUJxalBs?=
 =?utf-8?B?UkQySVo4Yk9KaVNOdmpwOGlGRzFPWjhHM29PaHJMZyt5MHJ0MHpjMW00bEJW?=
 =?utf-8?B?d2lHeWhJU1ZYWEdVYlhZREdCRExTTVJNQWRLem1JN0IvUXlZd2k0Q3Ird01M?=
 =?utf-8?B?UE1rZTNZdWNuUk5YWWFaL3p5c0R0L2srMmU5alFuREltWjkrNEl4Y0N4Nmt3?=
 =?utf-8?B?SlF3QVZzMWc5WFhWSXh4SmdQOGFlN0dpbkVhY0tZbEFzOFE5clVqZFBmOEZv?=
 =?utf-8?B?TDR2dmRrZFhHenJ6UEpvK0Fkbkw5RENlb044UFRjdHJ5eFlhSkhnMG1Nb042?=
 =?utf-8?B?K0RhZHZJQ084TnBhQmREM3ZzQ3FlK2NuTjdxb0VWWWpyQTFqVnNGQWI5TlAw?=
 =?utf-8?B?ek5aNEVvVXhHQzczdjUzWVVabWQ0ekVrR3ptZVZuRzIyU01OY2dHREdYZTBD?=
 =?utf-8?B?NzEvb3dFalVEcXd3ZnpRcVEzSmorTGhHdnZsNUJCaGdpS2lKUlYvMkl4UjVO?=
 =?utf-8?B?SHJDM3BnNXN6dWVYdXBpbXI0N0Z4RFRXd2xOUmlzSDI5d0krU2FGbFFWZUho?=
 =?utf-8?B?c1cvbkZWYWd2SHIvVGVPaTJCL0J3OEtvdjc5OWpxdzBXdWtOR2Y1VU1tK3BG?=
 =?utf-8?B?S2M1M01DTXpZV01EYUpvcTBhbzZYb2tYZW54b2JsaTVONWo2anFXQi9rZTdK?=
 =?utf-8?B?ZzE3UHM1emxIR1ZjYXg3N3ZjdGVVdERzMFUyaUU3Zy8xWmM3TXZmWno0VHpY?=
 =?utf-8?B?c2tkQmpabkR3MU5vdGE2NHBnZHdNZ2xqSS93eDJaUVZKaFRDWWVzZmc5Smtn?=
 =?utf-8?B?R0dQWTlwZVFxWmM2Rnk2M2hlK3V3L2kzNkJxLzFsQmh5YXpUVUdhU1FoUWZV?=
 =?utf-8?B?dFRQdnRlYW8zbGpNUGpFL1Y4Y2MxUkhzcnZybFhFRXR4WDJ3eDZNdGphTTJE?=
 =?utf-8?B?TW5ERVIxTDhTMHhERVhQSk9RUmh1RFI2ajdzMWsyZHVEU0FSMFJJdHlvbTN6?=
 =?utf-8?B?QWVPOEVuN2FxSEx4YUJVNEo5dHA2eDBOVS9Zdz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c0dla0ZNWnZKSWZNOEN6Ky9jTGxNSTdzSlZGNkRHZUJZTWRZRFR4VDZ5YXhO?=
 =?utf-8?B?QkxFSzJSdlI2R21OM09FdDBxSWpGZmxTc0tpbFhnVFN2MUREbGlMcFJUaG83?=
 =?utf-8?B?bzJTbmJrQzI2STZFVW96UFlhMVE2VlJPcU9yQjRsWno4bTY0TWVkenhoMkt0?=
 =?utf-8?B?QmsyVXo2Y3FocFVtc0lLeHNRcHJJS0l5cHE3MUVtQlRHMkJSVlFFN2FHZ2k5?=
 =?utf-8?B?T1N2THRYY2FBR051VVhDazJLakl1QUdXcVUyQzUzWWFvZTRYaGQ4REVYTVJk?=
 =?utf-8?B?SDZmS1NMRzRhbTJiYjkxNEVXOFdTclRZdkZEcnNkdmt3S1AvOVNTWTZic0dS?=
 =?utf-8?B?QVlKMlU2cTYwdWdwMlA4RmxubmtTcWxyNnFIN3VsakhPUWJublFOSzl1UlY4?=
 =?utf-8?B?QWdYdE8zR2NKT1FZakMxaDhTZDdkc3Vmd1gvZWZPNzBGR3R4dmhMck1YNE9S?=
 =?utf-8?B?Y01HcjFkNkhuWWFJTVhydHUvY29QY3RGUnhMbFpGOEJYNnpzaUM0ODlHaTJM?=
 =?utf-8?B?TWszNVljSEgxK2t1d3lMd3NqL3habFFWd2t0eFMvZ3dqT0MxSXBGVzRHSS9U?=
 =?utf-8?B?VTRBd3FSaHUzZUlmQXFxL20rZ0d3ZWQ4V3UyR3ZkdHpyTnM4VWwwaVRPR0Zl?=
 =?utf-8?B?OUJkSzY0a0EzcW1JRHB0azFaRkkrczNlMDV1UG5Nb0FLZWN1V0RjSTg4VTJu?=
 =?utf-8?B?MXlzZE5CcytOZ1dhRUZsbnhEVzFYRzlWcUllZUl6WHRMdGJHNUtiR0E5MWpU?=
 =?utf-8?B?QWNLdUVOWWRVNWdPK2dQZ0ZmcGxyWTRWZnBEaGFBY203MU02YURNSnNJdDdu?=
 =?utf-8?B?aHA3Z2lLMFRnT0R0c2Fyd3FMaE5ONUplSDUwSjRYYXVEREY1U0lwK0JEVzRW?=
 =?utf-8?B?Yld5alNMdUM0VjNRV0paWC8rQnBwYUxrWUREM2pxQ1FCRG5KejBkZUh5b0hX?=
 =?utf-8?B?UFhaOEJETFhWUTZZTkRzSXlUb3hCNk9mMFp1eEFYWDhvcktCMjd4SHNKZUI1?=
 =?utf-8?B?NFB1OTRPVEV1bUpDTi9XQ0dLZU9TUDI4KzBoblhlZ1JRUThsekxJYnl1bnJJ?=
 =?utf-8?B?ekxVZTVyM2hBa3J4WjJxVGdrbEtHdlRvTUlZelVwQnd1dndYVHZaOTNCRElE?=
 =?utf-8?B?M0NwK0pPditodUJTSWFtaDhQSzBqaytkdTZMUGtnKzR1Qm1NQk1qenVTVUky?=
 =?utf-8?B?VVVSVk5xYXh2MEIxOFdwUW9lTkxiZEpnY2Jac0F6Y1MwUjV6bjlxdEV1U0Rp?=
 =?utf-8?B?ZWErU3c4cXpKWndSNzkrTENkVzMxekhoZElyUlc3VGVEQ3ZraVJlU1E4b0NK?=
 =?utf-8?B?L2VmelJNNmtDZHg5TFh1UnFlRkpOTVdaUyt3aXRnNk9abjJDazNTR2Z6ZXFR?=
 =?utf-8?B?VklGSnJJeGZRNXFsZ2xEcEpYd3R2S2JTenNwTEErNW1xMXJobk1LZWMxZlRk?=
 =?utf-8?B?S2FYN3dmSVltdnFYR1AzdVVLRWFQQ2NCTk5QQy9UOFU4U0cxZlZIa0k2ZTF2?=
 =?utf-8?B?cDJRUGtWcXNPVzVyM1ZJMmRldHdQSjZOakJIT1dPODM4T1dTNldKc25PbXZU?=
 =?utf-8?B?V2pXOFFYTXN2YlY0Y0s1bFZPdmlOK3g1RUlOcklldkNXRklSTHZvcDhtSVh5?=
 =?utf-8?B?TjFSRkNpMFhJMlQrekppSmgzMEJGRDFURld0VjZ3SEc5eGpxWTFLZlg1NTR1?=
 =?utf-8?B?R05Sbm0vUlNJeEgybS9JZ1dTc2JndUo0YlRXdytrQktvL0FJUGRKVHdtSmp4?=
 =?utf-8?B?MnJPQUJZaTVvRFdaR0NZME5lMkduWnl3RWRMMWkvKzFpY1FjNUVWV2FYSnRM?=
 =?utf-8?B?SkJETCtzcE41Z2Y5cDdvMGo3b3hlenJRUlgxYkJlamV3WEVycllvL2UrK1By?=
 =?utf-8?B?L2FDbklPeHE3eXlvL3k1cXZqUzZEdUxRY0RGeGUxT0dWSFBnVmtaR24wZmd0?=
 =?utf-8?B?cnludjRzeXlxa25ZRUovQ3ZSYnpmS2U1VVB4Tm5EclN2bVh0bTl1L3hocytO?=
 =?utf-8?B?dTNSaWxKN0dmWE1SUnRQZnBUYmZFSnZ6dzd6a1JiYlovVGl3eUZxWXFJSG82?=
 =?utf-8?B?VDA5RDl0TWNqNEJnRkJ5Z29meklOSmd3bWVaVjVtVTR1cDgrby9kRmxyM1Nz?=
 =?utf-8?Q?9cpMUnSzH9BHsvkFCEzyBrqCw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd664149-a937-4b71-f3a7-08de33ddb3be
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:07:23.1707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TlmpOjfz9SXfJLBdsPnFmDHYTpEvmEnJQ4dxqq900sC/DS57OYQmq9aJMUd+22eOgQDLgZJgM/QN0ODedMm2nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11042

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Call reset_control_deassert() to explicitly release reset to make sure
reset bits are cleared since platform like i.MX8ULP can't clear reset
bits automatically.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 0e3a41cd35edfefc51b5631e2c36fd76e3e14d83..0ede273f7ff82f288404316c9fd7f1e751e169c5 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -338,18 +338,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 {
 	int ret;
 
-	/*
-	 * these are most likely self-clearing reset bits. to make it
-	 * more clear, the reset-imx7 driver should implement the
-	 * .reset() operation.
-	 */
 	ret = reset_control_assert(state->rst);
 	if (ret < 0) {
 		dev_err(state->dev, "Failed to assert resets: %d\n", ret);
 		return ret;
 	}
 
-	return 0;
+	/* Explicitly release reset to make sure reset bits are cleared. */
+	return reset_control_deassert(state->rst);
 }
 
 static void imx8mq_mipi_csi_set_params(struct csi_state *state)

-- 
2.34.1


