Return-Path: <linux-media+bounces-29811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 851A7A833E0
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 00:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5BC38A3742
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 22:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34956216396;
	Wed,  9 Apr 2025 22:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bTTSlXlS"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573A81E5205;
	Wed,  9 Apr 2025 22:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744236283; cv=fail; b=DOai0/nByFaKSRQfkaXbZPyL3U/yqzQcsaVovW+LkhTbmJ03X+H4dvon/7Q5WN875xgID6RQxjsaA1+ENdfQgzFKFRTD0+rLqBZ5xL8Leml9Z+qIsiwbs7tWcYjo27EwGjXEwScY83ZDfV8MowblRfWmBkuHAJF/6cKcDovot/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744236283; c=relaxed/simple;
	bh=Q0n7Xn+gAsTzLCl6XLNL3IkaJdGVSDjTq50liBlc2Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GHMjbcuOMGsEBurtbZoIdEmjruUfKfufWCi/4C1Gbhdqyhg2X41i8yMMdYqeg8Wq2+8/+NGorsSg+wg2xq9JvBIXrCX1b7dxdQ2sHeMAEIQkARnH1lqE8kJi2ryLedVfl3kddZqEj0SGYaRAGjCwEThB6ZKSoGDHPFkVDqhPVgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bTTSlXlS; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1g/2GD0jHJsqH+CBRzcubOg3KIq2L/+ZI4acNGB6IXuFvkLWJhHYGxyu+P7T/15z6Sgy7A3TBD5z+lNOZiTu9JB7djhi+QI4ahlhGs/mQa4xY/f+mDfl8n2jfuQ6mzLJ+v85QSP/O547x676/gwOJQrvXjqpm/hW8kHnDUT8fmePJjyrmkbov/yV0zuXsyTdHOUKbnt1r8eOmiSp52qiV645wsPuK7Vja5/1w168zNuMSOGNhGGw4dgduHqhkhEzfVCaXkhoQifQgiWDXkdLA4bKD5dGALPGT0Tf9NNOY4eAsTb4hX4ysa2m/D7yBHpJaKDEaQJfR3eyjsNH8nZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAhsuSky/9CWW08jPgCxuV404oRW/GeWfZJzIbCcyHA=;
 b=v51OVDYLw5I03r4nCK+gPvDn/kCTfcwvOjtDZMOKldJcvo2sEBRLgwtlv8eoRMaYO+epZckTX2g4UPAD5G5Q5mH149ZR8lcwcQMkRYmIp6st95NEjQvpr+56iy8LjzQ8HDrdyETehgJr+gGUmE0s/txsg230iNEAN0/Oqs765OL3f6mFGIIqscJLOEXXDOmdwb1ENlUfwAzHzKukyysMYXt6KWJkMe1ei+Mk33giEWsspsDFIjGdhfB5hVZ1lQpcyM7Hle6lG44QTRTOvJos3AL7s8ZrmMy9sfnnSp3sOSHnGMRb3384XdDWzL7bULTUfYsWuFcu1wclprt7Q/mhTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAhsuSky/9CWW08jPgCxuV404oRW/GeWfZJzIbCcyHA=;
 b=bTTSlXlSdSscrs2Vr1RRrkb6ZZK4sgzVat2S/WZVUvMMem+YZsb5pWOw25IiTJLsUzyBlAW2J1/hgvNBp1bAYHfTGLte28lmdg9Y+ZXGMkXgfvYAw2nQf36u/poHJUJ2dQa+VFpwf8KJaYJK05yU34b/jMarSmyClIvKL8Z6aefg5/ipH/V/ldyCVv83xdZkuuHSSQI3okV7PXMiOw9J6n23o+xAHcbBwbEs6sT3VgFl0jQb5g0TyRwipaI9odIIV05T2oSkL5pvbr7yooj1vHmCSnTStq+lfp4HTygiAZIFx0GRIkdhlDs6MXA6N1KUntKNJxLr4JvvdgaCu/cMnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Wed, 9 Apr
 2025 22:04:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 22:04:37 +0000
