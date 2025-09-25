Return-Path: <linux-media+bounces-43222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4871BBA1A3B
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 23:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8E6F56453A
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEB6327A18;
	Thu, 25 Sep 2025 21:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="imS0u4k0"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556C4322A2F;
	Thu, 25 Sep 2025 21:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836266; cv=fail; b=pe7pKKEgtNqiEAscj2RrzU/hqSrALjnnK5N+l3MnQJbWYfMnqAA+PRaCD8UWxuTbEM1rUL5FVwL3H9o+8H4Wd9jt5sePYKeIzA74UMYGmMPyrxwAuYYWPJEMewYmXSspZpTy+jHIO3Q5QVeb56sjWml36kRj5CvrWlCA/Ub4sOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836266; c=relaxed/simple;
	bh=wPmdki63u/xzHdhqukXBdtTpzUg6r2CNXkybtNwGmP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZyBHaj9W08ffYIeGKfnaPDX55opkMpzSyAY4Cmg1/fFSB7QCQwvXGBfPq+DhTcTQBMpVOeS41NlPHV8XxGif8BQ2vxjiTVQiSV2W5gdYMb6olMIpQTIQSTUwCsFpCQccgXJZh+jqK2u82a7/vVXZSOeDeA+rs0T90d/H+INSBEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=imS0u4k0; arc=fail smtp.client-ip=52.101.83.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0NIBUau7/vsIAwLaKPWdsi+z7q6gKXDTiWSTaMI8X5Qd4oBIFlOdL5cB7b8BZy1T6chdtIjK8wrI0gxdMMRtofemUztGlc/3Vb1LdeUGWLFMREf8IDcQ586s7T2GhQrabTaUjYtt3HIYFqEfkHea+yhDgYvc0RHsFYDb/odvnm2sS5iRQMhae/D4t4L10oUlh/TOt29KsPfJGvTcOL1vi1AKeBtTalZXW0TYvOgIULwiaVX2whIJqUDc+TnGnHcQtcKsV8VRo++gRpiWfkmus1l9Jf4qOGdM9Zz5mQD6Fn8f9KmOwt+8ttAYkuq1GV/dcbLfeJXocrsL4cDJdqi7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+v7TMuqCSCiyudQUQ03ddXObsgFC1vocdCf4Xp2qE8=;
 b=pL9FE9SpBTo0GjxKxisln2lFNG4xvZ+suxqGyVUZsX4/S7yVyjDU6lEC0xvbBufqB11cKUrZ78C9eYgT4M0gPIreBPszFK80ehHXfcau1IzVwlUQi29t8TEVHsYQvPAxnDrUhJqqt3yWyGDdmny7omru1OKWDlaCVjHjIvNluocGfyjsEFr76eBLpL1wbaEyDUOQFpigwwPTlvYPJnct3bYwPNq0Zb4wtF1t34tz/kNmDl65iGS+zeMbzoSLSenzaQliGACoBArFrRyav4Uj9ckj4BFIgXuNMz7IIPJxlrgW/9fE5cc35z62JpKkPiUYqivVzi0jE6qzyCw5aLnnBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+v7TMuqCSCiyudQUQ03ddXObsgFC1vocdCf4Xp2qE8=;
 b=imS0u4k03Uxy12PFF1uHSBa9UBGrKb8/DxBetm59l2kt0HLxW5rqxbGxaHc9oG8Y0KUbOo4fKLOPT5dYAU1qcioF9retW9NHkbAjT4Sut4UpCXBz1vHDymoc0us0slLe8bBH04T5K7lsz7y764XOOfB3E4N/hUHABFVZzyehIhrsPGo17/6LZzEpcfYh8xXjtcxJXcfJU3uaawSRpQwp9X/lXX7rJ742ZqqbG1VJ110KqXiBdVX3BfwbFvT2sLJQ0zhu299SOCL7HO+pAAE1X2BfNCUp1PKwjMdcX6rtLvzxuj4Xa5tjocPrFDY+6Qbw4NJNgsQizz3Iyy385oOV+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.12; Thu, 25 Sep
 2025 21:37:40 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 21:37:40 +0000
Date: Thu, 25 Sep 2025 17:37:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/4] media: imx-mipi-csis: Move redundant debug print
 in probe
Message-ID: <aNW2HHF4Z4Jkwc36@lizhi-Precision-Tower-5810>
References: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
 <20250925-active-data-lanes-v4-2-8b54e3d5af6c@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-active-data-lanes-v4-2-8b54e3d5af6c@ideasonboard.com>
