Return-Path: <linux-media+bounces-43224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8CCBA1B3A
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 23:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB288387D58
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A810327FB26;
	Thu, 25 Sep 2025 21:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="luqEr8OS"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411C71F91D6;
	Thu, 25 Sep 2025 21:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837342; cv=fail; b=c7uL8Q95BGoT4/eEW7wAgJ3oWncgkPUUWshn7xTFcYQBbEl6L/bS5YgOPi9hi3PL+djTATG0Iy2T/WO8zfyvg7m/L9IJy58PD47dwRooY+hVhDwB4IS5sBruCahs0JMT+/QaLONKtjjo0CEO4/bEHV5/D423VhrZqJ60mKU3OB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837342; c=relaxed/simple;
	bh=/34Q/dfjZGskugTcAvcyYfYjPNERXkQXTTXxDY0Plng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pjV4ilPBrZp4GJqM+eVLyyK8MdLUiSmzHDHmaAVooFGSrONbrVrHg4k4wTBJDnF2H/Oxudva63CTUusJgeL+hse5YJhExM2nbxm4wQdlmsehKIa7iapz9hdeSy2LJiFdILZsoni2uV6krAq4WgOQsiBkUoSj2zgq8Fo70eHEDPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=luqEr8OS; arc=fail smtp.client-ip=40.107.159.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVdYUcWsIYN9X0BbY/F4Ec8slW0laYeRNmVsznqk9QaQhEFMV2JK6IA7dqjamgIkPEUDl3mc2Va50G5hLeUfKTcfdBlYnjmiZPO5lVNiR1ABgYlCIse5RATkPXkd2e5EvDrjFwcptJoCXxpnvQTeUXfr6XSz9vciyzuRI3jYE/s1OI15zQP4zG4p2/OA2wJicxj/bT2OAVbIuMUNbG6SG5BFvRlaWRkR+8JVPpOOY9LnNlR2D3jrfl6Avkj2acT+YIfE+rvJLkq6A674G6QyZGnmvlgw3BKlBkwOiIHSf0PD9fyWpHrblovtQaRCaU5FqJamMBiS9ZI8aFfDrVXsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYp/21o38PKejkqSa7U/BrniIDH57jgw6WqFh9xIeFk=;
 b=MZuU8asD/LFN8IxAow9CXBV5f+EjHwWEIfSri5g07Vzc5mYfIhyiBvoNRcWI2hRFZx3wfegGgN9PYtI22/d8GjGMjH8aehZ65psQiZwND/yKJuKwWTmnpZZdkjFb9yMSaCyvmSfWML0S3VwJqMYbpSVWlfsbj2pzuvH8PE9+A40Pr7HMHhJ+nTyqcDrVtvw/83PTwgGJt0g59DH0l++bZyMWVr0LaEXEuo7ZwdQAppu4wV43QlXvzPLtJ3Hn4DckNpxcjTq3T6UrCdDxQ7u00eGuOnV+YEjVX6Ucq4RYfpn0UqbYNt1x6Cg7RcDFXc6UwzGFt5Rwb0o5FVnTVP99WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYp/21o38PKejkqSa7U/BrniIDH57jgw6WqFh9xIeFk=;
 b=luqEr8OSpWKjn6txJfPtclU47Kl5mn8KrkFq/sjt+perAtFNvMpbFSvWJFce/njWAGVli+9XP06yDwbRogwHOTadzZtl39OtOeOlgwH+8EbjOsowkH6yM9ZMjKy7FoYhGyNBw+0JGYy/suQTRuBP9fXMc54kzDMCv9IomXmMUNHQ3SD3pJygNTYwj3a2vjh4hgoMmLLw1ylYl0t9WsNhrmbc0fWnGVgwLC5WRLy7iqzoACqyti+31Kt/UhjqH0yyrTgNhT3CnBUqm7EaYEc+MLXK1KyrstH9xYlr7FTYnfOmXtMpQNgkori4IjR9TyBgveKEfjle27IDCw76PYDGNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB9112.eurprd04.prod.outlook.com (2603:10a6:20b:44b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 21:55:36 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 21:55:36 +0000
Date: Thu, 25 Sep 2025 17:55:28 -0400
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
Subject: Re: [PATCH v4 4/4] media: imx-mipi-csis: Get number of active lanes
 via mbus_config
Message-ID: <aNW6UPV7LzmczWtm@lizhi-Precision-Tower-5810>
References: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
 <20250925-active-data-lanes-v4-4-8b54e3d5af6c@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-active-data-lanes-v4-4-8b54e3d5af6c@ideasonboard.com>
X-ClientProxiedBy: PH7P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::29) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6c260e-17dd-43eb-98e8-08ddfc7e4231
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?WI/FdmKuc721s4KgN1wHGbc11RWXxkznxtrBTi9YvE9vQe2uxXaf6XqLM5Gq?=
 =?us-ascii?Q?s0tJZgp44wbgczapoJG94JyV1RE1epQ6drib6FlcFscko46rK47n2bOpxXES?=
 =?us-ascii?Q?hQeitjzMrIoEZhH/lT460CLQcpivKdX90fOeifLo6jv7N4zHa+HhIgfEzR8S?=
 =?us-ascii?Q?xuAxAFRYIswSOXSUjNH1WXKl9zo278lCDL5el49T15Stgoand4zsjShsYNA1?=
 =?us-ascii?Q?KRbRpxmgLN3pvstFMYtrq5iQsYq6wNRFoOdSaejRf7jbj5KBUo4HFWQGPAJT?=
 =?us-ascii?Q?PeOgkoKPU3C12wngae5q0wrBHR46HWSnTtxRH603VVCG3CIV8AKUtOnFIoPe?=
 =?us-ascii?Q?F1ZSzCQpCrUF9CDttOgsVHwwUBaiDVwkNdWVtoa9HhvtvyBKo5y479qbuINu?=
 =?us-ascii?Q?P6ZxrBiRpfcPQRjfN9yX86m4Q/CFMdd28h/A+g7KSh1EKDIFSUZq5/4toHkO?=
 =?us-ascii?Q?/CZJi/8bl9ATjlHBIs2ehjdxvudjgqKCT8E9/bO4acmVSlpuLokqPMwd9i2g?=
 =?us-ascii?Q?nKh9HutaNFi++g5AeCddhJsZeni4PcxsKDfnDm+3WGR/Jy2u/n1dAK3kMg5E?=
 =?us-ascii?Q?WO3v4Gw9qxN5SczUGBbRgpc1ckPxltIZejyt652KFkN38y2g2yX1A9nH7aF/?=
 =?us-ascii?Q?AHyyk/xQQuR62HyUL3/9Jm6nhgtnBbuyuj1YAg8YPEUX3Fku4Q83kC1FyBJ5?=
 =?us-ascii?Q?txULNBZfLT/BBP9JLNomJKiU56smcrcma/XrL+VS/FccTcMFYlWMVgT5bQRc?=
 =?us-ascii?Q?RhTuZ+hl2W6qEmT2a0JyuUDAGj8meVPyCg7yOVG1/lGIUCP2xYd/Nopg5LdJ?=
 =?us-ascii?Q?whH4g/saMNj3pfn0LP16fDfGpziYMzmR/AxSnKo9SoxiQSopTzRX39GAPUME?=
 =?us-ascii?Q?BWzzI4ned5CXHN7k5a4xE8CQxnGB1rUDkUzgUDixkl41zv1YoO+hRPY2rKJq?=
 =?us-ascii?Q?tnet8sHFcC7LHpNLoX4fbJzOvaVMdi2GY6G6I52JcKIDypg7rLScOMZ69Ygn?=
 =?us-ascii?Q?c+LYtzzi65Xu9THFI9Uaf6KMC14bMrcnL8Gdf5TJeZfR37hDQeBNeGO42p42?=
 =?us-ascii?Q?nh10yuoq6ired6xIRXnlThGoEYxZ9EzUuyIk9Q9J1fkhQRXGfRsqDEww/TVY?=
 =?us-ascii?Q?FKzZqStFTIgWYstCGxyy2tOvUEjjKCGMqd0Lpurb9+UqdfiHyKkEzWKDGWVu?=
 =?us-ascii?Q?aPAvQOHr9yQbzlB1eCzPcpl4T92lrNLhfxesXhkMvLBNRA83zcQITRbw5+YH?=
 =?us-ascii?Q?UeP7F8VvlGamy/J0ZmLXsVUPKtDlUtG4PKsXMtE/rO5kRNTLci48y1WvowHu?=
 =?us-ascii?Q?jkPnGXOgvTOFi26g0N7e0dKRcNFVuUDJ2hxW0zoDNDL5m/UhD3FaxkMN1xtW?=
 =?us-ascii?Q?vcESY4+0Yu3pxURIJmv940Om1gCoxeUSMzpwDH2Mgf2Y8zTxZroo+30NG2XL?=
 =?us-ascii?Q?ZRE19ce8jOcdzn+wczrS6yQ/d86NW3ObZhGCKkxLjGsTjT+zyrnIsw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VF40pT/CEoRKd1cS979u0yJCS8HLfWo17ht7ycszJs5Vmnd1tkNsKEHXExW6?=
 =?us-ascii?Q?R8ZQ+ca+zv+ac3/wdODMfCSlrLrGtK7DJkUmDm/H/rMHg9ZpDkdLcQHlD5+e?=
 =?us-ascii?Q?00zwtIErSlTd9GptU7EpMr7ly6BSFb5j6RDGF+vt1R6kgJ948R8tMXhRYSBE?=
 =?us-ascii?Q?pKK/t4jhDYSkObGNRohZ7aBjRILQarfNByAesrCKmeSLKPY9NaRYHFkpxx2x?=
 =?us-ascii?Q?+0dE9p3xsb4NWopS2Ebn1b9BAgcm97a45r8Qwhg/rKYsXdlGJ/1fju5nCVSU?=
 =?us-ascii?Q?hXDhJRprppkpvoKD7vfR77g4N1ItlD0J1GnR43ULJCPK2Tv2EdhyakRteseq?=
 =?us-ascii?Q?oAJBzSDc7x3IJY8YzC9fTm5RhSzuT96FhjPh+/LjQXUFwitkF3VbG9w1PlSq?=
 =?us-ascii?Q?qB9Ir5og4pBKmAgSckl4aCMFciyTc8/nPR8pF4n3p7mdoBEhTGtnHxmF9ncq?=
 =?us-ascii?Q?3e8RePZJO1F8Kz/naR7PRMTBFFWdUxXsfBmBiDHCOLGYfN0bF48lypktMO3K?=
 =?us-ascii?Q?kSF9SQllSXtifgt5Y5XOifArkp5pjzznZlCMsquxGxFujuJbYdCPyUNlT+kL?=
 =?us-ascii?Q?GAqBGvWHd79aTcquFOHMt78kj9G9D73R0M4JmjVUwvA1FEZ/3GqWIm6NFNow?=
 =?us-ascii?Q?njutkY+8FXpuMYAtV2D0Xpt9AS25OUtgSJ6SCk2mJEAu/hcIRTZxUtgqoJQl?=
 =?us-ascii?Q?8NM557LEheoVxD/sMjlBbkkqCwm9qLv7cvx+U2VDbljDW08axDncCVRbU0sv?=
 =?us-ascii?Q?Keg4NHVKxVofPQVPahkFia0X2NNTOkfxFJwVHERoRP1XZUX7rTpbBfzQ4KJO?=
 =?us-ascii?Q?MUZBsiSLDW4qSHUQZqYwwXD37spFUSqS2j+/Rfn/aF9gkHktZ1VEFZ1R+PTf?=
 =?us-ascii?Q?sPS8lsRDOoz2QOiBuwZT2l8quB9YfUrPwGOBK8y20WmxxzhvsQzvh5pv+glZ?=
 =?us-ascii?Q?FQg25uzs/E1sbrG0q2sTo3P4JXfe4jIVJ0o4k05AJoe/sH3ZPZn4mX2YFbXN?=
 =?us-ascii?Q?0uUQqSX/mnR08jgms8OGIehay/KkGODuEDfMbr7l+zn6XCJF4Xbc/R/UVpjL?=
 =?us-ascii?Q?3FpHoToYGyFhdpkSe1v7z4iIkvhgg27F3lbtn5n6V264HpUCHgrFZqoKgm9A?=
 =?us-ascii?Q?CducRYtD0s/y1LD+RxG5CgGM3Vm0GMuOk5bGEKyQq7m37TpHqv57bYbtO7jL?=
 =?us-ascii?Q?xizmdOW+oDv700/IxQ/o0VVjJgsdWGKGrWGAmyihyW2ja94Y5MWcaK2Vsn3H?=
 =?us-ascii?Q?mDaB6I5slhS+8akLOSNRZmtLheb0now1+iPTKD/pGoeQEEj6OUyv+E6H32V+?=
 =?us-ascii?Q?OGpKMhtzpYvG0V+sStk+PRKO6r2iOe2o3VZBGjoYmhUcJb+0+ls/o4gHxWFP?=
 =?us-ascii?Q?xeFvWWFwMLwypNWWCCgoi7lg5CMshu1X59t8oRAI1b2FBuJ0l7671qoWVFwI?=
 =?us-ascii?Q?rUEr29tqLgQ4QNjKcqNEtucqHs6mpYYKQj/1pAgc/HCZdETpFa6m1ZK7Zeu0?=
 =?us-ascii?Q?hzh1aJAP1fp/T4UWVdprBCThx4Cm2wrpACjWbV8/85iEPFJqvjzlh5qqp0IN?=
 =?us-ascii?Q?wf7cRSWPtdY4jElzZ+avIR0Wr2kiCF43OwxfbJlr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6c260e-17dd-43eb-98e8-08ddfc7e4231
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 21:55:36.5016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3xa0Ib7ilJ03i+enZplAqYAX1szCIGgrlcedJ2+TjT5cNqSBQVHvjRjUVo4N1JdxBvsf+IWa01jPMaSFT/vxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9112

