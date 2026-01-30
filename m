Return-Path: <linux-media+bounces-51808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Lu7EWdOfGmDLwIAu9opvQ
	(envelope-from <linux-media+bounces-51808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 07:23:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE6B79A7
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 07:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AB3F30074A4
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 06:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491812E7637;
	Fri, 30 Jan 2026 06:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AJEsgjTt"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0155EC8EB;
	Fri, 30 Jan 2026 06:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769754209; cv=fail; b=AROHMdhgkO8KdpijPB3JNqS6VRe0NwROr4MrdVeHVpKmolM9M1xWXIhUvf6jZYBvnilLiv+ZcotbU9NCg5MPPUzFu3/oGoKwLAD6s+5kyrPY9O613N36s2v1FMPM1Y+WxhdCFx4vuvpnMQc2W4uWA3YznNsSSt98gIM17Nbe60E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769754209; c=relaxed/simple;
	bh=2ImF4FmCHzyNR5WOMkLRZLCAxBM4QCFzGg2FEW7ct0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RY35Cdh0+czlMurQb3GJQijjBS0pF4RMmiChjCNl9cKSmZ+azKH/1eWA5uo0LuazRuts+j4mCGDpDgDeMfNf5B5KIFZGKRM7pGJMYd7kchUauIYySC6cNck/h3Vx+OgI3AbxZ+mtmmfJErPf3UpU/5Ddg33mGgUCbArcwgZ6zHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AJEsgjTt; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ei4+p/nt9S+/mOKArsqS645onjDRh04aOHFwn9qp65zmDf6BsUgOgq+R1fu2QMGZh2ZuFL7BFt4mPdXB5oB/i34MfsQja92FUsoW9DA/1e+5V4U2n8a9B5APeu7T8MS8IhD1sq4LZ3tvAouw3OmgsGPO030LvrGRCOtYGKWWlx551STouTPSaeeIgvjIPGOJL2H5fo8bfWT+5Oi5/D/gl0ow92sNpjCyVC0AMeHQPxkq6K7vfDTpHeiXC10d21oQSgv4Ml4Y89ni4/RV1BvcBNKOCwuLhHyoT5PRvO4LzD53ztgTKjB653uCbxy+YsWhA0r2ViltNSBVpn9zM1mn+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ascH0nPqAI/wWocq/r3sIqaLDcqVNJ2mxTJigFs6VUs=;
 b=KbFSmAOnqRHbRsB53ror82XlbQFIeuorGslCmTsGYX+YCSgaF5DP90OGFfHf/qKrpEFGuFoxcQNYOdJzU6bNLBVbDTXDEk9dUoFX57xIprw3lOlBYcga9STXYuDRd84DLW3o87bJRoS6mVTJmZ4tG8z+BIgLwxj8DrsNLinNScZ/MX3AiztJ3QIpsaDKZ8UvKbCrF6MjVkpvWHTRR/nMOiLe5X8Ia0dx4D5K9OzMw6ne7MfUiZJLOebiCehcZOjIi9HXA+RI5n6t+KT9/GrXv+n0UFycsHEl9al61+bQpRo3DPAAPvt+WdCupjT92nv3iX0PwYHEM2gmht2IbF2Qgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ascH0nPqAI/wWocq/r3sIqaLDcqVNJ2mxTJigFs6VUs=;
 b=AJEsgjTtJpner16aIgI1s4MYjYGMmrou4JP4N/AqwHfVa7t4ABhXbvAhVssnO6EHf5fIbgJS9KQvNLLa7NgQ8C0fl/pHHSNVl3LrDtATrHy0l3aYC54yieFi6OEV/lDCue/VOuQHy7AfxknNgmxrEmIb9ng9iMNCLTejGQSVyO4WnbhFmG0xJKCHj92Tv+SHBuXT8e/raEmq+Tnb/pOuQDJDanCQI/zBDb+R/m7hBlkpJ3xyzEvFY3X0sYwWpG82ljs2T2v0NKEVt3jkZPnMFgi8uAOu2NCAg8B/AIO6GS0uwhbXdFyh7cwOn3P/XkFr4Ndrh4775miaxlGx7xHZQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA1PR04MB10282.eurprd04.prod.outlook.com (2603:10a6:102:464::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Fri, 30 Jan
 2026 06:23:24 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 06:23:24 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: imx-jpeg: Add support for encoder v1 descriptor configuration
Date: Fri, 30 Jan 2026 14:22:33 +0800
Message-ID: <20260130062236.2109-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA1PR04MB10282:EE_
X-MS-Office365-Filtering-Correlation-Id: a86d3590-92d2-40ff-7265-08de5fc8128e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZgLEwZzV1C2po9g7Wu8H2XsCa4UKjAPQQJNlReXRrVK0epxA9/YwvdRJZQ72?=
 =?us-ascii?Q?1iKy5buGf+t2ct3iLEati5F7u4Yhf+uL5IqJO08jMt2w7kvcotTtPoZBYNb1?=
 =?us-ascii?Q?C+ayE8xMEYThOgTHCuxcNe577czoH1IwjlYEieYymGvqFq/yZhZUNzT0lLmU?=
 =?us-ascii?Q?+jfcw4YTDUwPV17L1hypnO7xDKkxFPqxe357VujfVPsfqCNvftSQEMuPgywC?=
 =?us-ascii?Q?QoAdCUWvS2Uq34ePJfCcA6koxcFePkm7WyfXQ7CEz2g2+7JAzrgSMWdZ1gwo?=
 =?us-ascii?Q?4wiShP2E9eAh5ZZ3wkg4irA67qH4/ikCP1jLsGqHcBph/P7Jknu08gvWOUqF?=
 =?us-ascii?Q?t5+uaHNg9+4uQQ3rYTQEmlE2p2I+AYtDhCea+eiwl7E6DXfglqr9i6hLW+bR?=
 =?us-ascii?Q?zg7kjnB0ZP5T2hmdA1qYHIRabjXCcXo1S7/WLQUwadJq24Yzc9CWG503kO2H?=
 =?us-ascii?Q?Uu34PhPYLSfds9kX3hlrk1beHfR9XujHVCILu6ifVbywk2GH+xI8pPanC29M?=
 =?us-ascii?Q?PmkApLEJ6rTsjtb4LT4JEXd/u2oe5mK4yRx/HXpLyouTlQzZ5RLhI3FsMoXk?=
 =?us-ascii?Q?0UcH/RIJrayWfA+NcRqUZA+/hqxb7ZuFDnPKw1IucVs28HZ0BQBWlpl8RJXx?=
 =?us-ascii?Q?9HTKCSz9LovuGGTob+owDFjB5H0/icgwx6AE9qkdkhMGr3WunodvZ2wtyzdh?=
 =?us-ascii?Q?+26TnMOqyZkwjQCTFalEZEbAXzVzcLD46lo68QYw77VzKRBvRDn7NedcKmIX?=
 =?us-ascii?Q?XW7lw9jkN4H6jYNTef2TVF9R4LR2ZtFO79FYAv8qkSPIEmMxxYN4MtDgbL7F?=
 =?us-ascii?Q?8Uz9tr0f14OeeacnWonSrT3oNRwx3Ahit2hGAst+Ia+ufhWq3bc5pUnqV/fq?=
 =?us-ascii?Q?0T5NG0l1ZbKBWjfCDiRqoqRegk5ZbpHl3cM51+dr9wL/sN0Lsw6UefS14LuH?=
 =?us-ascii?Q?9Gjcv/aaEX2VHx85wxwvEi/BjsbBKGF//Ak//s1Hl1vVCucRHiazRsGPCbmN?=
 =?us-ascii?Q?F12G7n8nlC89F1KRwPybjWzIHk5LGUPUsP8MTklXcpEu7mysjYerHslPTVh8?=
 =?us-ascii?Q?vTINC4RkrASkqDKSOOGE9YLkWyBQ7CZ5j5i2+pPUimPZ64BDT2MoShm/21gR?=
 =?us-ascii?Q?GNozky6TPH/2sfwwzogpZppTK+K5Zj3SFPQBkuw+6YlzrNAwStGW6mksFfd2?=
 =?us-ascii?Q?zpDrBsDpmp36RDcrG/NNyS3nMX+5xZr3DD2FLmW6vmcdd9kLZ3lB3LB4dCCS?=
 =?us-ascii?Q?+0+fj20vn5JRGW/XpPzfpH3ogc2Il84h6jSDDyDYUJWiNvLx9WREbASSqY7T?=
 =?us-ascii?Q?3oKjABl+LfUKVLFvronPgmOTSGsanLn2TJ0iWqYbfEvO9k+0CkkN5jqbM4QK?=
 =?us-ascii?Q?Sa56DBVqWDhskxZ4LX90VtPt0IiUwReV4s6ua/mcxQSAtC25Mi4+Msfu2DyJ?=
 =?us-ascii?Q?Xyj6xrz2FezU4vRguS4i2JYNJiO92MavAHFe9AnCGjBRa9JkGGWYS1jBAmQM?=
 =?us-ascii?Q?9QvltkWzGDPlmePFQUdSLETrhz3qFyyuBu2QX26zKwwzepe+3uwP/y2g+6hk?=
 =?us-ascii?Q?txVxxrqWQ5+8r+o9n3CSWWDxTi7IclgYaw74kdNxVPqMfGtvX262deMODQI9?=
 =?us-ascii?Q?uk7es3jBl+hhnKWyTJvd2iI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oxy6kssVQTv4HVsslWKZRmvu4jpCpznH9my0Dk6CwqnvavL1FyyZmiAqc/kH?=
 =?us-ascii?Q?EkEWwGszgILDaVPy1jZjGFJgb+FFMU1vCl9KAktpgXe+zD2elN5QkqXjq31B?=
 =?us-ascii?Q?fFQeCcPmYtyo3ln2qsDTBE2doyMKYdRzDs7QQUx+mtxzVwY7r13hS2Eus4Fq?=
 =?us-ascii?Q?Y979vC6kVccdjd9BxJ10PYZ+zyJdTBOaM4gT99MYhY0TZTF71AnAwBhgPkvQ?=
 =?us-ascii?Q?6OeQsqMKsvfWlKki5NkxBeGUCZFp6S1ohwHfHMOtySGQWgpQUPBwt03oS8IX?=
 =?us-ascii?Q?4pkF7lTsmHO0Khn3nvaV5J0NnDlcR+gZeuJwyYR7LymuordacWjrHGERajKV?=
 =?us-ascii?Q?CZb1tu7SXXXnBRhmgntJ77ZLyxjwx2MrVS7Oo1ogi6C3EpFChyWBPmqLw2n6?=
 =?us-ascii?Q?dc+TWm6lc/Z8bxxogkLYzjW8xJIPBVo2UlArTUnfIZ5OVmIahcoHuShiaOY3?=
 =?us-ascii?Q?wQYiYbOJpDHZMYbBaJa/ydyMc3dfkD63rMtKNrNv0LGB07FrPBHSHGVA8sPf?=
 =?us-ascii?Q?GXp3s3GCsns+aY9TdYDSnyYSkGggpbn8cjW7uH/5Hr3YGR22MDB2/pRxaNDW?=
 =?us-ascii?Q?mmWVhy5iKkZT8UCM+4LqJT9xx9FtAt2ooUtXz74BQjlYWpLS+7lL3a/NuY4y?=
 =?us-ascii?Q?3KsqrhffHQv+CKT9lRmMFgkpK4kDcfvx9R2u4dlZPC3UcCj1wx1CjRmj7aFK?=
 =?us-ascii?Q?mWKdgM19LAvw4zTfF/E6VAvXh841lBhQAlOt2XoCGg+Xfj7jndRkaaVArvcw?=
 =?us-ascii?Q?4NSeL6Jg/6elxWf3oIKAderd+S7jz1RLFzZWYo0YluT0pZd1CUbzZpqskN8S?=
 =?us-ascii?Q?WJNITKySmqbTEkDbg14u89VOyIeClXZPWhLRbMXNkMWZfTmZfEiCHb49YCDS?=
 =?us-ascii?Q?QbqdYDVtfdjVc/yj7qfVR9LYBbb+sjJ5lYCpPOXFU8FgmT2oTJMpUMPLyDIL?=
 =?us-ascii?Q?LW8AyvildRgBPdezw2R9V2hRvilWWPuydxArPDkuHzMwXc8wUX522JERPfOv?=
 =?us-ascii?Q?yYrYrR+cq+OGs3ou5DcsUch1Egp+K8a3AK0pbwao8S6yjIclmnPa8tZiMnIX?=
 =?us-ascii?Q?hgAJpzmKIpiSfZyPUhPSi/2zt/qtEdJeTLIThJ3eAW/xCuIkZSdkgbhTQJPf?=
 =?us-ascii?Q?av3OmixuLIaP5oNm2wZvj7E1pob/zfCxI04eoFiBtycZbiFX6zshn8P4+yGe?=
 =?us-ascii?Q?d8hnYhUUqC6IWiWpuXgd+J3+SSjTX4sOWoR2ucdPNaxFvyAZS3R4rwAGjKgl?=
 =?us-ascii?Q?HaVUB2anwuL9oHLjS1mJNlF1uZhijREe1zDjr4Dk3uuJ1UE19oEJucQxPvMT?=
 =?us-ascii?Q?iXevCBas4kSDaGy+58/P58eZzMdoWtkIsYHIIAuPrKExDI2+jY3Ga7aP3mPX?=
 =?us-ascii?Q?pGRnPq7UQ0acTv6SybW2zkKN47RkwRFfRkOdAbOwGHky9TDNyvsbFggwdtLd?=
 =?us-ascii?Q?cy4wKHu6P3WUYJDOhqhH1ruRW3xmFJUfrB30YcZSQ30TDvo/R5sq/5fSQT7n?=
 =?us-ascii?Q?0zxEvMtKppRvtgc0B5bRnzWg3NSLB/XsQkMyhiyS9CcdEUDOP3EeQNRQ4Oj+?=
 =?us-ascii?Q?Y5E1qyiG5f9pNPQqykmNPIGAGYs4S4J6bUuxB6Vga3OU/2imXVb63c/ItCLG?=
 =?us-ascii?Q?ph1JrxNGTs9Rq3lHgInWZZyLe5p1a9mmtvaxPfde1az+81Zj2VuPFqkTwIw0?=
 =?us-ascii?Q?3r3X/s3/ndq7uFgLrBjVAZJcB7ydjSCVdmCU7UFFARn3r3C31h2mf/n/7EWy?=
 =?us-ascii?Q?3Oow/uxeSQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86d3590-92d2-40ff-7265-08de5fc8128e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 06:23:24.4628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZlIlwzFUGmFrYXXrJhHoBODHTakobc8Ll7hMelt8zR5qcKlFN0+UML4s3jJ/zKUaPa1vtm3s6IeVYV3GLKsSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10282
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-51808-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,oss.nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: C8DE6B79A7
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

Support the upgraded JPEG encoder v1 found on i.MX952 SoC.

Detect the encoder hardware version via the version register.

The v1 encoder uses an expanded descriptor format that allows all
encoding parameters, including JPEG quality, to be configured directly
in the descriptor.

This removes the manual register-based configuration step required by v0
and reduces the interrupt count from two to one per frame.

V0 encoding flow:
  1. Write quality to registers -> trigger config interrupt
  2. Start encoding -> trigger completion interrupt

V1 encoding flow:
  1. Configure descriptor with all parameters including quality
  2. Start encoding -> trigger completion interrupt

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

---
v2
- Improve commit message
- Use GENMASK_U32
- make mxc_jpeg_get_version() static
- Check version in probe()
- Remove noise that update copyright years
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 104 +++++++++++++++---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  22 ++++
 3 files changed, 113 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
index adb93e977be9..0d78443cb270 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -73,6 +73,7 @@
 #define GLB_CTRL_DEC_GO					(0x1 << 2)
 #define GLB_CTRL_L_ENDIAN(le)				((le) << 3)
 #define GLB_CTRL_SLOT_EN(slot)				(0x1 << ((slot) + 4))
+#define GLB_CTRL_CUR_VERSION(r)				FIELD_GET(GENMASK_U32(19, 16), r)
 
 /* COM_STAUS fields */
 #define COM_STATUS_DEC_ONGOING(r)		(((r) & (1 << 31)) >> 31)
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b558700d1d96..71f4a1d292ac 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -64,6 +64,12 @@
 #include "mxc-jpeg-hw.h"
 #include "mxc-jpeg.h"
 
+#define call_void_jpeg_enc_ops(jpeg, op, args...)			\
+	do {								\
+		if ((jpeg)->enc_cfg_ops && (jpeg)->enc_cfg_ops->op)	\
+			(jpeg)->enc_cfg_ops->op(args);			\
+	} while (0)
+
 static const struct mxc_jpeg_fmt mxc_formats[] = {
 	{
 		.name		= "JPEG",
@@ -1030,11 +1036,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 
 	if (jpeg->mode == MXC_JPEG_ENCODE &&
 	    ctx->enc_state == MXC_JPEG_ENC_CONF) {
-		q_data = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		ctx->enc_state = MXC_JPEG_ENCODING;
-		dev_dbg(dev, "Encoder config finished. Start encoding...\n");
-		mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
-		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
+		call_void_jpeg_enc_ops(jpeg, exit_config_mode, ctx);
 		goto job_unlock;
 	}
 	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
@@ -1272,6 +1274,7 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
 
 	jpeg_src_buf = vb2_to_mxc_buf(src_buf);
 
+	ctx->extseq = mxc_jpeg_is_extended_sequential(jpeg_src_buf->fmt);
 	/* setup the decoding descriptor */
 	desc->next_descpt_ptr = 0; /* end of chain */
 	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
@@ -1335,9 +1338,15 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	struct mxc_jpeg_q_data *q_data;
 	enum mxc_jpeg_image_format img_fmt;
 	int w, h;
+	bool extseq;
 
 	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
+	extseq = mxc_jpeg_is_extended_sequential(q_data->fmt);
+
+	ctx->extseq = extseq;
 
+	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
+	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
 	jpeg->slot_data.cfg_stream_size =
 			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
 						  q_data->fmt->fourcc,
@@ -1348,11 +1357,6 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
 
 	cfg_desc->buf_base0 = jpeg->slot_data.cfg_stream_handle;
-	cfg_desc->buf_base1 = 0;
-	cfg_desc->line_pitch = 0;
-	cfg_desc->stm_bufbase = 0; /* no output expected */
-	cfg_desc->stm_bufsize = 0x0;
-	cfg_desc->imgsize = 0;
 	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
 	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 
@@ -1372,11 +1376,14 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
 			 STM_CTRL_IMAGE_FORMAT(img_fmt);
 	desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
-	if (mxc_jpeg_is_extended_sequential(q_data->fmt))
+	if (extseq)
 		desc->stm_ctrl |= STM_CTRL_PIXEL_PRECISION;
 	else
 		desc->stm_ctrl &= ~STM_CTRL_PIXEL_PRECISION;
 	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
+
+	call_void_jpeg_enc_ops(jpeg, setup_desc, ctx);
+
 	dev_dbg(jpeg->dev, "cfg_desc:\n");
 	print_descriptor_info(jpeg->dev, cfg_desc);
 	dev_dbg(jpeg->dev, "enc desc:\n");
@@ -1388,6 +1395,54 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
 }
 
+static void mxc_jpeg_enc_start_config_manually(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	void __iomem *reg = jpeg->base_reg;
+	struct device *dev = jpeg->dev;
+
+	ctx->enc_state = MXC_JPEG_ENC_CONF;
+	mxc_jpeg_enc_mode_conf(dev, reg, ctx->extseq);
+}
+
+static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	void __iomem *reg = jpeg->base_reg;
+	struct device *dev = jpeg->dev;
+
+	ctx->enc_state = MXC_JPEG_ENCODING;
+	dev_dbg(dev, "Encoder config finished. Start encoding...\n");
+	mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
+	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
+}
+
+static void mxc_jpeg_enc_configure_desc(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	struct mxc_jpeg_desc *desc = jpeg->slot_data.desc;
+	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data.cfg_desc;
+
+	ctx->enc_state = MXC_JPEG_ENCODING;
+	cfg_desc->mode = (ctx->extseq) ? 0xb0 : 0xa0;
+	cfg_desc->cfg_mode = 0x3ff;
+
+	desc->mode = (ctx->extseq) ? 0x150 : 0x140;
+	desc->cfg_mode = 0x3ff;
+	desc->quality = ctx->jpeg_quality;
+	desc->lumth = 0xffff;
+	desc->chrth = 0xffff;
+}
+
+static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
+	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
+	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
+};
+
+static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v1 = {
+	.setup_desc = mxc_jpeg_enc_configure_desc
+};
+
 static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
 {
 	int i;
@@ -1593,12 +1648,10 @@ static void mxc_jpeg_device_run(void *priv)
 
 	if (jpeg->mode == MXC_JPEG_ENCODE) {
 		dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
-		ctx->enc_state = MXC_JPEG_ENC_CONF;
 		mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
 					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
 		/* start config phase */
-		mxc_jpeg_enc_mode_conf(dev, reg,
-				       mxc_jpeg_is_extended_sequential(q_data_out->fmt));
+		call_void_jpeg_enc_ops(jpeg, enter_config_mode, ctx);
 	} else {
 		dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
 		print_mxc_buf(jpeg, &src_buf->vb2_buf, 0);
@@ -2842,6 +2895,14 @@ static int mxc_jpeg_attach_pm_domains(struct mxc_jpeg_dev *jpeg)
 	return ret;
 }
 
+static int mxc_jpeg_get_version(void __iomem *reg)
+{
+	u32 regval;
+
+	regval = readl(reg + GLB_CTRL);
+	return GLB_CTRL_CUR_VERSION(regval);
+}
+
 static int mxc_jpeg_probe(struct platform_device *pdev)
 {
 	struct mxc_jpeg_dev *jpeg;
@@ -2976,8 +3037,23 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, jpeg);
 	pm_runtime_enable(dev);
 
+	if (mode == MXC_JPEG_ENCODE) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0)
+			goto err_check_version;
+
+		if (mxc_jpeg_get_version(jpeg->base_reg) == 0)
+			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
+		else
+			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v1;
+
+		pm_runtime_put_sync(dev);
+	}
+
 	return 0;
 
