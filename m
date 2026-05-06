Return-Path: <linux-media+bounces-60549-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC6dKuUB+2kbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60549-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:55:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC814D8272
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D06EC303459E
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE1B3EBF33;
	Wed,  6 May 2026 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y9sBOkvG"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EE03EAC65;
	Wed,  6 May 2026 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057548; cv=fail; b=dofZyFUYM0899YIZu3e43rnA2K8vq61yw33KjnTjwOnSa+U9baRQdNDdJR7r/bP4Wsa4OVdREMwTIOCAV07DtFr+7emXyCCdZySdC2cXr2S2FLeh4oDflr3AvV8b2j8aXdMfcjuPN/8lfqXiITq9Tw2ZQ1p4q0xNvskjVAaKf3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057548; c=relaxed/simple;
	bh=Ac4dI1IhT+SkNe1AR3Dtik0ILr4E1k6RHymUVMlr5FM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bd9S91MOszajaiNpOXICU5Yoz2+gAWEJ1WvYz8hR89uf42xsCmUsTslOCU+1XY5PAvomfSyCJvEdddBgWNbPfTkCVx1vnaYdcNC7Xu522fX+Fsyhl2YuxnI03u4IN0oPxJM3C9Cs7G8fiN/LW9xWY6dL3U8Y17878NLnFW4IRXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y9sBOkvG; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmuL79X90sQcDDx9TkC4btTxkp+lzSdDkGOrbgbCFIfVXlyfUIx394QQe7DTW8W4c+1yvLzIMTZUKZH0GmBD7EM0exRQY5+qbViFhGeBwiai3uN8dkvcU3Mr7zBH3OAOVUcOnSyHjyU7Fh2ExVws26vMqcNgqcwGCPAxvLTliniBRSzLR7fdiT3XimGkBGiNeUyWuMrmVvSByE1z2Ka2k/rs97D//c2mUngipaBK4oSf82QVLYzdU4+y9uURC9GNQke0ncjt7IFRXaoaSQzi6LaViYPRwA+7y151NJHHd5OW9zJOt8WqfoSLmhvzsG2K/1VPDjdXTWlJNQDx1FcSdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TeNWq3Z+t+OhqRO+5qtu9+iGutiISTPerWZzvjOdF8=;
 b=U7eFmJlS4Dz192xZX2p5YsxXP3MSr84ORPCXd5izmifiseK/T44rle9R7bwjaQJ+kBkzGQ2Fhdq2fhJQ4PswuYQHAUMpzS2IWEc8pG08G7FLAYOZqG6U0SXHDa2WPH0/UijM6JYT9cwKH+eGsLIxjnT1hEBAdhUF6Agd39OLFUtaCEsEd2YlVwHEEKqwSdIsdRqjiE0xl3ABotqU5sG8BqnI6Skacfwz+bAtfhqbtGCTND7EdYcA6J95gzi8eo3IzFiergxUvrhFpUZ/srMw6Byk18n/alErulNOfXRwh9MN4VqWa37X4E1rU3EjsKplwRGhJpqRHGwmxi0GVpFAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TeNWq3Z+t+OhqRO+5qtu9+iGutiISTPerWZzvjOdF8=;
 b=Y9sBOkvGXwKKkMTzNezXXiZkn0j0RvAOwKHKXpNYhrQaekmmz5t468WFaeVqn9i6/+2q5lAto1QuHYew2Bn9y1qfb+m6k5kWv0WcP1emJxS9y4Uv2yw0TnMS7CDrwCys09MLn7Ygq8xIC/K7LjyYUzIkFGWGD4iWs0sSDbzQT8DOLbI1zqP4GS1XqnfGafi6iLrQ1p9PgP6AAQwCyotYS81LGNGuECA5IKZUVcNMm6ipwoz7MO1kRHhEl12DN9/dyTTNmMusT8VqlxtowL2cbUrPYiyVpGoSKQWWRb28FmEm0KjRsYva/w16e0xtpYlF0szyYqcwzgjpSjKxDMhGJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10443.eurprd04.prod.outlook.com (2603:10a6:102:450::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:52:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:52:17 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 06 May 2026 16:54:03 +0800
Subject: [PATCH v3 4/7] media: synopsys: Add support for multiple streams
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-csi2_imx95-v3-4-953b6e1a80dd@oss.nxp.com>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
In-Reply-To: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057665; l=2908;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=Ac4dI1IhT+SkNe1AR3Dtik0ILr4E1k6RHymUVMlr5FM=;
 b=ajojcFdKjaJklgmQ5qBcqD/OwAjQQkSfXHaRX0n0CQAadJ84LmRmCqqi7y6C3CDZ+IuTMa0az
 t3o9nyAj9rYBmT0Y/q7s7I51wOTcWWbu9NwIlaKNF3MWNYIlsaKjTJK
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ddd922-6e9d-4c22-8bed-08deab4cc676
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|18002099003|56012099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 1+fxJjo2yu+U8xrGC3FgiDP1ZTuiIC+s7DCjZ/j5Ju/FM5mdkBmKA8ANmKJwd5IG/dVX2pCIwTK/sxLzWpBqYcFHSpjSvsTLyIT5pzbfml0RbFhZqi3KtMkiXTn8boi6IGjnjUO18gKUFh0QBtR3rNYMHD2p6/ixgSumIhHw4sYk7F3o8lxl9roYMcXHsGV4qbwIlNenvtkQxK5yc0BymbFSyKuC9xas20jwmpMI5o1RfmpU0X/Asah2rwJEXO+3EZzvJa8M0NREcfzprUClTJim86+NupVdht484CJHyMYzCVLFj44FS5pACNTRjGnr0vSDu5TVeNckU7Q4rzJ8aSdA8Kxes/pHjytEcLuIQef+Kx2TepWtUNMoApXAGIiYdmmLism768rqoU3etJ8vrdwzvVlCpTBlXz0mvbHmw2jz7m+YGUoawxm0DESh4LrAbKKjeRrDWjeNtnY9qebjY9HcR92zmyf1criachbDxNghDxV6kPGU0B2KWDR6/HsEaSyYn6/sQjH9zqwG9ZNJQZecebGKLu2mQBqikXFkjlqmcWtXfhy2wqTXPwVFFl1YSI4rx0KxKmlcoLor6e3+uhglzZDz71/Jhfsw/ed6HlL/rcm3GALfiOG7ZogOiM4EZml4AyVrZj5zoWVpEY4G54DpPnvJy//JCkgpqE1o9BhG0VUwAxvIQYEu6dOUDNr4FcMEIY3gonNDKWAQXMfsQXt364E8QmozfSssvQHeJ/RnRn5dkx20olN7QhmUH62KKw3ol5I/4WAaAPN1eBxDog==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(18002099003)(56012099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Mml5RVh1OGFEcFRjT0JPTEhxa2dkWWlYTmh0UW5xanBVZmkwdGJOeVpabWpo?=
 =?utf-8?B?MFBibWlqTEtyZmtkQWV3aFJaRWFSSysvS3hwNkU3Y0Z3TSt3U3c2cklxWEhV?=
 =?utf-8?B?S2c2T0pMa2RzdlkvYXpmT01iV0xsaVk4RjlON2J0OC91RzY2TGZLbm1wZmtx?=
 =?utf-8?B?Vm1qbHBKTkFROEIybTFmZVhBUi94VFpzZWtndDhhV29GMmNhdW5yR1ZFaTJk?=
 =?utf-8?B?Q1NJUHY0d2Q2emtGRlk2UnB5Nm45NWFyVWRMV1VpRUNvaU5Xd0RmQlJUZ0RH?=
 =?utf-8?B?SjNhTlBCUnA0bU5jY3UrcDJvSDV2WkwwQjJnV1NkNHpFWHIreXpvUGdqNkZT?=
 =?utf-8?B?MUhZZnplTlNiU1VuYkRubVo5NFdmaEduRlA4SU5Va2xzY0F4UFc4RXdpekhu?=
 =?utf-8?B?dEJ3UnF2MjhZbnhDcklJYS9KOSttT3NtSXh4U1lGazYzc05iYjRzTG04N3g4?=
 =?utf-8?B?ZEhpdS9oU2FUNm1nUEdHLytpZURYYm5XdGFVb0huc0hZRnF4bGpkYUF6emNG?=
 =?utf-8?B?WVhhTnpPM1Y1cGxyZ1B5TlNTbTdRTWphbDY4YktKSjZjU2RaUi9Qdk1Cb2Jp?=
 =?utf-8?B?ZlRvdm1jMEhYbXBEQkllT3d5VTNLU2x4Z2Z4bHZjNW9nSlhxdjRHQVIyUkNR?=
 =?utf-8?B?cVlVK2llMkl2QmpHS3NSSEYyQlp3VE1hTFBWb2xSLzdvR2g0VnBFRThUcUxw?=
 =?utf-8?B?V3hGVXZGNlNwdDZlUmVLZlpWQ2FYR0k1TEJZdVM4WmE0ZUpxbmlyUmEvc2hV?=
 =?utf-8?B?STN0NmJvcVRnelBJb08vbkNsSXAxSkVKTVpyNHNrcXNsSThkMkV1T3c5VWNz?=
 =?utf-8?B?dkppdjFHNy9jNElQY0NyYkxCeEQxM0F4ZjFaWHNNSTU5eUNhdldVMjd6RU9W?=
 =?utf-8?B?eHVIUjRlSjlvc0tUb255cXByYW1QaDlQU01CTlYrdUg5NUJ0d0ZzYlZNTzlh?=
 =?utf-8?B?ZVZUTUxpSUNnYVVTMmVPRlZBQ0VmejdIMW8yQXpSVkdhL3E3SFRpQ2dyZVpk?=
 =?utf-8?B?K1VEbjIzS1hEVDZYUU9mNWZVWEZMMTFFbEN0VkEzcDhFS1daUS9zRHlDOWZD?=
 =?utf-8?B?ZXZNSmRjbmNyc0UvZXBWNjNEZ1VLMjltL0lnSmIvRkFqTVVmSGVQd1lXcTVB?=
 =?utf-8?B?RHpGM3p0NjlnT0xDY21CbXp1MDVsamlZM3ZOR2JVNXVEM25FYXhyVzcwUzVw?=
 =?utf-8?B?QmswRGxJTmpqNy9BdGpuZ2FFdlVzektjWDZwUzRtWnkvSCtDakUwS09nRkxv?=
 =?utf-8?B?VUkzN0xaV0ZQbUpnOGFJNTg0ODZzQm5yclBUYWp5Y2gxWUp6cDBCS0l1R3Fi?=
 =?utf-8?B?WVN6NDRKQmdYNHQ5U1pySnd4NGR1d1JvWHVzRnJWRHBFSVQrdWMveENVVlpH?=
 =?utf-8?B?dTFoQWRMNTE2Y2tLL1MrdElYNnBtbnhsd3lmN3JYR1lDSXFrNGhhRnpYb0RS?=
 =?utf-8?B?L3RzYlhQR3RsQndoanFQU25hbVBiMC9SQkRWdHN6OFVVNzhqM2VBOGlhZXUz?=
 =?utf-8?B?SDdtL00wbUF5YnQxSGtQZ2FaVmNScmFXTVdJenRVb1MwSkpsTGN2dkFxaS8r?=
 =?utf-8?B?U1IzaTFQcDVLR0h4RzN5TVo5WXlUa1lhQ2h2RnVJRFIzY0VpbHk4ckxSQi84?=
 =?utf-8?B?Z2VGNzVmZUVRMFcyVktPZmpjdUtqUDNuUEZSdGZwMnhaUlAyVXhFZHFBQVY2?=
 =?utf-8?B?NURJK1VsdXgybWltaDE2OVNvVDZvanpza2kxWlk1b1EwOFo3NFduWit6WlhX?=
 =?utf-8?B?SjFYZjlqK3gvbDVrRkJOV2xORnJ0aW5Tc3VOTSt4ZkxFMWRuYnhIYSs3Tisx?=
 =?utf-8?B?ZTBtRkM0SWhkQzBaZVBMNDhvSXBhWDhyV2EybTlxTkwrbm5DSnJLQlgxN0hD?=
 =?utf-8?B?REg5QVN2akg5Q084bVhnaVV4cDJSY1hFcHB6ajBJR3JYc08xdndNU0xJd2Q0?=
 =?utf-8?B?VEErZ1dFRjNNTlRZVFc0eVhuTjYzUU1QS3g4MkgvSVRXZVdxeWdzYTA2VG1B?=
 =?utf-8?B?c01RRjQ1Uy8vSDI0Q0x6aUtEaVBwM3FqRVA5dzYvSU1NRzNxbGg0MzY3dVNk?=
 =?utf-8?B?ajl0WldoaHBRUU1DdTBDZko5YVg3bm9WdWFWU1JpTG4wZ1ZVUDdROXlsK3lD?=
 =?utf-8?B?aUpjYjRPWkdZbW1pV3g1bExWZ0IxQmFOUHdtV05lNG5ZSGxiN1M4WUxuc3Ew?=
 =?utf-8?B?ajgvSFQrQWxVNlAxVlNFaWNlM2o4MU5XN3VmN3QvN3RDeTJEVThlSklnN1BK?=
 =?utf-8?B?SnkxTjFCb1FpMzhGT2EzYjJuMTd6WEtsY1ZIQVZsdFRuQUtMY0hBVW5iVGd4?=
 =?utf-8?B?NFRXUWtWUDNWdW1ZcjRQODZXazA0KzM4bTBabEU5TUZpd1RpT2RqZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ddd922-6e9d-4c22-8bed-08deab4cc676
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:52:17.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mN6U5wDJTi1DZhoSbBOaAnWlp+/uPaJIl6HZhDtGgfF6Nvlb2WLIuMtaSUyn2tU4249i2O8ayN5mpSd0EzvbAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10443
X-Rspamd-Queue-Id: CAC814D8272
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60549-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

The current driver only supports single stream operation. Add support
for multiple concurrent streams by tracking enabled streams with a
bitmask and only initializing the hardware once for the first stream.

This enables use cases such as surround view systems where multiple
camera streams need to be processed simultaneously through the same
CSI-2 receiver interface.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Call pm_runtime_put() after dw_mipi_csi2rx_stop()
- Balance PM runtime get/put for asymmetric stream enable/disable operations

Changes in v2:
- Simplify error handling by keeping goto labels instead of early returns
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 35 ++++++++++++++++--------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index f45466ede2bb..92178a3dec5d 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -113,6 +113,7 @@ struct dw_mipi_csi2rx_device {
 
 	enum v4l2_mbus_type bus_type;
 	u32 lanes_num;
+	u64 enabled_streams;
 
 	const struct dw_mipi_csi2rx_drvdata *drvdata;
 };
@@ -539,26 +540,33 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
 					       DW_MIPI_CSI2RX_PAD_SRC,
 					       &streams_mask);
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		goto err;
+	if (!csi2->enabled_streams) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			goto err;
 
