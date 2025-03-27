Return-Path: <linux-media+bounces-28807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E306CA728C9
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 03:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF894189B94F
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 02:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2617157487;
	Thu, 27 Mar 2025 02:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IbPvEw7k"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3029B155312;
	Thu, 27 Mar 2025 02:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043099; cv=fail; b=kBIo93vyQmGWsTfzYmFns6b/Z7AaztAh73KDoxsRiV1UYSCKbuR+9CByFSff+DUBX6KPWASLb1amRWGzhvbkcvpRu3EnMoUe4jou6yQHDXh0vBatYF5QvAc5UVo6coR4huzL6pX1af/YXxNh4YMb9u7iVAC1ZjDEjnNmdC3H3PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043099; c=relaxed/simple;
	bh=DcLfPpJBX/s6HFqh68Gf2IwE6C9LPHVOwZjMn0BdApc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=INa3kI4WAjmPdVbxw/G+x1AR8S1DEgCjQeDxK3E25MsUFP8/45JYmNm0XS06LY92LD0UEaEkRJYuyefpQFAQqudbKhOAVWkMrb2t0tL2CQsX1fAalsX9tFGup2a6375/25YTzpf3aH0GAmkobBxHi8kq2x3JoBUOrPKjqksUbkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IbPvEw7k; arc=fail smtp.client-ip=40.107.20.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7fj26erahhaPgM7I6euRHjnwrWnkuky3oe+DagRjYUoY0BR381FH6L1mddxVVRi3ObBDZzMv9SodNw2yhRvSN+oblMuOzwP7emiHPN9H2tpuMCI1z+hcE+6oBCE0QYbCHUeiTEF6WNcGlelDThivgCWNPMKppfngSYEd18uBIT3lnOvR/SQo/uqtwHY2/96K+LZE4g4IeyF46NPwhfR5YAt2yWxB1M+tvZVUTIVdpKzM9ULV8hfr6Thx01BNrtZ3/3dMuWYqZoOpf+MWv3gsvsJXOVsZG8Vz6FVqG9Usl0ekRgPtRRxANEC+gfQeIXVLRDWiJ0ulQ33VDzhfAjH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPnvWE5QENGii6ZSjAFH+QbOTyDr/ND9h/7PKP+rXJw=;
 b=kEFUQgLWy3YpG7T4UFMuIEwCIv6kL+DpatG/V7BPtLS3PE+FT99Hn4HlLjd0eLoBAc4vLQWREPnxZL6BpZWUV82N5L9AzfV5rjEDw3X/crjniNGGbmGW46YWXtcXS2K11ToZx6FlRc3n/9U5V7hkOYDrvedRg7Fsn4AhFHcKIEjxVSf0JF6wP0AUO3XKuefcyzJqnXYQK1+Fo9ewpGDBBHvi6ksftTEDVtjf1ODkiszXipVhG8kDTDkEeHd9cIRhlB37kxIfq5/TdjS3WAlIQvX4Rq+wzIDrQ3VtUuShDJYTmueckqVWf8M0Eqsp1q28LeIZLqVSDvs0HDyN6bqbnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPnvWE5QENGii6ZSjAFH+QbOTyDr/ND9h/7PKP+rXJw=;
 b=IbPvEw7kv1Yzf4+T0RtTg2fg5oIiJKg3nfN5HUt/VOQAERxBOWbDSFmKXqOYUawzMec46LdyzE0h9XZUv7uuQF6J2UJEMPDFiDGOl3GH4SFSxeQQX+38zTOMtHs511rKsB2i+33bzdUOIfFqAk2ezXvF2e7EYsDGn7LjxVD3ONEFk0GAukxeJJgRm3/sLTGZ7DRHpP39MLYPSuiZI11cmBZkD1pokMP2sA4iJC3P7sdHuNYQWd97QM3+/sOvK5GQpjLcENxUH9EYuiHf2MThwRo/VYSbNAF9UGn4+aUlG70zdHVAHUNtKxvh3Jx26o/ujTR1XntyONnkViPFgSF+6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM8PR04MB7988.eurprd04.prod.outlook.com (2603:10a6:20b:24e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 02:38:13 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 02:38:13 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] media: imx-jpeg: Change the pattern size to 128x64
