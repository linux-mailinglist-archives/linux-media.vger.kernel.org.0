Return-Path: <linux-media+bounces-45355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C82C0038E
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8C483AF35D
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 09:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A696E30506C;
	Thu, 23 Oct 2025 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hStorWOD"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F225D304989;
	Thu, 23 Oct 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211181; cv=fail; b=UUwg3o+qaVPz/AZCymIIcHAJljvCGugmUhNWkxQLPvjExnRX02qwOERvpLFWdcjpzLjvOSZ0BSh6ilStx8qlywAu/6nccH/71IT3RosQTacHzB4Fyfkc0Wj/hJpUSF+9i9EtOu1KPacP9EHITCZ4KEQsbsPc8fFDLXLZnTEM4NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211181; c=relaxed/simple;
	bh=3cQb+g/X4krqWT99egJV0ljZrlBHVCovr4xnOCPSeGM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RBBPZcxo7qk6EIhNA6/8Zk8f0vuN9udgCwBQZxnVLq+oJYidKpO3CxEhvC1p6+6kdMyVAfWwy2fGe6l3H610cb3s2oyyrpvl4B2c+HgGni9GbtEFVV5ScPA9xc9BCpqNmYlLE+Z7Ax7d2j81jG9Z2pBmRMUoF5NvMXmRZt6BiyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hStorWOD; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AL6n7ij7QpOnNU5STAn9N7OHs7d8HUyUEepEcN9cq6ihIUiG4QcBduHjUDfCKNsAojo2dZv7BG3Wz0Qn51SLfF+ueHOdoclUc9kHMHJFSr93/HBC5UBqnYvLng1+hYksnhmRCnE3+md5MvD7UtgpiiCIuxCK52ushDL2DND4LAn2eFp8NCwCvWjC4bQmFJ2jImX0W3N/WrGsN5D6JtZyR4sS6ujwO8ErSRzLabrxtwZwv45mCJCpVb6wv6qKic+aPA3+jJOvFAzCK53Avi+PvBadtY6S00LSTY1rsOQcdrzYssAUB/RzlJMoMeFjqIhdbjHRRJ/ukXs+BRUHhKAbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNihkc9bV7lNiQICol96i8MgeFIg6i139Q+wvQPX9+k=;
 b=xVj9oyBDt1EYNrc73l5Om5XQzIigaTVUlF4/Mh4G/WeC5LHjIVs7ExpHEcnSQoeVycuFYc0pKgQmkGeDtNe2aa/0wWR15NEeLt008ngnkL1O0xqcEi5K1Yk3wNp+/v6iCpcinCUCsqd0uqWmvoTX+3nSRYjiumeN67zjgqohiPOy/BGo2+wRk3edrnGThOzW0pZvV2mSQuR/T+pHi7BhhbMJcR3/wCLhidPzwAVFMba+I3k0yXP2H1jC1WddT5kuqcBkm740gFzf8Ip5heRdKEPcZxkVurvA7At+LaRGZ2SdbCJDbtbj1C+fcMYZ2M1cJ9wcKegr4cqqsB/+v5/WBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNihkc9bV7lNiQICol96i8MgeFIg6i139Q+wvQPX9+k=;
 b=hStorWODTNYAkDOyewcsppZYHdlQny7Pamcvwk11moaF+BB7tce6yJ90qznlMI7HDRZMGhDFvIXto3UasBCJWYF3zgwAtqtMdp5XBOgUwF90OzWU8b88VDsVuKpT5p1hrWcvWxPNHsg4ZvuK9PTmahPPhGGI5fE57J1cpjffqjsprK2D0q717BDTjZYFtoKKgmmHU3q/CGJi1n8gz+hMJ4cSUeXv1ilF5hSuVJBWYPpXoun5aPxvOhgvIOPcIykV8/bPuGUf3PVlD5WnzOhQ75nz3ND/WIYSKMjBjRwz330IXNrEcncPM6agigbloRYx4SYfcpqeOJdTHkVotiIF2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:20b:44e::21)
 by PA1PR04MB10556.eurprd04.prod.outlook.com (2603:10a6:102:48e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:19:36 +0000
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798]) by AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 09:19:36 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Oct 2025 17:19:43 +0800
Subject: [PATCH v7 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-csi2_imx8ulp-v7-2-5ecb081ce79b@nxp.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
In-Reply-To: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761211202; l=3924;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=TePriWMrwXSUUP3E+5arXvY6/nlFyzyXwAhzIF+pKcQ=;
 b=tFMgzZt6ds2m1z8tPtvKdIN/8wwb3SAOhbYwAqeWOT190cGmxWwteuC4G6QYDpaxDN9NY+bTQ
 g2fzSyh0qtRBQVStis33QF47h0G++v6ZRPXdZGzctVn5Lc5NpPgvsG7
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To AS8SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:20b:44e::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8SPRMB0023:EE_|PA1PR04MB10556:EE_
X-MS-Office365-Filtering-Correlation-Id: c4be2109-1612-4a08-2d79-08de121548d4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZmtDWlVnM2xFZDEwU1JWZEUyQ0dlU0x4SGFQZHhRTE5uZVUyOHVYOC9FanRx?=
 =?utf-8?B?UWVGYVVOWFJNUU5tYnFIREJFU3RaSmJrZGsxYnRXVzIvOHovdkhRdnVxRi8x?=
 =?utf-8?B?ckdhUXpWOHhCekhqYTdjWFA5TmFUS2ZLbkZQeE9rNWJwM0RXV1lMUTVYRUwy?=
 =?utf-8?B?cnlrTHNzYnlNRGQ0dUNZK2V6cFVoVnh1VlFaSDlYcm5NY2t2NGlJRVB3NUtF?=
 =?utf-8?B?dlJNaWJmSzhITlZsRFNVeDFqWTlmU2JXQ3p1Y1BWaXpxd1NrQ29kdEpHV2Mz?=
 =?utf-8?B?M2ZlTG0vU3lvQlh6MjZxd3RCdVhab0c2amIyQy9aZTYyVjZXOEdIOEZCL0JS?=
 =?utf-8?B?bDAwVUNPSEE5a1RjQmVtUU1nU2NHTk8yTTBON1R2alhFNlNWNUR0NTloZEpM?=
 =?utf-8?B?VC9xcGdONURoMVovSVZXQVZRSFRTTVZiQmMvT1RHNXJnQWh3OWZCRkxYbXBk?=
 =?utf-8?B?QUhKMTRRUm4xRjJrRzNKSmtmeWtaczBleHZPWEQwdWpSVTZ1UEdpSjdXaVdw?=
 =?utf-8?B?SEVQYk5kcjVPUkpaWUF3TGFzZy9VWU5xUEVjK1Bod1lKOFVwUng1RHpSNlNG?=
 =?utf-8?B?QlQ4V0JxdUh1Qmh5eWYvdTVEZmtmRlpoR05TbXRMcnZDMllKRFBJZDhMLzN4?=
 =?utf-8?B?dUg3cWhEN1FXOWFIZ05JWVFYTUJyVy9VWm5USi91T3dWN2VmMHVBbFdHV0c4?=
 =?utf-8?B?bmd4VjNMb1JnYjRLRlNKNTBxVW1YZGZKdEhtc0YyZGtLV0xkWUZVQVk0OU9N?=
 =?utf-8?B?NnYrcnpYSmZZcmNBcUlUTHNiOE5LYVFidlkvSDRHUVBNbnpLOWVnanZ1WU1Y?=
 =?utf-8?B?WTMrVGxFV292TUh0bGZSNVI3QnZoVzNDZlEyelBxUVR0VDZQWUh3dHhTVzJ2?=
 =?utf-8?B?UnZXODNzWUNRbDg5dkNMVmZRbllkYXdQRkRrc1lYRlc0VzM1ZEdiWUc1YmFK?=
 =?utf-8?B?SlBQbWFrazkrMWhkSHZuTE1ZNzV1RVVsbHRxRk01dzlzZk12UFpPdmNscDNQ?=
 =?utf-8?B?dDRFMkYwMHJKY3V4Q3lsMTQzRlc0ckwxN3FRamNQN0k4SDNKRWdtR2pqbS9m?=
 =?utf-8?B?c3hvaXRmMHlBZERXZU1jZGNsZ280bFhSZ05KOHUxYm1EOXJab2ptOHVRRUs0?=
 =?utf-8?B?M1ZYS0Q5d1A3ZnlKM25HNkNNT2kraXNBZStlZzc3VDhuNTJWaTZhc3lVL216?=
 =?utf-8?B?aG9NaVlSUTduYTJGcUhuVjhjVDNvVGlwbnlLUjN5Tm5leHB2Rnc4MndPY2tt?=
 =?utf-8?B?TmZHVldINkxVTE96dFlWaCtBQU9PZG42ZEEvc3lrSTdJcGJBQkNkQko5bGY3?=
 =?utf-8?B?VkdDSmQ1WjgyUlluRzdkS0hIR0tpMEg2ZHNPSEhuUU4xYWVnbms4M0tnT1Y2?=
 =?utf-8?B?WkhMT3dJcG9GVGkyOWFaVmtMSTRnUXJnTFIrdkE4UC9TYjFoWml5VytSaFJO?=
 =?utf-8?B?WUpBY2JlbFM3bXc5emkwa2NxTnVhT3RxKzE2QzFhcDhPUDdQQlp4OWlWMnZY?=
 =?utf-8?B?eWFSUVdtU3ZLZDlKcUFmMWxiTTVURmJHL1N5Vk5HUERPTTdPNW9CK2dXcTIz?=
 =?utf-8?B?M0VZUDVvdkY3TnI0NkE1WkRmd0wvNEtvUC9ZWGNjR2R0UFJRTERsR0FCa05z?=
 =?utf-8?B?bEYvQTg5T293d0J5TDhvb1QwemJjWU9lZ04xc3pzeitPZGNwczJqVGQ2TnIz?=
 =?utf-8?B?dElua2hGUVAzNWlUWEQvS25hVzRnZHRLdEIwZGtYQVJMUVVpbVBVVC9ocHJj?=
 =?utf-8?B?NDFJTmZKT3l1QWI3eWVZRTU0Y2VJYVZ5MThrOGgwVFVCVUQrY3R5Y2xBU2lj?=
 =?utf-8?B?R2U5SHJnVjl3clYvd3o3Z3lBL2NQSjZlbGpBRzh2SkRvK0p5Vjcvd09IdkFv?=
 =?utf-8?B?eTdZYVpOZzR4bjcxYTFIT1JCWUw4RTdxbHVSN3VQK1ZIVzFzL0dMdFc3aW00?=
 =?utf-8?B?Z0FEMmlLUWFXQ2pzQy9NMExwTHl0QTlOWm5PWG1QUjVWc2E0ZTc3RnA0blZz?=
 =?utf-8?B?ektQbjJiT1FCMWwxeDZxMHJGajBtb3d6T2h1SWR2RUtUNVlldEdWdG0zUmhS?=
 =?utf-8?B?WEp6am1aWkdJMmYxNTU4TGRpOHdZVWtkbEFOUT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a1FEVmN6U3phanBRSGJsa2c5eWMxVmVHejE4UUFrOGlEOGk4aUlJVVVIZTVE?=
 =?utf-8?B?YXd0VFowZGk3MXl3ejU1Zk1nT1ZpMUNWYWJ5UFdWM2lBUzRkVzNYdHgzQUJk?=
 =?utf-8?B?Unk3cnQ5d0Vaemw2eHV5bjRvU0FXanM0R3JHaWhLRitrNitGaXhQcGR4TVdZ?=
 =?utf-8?B?LzVsemFLRzlTUHp4eVdKdHh1QjV4VHRCeGF0bkZyUnZFaTNZZGxRczlzbkZY?=
 =?utf-8?B?WFB3a2R3a2g1ZVZycnk3REQwUzlIZEptODVLekU0RlpkajY0dGxoaXFZbkhU?=
 =?utf-8?B?b3BNYlVUdnZEYmxPdE9LM2dCcDlTVUZmalVkWWwreWJobjdrcVYzT3hMa3A3?=
 =?utf-8?B?cE02RE9jRFdBejRLN3lCNUdrT3pLMXJIcE5jQUx0bE9VQnJJd2VKVkcvWFUx?=
 =?utf-8?B?R2dyZDh6U01FN25iamZCczVzTVMvcmtURWNJNTM4ZmlwS1RXNGpsWEJsNnUv?=
 =?utf-8?B?K3pSZTZFZFJhK0h6cHdNVzkzaXo0bFY1dmxuTjJDU1I4bEZtcTlQaVV2QzlX?=
 =?utf-8?B?b2MyVmZKTmQ3ZXBNNlNTSG5hTTNCL1d6UzZ3OUFtTkNTb1lTa25pR1ZTQ21K?=
 =?utf-8?B?VGdzRmpkd2ZEaTQ5a3RzNnJzRTl3RVd6dTEvejh4dXhTcllmQ1dKTnBlWmJC?=
 =?utf-8?B?ZEh5RjJIbVF6UGYzZStTeENPV1pDTFluQzdSMnZLU0RPcWJGSVBCdVVsSWRW?=
 =?utf-8?B?UmlxWHpGSzZXNkVSNHE5blpvTTBwdlRyZVFXZ2YyWTVEeWlkWTAxeFcyYk0r?=
 =?utf-8?B?c0l1VUQ2cG9HaGQ1Tm5jV21zbjgrQU5YWjBDTHJNWmFlREJ1RHl6SGlWdHpB?=
 =?utf-8?B?UWR3Rk1DVWhQTWtQekJBMW1GSGk4NWs4ZWNCamNrY0J2eWxxd2tPTnZLY1dX?=
 =?utf-8?B?MENIMzVvZGRYVWZkS1JTR0NVZlQ2dTJRczhTS2lQb3RjMDNSajcwM3VnaWE4?=
 =?utf-8?B?a1B4T0Y2S254ckI3d0E2bDNCdlF1VkJxbndVcHdyWkpBME9wMzE5OU1IYURj?=
 =?utf-8?B?RDFFdllxQm9BZUxTejcvSGMzVU8zT2lxN3Zvdm9OTWJockowTkwxVzc2Y1BU?=
 =?utf-8?B?THJFR2Qxa3I3QlpPbkpQcExKVi9xZVphNFVzRzg2Y1lFVm1tTklKVE5TbllU?=
 =?utf-8?B?eS81bndVbStZbjEvWmVlK1NtR1ZkOE8yQzFTZEJZNkoraGRNZGpNMFltTmpX?=
 =?utf-8?B?QVhLZGpXNlQxNVVYcURsb0luZWY1OHVjbUt6WjBLek9HOHdCYWJ2d28weXJ1?=
 =?utf-8?B?RTRUMlQ2UUh0YndRSmpUWWgzam95NnljOFVEeVdPU1RNWHZ0SDVFWFJ0cUl3?=
 =?utf-8?B?b2VGK0liNnBGNTJlUWJKb0x3THU5ZkNNM3BNU2JudStjS0orZEF5Q0pQbTBU?=
 =?utf-8?B?eXdnaEVwUDRBUCt2SWh4K1g5RnRHb2xuODhHNjYxR2FDTjNrNGNuWkxRY0Vw?=
 =?utf-8?B?MGdMMy8zbnhDNWZ4OTNXMjJQUFdmWWpEUURsWVFObWpsaTdUQVpzWklxU1Ux?=
 =?utf-8?B?Y0lMMWUrSmVQaDhNam1kMWk5Wmwya3JaNlErK0RTSTVjWVNaRDEwdmNlWi9r?=
 =?utf-8?B?bzZSMXpQU3U2SEFtUkJ4akU4bEN6YTdKcTFyZ2thRHZXM0NpbXh4bVFwVFFD?=
 =?utf-8?B?Zms1UCt0K2V1ZFU2N3FVM0NyOHlNZnQ2cmlVVGs4SlFPWWNISlZ6cjZyRllR?=
 =?utf-8?B?aVdEQ243YVB0UDBwd3lpMmJ4YmNSc2pHTy8ySTh3dlVuYXo4UzcvZEdJbmpo?=
 =?utf-8?B?RkJyZEcyZlcyeG91K3VocHl2RHBmWDdURlY2TjhFcFJ4S3VTaGNDWk1XQkZX?=
 =?utf-8?B?Rk41TEp5Zk1BalAvdGJ2eVlYK0g5Z3lPQ2taNlovL0dhMzBkNkdkVmM4c05a?=
 =?utf-8?B?amtxek5WVGRUU3B4cnUvOVhnRW1pNHNsS3JYalM0anR4bDRaTnE4QXQ1blRN?=
 =?utf-8?B?TTlCNUdRSmNEK1NDcjRLSnJVYnZGdmdEMGtvV29aZGlzd3JZdjdTcHRHa1JT?=
 =?utf-8?B?S2VzRXBVL0NIbzQzQm1NYzBtTFpLc1B4b3VqZC9PVGdrSncrVDlUTGxwK1A1?=
 =?utf-8?B?YWx0VVZ0R2xCdGNBZUs1aVBwV1RnejZYVlZJZTFwT0tIS0ZwUDJmMnlTS1o4?=
 =?utf-8?Q?TqPEModzMllbBPd0gI9l5t08O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4be2109-1612-4a08-2d79-08de121548d4
X-MS-Exchange-CrossTenant-AuthSource: AS8SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:19:36.0034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6y7q2QkTNWXR1X1ihdC1b2s+e+4NjEhe9EBfkquYUDLWtdci/I9pRI/DRe7pWoD+BOnc5uykAs0ZVz2kTXI6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10556

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Use devm_clk_bulk_get_all() helper to simplify clock handle code.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 52 ++++++++-------------------
 1 file changed, 15 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index d333ff43539f061b8b9cf88af2cda8c44b3ec2a9..fd202601d401145da8be23df4451f6af660642c5 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -71,21 +71,6 @@ enum {
 	ST_SUSPENDED	= 4,
 };
 
-enum imx8mq_mipi_csi_clk {
-	CSI2_CLK_CORE,
-	CSI2_CLK_ESC,
-	CSI2_CLK_UI,
-	CSI2_NUM_CLKS,
-};
-
-static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
-	[CSI2_CLK_CORE] = "core",
-	[CSI2_CLK_ESC] = "esc",
-	[CSI2_CLK_UI] = "ui",
-};
-
-#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
-
 struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
