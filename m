Return-Path: <linux-media+bounces-33046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26431ABFB18
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 18:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2E727A7AA3
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 16:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F7B22ACFA;
	Wed, 21 May 2025 16:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dr9GllGd"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE824188A3A;
	Wed, 21 May 2025 16:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844566; cv=fail; b=W6RHtJeZCdYVgb6ouJNWtXrp8JFGDmQ8qUHExp7mSbJvHS2dCdpt9AV3IGt/65s1VdNncS+xHPMLwbxg7ACZvNSGbXX/cP9od9I+vwUGBRe1ZJulDJCiruylDKuMJSwH7+yxfdexjHh2um5lnrMIdEUTH56y5ngbmRqp9n7P8xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844566; c=relaxed/simple;
	bh=xNFgbiQRLtM6cTpBkRwjlgHCkC6iYJHlUCGLJC5JXZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GMxlCL5/MUIE0bG6C4ku4mwpXGY3eZ+SkySmj5poBAgoSKbXoO4DzDnGduYv6zO75ay4KBf5SfZhv5YjU+GsYIRO4JWFw+1PDxdAjFrO8Gkvam2O2bHQLhEoeYZrQHOkQIUwmwgpjdYf9AKqaPvh10XNqbiwyeHoqs8/ElfykT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dr9GllGd; arc=fail smtp.client-ip=40.107.21.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQRuv9JwLYWDWb9ha60f29W59z4iM2YVkdD5ov9SMtsXIKeGJLs38qFMNePb6nRQ+m3tPN1ziSxQjS4b8HUpP3Q3cBCmrt18z3D69M3zaB0pKHpfJpQDqk4y2pqmdArae2mio4KcoW9AIIM5mJmVxlml1HfXJGvzrVIlQ7VAnWlkzurts7uZaHnugXisarpGJEeUu8hLhreuRtt7X8KHJakIALgWik6zdSxtsp9rtrCgCD5/UC2bTeI5TBekJQdXsAvf9rU4T3jFyybOLRU/zO+BA92Q6sfj9iYHdI/swbGqgzXLpcsXHRtoFKdVq4u9bPR1tPvsSylV7ozGUsCBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eexwIo5Ljl+qS+043jjKOOE7CZkxKLRRK6osnF2r1qI=;
 b=hkXR1AijYqJ16H0Su7TCOdL7L0E+CsZZy9QKtnlekis5FEZyAiUuu7wmoH5se6sUBhqGjSFQdVYmXoPHHjHeyyOQpPGvafzQevOGimQkPVmthMlvni/YUsPtvw/mGTDC1drJrvTS8yD10/uNHZHlF/IvPVhq6MC+lf9pCNr+w7lNZXOYiwYALUtsSt3VW9S3IwhQR5ti90h+gB+5xZkVh7B29ncoAbGkOkWVYWF1YtwvPVqVTY2SeairYRHG5XW82Tq5U76dA+jITNJ9HAzpocZBb0VY5ioiuWBOjzvqsSQ20OuokmWAl/6hEhul9SL6J8ARXVwctT54dcvp/F2zTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eexwIo5Ljl+qS+043jjKOOE7CZkxKLRRK6osnF2r1qI=;
 b=dr9GllGdPoB0RWieRH9yLNWEJnZoseyOJWl/rvqoo2bWhO6NJHEfbHPXou289hZNl9RgwmHIx+VjkpnJPO9XjWM7Id9/EoJcXFFOdENg0UMZUXl663veAUe+Lu5Eh2pLxd4EiwSuzwoVjm2ARLfNh19YOMX6L3/K4pgGUwWR4hY17Oc6DSc4z8WAR9BFLM0laeSqXH0l3j3fdl5wC6VyJb6bQMqWKs1uBwQoaw0ul+4qXEo3Ruv6z8CRbiHFnMvF1g0AFnjoCumNGPy8YSoyfqLEUOtvk1+hb/AICiM8A+GXpz5Dt8C7VncRmQR21JG8HFcBRoSf0mxFlARwipWHYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6948.eurprd04.prod.outlook.com (2603:10a6:208:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 16:22:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 16:22:40 +0000
Date: Wed, 21 May 2025 12:22:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] media: imx-jpeg: Account for data_offset when getting
 image address
