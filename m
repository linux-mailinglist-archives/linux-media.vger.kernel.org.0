Return-Path: <linux-media+bounces-62064-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFvMCgHGC2qWMQUAu9opvQ
	(envelope-from <linux-media+bounces-62064-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:08:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C21ED5764A8
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18B73307BF12
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C323090E8;
	Tue, 19 May 2026 02:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DwTJK2Vm"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013054.outbound.protection.outlook.com [52.101.83.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9025A2BEC45;
	Tue, 19 May 2026 02:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156335; cv=fail; b=TU4VaQRwgjUvxaCQmflZP0ge3cMcS+cU/zyjOW1ylpMHCILmWYi08qkLsgfLJhvu8n7AlNfLTeutlO7PMigDBJdeMrxcjYNi+Vv1IXdlb61yBtXpiv197PWHq3Sey1PJ6UvmArzbzRiFGHzHgN/E+BtASfJkKPTvQSI23Yx+kx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156335; c=relaxed/simple;
	bh=bG+DS/0ewMdNHV23cYrXxlFJm8KaPiWL/g0hJ13vsnA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=M3+5+IMy4g06PeBEoa1ttdq6dMya8Jy/hXEVOampS3t/7dnKLBxkJ7VkOcf5kvHSnum21iscn+4Dto4Ojfpzq40UGF5OPVkxAmrhEajknX2gpFQf33NaxkBm+rSA9oqy3Hb3gfMIEjrSPl+Rv+TEMa4ucdT78dXzToecKAQqDMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DwTJK2Vm; arc=fail smtp.client-ip=52.101.83.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObA2/y0rlp+PwFc/LVDHUdISwOOOD34LN9+yXONLnJtZ1k3IADpE3IQe4BRKEB+d1gzZ7TtlrNFPuStfwgp6jp/vkPUk7YkJdeQOlefMH018XIzDsxFNAirSPU+4t2PXugTyNul3tqKBj7e0EcyQHjrmzp6IeLyStGme2k5ivzHtuNSkBUX9QslS+Ejv9I10/lXuskHp6iLvUAG0fOJhEEB2qv0ajAlHzef99W+/sedJBDE6nClCT0I/Om88EhWvExtH4GFRQZByNrH/n60+hjqXOQlN5kwX+bvS4AfPWLEfb5QYSEiloCNWsSGJtE2R4AC4qp6vRuZb9nAF+XLLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHB9SHi+fKnZBXLXZ1bu7K7W3GRCfhmbGidPvdUtrIg=;
 b=b4h91WMoUk3j/Z+C++M5IsJh0KhnIzeJVLx61HnUVyaKXQTZK+udzE9HOzilgUK1bkR4NyYzy1zYIDXB/7NOsRfwyXA+zn7rjr194ve6DDTnDkRSaHBphgY304fqpeCpMuaBlE830ZKjKKNZj1Oz58A8xcZFrKgjxTKkstcVRZwEb7/0a+DlRPM3jInCZaw9IpXiHTN9RVPxew8LqnQV9bkhzT88Z+FaF1i1YcVLTRcXA2MrBRwXkZGdytVsF6kLi0cAETjpKghvEuk1Mrbyc0WkjwGEEej5obtzDGEfWI5NAN3QDrAvtUgKQxRlROkY0wk0n9TMs4mdgifsixjiAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHB9SHi+fKnZBXLXZ1bu7K7W3GRCfhmbGidPvdUtrIg=;
 b=DwTJK2VmSNXXA4+duXFQokoZNzDrGttBQRMvSWBC0suUvnoWe7oqMkf5k+D9nKqPqIBrkmQZCSixk3lEgb6BCxO6RFeQ8R00rROOoQN/CIdfzNuC4f63kLK5BkyusclOu3MTrTg5a2AR0k2v4pCvNL5zpZ6TDAV8yeWm8Umok9myGCpQXWMpJxF5r72Yyr+GTLsYGxi8SWGBCdQz7bCUJhC810W3ASPa/dxbiqs7YidUEbRs1qg6M4Ojf/hbPjwv/UO71KrfB3Ws6KoPzfpay+TOIEmJp1qjiE+SyLgNoaCNIm78CTneFv5CDPMeN8H3Y9w9GNcqxiCdp35cQThgXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU7PR04MB11139.eurprd04.prod.outlook.com (2603:10a6:10:5b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 02:05:27 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 02:05:27 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 19 May 2026 10:07:41 +0800
Subject: [PATCH v4 4/6] media: synopsys: Add PHY stopstate wait for i.MX93
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-csi2_imx95-v4-4-84ea4bb78a88@oss.nxp.com>
References: <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
In-Reply-To: <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779156481; l=4340;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=bG+DS/0ewMdNHV23cYrXxlFJm8KaPiWL/g0hJ13vsnA=;
 b=lao0uZ+qWSOy8sMTwahY61XbMmwUt0fFgbagefr16MBPNkurEBVxrj+qNXEjZyZwEh3Rgdk1y
 EwUdunSpG9oD8FEid4y9UO/UvFOKZ2OLy9DJDQ0f00V9SZ9arqSAkT0
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU7PR04MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: 0898b770-9dd9-43e4-e533-08deb54b18bd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|3023799003|11063799003|38350700014|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
 4K7IjPiCKpm4LvUft2fzGx6dDTTbpyDcOGnky3vEbRAHXOCCB/vlVtb/BuR9H87m+jcU/YEP6a6Y+9h5tpJOGE9NBwPFkUs8i4ewt6VnMXMIRqMfxaUj6FRhdx7sfuS69Oqh+2LmaJyeBK1OQhvWmv2pBl6w3H2WhD8KzUm8X6xIMBM/8LW/5yhyDYm9gNp5IoSynPoREMPu06p8RY5ftC1KEjkrF2YPcTt2EfOakWSvunHpSo7x53BUFmP1bS/9ZMK3BmrL29IfBneihLMDa18cn3Iihj3XS++R2NeblJj7iZiSkZJ7zN7nqiI9jlXry81bdza094n1nqYDrnScRJQJo1gb6eFCVPbkHZvfpmV9hNNWWV+K31EUxfKz8+P9+ZRzplSUTRd/S3R8Zg8SoMhrxb5xCFoohay5YcMH70ezwjmNUT5fbieqSvgSdqQt84pdz8jsJt7JH9ad+D9jtFccVB0MsYfG3HVvHa1aM3RK35981Fd/ok1ciY0fXPpcH6yPxDUuzXiFZCVurnCwGugIiJFLCw1yq+lNRZSDI8BmSpqcdZtj2Of5UfGteaOs896/2KBmCDKvgZaQONKLW0H/0oJ2+HJP+vb4ae59vFj8MQq2IigtghPjWAK1/7pSvhg2hgDkdzV1iiUQQ3SddxMymrG8/26jUuZuG0A4YewbEWqcvoiBKsWjzn4aXYEPZFUY5a5WfaRTTniBfNzvte/SZz+2IHUWZ9lEDvF4F/4AveozTUynLT3DqMdwheJEVKaMJnQHDIT9JO5HiVDreA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(3023799003)(11063799003)(38350700014)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WVlsMUJwU1k1d0F4SUxpbnRxQ1o2SnpRWk9Gc241Q1hTRnJQUWsyZUlIUFQ4?=
 =?utf-8?B?TllxRXB2cUlmZzZjOWEvcVh6eUtXTEw3b3NtbDNWNEFSVkdwZEZ1cGZSallj?=
 =?utf-8?B?cVRDUmhrYnZjcDFvL3ZLc3NvTWozRGRKeG02SjN5STYzeUZ1TXdxMm94akVu?=
 =?utf-8?B?L0JVbU0vU0hycXZOWGIySnVOVUhmRnRNNjRVRkJvbXlQejJuZENPc2x3dm1l?=
 =?utf-8?B?ZXNKZEp3VXlWUHF4UngvL0RCMWtEbGZLMHdIZnlBV0RkVVNxeHRCc2d2c3FC?=
 =?utf-8?B?dU5QMzlXdHdCWlNGejF0M2kxNU1KTkNqaHFCZCtSSmd2blAwNFJpU2tZRTdU?=
 =?utf-8?B?TkVnb2dQZldwbmFiRjR4dG1HQUUvcFNVYlQ4VDIxa2RKdXkrY3ppWWtnWWFQ?=
 =?utf-8?B?REVpQnQ1emw4TjBCSVNTNTZSS0VnbkdvQzRmRDJ4SkxIdVVtd2x1bFVNck1P?=
 =?utf-8?B?a2M3cjF0QkY1VkJkVVNCb2pMS3lIaGwyMHFvUmFTNEZabW9paVUrMnNwUnhU?=
 =?utf-8?B?YnNDZWhzWUQ2eDh6Nm1aT0F5Nk9PSkFVOG4rY3RnbmFLc1VmUUVsam5TQ3VJ?=
 =?utf-8?B?eHFIVk1KZnhqYVpMVTdWMkVzeVRxSzdyenEzSnpyRG1xbHNYb2tuekV1MjJD?=
 =?utf-8?B?NERRNGpIS0hHdkxKaUlMeFRoVGNnYjJWa3hQTXEreEVwZ01ycTlGNjVkSUZt?=
 =?utf-8?B?a1BPWkJTVnJaQlJ1WHNvZEpQc3lPN1pjTkx4Y0ZYOUJwNm1MVkpDNVliQ1hw?=
 =?utf-8?B?SXdqTWRNaExzS0t1NDlTVW5lUGI1SW1WelNMOVZueTRpZnVWdkNySTVIcGdM?=
 =?utf-8?B?N3dUbEd0TE0zWUVkRUJjV1FTdUl5WXI2VzQyVGh1dlczWklyT2ZsR3Y4QlBm?=
 =?utf-8?B?NnBhNnZwWWdwNFBOT25IVitMR0VlS0paY0I1WFdIVVdOMGpCTUJHQU8ydzBp?=
 =?utf-8?B?TldnTUFyaXIvRVhHY2pPVk5UUnJGYkVyRk9sTUxQdFJ6TlkyaitlU1ltRzF2?=
 =?utf-8?B?TEdPNi9XS1UwaVhiYTNWTTQrNG0yL1p1eEJxUDVsV1duTkRaL3ZlUm1NRE1r?=
 =?utf-8?B?amRrS202NTdmSUVYdjM3aitXcTdJcWVjVUNaRHBCaUFjYzBzOFBlTmxBc2Vr?=
 =?utf-8?B?ZXI3b3pOb0krMlVib3czZllyVkNscDlkd3V2RmREMXZsVk9jSGh3ZUk2N3BJ?=
 =?utf-8?B?b1hNVUdCdWY1YXVFU0pxTFlIS2xKU1hyQlRSblA5dVg0WThSN2RybmFrRjhz?=
 =?utf-8?B?Nk9yVmhJODJkL0NmZlVTcHRxb0I5L0JDdGtTcVY1RExDRUgzUjR5WVNCOVF6?=
 =?utf-8?B?Wi94MFp4SDZNa1NJUnZYTDlkeU9Sc0tFRXNyL0VZRnNjTjFaeXV5SEdQSmFD?=
 =?utf-8?B?NFRJbXJuZjk2MVB4QVd3Tm9CR1M4S3F4TFVnQm1IQ3Bxb2VLUnozZWRZYmNx?=
 =?utf-8?B?Q3ZleE5DN2c0ZHR1b09PaXhFNXhTV2x0RGRpWkV3R1VDeWw0aXJyeDZkQ0R6?=
 =?utf-8?B?aXRVSWI1a3NROFk2a1ZuUzVVTmhmdXlMak85SXJMU0JzK1FYVWpmTEFWUlRD?=
 =?utf-8?B?SWtIamJMQmVCbGdDVUxBbHNMRkowYk0yY2wxUzdjbnVGYmg1bFoyWFFrcHd2?=
 =?utf-8?B?Z0hCQ2FtYy9Nb0hTN0FZYmYvU1dqSWVQNVNYcm53bEhzbUd1OGxMaEVRakth?=
 =?utf-8?B?SFpmM1VFeUtqYmowd1RvQWtub25TOHdMbjJLWXlBT0dqWm1hYVNYTEJFZ1pu?=
 =?utf-8?B?S0tHdG9RUFREaEtBRjljeW9qZXhKU0xPR2FWZktIQ05JNHhPZW5Wb25rQkhK?=
 =?utf-8?B?SnJLMFZFSFQ3YmZWMWNqZXlEdGVRUHFNR1BNMi9yeWxWcFQrWEVRR0M4N0tG?=
 =?utf-8?B?K0xPSUxhcTg4Y0wxSU1zcFA5bk5kZmhBRjErWHhOZmFWMTMvdHpYMVdrQjJH?=
 =?utf-8?B?T1BNMDg4Qkx3dmF0b3RIclI2Z3Z3bHlZUFo1Y096RWhMLzdYbHMyS1ZoaHFn?=
 =?utf-8?B?M21wOEljQW1UUG94MFRyczhSVlA0WEFNeGVUcU12dFVGNTZVRW5oUEhFYTAy?=
 =?utf-8?B?a3grZU9tVTZSbnVubCtoTFR5eHFIU3VkNWw3YzZ6RDBzMkJENklBdENBRzNY?=
 =?utf-8?B?OG9NQ2YzaENzeCtRdjlHZmF5RWZjOFJHcUFWUXZGYm1KdE84Vmk5d005ZkxJ?=
 =?utf-8?B?S1p1WHMydjZDbE9NcjdybmJkVktyZGpBc09iL3paT3pRTHhvakF4ZlRBWG1B?=
 =?utf-8?B?UjAvVFltMnp3bFdGazZuWDdhMW5vNmdyVll3b1pkc1F0UWlLdHZYZ3dOa285?=
 =?utf-8?B?QjhoQTBndUw2ZktSQUJsOUlhVU9YU1NPTHJuRjljVXVudzRqRCtxZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0898b770-9dd9-43e4-e533-08deb54b18bd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 02:05:27.6797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQY7hnTgD+JXgxMwnK3SlFXShehE1ChwZCrlumdi3sN0rpL11anwiEYYanE4aqfR6sT5XSRyPr8OchEuV/jwXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11139
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62064-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: C21ED5764A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement waiting for D-PHY lanes to enter stop state on i.MX93. This
ensures proper PHY initialization by verifying that the clock lane and
all active data lanes have entered the stop state before proceeding with
further operations.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Removes redundant register availability check
- Uses read_poll_timeout() with dw_mipi_csi2rx_read() instead of
  readl_poll_timeout() with direct register address
- Fixes stopstate condition logic
- Check PHY stopstate after sensor enable instead of before to ensure
  correct timing.
- Optimize PHY stopstate polling parameters (1000us->10us, 2s->1ms) to
  balance performance and responsiveness.
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 92178a3dec5d..8a34aec550ad 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
@@ -35,6 +36,8 @@
 #define DW_REG_EXIST		BIT(31)
 #define DW_REG(x)		(DW_REG_EXIST | (x))
 
+#define DPHY_STOPSTATE_CLK_LANE		BIT(16)
+
 #define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
 
 #define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0), (x))
@@ -65,6 +68,7 @@ enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_PHY_TST_CTRL0,
 	DW_MIPI_CSI2RX_PHY_TST_CTRL1,
 	DW_MIPI_CSI2RX_PHY_SHUTDOWNZ,
+	DW_MIPI_CSI2RX_PHY_STOPSTATE,
 	DW_MIPI_CSI2RX_IPI_DATATYPE,
 	DW_MIPI_CSI2RX_IPI_MEM_FLUSH,
 	DW_MIPI_CSI2RX_IPI_MODE,
@@ -87,6 +91,7 @@ struct dw_mipi_csi2rx_drvdata {
 	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
 	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
 	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
+	int (*wait_for_phy_stopstate)(struct dw_mipi_csi2rx_device *csi2);
 };
 
 struct dw_mipi_csi2rx_format {
@@ -139,6 +144,7 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
 	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
 	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
 	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
+	[DW_MIPI_CSI2RX_PHY_STOPSTATE] = DW_REG(0x4c),
 	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
 	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
 	[DW_MIPI_CSI2RX_IPI_MODE] = DW_REG(0x80),
@@ -556,10 +562,19 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_csi_stop;
 
+	if (!csi2->enabled_streams &&
+	    csi2->drvdata->wait_for_phy_stopstate) {
+		ret = csi2->drvdata->wait_for_phy_stopstate(csi2);
+		if (ret)
+			goto err_disable_streams;
+	}
+
 	csi2->enabled_streams |= streams_mask;
 
 	return 0;
 
+err_disable_streams:
+	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
 err_csi_stop:
 	/* Stop CSI hardware if no streams are enabled */
 	if (!csi2->enabled_streams)
@@ -871,11 +886,32 @@ static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
 }
 
+static int imx93_csi2rx_wait_for_phy_stopstate(struct dw_mipi_csi2rx_device *csi2)
+{
+	struct device *dev = csi2->dev;
+	u32 stopstate_mask;
+	u32 val;
+	int ret;
+
+	stopstate_mask = DPHY_STOPSTATE_CLK_LANE | GENMASK(csi2->lanes_num - 1, 0);
+
+	ret = read_poll_timeout(dw_mipi_csi2rx_read, val,
+				(val & stopstate_mask) == stopstate_mask,
+				 10, 1000, true,
+				 csi2, DW_MIPI_CSI2RX_PHY_STOPSTATE);
+	if (ret)
+		dev_err(dev, "lanes are not in stop state: %#x, expected %#x\n",
+			val, stopstate_mask);
+
+	return ret;
+}
+
 static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
 	.regs = imx93_regs,
 	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
 	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
 	.ipi_enable = imx93_csi2rx_dphy_ipi_enable,
+	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
 };
 
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {

-- 
2.34.1