Date: Thu, 27 Mar 2025 10:37:06 +0800
Message-ID: <20250327023710.549-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250327023710.549-1-ming.qian@oss.nxp.com>
References: <20250327023710.549-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM8PR04MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 0439a408-80ed-4bd7-7494-08dd6cd86bd1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RhVP8nvs795Msvf3bpYeIlyOM/LurfqTFC2MZfnrU6co7gw+QqyUwVqXdn7L?=
 =?us-ascii?Q?v6/jX3g+xFKOyVBvgwZI0n+xOtupf8oVPVwPkIEcW8TubhOnaZ6dc6yqpKlA?=
 =?us-ascii?Q?lzLpRqtQ3Z9cNCYs4ZvnnTFqipBSVOHdhLjoDmZ8C+C7iZCg+viNGhVSDPEs?=
 =?us-ascii?Q?DsfibMNmqz6mWWffLHc8lth/Q35D9BjrxEon3Xd4PUEN+THiX/w9F94S87l1?=
 =?us-ascii?Q?6/Yxiob2HIvKlYp2hsVA4A20+0iQzOkloLxyVBPZUxhZdBw10wNUNomKUf6m?=
 =?us-ascii?Q?UyLV8WlcRqBm4VFTEZCieI02qqGvVUP9jB1R76LZkL/Qbm7QxqtFlRMR6Dgf?=
 =?us-ascii?Q?WMJkmuPB1hm5oS3YSFyuI8LAncEVkxXyuhW3NKSrTD7pF6Mf2pnPjdNNzXfS?=
 =?us-ascii?Q?4Ctl9Fe87JDYDBtE7PURn7X7dzCTChuONo4nS1bkfDjCUXsQAANaKsSRT/Yn?=
 =?us-ascii?Q?SHLyu4R1hSZZeB5XH/uVVnOwgBTFjxdygeYF41uqAr4NMm+VuP7MIOP8WYfp?=
 =?us-ascii?Q?i947zrokKZNeXTYgNz8ITgs+YwwYbM39djYHYk+c0T1oNT+NB66lcw510veZ?=
 =?us-ascii?Q?0eBONKKXUlvnY4bB6qXCNVDi7lTigkhlRUTs4iEUDjy4ccD8sUn+pocGlMca?=
 =?us-ascii?Q?iyA/NmKMgdWEFccQid6SwSRMZ4Y1k0MefuYw+Yu95NsFbQvIXClzLrUP8vCX?=
 =?us-ascii?Q?5t4tku7Jks340eU/NJvrnLV26Qq6t2O/5/W5E7Y4DOH0QcYGqRNebTLtLv7c?=
 =?us-ascii?Q?YanbLSxd/FqBSpecQWk7oiIlTndBEkIu38b8jIoHsSW7qIsnUi2heuZTLuGT?=
 =?us-ascii?Q?04R/tKukaOBlywmapkiYYQWqC3kZBFdazoqqokPTd7wZolqieZvPeBlLgRe7?=
 =?us-ascii?Q?2Q6nuwEOp6cqeyVTA2e5bDQJeTSoC0I8wrfsbNNv+Ci04wNmxDSUOsfAKvrl?=
 =?us-ascii?Q?W4cLkL+UyTzkcrYSNRNYA0EAU+VBBZGsK0BOJJeBwYruD7qlOjkqu5wp2rTJ?=
 =?us-ascii?Q?RbgTicJKQVbRIFol07DosFVLM4Hp15soYAXhlcpg3QzHCp6uooGF7/vXIw7B?=
 =?us-ascii?Q?s2t+aROV+mjhJDwd8kCpQIE6IzXm/UoWUl/W0eRRqxcv+ayJH1ZxjMjSHZm8?=
 =?us-ascii?Q?P2mNyOcDF0nEe/PTFYHpS91E5dyf6NkKtI9HC+/Qx6DzXBbtDWaknTmxoY+2?=
 =?us-ascii?Q?0G5jpz208LRbmXouFM2JO899shffPrkCvJL1H6Xs/b9FC4U1oVHG/GHr09Hq?=
 =?us-ascii?Q?4J9hlxcus2zF9VikZr4VHxsHvG5yGUrmrPRoCNhOf5LjXOHCmrWU4loqfXSx?=
 =?us-ascii?Q?YpWNGxJO8lnvtZYxspyB2RMLBy28nulMqH2Juty0tuSgpC6G3BCgH1h3E3Wa?=
 =?us-ascii?Q?9uxPO+VVQf0aGlOJWn7yCjaYraYnlaYYQyqNQey2xRcfn6KpMBIf2jNbzZSU?=
 =?us-ascii?Q?Tz7vsf/XanHmTBrnVED2cfK7ItCvhuv5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O46NBsNNF5/We7U1ZYR+dp2zbKGsplRyGS7UPpuRxsng5suA0qsLhCemYfrY?=
 =?us-ascii?Q?ofsdLOocngccZoEdbFhk29FrfxdzSbtL536rP4SOSpyIT/PLShpgW1yCcFF3?=
 =?us-ascii?Q?tQ+Wn0Wqaz5jw++uVIsKyMjelaClv1mCtQz/mJASJ8TlrZqaAV8Ybd8tyNkt?=
 =?us-ascii?Q?IMzWBDqTO3DsIYUvK9y5AogaBt/qwQENRxRmY7khnZORJQP/kI30IVfZhbJn?=
 =?us-ascii?Q?2ma/tSeWJOoFtNr+xWa/IpwV0ODRUIxstDEj2o9QwaIXM3fFMcwIRpnwuA0l?=
 =?us-ascii?Q?wIdDW4K0HKdenWG//Zl0OlNbq6bALeXVytpsSxm6noOLVmUQJNP3AVZiyGx3?=
 =?us-ascii?Q?MCnRAKaxeQfrk0ZuC41nHfUuEFPf12Eb1YfStG+i2Je+r4yaEB6zLIS2hu5+?=
 =?us-ascii?Q?AEDMF7E9Fxe2bd+lUnLnkgBQYnzdk2vaZY1300c8ICz6b2vvHWvUcSCHsydF?=
 =?us-ascii?Q?WtSe9UOXNxEg75hoVVsyzp5Tp678VEjco25QL5BZ91jsaxBP9jY49A7OJqw4?=
 =?us-ascii?Q?j90jB0Qt8iCtrmRa2CyPVJ2Ri/iKT5NBk4et3Ngz10KsXfhVZAH2rxmKhiaF?=
 =?us-ascii?Q?RSVYrlP+XWrBOEMRZ2u5mdTT+h0x0mLfPqUlvJRV5i07F1QTtXpZmlWi4hWl?=
 =?us-ascii?Q?sD7B4ysudqOMmPsNaMyNZTzdfnvivyhzbOAyW/cAHCPooEaunLZOB58iN6mf?=
 =?us-ascii?Q?yV8+4BKj2ZYG5Z4FwyUfIBz+78uGNl2bM8FePUBcnjIxsxeTE/Fdh/4J4b3z?=
 =?us-ascii?Q?Vlk5wk5eKXdY2m/SCH6hAbm8eJ+rNNWXcg+Lb/RmCLXgkgIRnGu6/Lv7+q12?=
 =?us-ascii?Q?g+obmNw7MDKyLwybhqkw4I4RnetW9VrSRaigZbGgELXmS5QA9eGTdkxHigZY?=
 =?us-ascii?Q?AXYKAqAFj2Y28e0peTQbZV7c+Neqxk+T1/7C5slAkJbceAzzW0IQVSUtmOwJ?=
 =?us-ascii?Q?faiqodN9RsAT1YILPZWxJWwtMKSrjJPMG38sOIeyaqWKFob+d2WH3bKcwqK9?=
 =?us-ascii?Q?wcznEVXKGK9m0Yki9206h0W8iOPgbp5j+fyhAShhJZGJHxOBDndqOVPZSNpl?=
 =?us-ascii?Q?+vEyt2LYWkamV9rqPiCz6orea1T4eXh6+Pg3t23vto0JrmCEfhPO05uw1sLX?=
 =?us-ascii?Q?uVKv1DAJ4aW9PqBI0aIxdnpy5AkWtdY6ALkSCymRrazGnr7fDaaSqREvynAq?=
 =?us-ascii?Q?aPuLWfSGVMAC8HSFnEySJzADKR9BWX6Bzhbt2br/peBifHmwFmeEopqAAJy5?=
 =?us-ascii?Q?9HXNQL8tvDYiNzn1hMXal2/jNLQlcES+Cf0pEnW0EaKG8TZtjlVQqS5MFJrb?=
 =?us-ascii?Q?mf3taKvXRJUzTery5sW9s3QfK6sEQul57YktIqFpHq6Riy0VeOTFmr5sMegT?=
 =?us-ascii?Q?e3NkIkkp+qru3HG4XVDuEZUpEpJzHYG5AqPqGkaQRRnqtNjjJEjZOF3T5fgi?=
 =?us-ascii?Q?SRLiAuQXMHhMhRl3GtI2esP2eeRmSuOsAxl49FT3JMaHSRcpp673StuQWf9q?=
 =?us-ascii?Q?5Ym4ethI00GuHOnCKKdB4qvHut9X9EnUJmaEqZUcKe88KWT/ZqQywUxCtMgt?=
 =?us-ascii?Q?VaLFZ27Y2nTUIFnrn4JN+U0KkRCJi5U6U0c4QMYo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0439a408-80ed-4bd7-7494-08dd6cd86bd1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 02:38:13.5934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgU4eABATizIIFB8/GlioJx5Y5jlKXWh+51ozfev3sHP6Yf400WUr/DqCJMZ6oZ9n9uNwCmMa6V+ZP1MR/+rgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7988

