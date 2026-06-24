Return-Path: <linux-media+bounces-65595-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n/TBOBRCPGomlwgAu9opvQ
	(envelope-from <linux-media+bounces-65595-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:46:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAB76C1406
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:46:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=cZh9nnPS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65595-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65595-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F69D310C7DC
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 20:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CEA3E4502;
	Wed, 24 Jun 2026 20:39:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342583E44F2;
	Wed, 24 Jun 2026 20:39:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333586; cv=fail; b=IdXtlDYn3dasYdXzNjHPPqMD5dfuVigaVdTiIwlMUuRnunuB3/vtqIz4Ln8dPZ1kw2dDh4GcnkxTjRRdsa8rMNXEZq3LB8hqb/fZNSs6Kz65yOtnkDSIJcQevM8j/vLGILrgbp+5j7jxGi1ZToAvdF10M+/HMgliR6eiJPUL4tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333586; c=relaxed/simple;
	bh=fetwR4qU95n1Hwa4uNHskR4TH74JWbCbvNllnxzbEm0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=f5/mNFrdEg/6wkixLy18FkC19niTr9z54ldJhfqPLaoqG2CZSH8PQfJw59Xs//LtgqD5vOudvRJZQQ99EUlvqXC6uUBASfVNH0POzaEKrGQQED5+r70hKn3HdCRdfm7mu2tFKxgNWY4aL1HLNKTcC23CWZ/dgGJ2o0E4Enupllw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cZh9nnPS; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RO4teuAgo1dO/mTNY76V1d12mbWrhpQpHbqDkjpwIubiU0udt+11Jbsc+XTQMvNrd3xk3WAieiHialOCn1mqCIfmCEuVmoLMUn3hZzduBszyY8nhkQN/yqdEImYRtUHfEdwl1V5CByVh2ucj50Zo/ySB51AJa4HQJKxrhpLGZa0GoLAXu5drbSb6O7zyf7l0GkKBbrgsoVV9Zpj3/1XMi3jJuO2ZBJK5LLCwhcynKmmXFzcRPSWq5iF5PzgaEyTtATtYfVYgTMkeuYxe9m6n+Xpvt+JFlYMDDmYESCYjGs7HdItCzknD14qRC6QCa3wuq9Po0byAolAAN4R+0YirvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5RzDLcg9SzuvraTEJ4WcBTZ0z2fpi5B5N918YQTxXc=;
 b=vTHhPj+p4jzmMjTyctXWfnZHbdUsSaKlWJKIP9R9MEnRLE6Hlm4tReVHAhQJEKIZNCFQbfzSmNNFaKc1pLFt9PHMls3Yg8yA8jXkhAubE17NNS/lqvq8+HTw6R6MmYjY1YmDEGC+S9FEZG0Dkkdb7q4szIeBZlbKMZVfAWFg3GIo+DQ2J+P9bbDzKmJmfxGHPxxxYu3EITvSbdzbM7NWIspLlzqxJ0An0HVTWQGQhg3TiYRrD1hiuOzMfnh+xOlQz2PxujmPZa3a/I5LwpKFHeb9eiG7MGhTYrJoL3VW3+SLtx33Kc6NsFMBB6r6KpV1HEVASJSMC1NWKLbwLPVlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5RzDLcg9SzuvraTEJ4WcBTZ0z2fpi5B5N918YQTxXc=;
 b=cZh9nnPS+/EWhYf4YvgkQsZpnW3RgimOyO+QJwW729sgO8dQuYk5Dqs155XwfIhx0pJ9PF6ArC7qQSmGXDZviK3h2ADNQKshibdiqoKRpeHam3t1e4kQYPD5DIlrRMJ5lqiGd/HwEVrZsBPOKxakbcj/DTugjMpFd4kHy7e8u/W2RGSTgfQ76EUuENjbYeCjcuJl8ZcV4G2fjUP0fTb4MXL0ItNrg9VCXmm0T2uPkRpA/x8jIHFctajyQXrx7h+Mgkc5DBSDB+oH5IuzRb3Jgf2kWxou/8lx/QkyV9MsBc8h9+W16LRLZLHx6Gf26nJOhIbsUKLr8/LHTIxFab6pDg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11335.eurprd04.prod.outlook.com (2603:10a6:102:4f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:39:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 20:39:24 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 16:37:56 -0400
Subject: [PATCH v6 9/9] arm64: dts: imx8qxp-mek: add parallel ov5640 camera
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-imx8qxp_pcam-v6-9-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
In-Reply-To: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782333513; l=3871;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=XCScxjH40mm5HPJnDVBLfNqPJ8DhM05RcxXjt0vTDSI=;
 b=7msyitzZ2lEN8TcplOlf2SlTX/EGE/TXJnDwjClyIOUTP8e+PR6K1Uwew2GID0MeBnjuUjSey
 vlST74+iOyBARL0A/oIHYw1w5b+bJZSpFc79aDNOvrGCDkdlePXfgDI
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0179.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11335:EE_
X-MS-Office365-Filtering-Correlation-Id: 40148b63-5d66-42a6-35ab-08ded230ad3a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
 m74opyNDBacLruDfjGfhEhw0mi2pGNpZlIAYPvNJnPTlENvRyKFcVk9+/ZO7gXZKUZ/nQEW28Y1ECcPQzXaNuOplFlhwsc7INq9j5mmoh6mX3/5SBE/gq1CtX92/DXnu93sY0ba5ndCm6kNG2rYrV5sjow7me8DWYK124nSCsyim9JFb73U9KycYyUV7S1sNFTgudih5QfWgeKdkxmZpDdHx0j1jaN7vTl4IeE2er0BlxeucIDBYf62Ibd/SHJ5eSxXb0Zr3M8qU+Yo2hesSABj8oLA30N2YaCG0+To6aWIqzjKMGlkRZXd8o9kzTl1b2hFLoa/QtxIHZajj0Xx8AxMCFwr3Vm0e734VYURNVEo/v4YH1jLlsk4dgC7e2r0cVzffahxDZmovYullvqGRj9drdH00agGhXwb1gY81kMGNs5fvwEfTRRYDAnXe18bXWx5wBAk4go+g5b6W9dxF0y9mzyo3rF3KmnDeidQqNlQ1Xvscejm5PoB/RvsxSU1UDFI7BYn5aFcGZIDrF1GxTe75/jtFp7SaeqegQ+e4HmlorbrxoK1FTrqEY2zCJySQjWoxzRlLpsAqPSP/z94U3V350GTSUSba0QmJVxtNLA9hdFWqhZ24603/+2/4RnqnzOWXghndzTU1Gov1LZ3c47ZMwMgEbZj00MTt+qz9IDwr58eVW7UvARwZck3ue6pDz4elP1Zko+p44QaEvTA7xQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NXRrVDVnTFNreWtWcTIvYzUxYktaMTRkZEJTemErOTlTbzEyNlpQb0QraWNo?=
 =?utf-8?B?d29DeE93VWJCSTRrbVBKZEpSUWt4aVY2dnJHdXYxMkJVcVZ2SkxlcmpTbndk?=
 =?utf-8?B?RW02Q3NjY0tXV0ZCNmxNbHZQZkd3N2VHc04wcFRRamliKzdwcER2Z1l4YkZk?=
 =?utf-8?B?QXJVTXIvcm10ZzJZMU9zVDZ3bVBWT0dha1QrUXYwa0l6dTVBMlhvSjBERXRU?=
 =?utf-8?B?ZXBvbkNleHowbUNOMGUrUnk3MDlOcG1zYjh3YWpjMTV0K29jcXFEZXNZVksr?=
 =?utf-8?B?MHhRdk1sUHB3WFdwTC81U0JHdnpwTzhuZk93NzkrOFcwb1hQQTUrbVRoL2xI?=
 =?utf-8?B?V1ZJbWZMVmxNR3lzdWI3Nk5Udy8zTWgvYkN0RzZwRVZqM1ZKazhXSHlwT1Ba?=
 =?utf-8?B?Wk9WdEM0TDFJQ2JIckdIY3RFSm9zR0RrblZEMzVYRkRCMXZLVEVsdVFWc2ZM?=
 =?utf-8?B?cGU5SXNwd042SFJRUDdkRUJpcGdPUnd4djhOUlI5clhQcy9aV3Jla2NFZThq?=
 =?utf-8?B?YzljeVR2d3VnamQ2bUtVbVdJczRrVk5QUTZxVmFVdjBKRnpzcGdiajRNNFla?=
 =?utf-8?B?R3BNekNNQjlJeTlTMlgzSHU2YWRza1VLVmJyQVEzMThIVm04NjZEYWRwS1VV?=
 =?utf-8?B?K2thSXY1T0EzR3YwazJxWXZzcVVoclZwNTRPdnRUOUNleUxvN3FTbXp2d3hq?=
 =?utf-8?B?RkpkOVoyR3hBQW03eFNoNmRqUGZCdW5BbzZSZW04eGx5bjVtMEFVVHRhMWlD?=
 =?utf-8?B?bEZQYWlsUTZiZS9ob2xuUEpQNXh6M2w4MmhPdmRNUU85MDcwd1ZFOEdtMzBu?=
 =?utf-8?B?NEFBNVQva1lwekRraW1VY2c4azk2QXFiYkR1OFNHQjRuTGdsaHdYZ2hsOVlz?=
 =?utf-8?B?NXlPZFl5OW5Ib0cxNFN6MVFLTUlIYnpxOTVIcXByOUpWaFdxMVZJU0I4ekEw?=
 =?utf-8?B?NGY3eDYySUx1MWtRditpcmlFYnY5UUExOVlVeXZrTXRadWc5YVIwZVkxdG9I?=
 =?utf-8?B?TEYzOGhVTXZMQ1lpNzBkZ2xRbGlqMHVUS0I2djNUZTRrbzRab0JYZEF4ZFVK?=
 =?utf-8?B?bzFxSXlpamhLM3BLV1MzNDJhVVRURXgrWWRVeXNrVDdJNitmUDM2MEVpVHRy?=
 =?utf-8?B?UllMNHVFV1BUczh5TWpQMlI5VjV5VzRBN20ybEt5eS92UDBOZ3FFVmd6N1Z1?=
 =?utf-8?B?cUpyMDBMeUNNTWZ0M0ZicjNwWmQvZnRaa1E4K3J4cytqMS9uOWFCZkRFeTBE?=
 =?utf-8?B?LzIrZ0x5ekgwNmgxZHJXUWIreUZxUnJKcWwvZjIvVVg2SytSQ0I5SHhVSlZ0?=
 =?utf-8?B?VFIrTHdLYk5ITWtxOHRiaFAwWnRaMkNnRnJIZXUxQnFISnVDMlF4YWlLQm1M?=
 =?utf-8?B?TWY0cGJ1Nm4ySWU5SzRJVmNjNG1EaVpRaWY1T3dCMlBLNHNHRjZ2Tm1ZbUR4?=
 =?utf-8?B?ZDNVcFpIbEUvUXlCaEZwMDE0N1VMaGd1WnhUZ0dKM2ZneDc1dDE5dVZUbFhp?=
 =?utf-8?B?U1N6T3pFcVljRnVMMEw1ZGV5WHZZOFc4S3dURUZoN0NRMW02L3RLRnNPM3M1?=
 =?utf-8?B?UjNmdTMzdW5zY1pyenhGNHdkc3JVZ2tzdkhtRkViZTdRN2UybXg3S0tXZFdk?=
 =?utf-8?B?d2RiMHI1bDBHYW9kYTNoQmlIRDRXRm5hZEJBcWx1NWZuelU3bkZNSDNiZWRl?=
 =?utf-8?B?RUdGdng3SUZRS0N4cGR3c3R5SVdtR2dpN1Z5OHBickVndlIrOVZlNkYvN3Ev?=
 =?utf-8?B?TzNBM21rSExlRDgrR1BtOFdDcmxXTXFzOXVDajVmNzJaWVIzRld6Y1ErMGQ1?=
 =?utf-8?B?UEpnRHo5YTN0YXJ3TnUwZm03cngrY3FFTTZOelBsNFFrczR0NFFKSUlpbXBT?=
 =?utf-8?B?L3hLV0tHT3NsUW1ONUQ1TkIzMFFKZThKTTNvcjlhOWRGVlprMGQwdStCQ0dt?=
 =?utf-8?B?OU45Y3k5Ym1QZlNGNmlVWGEwcU1BY2tvUnlNcGg5SFpDQ0NIMUpCRXlsOUMy?=
 =?utf-8?B?ZEd6K1lBSlRRK052WkVLZ3NpM3lwbnJFV1BYcm52Tis3UnJUNzJrOGpxZ3hI?=
 =?utf-8?B?anlMSUc2eWtkRkxCcHdaQThOR3czVkw1RkpablR3UGFVUGxDL2RVdno4MkFL?=
 =?utf-8?B?Z3JwVzlHWW1JWG1OTEp6WDRYQ3oyaVJFdHNkT1lscndTZXZUWURHMzh0WGt1?=
 =?utf-8?B?NFJSMTgvb09yajBvWkY2UHBoM01rcDl0MmtMR2M4d1drQjZjbm5pbWlhOVhU?=
 =?utf-8?B?eXY2V1ZYbVZtUTc1RHBzNHNvOVBxc2NyZHl1WVBIa0JXZkdNZFNlTVRZMGRK?=
 =?utf-8?B?K3JBUW03RjlWSDBHYXBwbzlwZzQ5VThzdTlMcXYyS1ZabWZnTURKWmFXMmxD?=
 =?utf-8?Q?ad7sgdKOsSa9BflEDLl32NLWQ4DygH2FQcaWw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40148b63-5d66-42a6-35ab-08ded230ad3a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:39:24.1360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhitYRgrNY6u/tf1qHd6zNLlGwb/xWMFJvWTlmjfqHAH53gNoanABs4EiutyQvg80kyOvYGRC0+6G6jiiZPzxo7o4TP3zjz3PnFf0oebgxY1HA84bPv4wJgaAfGp7rfN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65595-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EAB76C1406

From: Frank Li <Frank.Li@nxp.com>

Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
it because it can work at two mode: MIPI CSI and parallel mode.

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v6
- add Guoniu's reviewed-by tags

changes in v4
- add hsync-active = <1>

changes in v3
- replace csi with cpi.
- use imx8qxp-mek-ov5640-cpi.dtso since csi use imx8qxp-mek-ov5640-csi.dtso

change in v2
- move ov5640 part to overlay file
- rename to imx8qxp-mek-ov5640-parallel.dtso
- remove data-lanes
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso | 83 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 001ca3a12c0ae..3b9e9844f11ef 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -554,6 +554,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
+imx8qxp-mek-ov5640-cpi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-cpi.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-cpi.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
new file mode 100644
index 0000000000000..9fbdd798f17d6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/pinctrl/pads-imx8qxp.h>
+
+&cm40_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ov5640_pi: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "xclk";
+		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <24000000>;
+		AVDD-supply = <&reg_2v8>;
+		DOVDD-supply = <&reg_1v8>;
+		DVDD-supply = <&reg_1v5>;
+		pinctrl-0 = <&pinctrl_parallel_cpi>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_pi_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+				bus-width = <8>;
+				hsync-active = <1>;
+				pclk-sample = <1>;
+				remote-endpoint = <&parallel_cpi_in>;
+				vsync-active = <0>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_parallel_cpi: parallelcpigrp {
+		fsl,pins = <
+			IMX8QXP_CSI_D00_CI_PI_D02		0xc0000041
+			IMX8QXP_CSI_D01_CI_PI_D03		0xc0000041
+			IMX8QXP_CSI_D02_CI_PI_D04		0xc0000041
+			IMX8QXP_CSI_D03_CI_PI_D05		0xc0000041
+			IMX8QXP_CSI_D04_CI_PI_D06		0xc0000041
+			IMX8QXP_CSI_D05_CI_PI_D07		0xc0000041
+			IMX8QXP_CSI_D06_CI_PI_D08		0xc0000041
+			IMX8QXP_CSI_D07_CI_PI_D09		0xc0000041
+
+			IMX8QXP_CSI_MCLK_CI_PI_MCLK		0xc0000041
+			IMX8QXP_CSI_PCLK_CI_PI_PCLK		0xc0000041
+			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC		0xc0000041
+			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC		0xc0000041
+			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02		0xc0000041
+			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03	0xc0000041
+		>;
+	};
+};
+
+&isi {
+	status = "okay";
+};
+
+&parallel_cpi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			parallel_cpi_in: endpoint {
+				hsync-active = <1>;
+				remote-endpoint = <&ov5640_pi_ep>;
+			};
+		};
+	};
+};

-- 
2.43.0


