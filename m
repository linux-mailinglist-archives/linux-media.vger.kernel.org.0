Return-Path: <linux-media+bounces-40388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B27AFB2DA87
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CFDE1C42031
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790892E4242;
	Wed, 20 Aug 2025 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XcMRKRGC"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1125C2E3AFF;
	Wed, 20 Aug 2025 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687937; cv=fail; b=vF5p+uJV/wnEctu4oaoUhQj6L5ecqyY5RbXE5kK4yNVrwmyY8BT3BpeDBxYqmxCuEXoHAhxckpQwCEbfIlDqJthu82xp+/lUpj2V2PxzWMyamSdsSs61Wr5+lIA2muR7ZVCFDTv686+h4g5RaAVHItGswcM1OhZgTowfpko6UJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687937; c=relaxed/simple;
	bh=t9gt6SDm1mDbs8hysdvPYTibU35QYj/76niZPj8vQR4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PY4Nx7R2v8uaDJkVBDVxyYkWLO772ntuMyGHfkzSjnwXgVe9Phj0AleAp/1AuzRetPMh1Irqpge+uEF2UzXPQ4zithEF2WHpLM77zOAu/KZWiIAnagaJ4H+cq+UulwkKx8Ya3Z9odsbN83b2x1ENRPr6uOl0brI/4qJv23ke6ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XcMRKRGC; arc=fail smtp.client-ip=52.101.69.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJXx37xREo7h/CZCVSnsYRif/A5lLP83tM5B2+79mqfvL6hBFob+xEVLNW8R7InP+XscjQPaA7bBOOt9H5IGkpmRF/M26IarrcfeTQ0qL4FlhxB7Iv8kTQm4q/UjgtDKeOvwZZ8D7I4a9UVh61uVX5lVDJ9rmNVHx3INkBe/D8Vaan7yXn+cJqSOyJFebZIOkpy2PDKoh/4FJ2UGz0yKCI1Hdi9PL6mPXpUOQF93LgPqAqZl5XrKR/xbVx3GxhA1SvJ6IwNOMXqZWQ6sd1C3PzDFmCsUwlJpCnsAiEG/EScUy0UERQZUUrGEmeYDDOFqmp21rr8+0BUSKYWY9nMKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqJzoWlVgdGdAZLdUj5e3TOnWJMqYWZYMwC6Gbfx5/o=;
 b=WxAGQofMG8X1/xjZO7YcSN6grXs2l1lEdJnNvHgR5fCCJ4Z/Nvy+F4Q7Sck9P5l8fUkzGaVrpTpr9rekThe94gS9hWUi5IDmsfq3wYsYXg4jfWeW5QFpn2NKlq0ms16YFZ/nnHIuTukbNbToMa6yhz02QoX8a4Zs89cno8eLlCbXOKA23289x7PVkiNMmyanmz2lgnNtPauKiAQbykY2DuhfBHrXUawSzQA0fUPc55JlABVzovrhIPHBHFDfO38rnhtlQPwhW0ThC6hQE2hHbOCNDhiAHwNPbte8n5IyT28eaoK1yP79L3QKtyWFtrDIwTbuY9vr649crCQyj9UAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqJzoWlVgdGdAZLdUj5e3TOnWJMqYWZYMwC6Gbfx5/o=;
 b=XcMRKRGC3SRgS0BXZ9EtbihRgqLYdN5NnDUZuE8zy0IIiTRWKkKWi7ysMAH+KOnXfNqTWZWvUHqiVQNjP0OqkkRhOwhci9DKzFfX8Sr2bYvDKbamn23aUY3P9yjmGG/CG0ANpybmftCR5O6bog3eyX5S43XrB9xbDtprLW+LhdOIjAWji2EErP/bchPTHpYjNxEKZ0XSUpBFVpGGwMkrwbZWJxBw3XuRebM6CNKTcSO0t3RfOPFI0N9izWzEAchCr7YhzaskPa5kMDU67pXSkJCClVHEnhTXKyPe58CLkLpsynql+xied5J3hf3NMc5TtL1TX/8AfqyvClod8u4jAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10913.eurprd04.prod.outlook.com (2603:10a6:102:484::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 11:05:32 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Wed, 20 Aug 2025
 11:05:32 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 20 Aug 2025 19:04:57 +0800
Subject: [PATCH v5 2/4] media: imx8mq-mipi-csi2: Add output filed in
 csi2_pix_format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-csi2_imx8mq-v5-2-e04a6fc593bd@nxp.com>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
In-Reply-To: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755687914; l=1095;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=t9gt6SDm1mDbs8hysdvPYTibU35QYj/76niZPj8vQR4=;
 b=1cf8I1nLEea4rVhg5k6uVIUQGHKr88Uaee9qSc8KQrvnfOPOiAuQnWLjTFLKDNABDWHv6FpgK
 dZtK4jNzyxpDMcPtMHSIujIfQfVUbo3soYac58KBrKEpaCs+JZq3FtJ
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10913:EE_
X-MS-Office365-Filtering-Correlation-Id: 008fc0fa-b8bd-45c1-3631-08dddfd97ac2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SW1HejdFSkFjT3JZWVZMUGp1Z2E2MW1YZEtXdFVzQWF3ajdlbWQvRzdxSUJF?=
 =?utf-8?B?NVc4NTV4N2lDdGRLQTduZ0FYbXhSR2tLUnRFTDI1N2pNcml5RWpFYUNMeXVy?=
 =?utf-8?B?SEZHU2w1QjllbFJOZmZucC9nZ0tnalkzNC9QUVFMby9DWFd3c2YzNi9JbG9C?=
 =?utf-8?B?cFJmZ204MDZGMnVHMVZpU25qWHJWdEU0eW9GRmJFQWJmTUxmUEJyRzdHWFg4?=
 =?utf-8?B?ekZ6TVpjQ2lVcHRuNkoxbXg0cGhUY3FvQXNuSUVaNWZZUk14d1ptbisreWdZ?=
 =?utf-8?B?RTA2M243UlRaUzNFSUdEMTdiWkdyNGROZ2FDbGRXSVJTQTJ5TCtPc0pNVHlO?=
 =?utf-8?B?QURWUGtPYkVCUC9TejlhdFlyeS85amtGS0N4a0lQb2FNOUJTeml6UXRQTldZ?=
 =?utf-8?B?SHErUHV1SFhiRThxK2htYm1pNFFCZk92a1FKTzIrRmNCQ2xYbmxwQXkrTy9n?=
 =?utf-8?B?eHYzRWlCVjM0MC9RS2NzckV1enpFdTVEUGRsd1EycVBiODhRTjh0L0IxYkJy?=
 =?utf-8?B?clZiRnY1UXJYdDRZSnhSc2VIRjZjV3RHV1dtbER5MnJzbVJPT3RuYmtzMXM3?=
 =?utf-8?B?dkp1WU5ZYU1UNS9VOUU1ZktNOGJmQTBPTFQ2eU5YbXlYSW9MdHp3UzdIOUtP?=
 =?utf-8?B?RlU0NzdObUYxMGdwaHViRG51aHdMVmJURmJKc1FNVi8yeWpweXRKdTdyNzlM?=
 =?utf-8?B?YXNPejJSYWl4ZnV4VWJaaGpyemJiMVZrSGQzTlFDMGFzT3M0elVacHJlM0F6?=
 =?utf-8?B?YzlnMnFEQ1AzSTFxNlBpNS8zQjZteDVxdFlJaXBaTWNQaDFkS0tHdGtKb0Na?=
 =?utf-8?B?aW8wOVJqdlZaQ0djWFVQc1poN0s5RnFJSXJBRkoreTVZemxxUjh1alFoM0lr?=
 =?utf-8?B?OWFDdDVlQ1FYdmY0d2RPQi92ZWdCclE5NGkyV2NyTWhKc21PaG1QWlpLVUEy?=
 =?utf-8?B?ZWlLLzhKbGNmWUx2Mkh4U3JzeEo0YWY1UWJxWTBQV2dvMDNPUEZ4T0tnaVlG?=
 =?utf-8?B?TWt5L3BtS2Z1K2UwZWpVS1JKWGh6QWVzN2krbnQ3MzdCRjZ6aVpYclk1eXlt?=
 =?utf-8?B?RGUvRHYxVmVmeHAxbjFYM1JWYWpHRFNTV0QrclBpZWlUbCtMRi9sWVNpTjdi?=
 =?utf-8?B?NWtOSzkvMC8yTDhPMXlsR0MxRU8zQzdjMitRaURwWTJhaG1mSklXTFVWOXJU?=
 =?utf-8?B?NUtoNlg4NE15eEhtMk8ydi9wdUx3RDQ3MGF5ck43NTlmVVZPUFVBbFM3dzlB?=
 =?utf-8?B?VmFWWVFRUjhjci9aYTg0MWZpT1lGMDJ6L2FyRlRyeVJ1aGVNdllIdk40WDFu?=
 =?utf-8?B?S1NOb3NHeWtvOUNNV1huTEt3LzlVazRUVVAxenBLTjg4dEhFWmJROEJUQUNm?=
 =?utf-8?B?QTVnMXdnQjlFdmowNVJObEJwVTgrc2N6U1NCamkvNjcrN1VhUlZWelpQS3hu?=
 =?utf-8?B?T29ObkFPTmhuYWxvYmZYR2RBSzBIbTVZYWFRVFlqYXdXQWZSZ2NaUTN0RXJG?=
 =?utf-8?B?blhWK0hsVXJOZ20ySFZIM2w2WTFyTWw2ZmtIbUxucG5Oc2c1MktpQ0JtZlZ2?=
 =?utf-8?B?c2pWRFVkVHRZRkJQUW96M0ZoRSt0bnNvTXBqbVJwa3N5YWJGcXlDWklwelBW?=
 =?utf-8?B?UTVaNFlIc0FrNy9aODU1RlpuU2V1R2lGUzhHYVE0OEZvck1vcWhqTTBFOWlY?=
 =?utf-8?B?QlNFRXc3WGVxdFNqVlNoZGRqbGN3REgrbEpCZ0ExUkFxWjA5bG5UVVVQZVJD?=
 =?utf-8?B?T1RoUFoxZlcxRk1pOStra1VUY01NQ00rUzY1YnRJTlRLZ0JKRWZ1SUR5VWw0?=
 =?utf-8?B?TjdWVnpCRWs0TUMybUFPekV2Mk1jbFZHQ2h4NStlSTdqQVpRTFFPMmNMdFk2?=
 =?utf-8?B?QjAzdkRDN3VxdmswQzBwUTR0aGhxTGJTcWtqUUlkWmxQRzAvZ0hYS1VzUHlt?=
 =?utf-8?B?VlZTTGRqenpHRG5YT3Q1YXl3QThTZlUxamJFL2pLajNUUHJCMHdYRUViT2Z1?=
 =?utf-8?Q?DM6idbNlflnOQo+Iw9eVJKDq39ugWI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eWt4aTJvWlFTOG1DeHVuMWkwT3dZU0JrM1VYR1NMZW5lRWdna2wzblRKN3hy?=
 =?utf-8?B?d3BGMzQxbzAyZ3RaaGxZZmxvRk16dVY2dlhnNEpWRDBDQVZKZ2JrbVJlQ3lG?=
 =?utf-8?B?MkRxYUxtNnpGYWpsNHN6UzFPMTNOYUU3TlZWUTJOZDVORi9LRkQ2cFBLVXlm?=
 =?utf-8?B?QjM4NW5mWGZCZlk3ZklPdVI2UG1WczlDSDFpYjNITVN3K01JY2pNMS9pRE4v?=
 =?utf-8?B?RnJKNGVwOG9Fb0pDck1ab3FTS25qNUd3MjU3cnVReUxNaWdEWk1rMDAzL2Fj?=
 =?utf-8?B?cUYyc1ZpOTdrQkpVUVUyR0RDZVc3Q0RiUkFlbmpWUTZjL2ZQNUdvMVIrVVVy?=
 =?utf-8?B?MGVJWmVIWGY5UjNQenIxdFFFdGpKc0RTRUJGMlgwelZNc1BKTDFhUE1DVFNF?=
 =?utf-8?B?Rmd1Z2s2amQ3ZHhHNzNjWUJscEVaYWlURHVScGpDeVd6T0w5WlF6U1hUT08y?=
 =?utf-8?B?NDVrMUNpT1E0MTRTZ3dMaytOTDdhZ3hYTFV2SGkwdWx5QWNxZXBzWHNaL1Z6?=
 =?utf-8?B?UDE3QkFPZ2xEYTQrcXc5UnBqWGZvVkRwTHk5S0s5SnJRamRRRWh3aGphOXVm?=
 =?utf-8?B?Ujh4OUx1bEo3WUJVeXgwRktQZmxoWENPeVY0ZkUvcVhoNW5ERFRrTG5za2dx?=
 =?utf-8?B?MVdwdlVwU1FMVE1BVW0xY0J0Z0RRQVRxRkJGdjNCNG01cld1VkZpbzJ0VWFR?=
 =?utf-8?B?Uy9tWlRhTjdMMmFhMDhreUhxblpjRE5RWEpvMHk0VC9Ec2hqUFVhSGZXRHVo?=
 =?utf-8?B?ODVKZUlURUpMRnJ4U2xIb3Zhc1liUGxrZmgxaTJQNXhvMWc1bVBNNDloQWRJ?=
 =?utf-8?B?YU5aK1JncXV0L3FhbUVkdmt3WGlOYlRaTEtENHlTYmhDaDhzcXYzV1d2dzJP?=
 =?utf-8?B?WlVZUTVkWm9tVGQvMkNmNXRaNlZ2bm8wYWU3NE1xbVREdWdUZFVpT2FEM1ZZ?=
 =?utf-8?B?UEFMN3IrQXpIY1FRK2RndUFVeWxxY25XL3lMUmVUaWVpdUx1Y0tQUmV1dm95?=
 =?utf-8?B?cDJCR3NiL2RYNkhQdUl5VUJYQmVTajk2U2V4cUcwdkZLbUQ2d3JIa2kxbWpo?=
 =?utf-8?B?Sm5la2t6bWRBQWVuczQvam1YWWt6a21KMEpTQ3I4Z0JnNFFMek1xaHdJVmFh?=
 =?utf-8?B?Wjd6V3BrR0hQWjZ5QWVVZGkrM0JQYlBValFEeWU2Vnk0WXRoVDNyWlRHdTNN?=
 =?utf-8?B?OEI3L1hvbXo5ei9pOWpyaEIrQXdFMjNUdTZpaXJrcElsSlgzd0dXZzdDdGt5?=
 =?utf-8?B?anRQZmNaNDVVb3BFWUNtcjJWL2Ird1J2eGlubVlWaFFKTkdQTVo0TVpkNWp3?=
 =?utf-8?B?L1M3OVVEVmtobFZqTXhJaVNzSHRGVjNMTENxemJjNUNhUkVrSDJuclU5U1Za?=
 =?utf-8?B?aGRTVHRhT3VZby8yQzZJNm9aR1QwY1lCUUd3bExpcWZLRFo3WjQ3QWwybnBN?=
 =?utf-8?B?YUpxdGRqUzRyNDFkUGliTGdTaC8vUnJ0ZitDQlg1dXNUdDJyazRvdmVJWTB2?=
 =?utf-8?B?eTVCSnpydXZmMmpwa2p0T21sTFVBVHNjU3hPZ0V6azFBdjAyUE05REdSbUdY?=
 =?utf-8?B?YlBhSlZDZ1lzTTFvaVFjeHB2MjhrTFlnVjhvS0dJczdKYmtNSXAxRWl2dVM0?=
 =?utf-8?B?SzZaVGhia1IrV3JTRURIejhCRnN6K2tuR0VHRHJBVWNLZHJaaExxREkveGla?=
 =?utf-8?B?bGZTRXArZGZscmFSQ05BUW11eDVJeFZNdFU1M1FJM2lQbWt3Y3IxYVYrV1Zo?=
 =?utf-8?B?bDBrVEdrc0M0eUdzK3Z2WXQ4M3kwUlpLaXpXRVFEM3pIeENHMVRCTmVaQXpF?=
 =?utf-8?B?Tkd6bEtkZmFlSTJ2TzlKTWNxbzI4V3BaRmFITnQzV3BoR0FyL1Qyck1ObW95?=
 =?utf-8?B?TGQ3RW93cmRnTy91emRpZVV2TjVMaG91dytSdFpnOXM5SGxOVlBRdjQreFQ5?=
 =?utf-8?B?eTZ4YWZGVnd6S1Y3K2V2YUVPZlNmUjJhZHlqaXdEWlVWR3o0MUZXdHJJb0lu?=
 =?utf-8?B?MVpIWHNCMEF0dDNiWS9nVDU1bVN3NTVHSldlMm51UEgxM2RRellBYkR3ekwz?=
 =?utf-8?B?eFZ2emxxR05YZWY4VE1vV1A5dDRKUXlObUVBUldCUy8zdzVBTHl5Sy96TFhB?=
 =?utf-8?Q?ZHAh/+gStxGDqDfNimhC9vRrG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 008fc0fa-b8bd-45c1-3631-08dddfd97ac2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:05:31.8857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13IoX9MQvhVPrI/lWc0R0I+tl8pAmJTZcH11QhGQV/eiKQ40N+n2ZK2O1jEPF3l1th4+tzVDD9YLIS/lMEgamg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10913

Add output filed in csi2_pix_format since the format on the
source pad might change due to unpacking.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 85700655ecad334c61e9b5f9f073e10b6db2618f..ad7adc677e389e0f35b0cf63195279e197907f8c 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -139,6 +139,7 @@ struct csi_state {
 
 struct csi2_pix_format {
 	u32 code;
+	u32 output;
 };
 
 /* -----------------------------------------------------------------------------
@@ -634,6 +635,9 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
 	fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SOURCE);
 	*fmt = sdformat->format;
 
+	/* The format on the source pad might change due to unpacking. */
+	fmt->code = csi2_fmt->output ? : csi2_fmt->code;
+
 	return 0;
 }
 

-- 
2.34.1


