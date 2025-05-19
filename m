Return-Path: <linux-media+bounces-32847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A77ABC8C1
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 22:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758853B0EAA
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 20:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E29212FAD;
	Mon, 19 May 2025 20:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DWcUxCFC"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FE91A3142;
	Mon, 19 May 2025 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747688239; cv=fail; b=cbSqfbrO/NWkuTXgPhMa/q08Rnhlb225F0s0pXJiy7uJoP0GUVC82aZDVpuBYQRuZ+6pcqjWuBBG6WpI/oD3Rm/Ecw9XWFphgd28hzK8QiBY3PCRqu/RDMoBfklN2uauPwvXtST/fYzyz7I8+cVgnol4PTFwgPM/D+gbYAR7Vzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747688239; c=relaxed/simple;
	bh=mKtcDgcMAeCnSa9ot85l2rgT9bddeZVro7cb/GEZdqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ob+qr6N2nLFnsx9PfJPmAce9/zVhnX3/y/9f5yfEAMGqvQohlLEkm0lz3mHSSucddbZ/T0xiYohzzQYsiZDt2rt5x8Ce0vmxaiXcOlnAymnPf4pe8mGdefDIUT1cCDuZ8KuIMjVtpjsT1zGVufZq2P+V581kQzxMFpvG+wQ+Vo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DWcUxCFC; arc=fail smtp.client-ip=40.107.20.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCIIbrbRUb7l+KpDFHaK3DGD9QW7S1f1+MMEGa4P/Eji08nFmdcNbT6WLUu/C0EI6qmJoBxNm7I2s33v1QMWoaqAvstTle8FeYNaC2rpNUhx+SKuV6MkL/U4/KcKGUV27+pNkv2/18R7ps1G3fT/zXcF35MdvQhHJQL0Lwz92dzm4QnRm8tvo/7ExBAjqs6+1QUM1K0wpbpN4G7x8D4YjlzuhuCBacxH8h7/5f3T/NLd6URoYnxiJoyoiIJQRo0QKOnIBRQMhhxnioXJLajWlhXIemgBwEsuIAgu9vb8+gg2CKlwprU2/bqwZKPKvqvPfOKaDFOnhMjxJSTmEAcR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dem+ZPL1Xghl6l41clEHJxnFhYpkFXJH74f+O41oKLI=;
 b=RoALLP6FDC9b/8TEb11jaFqct4F9vMcsQWSMlJMstyK2g7Ln7udEaihRCx0XYmq72sWdJJzqdZlKlkqGE9i7gnNUDvzPLCtpPgYgnOFS9nC58UhCh29v7YsE7ISu3hXE2hFB543iTjECkY2Wcl6sJpAtfm8FfG/I8D+4av3kQC3TT4g9N0SOqh7J28SdtgfG+L8uEAtAHNe+fvQgrIqvOY6x0G91ry9fnKl6Lq2crN/vPLV86UGo+a1Gicsd22gPZtk49d7f1OqKPKcyra5jnfJGI5gHQPaXF5FX601pwcrL281UIX3+2vA7LjrPeWHHRoNUz6kVBHLKk7gl0nQVQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dem+ZPL1Xghl6l41clEHJxnFhYpkFXJH74f+O41oKLI=;
 b=DWcUxCFC41395gAHYpLvwuxCcujFJXqZBiBbaAE4iAWhocAN3vrVg90XvK0Zo5aylp+8kBiWint+hrGABIAIm3NXfTbgcfrNLNHoV+wW5qXDbcM6PVv8W5lZUIAaxuXtOlUlMmj/gXkJ261Soxofoohy854Tq+XRsvk9Wau9W4wzNvUkTgS9DRwN/slRydo85/BH5ojcuPDCbVzQRDnU9mpGytsqVtPOObpQoA6M8etsniP/5ldzWXMQWQYdz2Bt8VGZ+Nv2l+pJxf3RBMhs9EDFj0Gh0SRYIf5i0UeIJmOE/i9xnkV13FQHzPoE/2Z3AhClaYCXkVRPrAR7YNPQHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10084.eurprd04.prod.outlook.com (2603:10a6:150:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 20:57:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 20:57:11 +0000
Date: Mon, 19 May 2025 16:57:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] media: imx-jpeg: Account for data_offset when getting
 image address