From: Ming Qian <ming.qian@oss.nxp.com>

To support decoding motion-jpeg without DHT, driver will try to decode a
pattern jpeg before actual jpeg frame by use of linked descriptors
(This is called "repeat mode"), then the DHT in the pattern jpeg can be
used for decoding the motion-jpeg.

To avoid performance loss, use the smallest supported resolution 64x64
as the pattern jpeg size.

But there is a hardware issue: when the JPEG decoded frame with a
resolution that is no larger than 64x64 and it is followed by a next
decoded frame with a larger resolution but not 64 aligned, then this
next decoded frame may be corrupted.

To avoid corruption of the decoded image, we change the pattern jpeg
size to 128x64, as we confirmed with the hardware designer that this is
a safe size.

Besides, we also need to allocate a dma buffer to store the decoded
picture for the pattern image.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 42 +++++++++++++++----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  5 +++
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 12661c177f5a..45705c606769 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -535,7 +535,18 @@ static const unsigned char jpeg_sos_maximal[] = {
 };
 
 static const unsigned char jpeg_image_red[] = {
-	0xFC, 0x5F, 0xA2, 0xBF, 0xCA, 0x73, 0xFE, 0xFE,
+	0xF9, 0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x0F, 0xFF, 0xD0, 0xF9,
+	0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28, 0xA0,
 	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
@@ -545,7 +556,7 @@ static const unsigned char jpeg_image_red[] = {
 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
 	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
-	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00
+	0x00, 0x28, 0xA0, 0x0F
 };
 
 static const unsigned char jpeg_eoi[] = {
@@ -775,6 +786,13 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	jpeg->slot_data.cfg_stream_vaddr = NULL;
 	jpeg->slot_data.cfg_stream_handle = 0;
 
+	dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
+			  jpeg->slot_data.cfg_dec_vaddr,
+			  jpeg->slot_data.cfg_dec_daddr);
+	jpeg->slot_data.cfg_dec_size = 0;
+	jpeg->slot_data.cfg_dec_vaddr = NULL;
+	jpeg->slot_data.cfg_dec_daddr = 0;
+
 	jpeg->slot_data.used = false;
 }
 
