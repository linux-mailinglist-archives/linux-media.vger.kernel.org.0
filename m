Return-Path: <linux-media+bounces-65861-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w8WUGyQlQmrO0wkAu9opvQ
	(envelope-from <linux-media+bounces-65861-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:56:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 089CD6D7393
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:56:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="nUO/eIYp";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65861-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65861-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEB7E308EB6D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8603B3E0252;
	Mon, 29 Jun 2026 07:42:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070CF3E022E;
	Mon, 29 Jun 2026 07:42:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718939; cv=fail; b=pFE1eepS5D2tb1qtofIx1FDTpr2XJTVmUIPAfNuxoOJANc3Q1ceGUG+3qH26B+e+ksam4xudDhDdZRNQXiCAiWCG5ihjtdffgGydjYSNNhY35pJ3FhvKUvPAajM1FLEtv9Erj3w84PeRrU9h7Atsr/1GgJ9b27f5fXoiXMUnDs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718939; c=relaxed/simple;
	bh=42Ga+w4BTg6tJ5w7mHxxNciWlxwzLNuPhZENeYX2874=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=YN0dnoN5UwU9kXepFskbbP71H529Qc0Y4KV8U4yy1DekNL4bAelyXW3e+KZVN74cNluVlj3mXutqGV0/Ukd62XDNDYXJwMKuLX4DUGrX+BLNQ9A34Z0oIP8pPRHCwoL2SmNhIZy0sb39g1SunSEgAYacFZR5YGSanPXmOPqEjiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nUO/eIYp; arc=fail smtp.client-ip=52.101.65.5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBGtvgii/LyzeGeD6dF0COZqYy7V4pDJ9aMPKLad31157vdHSuwUF0N16aIKaWdBRq5t2AD8yk3gH598kyMLVvyLfSnTficEjoEQeS/QDwMPa+5NhhPVKm3x4Vl8RhBvO3VifIwA+KKc82j5loXdLQTrUAGboZGf6C0sF63YGHeUQmhE+t86oDbAiqjaXpIPL2DSSqUIEo8eYEfE0/Wnytfj79JdVMPxTh26lk6ypJ8Lpzn2CxWvTmUWvxwKHtLWG21MtR9T+IPrGmxdCs0nThivrZ3qXBllCUiM8YZWkcTh3JZ3DUq9ySYPo+EtqiDG/rz41cAAEBpP9cGTR98YNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kAtYZepwMFwZa+DEED5zfoyCOcNQ0PKTpRk6/DRPiA=;
 b=M0cxuKXjtWdcxoQZDrs58ErrYEgttvcPD+l4YM4FJwemkI+l9KwhmKJ+beo8raEcD7JL0fRwACCwD72wG5sPkZdq+FIpaYLgixVLKD11wKuQTtDrgY5BEOspFL+hejkUojTEr0AuwkNaDaeVQTSddbRwCT8sU/gvucytuzuOCszxLvQN67O0PMl7jSEjM53ECidb6/krPfgcdLnGG1huXRLAgQFOi4PjqXKt21ikUotYzoSJL7mwLJ0Kd8fIauntV8FNczVd6vjuegoPWWjfLniS1v70jvFRp3uQEs9bYVpJvzzTi9m6SlmX2pyKufXTUbtGdGvZVfl+2tofX2VcAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kAtYZepwMFwZa+DEED5zfoyCOcNQ0PKTpRk6/DRPiA=;
 b=nUO/eIYpRkPFp7jnvvh5CJ3ujuBM+RwUbBgJ9Hrb2in2bgzNrQs8BcJYQ7sAxQrTZ4asPeewItAXf5gAIolEr/zMcu+88BM0hMT19e3HD8/0UgZw35fXmnN/2M4Fpg2swfIZMPpGGdQmKwiW6sc4K+GbzJ3TUV3ORp5piSOFmCHAQ7POazdf/0U183x0SU2GA6lNQ72HdwsIuIGoJqf4+YWNs56GkyqM6m74DXYve6olBnKqsslNSpGdVvUiqjCbWmARiNK0eJG4LdtYxGv9SJbMmID5yDdFZYp7SrsAAvTzWLNjgvas8BwZFAPH/lfuSW8ZCzzYvt3wiMcU0lA6TQ==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS4PR04MB9549.eurprd04.prod.outlook.com (2603:10a6:20b:4f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:42:11 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:42:11 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH 0/5] imx8-isi: Bug fixes and format support enhancements
Date: Mon, 29 Jun 2026 15:44:54 +0800
Message-Id: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHYiQmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMzXaAKXQODNAPTJAMTk8RkSyWgyoKi1LTMCrAp0bG1tQCTIDzbVQA
 AAA==
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
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, stable@vger.kernel.org, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782719134; l=1842;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=42Ga+w4BTg6tJ5w7mHxxNciWlxwzLNuPhZENeYX2874=;
 b=yAtz1u81+bOKJhI1UoIh1TJSCBDd+d37a0lnpOXLbBMCbG06Nto53L8MZ4UemDl/U3F2Tt56l
 NfQ5T84UOATDbEh7q+fhJeIS2v26wpyhRi/VRfvu0clcVXH0hZo+/95
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::6) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS4PR04MB9549:EE_
X-MS-Office365-Filtering-Correlation-Id: 641a4e44-7123-4e0f-18e4-08ded5b1edd2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 jdOub9KxOyEEoqWVDtqxmxqmW2htA89iTRo/rxQZYM+Uj3X0vB+PccJsXj4L1KZSKK5DInyKmF75oPHTIg2HAJ/ZB9yD2t5T+5ofXQCOGFr681zHwQ+M+Ey0bluD6kcKLGGs79rUUNwkUyVPg63tRtp3+HckfJr9DbrKV1gpo/+1XcDpku/IVT13/kXa2vMoNR8FOej/qiR7K/HL/N73BDqtI6Rl+MoLSjrDoz8xKM5vcaLHpriTVw27NWVgpj1dzus8zGx31TOUMnpq5A9CXu0BPhYXk/g+g1rSseF9e50XRaaor9ZD9fVc1vfhPrBuxjfIuFgJyc+Im4prPGHXt3DfYz1cGw47YMnj1OjCSQXMXuGLZxBfXtGmRbsA72Jqfe93zNxuC/AAJyD1Q4uF24Ccc5gTA5UIHTohU5Uicv/5P3Jpc1GDln7N4jfYiT+nXSZjqfpiB6OK6ZcWbDxep2Lvg70/UzVL/zrNfVeNFOimne9mUCI/ysnkVtQrbEMWkm0MGDhJtEekc+l9bwcNwc+zl2olipfED07Y+Cce0B6KdNNL0mL7o/28GOSjRvvH7FK6GB185zzwcGDaQK1+k7mfYg44uu/wmBf89sHqoWkoiN3XaVjOnnKwhshjkXLISIfMR0b/6xLx2Bh1lj50++zjMzjwICohS6HffSYpY1E=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WUpHbis3OWROMWhQbWdrMklXcGVEUTJQbFdTdk91dTJya0N3ampWN0RZQzNl?=
 =?utf-8?B?RmVncmYxOHllcHNlcWREL1Q0MXJwR3hwMUtEUWRzM0tQbFF4eVRHbFBPcDVD?=
 =?utf-8?B?d1k3RVhyb0dDVFhCZzFUUE1yUTc5NG5rRmwyOWFBaU5HVFFOUlYraFNEQjEr?=
 =?utf-8?B?N0k5R3U4TCtQcEV5cnZkbWVqSTR4eTJlTmxhVFQ1V0xBMFBWR3BZTjA0WUxa?=
 =?utf-8?B?QUNPZ2pqV09IMExJZU54ZWtXSHlSenZQK1JJQ3UxZlNXSEpFbWNyWWdsK2Vq?=
 =?utf-8?B?dW9qamNaWGlhMEVqZ1JDK2YrWEVIMkZPMDh0M1A3UHgrZlBqR1MrMzlTZ0NM?=
 =?utf-8?B?bFZzQU1EcWNvTnNRcU4vb2gxSWp1OUVYOExrczRrYUVyWUljanMxeGtydWxh?=
 =?utf-8?B?UnlOajRLdEdtL2htd0dvdHVRNVNTcWV6YzZTbnVZSFVzQWM3T0hGUmQ2NVNG?=
 =?utf-8?B?bVRQcHkvUUI0WlFqcXpoOGNBaDdqenlUbjFIaGtndXRjcmZZWlJqNkFkNldn?=
 =?utf-8?B?cm9CT3ZjREF4UVN0UU1XNDlRTDlzcVFxNGp0VmxJb0tOZGZ0Zkl3cWxXNlE3?=
 =?utf-8?B?YWZQZTBNdU81WlhoWlB3WjJGMnFVOUR5UnlTTVRxT1lCZCtoWVlPS3hkcTlO?=
 =?utf-8?B?MyttUzhCdnI0UExMNzhTdGovejBFVndZdnJZc3NiTmtpVlE0eDM0YWc3Zlh1?=
 =?utf-8?B?d1JGc1V2L3FrY0tiTHZzbDhzcGE3TEVIeWcyNE51cys5cFZVSkFtbStRRWVq?=
 =?utf-8?B?R1FHR3k1YjI3bDAzOFIyNXhnUldCUmhaZ0Rpd0d2Mm43RmdWZ3E5eXBFUGx5?=
 =?utf-8?B?WU1ibUxKMHBPL21TNjVxVmp6c2plOEJwbjlqcUJBRUprUmVISm5iczdYYzFh?=
 =?utf-8?B?RG9BMmlOOWwybFdTK21RK1pBWTAxaEV1dDRUd2R4R01PWWxzbDAzN0l3TVRl?=
 =?utf-8?B?ZzBjak1pa2pDM0VGU1Q4RHBkRVlLaUlDaXZLTW1Kdm9zSzVndW9OTjJwT2lV?=
 =?utf-8?B?bGhjSFl0QjBIT2tsdkg0czFHOTEzUWoyT2EwZWlKb3ZJWi9qV1RteUx2VkFR?=
 =?utf-8?B?eFZzWDlkbVZ4K0xpRW5XZmd0TEdYb0J4Yk1RNmlnZ1ExeVl2ZkZlbWE0SWVw?=
 =?utf-8?B?SGJMSzFKdzNvVDRhekxzVGQvLzB1WkhPcE5FZjkwWXdGTnhEZVV5TWVwckk2?=
 =?utf-8?B?eHk0eExpaU1jeUQ5RG02WHhaaXkralVSWi9HcUp2aG8rOHFKUmVSRjhSWmlS?=
 =?utf-8?B?WDlmb2dlc21DeGRZbWxiSXpvZjAyeVFrb2h3R1BiMXBQU1ViUlRhNWZJRjNG?=
 =?utf-8?B?WjVZem01cHdYUTRrSnIvWUloVW1ib0I0VndXeWFRYURwSFZ1VlQ4QUx1eW1K?=
 =?utf-8?B?TXpMeE5RamN4K0Y0cUZTNHNHeGdpcmdFRkFvbXg3RVcwTlk1Z2dNRlhkamhP?=
 =?utf-8?B?RjF4b1B3U1hSV0lRd255cnhaTk1FdmZJTmtrY1Rja1VQZVBreFhHNmJSNWRO?=
 =?utf-8?B?dVorVFoyVm9JN0VLZEdKVDRpTTBuY0xhdit4N04rT0NYLzIrWm9ITXNad3N2?=
 =?utf-8?B?YnZtL0t2cXlGKytTYXIwdnk4b0JtY1ZIaGkva1J5L3NUaVM1MHlFZ0xnaE1S?=
 =?utf-8?B?dG9mOUFHdkdld3N4S0Uza0JKbGtub3U3S1Y3MGxjcG5va0k2VkZTenJuWkJU?=
 =?utf-8?B?Z1hQbEl0S012V2xvendSTGpzZG5OV3lPVTl1RUwvSDdvenVXLzBoZUNGZ0dr?=
 =?utf-8?B?NW5HSEF1SVRTVHcvaG9QLzU4aDZwMldHVnlmakhHUWFqbHVhdTJuUzZiYzU2?=
 =?utf-8?B?QVoreERqYnVTbGtPVGZ2QW50cGVyYzRiU0wwc2psckszRUR5dk45SnJCWHhV?=
 =?utf-8?B?cU1PODF6NmN6T3Rjei9CVlQ1TGZtWTVRbHhhc3pOdWdlZUZLeXdlUnJhcmFG?=
 =?utf-8?B?aWIwbjR4d0YyRktkUG9iR0pscng3MW1qZ291OWl3VGtMKy9hcGg5TWUrYmgv?=
 =?utf-8?B?TkFpaDVFUzNMcGJkVnJ3V0JvZjNvaG9jYjN0WjRVZFUyWUpaZzQ1NWc4QUFh?=
 =?utf-8?B?Rk4vYVg1aTUyNWNHaVlNUGFieEpENUJTOExLbktnRm4vUzdLSEVWaFV5d0pi?=
 =?utf-8?B?UmFLMjhIbko2UVpGelM0d00yL1NxU3BXMk1SSmFUSmU1c2dLcXRpYTRXc0Vo?=
 =?utf-8?B?OHYrdW1wdDQwc2MyeDlEUzRDYndhZ0pBVlpuSm52Mms0WFZzQVp3ZTY1b2dh?=
 =?utf-8?B?dzlMUlpvakFSV1ljeWNYd2l5WW9hRUxRUDZkUmUySFVnMVVsR3RKbHQvN2pU?=
 =?utf-8?B?N2FqY21VZDRVNGV1UzhPSTJlWlpQckZzZ1F0UGdETW96T0plT3NsdHNkczdG?=
 =?utf-8?Q?ypJbLq4PB8GJLHSyaKUxbEtraANU8QWHNc1kO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641a4e44-7123-4e0f-18e4-08ded5b1edd2
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:42:11.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjnjILf7vSscq39wOuEJ+0SbN4zZaqHahVordixNjz15buA7yRUmr+uGowAsAhUEUrrOAkWPAA+d6SLb1OUQpnmg+sezAHtGbayHXj2iH2EbCN7fpmWBRbhIgJkP/bpD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9549
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:c.hemp@phytec.de,m:s.riedmueller@phytec.de,m:jacopo@jmondi.org,m:aisheng.dong@nxp.com,m:guoniu.zhou@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:guoniu.zhou@oss.nxp.com,m:stable@vger.kernel.org,m:laurentiu.palcu@oss.nxp.com,m:robert.chiras@nxp.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65861-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,oss.nxp.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 089CD6D7393