Message-ID: <aCubHqUy3v+slA1b@lizhi-Precision-Tower-5810>
References: <20250506080816.1792-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506080816.1792-1-ming.qian@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10084:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e21cda-197e-4512-bee9-08dd9717b9da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1JuF/6ZH7N2ZM4flI9OAow034hBbdctMbdXddXU9xkNQFcSVeXKT59Dyzy4r?=
 =?us-ascii?Q?g9ne8klmbxKhzZHsLE0hNqCdGynhimOcfBPsC5CxUUZ14SNSwc8NwGfgDaOv?=
 =?us-ascii?Q?5UHZBKpcLFRR6zhu6tnSqYp2oI+nh0/MGjtPcgS2Tq2ZrAxIdG6JqVtL10j4?=
 =?us-ascii?Q?CQE9aIbqm8d9YlxYjAeQ4l67QJwFF/2ztvYK9ADqAzS67M/4N1OIzrRkAps2?=
 =?us-ascii?Q?eTQEXgP+phEFnBsTvckzbEb8T+1butweB79Kd3cVa/g2kXwvmU/m4p1iEkUF?=
 =?us-ascii?Q?74dGMxOXKa1YeZgjzcDqoUXW1Um4vPH29IySw3PIEoCIzU/fr6ZjoIqor2yW?=
 =?us-ascii?Q?L1yvfMks+mhV7BLWpUCespBSzg72OAHGoe/Auyp5VqJlFGQl5kZzsXzL0hWd?=
 =?us-ascii?Q?ZZaE4roD38tWt11NGNKVpwRzfFHOipHe49n9E4awn2OkUFQNWp3sP77PDBNf?=
 =?us-ascii?Q?AXHsIxRSDDoj9ZCdJk2SnPQ+VZ/s9bHAQjyp5Rd8GtsgWP5CIrjj22gH17ZI?=
 =?us-ascii?Q?/fwxcoqzOEgG6Oo8tGFibKSAyu6R2SPGRlOLTPcSEo05jJXzSsOovuCpcnEo?=
 =?us-ascii?Q?+WBN4CJMI9/5oPupxB5nHnT7rjT540QtNOiEa3tnLcorGtlT2nOEZn7It1uq?=
 =?us-ascii?Q?kAxXRX3ekLVmm+ozwGnd/qkf7tu35qRwxPGmby9JzW4NiAZxoFsjPTLGE6cL?=
 =?us-ascii?Q?vTm66n+jgpb4GIVf2A60OG1A89p9GcWNJE0SXrpWRmxnQ85AIqQM2MEWz3hB?=
 =?us-ascii?Q?tiJ0LcIk5njdQI+MXWnAD5n4ECmHOZUQYnARWm+z5DL1QvRRWAZtljWn53PH?=
 =?us-ascii?Q?vHTZulDyAHcRkx1ev0hQnHYZuG3v1Ia4umEuTaNv3UlnfOBkzBG+nITlpvif?=
 =?us-ascii?Q?ECBcaPn6YR0g5RjHq+KVECFjfbydII2helGIjWS6m0MN3VXtBDJ70Swgs/ng?=
 =?us-ascii?Q?FSM9CeKhWt1J7w7WeuorKxFID8BRkqIQ52XFBrgxaPuGStEQ3oubw9+tPKBs?=
 =?us-ascii?Q?a6i7+8rvB4KEbYBrCWYLfTBGNN9wsH7SxMEQqOOGTcjEaI0VYc0wTHcCIIVr?=
 =?us-ascii?Q?Tse5WdwtK0pzB8JrHxUn1ngjIovUZHG2zJuxCKELjoxpe8qts5Z6+iwsnSbk?=
 =?us-ascii?Q?kQBNBCj/FzCGCUXhKUEYI9PuNFi3gufLbDUuD5xyS1Y9E6d4Ag75jeU+3wKT?=
 =?us-ascii?Q?jpzrFsP4eIVFoKRQR+5X3j7fko6eLndkNyLtdRAP4qD3ZVLPZx4zyUnnnSu7?=
 =?us-ascii?Q?EulCZLMajSSJlpmcGqhVHBWbwWx+dpuKYXM/C7EMR+ZTQeokE1ZxEYE7/0X1?=
 =?us-ascii?Q?HFizfdgF0bMbSz9BQEUAhtvpyLcABXIzwBwVV1rjKo9LKUUCDhuOq3w8Joyd?=
 =?us-ascii?Q?or8VWFZx8ZhIKFH/JwqpbGlGfZkkPyRAAOslEul8NHWfDdHuOdZPzOtQFkfc?=
 =?us-ascii?Q?Hk20xH6/f1GYD7BGRhJUDAX544YSIsTKC4U3kOIdEu6RNM0No8m/Nw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rzn7yfndhWJ+evDQUugij8IhflmrNXBexpsH9B68WzetU9OJE8UpKd4wbcQE?=
 =?us-ascii?Q?uoHaRQn1wMjDNe/dHnhNMqDfo3jG4HRxeKTxPbEu4BA29z/1TUMe+2BaoSyy?=
 =?us-ascii?Q?pOgzz4NnJcLAUsf9N/pJROKgZd3FJ31bfsJFMBml1oOUcfDjGp7dVHzim7se?=
 =?us-ascii?Q?JrGW/k7SkhwJTTTmHX6Ptucwch+Ek9J/7fjAtA3uEiNS8SIdgJU/O16zAwYR?=
 =?us-ascii?Q?JCNvBZS1RJ7ACHEuZNp3ITmnivfB4f2fCQbP85y/GLrfsyvEF7f00BOi37lz?=
 =?us-ascii?Q?2MlJXU5OPKRJwckk8M2Py7ClEauoYP9DzdF5UKalyIwLd7dtWTIi/nSz6ijQ?=
 =?us-ascii?Q?QcRcT5cS/bNogvtFl788WRRvdRRORPS32DzytJqLAErAaePkLDGRIghcG6B1?=
 =?us-ascii?Q?aXqMHa7TVYeMJ0lWRT7V8g6dAOGxPfOJOXYeYGnFT0zLuo7WqSilc2jr3O4A?=
 =?us-ascii?Q?/e2RWryVCx/SI/PLXVCsJlRkj9qCFMIkIrn5ZOYj6SdAdf2fXrCVDxXb9vb0?=
 =?us-ascii?Q?nN6KLdyD+SSo6x2o0k4HW9yobzt0ibavtHoMWOaQpD2uUE1FJAi71xvQwhfw?=
 =?us-ascii?Q?YfhJURiOX8Gy52KpqJNHkxhm02hDK8WR5B8tj+lheQELGtrkHJReX/Ar9+VJ?=
 =?us-ascii?Q?D/aX1I7VNKeyGKmrr15RL4EkqjXD9l4PrT5I3YGr3/Th10C3Qrp67+E5Mw9X?=
 =?us-ascii?Q?uP9NfeF4/Disz8FtN7PAOv7QCIxQBm0xke1k+JJwVjCzI4OSvcXfrp1t7dZs?=
 =?us-ascii?Q?vERq3pI2PE0zFOZbkBNty1iz8W+pshoa1y3HJF59ehMZ31fNpWspGC/Vdi6L?=
 =?us-ascii?Q?nAFpLFA9yNX8XSLcbIZObYJ0kmjfcXILtrk23uENVNx4Lb2iU6QUijKTdpUr?=
 =?us-ascii?Q?1uMKDDfs4v5p6U97OO7+zFUOb12CfHYKAhgHLUaUaIa7AB1JPgkG1sAWLzGh?=
 =?us-ascii?Q?RHDucm8RPoz7i9plkac6Jfp1cK5g4HuEC6m08gLH0ldnEyvlnnDrht1lGlZC?=
 =?us-ascii?Q?6IGBil6cJFBPs4Uw+N31xfTk9Qer6NcMCqW4WPKRX7+hB0L/ZXvrF+8D3crG?=
 =?us-ascii?Q?6tsGGjZj13pQu9HGeWqrlGQTv38KSHG20nzCnUdYFNui1MVsYndYXlthSqDB?=
 =?us-ascii?Q?sPev9ymBSyAxZX/jJ2oKmHZmNOlOUMzgcKvm/p1xt1vMcCG75C6vk+AcNEwE?=
 =?us-ascii?Q?6r0MhHFtPPVWcFod68zu6QlGuCgJElPjOWRtWaA0dWbxaFSbItTR4MSXIDtU?=
 =?us-ascii?Q?Osi3+wo3H+Wnxx7J+gi4RMbGdr9IYgDBXY0gz5VF6v0dOwYGAVInOF9xfhUc?=
 =?us-ascii?Q?YibLqCWkIjVeD9BSJvLYMlYc1SmA7gCnCBUY+C5Z34/20DVTXL0TSaLJHNoD?=
 =?us-ascii?Q?3Ce+FKFJhxETRzZSHuQgDP1WtAGC5OvTrqtsUC/wVOkp7DWTMIwl+jjfnZKg?=
 =?us-ascii?Q?cFGA4W6/AN8HDoRUjXboYLUttg4+oyOuyZkiiiELqJO+ytGBuGXSOcUpo6xm?=
 =?us-ascii?Q?VO2YjOHSgkNdqjZqn2uZF17cQj4Ye32z+LpjGMtG26f1e+8zzrSio3V0C/0c?=
 =?us-ascii?Q?RFEC7wkapO9EsBxkTLw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e21cda-197e-4512-bee9-08dd9717b9da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 20:57:11.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6YF9QsqX9hs1wZAX8Zym4NffaKco14gHEyoAc8NHHIZddR+kwdmrXJ5Mrg8FhhdHo46fK3ppDUFQhkjB2mAdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10084