X-ClientProxiedBy: PH8P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::11) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c9fb95-e0d8-47fb-0a77-08ddfc7bc093
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?WY2vYurhwZ/NrZ5QHt7rlCbwjfmWPe4D93uiBrmgCxi42s+OFXOroHmM73xj?=
 =?us-ascii?Q?SiK2sGdpgpgXrjCK8Kd+cql1d7lWWbl7ISBawzhOAElZZ54OMVHCGYZ3b8dx?=
 =?us-ascii?Q?3NC4GDV0GJ1oflFwvNrJ9OUMdL9vHUoAR2+TopqV5uBVcBDfg7wfbtsEfnKf?=
 =?us-ascii?Q?TMlolMMCfeLkkoW0HmxIazB40nZxDcGmf4jiCseVb/OvgynmqkvLZh+BImqh?=
 =?us-ascii?Q?i3/9wevQ1zf93DCuQLuYdc9HBtRihHXcWu3DAlQqCByziFQpyrXZhP/ApQhP?=
 =?us-ascii?Q?HG0dgixuv9ob6oVblZZgDj6SlCwJgXwUwlXru/yZ8HbLrLboT/SqyhKmCKHk?=
 =?us-ascii?Q?jzfvvVVrZx/y2jqL4Ht07E0VnQJ+lehlS2fXdWWiLUbQ1mJa/O4iLXnXqzbQ?=
 =?us-ascii?Q?9MDSODelxfkOKdDpdIC/FKu3pLBBWAU7Cvlk7wpkM2OoCQ6sa1yhENmCZ2IT?=
 =?us-ascii?Q?/bKaSBOIaALxctvdOJkk6iYmdN1H3VVchPXyXAK7l9tnQTnlpTmtH7q1OsBt?=
 =?us-ascii?Q?nyTM4Ap3K0VnVrcD36ZwFqVzzS2hND25PvrmMjaaPys+mEsqTSNP7fZwBH4i?=
 =?us-ascii?Q?zZmX7PHyQ0ThlW+k8rv/TI7mT87lBVS0yl7F7rzg6fUrg3iDLMq3ZTJbJW7J?=
 =?us-ascii?Q?veURyAFpTcC9KDw2UXicJi+NKmC4ZAFHMGcZHVh4m2w06jlkcD5cGssy9Dh5?=
 =?us-ascii?Q?nC3Do/Y5+flniMr4OH5mBWxbvGT2ziMeBTFclEsPlDFsoeJIOgZxWWAkPEnO?=
 =?us-ascii?Q?91LbTVbOsjLK2w9gsSw3/Y0rn1q09UYAhgNn1Uycyplnl0ZyWXv1AOloP0Xq?=
 =?us-ascii?Q?MIexeDEfueY0BhSvB69sC48XVJ5EgRu0Ledpc2lnXu0687Rv+MBR9J0+gAgm?=
 =?us-ascii?Q?P2HGe+SjBYUGgE9PnQKSc8DdoYT7D+b4NKdkTT7XcLjHtGMSa3Bp0HvwbN0S?=
 =?us-ascii?Q?+O3AI4FiK1N77QgSZ9fNTlRyo7BWSannJZOZkB93zWYzs5pd5zRBoooJi7AL?=
 =?us-ascii?Q?FTRTVWTo1lPzFTXEiOQgZh08JdfJ3T0Iimo22iacsEgtuZU+ZdV7EgUrmRf1?=
 =?us-ascii?Q?m0WBzXaX+It6lY8POj+W9J48D7DITzy9MhFyd3ijklupLOX1rp6m7w8/adnt?=
 =?us-ascii?Q?nBYjvYgpqBAWFfr8kCftArOiAEgAiSkDWdYkBUnLGP0UgM94g//4FxYNLjtk?=
 =?us-ascii?Q?D7qBGH924ZbDAhn41xpuEp9hWUBCQzoa80vd3XI6U7f7aPSlqlJQ8/lBVB7q?=
 =?us-ascii?Q?RXOL4/niPanUhHW1tnKcBCmptlU0l13Q2UeQvEPYWgTxR+YCjuGHVkutYW6D?=
 =?us-ascii?Q?OqqJFe8nu+fgo37qSmXNjR9PlzLTMfvCFahBxWTfZwUDoZx7XUYL263zdgfw?=
 =?us-ascii?Q?Z3KR/9VIMppQcCm8Y4KhsJQEKCDPL9+fk1HFHNI9w8H2/Scx/0RouoScsyxx?=
 =?us-ascii?Q?qkufIgdlgVTPHhnYu9jNqG0KDc9Bp+F7oEYfp9Le78IwmKcsTAupWQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?+ZAZFdm5OypI3UIg1o1xlh7rO2Rvic7mSoviw6ozNpwED649E+DLgmTbKUHA?=
 =?us-ascii?Q?aIFj6daNrtVHEQ6FxZoEymeoDPzC6iN8vS432X5SG3V9J4VojFQI94CsPhCv?=
 =?us-ascii?Q?F/A7KKmq09QIijZnLTE3iEfayQALCE+r9p+y63jYMJyHpxMUFDYDHtghNdB0?=
 =?us-ascii?Q?NeEi8mxi6ih+PcjHbe7DpWWuc9cM4/jloPdHGCeh1jagiz0EiJYoqOsUqJ9H?=
 =?us-ascii?Q?ma+4vACOFQNrXxzFLdJABB0vxDs7bAdfyKNlbhgtqdnjOj22AALyeOE/tBIB?=
 =?us-ascii?Q?Na7ofVXmpM+Fb/X5e/p+kUm+fC8qSAAEKRSul/flADBqJgRWvtRyPKafm4u2?=
 =?us-ascii?Q?XVMnd6c2fsa4aWIHuNzw0ZY+nLmheyzxWX2iR/CnWGs8gw8AnXn3CTh5mHOY?=
 =?us-ascii?Q?fHDos8N9bj4vl9RSwpp8LxM2mX3MTq/ZSuJPCOcx2yIstVGLrH3lxlz7iVig?=
 =?us-ascii?Q?T1cmrwq/t7KdDONqh2dcB5XkJk+Jl5kj1vDdJMfPMOy7FqhIi9TgujtIa1cl?=
 =?us-ascii?Q?VT5569xTvtk/v4QxnAKZJUt4FpzNTwW+8ue1t8sz9A6NoD5p+0g0NRb57Fda?=
 =?us-ascii?Q?7ZDFEUVamJdiL3gtqr5FbOuYBy6N37sf+SEyBqR8AryAWwE+xiETiQOnuGyH?=
 =?us-ascii?Q?zAixU8hcmZfrtGAB1ULnbXgL/hpabTJvyvlegnAR9Hq0lNk2/3qLMo8f2+eA?=
 =?us-ascii?Q?CLDOxgz+PN1FPGXKNSLDbc1i3QybJhLDUxS+tXMSHFuanRr503EtYDfHnakV?=
 =?us-ascii?Q?OF32/FdXuRiK/Y5mgZ4jc6HOud56uGWOCI7cMP8TN+eCGjIiyNJYVJ5TKSdn?=
 =?us-ascii?Q?URwG88L5GGXyJJHlmclk4e+Ujk+3lOEi1k6hmT/Q+ktR29HQM8jfX7q4yYzY?=
 =?us-ascii?Q?EBX4a+88Kka1oYl+524VKHy7kMNY2VYfhbAi7rqHzCEf3LeJUCfT0gdJPiX1?=
 =?us-ascii?Q?8k+MbJzCxWSFxB/mORn6pGGd2r8cjC9WLw3QDdINWrsmfXxBFIo9c7tR2Mbb?=
 =?us-ascii?Q?P/dyYZE52QaSUvNXOZ8CseTfoAYVoP23g5DaKqC5xhhYzpPDsOoHIHVkmUb+?=
 =?us-ascii?Q?JSN2gSYZqME7QYgkzELWc2Rqxti0zvSNHobCee7nn+hlYXRwQFachZhpoPSo?=
 =?us-ascii?Q?SmEP3Il2AWIxmLKlryjUB53+4BSgqXQzh2kPolL20Pp5qs/GA/cypoa8esdy?=
 =?us-ascii?Q?Uim2KvkqaZCdShuSKrFjAiKjv3oqBI+lyaajLl0mm9YF+Af2nARRCGNER2fD?=
 =?us-ascii?Q?6MRXZJVfx0MLhO6bmq5EL64q/i1GMGPGLNvvePZUCuJNCzElsDiuNMCr3ixH?=
 =?us-ascii?Q?K7GBe9EV5QNtbgyO+3PH1i44j63HWJP6NW/N2w9iwdJvyuwG/URitH+iJZdT?=
 =?us-ascii?Q?32TVoFCzYRRY8yXso/4+ZMtBXMdw0qbtf4mprio242pINPIbqdE0bHQcojlC?=
 =?us-ascii?Q?748F/ZKegchhT1OTrtkivfE6jmWgYkOyJCJK79LYEqKRTq/UZNiHplE3f8gs?=
 =?us-ascii?Q?WFK7SiFRWv6L8EeDYr6QDBO73nHun4ZtFnUsQE0g9Bst6duEAweJyqf70GfB?=
 =?us-ascii?Q?SN7SBYjm1SfxzPpyEy8TCb3byXpc1TfvmluYwfhn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c9fb95-e0d8-47fb-0a77-08ddfc7bc093
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 21:37:39.9820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQiBgwFNvBFiFpk9pm5Jh37JBQpH+4hMy8xrhXDPld4MLJfz17YHetzKXPwDlTJ9kN0tOYIfoxuc8Zvvxx75Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773

On Thu, Sep 25, 2025 at 04:54:27PM +0100, Isaac Scott wrote:
> The number of data lanes is already printed as part of
> mipi_csis_async_register(), making the first part of this print
> redundant. Remove the redundant print, and move the debug print for
> clock frequency to mipi_csis_parse_dt().
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index d5de7854f579..7c2a679dca2e 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1481,6 +1481,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
>  	struct device_node *node = csis->dev->of_node;
>
>  	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
> +	dev_dbg(csis->dev, "clock frequency: %u\n", csis->clk_frequency);
>
>  	csis->num_channels = 1;
>  	of_property_read_u32(node, "fsl,num-channels", &csis->num_channels);
> @@ -1566,9 +1567,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  			goto err_unregister_all;
>  	}
>
> -	dev_info(dev, "lanes: %d, freq: %u\n",
> -		 csis->bus.num_data_lanes, csis->clk_frequency);
> -
>  	return 0;
>
>  err_unregister_all:
>
> --
> 2.43.0
>

