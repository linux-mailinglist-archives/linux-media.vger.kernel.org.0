Return-Path: <linux-media+bounces-28857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE843A734C5
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 15:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 178911715B8
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 14:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3B9218592;
	Thu, 27 Mar 2025 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NFqJ7BY5"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C0042AA1;
	Thu, 27 Mar 2025 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086486; cv=fail; b=JKLZLB5HZVZsMt6Js/r8yWQ0zrpteb2gh7dvmSr7lPKeiavXiGPQrTE326Z3pNmqnG9aH6JBhEHTevmgATYY4oPffeyCU/qgtyCXeo5LTl88/TfE0YdH1Miu82W3jO14IqWAB8BSsp4dcwxfZDPDPgYq2W7PtROHBuC/O16wAX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086486; c=relaxed/simple;
	bh=0T8ypF6q96lTTB6u+cHXJhKwO8H7uuLgC9PEF0FxuzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XnQG63dcq8yNPZSTN/NDMbM0L8Sqqkt0vlMW+uCqB12XZZsI+30rR8MUsQo6b14MhSnrY1r6qEcxRetOpV20sO3uz8pDHs2npAYmDlTO5k7SFhCQRFb6QHxkrcsus6/AYpOi84FMd+z4yKRgvlktfvfIpxB6GcHy2pn8YPHxClQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NFqJ7BY5; arc=fail smtp.client-ip=40.107.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCXRGGNY+5gR7DS1BRlfN6KHnf+SBcdrw6IB3DIJnRsFg6VyPdePcille4g4CoH1iPCNEDnrlx5RFzvCfqiJiGu3Ch1I2lkloovkZHSqp4mx8EL/9zrkTZ0QHo//tSI5ceYbMXpFGrU7k1nFc/JLKvKQkgH08UY1NTO9h6QpG4oN4rTFg0woOZ75gbpGGkCiw01F75bQeK0PgYHVN4eN8qcSRimkWiZiko2tkLro4djl86nMZK5jOHQAmv8HmXaEeF6mWogTkF0qXec7x1B8S18dzSsw8NXqRnmW7xQ94bZqEgaWoAqN1l8udsn/eY7Kggxh3pp4plOaVuTMdJ/QTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6L/PY5gVIHGPEM+IH0lJ+I2LfxHAuMR/OyemLf0CnV0=;
 b=qg4nu7glDbgp8qeeMx9Zj9cVKE37VkaEttY5ppEe4h56Vp607rCwdcDRSD5QMg8ULE9sn/RlDJBx+ygOkvP4XSwYNRa/s4bgfuQJYmUFIdBlaZTdv3jUwz6vrzqvID+Ziu05FvtRaXbKyzO6qYyCfggu5Nap565RiGWycwkKvVUmenmmSyg58PGqyXYSUnYINvZTXTWkQIrC7Hwg9bffKzME/vDhY7GnM44pK6Nqkq6KHXyUwd5gCIz1xx1M9WAjEKm2KotaHRb6IlZnvM9qiqsJjungZsv9ULFY67xJmy22+fDe5ihoH2K+QjETVo1T+Vzagwb7CT/WGiRXGF9D8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L/PY5gVIHGPEM+IH0lJ+I2LfxHAuMR/OyemLf0CnV0=;
 b=NFqJ7BY5igW20KN+JTxQfT2uPPXTytMYnV5T1tsj7PScVJBKMt6CvjqVQSsJYjRG0r/pZ3yrxj22m1tdHa/ESNJ7xzqLtExXkkBH5rvmy8bQe0tA2n2Oy+0DnV0acGFVdgusZAWNGu3a4wKRs9DYr+ZwZDhhMXEJhttpgxaFmUU4x6yeZ/Lwmkso5+U5oSZgDsGww9lkaIggI+DOSLCWklZXVqmtoIPHOxO8lyQSe46dD3AgizLUirEw0woh1bekgf4Pq3X3uTtxjmfEzmiAWH+tI11jOINH4BEzZpVbO2jHRRA3RZTJiCQd/reaanJPXzTSS//x7q4UDjVXuI3qbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10635.eurprd04.prod.outlook.com (2603:10a6:150:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:41:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 14:41:19 +0000