On Tue, May 06, 2025 at 04:08:15PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Applications may set data_offset when it refers to an output queue. So
> driver need to account for it when getting the start address of input
> image in the plane.
>
> Meanwhile the mxc-jpeg codec requires the address (plane address +
> data_offset) to be 16-aligned.

look like it is bug fix, missed consider data_offset.

So need fix tag.

Frank

>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v2
> - Verify the address alignment in buf_prepare()
>
> ---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 47 ++++++++++++++-----
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  1 +
>  2 files changed, 37 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 5c17bc58181e..8681dd193033 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -598,6 +598,27 @@ static void _bswap16(u16 *a)
>  	*a = ((*a & 0x00FF) << 8) | ((*a & 0xFF00) >> 8);
>  }
>
> +static dma_addr_t mxc_jpeg_get_plane_dma_addr(struct vb2_buffer *buf, unsigned int plane_no)
> +{
> +	if (plane_no >= buf->num_planes)
> +		return 0;
> +	return vb2_dma_contig_plane_dma_addr(buf, plane_no) + buf->planes[plane_no].data_offset;
> +}
> +
> +static void *mxc_jpeg_get_plane_vaddr(struct vb2_buffer *buf, unsigned int plane_no)
> +{
> +	if (plane_no >= buf->num_planes)
> +		return NULL;
> +	return vb2_plane_vaddr(buf, plane_no) + buf->planes[plane_no].data_offset;
> +}
> +
> +static unsigned long mxc_jpeg_get_plane_payload(struct vb2_buffer *buf, unsigned int plane_no)
> +{
> +	if (plane_no >= buf->num_planes)
> +		return 0;
> +	return vb2_get_plane_payload(buf, plane_no) - buf->planes[plane_no].data_offset;
> +}
> +
>  static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
>  			  unsigned long len)
>  {
> @@ -610,11 +631,11 @@ static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
>  		return;
>
>  	for (plane_no = 0; plane_no < buf->num_planes; plane_no++) {
> -		payload = vb2_get_plane_payload(buf, plane_no);
> +		payload = mxc_jpeg_get_plane_payload(buf, plane_no);
>  		if (len == 0)
>  			len = payload;
> -		dma_addr = vb2_dma_contig_plane_dma_addr(buf, plane_no);
> -		vaddr = vb2_plane_vaddr(buf, plane_no);
> +		dma_addr = mxc_jpeg_get_plane_dma_addr(buf, plane_no);
> +		vaddr = mxc_jpeg_get_plane_vaddr(buf, plane_no);
>  		v4l2_dbg(3, debug, &jpeg->v4l2_dev,
>  			 "plane %d (vaddr=%p dma_addr=%x payload=%ld):",
>  			  plane_no, vaddr, dma_addr, payload);
> @@ -712,16 +733,15 @@ static void mxc_jpeg_addrs(struct mxc_jpeg_desc *desc,
>  	struct mxc_jpeg_q_data *q_data;
>
>  	q_data = mxc_jpeg_get_q_data(ctx, raw_buf->type);
> -	desc->buf_base0 = vb2_dma_contig_plane_dma_addr(raw_buf, 0);
> +	desc->buf_base0 = mxc_jpeg_get_plane_dma_addr(raw_buf, 0);
>  	desc->buf_base1 = 0;
>  	if (img_fmt == STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV420)) {
>  		if (raw_buf->num_planes == 2)
> -			desc->buf_base1 = vb2_dma_contig_plane_dma_addr(raw_buf, 1);
> +			desc->buf_base1 = mxc_jpeg_get_plane_dma_addr(raw_buf, 1);
>  		else
>  			desc->buf_base1 = desc->buf_base0 + q_data->sizeimage[0];
>  	}
> -	desc->stm_bufbase = vb2_dma_contig_plane_dma_addr(jpeg_buf, 0) +
> -		offset;
> +	desc->stm_bufbase = mxc_jpeg_get_plane_dma_addr(jpeg_buf, 0) + offset;
>  }
>
>  static bool mxc_jpeg_is_extended_sequential(const struct mxc_jpeg_fmt *fmt)
> @@ -1029,8 +1049,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>  			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, payload);
>  		}
>  		dev_dbg(dev, "Decoding finished, payload size: %ld + %ld\n",
> -			vb2_get_plane_payload(&dst_buf->vb2_buf, 0),
> -			vb2_get_plane_payload(&dst_buf->vb2_buf, 1));
> +			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 0),
> +			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 1));
>  	}
>
>  	/* short preview of the results */
> @@ -1889,8 +1909,8 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx, struct vb2_buffer *vb)
>  	struct mxc_jpeg_sof *psof = NULL;
>  	struct mxc_jpeg_sos *psos = NULL;
>  	struct mxc_jpeg_src_buf *jpeg_src_buf = vb2_to_mxc_buf(vb);
> -	u8 *src_addr = (u8 *)vb2_plane_vaddr(vb, 0);
> -	u32 size = vb2_get_plane_payload(vb, 0);
> +	u8 *src_addr = (u8 *)mxc_jpeg_get_plane_vaddr(vb, 0);
> +	u32 size = mxc_jpeg_get_plane_payload(vb, 0);
>  	int ret;
>
>  	memset(&header, 0, sizeof(header));
> @@ -2027,6 +2047,11 @@ static int mxc_jpeg_buf_prepare(struct vb2_buffer *vb)
>  				i, vb2_plane_size(vb, i), sizeimage);
>  			return -EINVAL;
>  		}
> +		if (!IS_ALIGNED(mxc_jpeg_get_plane_dma_addr(vb, i), MXC_JPEG_ADDR_ALIGNMENT)) {
> +			dev_err(dev, "planes[%d] address is not %d aligned\n",
> +				i, MXC_JPEG_ADDR_ALIGNMENT);
> +			return -EINVAL;
> +		}
>  	}
>  	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
>  		vb2_set_plane_payload(vb, 0, 0);
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> index fdde45f7e163..44e46face6d1 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> @@ -30,6 +30,7 @@
>  #define MXC_JPEG_MAX_PLANES		2
>  #define MXC_JPEG_PATTERN_WIDTH		128
>  #define MXC_JPEG_PATTERN_HEIGHT		64
> +#define MXC_JPEG_ADDR_ALIGNMENT		16
>
>  enum mxc_jpeg_enc_state {
>  	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
>
> base-commit: 2e79181dfc85e1347a8655ea8d8a314158155c52
> prerequisite-patch-id: 0000000000000000000000000000000000000000
> --
> 2.43.0-rc1
>

