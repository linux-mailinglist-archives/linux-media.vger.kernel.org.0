Return-Path: <linux-media+bounces-40997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C498B33C41
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51942483FA7
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 10:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32122DAFA2;
	Mon, 25 Aug 2025 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c7P8ctl5"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D432D9EF3;
	Mon, 25 Aug 2025 10:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116648; cv=fail; b=EP7HFE9cJJrbOypGMrJ/B7WyRdKGkQI0OfK1DZyfPZAbnyQIEcIsPKBHJtrXKoaf8im5MpZdh88GCoM5/2VN/NFLOfO100CxSxlUW4egeHaHHtkwoMUdVztoO+PIRfZoX8nKnlcIvu+zLxgBcujuCAaa4/P7cgoAtqqpXsUW7Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116648; c=relaxed/simple;
	bh=0AVVXE+OjkLsObQx7EyYcQBVkLrBIL95byUmMC9N880=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Mmqt/EmGya515FU/ZUfEhrnLE6FCyBGzJsQWfXzmRTXu4euM9ctvqY5kjeLmM/wA/FMO1SfCu19U5t+LVfTUEKVfQV++sVNrVtR97GaAEukEqujTE27ZAbMhG2Xva6FmlS5sGAZCL0l2HX1lRrFrUDgHZ2PuQvrkEJPimJOqvas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c7P8ctl5; arc=fail smtp.client-ip=52.101.65.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wb5GvfbxU3zM16xydPds43yDiVuzSqEQa89iUBpHC6Ketd4kRso8T6Lm9RO4nLhZDgvzuuk4Ufx0pABvi9NY2fSOEz2CHCqCuT4sLif5nZ+N/sBLdwvcDkPTt0HBbHN7VScPfKsQ9Ow24uur6zWCkhU6o4Mv9SmS8mJfg6QMmX8pRazHERVatIVakgbIUMN7rn0ixL1dk9yI7Uvzt9IA6yZbo9PT8J4QovHdVRuJFeql/CxMSne1sh54c+AN/WY2vvkiyFusSnWsf1KjNfoWvcx1TDMrkLjU39kVUOa+6E1MxVr383w6ZkABWcx64ppiBIC5rfxR20lBQQToE+Caig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqW3lbwFPdW7MMz6SF+YFhWAktKZtv7wW9Sr40tBYeU=;
 b=VOaQsHtDX6RC+p6/JwaDAMnydMh5tf/N1loyeHym8I/nhI2160tu0d2fSBoPW5WrFtP1Y6wxwFJO/6J5xI5RNJ9D+4zzYE5Bb43IUzKLTjhZY7W2OCpIDcBnzjdxhXIiIH2jtseyUNaRzGmlBIXiEnX25wxUKlHZGos9MhECv6LUy/omhYUH2CpZMEAErIoZqxZ7Gwdmg7h56VqzGEhFlMzOpEUiNq3vwkMZa71Nay4+RbN8C7MA+5Uu1LcuPdjWSJ78q1zuUkgCe+xO8mUCyenLkM2YwK2gJO3ZYH3wpGqhqiwYhRA4kD26IeIBp5OnEO/aSO7NXrGQhQj4H/ay9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqW3lbwFPdW7MMz6SF+YFhWAktKZtv7wW9Sr40tBYeU=;
 b=c7P8ctl5vMvw2Db6L+e/JoZHe+E7Al5RXNltXbkC1wfXyKImPgFeLkgICLau99yE7E5W8Ubq1jKA66cWDoD4allhdMIi8F2FmmUjRCHdAronuJjgi4Kim4aCrk9LVIZip07Rxv2Zv6Zk3lq0Y3WC5XdsI2mHNwAF7ACK/6+42/du9v53C2zq0c+Q4iTBa5wIS3EdJt1s5zlh+aVhOX7PDNWvnPjh/WajOKV6h1chkFPAuZ+BJcgCfyip/tTeiQekEDk/A5Zxnj8f0OHfK5DpNsUpS/yKrYu4w/b/D5gao5aWy75nzNCVc3DXL/M8YpbqpnCQZmv/M9OdNv9HrWRb7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10639.eurprd04.prod.outlook.com (2603:10a6:800:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Mon, 25 Aug
 2025 10:10:43 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Mon, 25 Aug 2025
 10:10:43 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Mon, 25 Aug 2025 18:10:11 +0800
Subject: [PATCH v3 2/4] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-csi2_imx8ulp-v3-2-35885aba62bc@nxp.com>
References: <20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com>
In-Reply-To: <20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756116629; l=3924;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=0AVVXE+OjkLsObQx7EyYcQBVkLrBIL95byUmMC9N880=;
 b=Z++TGhOCCoQelF9YZCHQ69AYMLGXamStD78TzWkugibIVPcRNF3ipSRkM+yROjgEi4KXsssUD
 vMrLMrDAkfZC4+//jeIj8sV+M0ggX6156djXPdtlMWjZHehu93jJK8l
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0105.apcprd02.prod.outlook.com
 (2603:1096:4:92::21) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI0PR04MB10639:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f5fb35-9976-4129-35cb-08dde3bfa6ac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QjlDVEQwMnFWYjdrTWkxdXJNamVMTUZWNTl3Qm1pd0tjYnRjSHloYndnQ2kw?=
 =?utf-8?B?dldvOGV0OGFVSjhiMG1Dc1hGb0ppMjdwNFVUYytCdkFPYmZ1aG5aVzhNMU9n?=
 =?utf-8?B?V0lCejBSOTBPSlM2b3pKaDI2aVI5b2dLVnBDVDRzTjcxMXRrcUIzYjZSQU0x?=
 =?utf-8?B?YThDSVdRSjRkV3BuaS8rVC9NUHg5WXZtdUZqUktSM2poL0VEaVEwcnMzV0Y1?=
 =?utf-8?B?OFJtUktnSVAyV3Rlc3FhdmpncEZlQlhIUnVMeElReHhaSC9xbG9aOXUweUJr?=
 =?utf-8?B?TkU2SzBRcWpLSGJGT2t6NzVXTGhkNWk2dm5rcXB5NFlXK3NqL3ovcXVBd1FQ?=
 =?utf-8?B?UktSWnUxbSs0NmhwM0xZZlhNWUZIQmVSdE9MRlV5ZG02enpxRzBGaVVBWlpG?=
 =?utf-8?B?cFRBRG41d1BBeHh6SFNVcUVJSG1RR1QxNnY3VnlwQWs0ckQvbkhNNDlHTUlG?=
 =?utf-8?B?NTY0SkZRK0RraUlTRlRrSkVQdkxlS05MUWhaZitPUmlQdjc5TFhjYlowSExI?=
 =?utf-8?B?OUtvUkg2QjNZK0hpWHZUYzV1V2k3U2kzbkhvRmNWT3puZDQzd25uVVZGZ0o2?=
 =?utf-8?B?ZDV3SmVJa2lHMUR3THJJdDBkUTlLd2x1Z2tHZlBQT2poclhBM3FHZ08wZ2FC?=
 =?utf-8?B?cHZDZWJUUWJPaXhsUlJhWjFxOGdBWVVrYmdya2ZLaEdDWWF6ZVlaOUtPS1I5?=
 =?utf-8?B?R3FrUldHenNPcHdQcUtTcDhJdWNORnFmclJtQWRWQXQxa2dnbjlQTE95dTVl?=
 =?utf-8?B?NytWcTN4NytVS0xtdmRyTkovTlBrcFloK0V6dEJJdnl1eUZ0WnJFbkV1OXpX?=
 =?utf-8?B?TTdkMWJtTnZDTXVMQU11eXNWTXVrY2xNOU1YN29pWDJYRUNyM3hNck9yTSt1?=
 =?utf-8?B?MWVHcjdRY2pHKzdUSVd3ZElLMDBpWElpeDRnZk1wY2t1NU9IL05rY1JtNHZK?=
 =?utf-8?B?b3BqMkJHbURTandJODdKTzE0N2JNZXZDdGRYZC9GeG1rbEZSeFlrK2laeXor?=
 =?utf-8?B?NlBUYnNKN2dWdU5ORDBWTG5XNmxlYTJFT3BGTmIwZXRrNGY5aTNrV3o5Y3VE?=
 =?utf-8?B?d1RuWHhhZjMxc3JmUUtNeU8vY1FWS3czOEtaZUZBL3g4U2JvSGlFaTA2dys3?=
 =?utf-8?B?MXNwR3B0UnFGZjgwbGd4L1dhK09vRlFpMWRCWUM1WXhBczc0ZXlwaWQxbmY5?=
 =?utf-8?B?SlZxTDgrOVlOOVd4Wmk0bSthbmp0eXdqTWE2UlV4ODhzMlFtTDJ3RWNaRzdE?=
 =?utf-8?B?Q3V5Zjl2RFpjbEpDU2M4L293MFd3NWlaT3JnT0ZzU1QvN0JMMVN4Q2ZhWEhj?=
 =?utf-8?B?TVN4cElTVlNzY1l3S1dEbUFwZ09uTHVDZitoNXZxVkxzR2FhYjZJUkNEd0Mw?=
 =?utf-8?B?dnpJbHRoWEQreDdCaDhHUDBjZ3pjVDJuZ0tsWEYzaUtWQ2NVdWo3MkR2RENn?=
 =?utf-8?B?bWRDdDlYLzR2STlLamdEd2RpVTJHWTZNSWErWENDbDBiM0NwYUVlUnlITXNH?=
 =?utf-8?B?K3lJS2JTczJNUitKUG42S2t5VVd0NnpjZFhxMy81dU50UnNTd0tCa2VMb05N?=
 =?utf-8?B?VDB6VWpxVkhGaVVrSldOWDN0Uko2Q0ptK1B1S1NoRkQydTV2TXpBSEQveTFV?=
 =?utf-8?B?cEtlRFJhQ1EyS3FPeVhDOE95cTB6NUQySEF4VFZwRk1iZkVjaDJ4dmsrbHBI?=
 =?utf-8?B?eXprZjVJSnV6NHRQU1FmcXRFdzBKdUk5Y0QxUE9Fc29aR3Z0Mm1rWS9Bb1lm?=
 =?utf-8?B?dVdxeFp3M2VDdE5NK0RsSm84V1RzNFFWc2Vhai9UYjZ6MU1PcDdaOElXc0FM?=
 =?utf-8?B?OTFVaDVZeDJXT01seURIWkluaFByQzlEM1d6UytIQ0JUMXdSc1FvNGxmd0k4?=
 =?utf-8?B?aW8wdEh2Q2dFeHIrK1hkcktvTUk4dHZwT2s1WUtXZU5WQ1drMkV5Q3A4OUJw?=
 =?utf-8?B?cDcxTUp1N2dOTm50YUpScnBsYys3TS9rZis0MGxGMnJSSGhuY29QcXlyQ3dS?=
 =?utf-8?Q?ntqXmJKfWOQzWNDqTJvIIhORIFLJzQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?T09jcHJ3VFNOZit3RmVVbDZFOGYyQWg3NURGZjF4RmtZQ1RiWE4wQWtiY3lG?=
 =?utf-8?B?OC9KU1o1Z1VqSGJqdTJTN0d3OTVJNG5EZkxMRVNlOWlneFB0VFk4WjVwRVNY?=
 =?utf-8?B?TjVJVGY3MXJtakZtOWVNQWkrZngzajFaOXpGV1hBRUxIQ29oUDh3RWV3eEtF?=
 =?utf-8?B?YzJVektCYzVNaDlVaTh1bm84Yk13amc1bFlPLzZEY3piR08yV3Fwb3QxOFdL?=
 =?utf-8?B?dlJOOSt2bnViaFNKTlNZZEtDUGVoMzVrNkdJb3lZSFByRHNleHN6aWdxUlZm?=
 =?utf-8?B?MCtSeGt5ZnVpWmJrRFhjbWFrUVhtMnNxa3FYSkZaQ3BoUmxXQVNhdGlMdVFo?=
 =?utf-8?B?bHRWRWpuRzJCeEMvajZVK3UxZjZ6UDMrVjJ6Q2RTcFBMaGpmdXBGVzdnazhx?=
 =?utf-8?B?MXhjR0gzT1Y5cCt6SDRpVVFHeVRod2RBc0pqanZQYzR5YVlTcUJ3RXpEQkpT?=
 =?utf-8?B?S2l3NnFNVDgzcnhwK0MwZ0Y0b2VLR29RNGQyL2JlbldrS25NRHlFMEd6eUtI?=
 =?utf-8?B?YkZOcFl6eFptNVI3Q2U3NzJGbmFnMGxqdGRVTmV6ZFB6ZW5JMHJYNHhnMXVG?=
 =?utf-8?B?bEVjOWhFbS9lcU1VYUcrS3VwN0tvVVlrZ21Idit0YmZnNlcyOS9qQTBvYTdr?=
 =?utf-8?B?VG1VbkJpVlBsYjZZMHBvbU9ldTZZdmQyamZXc0pVam1yS0JPNlhJandYelpn?=
 =?utf-8?B?UWIwUjEwd1RGNThOOFQ0N3hsL2g1WkRmdnlRNC8zLzhQOTRGYTluVUpwcTAw?=
 =?utf-8?B?c1llOUVUSVNPUzZjUHdJN0pqUDhIeWhEYW9Nd3hBSjAwSFhJbFR0dVZMeFJL?=
 =?utf-8?B?Um9tZDJXN2xZdmZmRWorMG1BbWhJdVpxeUVscCszL3plRzR4VldSU0tVMGs2?=
 =?utf-8?B?V3VISDhqL1JmSGVTTXdJVHB6N0FRdDhWMmtKMzhRSzgzbTJ1cjJsUk1yWWtj?=
 =?utf-8?B?VzF0U3J1aGpGLy9pdytsYW1McEF1dEpzMWJ0VHljd0VZN1RaMFM4ZHkzMW5L?=
 =?utf-8?B?YTI3S3plblEwOFlORVBuUDdNVldvRHVXQ29XeEx4TUx3SmJXYk05OTRmUTJV?=
 =?utf-8?B?Tm9uQzQwMU0xblpqV0RWRzh5dWtIRGhpRVhNMjc2MGJuUjlaMThxOUxPVmZi?=
 =?utf-8?B?WTYrRVFrdVgzMGlZb2szWWY5RWxTTjJPQlRDZnd5TDFrRjhJVnBUZUFsUy9L?=
 =?utf-8?B?UEhpSHNOKzJ6cHprclRXazdLU0Z2ang3SEFtM01Nc2czUVN5Z2ZSMEhyRWlO?=
 =?utf-8?B?TGdQM3Btd0xmWGNsekxYaW5BcEVMUXZZMXpxcU0xNCt0dTVhOFNEUnBFQnhw?=
 =?utf-8?B?UXJiRmN0RWVFcVBSZlJOcm1RNUdZNW45eTZFNzNkNTdmZVlkVy9YdDFMVEM2?=
 =?utf-8?B?bjZBU0FpaGhMblpicVl4TFFSeUpsaVlXeDV1cHlrVlk3Qk1rcFNYZlF3NkI5?=
 =?utf-8?B?eXlOa0FFSW51TUszd1NtZHhkUC84SW0vOUVxVGRHZi9oSExQc2dvcnZyaUJG?=
 =?utf-8?B?Q0VuVGdLT1lINnFmZW0xT21VUFAxYmZ3b1B1ZVV1QlByUDNpQ01OcGNOVDRn?=
 =?utf-8?B?LzYrN0ROcHFwb2tObWlOMEZPQXo4TDZXRUNFVDA3eElHWVJMcU9odlVvOGdq?=
 =?utf-8?B?ZDM5US9JbzhpTnYySWhEUFdOM2MyY1p1dkYvYnZ5RExSWkVOaGVMYWR1QVJz?=
 =?utf-8?B?Y2tITCsyRHdzcEQ0amRrRitHZ1NHK016Q0JNU3dzNkN2bFkwR2RTaEh5NldF?=
 =?utf-8?B?YVVKUXV0dVBsdFFuYis0ckhydE1lb1ZKS1FvbWREcUJacTdHUFFNaWttVTQ2?=
 =?utf-8?B?OGViU25CaUoxcnl5WW8yWGdXMVB2TFQ0MDF4K3RNV1kyMGFhbGQ3YXN6UVVw?=
 =?utf-8?B?RUNoWEw5d3hzMHdiL29vRHFZekNOM2lzL01pMm1BQjBiZ3BORkxrQ1h6UVJM?=
 =?utf-8?B?UUVnM2tJakowZlRVeExQb29qSm51RWk5c2d3cVRueUd3MTgxamRiNG1oVjNW?=
 =?utf-8?B?elFNMUxzL2Uyc2FNeDNxWkVqbEVxTmhBMzl6bEJiWVJKaEJjaXdZRlVLVGU4?=
 =?utf-8?B?V3NzZnZHMDRlZnhkbVFINmMycWNUckFnWk9yR3FlMXhmcXhJZ3NIRHh1ekZZ?=
 =?utf-8?Q?ZZ6lQQzh8KU7zj7hM9SRTzj53?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f5fb35-9976-4129-35cb-08dde3bfa6ac
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 10:10:43.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjtkDqU4UB5rxnf6WCcbgWEYyHz7SzxPhdprO6eV/FCBiT4Faljcb9SZ6JnmkTNQtsqPDJlP9b1R4TZgBVixxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10639

Use devm_clk_bulk_get_all() helper to simplify clock handle code.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 52 ++++++++-------------------
 1 file changed, 15 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..2bf11984690af2e687a3217e465697333d9d995d 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -71,21 +71,6 @@ enum {
 	ST_SUSPENDED	= 4,
 };
 
-enum imx8mq_mipi_csi_clk {
-	CSI2_CLK_CORE,
-	CSI2_CLK_ESC,
-	CSI2_CLK_UI,
-	CSI2_NUM_CLKS,
-};
-
-static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
-	[CSI2_CLK_CORE] = "core",
-	[CSI2_CLK_ESC] = "esc",
-	[CSI2_CLK_UI] = "ui",
-};
-
-#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
-
 struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
