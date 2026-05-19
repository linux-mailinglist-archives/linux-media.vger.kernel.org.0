Return-Path: <linux-media+bounces-62062-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP97LX7FC2o9MwUAu9opvQ
	(envelope-from <linux-media+bounces-62062-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:05:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D77F457644C
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5DFAC3006D6B
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44072BEC45;
	Tue, 19 May 2026 02:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pkh38ein"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA75827A133;
	Tue, 19 May 2026 02:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156322; cv=fail; b=brkzOh6HHOW1uRDy4jIhm2DdGngM7ddZ2uVoPHKtanqKmkS44kW/etNIvyVR+iMyY5OyfDvMLoLdvqD4SjHy1OBwpIl3QK0xmQ6sJgliKP/9QucmBqTNc4Mryg6eSq3uxzAwhGiWIkHL+7Xvnrm5zgvjdd6skFid1Ya1U2sogdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156322; c=relaxed/simple;
	bh=gTGgNuPQLiZHsNbt1aIGfhNfVgG9RhDn2rIQ3XGEZMg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uOs8u2REhV58yaRxoi6DHgSdfiF+wzWXWM568mTB8bL5HZ0CCuylruVSUNZASqW30SCm8W3qxbgbylS0URSPCgDqb19uMgORfHFYNFjHychJK7kaAy3BzEksoX17wdlGI0K0rb40F5njt9kmqj3I8wj3u9tNYG8IOPNb0jvx8XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pkh38ein; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=at3w7+E/6/amHiXiXetB/ZpBQT8Q9G8aBGbz5CQ6suwgk3PVZMyRFmYmgVwiLOZ6tfl48H/qHaujMMjl4vF3ZnZMXkVGCpdz8Woaih6PTRERBUAPorBVXuTyrtt45iCdgoMhvB/4J1I10bteKISYT8GlA1FMSO2LqcTq6ziFCFofVnCpz/iLst8c0pFqmr3M4L4JAxZj/IXUvSq96FCZaRAuymqJyUpzBOtpvL4k09uS8F46B8aeyxTzDdDrrtBkVMOedvmdkSYV+u7x05wgRem8QQyG2XMS5oIUCL8Tv8M3KZ/7DlvvzWuZuvnVHVsZCqzETdqSKnbzHWadX809EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAX47NA+H+Kr9loh4CJH6zyL2Ytbc582ZlKTBywjDVM=;
 b=LYCO8H8W3iXw/rRU7bp0sQgqesIswLRGShn7IdwkQ5d0EjuzG0xeKVQ7db7fEPBUnH/a+JMuC94lBrekJcovgdp7YHUGjdzsOjL9hriCRERgv4pne0rerNt0qMqegVd2/45HpzJS/6GcOlsAnZIhqzpOKACmQJekL3iV4Csb19tTcgKwhDf3LHxXniYpUR0zO7z8NQnauvYKpJAbe/xtAI+tlmSvd26ETYOdXFp988m+cKGJlZesLibMRA6ZnH8sqnbgAfGYfDD7YsWuRb2tZra2aRaWLGh/zvzgQWX1VFlY5ykzmUAR+5d2YME8AZVmgiVV5n3eGQbnycuJxORcGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAX47NA+H+Kr9loh4CJH6zyL2Ytbc582ZlKTBywjDVM=;
 b=pkh38einxOTTkHKL7/bbhnqIvgQ+kyTgiPsqHoE2dmEGX2O2iE9dT7qUbUNwgIECP2o46DD5ZTqlCmqZcs1NU59gvsvUSbdq+XzqvT3lB1PsAIgMApR7q3bHo/iOm1Izkejj14MkFJnWpkVNAjtM9J2QU7f3Xa2n/TXFFO5aFYbHm+dJ9aHRad2YQ1ZFmy4kuOhDS2k0w4sd2VXC9koxtD3cBoYFg0Aelykk0xEmaS+8tjhXxfxtvdxNKLrISLHdM3rqqBKjBqBjSRdel/8rB8TOKnOvFVqAxVPA8Cir73v9Y/uWahDe8/9uldAmo5Wzg+hgKpjcaDhKdAGsGvxwBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU7PR04MB11139.eurprd04.prod.outlook.com (2603:10a6:10:5b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 02:05:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 02:05:17 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 19 May 2026 10:07:39 +0800
Subject: [PATCH v4 2/6] media: synopsys: Add support for RAW16 Bayer
 formats
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-csi2_imx95-v4-2-84ea4bb78a88@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779156481; l=1267;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=gTGgNuPQLiZHsNbt1aIGfhNfVgG9RhDn2rIQ3XGEZMg=;
 b=8QCAmpKYfiOJRVDkr5kWlSHm39k0aEoXMzXtNdYMeiVabcgQ5lafCNK/hNxLo9T6JVFZa+Kqf
 DYWnCo/bpdgAeZYG9RtDjbaNYGN2ebZrZcIQKWv5+5coHlRuezpNUWJ
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
X-MS-Office365-Filtering-Correlation-Id: 65b2fa02-2e68-4fe1-b896-08deb54b1287
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|3023799003|11063799003|38350700014|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
 84Q2eE0ih9v/0kGrpVezJ+ZRFhpZ3kUpLP+WP2AoVule6CCtGNi4NpqT5Y4w7wGuPRbg8gswkqjKUQnMlZzccf9nObZVCVJ//4zqFXXtMBDjFaQVMg+62EUIb4RHpcNDBGW8kOO56FZK8rRxs3qbfG6DHBFAuX+DrFeWCNKIiM8+Eo7W6RUopn0W5lNbBc54ydFb5rb8EXBk0EAPXNW4OZqn9wQkeiHGxn4iwiFnV0QkFaJe9ouxryE9iPODAeWS4OFuu/XfHKNyfajgWgDCxjSzN9ToDCNRtcm+Yp2mpiYRLz38bGI6+FOwOqGNWc8fbuLmiwsGoqzbqJCWIwUvpWylJbq0QbOwEJfhUxiRgJutnPuv0QhqifpTl3cXPG1m8vJibOqGMg6NConC0pHld/1P3IERk8nxhl/OOY2iI+F9QoZLtPFxlJcZtEqs1uGcDjhVnd2xAEhiTq0MwtW5yVEXXjD3ksx5tkHC1+rPTsTGLx8HyKeFhHYD/f7lesb4mmzBIpR8/e8UpViJzitl64lh5AOY8HWHihctMtdvdUPUnXPGxG/5+MloKY1WeA1bNrNU4Qpy1hwDy18PgdIDQmIcLhD3HVB+jcQKmfw/SINBwnlmdHpKrPhCCSZ7Gbz57fb3zUR2lFoDCxPfb/mIVgE6gaPX4U90QFhBqvJxBvYzEGh8ICGHOajmXtPyJJgfzzsKoOhLVbhfD8SnBhHL7mgS1CM4kNvacH75eEH9srD2gk1ZqUefvC49ji3BnNYQYcB6KkXD1O9no3UyiJ1Q7g==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(3023799003)(11063799003)(38350700014)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YjdmaWNRYWkrVGtSU1RORGM1VWlQSHZUKzR5T05xcEg3K28rclNodFc1RVFI?=
 =?utf-8?B?blhLSmdjUGgxdVBnR1VVYXZLMld6a1hOeGozWDVETzZLbWdMb3g0a0IxRkd2?=
 =?utf-8?B?TGI3TCtsTFphb1ZtV2x1SGJzUXdOWnpOOTJNciswcXhLLzJ0QjB0ZUZrejBH?=
 =?utf-8?B?anFqVGpnMEJFL3REQ2lOM3NEN2t4TnltYy9kZTNibndOR2RLOWlFNGpjRlZu?=
 =?utf-8?B?WnJJZ1VNenVETEhKaHZGVzZBZWJOL1lrUnhzajlFcEtPd0x0MDVwbExCUVM4?=
 =?utf-8?B?bjl1am9TM2x1dnhJUFpST1RvYzMrV0Z4Zk5UL2NMakZHOVFKcXNCVWZtLzJS?=
 =?utf-8?B?c2NzR2JBcWxQWG9ZSG0zZjFkTG80Ukt5cUhOWnczdWdrYmpJaWhLcW14Qk1H?=
 =?utf-8?B?R1JFbU4xQnU2Y2duRndpUFM5N1lEdmdqa05MNldSWHpmTG1rRWc1Q1dVZWxH?=
 =?utf-8?B?dVg0SlBtRlhBYXZKT2gxQU9wWXo3NFRHRlF5bXQ5cTN1NDd3SHlCcEtiMGty?=
 =?utf-8?B?akMxUjl1d3FXbDJzQ0lqNTMweUdkZGtmUm5wNjRHTUF5OUpERWZBODVVQTk1?=
 =?utf-8?B?Y29yUzRLa1JOalloaFdZSDlTdkFwMmZKUVMycUNCdUU3MEhkRWtsMU9xMTlJ?=
 =?utf-8?B?azRTV2NUcXY5REV4RkFRbld4dDNtQ2lVd29BbWloK1k0Z2ZpcGRtMEpVbXRU?=
 =?utf-8?B?dzVnRXdXcDlCbERkWmVVMUwvZWlvbzUxVWpLcXluZXdjcjltR01xUmhicWsw?=
 =?utf-8?B?Q1lTd1BGaUFCZ0NXYlBGRTBrUWlqL0JycnkyNkY2VU5uNk5hMGtTRUdVbXB4?=
 =?utf-8?B?Qys2U2hzNXRvejVkR1hpN0JrOWhyY0JIOEkrK1JGN0dMeUl2ZmE1T0lJNFNo?=
 =?utf-8?B?RENJVHVXSkxFTXFsc1NmalQrWElWVWFNdE8weUV3TXBwa016QjJBY3VHTzJv?=
 =?utf-8?B?Wk0wV0ZmcFBPTmxlUGhTSHBRRDJ0VTdzdy96QlZCSFlLZkY2NXBJRnlyWWlE?=
 =?utf-8?B?a245R1pUSUdESjJESmZ6bjlvcGd6dk1aOUVRQld0akRTK2VaRjA3bENWTlNG?=
 =?utf-8?B?WlZSOWx6eGxDT2JSZmx5ek1zbG83SUFveVluQ09FZndvM0Q3Uks1NjliRnhO?=
 =?utf-8?B?NUNoSEdNZzFBZmtTZG4zL01nNHBYM2x1OVF0UkliVVQ3QkN3NXJxZkl5Zkly?=
 =?utf-8?B?VkFQelNIVjV4NHVNMWU5ZnpNUXFZKzN6V3dqWTczWE1UNFBWZGQvanVFL3Fs?=
 =?utf-8?B?Ti93OE9yZE14MlJIa0QwaWNVbk8vN0VQUlI2dU1CbkZpM0E2enFqbjJPZngv?=
 =?utf-8?B?eDFiS01ZNHZxS2ZWalRwVjFBWTZGaE1WQXU0cmphc05KV01Ia0FSY1pxZ0lo?=
 =?utf-8?B?SmZLRTBnT09DTm9OSGJibFUyV3RTM0VBOTBHcUViK3JaTTNOWnU0cjZ1Mmw4?=
 =?utf-8?B?M0hSRWoyUVZXRzhoRU1qQjVkd2VYOUNldXAyblZRY0poOXNIc2xzU1NGWU1v?=
 =?utf-8?B?NWRtbDMrVVZVMS91ekRLSlBxK3JESGhiSXhHOXh1M2x6dXh5TzVSZVJYbUcx?=
 =?utf-8?B?N0ExamtWN00xMVR3Yk1NeUpuYzM5UW9KMGpCdTByZkxGUCtzckNtRytCZlNW?=
 =?utf-8?B?eXNTVUNlWGlmaFRKZmZHRUgvc2RJQTBnWWZLNzBtNFpsQ0Z0OTA3RTdxZFc1?=
 =?utf-8?B?OWkzNW1reTZ2by8ybGRVakVxMkZUUW9OVUZScFlTQnlRUnBLSUZkemZqb2lK?=
 =?utf-8?B?MXdaNW1YMTFnbFpac3BkSEwvZ1JiYVFuajk0RzFtcGo2Q1ZmcHJhU0pJNCtI?=
 =?utf-8?B?d1o3a1BmY0dzck9IZ3FQS1lwTk5RQVNUOUJ5a1hZSng0US94UjlEWnhGdDRR?=
 =?utf-8?B?VDQ2ZGV4bExObGtQZm5rNUdiYUl3bWswaytLcEZpeE1PZDF2YkFFcEFyTE0v?=
 =?utf-8?B?NHVmK0lETW4xSEFzNWlaa0k2Q1RVUGZRM1FRbDBrVVpTbC82MzJJZ1NZMHlY?=
 =?utf-8?B?TnViYnF0clJ5bTdHWUJmaFdGZWVJaXJCaWpycWdtUTIydWcwa2k4R0Z3L05r?=
 =?utf-8?B?Zkh0bk9UaDdVVVM1V05wNGJDajZ3Z1UzZVNaalRzN1JZZWhGTmhKbVErTisy?=
 =?utf-8?B?bzdzREw5TTJoVkU5ZnkyZTN1SnJlMERMOG5kb0hXRFdOSzY1My9oSjR3ajZ4?=
 =?utf-8?B?SzBXLytwa3NJeXJpbm9waGN2b0hlbldabFpkSFVtMEVBZ2pDbHllUlBEdHdJ?=
 =?utf-8?B?Smx4M3ZzbjZrcGV2SjdqaUJRRG9TV0w4ZnFkajJ1R1JQaytMbzhERWw3d2My?=
 =?utf-8?B?OUI0RHo1QXVUV3VOem9lOURNVUxBdmhmZHRBcHVtZ05BejA3Tm1LZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b2fa02-2e68-4fe1-b896-08deb54b1287
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 02:05:17.2321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bZQGQI0vodxa5KaSHtn0XiUQeZA+ia44TumwWPPx8My7pj/8aAuNnKCtalpzn2ts+rJokryRviq9oRzD9CMkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11139
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62062-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nxp.com:email,NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid]
X-Rspamd-Queue-Id: D77F457644C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add higher bit-depth raw image data support for the sensors, which supports
16-bit output.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Update commit message
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 0b80e84983f9..f45466ede2bb 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -252,6 +252,26 @@ static const struct dw_mipi_csi2rx_format formats[] = {
 		.depth = 12,
 		.csi_dt = MIPI_CSI2_DT_RAW12,
 	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
 };
 
 static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)

-- 
2.34.1


