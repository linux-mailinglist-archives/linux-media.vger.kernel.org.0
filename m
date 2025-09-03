Return-Path: <linux-media+bounces-41719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BA4B42592
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3A8D1886570
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E22428152B;
	Wed,  3 Sep 2025 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kzNaGhys"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013014.outbound.protection.outlook.com [52.101.83.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C78B25E824;
	Wed,  3 Sep 2025 15:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756913435; cv=fail; b=RsNjjuJLOSro504O4PP9aOomR6Mk7gVyPK5Vum7Zu0CVXmAngBHGzqNV3pDVVab8hfu5yc9UU6v2PpPw/3mQ9/i8PAwgVlS6qZy4e6HaaZGu6QbS0bEi8TqtWA7UmDsc9LdjlG+RdXrDsvzAPnDBBN+3stieTD3A92gGyCkkQJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756913435; c=relaxed/simple;
	bh=y8Kgca+gE+v0za5q1pEbdNkPQOIrtejlnaAfgIlW9po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ipx41ThL/gXvfyZdonWu0kKx9XiVJDm33AH2tsjLAyfW/6Od3bO7xiGHpcUMzIAzLGty59qKdIXcr8qpfRMBd3A7Acb73tNDOriSs6GStlwj9qfcpsWJHWTEzR7TZMqIzcb680YhJGET56GPB/qeTCi4ICRtWeszUpMgDUXdXj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kzNaGhys; arc=fail smtp.client-ip=52.101.83.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9uRZwhNtWF+F3j0/lYcXUrUIPCAeAwAWK3IyWlCnFqvQWllzScpvfJ4i+VqvztyBGcmTkJ+Zkkdpsa3PsePvWhwbcnr2ADumRKII3h5hB/1T/qj+WFAZeERcGpwK9R5sDAGwDs24HM4/mwM7cXSCIxwqfngEcig90zOopRELSwH6hJ9tnsxMNkrEB6qmYkjfcn7I1lbrOUTFLaqDFnA83TTkmtp8tbohDD0gARqc5bLNxxJ3gNzyQN888nzv4GhBWY6QYYIbAyKQCs4yIWHbdZzba6IRzxGbS1r2/OHCMNo2ih8voGUyxOYBcRlglH+Bi7a1IJn+jdjoMvxu2p8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILlg6H0QFNXmeckwoyYoH3jWoCvXgLN4aTQjLz4Am8k=;
 b=FAv7Alft8IsHgV9qMczfrsp2CT2ki+m8/1DzjaPrkcCiN5QqgucY++N8h4/cBoy2ijqLvEsaBFZdfu0xJC1PmCuZZEVfFW1nQ0J+QsdPA3AkLSAlGb2AIssMGBB3Z9b7AlUeJkhJH4NBcxH2yqqRsQs750Wpj+Ah6fGxwzrdWW63XeKXmba+usicf4hhf1wfwnfb96Rsxy5ABHhbL84hLgNN0gW+Zh1Yzdb2O6Ygwq2F+pGqtya0uD80s1My2EhVN0D7mTzuhjm03b/oAoPHyRafNPl/EBJkdm3CpPOjCGe1zyxQvZMDEfs8mh1+cCtoFN636MYju774ivfx4lsCoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILlg6H0QFNXmeckwoyYoH3jWoCvXgLN4aTQjLz4Am8k=;
 b=kzNaGhyseyakq4/v0ewoLBxe3xbcJGbySW/KqH9YeVaAwNP6If4kMcoj0EpASIMfUGZJm3njvzLegxQO6Kpt8ml6MLLVRkpobuxpT10LLjEusIDmcUJsQRfVinqXMB8DbllXz+OqDQh3m+/PGIqhzseHmd+sv6cwyVvr9YAmcOPW0pZhD8wys6Xwq908zPOMGZygop/MhLG9yQ+p5uou/ATbx7IjYBScVcQ4hiNWZvEDxcwqpHSFICMgZpkhg+XDJ4bdAJhRA1Jm4fZNmCq0L2acoari4gY6loNvqWXsG2WiHIS4SfNF3xlISO56hAPURSWpBnQ6XkbgfUTzKZUYEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV1PR04MB10848.eurprd04.prod.outlook.com (2603:10a6:150:20f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 15:30:28 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 15:30:28 +0000
Date: Wed, 3 Sep 2025 11:30:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	hverkuil@kernel.org, nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	jonas@kwiboo.se, dan.scally+renesas@ideasonboard.com,
	m.szyprowski@samsung.com, mehdi.djait@linux.intel.com,
	niklas.soderlund+renesas@ragnatech.se
Subject: Re: [PATCH v2 1/3] media: v4l: Add helper to get number of active
 lanes via a pad
Message-ID: <aLhfCFJGU7R9Uh+P@lizhi-Precision-Tower-5810>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
 <20250903102243.1563527-2-isaac.scott@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903102243.1563527-2-isaac.scott@ideasonboard.com>
X-ClientProxiedBy: BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::6) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV1PR04MB10848:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b71bc9-436d-40d7-087f-08ddeafecf57
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|10070799003|19092799006|1800799024|7416014|52116014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?xEN+JmZEUaBSqEn9SP1aOAzAnfGpX6yIuueMS3XgDgoOO0JCHvP4YyC3i1/v?=
 =?us-ascii?Q?9q2tJywk8OAjD88jh2DS6qFgevEu+EBvlFdk/n3GyleRIRxil72YTyEaJhQK?=
 =?us-ascii?Q?Gg2E55tMQNtjEw9V246+kgY034KnIOL7BT1rfGc3Q5d4QCbs4mJv+lGz8/r4?=
 =?us-ascii?Q?M1z+D60KmZgaBcdkAIDZAkFiWOUfRUyhM6gdevw1NKOhyKkRXhww+OdRDx6R?=
 =?us-ascii?Q?1oOXoDkH2yTPqYoyWMEf1FKPdLHcQVs3sXfa1mA+9wOrqHtjFnC2Flq+W+7s?=
 =?us-ascii?Q?4KITR28DgAQCidl+JRHAX37dnUgCGRufRTMotgL+X4vECiRNHmOrnjiXHqfv?=
 =?us-ascii?Q?Hmi8vcSQt7knxFMglRsRZpO8ZolD0DovAvzArZcdSOweQfmwNVuw2Tf42Hwa?=
 =?us-ascii?Q?iKqZLaza1FeQFJKUrjHryqVA3Aa5fNcwfb/EYirj9SGSbqZLYUwl/X6psuRl?=
 =?us-ascii?Q?bpHfi4Or4EaOoONx/xkjsEScIoofX+bF2WNST6yut2wIpR6L5kAPk00u4qqa?=
 =?us-ascii?Q?FD7oePqy++tZ248UhijPhzWOHRVS5Ny88VkiTRs7KtYITmCFdmcCU2ZAVzV/?=
 =?us-ascii?Q?M6X0KEREGkFoKk3+uJ7zsc2GN+I0hf/xy2d4oWR4dAyOAq+cBvwsNpU+MULz?=
 =?us-ascii?Q?briuMaWG7Y2LQDIxq1oUhy8faekWuHn80D4GpLO5AG5rCL0Khtxv4I99XABL?=
 =?us-ascii?Q?SJvUDSv++ukuusGCkWgVLwrifX585FvL25qwLJe/ImhZZaPIcktvH4NihGYD?=
 =?us-ascii?Q?o2RdgLvlWReDKNLz4K/vkRcNbqrl6ImkAV4aDZgXjyvs2LWx7CP7KWdCstnb?=
 =?us-ascii?Q?P99+GeXVBCZnPoRNTQyawhL7qtN9nDJUhQhwcPGJVpd0bAa8v59DX3ooJm1H?=
 =?us-ascii?Q?LNcexCElUlfPmRX1sx2jGuGCyJLuEZInuoCqHuVjc1yF/pTXty8tjCVU8ms4?=
 =?us-ascii?Q?0FQkaMT2CQZm0Z6jHnt7hZULBogAbSip3jbsXvxImSzHrecyLc5CLkzs3aMw?=
 =?us-ascii?Q?OOlt/KFM2Y2WqVe0tn+ntiwx/BC6Bo0pF3giprRuL08NqMvGNi3n207HpnZB?=
 =?us-ascii?Q?B1BcMHBBt0eS9anCZ91wdrjHT+ZkgREYz+aXulB0yiEw0D9Hp0cG2pUOsRW5?=
 =?us-ascii?Q?xx91JT/RwJ3bzvlZDmONHWgC2Hw/CfY4Ufz0f8fdqgSdVlCf6NaAhWAHbUFw?=
 =?us-ascii?Q?kN7m93ZxKYIC4a8svhgwtSEKACXfmsMDTSfM6FsYTQ/Im1eb8U5akcNBFd9l?=
 =?us-ascii?Q?z2uARwLDONHAKvX1wPcSmtc3ghP5wRHa6ktnaJy8k5iG7ufI23va++FTU7LA?=
 =?us-ascii?Q?Eiinsu5tQNhz4s5PfFM1ikvoQ/aY6L9OPpbEqy9wdCdC6XikPUPxrL1B09Rg?=
 =?us-ascii?Q?JRcFNxRCvStJfWVN+PYEx6NPCoSh99LiK05XY6Bo1jGTm/lqDft8aoxYfV17?=
 =?us-ascii?Q?NnPuJeIqdCg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(19092799006)(1800799024)(7416014)(52116014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Ir8Arr6QprAJnBOx/l6Cg1dRIlEeuI2l+A70SrZ1ZYKV1SAdGCd3SdeAnST0?=
 =?us-ascii?Q?o/QWYdjW10hskQkKp5Lik13bnFjCo9F2OiBqzbdfXHomAp0pjuqz2cxHlT0M?=
 =?us-ascii?Q?dgTsNUI6nXTx4nLocmrY4/Sr9Lh6/tQKr9y9kbRJU91CvzwyMuilzMa3g0O2?=
 =?us-ascii?Q?M5/Oi14PVP26tr8Vz38l4Ax/ctc6MYkYhMgXqJtrnIvv03iGF0r0/wczKPq/?=
 =?us-ascii?Q?7y73xACigDixv2v6hIveG+aA9FdhNAMgge/jOeSlzxZoqtU2rw+fwLgAWrLc?=
 =?us-ascii?Q?nfy8cQ0qJ9XcrVJoB8yRxxA6JWOM+WR8W0Dsk1x4Klk4MskXzwFumPtCd4JZ?=
 =?us-ascii?Q?A1+3Tqy6WKVGHlQVJmKF4uc2H3OyV+w0RmUJZfJ33e+GhPJU0obbk+IVM9XT?=
 =?us-ascii?Q?KLtM/X3IJ9U1mueL028r+CgpDKYMIKKpUy9MkCzRWZfHnDiAw5p29r4Qdwju?=
 =?us-ascii?Q?Uzjgg5c1BU7GHvy/ZSwPlWrtrNOybpltSlkhrmQfoxP51i8ut2c5Rv9AHRz5?=
 =?us-ascii?Q?L9ePLhKDRF0bx81a5UiiGa10EXC/NwMHzgE4phYvg1RUGBuuAHIMi9IvQ7So?=
 =?us-ascii?Q?aloW16Jpkc6GhxWrLJipiNr1s7BswrsOymIZNIs7BkqL3XUvuaiJD0UQH3uu?=
 =?us-ascii?Q?khtqadzHr8BTIZX8H5Cf8zcAwUVSNW0U0XcCP2IhCILd4wJzrTXWvVlgIF/D?=
 =?us-ascii?Q?YfXVxAEogsz5tZ5nrKqB7DQEs4kR46TDRzM9nkK64codnbuu3+dQI57Kjbgc?=
 =?us-ascii?Q?xuBb76Ww/dPLPz7Ae8h6VhYeeTpprqoVVDFdpR5e7WA0TclNStxarQonHyoT?=
 =?us-ascii?Q?fepN/toHfUvwIlEcMwkZyyBfMxK2Pd8Fbvmua3E1oqsIT0xZGUSpHudyN196?=
 =?us-ascii?Q?p/OR4RcKG/1EJnW8NvXpTTflXaASiTeqU0ZjVNo2sXHcRVDrqbGCqgT94rDc?=
 =?us-ascii?Q?tDowOqXr7IgoamMLSvNY4N8VhZLgNl0OQUfGGbivrwLvwdubkImCT/DgP63M?=
 =?us-ascii?Q?HdwejupcgkCZbbUIUJj+ywsflziVjE7QfanTkOQKFjkgONxI+5NYgrDSWYPM?=
 =?us-ascii?Q?bD90O1GUbPemcI6NlISs4w28qRW5kYQLNVBgh6VV4kqJvn6HlJ+t075Qhh9q?=
 =?us-ascii?Q?auNBx2YOmVfgYOyBL0uAYxCFZfurpJjD7TO5qOtr4ls6BbEk+qPPK7ypkice?=
 =?us-ascii?Q?9BHVPWahKlSEK9AjcKmVK9wiQsQ/TLEeWF4mJ7dryXK5/TH92GZM7rMVYSV5?=
 =?us-ascii?Q?MnfGPwgrMlq1TV6I5+YD1xsDwrNFG+fweDkHfSGZ2bt4Np2mGx1LHd7ZJBxe?=
 =?us-ascii?Q?p/iYCprGSIxHA5PuWbpH/zz3vhiygCKG8hQYhoP55SfVCuqcniTy8T7T2luH?=
 =?us-ascii?Q?Ht9gXJeJzNL07/Z7QqpZgZTn15Gy1ZB0wH1rZZRr2afeQ3dSbG89PivYLKH+?=
 =?us-ascii?Q?FRLXZnZf/QY/iBtK31PRa26GDiM9r/VT7JPioIDILvTCZCXR+uC2PsbSeHj4?=
 =?us-ascii?Q?YmAcHg4uE0rcR2Z+Xawb/zVTAQMXs37tKMUbl44GkH+1txzPXBtr7eiJW2+K?=
 =?us-ascii?Q?5ci+LNXyIc5IcbafInBejnuT3Wx4EsRtO1FdwDuGj1pWGyoXnp74Oq3BXTK0?=
 =?us-ascii?Q?f8MnVSnJ4LCieIZHs4XzJwvgpFXQPrwod9yOqvKSqqOg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b71bc9-436d-40d7-087f-08ddeafecf57
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 15:30:28.0813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1axdYn4pXIms3I3eImKHU/NICFfGMZstFV89Um91QKrpyJKTpJdX3M+SrYzdB6Vu1sKuv2O54EcCc8hvo6W9GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10848

On Wed, Sep 03, 2025 at 11:22:40AM +0100, Isaac Scott wrote:
> Sometimes, users will not use all of the MIPI CSI 2 lanes available when
> connecting to the MIPI CSI receiver of their device. Add a helper
> function that checks the mbus_config for the device driver to allow
> users to define the number of active data lanes through the
> get_mbus_config op.
>
> If the driver does not implement this op, fall back to using the number
> of data lanes specified in device tree.
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 25 +++++++++++++++++++++++++
>  include/media/v4l2-common.h           |  1 +
>  2 files changed, 26 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 6e585bc76367..8683107b3704 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -571,6 +571,31 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> +
> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes)
> +{
> +	struct v4l2_mbus_config mbus_config = {};
> +	struct v4l2_subdev *sd;
> +	unsigned int lanes;
> +	int ret;
> +
> +	sd = media_entity_to_v4l2_subdev(pad->entity);
> +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> +			       &mbus_config);
> +	if (ret < 0 && ret != -ENOIOCTLCMD)
> +		return ret;
> +
> +	if (!mbus_config.bus.mipi_csi2.num_data_lanes)
> +		return dt_lanes;
> +
> +	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> +
> +	if (lanes < 0 || lanes > dt_lanes)
> +		return -EINVAL;
> +
> +	return lanes;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  /*
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 0a43f56578bc..3f8937260c76 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -584,6 +584,7 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  	(pad, mul, div)
>  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  			     unsigned int div);
> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes);
>  #else
>  #define v4l2_get_link_freq(handler, mul, div)		\
>  	__v4l2_get_link_freq_ctrl(handler, mul, div)
> --
> 2.43.0
>