+err_check_version:
+	pm_runtime_disable(&pdev->dev);
 err_vdev_register:
 	video_device_release(jpeg->dec_vdev);
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 9c5b4f053ded..c00c13549746 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -81,6 +81,17 @@ struct mxc_jpeg_desc {
 	u32 stm_bufsize;
 	u32 imgsize;
 	u32 stm_ctrl;
+	/* below parameters are valid for v1 */
+	u32 mode;
+	u32 cfg_mode;
+	u32 quality;
+	u32 rc_regs_sel;
+	u32 lumth;
+	u32 chrth;
+	u32 nomfrsize_lo;
+	u32 nomfrsize_hi;
+	u32 ofbsize_lo;
+	u32 ofbsize_hi;
 } __packed;
 
 struct mxc_jpeg_q_data {
@@ -105,6 +116,7 @@ struct mxc_jpeg_ctx {
 	unsigned int			source_change;
 	bool				need_initial_source_change_evt;
 	bool				header_parsed;
+	bool				extseq;
 	struct v4l2_ctrl_handler	ctrl_handler;
 	u8				jpeg_quality;
 	struct delayed_work		task_timer;
@@ -125,6 +137,15 @@ struct mxc_jpeg_slot_data {
 	dma_addr_t cfg_dec_daddr;
 };
 
+struct mxc_jpeg_enc_ops {
+	/* Manual configuration (v0 hardware) - two-phase process */
+	void (*enter_config_mode)(struct mxc_jpeg_ctx *ctx);
+	void (*exit_config_mode)(struct mxc_jpeg_ctx *ctx);
+
+	/* Descriptor-based configuration (v1 hardware) - single-phase */
+	void (*setup_desc)(struct mxc_jpeg_ctx *ctx);
+};
+
 struct mxc_jpeg_dev {
 	spinlock_t			hw_lock; /* hardware access lock */
 	unsigned int			mode;
@@ -142,6 +163,7 @@ struct mxc_jpeg_dev {
 	struct device			**pd_dev;
 	struct device_link		**pd_link;
 	struct gen_pool			*sram_pool;
+	const struct mxc_jpeg_enc_ops	*enc_cfg_ops;
 };
 
 /**

base-commit: c824345288d11e269ce41b36c105715bc2286050
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.52.0


