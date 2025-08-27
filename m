Return-Path: <linux-media+bounces-41147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED6B37F57
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71A8A460DBC
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB60C34A32B;
	Wed, 27 Aug 2025 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dO1DOxnz"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AE134A30C;
	Wed, 27 Aug 2025 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288473; cv=fail; b=Y+xPXXTG75tchYNL7EAcp1glsXM+x42U+PN+ouEryCk4hTJJJQGsiUsuq9UGviezBE4jPeN5nEPKRjPhE2IMJHviX3JDRPL7/785Je3Ad67c2THSNWBzgQ7U4Qd0g+qRTYrV5yHfyCcmexD6H7haN7Os2dc8uZU5zpzAWzpKNuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288473; c=relaxed/simple;
	bh=7YOiHhiH9l/HUUGm522Go39y++7MvfkGPK8AVVXIcEo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PqiOL0/LPcH/3raEtj14udj4Joa59yFTNcMQVPfT0ldW6ocX7Yq4ZpYO1NxuyS3TEsdym1cA9gDjRcU80an9bdr46WRVRiMNde0QurH6RbZPAbIpqxVEF7nUtnybg5np7Odl9uBUHM/VyCd4j+Rltu33FUzpbxBBsyf1tqkMy+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dO1DOxnz; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpvOst5vLJtbpGnMBS6GxQnlKRGJvDJGQmXex+yi5uGHBvvaFjy5cS5IMUdfN42gxdtMbVW2hhfcNmtANar3wF6uqno+Oc2JosdYAh3wQe1t1108Hb9W0tbI2sJRxrP9aU0RBA/asPvubm4gOhQRHWFxqQiEojFKMCNSc1phUl+oLIOD7zIuAFWzUEmbRzmxiC9em8hM0k11oB8gSLnoKR/ze07qd4UrCIYiPWhopezIq9RipClZ+GFBe8WnDRJEA5dkMkeUcSnX2tO36OP7xdpNFWfLnj6GsN1wTDISguf+ztCU5aXks1C+aVplbj6MyAn/hoiuEEFIY6dF8KWOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bw5Q5IJJVqMpDjDTm35PJxfajAywe41xvJFDTSmJqI4=;
 b=tcNGmBfm0kCId+wQF/cmdM71q/VAVuQJs1aw+bUheswMqLgkNniV4lQXOKu+6/Nj56m970YeSgDo7TPdE0KBf8eqENF8y1GXPVBcxJ4ZWudmPHg06VoPAabncvCe0zWEgm7iXYLFcgKv5ocfTi4OjI4GHCBlwShLlNJwH/9uoOJ1vIrssXHxqAE/I0vpjlA2FlQqBEfgbI4kDBGmlUvKt0hmjxFmZypIdVh3DwF7PoUbFRvSs16ZT5wH27YyQ7nqzyWfNIqTacBSNbs4VJdTSU0PZQDsFYaoYc0jGBfmR9KIJ6w3OrptKCQaBQDHs/ErcGFn+boBA2eOECwa30c3Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bw5Q5IJJVqMpDjDTm35PJxfajAywe41xvJFDTSmJqI4=;
 b=dO1DOxnzSuWEMm6mKmOOU8Wo4xHCYen37cWSVFBsFm7T7jFjHzHmu9dWU58olbwcFW0Fr0sw9b3fYMpdhW9ChzUfBhsZmJAP6pgfUsSxVwcExaVPs/bBqqLsl2S0u0gStzfyTcgJJwYjqdmZFThVTfw/2EpyeulIF5IfjXq2M71ffBnBg5arQjFE8pEuKRZ3ZOQ8ECve8OgMVPFySyNDCpe+ckiYfD5MQ+3VW5/QIS806WfvQ/QIwepJ4Wh986isAHwJS140a6o+bjH+4nuqGe1aoF0aMLXpSlgkWcdTRXdlW0gY2DvUS4ZwOWa+IRoESNsI90qTvwH2kEB85GjMiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8839.eurprd04.prod.outlook.com (2603:10a6:10:2e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Wed, 27 Aug
 2025 09:54:28 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 09:54:28 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 27 Aug 2025 17:53:49 +0800
Subject: [PATCH 2/5] media: nxp: imx8-isi: Simplify code by using helper
 macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-isi_imx93-v1-2-83e6b4b50c4d@nxp.com>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
In-Reply-To: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756288458; l=1394;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=7YOiHhiH9l/HUUGm522Go39y++7MvfkGPK8AVVXIcEo=;
 b=WbMyU1wyTBxPw/k86ZXkhOZs/5tg+7X5WNDaRfaaFbGGqTjWkVON328yx37KJUPGiFFOD9P1U
 e27fxgGdM9PC3vQHO+ASzC2FNmA3xLJoP83bnrMtz7zewhX3QVDYazs
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 26190131-7663-4325-7321-08dde54fb67d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|366016|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZXVsUVg4YW91dUVWV281NDRHblEraHBpeVluQUlhUTNOMGZQdUkrc3Z5MFdi?=
 =?utf-8?B?MnRoWUVOVDd0QnRzcjZmakRZalV2ZkpjZjYrVER3aytOQ3oxaUZDaWVmZkRz?=
 =?utf-8?B?QytMd3dRVDREMjhxemZMQnVvbEdVVFdJd2c5VzVsd1N0S0hVdFBKU3JLaXJX?=
 =?utf-8?B?MTFCNjNJMlhDaTRuZjRzMUx2Ujd1NUovcGtRUERYTk9WN3hmWnlPYThOTEx3?=
 =?utf-8?B?NHovdlJFQUJWdlA3elZVWE4zMWREY3VtZVA5YUxXa1ZTcDVZOG1Sb0dvVFBo?=
 =?utf-8?B?bVdESTFKbllTcTNZeVIxT0gwQXlyYTh1RDBjUC9yQWh5UFMya3RvOTZEYVFh?=
 =?utf-8?B?YkhXZUlMemlKU3dYVnM0amNpU1U3bTV5Mlp3MkxSTGQ5Z2RnMWxmSEZWRTZW?=
 =?utf-8?B?cCsrMEU3clFxTitDTTJvVGVyMENYWkxGTGZQSnJnbGVpbjNtOTV4bVQxaytG?=
 =?utf-8?B?Ny95WFBBWURROGI3Q3lNVXlXY0Y0TXhDMnE0eUlxZE9ubzdWeGcwdFJabmdI?=
 =?utf-8?B?S2RaSThpSXdZZlVLTll3endWL016UzlTMWluYlVTd0ZhTVB5RXNUQmpEb2Fj?=
 =?utf-8?B?aHNTUGM5eDhvRkZtc2pncjlzWHZRVG95YmplWE5iL2RySHFoQVhsa0hkMXFm?=
 =?utf-8?B?dmt4bjdxR3d5UjQ0bjk4UjRYZlV6eWtRdFBNcGYzekVtYzBBaTIxTmZqZk9S?=
 =?utf-8?B?L1BiSHgxbW1YMG0xVXhoMWthRTNyVmFyTit1U0xWOWNnTjBTY3hKc3JFUVVS?=
 =?utf-8?B?WGdYZ08xditQWHJTVUt0bDdkOTNRc3B6bVcvL21PSnJJMU9hdWtTLzc2TkVR?=
 =?utf-8?B?T2xOS1o3enIrV2ZIbGNmRnRabFc3UmtFNkFzNTdZVkRleU1CQVFVOU1rY0RB?=
 =?utf-8?B?WWVMb252VXJZWm9CTk8yQzRkYUo2c2o5MDdJV1o5djJMQ2sxeEZiMEZVWGI5?=
 =?utf-8?B?Z3dXZ0RVa0tpbCtuVlJaZEUvVlA1RVdyMnFieEh3OUhkWWhaNnl5bFkyRElr?=
 =?utf-8?B?aEpSV1N4YmFCK3JqLzlIc1dRR3p4YWdMNTNoZ0JoNnJ0NUxHekNHR2pJT0hZ?=
 =?utf-8?B?YU1GNnJleGZ2VkYydDNwSGEwQjhlS1FBZW52Qk5CbEtycmlSQTRBcWZpWFQy?=
 =?utf-8?B?Ti9FcG5GOVdTY1hHYTcxTEQvRXQyQ1NlemlzNFlyRGppbktjQ1h4SndBTXVl?=
 =?utf-8?B?NXpBNnlWKzNwc0Y3MWFQSlN0dHdTeTQ3NzV4a2ZZdEhmQS9FemlCMlE2UnlC?=
 =?utf-8?B?NFVuUUdVbmNPQUs5S3ZTbGtmS3BQVStaWUk4UzFHUjJKaFpieFY5cEROOVRF?=
 =?utf-8?B?R2xLY0dwZDhTbDlXTkgvazVJQWVwWFRFMk1KdWxITEx6Ly81SVdEZEROSkxL?=
 =?utf-8?B?Z1F6dkVPRnVhM1gzc0RvYlYwaVR0L0dCT2tIWkQxdnMxc1kzekxjT2IrYnZR?=
 =?utf-8?B?NTV4UVhNanVqcUI1all0ZUhNbzlPbUdVTDB4M3BvL2F1NGxYZ0htdUlWZzRT?=
 =?utf-8?B?RnEyTW5GSUF3Uy9KM09HMUtQM1d6eGJOMDF0ZEx4WU5JcDkyblFsekVoN1Bv?=
 =?utf-8?B?Uk1iNnZGY3JOQUFFVSs2UDBWUkxKOVNyeUJQRXEzUEd0SElVTkg5Ry9EbU5m?=
 =?utf-8?B?WjdnWHMyK25kTGlmN2dxRk9ZNFkycHJNWFhVSDBvTUFoZEUwQzl5MkdjdlhP?=
 =?utf-8?B?S1g1K1V4Q3ZFMHRrR1dvTWVGT1I5R3Ewem9CckR2TEFKUncveGpPVjJOUVhS?=
 =?utf-8?B?YlJFcm83OEpsOVJtZTJ6L01EaVpqZ2VBTEdSK0RGRENTWnJOdEVadVRLRmtn?=
 =?utf-8?B?Rm8rb0podUxFSzRKMkRJaEdoMjJUQ3ZwMjNsdDdvY2w4L0I4c1hKMFBScnpI?=
 =?utf-8?B?THljdVE5SkZBSXhCZjl6cXJUVlBNOG1jdU5zMFhsYjgrZjcyNkxjQThGd012?=
 =?utf-8?B?SUY1MU9IVjJ2cXJkZ0tQbkYyaVNuS3VuK21TQVJpcGp5QUZaQit0a0pLUXNP?=
 =?utf-8?Q?6Xs2zS9kHsxt7HfM/FCiH9ilsN08kw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WGtYNmgrUnpzdzJ1elhka3A3OUVKQlZXM3JhNEVoM2VJV3dNNktKZUFBd0pD?=
 =?utf-8?B?WE5hZnp2YUVvelFsaWF2VGhFNjFXRzQxcFdDbnp0VWZDWlg0ZENNS2JHMU1r?=
 =?utf-8?B?NzUycmdiS2RZdnR6OFBwdllNM0FDUmp4U2ZvWUpDcWl4OE1XenZ1dTN2YnFh?=
 =?utf-8?B?NllHNDdhNU81aFR4NlpqRlgrekJtLzVSWW5leUZCT0k2L0ZUY014ZzdVTlRF?=
 =?utf-8?B?ckIwajkzS2lmK0dpam5PSnlWd1EvU2dIYjFTMjh0ZmluZW15Vk44c2dFZUJ1?=
 =?utf-8?B?c1UyVUMrQ1hobGEvNlRVdVVDblZnUm1wVkw2SHNCSitlSk5lWXo0bzZHRC9v?=
 =?utf-8?B?R04zTmFPTUJUb25LdHZ0d2ZpbGVPWEVkendWRkNwalA4SGMwYlNYTGhDdGdH?=
 =?utf-8?B?QzRZTWdrL1hiNXVXN1ZJdTg0cnV0M3lkSWs4L3FuRWREeDNQWkQ3VkF2N3dp?=
 =?utf-8?B?dXAwNlRndlNRd0dzdUN0ak9RZE0zRmFhV0x5Z2RBSWRyRFdjalV2a2ZReWFQ?=
 =?utf-8?B?Y2xkSHAwZUlBaHU1NlQxNzhoRm9XaThiVzN5Q2RRUzJFbElvZG5mbmpZcFNm?=
 =?utf-8?B?Uzl2TXlVNGRVZE9RQ2NEVDhadWQrbGRWR21ZdWpZc1lVUDZUazJTVVJmTG9T?=
 =?utf-8?B?M1FTQVEvZVVNQUo1TkhxZ0VKd0c5eTlsekUwNDNaRU9LcE1KN3RSaHNrK1gw?=
 =?utf-8?B?MXdSSm94eXZxczFsbzQzMklXbnhLam1tRXVkTmxJQUNTd1hzYTRMUjhtQnMy?=
 =?utf-8?B?T1lERjZtV3FwZzY0bUV4YmtzajlKQVpJcFBMTHVDaUdhUkdIUHR6T1dHRlhD?=
 =?utf-8?B?RmtYakRBb0pid1lKQkYyRmwvWTZyNHJydS9nTDRUNFgwZmhBK2poWnhzOUdh?=
 =?utf-8?B?OXNPR29WYS9FbzJNbGQxdmJLdkcvZ3VVVklSemhwdFMvVndVQTdKN3dER1Z1?=
 =?utf-8?B?UHErbWU3R0cwQUlwVHVVd1czbUsyVkgxVlA0Q0dSaHVJemlHb3pnRDBVMjRU?=
 =?utf-8?B?a25RSmZaalpYSmpuU214TDg3N0FJb0x1Y0Voa2dSR0tXdTBwalhVSFFSVTZl?=
 =?utf-8?B?aitUczRQQ1MraG1MQ1hXZWN0eXZ6SzJLTFFjTkk4dVl6Kzh5VDJCcWdhYzlw?=
 =?utf-8?B?MS9EczQ5K2NndWgzdUc5RHByemJTV3dnemc4bG1uSzJQakpHVGJqZlpvZHNR?=
 =?utf-8?B?VGd6dEpndXB5Um80MGFObU1DWCt0cUsrK1kxRWJQeGowRFBqaitpem5GK0Ir?=
 =?utf-8?B?b0Y1dTZEeEdiWXFMS2M0ZHcrVVoydkROTkFnY091ZmcxTWluL3FsTExwdEZY?=
 =?utf-8?B?ZHZNQ05aYXBYL1NUNWVuM25EK0dWc2lzTnZMMXc2Vzh3QkhpUWlSOHBxWE5x?=
 =?utf-8?B?K2Y3cUlFMEI2b1JJRDl0SXdpUmUrbitKOWVQemI4Q0I4T0JDcnlMNzdaTVJJ?=
 =?utf-8?B?WGxZeXA3ZEhoam5SdXZDTUdxclVoaWxFMFEwT1FORHVlaFM4ZDVwVEJSQ2ZX?=
 =?utf-8?B?SGx3NmdidldlZ3hIbG5xMW94WjlORnZTV2xXclBtOWc1TWREd0VjUm5WNGdX?=
 =?utf-8?B?SlpiMkc5K1N0bTBLaGVoRU8wMGFlcmNIYUhMdjdFK2JJNmwvbCs4bGpXd092?=
 =?utf-8?B?b3NEakhtM3dhc3RwVVlEVFdMb0EzTDljVWFIY2hoRm5kcGsweE9icGw1eU9Z?=
 =?utf-8?B?Szl4WjN5NkhBRFBqMXJUaUtYdC9PUUNHZ2p2b0dwVjJwMmVpV0Q4UC90aUxX?=
 =?utf-8?B?WCtEZzBtMWYwNzNUMDFKV25VTUc4UXJKVS9mTWdzbXQ2K0tHZEo4NnBPeHRz?=
 =?utf-8?B?VUp3bXRwaGZtMmErS3pCY2lyZ0ZZWjdmdjhCdnJXZFhKeGdtcVJGUEh3S250?=
 =?utf-8?B?NUt1NnhwazdITzlZdjFiZFlkbkZ1WjNkTlA3Y01ZQ3ByLytMb0RrOWlacWVE?=
 =?utf-8?B?T2RvcnlCODhuZDd0WFBKVWhhUHQvT2ZRM0IrWGlNMXlyWmgvSzVXQUtrM1BD?=
 =?utf-8?B?K1liaGg0d3FQYUh3cHFpWlpnUzdSb0NKSEdEbUNpVkZxcm9OcVBWdUtHb1JQ?=
 =?utf-8?B?UFJZU1JkN2Vselk4ZlhsVWR0Nytldy9DT2hlOE5SZ0dXU1Z1VlJDV1RTRmtE?=
 =?utf-8?Q?RN04++9km3ObD98giWyMwZWsx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26190131-7663-4325-7321-08dde54fb67d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 09:54:28.6046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Km28rSZWvcv1ap6xh679byfkyU6OfWSzgrEnigjZ7Sfgf4V4UQjykSlCM4ioK4B5mIqpXaTzaXDULB9yiptPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8839

Simplify code by using helper macro FIELD_PREP() and GENMASK().

No functions changed.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
index f69c3b5d478209c083738477edf380e3f280c471..c05e26798032367813c8730550a7eec2f237b4eb 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
@@ -16,8 +16,7 @@
 #define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
 
 #define GASKET_CTRL				0x0000
-#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
-#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
+#define GASKET_CTRL_DATA_TYPE(dt)		FIELD_PREP(GENMASK(13, 8), (dt))
 #define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
 #define GASKET_CTRL_ENABLE			BIT(0)
 
@@ -58,7 +57,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
  */
 
 #define DISP_MIX_CAMERA_MUX                     0x30
-#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
+#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
 #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
 
 static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,

-- 
2.34.1