Message-ID: <aC39yFwpqberS4bi@lizhi-Precision-Tower-5810>
References: <20250521015408.261-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521015408.261-1-ming.qian@oss.nxp.com>
X-ClientProxiedBy: BYAPR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::48) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec28748-c6a3-417b-c662-08dd9883b534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e9yk8iCuzOLopTt9V32MBBSiif/oEWfl707azIFFiiw0Z0H+AktJOd76aUr0?=
 =?us-ascii?Q?5mCdZRvkbnYCJjRS3wG89ZQlQIgGP34j01n4CPNGsK+lVS55VBuHURZF5MDy?=
 =?us-ascii?Q?9zTwzkzz5pDpjGuCcaa4O/O3mvZ0Sx4CdGCCDstVot5IsQQqjOWz6LMHFF3K?=
 =?us-ascii?Q?CMPneGh0W2TEG1r6IB/CRe0CBQH+2gA5FmQptAAmiotoZ0ywdivN18d/Bu4C?=
 =?us-ascii?Q?CFkv/RzprG2ob3KdBA5T13bE2yVkxDPgOqSbNXzhzzaVU9sZIyi9wf7Z9yku?=
 =?us-ascii?Q?d+CSWZzCZPN9zCWxrmF9Kn8paqYCFuhsqpPWQCO2eZZcmvvSDM9CVvIwC25G?=
 =?us-ascii?Q?iTdwcJTbdz2GTT/iEgR/gL94EbNHNtNMQRiPK8bfwsbPc7IfaNQ87iKM9gLj?=
 =?us-ascii?Q?urcf33rfOv5QKwTQGIchknGiPJxPgIA0kdnqOGM0Ke+ZrsaJKHzLoGFso/sF?=
 =?us-ascii?Q?nZiRbIhylwzTFlH71ab2Kh1nRXeKxpeUdRTQZzRrr2UCJr5n9Aqt1uSjP5tO?=
 =?us-ascii?Q?6yTh1z4/V4lSRmtjXfiFI8PwGw7YeKWGymYRe16QrH0ahZ4dyzRSTuQAxa8k?=
 =?us-ascii?Q?AKZWMOj5f1dqSljGgUV8QHyQuS2TUQv7Mw7spbWeayRzk8YokDCU9OW38+sG?=
 =?us-ascii?Q?MWD+EH1EgmU6zqGf3yXlfhjsKxaezUcki08sUW1aDLgy2F6JB0UwG0zxoacu?=
 =?us-ascii?Q?FNTztyeEDpNWAiC5zV4wzlIc1pzwrMmuAsbWcXP3MCLT6AiOj2Dc/+qx9Xwm?=
 =?us-ascii?Q?vg6jSJD5Wt6T3wuoUyJFuMMQb+NeO1tPpUH2pwFbyo8kiUcBRd7wwcWbedea?=
 =?us-ascii?Q?x7tQ6SI1frUY0hIR1bfF0wpZs80zyrRquDB/eSxCRujIg2FH27IKtg7JiMFj?=
 =?us-ascii?Q?novpRxWQMLavRBk7jsjlGHNlYdkFj/d0YNG7QuIJwGGugM5OxTcLv7j/A/rt?=
 =?us-ascii?Q?yNuOB7GIBeBAp3NIJauc39ZIzbO0ncIfBihEoe2w1QjhlwjllyWvIMWPVJAg?=
 =?us-ascii?Q?gPb20liirmUa+V+fPpqxuuY7zYFH4lsgRwZUpgiOU1j75GT7tKQzCrXf52mW?=
 =?us-ascii?Q?IDLbo5gqPBpsACUkOtMuAboxj/LR+OtLpd/IgpXoIZtDnn0joqPHPv25/WkF?=
 =?us-ascii?Q?bam8XCK0Jk9aBZMfzPfetJmxKxTuzeGbWGTTxBX3mITCk6btxXfuIb0s4pwY?=
 =?us-ascii?Q?d1iZEjk+E++Civ0XxRD5z5B7bwsCbOn3q3Q2lQz6bs2+U463hM+6wxExQTmD?=
 =?us-ascii?Q?qHyuVqrFwy5Cw/4r3+N431Kj61QAJGgy8CCe8SyXUZXZREewajlIco/BoYhp?=
 =?us-ascii?Q?zbRwGFZmj+gR/H6NcHoQZwC2TYPY/etkmUKzcVJ9klV1FcpuH0ol9clSaLHT?=
 =?us-ascii?Q?G1FJHck24Xx7GkI1BIC7cp+6VHBhvyRquxoyB/EZv7rpK0cBIU4nk5KnDDVu?=
 =?us-ascii?Q?luk0q4gDB8CyXAmgaHAxmess8C5wMq3IlchUcZl80pBSva/aTNTBkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y7CxboUb4rEEfGkPtEuGdTSc1sxFBVVhkqpS2lmNIugKJSnYKv/xuvF3+6hN?=
 =?us-ascii?Q?IoFCG281AOZmPSk6VmlOreyDODktFBZtwKHlc5thZawKTh14lx49lrhyeIxc?=
 =?us-ascii?Q?9AqezLSbxMrdfQTE3iffLeH5SWOkl1EhtHGHxScakubSxIZlqQHbQg+u1iUO?=
 =?us-ascii?Q?m/y7lyrHDYFwywyObG03ILyzEZnhUPsfXYpc1cGGSmjnmZgRJTo/lWQWSfjQ?=
 =?us-ascii?Q?Xkou0AjmgHr+EyGF2klhI/Os/QST7twIaIuHOm1ggNvwTNE2UjWgqL5cKBl+?=
 =?us-ascii?Q?Psdf8Tjj1xHoKha/KvIU5O1gm6v8gaDY5asNIJrwLNe6pOXa5Hf+hqrkYqu2?=
 =?us-ascii?Q?JKVDQBkOoTbxvOIlgJPEGl5Ovu6v0X1L/CWYo4Zt7iDubdUI6vinm0dSBgee?=
 =?us-ascii?Q?0yDHo+L7owCqb8ThIFXbfCvLLWldJnlAwgh7aSs3uNAHUrcdg4tA6kj3lE9L?=
 =?us-ascii?Q?VH+R/lAi0aIE8D91XVPbkBO+jJBf5MvtlthOPxxNIuMN7GKhz8Uo5mRX5yp3?=
 =?us-ascii?Q?5h/TiuvxYzm6qIWWGG7UViUHtZvrHA/gm4XT5vD4DajOt8rlKZ7gmE+JxNOx?=
 =?us-ascii?Q?jMc37PCWiZYhnT2skjCtSsul/OeOSr3iV+a3CHi7bJlO7AC7nL+3tMdrmtlI?=
 =?us-ascii?Q?ssvmdT+gViJLu02N3yXsMvuJqSCHLcPr3yL3v6YcZremazEmlRAWscMTfygN?=
 =?us-ascii?Q?kf/oCVYQMxULWWWIPpg0L4XjwW4ekfghIapcqo4BMIAixyExd9vuEQHZTqsg?=
 =?us-ascii?Q?8gLxXvbCnMyxPr/vPHpcXra/GCZ5UAngX3Pp/H4aQ+Edrtw/nTSrr+S4C7QX?=
 =?us-ascii?Q?/g59H0wAQW+zuODo5azwB+fVTW3cT6yFzKcVBknm1F43gIj0yx0oHPhMjUtt?=
 =?us-ascii?Q?X/wncQRLfNgGiQ/AaIsvhzYq9dLyhg47SkGZEH5mpmUJ5S5EbSWOVJpVbUFa?=
 =?us-ascii?Q?duyg2jeuR/CyY/OVVb28LY8ZU7EEUm0rvAYa+hwDPEzyEMJ4sFDFYJgXTMIg?=
 =?us-ascii?Q?4OfNpY6E+qTzUWRh6iXgww6zPdbbqumixR8xluj14M0LXKVMTRxNrvKPHXkQ?=
 =?us-ascii?Q?NtuR82X888AlxFcA9beyGfqAsI8AfWqOlUBMIdzKFK2LjKO1l3m0WNbYHRQD?=
 =?us-ascii?Q?orSP9QH1mGAzwgphV7QkK32AusGceIk15qGFs2WqzfFEpRaKRYF3JOXLipaO?=
 =?us-ascii?Q?S9yGrqUiASdY2Mfc3xpthDXXhG2wUh6IuBeI/4dTITZ4nbh45rb/Q5PMCRd0?=
 =?us-ascii?Q?dFJ3U5dp3aLQFN1MCKLuAIrnLzZAIi+nvmnQ6Cb0VHtb86uwF6Hav78yRR7H?=
 =?us-ascii?Q?xeDwmNA2CRiRhxdLTHOp/6g8PFT7RGvQPOrs+b5PHDDDeXJZEVJTrFIGaGYQ?=
 =?us-ascii?Q?UsXq2kLCTBoT2Term6kHjxqvXRFO7RTBHf40qGT2sOEJoDM7KtSjLK9r7czn?=
 =?us-ascii?Q?CTcsTOB7X8eOd2Bmupe7o3RgxaPZXQ431Lz4Ohi6z4bfj2hx4ZeL8NVNPz5U?=
 =?us-ascii?Q?NI+Ss1Fqr/E5vM/uCfXq8QitpFo8krcBIWCnluKqT0qRyDEExVXmmyfsC8Cl?=
 =?us-ascii?Q?yrvESf9QJ/pb5kV7XMLiRP5WqKEc2gPBG/+K6GFk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec28748-c6a3-417b-c662-08dd9883b534
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 16:22:40.6207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5E+A88AA5B34Fl5qAUCNL5u6J94t2JLCtlBmsDKNBwAUiPLKYc0n09igiW3dUuXf0saUb+2rhNmypGpKaV7vrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6948

On Wed, May 21, 2025 at 09:54:07AM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Applications may set data_offset when it refers to an output queue. So
> driver need to account for it when getting the start address of input
> image in the plane.
>
> Meanwhile the mxc-jpeg codec requires the address (plane address +
> data_offset) to be 16-aligned.
>
> Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> v3
> - Add Fixes tag, it's a bug fix, as missed consider data_offset
>
> v2
> - Verify the address alignment
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
> base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
> prerequisite-patch-id: 0000000000000000000000000000000000000000
> --
> 2.43.0-rc1
>

