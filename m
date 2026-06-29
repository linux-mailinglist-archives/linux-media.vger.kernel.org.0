Return-Path: <linux-media+bounces-65864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xX3XBConQmob1AkAu9opvQ
	(envelope-from <linux-media+bounces-65864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:04:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 629DC6D746E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:04:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=hmVE83tV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65864-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65864-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A40432111E5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1230A3E1D0B;
	Mon, 29 Jun 2026 07:42:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B3D3DE420;
	Mon, 29 Jun 2026 07:42:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718967; cv=fail; b=UqOLsYEQyWKm4ol3MTiMumpUFf0lq07Tb9jZzjIRRbAXDMtb/daWcdQIYrSPN4rmjIMFAIA6ygYAIaixNJaBTX9bJuZwlGmOCYMfrWnIz/B9TM9A5tKCfPrr22b9/lGYsull9rUlrwDQ/Nt5XS0zI/ho5P8ip9u1lePPpILFX80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718967; c=relaxed/simple;
	bh=/maq72k0sl7k003en+gtgVOpwsUt6v01qM5sZ+HN+fg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J7qgfS7it8UneQRndcNTh09kB2GW4iyQlR3nvJCAt9SFt3lK0cb3Bx04pPJUsNqCoLPPjcAJEwU3xLuN6UU7nvWJ+8jOUikdWQeZnYjIAsplQC6x7ir5Fm3cJk1rJd1/U6IOuC1l6F7qHL/fkDtZfIdntImHTC3XAmaO7ckm308=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hmVE83tV; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XF2V/+AVFC29oQK7IyVBVkX4LeANextZO4T9GAmxI4WPOfQpw0fH8OY8ZRkbi8Yn/CE0inSMxJo1thFEeRXO+cKlw10NK/paHQdBf4qt7xsurykpx0fBCZCmsMs4G2hQH51UliNuvfOrdAtus9tPAksbQc+AwLknI4+WayoteTM1eCWG/rAycHZnSIlI1zqNKdxSmg9vvFJgBMPUWEbwdqxLUhHVhUsnnrgd/YjKmsTHqLrMOMqd+KSeteCrpsR3qda0/6gKASoopiGpLp2gA2YvloDXULLhLQoyiW05sYqT2PK6KC11bfEDTZZV8DrQGTfM1GCiuD2ORDLnBPGHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XT8pPN8O4P9XNhLLaRI+b256+Q9QaeOogzTAm6pOv0c=;
 b=Z2rmVZTn+53TeZrgp3ivxoLAIVJzebuGIQZmG9XlJrbMYTZzxCNeyWx77huHglnBiqPf6yNjuVRG4rnQ+vwlEBvBg1L2de4bL5qvcZxiZNFcdfwdFp+PlQ4o2xUCj6kgfnug84/dFnmQWBoAE7swKPEuVYWbeVEEwQnsY0GGTf/zQVCz41OIRXkDvT/aYdiEcgG2xgUpfyWHVtKc+P2Ib2et6QkWCfMtw8GZ4SHzfvfyfoQVpOpHeUunn9waETyEWAduvp0xIjyOcV5pzagJQLLgxxLPiQw0RIzjHf7OBTAvTZarFIGzKicvDDohq4bqgK2HI/cchOJ9aos9Gqwz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XT8pPN8O4P9XNhLLaRI+b256+Q9QaeOogzTAm6pOv0c=;
 b=hmVE83tVtBvhaxnaPLZrXZzGm9V7w1XAvlI03kuusP/miB55BKwNx4QTf/rDJlK9/+o+s1k1fc8R2CDIVRC/FXhhrPXdS1sC3q2e3P0OIhKKIZc7g8C1GSodn1zu8QmE9jFLlb+HaTiTt1gN8m5uqqbzZf9rB63oD4DHmKLAAzPnO3CIWOa2Isc6twvr0XWC+PhtYxc76igwj6pUxGv2h6gMRbhLuKhnTyGpuNACLDoYVKViDFEfxTzY0qOME/JLjUZtN+xocBFR/6d8YRl6vVBn8CeoOx3oS/QP9kIzSlv6zjFRFXIXc4af8NUDAH063wAQnQ5df6CddCol4JDOXA==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AM0PR04MB11932.eurprd04.prod.outlook.com (2603:10a6:20b:6fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Mon, 29 Jun
 2026 07:42:33 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:42:33 +0000
From: guoniu.zhou@oss.nxp.com
Date: Mon, 29 Jun 2026 15:44:57 +0800
Subject: [PATCH 3/5] media: nxp: imx8-isi: Add 16-bit raw Bayer format
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-isi-v1-3-deebfdb1b07b@oss.nxp.com>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
In-Reply-To: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782719134; l=3527;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=GcNi0ka2MUG/Rrg/BfZOwnvzzeP2OfsDjCcv+HPDkPE=;
 b=pmkWIXrNB8DHwv5cuUEcDRNcBYpDP4oKhKi2FP+p3tpVNoQYoX9475ksF5LmeEeH5KeQ9+gTZ
 6Eq7xel9gxrANhY59D9unBKoiXe8rHeB3KJ7IAv5COXehxaUgz2lFEg
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AM0PR04MB11932:EE_
X-MS-Office365-Filtering-Correlation-Id: 13d5fd83-1477-4ae3-e9e7-08ded5b1fad7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|7416014|18002099003|22082099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
 8Nq6ax5yW3ixSYQxJGOEAKN1sctBmdIacHeItzgBHvQizcJJ336dSH4l+NIwwzCV01yf7PnViFoI2P/s2366exiCAU0yKZJlRw/dix9dnouC8L3tm4X8NS4XZuVcsHPALJQzq2IYmcOY/SD3lYLXiia22XTjjXlcpJMor1o9RnucnnX5liN6rjvmOKPZwr1eVEkLPxYd/stF0tvoz70tnXjoMMKSDw6vNTsgxiY+3XR+w3dk/QrysmGi1MNpMbtTVO24jzHoNP1aWTkhDZu14ppmStG615Tin/uTEoteay5XJsjhGutZ09Z55FkYfLkxgHGFuJRu04DpUKW+CefEJn41uJDAHqFRPQhGtoHRq4bvARBXXO7aiF2/h6Jq2Lm2twABLdfvdnbkWyjbjd3vjyI3TdjCs2roDIaOLnv2xyDdJAl54c4J2HCjTsUiriLZv02q4u0yrLmNRXzY+IIjQWz7QNWSnD7ubRhz6uUFZ8nF+1wtnZ9Rrgx0MFfkb5TJKZeOSTa7VfnSA4wp2c6r9RBQUuY6tn2hs05GwFQBzPD2JKCiZ/CYPv3kVPqaBErGEGK1BlFWAU/zrh+1FsmCFFrf+VbZVRQgB4ILIx6WUM+5c0eNwctRkk4X5r7FsU1Cvi+dImZ7k9taBdox7S/Nkk46JFUozA5S813VB1/AM/A=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(7416014)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c2FVSHpMQTgxQjNDMEJaVXg3N3Q4TDZ4SjhJaytFL1pkLzdZVU1wRzBFaVNr?=
 =?utf-8?B?OVY3VGpjNnVYeXN3Ry9qQnExUnVSN043MnlrTW1PQU5xQktTY0hMYzRpWkZZ?=
 =?utf-8?B?NUd6M0NPR0tEUmhSRExsT21VVE1QU1lFeWg2dmdJbFFFNk41eUhCMHRHZE03?=
 =?utf-8?B?THZmS2JWRkpSOUlKYUorUXMwN3J6RUVqdnNFZXd2b2dXdGVsS2xCbHl4bkpG?=
 =?utf-8?B?VUw3RlR4VjQ0b2pDNEZYb3dpYzBjeE43WFhlR1lxaHNwRmdJTVRKcFIyUUlv?=
 =?utf-8?B?dml1dlo4U1BVNit3YU9YL1BMV0RvMkhuODl1dTFQajlpT2NUMFJibW9SYzNr?=
 =?utf-8?B?Wk16c0N0VnhyUUE3bC9FN2VYdEc5VkVKTldicVZHMkpmY0tQOVp6NVd0YW5G?=
 =?utf-8?B?RWNIUWhLVWxhVTNFUmJxYkpoZm9NMjdwR0pTWEJRWHVVeGo4TkhEclFVaStX?=
 =?utf-8?B?N3VXb1ZWTk9ScFB5RXE3MWpCR284OU1Ld1l6MnJzUnN6eWNtTDZjUXBuTjJL?=
 =?utf-8?B?WDAwOXgyc0xhckYyR3FDOVBqQmlubnlSbXQ1ZUJFWWVFUi9TK0tLRkwrQUtF?=
 =?utf-8?B?QjNCcnIxMVVNVzlWUkF2UFhxcW8vSVVKR29IRHJUZ2UyT2pLNDk1YUNHNERL?=
 =?utf-8?B?aWU3S2xoNVJ5SWZtbzAzd3AwUkZkSUgzS3hnZWMzYWNXNm81THRFY1ZGS1p5?=
 =?utf-8?B?Z2FnaDhkaVNUZjRTVlgzVjNySDg1dHA0WlQraUd3ZE9pdHBTUTNiTG9WOUpT?=
 =?utf-8?B?Wi8xdFcvbVRSblBjczlzU3ExZmJmb1lSZ253WExhRmVuNFNvQk5lVk9zdlZh?=
 =?utf-8?B?a2oxRmxBRWpWczZzUXk2NnovMnVCRzhoR05mR2xNNjZTdHZYYzB3ZWhkQVRv?=
 =?utf-8?B?VmQ2SE5rd04vOVJFYkM2QkU5bVNab2hqWms3R01sZ3U0R2UvanA0ek9JbWI2?=
 =?utf-8?B?NlVtRlRWMDdvdU0xd3dVZDBCUWpOMTYwSXRkQXZrTnFLa1J1N2Jhcnk3MWJn?=
 =?utf-8?B?T1BsNy9jM29kMzNGY203T2FzRGQ0Um5PZHFQTEM0a3ROVFRSSDJmL3p1VCt6?=
 =?utf-8?B?bzlncElqL29PN0ViWlNnbjh0QmNOSjY2VkdzZ09FRGZGTURQV3dOdnVCZ1JR?=
 =?utf-8?B?T1lMS0tLV25tNXpyUGtCejFSSGV6WlZtajluQ0JBa1U3aXM2ZGFNNmEwTGZx?=
 =?utf-8?B?bDNLRFBHa1V1cy9kM1g0QkJiYmhWOG15c3hWbVNLZEs2VHA1RDlZQ3hnMEp1?=
 =?utf-8?B?ZGlXUGVkSmd6ekN0QW9pUExOcGgzZkVDb2dzNWFqaktGOUJLakRNS2hhNmRC?=
 =?utf-8?B?VEZhZ0hZODVpRVF1Ky9HUzFVMHNsYVh3U09FQ0tIZ21tV1diaW9GcmdUQVpw?=
 =?utf-8?B?YVhaZlVQUVNoMVRkT250MVA5ZUt2T2dSWE5rWTUzY2xhK1AyQnhZNHBNemNJ?=
 =?utf-8?B?Z1llN0hiQmtqQi9ydkxsQm5tdTFZV3I1NnByTEpKV2RIUnc2SmdQOHBjWWdB?=
 =?utf-8?B?Wlp3elVSMUE3d0xzTUpIcFYxQkhrcEljZURIYnByRjZucityb1VMUFplQXlY?=
 =?utf-8?B?clg1ZzkxWXB4UnBPbHBUSGxvR0l6bDFKQ1VoNk95YVVWSWJtdzdhZEo3V0hq?=
 =?utf-8?B?WmtRVUVrSVN1LzlEUEZNVlBvcXNJWmh0dDR5UUpnSGY2TXRpNHVXZ1BkR2dl?=
 =?utf-8?B?Z0tYWHdHWDBvMmFsam9DUEU4ckozU0IwVmdCdUVJUmxOenFaWGwrVGV1ckVD?=
 =?utf-8?B?Y3JxK3VMSjNUQUdtc0tZeitwaVVxTmpCQXlyT3E4bllRbzB5RzVMb25HWGhv?=
 =?utf-8?B?UzRyaVhrVStxQWJPQnNac2ludDRCV2VPRmlyWHl6UElIdG9xSDJRS09ocVdk?=
 =?utf-8?B?ZWh1QzcrS0VabDNSdVBlQVVGTEZDOENyNHdKcWhBTTRLZURsL2ZwZEZpK2du?=
 =?utf-8?B?WHNHY0xPY1U2TWFTcm5CeGZTTFJNK0tWem44cmVWTTkyaFROaFF0TWFQcFZw?=
 =?utf-8?B?OWZOWEZza0g0T2JxS2dsMXpjT1R1aWJoNkhrZitWTjV0c3lNR29vZ2U2U0JM?=
 =?utf-8?B?dzVNM0FVODBJbzdPeW5Za1pZeExLMVBhdkttbmovanFsbTFkNEtlOE40dUR3?=
 =?utf-8?B?TzdxMHlGcUtJT0dEMGEzYjBkcmNnTU8xODZsWmN6alhkT3Q2cXphTGRObWlk?=
 =?utf-8?B?SThFR1ZtNFI3NEVmTTNZeGVkUllCVVNjL0VQNmlWWDMxYTNVSCtPOXJvN1Yx?=
 =?utf-8?B?OW5KTzU4M1A0d1hFNW1GdlpYTHUxMldQUWl4elg1aVY4QkM2K01aVWs4Uitk?=
 =?utf-8?B?ODBoeGd4NjkrWUFhcnJ1YXhrWkxHYkx1RWxCT0ovbVp2VFRVU2dQMHBqWnZZ?=
 =?utf-8?Q?xhIWE+QWxo0AzRe10mI/QwmM9epHAHdApNcST?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d5fd83-1477-4ae3-e9e7-08ded5b1fad7
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:42:33.1776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOuLDd9jUg8FOjgNXSromuALKkxkaHMHuTkiLi8UU91wavSV+CajczXgLgnsZjFX5vdqNeNI+l6u0Ab4Cm228tvrX9MF0ZppKQbm6/oIYUzcRNI8x62VSjZ395EOpVSR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11932
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:c.hemp@phytec.de,m:s.riedmueller@phytec.de,m:jacopo@jmondi.org,m:aisheng.dong@nxp.com,m:guoniu.zhou@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:guoniu.zhou@oss.nxp.com,m:laurentiu.palcu@oss.nxp.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-65864-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,vger.kernel.org:from_smtp,oss.nxp.com:mid,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 629DC6D746E

From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
SRGGB16) to both the pipeline subdev and video capture interface.

These formats are commonly used by high-end image sensors that output
16-bit raw data, enabling the ISI to process and capture full dynamic
range from such sensors.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 24 +++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 36 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index 2d0843c86534..e58925d71164 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -179,6 +179,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
 		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
 				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.output		= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.output		= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.output		= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.output		= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
 	},
 	/* JPEG */
 	{
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index fe4adfa3a1f0..5eb448f4c26f 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -356,6 +356,42 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.color_planes	= 1,
 		.depth		= { 16 },
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SBGGR16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SGBRG16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SGRBG16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SRGGB16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
 	},
 	/* JPEG */
 	{

-- 
2.34.1