@@ -111,7 +96,8 @@ struct csi_state {
 	struct device *dev;
 	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
-	struct clk_bulk_data clks[CSI2_NUM_CLKS];
+	struct clk_bulk_data *clks;
+	int num_clks;
 	struct reset_control *rst;
 	struct regulator *mipi_phy_regulator;
 
@@ -384,24 +370,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
 			      CSI2RX_SEND_LEVEL);
 }
 
-static int imx8mq_mipi_csi_clk_enable(struct csi_state *state)
-{
-	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
-}
-
-static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
+static struct clk *find_esc_clk(struct csi_state *state)
 {
-	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
-}
-
-static int imx8mq_mipi_csi_clk_get(struct csi_state *state)
-{
-	unsigned int i;
+	int i;
 
-	for (i = 0; i < CSI2_NUM_CLKS; i++)
-		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
+	for (i = 0; i < state->num_clks; i++) {
+		if (!strcmp(state->clks[i].id, "esc"))
+			return state->clks[i].clk;
+	}
 
-	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
+	return NULL;
 }
 
 static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
@@ -456,7 +434,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 	 * documentation recommends picking a value away from the boundaries.
 	 * Let's pick the average.
 	 */
-	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
+	esc_clk_rate = clk_get_rate(find_esc_clk(state));
 	if (!esc_clk_rate) {
 		dev_err(state->dev, "Could not get esc clock rate.\n");
 		return -EINVAL;
@@ -783,7 +761,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
 
 	if (state->state & ST_POWERED) {
 		imx8mq_mipi_csi_stop_stream(state);
-		imx8mq_mipi_csi_clk_disable(state);
+		clk_bulk_disable_unprepare(state->num_clks, state->clks);
 		state->state &= ~ST_POWERED;
 	}
 
@@ -801,7 +779,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 
 	if (!(state->state & ST_POWERED)) {
 		state->state |= ST_POWERED;
-		ret = imx8mq_mipi_csi_clk_enable(state);
+		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
 	}
 	if (state->state & ST_STREAMING) {
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
@@ -1027,9 +1005,9 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	if (IS_ERR(state->regs))
 		return PTR_ERR(state->regs);
 
-	ret = imx8mq_mipi_csi_clk_get(state);
-	if (ret < 0)
-		return ret;
+	state->num_clks = devm_clk_bulk_get_all(dev, &state->clks);
+	if (state->num_clks < 0)
+		return dev_err_probe(dev, state->num_clks, "Failed to get clocks\n");
 
 	platform_set_drvdata(pdev, &state->sd);
 

-- 
2.34.1