@@ -814,6 +832,14 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 		goto err;
 	jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
 
+	jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
+	jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
+							   jpeg->slot_data.cfg_dec_size,
+							   &jpeg->slot_data.cfg_dec_daddr,
+							   GFP_ATOMIC);
+	if (!jpeg->slot_data.cfg_dec_vaddr)
+		goto err;
+
 skip_alloc:
 	jpeg->slot_data.used = true;
 
@@ -1216,14 +1242,14 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
 	 */
 	*cfg_size = mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
 					      V4L2_PIX_FMT_YUYV,
-					      MXC_JPEG_MIN_WIDTH,
-					      MXC_JPEG_MIN_HEIGHT);
+					      MXC_JPEG_PATTERN_WIDTH,
+					      MXC_JPEG_PATTERN_HEIGHT);
 	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
-	cfg_desc->buf_base0 = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	cfg_desc->buf_base0 = jpeg->slot_data.cfg_dec_daddr;
 	cfg_desc->buf_base1 = 0;
-	cfg_desc->imgsize = MXC_JPEG_MIN_WIDTH << 16;
-	cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
-	cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
+	cfg_desc->imgsize = MXC_JPEG_PATTERN_WIDTH << 16;
+	cfg_desc->imgsize |= MXC_JPEG_PATTERN_HEIGHT;
+	cfg_desc->line_pitch = MXC_JPEG_PATTERN_WIDTH * 2;
 	cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
 	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 	cfg_desc->stm_bufbase = cfg_stream_handle;
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 86e324b21aed..fdde45f7e163 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -28,6 +28,8 @@
 #define MXC_JPEG_W_ALIGN		3
 #define MXC_JPEG_MAX_SIZEIMAGE		0xFFFFFC00
 #define MXC_JPEG_MAX_PLANES		2
+#define MXC_JPEG_PATTERN_WIDTH		128
+#define MXC_JPEG_PATTERN_HEIGHT		64
 
 enum mxc_jpeg_enc_state {
 	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
@@ -117,6 +119,9 @@ struct mxc_jpeg_slot_data {
 	dma_addr_t desc_handle;
 	dma_addr_t cfg_desc_handle; // configuration descriptor dma address
 	dma_addr_t cfg_stream_handle; // configuration bitstream dma address
+	dma_addr_t cfg_dec_size;
+	void *cfg_dec_vaddr;
+	dma_addr_t cfg_dec_daddr;
 };
 
 struct mxc_jpeg_dev {
-- 
2.43.0-rc1