Date: Thu, 27 Mar 2025 10:41:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
Message-ID: <Z+Vjh8Iywt1o9+IS@lizhi-Precision-Tower-5810>
References: <20250327023710.549-1-ming.qian@oss.nxp.com>
 <20250327023710.549-4-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327023710.549-4-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH0PR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:510:4::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10635:EE_
X-MS-Office365-Filtering-Correlation-Id: dbae49ff-0267-4a96-3ef6-08dd6d3d6fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jmdCreN0ILSNEyfKadpG0ZxRbiZk0jw48IDdx05ogjDLb2daGXKMIJns7hwa?=
 =?us-ascii?Q?Vonx6ZouxtEY0+/rHs3AudXSJklr/noZJFPjOtcieMjJGXHc4QOI8xWicmMz?=
 =?us-ascii?Q?JzSLUJgVXWIc3pqwmbDiki5gZBbe2pmE3mOQnuuopN3AkDb/qZQsIhI1n6LQ?=
 =?us-ascii?Q?T///SvI1Px5KFS+l71hfS3tAWnZb9PnOz8k3kdneSfbgSdwgFgC+VnECHj3u?=
 =?us-ascii?Q?9LF/HZ4uJta/aXRFa0dlshNWPbsTm1R8KiND0MWjULqvC6odSlamIiobeh9P?=
 =?us-ascii?Q?o/z0VcOC0jUDmNFe465dIPJoawrvNJIuZcOGpIp21sPJRIG0gQd4kop1SWw9?=
 =?us-ascii?Q?dM0P37UWtnqiWv0BU4K0JZ/B5WNuyFy1z8mM3lZNY96skJ5dZFxGC7sUb4em?=
 =?us-ascii?Q?oCUUWwK4/eClRDDByobMQNrG4vFsE6Uw26pK9uMf682cBZA1Qi6KOj7k0K8X?=
 =?us-ascii?Q?p73eVkJRALl/Y1wQC5v+8axUArnTgdU15P8C2grjm92/w5TX/dg6Bg0lCrTF?=
 =?us-ascii?Q?ogePCMSCIhnizeknxjsC2lC2bs0ajLPqV2FnjVT/yFHHbgukLQTqA1stbb7v?=
 =?us-ascii?Q?h5A7X7L2kvGumfjxyYJ3BwVE8MB29Hi8Lgcer812Q45ELRSaIpoz2Dwn3jc2?=
 =?us-ascii?Q?9Fxt5O/xHubI1QbYqRnpth6EkmMbXnZHrKZoJ2247zzcN8FP+xUkNiGwaehn?=
 =?us-ascii?Q?/VQ+e98nB1o6MqL+51LH4wS4EO8KYoopST2FikuzRnIPd71rHUmvkcbxleRt?=
 =?us-ascii?Q?yvJX14D8CP2PbBiy5pTbKHYcm7g/20Dgc6zGsbIYXp1ldgF0ds76A/wNmu6O?=
 =?us-ascii?Q?E2hRR/9xITqIWwfZJFT6xo8Hq1syVLcZ7JPp5J8yaoA6WNQ4IAIGx1o5AQaJ?=
 =?us-ascii?Q?pj0QGsgjLwtYthdOe2MAdu8w+Nz9d89Opa7ukdf6CsGsv9nDNikzSQ+JDRt6?=
 =?us-ascii?Q?Gr1Cpyzna5/KDB61IGDnEiA/QID5wotwNWKjYIAuOxUdrJ3CqJqvsfM3L9g0?=
 =?us-ascii?Q?xLSSUqI8BVXhCaH5s+ffw/Ei4+bBQVYH7emWMTJ+LPVtQ50WI81xPS2UfkLh?=
 =?us-ascii?Q?1XM5W6cj9YMF9wT01H6YNdk5C1KLeGTVj+r2d/EOjsyYLv7DIXUWcjNK9IZW?=
 =?us-ascii?Q?QJNO9OG2Dso+y0Kd1Iuonpi/0H7TjJs7WFBemo4A4HLzOBHNgfXWic+RK2AG?=
 =?us-ascii?Q?IuuN1Fa4ifa0FQShm9lpnFpcIvh7JhaclwZn4etfGthsgWakpr4AUGekxzY8?=
 =?us-ascii?Q?wEZGkZFy6jJvwPeQPM31bGV2V74yWDl8Mk37DBzTsdAB7IKCRjS9gu8KDPjZ?=
 =?us-ascii?Q?+eoR3cXq/Q4oc6KUdzpd4G3Wb2GXumTF0O6eES7FhMA6KsGdpGNFyayQEBiN?=
 =?us-ascii?Q?BRvEk7hono/VvEbPnje8K/HxJvA+FIYMUrmoZbPpugQkjj7l3/8dwytIEg2+?=
 =?us-ascii?Q?6k3MXLdOqo3kZTQcpJml0q99OCDlzhJt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bn6dSv2Rd+ttPUWnIFUGfsrnERjb62oVPO4OKCKoHrMNqEADPDOxTnYeohTt?=
 =?us-ascii?Q?J+h4WXdhNeoMdTwuYaP+kBPSdrmgAdmiCE0OAN/zpnRO6uMcFHIt90kBBg6R?=
 =?us-ascii?Q?4yhheP+mU7eWYOOgArDw8c9WHe6kef4Q8UqGhoe6gvRTD8y/O70l1/LysHJe?=
 =?us-ascii?Q?6LatK7VfFnIu8kOSFDmrqzBWbl+faMbGMz+TGoWK6wP7Qz5gM/6IxL+mNZDP?=
 =?us-ascii?Q?Lpv3Xz06gV/znl+R7UntAwbgGwtbC6kR55pA+oakKThHcvsd1n/d/VYxrTrR?=
 =?us-ascii?Q?h6mV1dW83NcFacE4zqNTqCGGdLmgdA9gGl6lGlRN6yNguPivrqPVZT+uBh6X?=
 =?us-ascii?Q?WXpxnHK3+6Dx0xWxZVvYAlA4YpGNaq7kVMQpECci3+CtqytYO1KyZ/AcP3N1?=
 =?us-ascii?Q?iKUIBppVev/GWW6eBpV0CrHOOO0mg5jLFkgZUblARKptMi/bF0TG1HYkIvkf?=
 =?us-ascii?Q?gDIcQaaU2hDQlmm4rFEVnPLXTQ/9KuX3enmTx+uxPUrtyH9b+wY0hiz6KjQX?=
 =?us-ascii?Q?l2J5rzuu7OHudlGgAVqRKC+uVifikj+GNFKBq5x+SiRma7+1KMxHpsPrVqbV?=
 =?us-ascii?Q?WCkBosHhl3SQVyOKMYqzjJ3PVZmZx3SP/odflNDsAqAD4FLnIrXEZwqJEJkS?=
 =?us-ascii?Q?rXuiYhV3/B6eJ1w2DAcSSa8/qLIxXa2P/UJpYFSx7gZkh/FI9kC/AQGb5YMO?=
 =?us-ascii?Q?Pe3x0uuHk2zc2+JBaJhi3sgEUIvdbZjLzH+k+65z7m+WZSPPbcD5ngSrTJcr?=
 =?us-ascii?Q?9pFHNdVg/dd5M6FPyJAWWNrT/6e7gXIv9YWJgvdIYnJz6ddl54UU3HFVsxU+?=
 =?us-ascii?Q?stt1h658WAu2wt97FlJ1wkEDjtB+POpfqeWqDJb7xB8NS91HGjSEcswByyem?=
 =?us-ascii?Q?aAGwWbudpVhs4F8C8Uv8dmHIsVahacqwXRd+1OTwcbqNkhaQPWbz+m7hL7Rq?=
 =?us-ascii?Q?DcVzndTwnLVyYLvqX4vvdbgOGYp2kY3IaPxivPSmat6rc0b1cPIzgFXWNjWe?=
 =?us-ascii?Q?tK9B/kF0t06n+To3n9HkLg38S5oMiriR4a4gZHoi7dWWNkY8XqHxVCM3tGEI?=
 =?us-ascii?Q?NZZ+TiRk1pMhOutILBbIUa8ob/+LroPZbmuOVVSAvT+4ZA22VDiDkwtKeouJ?=
 =?us-ascii?Q?VX3Vjiw0oQLaGClzR69HbgRPcN6wl1wzECEnzMTwe7PQAfV/3Dzcdsu8SNFD?=
 =?us-ascii?Q?Oim/Uc3HU39wlniFKToKSqp1L6WQnrh19INgZRnSd3RJglD7pGS5ONQtbUUq?=
 =?us-ascii?Q?kxRRbOwSEd8ZuCI2Jw42eeHBAer4eqo8dMjIU7XEyGulZ5r4PHGyfmiuxpOf?=
 =?us-ascii?Q?hNOai59dBeMZCKi1IhyM7AFxwlJF1ftwSCGSB5vr/UVzlcO4Cjy/fJJl6ewW?=
 =?us-ascii?Q?xHW3T5w84YJ6sGuPmL21avbS21GyrJakycH97sWB2UTz5h64pJ59Kg0sKvKP?=
 =?us-ascii?Q?zU1D+leO4WvHnM3o/ylZONn8FLLyb/X9V84wRs48bkNCTiwSvDouGVQe6Vhd?=
 =?us-ascii?Q?qt69x20qrxLi4E6jYSx248tDaB0xFjRQUEJyzOIrzgTxG4EgZGCfAO+hPaEl?=
 =?us-ascii?Q?hTrtZvIXi2pXpf8tpDLG7w14l6nTINpPxh5DP829?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbae49ff-0267-4a96-3ef6-08dd6d3d6fd6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:41:19.4760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FhHxOBizrIIabzhMfQ+8lDqcivItvNtMlsQAPO7rbFaML9bX0ojRq3I8IuXBJ6LEflQX32aMEYJ6FrLp2RvEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10635