On Thu, Sep 25, 2025 at 04:54:29PM +0100, Isaac Scott wrote:
> The number of lanes actively used by a MIPI CSI transmitter may differ
> from that which is defined in device tree, due to the source device not
> using all of the connected data lanes on the board. As such, call on
> v4l2_get_active_data_lanes() to check if the driver reports a differing
> number of lanes to the maximum, and use that number of active lanes.
>
> If the number of active data lanes is invalid, or the op is not
> supported, use the maximum number of allowed data lanes.

Is below message better?

media: mipi-csis: Support active data lanes differing from maximum

Call v4l2_get_active_data_lanes() to get the number of lanes actively used
by the MIPI CSI transmitter, which may differs from the maximum defined in
the device tree.

If the driver reports an invalid number of active lanes, or the
operation is not supported, fall back to the maximum number of allowed
data lanes

Frank
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 838a1ad123b5..637ef6e614fa 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1034,6 +1034,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>  	csis_fmt = find_csis_format(format->code);
>
> +	ret = v4l2_get_active_data_lanes(csis->source.pad,
> +					 csis->bus.num_data_lanes);
> +	csis->num_data_lanes = ret < 0 ? csis->bus.num_data_lanes : ret;
> +
>  	ret = mipi_csis_calculate_params(csis, csis_fmt);
>  	if (ret < 0)
>  		goto err_unlock;
>
> --
> 2.43.0
>

