Return-Path: <linux-media+bounces-62704-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG7pBE8EFGpSIwcAu9opvQ
	(envelope-from <linux-media+bounces-62704-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 10:11:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A7C5C77FB
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 10:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3744F3003BC1
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 08:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BC53DC4A0;
	Mon, 25 May 2026 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="arfgRGe1"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2356134A3A5;
	Mon, 25 May 2026 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696699; cv=fail; b=FhhDQOdgya0YsGFZO5pEiAJu3HmYqytMdJ8xX79FaR3MrwpI3a4REpJsv+yiWxQLJhvBgcLWOmkdZa3prpQoG61/NCeUVgm/6YbFUz5xIMjk6/DpwDH9ujUNAxKe9+IvN8O/+LbJiJtZrzGraZME0WVqtIFSBxeeyODo7yBzZek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696699; c=relaxed/simple;
	bh=BY7xCohUr3K97UJsCK22/e7O2thwxIqMTPQt4fLq4NI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J4pANd3GdDNFdNVH78X4YVtUzumJBA/5YCATAxmfeVL9/NKDSZBsSpPR0I3D6yhCFzuxCqhDeZ2bnpgUhW54Z8NIg43RF9c9k+Ky3KcuasB6XbSiSg6mRA5h30Y0aYz/2Z9/HtTRjLkGxvN9LZUxXeJZMsVk/5SyS9cptckJBKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=arfgRGe1; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8UljJzBCinE8HixlZ6WixThZXhAY3nPcUmNrCecEfDdmrGd+eQVkd6UdGcjnGXvlHDvaaUis8Ci9Se5FAN7coIoM5gCiBqyTnRrzYfCzG+v56XMspe2Kgm/j2JgsuEEf0yhrCJ52wpnA6pd57axwVUS2tEtJIkRHgiHkRfCarEcJiE/V8gPAqID3yWWGhsWuceO07h7d2j6C4p3hPCVpNB+NHai3VCwB3MElsMgVwOsArtNfa9qLtaMikjzKX7p8spBE+Q2wqXb/h7upeFpBk/AcfuEoR+UZL1dSWsrjyIbKubL243NSR0FXp3x2aLYqjYsu5Nz9Ur4Yr52Ur+8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qm85wkEA2ap+HdL3dSzLODWHGpSCQH+bwQlKT7jSlh4=;
 b=Q4JGvGydFw7JEO108fifb7K12Q6yo1HVI9QtjgMkpZz2HbuABTLb+m6puJoBNmTXeVzTCBCk6GSOzRwUQ2xJ1DXHPh4jzztvLfzrPp7OWftY3m9L9y1FYno2LHyoVzF9QIXFztXfn5AmlNzzZxJ+i6vTaLIXMsW1SZlWlN+aGAW6WTD/ysdtCK4JuUelpQefY5/u0nCwi+6cgjv9drwEd9MNONnQTjHdl84d0KR+2AnjF9gzluU/Op1r5fJbKFK/q8U5J3iJZBronBzFPomWn+GULmeEQaN192Om5qNA84sjBDJIuTI/hJRARPc/AloMVcsmqPdPumG6dtCa8hJncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm85wkEA2ap+HdL3dSzLODWHGpSCQH+bwQlKT7jSlh4=;
 b=arfgRGe1DyA2r6ZJ+ZSt3wla9bXP/kpWDn5XKKN+b+fi2rTBPbfXVGSngWu021uVI0kPerAxseDfSYMmrPoyH8B/wfMKIgeoj4+lAkkZg8jnE54SEJ5JBgy0yMe3oFAk15oUs1MjzNPXvlGk7imyShvSuoB2A3M6VPAqVCQ6ozkHPVUCJ/1MNRV92fi3+NHvO4RWcjfcAJFKvKNJWvBmbtlVwq1quRlpTyaOxDX4qyuJ4U7+3hUqAjxZOop5Oyz1C4+UlnHeyujCfxcVlwAhUM8tOjiRPAifR/a5bxWQsTJPOrW8qlihmjKfkMEf12pQhah/YQKwsgFodIADJA+U/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB12265.eurprd04.prod.outlook.com (2603:10a6:150:30f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 08:10:04 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 08:10:04 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 25 May 2026 16:12:22 +0800
Subject: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
In-Reply-To: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779696771; l=3479;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=johQ4RKAJItBaT0lZRnkXFEYmsq1OdVQdhsviVHn/zQ=;
 b=sW0hJryhcUiRUfsoT9V587vp5vMeJkr4/z6oNdJgPAK/LuqruQMHur+urncz3QQ7Dh+GQHR5G
 jx8bqA/1xQaCbrILO5I5fWxXHUg1LCxv0pqZQElWgU/CSFxLWcujiZD
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:295::9) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB12265:EE_
X-MS-Office365-Filtering-Correlation-Id: 3383ad81-df8b-428f-d0ee-08deba3506f7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|921020|38350700014|11063799006|3023799007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 potbUqwZugPdFdh5D5gI3pHgFV00suRP8825m1pfl9DGUdy1/FseWL6fO6mf3ddU3K+SY7jt5nXlE/NxdDNYsc1F5W3Aa8w3NJAXPpwwqtDYr6MCWvJ/rsl2VpGpp2glWJfcq2/wsn++mYe8Sl3pO3K68JVEUaZAOz+pW5/9s9JwpI409mfShijxB1SWXFqxa0LK5ZusQv3WCEzga5FQ3aQF6xgXafb0+mhYoA36tPha6ajQXa0Nh/nXDjvWCSpTlbGibFQoTVy4ehtNDfABTCfOxc2Bm0YudwEmVxUGTkZRg04hc8m/c/W3SoOAZnUtrygLBZ6PyDFl3afvGI0zwsoqczO4kZ0Yca1HSvGwEgW4+Y+soclOpSREkoFrTgWym/HG5BMVBAaXKO5LiBkMN+aoMZuyALsBP80tNSyscpvh+EaXoarx/o9mAg5YenCAhxhPRXC7iZefkNWGq6CMyznn/d2mYL3MDi6E73Jya/r5bcPf8naTu6hT3wuyb1yEpt1r/TYIIV48x7ecTrX1TcwbaZHP6n3a7tqzQ70WW3rO2oyJlqgGQg783eNO4EmPciekvBiwnkcOlptmJqawFW2Fh1dRKI+DiLBpYdXB2Y+i07tXUH5inAxMHOo9y4LlL5kAc/VOzeU8vbj/lsdTlVNB+Ks1LiYlLFjXcegbD1rQNHaFVPPg695N8FhJ/YM/1oWzpg62089IMZR0FVjwpQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(921020)(38350700014)(11063799006)(3023799007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UTF4TG54UlVBVDFBMExaL1R0d3hjNks1cGZmUFZ1Z0MzbU91OFZkejhYRncr?=
 =?utf-8?B?Wnpma2FtS05rRXNnUnF0MWhIaWYyWFNtenEzSHVxL2laa2NkME5WMnZOSFFh?=
 =?utf-8?B?Q2dTc1NrRmJtV3RaMTZ2K0dKcmtJd2lsakozZCtGUEgxRnBqdThZWHdBWW5x?=
 =?utf-8?B?amNHeEQrWXlJaUxUTG96Wm1HZlAyR3dRRXNjY1ZlaEZXcVViWUdjbDhnNDJU?=
 =?utf-8?B?b0dKN0NnbnhjZXBXNEdmaENReWphYU9UUENQT204ZHBSM3RYUnIyWkFSRjAr?=
 =?utf-8?B?aFlKWjk0akk3NHJtMG5MN09iNzFZNGxkU0JJamJaWEJYYUlPWFg0ZzVVRjdw?=
 =?utf-8?B?VkR0c1FOMklJMlhxWCtjQnU3L0cyOWpQeHFTS1ZjZm45dEpMWjI1MWg1Q21N?=
 =?utf-8?B?cDZwcWkzM2lLWHRBT1ZVemZnNXZLN3VJS0JMeGs4K3dhT2UzY0V4a0J0RTJp?=
 =?utf-8?B?T2dhQm83Z2dvaWh4b0crOGd2aEZqV1dKK015QitvTmdySkxOWjNndVRsMWZI?=
 =?utf-8?B?NitraldUZUVJaWF0T2RlNWxUcGhZU3FYajNzTzFIT2RtU2pZeGNxNTFJaE9P?=
 =?utf-8?B?UFd4N2E2bHByQlVwcmx6TTVEQkhZVHVNalNRUUUvMVJXanVocisrYWdZOXdk?=
 =?utf-8?B?aThXK2cyRXpxMTFWM2hpdWJCS0Q0RVJjSGwrd3lteWxNMlZCUG9IK2JFOW5o?=
 =?utf-8?B?eThkdnNPQ2tYY0ZNU2dob0ZucVp2WkxEYUZXcmlYUkx0UmpZTVZMVzRqTHFT?=
 =?utf-8?B?bXBZRkV6Q1FINHJ5Umxub0ZyQkRmSlcyRXFWSHg5ejdkbmNDYytqcHBtN2dy?=
 =?utf-8?B?aVJ3ekFpRHc0ZUQyU3Zock8xMjFRMmhxdXNpRkVla25GTTQrTWJqT2xhNENB?=
 =?utf-8?B?Y3BTb1hhUDl0NDJYU0dwdE5iNGF4RTB4NWh1cDN5MTUyU3BaM0pCdDNBMnVE?=
 =?utf-8?B?Q1I2NE5GUS9WWDZ2bWdUUVkrWlM2YWVrd2tzaVlwaUZTZWhweVlYbnB6RFFp?=
 =?utf-8?B?d1Rtb04vL0N2S21UTW9UM1B6UkdTWUNXbnpDRzZ6VWlvUVIzZklCTDk2d2gw?=
 =?utf-8?B?MkNjdytFRzBJcmpMTTNkQ2tGM1BtcEFVZGFyNVFMa3RPbkRpdzFOd1JKT21V?=
 =?utf-8?B?SGZOQ0RDeGxPZk0ydkxva00rL0JuRENPTHZqK0FJcStpbXVGWnJuTktGbTAz?=
 =?utf-8?B?T2d5UkhIZFhUNG1WMUszV3B4VGtOUFErdlFtaEc3aDgvQ3FEL3prbUk4RWJu?=
 =?utf-8?B?RmZKeHpSZk91MGFiQWFrVitFTkxZM3hjbVordmkyQ3hEU08vaVhVZkVwcHJn?=
 =?utf-8?B?NUYzemU5UlBhSllCVHN2dDBKeUpqcWt2WjBTQmdzOTg1eXVFN1lYdWpuekxL?=
 =?utf-8?B?Q2ZmUVROTW1BSlkyYVlNeE15aUpneTNaTWNPTk93Y2JYaGlNSlk1MFN4K1g0?=
 =?utf-8?B?dTNXRzFIZEhHWHpVMjVvZFAycmRBMndyTURQY2FYRGNEbDNDMXhGb05yRk1r?=
 =?utf-8?B?MVhXMlFiQndTb3RETGw4Q2VoOURwWGhRU0l1ZHBieEtKdDkyb3BtZ21jcmY1?=
 =?utf-8?B?NHZHY3AybjVKS2pqTGwzMHVkTEVuUFB0WWFXNEpCakZoQzA2M1NtamV1WGZD?=
 =?utf-8?B?OFg1MjJNd2FaeERkMmM3TkdwUTU0UWU1ZVJ4elg2YjBCWXVOMTFuaVFENDRL?=
 =?utf-8?B?dGZRcGI3Q3p1MWZXOXQ1WDFWdmdCOEJyZC93Y2tscEZRUWM4ZHJpS0NGNEtD?=
 =?utf-8?B?eU9udnVzL0hUNzA1ZDVGS2NIUG43cnI1WmhmL2o1RlBlVFNpZGhrdXdTZEkx?=
 =?utf-8?B?dUlJZWhxZ2xqdUNrbmZhaUUzeVBTZ3hZWTBRZ1FlNHRjSmU4ZGpyWGtJb3Vo?=
 =?utf-8?B?T21VOERxaThuakExYlpIZHpXd2xhNFJNWVZFWWI4K2dkaDJyVWNuK2QwMUU2?=
 =?utf-8?B?REVsM1pTK09vZ3FZV3hHdFZ0NTIrRGhOZHpZclA4Yk8vS3NDNnRKb3NnTkZB?=
 =?utf-8?B?VVVrSEU3K2g2RzRHalQybzdnbmxjaUJDdmdrK29IQ0tWUHY3TG4wajhGY0dU?=
 =?utf-8?B?RDRoc0YzaUVZcG9mK0t1Ny9OYTl6R2d3SzV1eWhMU2x2cVQ4UEVvSC8vL3Zt?=
 =?utf-8?B?L0MzUnpxRUkwdHZjSW50YXBtTGdSVEtoVkV6aUFWVDdlS3ZDRlZkY0VrVWdm?=
 =?utf-8?B?WXFPOWFPU0t0QS9BUDZZNWEzWDMrZ082YVQ4dTNiTEZWdVBjdWp6NDNMa2R3?=
 =?utf-8?B?SFJRM2JkR3NlbDEvdWRXMXB1Ukt6b3FxQStVcU9jNUR6K2pVbmNqaVU4N0dn?=
 =?utf-8?B?QWM5bjJnREJJV2NldVhleGI4YWxpa3I2aUM4WHJBbE9tbCtFNWkyUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3383ad81-df8b-428f-d0ee-08deba3506f7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 08:10:04.7875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8c6yXGLIMOSm5Mrc7Y7mRjF7YKZdxJ/b99J3+FOHKvfSAvkv1+tBtNUMP25qiKqgeHzCrZbzhTCpQfIXEFkTtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12265
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	TAGGED_FROM(0.00)[bounces-62704-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,0.0.0.0:email,qualcomm.com:email,oss.nxp.com:mid,4ac10000:email,0.0.0.20:email,devicetree.org:url]
X-Rspamd-Queue-Id: 11A7C5C77FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX95 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v8:
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Add required constraints for port@0 and port@1 in ports node

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
---
 .../bindings/media/fsl,imx95-csi-formatter.yaml    | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
new file mode 100644
index 000000000000..bc2f5d448fe5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX95 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
+  and non-pixel data from the CSI-2 host controller and reformat them to
+  match Pixel Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx95-csi-formatter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX IDI interface
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Pixel Link Interface
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    syscon@4ac10000 {
+        compatible = "nxp,imx95-camera-csr", "syscon";
+        reg = <0x0 0x4ac10000 0x0 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        formatter@20 {
+            compatible = "fsl,imx95-csi-formatter";
+            reg = <0x20 0x100>;
+            clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+            power-domains = <&scmi_devpd 3>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+                port@1 {
+                    reg = <1>;
+
+                    endpoint {
+                        remote-endpoint = <&isi_in_2>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