Date: Wed, 9 Apr 2025 18:04:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] media: imx-jpeg: Change the pattern size to 128x64
Message-ID: <Z/bu7SnzN0Z7qpr9@lizhi-Precision-Tower-5810>
References: <20250408025725.1244-1-ming.qian@oss.nxp.com>
 <20250408025725.1244-4-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408025725.1244-4-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH7P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: f22459ca-e851-4a22-ed85-08dd77b2849e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?REVNrW3+F8ZDj18j4ar+wNBH9Zfxu2E85xoGLxRUY5qY0ApAMxLkaKsawMD5?=
 =?us-ascii?Q?bo9914Ol/Gp0SUGL9OnGBoTtahJBJ6g3nLmAwhbG6B53Kg13GXeQBpxQoss6?=
 =?us-ascii?Q?T379ZXq4i0BcpS+PV3FgtmRmvLB58bYcqUXN1+lFMcMs+LCaX3fws54Ty/7x?=
 =?us-ascii?Q?qhIsBeScbuhc+DWAObK98xp9y5UT+6tO/Zum+VJoxLzYdi26gwL6bOhVyQDM?=
 =?us-ascii?Q?iwhePC7wNWYm9WfBhjoX/woT5XESXzVsP3MjrSr8fKlwK5RAkBJcLNHBoCMw?=
 =?us-ascii?Q?53+17P8sPd3z7thgHX5441VnGjNeiUELYpmiz55PtXDQMnOVODPi4QARfpQG?=
 =?us-ascii?Q?ELh+grQ30tEEsFBMgAZwASImkgJDejag9H9L6qkhtFdr4N3/XUtQE71G+BXq?=
 =?us-ascii?Q?22zvJDOO/Rl97fkfT1B8OpazRlnVrdtOZe4nNnfsZSK8nIHgRyiVaBDIRDgE?=
 =?us-ascii?Q?nU82b2tK/b4wUY/NVvCCemTp1firwIqf2QNfrpW+r+kT81pgeZiEMtnE9YV5?=
 =?us-ascii?Q?IO/ZIkIXXkqn8dF6mTwlaM2ThFkIrjQnSWNFh/rz9j03FeyEK6jKfOOW2ur7?=
 =?us-ascii?Q?mheE5E7YgTn3copfTU1GBNVk5OucMLAeoTJhCs1JbS7X33oTILDyo7/XDyo1?=
 =?us-ascii?Q?yP/+k0+bkT1RPT2cUQUGxVSxIqgbAsaplVAUEtrJ6ecsQe0bsDUQz/Zov4d0?=
 =?us-ascii?Q?UeaopiG455eqaJ3F7XPp/8BioY71vCzYpWYWmD3WLBii/xVC4LVrlClNGlri?=
 =?us-ascii?Q?3SUaLXVQfY/NaJsmUW9ZaU0G93mfcHCty9UR9Ie+qm5/2WsOj/ZLox46Qe54?=
 =?us-ascii?Q?BsUVF3ZRpXxF2atcH/dmtigJUKAQwge6lDgejxWcnb+C9Rr81WRqhQOdwkP2?=
 =?us-ascii?Q?6ksEvi1aBwvq/WMfANpCNwH0LAN0cpxtYwijWiyJQWwkPVzYhT/CdLa8DrKh?=
 =?us-ascii?Q?r/FmqBkI1Lk9PW2+g+bvU/PlKBDldJrw68UFidMcjecBIO6f+2H6fodl7PO0?=
 =?us-ascii?Q?fgb8dg6rnNwG7Fg6UndEDA03raLYYljkztrCCJBm82dsWl2sYo/9hkVekjPR?=
 =?us-ascii?Q?pUeYEMdcZWZIxNM58GHc3kJj4Pwq8L5mPHUp5GwhpBlSuHHceErCtU/EPNB3?=
 =?us-ascii?Q?T8YMj68GPWHbj69sfxWtOsqhacalEbEINQBlrc7JzYyzUgMQNWGEnBMhlTo9?=
 =?us-ascii?Q?fMu6SwgoolvJPrK/9HeMQx50CL4cuAy3x9KEzAONeS1dBddpgCicGFL3t8X+?=
 =?us-ascii?Q?2AgtNkhvSDXcsLU5aKl5A9tW+AzS1wqnJhj01Jm3hvcjg3l50WMixAoSilyu?=
 =?us-ascii?Q?X5Wo/81kHbCf9I4CRD2LJ9Yi/ecUcWzZqcSulzvnRQwWPIxlThS/R2yxWvgb?=
 =?us-ascii?Q?o7dW3G4aQaJVbt4GUgH/52rL2Q0Os1+yZMgF1utUrDAOdKag8uSRMi5pl82j?=
 =?us-ascii?Q?3GbbtRFrvUVaGxMWyzukf57jfP8hRIjX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P0L7uFLcgyp7zBcsccz2VfUJvjb2k6C3+Hn5PvcODeKEZC+sChOVXmdxgLDe?=
 =?us-ascii?Q?X+vEGETV2DSJcNo68kwM3Wfdukb6KuUZ2U4TjPPAjSvSxsHI126FloVreBQW?=
 =?us-ascii?Q?vhqhqx+xW+O+pf9v7XqFf/OV+iXIFdyjsruREFJpSvbjjmJfg2GLdBkolFma?=
 =?us-ascii?Q?XPGalzADJrzILq3qe7PNjCq0HSUjtnCztz8QFtWqHjnqBg53vN2rzhfIhDKY?=
 =?us-ascii?Q?EWIqNv4nza+2sUFnFt6he+w6gFm446ICDvLUShLWDxTzBALAYEBsgvtegXZA?=
 =?us-ascii?Q?cz49sQQqKevGUUVHWS+CMb4RTwl4BbJPrvvd29tjjXrGAElhSnv84pkxuVvs?=
 =?us-ascii?Q?cluC2afVlJHnTcV0uVQPE/PNfth3rvzFaC/D/6Ap5e8+xBYvWtpoI+55YU7y?=
 =?us-ascii?Q?l9eV3nRpnKRTgbb8cG7xdAKqYX3pTPyqZUUmDENuLiTCHm0OBfaEQtGE3KM1?=
 =?us-ascii?Q?181MFXD/Fw9gc8Nr4M+XCRFmpYG7JNXMT5cr+qy55CM5lbOZmRFDDpM3n9xo?=
 =?us-ascii?Q?cR2w47AGAoQk4s8lWAdYeVVA29yLr6Y0tZyllDsVSZqOviUzndjRxb7PW2Cr?=
 =?us-ascii?Q?JeBh2n4FNA9qdF+znn9d8aNWdTVkYb2mm7aEGEoJOzJUgtDY6IqL2cFGkPx3?=
 =?us-ascii?Q?TPUjrZkWUU0kqrwR4OTHIHFTX4Z8jsoQYkWUg4mCBlbHDd+b9MI/SMlwWUYp?=
 =?us-ascii?Q?CptrJqwH/WEjZ2aiPjwMeXO3ka1vO7YhDfvPE2rOw2KUMIK+NXdprAqzRI0r?=
 =?us-ascii?Q?zPYGh/hrPmr9VI8IgTNmQshVOxetn7cRKzJUvS3ye4rTOTKyEV9Bi+987BF6?=
 =?us-ascii?Q?Sh0GfT6Ofk6YCjVuqV188xl6nXXEQFLJlTjcQNpPAPbnt8KEYltlLdzYL9Kd?=
 =?us-ascii?Q?CxMJN3yOfnrTSjhdw3zhRzThYBBf/3Wz65ESSNMzrKKFOSnUIjLdtXARc1hB?=
 =?us-ascii?Q?lylMl6yaEnfdwvnms5VSMMpOholZtJe/vFCXQJs36bX88tD065vMTtDQ7Dkd?=
 =?us-ascii?Q?1Wmd6PvjnZzKnoNFgJynhKqqmTlcj7a0gNlrNCdvPXkQ9DUAakqZsFXLuu43?=
 =?us-ascii?Q?IlcfpDTk28dwPUZXCTlOPBr0jbkncA54irSFynbNgKTCDV4NKKggzMY+wueG?=
 =?us-ascii?Q?QAsBImpXo4MJ8C9Hg1UwdFnU0UdoskHEaYDIX+9bfjmY0B7fUmHoDA0d7xCI?=
 =?us-ascii?Q?8Q7Gl5sc1oQ7zpZkN5nk0EkYqP1UISSZIvM5eaixTc1Q8L0MgTVi+U2HQ/VH?=
 =?us-ascii?Q?vg76rmMxDh2yDn6TnW0Isbm8r7URxP6vPlxdXHm1GUXzrgu0hDGuwKqRPXNK?=
 =?us-ascii?Q?IzK9JIOUUOA+sURzcI/7Fe7WlZ+ihj7nOyw46B4TJYsI9ggj9J3JpT6vPiKF?=
 =?us-ascii?Q?wjlPBAPNd+MYei75S6F89X18YRrLDVnb63KUbxr14xLZn/qzNE7o+/G2O/JR?=
 =?us-ascii?Q?w2Pfwl9JRIZJ44y4vcXXSj4mfsCWrS2GGmdYQCfCydPcsDXKd/BQGS3sMHUF?=
 =?us-ascii?Q?EYuvo8efeKhAse/vcLs6n9YfCC943gSN2L5OLmgxdr8BzdsgwaPOYpjp6UU+?=
 =?us-ascii?Q?IITNf9mUkEVeT6hBkck=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22459ca-e851-4a22-ed85-08dd77b2849e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 22:04:37.1853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loawFB/oPiFKEKcoDZ61KT2vEoTOVQZSRpis3KqeUciMXK6eWY0wcWcJtGm9kw+Uco/Ch7/JOY0gy1Z86Q6/cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9624

