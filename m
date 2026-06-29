Return-Path: <linux-media+bounces-65862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cLpWMjwlQmrP0wkAu9opvQ
	(envelope-from <linux-media+bounces-65862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:56:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CC96D7396
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:56:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=RC1vsbPP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65862-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65862-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75AB130A315D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5703E00A5;
	Mon, 29 Jun 2026 07:42:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010048.outbound.protection.outlook.com [52.101.84.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4363DE450;
	Mon, 29 Jun 2026 07:42:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718950; cv=fail; b=O56+n9IGfUXDZFzhi8XySeQb+EPRty3dlEjtU5Hm7lb9E//uGVp8oa1xMnyec1T5wFtQVlZyR40x+bTPXY9PS4msaIZudR+dEuBuCanq6af27NOiipXLQZzrjG1DgAcLclAnY4JUts8tnVZatkuj+g0xKYstKx+ngbqlA8XqqzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718950; c=relaxed/simple;
	bh=DhYU+0fyKaoIIURnfqGJUwqcu8nL0r5r8myOt8XH4Hs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jNH3h7tEA4RUO3cPmtrTvVvEuckDeta40QNV32eCSH7HjfzmNEcrk4UxDVbT4xqWj8IwRmzty9tUbgYyTZUVQELgDrQO0PucLcS/g+RYNICVkZREa04R2Qsrq2J7AHfM+1J3dN3T5qV8skkzNanHVgOHlhLm+OYIjQUbShxbFdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RC1vsbPP; arc=fail smtp.client-ip=52.101.84.48
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h36+n1uWeZUt4xz/Gi01mztTQW8Wp5B8pfsN2PiGiPTNYQ+ssNdIqDZwR+rQ6Ydlf45s+36j6jwhbWnyaZPIYq1IaDnRqLkQ+r4MxqejYlwAx1ZHXS/EOAGQKZHZkAhjgoVicsToyNU2D2+PTw967vBKXTBJ91waJPtlQBhDbOFPwzuvdYg7+Z/JUPLS3u8Q+DJZaFvMUU4jEy/Z+9P8ZbQQdXJvdLQuwC90BAB5LVok1K6T6YhqQqH9dMh80N6h/TPzNIjNmn57PkWw28tSYsEc9+QRBGsQwD4MqYIq8kufkKiTqhGEAbCNKHC8gizfNKDl8a/Cp6GD90EKZZJxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZP3pfYuv5B3WVivpewuvZukasyQe3dvKgvS7+7X/SkQ=;
 b=Q6ZorfoqFWE4/S5SCOYKVQw7w9vrEaEAOImxPkKXQIKtolWW5k8wk769hGByV7f3U3THLZpCIsMuP5freoLn8cot07elZEPBBGWyAj2uOHEDJn7W+7N/tANNzsjF5Hwqrbp0nBz2qUeNlwzyoP0Ljkn6QDoo5/QHcKSR+o0Estb8lnO8pNu+JeO4nn7MsGdllbEXMnDR/Dmsfl+JsKgS9CEH8rXdpulk2zOgOYyifgfkVQWfRBacSHEaiC3m6x3J6JJ8Fdj+zlX3cNOFqgOB7hls4ZnVtDCX6uRlVFZddECOwOyy6SwbmYY+bR5WJTNQyar/DAIcYvGEwZ6ZkjlQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP3pfYuv5B3WVivpewuvZukasyQe3dvKgvS7+7X/SkQ=;
 b=RC1vsbPPhE1gQXEnMsSsQxHPDd+l6FtlkPNi0fb6Iii2MZaV33dkbItCro2Axoc4HliCw4DoRlNkFm9ft1ViB7Cz7gMBTcvUVJ9FgbZC4AaISSz/Ft1lrQozDuI+bN2dDuKzooX1zduOzIho2wdeSEkdKCj2mQy/mvC3j0aKv55gEa4HgZ+E3ypZfgTrLsudhGIsZ7HOB6UDKd2NadKdmeHH9VxRnpNrWwoPG1vRRsRgoTNJkQUEt34W+o2A2pbYgkuAN9Bb7xmXG2iZs1xBMnkNNcYK68rolgSlFwokDdgd7EDfARewXC7AmzlSG7odvQAgVh5svAInOobZ2SnSJw==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS4PR04MB9549.eurprd04.prod.outlook.com (2603:10a6:20b:4f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:42:18 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:42:18 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 29 Jun 2026 15:44:55 +0800
Subject: [PATCH 1/5] media: nxp: imx8-isi: Fix stream ID validation bypass
 in crossbar routing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-isi-v1-1-deebfdb1b07b@oss.nxp.com>
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
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782719134; l=2863;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=DhYU+0fyKaoIIURnfqGJUwqcu8nL0r5r8myOt8XH4Hs=;
 b=SVy4BS6DbZ7Qkk/lj3SPEouB6BevM62hQPWafjsaOOx2uS3Q13meYXJTaEcUGSS4gppc4CZ2P
 gKa6Sem/tyoBF4ns9maawW/ceBYAMvs/atBe9nLh3Us0lPKrf4FsraI
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::13) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS4PR04MB9549:EE_
X-MS-Office365-Filtering-Correlation-Id: ab27a8e4-0b54-4dae-4426-08ded5b1f1f1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|18002099003|22082099003|5023799004|11063799006|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
 TfdReEVLb+ht2oGIWH3TShClcHTuaHxdjv/ZJngkZA4VZ3Depil4eC+mgiKkqa9ANla+aJbRgWOdr8vYgwshPfYaaZqPlq8J1CCD/eSdHkp4KyNZ+ONNk3mT5UTi54+sqEKjxhT1zPpZktotwpVTJ0pmEohTYf8u8Sm2QrA6DlDHCyLXdbiBfoty/1HGU2Hdwi5nDo2Py3zxn+2G6QuJOpyicuvxoZqvmDORU3sDRvYKra6RTUx4I0w8abzE9VbW9Tc9nw4c7l3oUJuG0g/Ir50ieGVS4ny1YZi659gP5vs9hErMxnu/yBh4xO8+HR348q0BySOHNPmf/JpAIws8dOoy89pQU1vk2MfxFIDd2U44cW2PZonR9i7f9oPS4wfG0E3GOvMe+ki4GgxA+TssdYipyMbXlabSdO2STGyGR+fuFV46hNMmtTyQEuaYIdGfzFpqPz1zJ5Aus2NLS+nzE/vE9GadwoAACy5HUISjSeEkb1yYVHdkpyiQIYRIqPsrHBsvuIblwycOkTaWouDmIYjbnL80rAhenKMXny3bz2g8gnUpZH8ybbvbCBmOcD1exF4xme5R5nH9CrWHwdeBbeRJ3azM64i5tSqEJ+qBV7DQuYTFbhD2yKa42mQpq/lJo3hlijfrPNm3MvSQtvMwWCkmtpDSxRtxTibkL6mletU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aldGK3Z2dDNuTzNlWllJYU8vUERTdkFIelpzTnhFa3RDU01rQWVrdmcwUWtX?=
 =?utf-8?B?ajc3N1hTRHl3dnA0WXFnZElzdHdlSCtGdTVLMU1hQ3lDM21RWEpjd1ZDUHBM?=
 =?utf-8?B?VTJrUjVkekdwaUdUU0Q1V3ZqeUovV3NoR3gwRDFiUTdXWFREcUFuWWFNSmJk?=
 =?utf-8?B?WjFEeWY1NmRtSzY0TUNFdjd5ZjZOUkR0enFGQUZLckpYbDVwaHRNOHMwallp?=
 =?utf-8?B?K3RPeWxtS2lkYUZyWEZUUzB5TmFzemtWMURJY250MU1QS2d1Tk1MdXdQakdl?=
 =?utf-8?B?ZS81MzYwQ0tib0RMWjlpR0lxMS9WZHBoa3c3UFoxV0Y5WWNYN1NDRzFtMnQr?=
 =?utf-8?B?Z0ZkcG4vVGVEK0h0eFpSN3hocUxIamtkM3NiMG9YM0I2aTJNL2QvZ2F2cWJR?=
 =?utf-8?B?RG0xbWhNMGdTd1VVaHhuRDFtUkwwMWdZTTVudUtRenRENFBLYjdsRkxZOFFI?=
 =?utf-8?B?SEFGNVNTZmlyMHNxamN2aXpPYVZOZzVOeSt0VitZNjEyMUF0cnlyeFB1bmYv?=
 =?utf-8?B?RGJjdi9halBZZVFZbTlBN2UzT1lMc0lzMys0dzJxVlVDLzVRVEZJeDVTRFQy?=
 =?utf-8?B?NHBWbW9DdlVWZHNOT2ZIV0VaM3cvRHUrTkR1Vlo2cjJxZmhXT01tWTA4aWJE?=
 =?utf-8?B?OHVpcUxwNHNkbU9oVzVPMDVsaE9wdGJGYWRITW1MZXl0UEYzZmhiUS9nN2Js?=
 =?utf-8?B?YkM2ZjlyRzNlcDdWOE93QU9tR1RsZUhpSXZ2V1ZLOGc2VEJJT2VJbnFHZ3Nn?=
 =?utf-8?B?R3FmR1VWVXl3eVhvdTA0clEzNG9UMFREQUsxcG9ZVTM5M2RZZzBtdmV5SHNT?=
 =?utf-8?B?VGxFRXFoREZMcDl3ZDRDU3c3TGx3bFIrZm9xK1VjOGFmUjQrYUJCSndJU0Zt?=
 =?utf-8?B?SUxmVHJIMlZjYWFtd0tFVk9YTVV5N1YrZGRWRE8wR0RPbzc5VHpmT3FkV25E?=
 =?utf-8?B?TVRUeW1ueXY5cklEOFhxSkM1akNDc3pmYlNreHVGeEdGTlF1elk2ekR4SENC?=
 =?utf-8?B?OGVOU3lFb2FkdE1hL2hNbWJXdUJtb2lOK0dIcEQxUFo3S2Z0U1dXaUkvei9U?=
 =?utf-8?B?Y3phY2dvUWM0MGc3eDJoaS9CblMvOE13R0NuSDJGcjA1MkNsM1YrSkVISEFx?=
 =?utf-8?B?V2lqOWhid29jVUN4K3ZzWlZ6QXJsM3R5TTBNK082RlNOOWkralAzWnBTS3A4?=
 =?utf-8?B?K2U0bllsN0dWY29sZ0QvVHNRYmxnVFE2anZ0dll0VnVFY1kvUWdVTFVnd3VT?=
 =?utf-8?B?RW1tQmFuUFl5RmpmUkNmeXpHZndhMnl1Zjc1RlpCeXhrWlQ2eDduOEZYZUFa?=
 =?utf-8?B?ejBtNmwrYjkrcElGZXlMemlwTWllbWdpdmF0TnAzVytxRjl2V3BHN044MDZj?=
 =?utf-8?B?dXJtSWp6dndySWl6U2QwS1RzN1lPWG10Qk9Wa2pJdGpmcGlNSnhMWkhqVFo5?=
 =?utf-8?B?T3lPZmZ5RFRnZTRvQUd4aHRIdUtoTnBYUFp5bjhSQkFCbzBacno2dUwrMnVx?=
 =?utf-8?B?VXdwdG5NZDR1dnJIelhiYlYxZHh1SW1FUjAyait5aXhmb01QYnRSK2NWWmxP?=
 =?utf-8?B?NGNCVklSeHFoZ09MYjJXV2gvdzFVejNlcXYvaEJ0QjlwejgzQ0ViMXdndXJh?=
 =?utf-8?B?aldadlhXN0lrN21hZE94QVdlbHJScUlCNVgvSGpGWDhPcnlqbWIrYWQvc3Z0?=
 =?utf-8?B?bzRZYy80Y0kyTXdhNG94Sm9DOFZIUTdVSGZRTnNtTDAxNVloSTZGYmVPaXgz?=
 =?utf-8?B?Vjl1enVtQW1OVlJzYjZWSXdxOGV5UUdBNXlqbnl5Uk9FSk1hbWJMaUtkQ2or?=
 =?utf-8?B?dzhxTExkclhWY2dlRzZ5N2tLRlVLbVM1SFNiMEF4ZTVQZVRTTmxONEpMb3Vn?=
 =?utf-8?B?aGRGRW16dVMrREVhT2VMU2RoQlNkaWxlU3h3QktVb0ZJQ2VxSXBxNk9ybmpv?=
 =?utf-8?B?bUJuSFhvWnd1TFFPWUZxTEtRanZDZUdwUFd3ejVyZWtCckJUNENrOE9FVzNy?=
 =?utf-8?B?T01hNncwV2xQZU5Za2VUMStEY3hCdkZobGZtRXpycU9ZZU1OOUJrRjZCV3Jl?=
 =?utf-8?B?Q1I0Q3AxRXlQbktTWVNOV3VITG52TlB6VGpPenFvcmVjMnBOY1JSOG05dlpQ?=
 =?utf-8?B?QjhscWtBVEZJb2NGRDgrTnlpNVZkMUFVQ2dhOGFIeFFQM2NtaUdSanU5VkpH?=
 =?utf-8?B?Z3BGVVRhRFZFUVB1eERNVlNsQzFwVXFBdVhIVGRjcU1VNk5UK2IrdVZrSDgz?=
 =?utf-8?B?WWowbkQvMXNGcEJOaEZ6bFFHeTc2QTQ1YTRDWG5WQjZjUmVwWVFFeDVCa2ZV?=
 =?utf-8?B?ZTdVV2dJM3pDNkpBdVg4TFVxRWlXWmZaaEhNU1ZYdWJqK212YlNnNFdYc1BQ?=
 =?utf-8?Q?/BgsEDfRGc0zKTdwt1FYtNx3XZBkZhOhriA7O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab27a8e4-0b54-4dae-4426-08ded5b1f1f1
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:42:18.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abL/mxQyOv4NxJfWjEXxaTDT54W+ZAdVJMGdcFcbmkE/DwGzVdUZgCD4Y8S8CgM09AepfPL5Hs2dHnjCtWvi/cd3qc72FF96GPstApAnEi8klhUMVWwpB70tWTiZatcL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9549
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:c.hemp@phytec.de,m:s.riedmueller@phytec.de,m:jacopo@jmondi.org,m:aisheng.dong@nxp.com,m:guoniu.zhou@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:guoniu.zhou@oss.nxp.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65862-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,oss.nxp.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39CC96D7396

The crossbar routing validation has a critical bug where it validates
the wrong routing table, allowing userspace to bypass validation entirely.

The __mxc_isi_crossbar_set_routing() function is called to validate and
apply a new routing table from userspace. However, the validation loop
iterates over state->routing (the currently active routing table) instead
of the routing parameter (the new table being validated):

    for_each_active_route(&state->routing, route) {

This means userspace can submit any invalid routing configuration and it
will pass validation as long as the currently active routing is valid.
This is a security issue as it allows userspace to configure routes that
violate hardware constraints, potentially causing undefined hardware
behavior.

Fix by validating the routing table that will actually be applied:

    for_each_active_route(routing, route) {

Additionally, add validation to enforce hardware constraints that were
previously missing:
- SOURCE stream must be 0 (ISI pipes are hardcoded to stream 0)
- SINK stream must be less than the ISI channel count
- Memory input can only route to the first pipeline (existing check)

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 24 ++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index c580c831972e..29f14d30dbbb 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -106,8 +106,28 @@ static int __mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	/* The memory input can be routed to the first pipeline only. */
-	for_each_active_route(&state->routing, route) {
+	/*
+	 * Validate routes against hardware constraints:
+	 * - SOURCE stream must be 0 (pipes are hardcoded to stream 0)
+	 * - SINK stream must be < ISI channel count
+	 * - Memory input can only route to the first pipeline
+	 */
+	for_each_active_route(routing, route) {
+		if (route->source_stream != 0) {
+			dev_dbg(xbar->isi->dev,
+				"route to pipe %u must use source_stream=0, got %u\n",
+				route->source_pad - xbar->num_sinks,
+				route->source_stream);
+			return -ENXIO;
+		}
+
+		if (route->sink_stream >= xbar->num_sources) {
+			dev_dbg(xbar->isi->dev,
+				"sink_stream %u exceeds hardware limit %u\n",
+				route->sink_stream, xbar->num_sources - 1);
+			return -ENXIO;
+		}
+
 		if (route->sink_pad == xbar->num_sinks - 1 &&
 		    route->source_pad != xbar->num_sinks) {
 			dev_dbg(xbar->isi->dev,

-- 
2.34.1