This series addresses critical bugs in the imx8-isi driver and extends
format support for high-end sensors and Android requirements.

Patch 1 fixes a critical stream ID validation bug in the crossbar routing
that could allow userspace to configure invalid routes causing undefined
behavior.

Patch 2 fixes a stream reference counting bug in the crossbar that would
incorrectly disable active streams when one stream on a multiplexed input
is disabled.

Patch 3 adds support for 16-bit raw Bayer formats (SBGGR16, SGBRG16,
SGRBG16, SRGGB16) commonly used by high-end image sensors.

Patch 4 fixes incorrect color mapping for XBGR32 format in memory-to-memory
mode (marked for stable backport).

Patch 5 extends RGB format support by adding BGRA32, RGBA32, BGRX32, RGBX32,
and ARGB2101010 formats with full M2M capabilities to meet Android
requirements.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Guoniu Zhou (4):
      media: nxp: imx8-isi: Fix stream ID validation bypass in crossbar routing
      media: nxp: imx8-isi: Fix per-stream reference counting for multiplexed streams
      media: nxp: imx8-isi: Correct color map between V4L2 and ISI
      media: nxp: imx8-isi: Add additional 32-bit RGB format support

Laurentiu Palcu (1):
      media: nxp: imx8-isi: Add 16-bit raw Bayer format support

 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   4 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 145 +++++++++++++++++----
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  24 ++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |  97 +++++++++++++-
 4 files changed, 245 insertions(+), 25 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260626-isi-00f05b044ac9

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