On Tue, Apr 08, 2025 at 10:57:19AM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> In order to decode a motion-jpeg bitstream, which doesn't provide a DHT,
> the driver will first decode a pattern jpeg and use the DHT found in the
> pattern to decode the first actual frame. This mode is called
> "repeat-mode" and it utilizes linked descriptors.

here new empty line for new paragraph

> The smallest supported resolution of 64x64 was used for that pattern to
> not cause unneeded performance delay. This choice, however, can cause a
> corrupted decoded picture of the first frame after the pattern, when the
> resolution of that frame is larger than the pattern and is not aligned
> to 64.

Here need empty line.

> By altering the pattern size to 128x64, this corruption can be avoided.
> That size has been confirmed to be safe by the hardware designers.
> Additionally, a DMA buffer needs to be allocated to store the decoded
> picture of the pattern image.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> v3
> - Improve commit message
>
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 42 +++++++++++++++----
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  5 +++
>  2 files changed, 39 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 12661c177f5a..45705c606769 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -535,7 +535,18 @@ static const unsigned char jpeg_sos_maximal[] = {
>  };
>
>  static const unsigned char jpeg_image_red[] = {
> -	0xFC, 0x5F, 0xA2, 0xBF, 0xCA, 0x73, 0xFE, 0xFE,
> +	0xF9, 0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28,
> +	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
> +	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
> +	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
> +	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
> +	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
> +	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
> +	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
> +	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
> +	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
> +	0x8A, 0x00, 0x28, 0xA0, 0x0F, 0xFF, 0xD0, 0xF9,
> +	0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28, 0xA0,
>  	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
>  	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
>  	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
> @@ -545,7 +556,7 @@ static const unsigned char jpeg_image_red[] = {
>  	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
>  	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
>  	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
> -	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00
> +	0x00, 0x28, 0xA0, 0x0F
>  };
>
>  static const unsigned char jpeg_eoi[] = {
> @@ -775,6 +786,13 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>  	jpeg->slot_data.cfg_stream_vaddr = NULL;
>  	jpeg->slot_data.cfg_stream_handle = 0;
>
> +	dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
> +			  jpeg->slot_data.cfg_dec_vaddr,
> +			  jpeg->slot_data.cfg_dec_daddr);
> +	jpeg->slot_data.cfg_dec_size = 0;
> +	jpeg->slot_data.cfg_dec_vaddr = NULL;
> +	jpeg->slot_data.cfg_dec_daddr = 0;
> +
>  	jpeg->slot_data.used = false;
>  }
>
> @@ -814,6 +832,14 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  		goto err;
>  	jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
>
> +	jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
> +	jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
> +							   jpeg->slot_data.cfg_dec_size,
> +							   &jpeg->slot_data.cfg_dec_daddr,
> +							   GFP_ATOMIC);
> +	if (!jpeg->slot_data.cfg_dec_vaddr)
> +		goto err;
> +
>  skip_alloc:
>  	jpeg->slot_data.used = true;
>
> @@ -1216,14 +1242,14 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
>  	 */
>  	*cfg_size = mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
>  					      V4L2_PIX_FMT_YUYV,
> -					      MXC_JPEG_MIN_WIDTH,
> -					      MXC_JPEG_MIN_HEIGHT);
> +					      MXC_JPEG_PATTERN_WIDTH,
> +					      MXC_JPEG_PATTERN_HEIGHT);
>  	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
> -	cfg_desc->buf_base0 = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> +	cfg_desc->buf_base0 = jpeg->slot_data.cfg_dec_daddr;
>  	cfg_desc->buf_base1 = 0;
> -	cfg_desc->imgsize = MXC_JPEG_MIN_WIDTH << 16;
> -	cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
> -	cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
> +	cfg_desc->imgsize = MXC_JPEG_PATTERN_WIDTH << 16;
> +	cfg_desc->imgsize |= MXC_JPEG_PATTERN_HEIGHT;
> +	cfg_desc->line_pitch = MXC_JPEG_PATTERN_WIDTH * 2;
>  	cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
>  	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
>  	cfg_desc->stm_bufbase = cfg_stream_handle;
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> index 86e324b21aed..fdde45f7e163 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> @@ -28,6 +28,8 @@
>  #define MXC_JPEG_W_ALIGN		3
>  #define MXC_JPEG_MAX_SIZEIMAGE		0xFFFFFC00
>  #define MXC_JPEG_MAX_PLANES		2
> +#define MXC_JPEG_PATTERN_WIDTH		128
> +#define MXC_JPEG_PATTERN_HEIGHT		64
>
>  enum mxc_jpeg_enc_state {
>  	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
> @@ -117,6 +119,9 @@ struct mxc_jpeg_slot_data {
>  	dma_addr_t desc_handle;
>  	dma_addr_t cfg_desc_handle; // configuration descriptor dma address
>  	dma_addr_t cfg_stream_handle; // configuration bitstream dma address
> +	dma_addr_t cfg_dec_size;
> +	void *cfg_dec_vaddr;
> +	dma_addr_t cfg_dec_daddr;
>  };
>
>  struct mxc_jpeg_dev {
> --
> 2.43.0-rc1
>