On Thu, Mar 27, 2025 at 10:37:07AM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> To support decoding motion-jpeg without DHT, driver will try to decode a
> pattern jpeg before actual jpeg frame by use of linked descriptors
> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
> used for decoding the motion-jpeg.
>
> In other words, 2 frame done interrupts will be triggered, driver will
> ignore the first interrupt, and wait for the second interrupt.
> If the resolution is small, and the 2 interrupts may be too close,
> when driver is handling the first interrupt, two frames are done, then
> driver will fail to wait for the second interrupt.
>
> In such case, driver can check whether the decoding is still ongoing,
> if not, just done the current decoding.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> index d579c804b047..adb93e977be9 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> @@ -89,6 +89,7 @@
>  /* SLOT_STATUS fields for slots 0..3 */
>  #define SLOT_STATUS_FRMDONE			(0x1 << 3)
>  #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
> +#define SLOT_STATUS_ONGOING			(0x1 << 31)
>
>  /* SLOT_IRQ_EN fields TBD */
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 45705c606769..e6bb45633a19 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
>  	return size;
>  }
>
> +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	u32 curr_desc;
> +	u32 slot_status;
> +
> +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
> +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
> +
> +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
> +		return true;
> +	if (slot_status & SLOT_STATUS_ONGOING)
> +		return true;
> +
> +	return false;
> +}
> +
>  static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>  {
>  	struct mxc_jpeg_dev *jpeg = priv;
> @@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>  		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
>  		goto job_unlock;
>  	}
> -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
> +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
> +	    mxc_dec_is_ongoing(ctx)) {

what happen if hardware completed just after you call mxc_dec_is_ongoing(),
any thing will be missed?

Frank

>  		jpeg_src_buf->dht_needed = false;
>  		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
>  		goto job_unlock;
> --
> 2.43.0-rc1
>