-	ret = dw_mipi_csi2rx_start(csi2);
-	if (ret) {
-		dev_err(dev, "failed to enable CSI hardware\n");
-		goto err_pm_runtime_put;
+		ret = dw_mipi_csi2rx_start(csi2);
+		if (ret) {
+			dev_err(dev, "failed to enable CSI hardware\n");
+			goto err_pm_runtime_put;
+		}
 	}
 
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
 	if (ret)
 		goto err_csi_stop;
 
+	csi2->enabled_streams |= streams_mask;
+
 	return 0;
 
 err_csi_stop:
-	dw_mipi_csi2rx_stop(csi2);
+	/* Stop CSI hardware if no streams are enabled */
+	if (!csi2->enabled_streams)
+		dw_mipi_csi2rx_stop(csi2);
 err_pm_runtime_put:
-	pm_runtime_put(dev);
+	if (!csi2->enabled_streams)
+		pm_runtime_put(dev);
 err:
 	return ret;
 }
@@ -583,10 +591,15 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 					       &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		dev_err(dev, "failed to disable streams on remote subdev: %d\n", ret);
 
-	dw_mipi_csi2rx_stop(csi2);
+	csi2->enabled_streams &= ~streams_mask;
 
-	pm_runtime_put(dev);
+	if (!csi2->enabled_streams) {
+		dw_mipi_csi2rx_stop(csi2);
+		pm_runtime_put(dev);
+	}
 
 	return ret;
 }

-- 
2.34.1