@@ -111,7 +96,8 @@ struct csi_state {
 	struct device *dev;
 	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
-	struct clk_bulk_data clks[CSI2_NUM_CLKS];
+	struct clk_bulk_data *clks;
+	int num_clks;
 	struct reset_control *rst;
 	struct regulator *mipi_phy_regulator;
 
@@ -384,24 +370,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
 			      CSI2RX_SEND_LEVEL);
 }
 
-static int imx8mq_mipi_csi_clk_enable(struct csi_state *state)
-{
-	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
-}
-
-static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
+static struct clk *find_esc_clk(struct csi_state *state)
 {
-	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
-}
-
-static int imx8mq_mipi_csi_clk_get(struct csi_state *state)
-{
-	unsigned int i;
+	int i;
 
-	for (i = 0; i < CSI2_NUM_CLKS; i++)
-		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
+	for (i = 0; i < state->num_clks; i++) {
+		if (!strcmp(state->clks[i].id, "esc"))
+			return state->clks[i].clk;
+	}
 
-	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
+	return NULL;
 }
 
 static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
@@ -456,7 +434,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 	 * documentation recommends picking a value away from the boundaries.
 	 * Let's pick the average.
 	 */
-	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
+	esc_clk_rate = clk_get_rate(find_esc_clk(state));
 	if (!esc_clk_rate) {
 		dev_err(state->dev, "Could not get esc clock rate.\n");
 		return -EINVAL;
@@ -783,7 +761,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
 
 	if (state->state & ST_POWERED) {
 		imx8mq_mipi_csi_stop_stream(state);
-		imx8mq_mipi_csi_clk_disable(state);
+		clk_bulk_disable_unprepare(state->num_clks, state->clks);
 		state->state &= ~ST_POWERED;
 	}
 
@@ -801,7 +779,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 
 	if (!(state->state & ST_POWERED)) {
 		state->state |= ST_POWERED;
-		ret = imx8mq_mipi_csi_clk_enable(state);
+		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
 	}
 	if (state->state & ST_STREAMING) {
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
@@ -1027,9 +1005,9 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	if (IS_ERR(state->regs))
 		return PTR_ERR(state->regs);
 
-	ret = imx8mq_mipi_csi_clk_get(state);
-	if (ret < 0)
-		return ret;
+	state->num_clks = devm_clk_bulk_get_all(dev, &state->clks);
+	if (state->num_clks < 0)
+		return dev_err_probe(dev, state->num_clks, "Failed to get clocks\n");
 
 	platform_set_drvdata(pdev, &state->sd);
 

-- 
2.34.1


