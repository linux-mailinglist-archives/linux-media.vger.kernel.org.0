Return-Path: <linux-media+bounces-40177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD17B2AD6E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 17:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DDF11960CB6
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573E7326D62;
	Mon, 18 Aug 2025 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mfRUfAEB"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011054.outbound.protection.outlook.com [40.107.130.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF461320CCE;
	Mon, 18 Aug 2025 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532440; cv=fail; b=FbJnqfGkFqwpV+/QkB7RSTGLAEbqQTTLMCg05XwtonrY5GSjNLalbkIMDF3vqewpGWE71qYb3dBD2Srw0JzWyq+jjJCkyt8vBcTakT23RLVvEWFkJIR4mUmXEMnFzZ8zIXAJVYFiWQvaqrtc7EGfVhyn2IkDLFVAA5uYtKMwi7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532440; c=relaxed/simple;
	bh=+2XSkecDHDG25qW/WWXbBz+Wj3xFb3ph9ntTT/eBIOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tqQtsoWod9Nq1C4tfN1OUJC+N4aPjnT19xrhptqqD1aaRVzMQv7M/0RUFR4TMxvih1Lrtvi+QI2N5eFZ1qX+To+Ewyna6/foXHz+oobrsdMX0CDWEtcys+EEiVMZ2+4Regd3RfAKlVoBiefAjbnHxAesz8udUxzEiqf77kdYKfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mfRUfAEB; arc=fail smtp.client-ip=40.107.130.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdDi91g3cjlhljGDLxMUFQVfB8CpGlTWM0WG9dSD6vvnlk8DTgYeCXwUhNOB5F4FriB/J4kB+i+exdFzzXH//dLGQFDd96a/i79Rx/wvYqCyfQ5eA5UIhkmri7HSvVRHVPfNHXYvlfU5PADeV7eAlrqbBQUWDZv5i11hAvYRbStAiY7uCnKIcUQoV33h/kxvvlBQ8nVsiuaDpbqP6rFGyEmJdZVb8YuI/lF/kWt1EPuEcrNiJsTXz900WCZq8ZbhQEamQzPmfNwr3jkfmxNy4GGU+B1VxP40BMFp/hdLwtgdzcd+0hfhdbB+RJ1fU3GX3yIn0Eyet0Wfgrdn614sPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYhGg8SO5EETChCXB8uJsdI+ZC2aczsRjZ+MwkFyLwY=;
 b=Y/ZNO/SVea3FFxOptmkcEdXrmsym7At+wiVJK4s61+eP1qe7gzmzrWCm4y3zkKATvyXPCBgXSopkwDCIgGkMgp4hP3vsJMmTCzjgdzAWMwxuVF7GLQRg2oND8cC+pP1GkxGdcfh79ISt4xsPSmkdnbWh9lvNaUNZCgI+JYJgkRMHPqETkEKS+fH8to+R+7h2qy/trBDSqjMn7tZHFIjrg+jydDkEaIZ5xyszEb32uwHiTlH0OvR+A9jvByXr153nsF1pw7Lovx0r3ZEOgMWjsGkRHED2pX5th8l2dw/ZTNq39kGGEv9m5/axzIceVZaXlUGBMPRxs2OwpatEGOk+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYhGg8SO5EETChCXB8uJsdI+ZC2aczsRjZ+MwkFyLwY=;
 b=mfRUfAEBbP0+uaPW0uKTbGiHK7XdZWcoVCOl0f9j8JPfs6qwrVn+ELuNEZulYQ1c5FBWlOjZiDcRiLHdq1e6DxlO976SqR1teNFOVfdov1UhXG63nsKhOiCY3XQ9LsS55GWAg9fgOd25QjtgN9xA7VWtHv51oZoc14LhrsDesvIWbZbQeBbLj+jdtHXHIcUKM2zAuRg1X9SoFXh0d078WM3OQS0W1y1ikPb4rxtGHfISUZFlqdlYIQQHa83jhNz4YeDVSlBv8a/RP2V8Eu8wVM+w/a7tkHGFmNZmxfFHG6M3iNxB47OTvVWF0OQVLY5tVR8hMZsz2tIU++y3bkEtww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10078.eurprd04.prod.outlook.com (2603:10a6:150:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 15:53:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 15:53:55 +0000
Date: Mon, 18 Aug 2025 11:53:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Christian Hemp <c.hemp@phytec.de>, Jacopo Mondi <jacopo@jmondi.org>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Fix streamon/streamoff calls are
 imbalanced issue
Message-ID: <aKNMjo5ggT3ymJTT@lizhi-Precision-Tower-5810>
References: <20250818-isi_m2m-v1-1-bbe2b774d4bf@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-isi_m2m-v1-1-bbe2b774d4bf@nxp.com>
X-ClientProxiedBy: AS4P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10078:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e540ae3-b402-4974-6b15-08ddde6f6fac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?3MEIBv0ZF0ldsuaA3QsCZnAhAEC6DdHL8a4FA+8PaosmClG+ZustypRyOHPv?=
 =?us-ascii?Q?VaK0T9OtfDdxl+/8tEo36+dZlseaoC5c6nUiCodVf7k6OYTsvW2iltFQtbwH?=
 =?us-ascii?Q?aUHhg/NWCIhQuBa/h4YZCn1cgWF+clHQm6qrtNXZIcqGm2HXWVsvs+4b2HTc?=
 =?us-ascii?Q?SwOjw0lNGFYkcWXzWKZBjD7BNZtWroFxM2n2QiI2DG7utLCJdlHMXUx9HHzR?=
 =?us-ascii?Q?Qe06m0Mhwd0Cy5N941V+fymq8LHEA2Pkx9lVgh+0GCX58r0ZQPNsTIXpOurR?=
 =?us-ascii?Q?VBt4sr3wyiRE5KaXCc3vHvx9rX27WZYe8dFrVzy2BfXpeCSPtRobp3TAOZvB?=
 =?us-ascii?Q?TQAyi/7mzEia65bzVUDSTBdR4gAzJzHK2iFX/hZtLSU3Wc/Ugp0XYBhIKQ0U?=
 =?us-ascii?Q?rMn/G9oSAfmGM4jxl+75id4n9E2WqWbP3I+4O4LPF233hIa58xXZMQhlHZoK?=
 =?us-ascii?Q?ECXW8zxshpBgCHFjlN9nhb2wZ0hyGeO8OZgArmz2/7OL38nNamO2zJGU11jx?=
 =?us-ascii?Q?vd+T+12f1T2dnBGTGxrKIvVNxmrshDvP8FeqxPm/TiwLqxF9zRh0Iivc6AK3?=
 =?us-ascii?Q?FeuXIN/P7HUjuHaswr0g5MuhdPvRHzoxJumfZeQvg2E4IDCW3JSUeEfxcdj4?=
 =?us-ascii?Q?Z+qU9pUjSDcuV64SzMtbzTaqeiuEINqewWS73RXrL0artz7BAUXeWU1dstI2?=
 =?us-ascii?Q?LbBjVzyYKHnt6/GPimBmBs1Ye9GC8Yt/zt51yzJltzRKN45Q8t6jsTILtWaa?=
 =?us-ascii?Q?6SRjFD3FBOJMlGY4sZ/hf78tIWfJaDzxFPo03WJ1UvDdY/L2fx+92F5bdpE3?=
 =?us-ascii?Q?VA+0wF4QoqUml9v+35cz49uhGgbV9+1qRdomeS8aI1EDXsBY1uZJYskw53BR?=
 =?us-ascii?Q?1mkjJ6FGHJiUoU2OfhJIFBVM5y/8W8fwq1jsvB4qDw7JynfM95H8MWlcN0ET?=
 =?us-ascii?Q?hU+8EJiWprKge4JnFVuw5X9XPR1HMtklg6gN3kkfpkcn4hjN8LnLyGKzwp0/?=
 =?us-ascii?Q?+SGpeS7gfv7qh1tdh378eMgsAh5Zqj5gamMDVnq4C4Gbal7XpeGyEdPHWAsc?=
 =?us-ascii?Q?bFkCE9bJZfK+IT1Fw07MBfYhQa3tAORnCvEcOA58zaL/RS2kqVeWgNqKyhqF?=
 =?us-ascii?Q?TDwyHKFhEuuqyZCLbnIS+FXR4NbUwuBTC0/zl+6YFaHHH5jo+JC67SiwzBgQ?=
 =?us-ascii?Q?D9vzS3MJPmR2admXA8t6DUkusD2CCBxKkncnbqugR0blYr2nuv3aYRS8SPjH?=
 =?us-ascii?Q?uHkIf3ELAE/LP6YSPS0mHLJXwFr8yuU2RRyGgZEuO1BEQn98BDNQKIW84ppU?=
 =?us-ascii?Q?W2quXAnFk3HsMdq4Fm5TaAbdV1auTZeAApX0ZMaBcdz+EL2f/taHJ2Wnp3vb?=
 =?us-ascii?Q?IOtXSpEr2a1LqjBhwH9RptcIM4A2RT9+5XMbuurD98XGUHWYDtyc7yVpO226?=
 =?us-ascii?Q?JmD4biBxvju58bLTizgQCzydRwzM8Cih35caGIhzYLY+pzqcGpVI0Q=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?wy6q4L11jJAB9nYcZcKKTcuBLalX5V8vKggXn3ny1EKgLJHiA4BHCaUQEcFS?=
 =?us-ascii?Q?e4jxumFlIFCzZKyYdjJnxFb9eEsRCfIRKJkM65WXBfY5HlqAJkVtdoAh1zBH?=
 =?us-ascii?Q?QCVjPOnRofRUPMrl/IDFrDe//qZBkVLp/j8ZYgUEyQNcnYoMMkTh1fHZiLVZ?=
 =?us-ascii?Q?Ravvbg730bjUQjUWy5tlO93ypPMUfr+dA6CzNjetNdOfae+Y4CeAWy4OH9tO?=
 =?us-ascii?Q?nILnHnk+t5t+7Fzglq23gFm7ecWHbnoM4WduvPBy2jZOmVodHj1Yhd1dNaNY?=
 =?us-ascii?Q?P4DHAuxVbfE6duYczGkxrVzOi75tiFu0X/p0e9cFjedYJW/AB20xlL4Rker2?=
 =?us-ascii?Q?o9scttemUeBpK9QUHnce6RQrTQMs09pevLWaPjDGx4lo2UD8tTxUssfxRCaX?=
 =?us-ascii?Q?eUYkuifOW9dSmHP1sWDj0dcrr2o5IEJohq+rfsOdPucz6HqAk6S5EHVr4M5c?=
 =?us-ascii?Q?4Nh8wpPI81nUXACvvASipR5Bn6lZr92rv+FVviiM7B99RyrtTVXbydOn1Btb?=
 =?us-ascii?Q?9RuuqAD4kml2vBzmTmnU2GuGBQ15mGvAXBr5EqnZO5tWF7QeMnicoCrg2Bcy?=
 =?us-ascii?Q?7NFeQckf0eVb0vdPUrxOxJsb9RYOclrGE8/X5lTEEfMWJzzA6qzBwE9Isi/5?=
 =?us-ascii?Q?/KpwtgpPr6TR7yZlMGqjRdMsKVjdDRdR7YBjqKCQOkYsIavWJL9doZQ+lgI9?=
 =?us-ascii?Q?lMztrLIiGeiqJHgf5Pr+iblGpux+L+lGjEADnbxrgHVrbEF5AI1yxR4+ZZR5?=
 =?us-ascii?Q?rZIve6Q5eZS1VZXFoyzMNHgNtrgEyB8cUUqdE4HpNnHNop4NfaotykzYxPrL?=
 =?us-ascii?Q?RUZAJOGj+YLnVCdfyd/fVUMck4sZKaBpDapLVrmk9gv/oZobGHuU/OPqWJ15?=
 =?us-ascii?Q?WkJN9G4Q40VMK78FbQDfS3jkhnPB1t1LHBWrI7vN4iKzah/ESWpSYfu2gq5a?=
 =?us-ascii?Q?fZI0ZDnXK0tSP35BajvjMhWo8LGQVmsibq81zPF1wXPMqFsJQGSUA6iqvDZv?=
 =?us-ascii?Q?3kHIpgAjwVg8HOKn+P52sJEMS2Hz8yaCpLDCLByObfn/ivy+v+Sg0UEwdPTu?=
 =?us-ascii?Q?f+ZMHipgW1DsidLOdj+iuQs4fJxoLhGl9i8nnShqjyqVviE4dRKBBpBAUqtX?=
 =?us-ascii?Q?NrRvFi1iAsjAedXM+10D8eOFdub/Fxa0nuG8PiOXNiVgrAAN8Gmec5lqcsO4?=
 =?us-ascii?Q?ZPVdCoWxUsj+DBaJVWHBnzwJC3b41FRokVr9chOL9Wpwlxd/4mLsLJDQv2pr?=
 =?us-ascii?Q?/u12CqCOs+ikVwfYYBPYo7JumRv+ocN3YUEsh37eZcCUVo4dw84S2/Ch92rL?=
 =?us-ascii?Q?jXb5OoK3bqMdfOQLJ7dvjH22dgsRTx4pw4UBLsUUBetb5kAWQATpVlV6S8hB?=
 =?us-ascii?Q?ndDFZmqEaSD1ESdRHTz8nOC3REAA7FwUkgRxn2l9vwWxexhaRhb8CF2cbgK1?=
 =?us-ascii?Q?B6eG4awX3v7Z524A7EbfSHPLFUJ9zWJB2FDeeZX0v20Ls4/jygvo9KrXQo5C?=
 =?us-ascii?Q?/22we9uMSm1INBpN1wQ2gUDLk+qi/QagKmT0Ap6d0c055scd1uK5v6uyHUul?=
 =?us-ascii?Q?1RsjC8CgvtjRlIC0ShylX0KQy1fkJ7sQQ5jKf3CE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e540ae3-b402-4974-6b15-08ddde6f6fac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:53:55.5067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D30Od9FGgruuuXpKwiqSRChP21DWZKT0hlOIKhxNs2ibYpz1QVdH+TMLwz7R3N++pD9lTZKxGD8zNHcBl/YDQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10078

On Mon, Aug 18, 2025 at 02:22:34PM +0800, Guoniu Zhou wrote:
> If streamon/streamoff calls are imbalanced, such as exit application
> with Ctrl+C when streaming, m2m usage_count will never reach to zero
> and ISI channel won't be freed. Besides from that, if the input line
> width is more 2K and exit with Ctrl+C when streaming, it will trigger
> kernel panic, like bellow:
>
> [ 59.222120] ------------[ cut here ]------------
> [ 59.226758] WARNING: drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:631 at mxc_isi_channel_chain+0xa4/0x120, CPU#4: v4l2-ctl/654
> [ 59.238569] Modules linked in: ap1302
> [ 59.242231] CPU: 4 UID: 0 PID: 654 Comm: v4l2-ctl Not tainted 6.16.0-rc4-next-20250704-06511-gff0e002d480a-dirty #258 PREEMPT
> [ 59.253597] Hardware name: NXP i.MX95 15X15 board (DT)
> [ 59.258720] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 59.265669] pc : mxc_isi_channel_chain+0xa4/0x120
> [ 59.270358] lr : mxc_isi_channel_chain+0x44/0x120
> [ 59.275047] sp : ffff8000848c3b40
> [ 59.278348] x29: ffff8000848c3b40 x28: ffff0000859b4c98 x27: ffff800081939f00
> [ 59.285472] x26: 000000000000000a x25: ffff0000859b4cb8 x24: 0000000000000001
> [ 59.292597] x23: ffff0000816f4760 x22: ffff0000816f4258 x21: ffff000084ceb780
> [ 59.299720] x20: ffff000084342ff8 x19: ffff000084340000 x18: 0000000000000000
> [ 59.306845] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffdb369e1c
> [ 59.313969] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [ 59.321093] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [ 59.328217] x8 : ffff8000848c3d48 x7 : ffff800081930b30 x6 : ffff800081930b30
> [ 59.335340] x5 : ffff0000859b6000 x4 : ffff80008193ae80 x3 : ffff800081022420
> [ 59.342464] x2 : ffff0000852f6900 x1 : 0000000000000001 x0 : ffff000084341000
> [ 59.349590] Call trace:
> [ 59.352025]  mxc_isi_channel_chain+0xa4/0x120 (P)
> [ 59.356722]  mxc_isi_m2m_streamon+0x160/0x20c
> [ 59.361072]  v4l_streamon+0x24/0x30
> [ 59.364556]  __video_do_ioctl+0x40c/0x4a0
> [ 59.368560]  video_usercopy+0x2bc/0x690
> [ 59.372382]  video_ioctl2+0x18/0x24
> [ 59.375857]  v4l2_ioctl+0x40/0x60
> [ 59.379168]  __arm64_sys_ioctl+0xac/0x104
> [ 59.383172]  invoke_syscall+0x48/0x104
> [ 59.386916]  el0_svc_common.constprop.0+0xc0/0xe0
> [ 59.391613]  do_el0_svc+0x1c/0x28
> [ 59.394915]  el0_svc+0x34/0xf4
> [ 59.397966]  el0t_64_sync_handler+0xa0/0xe4
> [ 59.402143]  el0t_64_sync+0x198/0x19c
> [ 59.405801] ---[ end trace 0000000000000000 ]---
> 		VIDIOC_STREAMON returned -1 (Invalid argument)
>
> So check the queue streaming status when application close and call
> streamoff to fix the issue.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")

Cc: stable?

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 22e49d3a128732c077beb7ac2e2f688e0899f8e2..7650a9fe6b093e2b4e09e3e66b624c8c019c8583 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -709,6 +709,14 @@ static int mxc_isi_m2m_release(struct file *file)
>  	struct mxc_isi_m2m *m2m = video_drvdata(file);
>  	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(file->private_data);
>
> +	if (ctx->queues.out.streaming)
> +		mxc_isi_m2m_streamoff(file, &ctx->fh,
> +				      V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +
> +	if (ctx->queues.cap.streaming)
> +		mxc_isi_m2m_streamoff(file, &ctx->fh,
> +				      V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	mxc_isi_m2m_ctx_ctrls_delete(ctx);
>
>
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250818-isi_m2m-ac52338ae925
>
> Best regards,
> --
> Guoniu Zhou <guoniu.zhou@nxp.com>
>

