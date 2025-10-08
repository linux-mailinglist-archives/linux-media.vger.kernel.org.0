Return-Path: <linux-media+bounces-44019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79139BC686E
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 22:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 660D74EF318
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 20:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D886D265620;
	Wed,  8 Oct 2025 20:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IZI8oSPv"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011021.outbound.protection.outlook.com [40.107.130.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3DD23BD1F
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 20:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953756; cv=fail; b=ErC9L58uIcLaf21BITWjlLWD6NiqXN8uzJbFRwEKFWDWHEEIcJaGu8SoYXiqolLUfa4uitQckvSTEKH/89NRNpDGtYh6XK1PpKYPOx11UAbDteOCaH75cCkVzmnneD+1V97uOa5Qyu1BhJTezt23tlcjl511yW+lFtJhpuMoc10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953756; c=relaxed/simple;
	bh=ZHjsGJohVtZYut/0eJAX7IDugBDW3qXp1fx8ihEGJVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D5Fvsm9tvfi8h9UlpO1MpcAnoUjD4zAaZVGknK8p5SAtDy31OwbNfmf2DYfFduqoL54ftr6UepVWqOEvxbQqRuvcAEBeJM5GW4S9/0wmkkTnaM10hw1o9KQY2roIx+mfW4DTqTT4JGDyhGr2z7KCSgp1BydLj+nB7dnINVjSXBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IZI8oSPv; arc=fail smtp.client-ip=40.107.130.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymNZ2QESW5s/bRNNtO3xUaobCoYydxn+8EKjyRa5Rc3dOYu2VsBe3fZQLNTZJDLtyJgMR1Y2Wgs1LEfuIS1Aqh663fNXwRcN7hi2krjXwnSkq74gmXV3M9j/FSqklccd68fI8JFPppb19wfLZdI8i7V1mk/MDOIeFw4LUNa9M+kZBtvuaPKgVqlB/dyVPcpgSs9npmJ020XQbJpPW+DN0xFt+XzVRMLsUn8vxn/bdN3/Hx8RcVLYaZ/NCx017KXIzUoMeoTPpao+OtG9qmMIbWouNpuD1DZRiEdb6b9OP0uGCPra+HBCAyRzoqFO6kHBfQVPmyeLSdJ4ezHJTDbE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CM2oS42YGuvRQ6dVQb+pAAl68fFLbhH+nImUWJgt3E=;
 b=Jl/X4wcNoe0oYZl7yevphPBFPIzj1UeIMrPZ34Bwy8Gol4JD7yB1GFeyGdStGCMl4HmwtxDJMb6QxDx5f7AQTSItyeRCqt1Cb/EC38SIQEL85I1GrQ836glWhpTL6dIgdyC2UdGhngwx7iQKji31mCxLXjI3yM6BcRVkXfi/rAiUTDW6/vkJG2tRZW0wH8NxfPPqXmCk1P2dZLaRz87ugd/SaAYxuYNvDHswgMl5ToDyMMbkmhhpkhkoSG/XbXsFGoTolsR9HjoI2m/VFm+TOkKT1zwKtE4esPDyfZYNcDy5j6jCiakbFoSf0D13Hv0xQVP1BN6P55Z658vR8IEfkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CM2oS42YGuvRQ6dVQb+pAAl68fFLbhH+nImUWJgt3E=;
 b=IZI8oSPvvbxcQN209ucygxWbVjG+7p2Jf0qgtY2E1JCsM64euve7ABd5auYKfSPX+SO3RgTNsjFYFXZuP5VWfdxySgu0fPbqvH9u1Txqu5tqERD4y+JRuCmWxf6yIL28PqdgTQHm4mHDzuF3gUFSimspCI/kvKd8uwaqwF84u8in2r4En4rzdFAh0nYTWzOqeXr23Te4MoxVoTX4dbXnLGj0AxBzNdV3inogHDuhNrg/PLV75osBYyyebLhTAeFNIK17uB1NSXtzJ5GeqFfR1OBEI9G4siCuQA7c9RnsJ6m7fIkpmJdmgV/OBkdE20cXo6sFrIvehWvirtoiZgDoLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB8849.eurprd04.prod.outlook.com (2603:10a6:20b:42c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 20:02:31 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 20:02:31 +0000
Date: Wed, 8 Oct 2025 16:02:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 13/25] media: nxp: imx8-isi: Drop unneeded
 v4l2_m2m_get_vq() NULL check
Message-ID: <aObDUAxxOZUgk3LI@lizhi-Precision-Tower-5810>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-14-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008175052.19925-14-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SJ0PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::19) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c0f027-db24-4379-dcfc-08de06a59d89
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ITeFKLjvwHwz4gIie9/EAtLKD3+OGX4rXYqBFTzebfuFnp2dTMwhGqsd0WNW?=
 =?us-ascii?Q?9occiepcv9Z/It5IJmHadvS2KjPIKa9bh8Hyf4M6lJCyb+Q/nueDNQRuaFg/?=
 =?us-ascii?Q?4zi7qlJDwOG4AWE7EgTIm1FLmwwiJP3jIMsEGlkR9Yri3xCpHwCLoEXOocgX?=
 =?us-ascii?Q?n4RAr7sAB17mesJfZp2wcLWlV9bhjxu5TRFwpSXsLS9jfaeQWsgyRkvK57AZ?=
 =?us-ascii?Q?jKTQjGFWGdcYRh62OnwNAp8mzOPOZ6UyuUdMbA81Lw8TaZSR4P098ejHKloU?=
 =?us-ascii?Q?kc6CYyzUk0Kxtm5kZDuDIALKOwNPGxb96NoWHEcMPMJFzuQhA7i38Em33Uwm?=
 =?us-ascii?Q?wn3+jDOLIxeZWAEetdWr6KLESdNgsDe1bDBz9ZR/qqhqkTP/uJzzMLX5IjJ1?=
 =?us-ascii?Q?J05MYueMJFodCidgP4z/QPG2XWqrlrjYpJ7l9X2s93euYeGSpS8xO9SlUpLi?=
 =?us-ascii?Q?EQN4sRz7ol6zRCJuD10MPOqBeS2X575LePGqPkJEw2hGbSOMunGU2kh8IZrw?=
 =?us-ascii?Q?WT43atFVzvubTS7glQZG/4qN8SoS7Xrxih+Wqj64wr4gv/9UrFP8TWbTLXhg?=
 =?us-ascii?Q?kcfj/eC0JnQvcyTlzTuRmrAE4b7SRF35uRc14VgWXu1hZnBGrzKPK2jMoUeo?=
 =?us-ascii?Q?Z+DDAhnlmA1MgyCXTIGrdzwOslNeHbO2BtYmXEopgk8fIoENvPze34SO9Kui?=
 =?us-ascii?Q?UyYdr18mMPj0rTBnOxVHer61PO+8XBdO5l/4LyvE3K1EZmUEmgsRFQx88udd?=
 =?us-ascii?Q?FfcpIX2zR5oEL75Gn+yZTpaK/zkQHLkfrl3XhbSxWftvI3dplP7uoABuSL5Q?=
 =?us-ascii?Q?w4aArpxUFoSmR7T48ViumSJZUlI8br+bCTLVEU3HnhaDNYmVxC3EjJC14bm/?=
 =?us-ascii?Q?NX/jrNx5CcX4h/l9RbGNo7Vgbf/3DkorARuiKPA1JxPX8WOXVHixwek72ka0?=
 =?us-ascii?Q?ulyPl86kDg1YW+UQTvlTPaHMW29KTbsrXqwn5bS3AUIb1FUzkh+FMuqksylU?=
 =?us-ascii?Q?/5aAzIBozQqpyiT+AcfGpAOEDuR7yAkZuR+WQ6FqLJl3up/M0bMnOXh5xRQv?=
 =?us-ascii?Q?b8ccn30XaBdG8r9WjCR+xauNKUfbQ4jYgNA4SHroLNxEsxWWbSzx5f+mWsBB?=
 =?us-ascii?Q?pFGR8UVLHzKCIwHzQFrGO0AYySrQlKeKeypE1bIpoAs80/E13hBJO6J0IULf?=
 =?us-ascii?Q?tI57F45tDLdLEhHjYxwvtAxOSKkiAFnFdm07BKxOJs0bZuzOpgGeFNdisRAF?=
 =?us-ascii?Q?t+v0X29IuB5wsPg22oDN9Ym1IdFhL+VqxAZzC9vDx4EJvLOWK+MHnPkDWwpR?=
 =?us-ascii?Q?p6p0+R+7PYPxSlKB9dfLvRzTe8fS3REuFRKpLuPMvgChoWNjUZV6wbZ5RRl1?=
 =?us-ascii?Q?476FAxq7RsxRQIu6ucAcyTkjIaikgJT6woyoUfUWH8SPxk/G+PWRGs4iDwq4?=
 =?us-ascii?Q?3aB395ny7husZJ9hwT4/5WniOL5Ej1iFlR4X7FLTSbYWKIhR2yf/KF/iIopm?=
 =?us-ascii?Q?dSt3h4/qofmpJBUK7n36X+d/aux6ZCISegmB?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nDF6iLL/wy7ne7xT5oCJ8bOCj0Dn17SRsDVZXRmW8MWs57ZEC9hkOU9AZ39H?=
 =?us-ascii?Q?dQpV/E9Hx3s62ghJ9W8mSXpXVbjz4Ww4zrAh7QW0OCA0CZQ89+yErs6tj3bf?=
 =?us-ascii?Q?74/i5xR2xK+yuXAO52yd6HCTpllajGM3zYAgf6GZI0Bl3tIFmehX0SNMJvPU?=
 =?us-ascii?Q?HzbRjCdXYKs9vKf9/4In7scO7KDOMd7+DRclHurCTcNSxse3a0TM/+Ozs4KE?=
 =?us-ascii?Q?nIWNAXh+zo1VGjyAHyPa1/DyQ7DB7Spinp917h73OwLeiNnNWLtQOdDYS+FB?=
 =?us-ascii?Q?CfhPD77IgW2YvCjwHSFEYZoaK+Jsk3/UMSQO3ad4NAT86Odugu/i9WgP4qIQ?=
 =?us-ascii?Q?iQ51mMqaoprJgda4FPTsDdYRN6Y/fltIUzdVRCAFtlmH1fajKrQVjoOZ9DkS?=
 =?us-ascii?Q?55aqiojein04bfJ5JFHKUd18x+hk9BzNeceUVdJij5XDrErPiSdtOV/6m2F2?=
 =?us-ascii?Q?IL9ueRfTWcLCr447mtGq4NamcTagFRZawErG48aMu8GdBf2+iLD3OkW0LRji?=
 =?us-ascii?Q?Fa8uH7t+CHKrw4EtFnV6evnyqY2glkfjtTkKsinG6ub89+MSaNwmeclfSkRA?=
 =?us-ascii?Q?5EpybcsaUqm96VOxqshffc42GapbZ6W/lEVoA8gfMm9y1jK44Y14axl46YHM?=
 =?us-ascii?Q?dEuVen+Y45nnCnmtdtXSq+wp/Zp8VjTPrkigiZsddyKM096qKYlyKV4GfM7+?=
 =?us-ascii?Q?aywyXxOxycx+xX2PAr+fTUkLbXQdDu7SQvz38DQuGT83XoN8E8qnkLy3Xcy5?=
 =?us-ascii?Q?enSYeVZY0e34mZwBzzZfT0GxbmJ+WYnRlosKUDd8BxZrRyX88vQJdkR9S39Y?=
 =?us-ascii?Q?tccg4zZG42N35tRvtfIVNI5Zz2ws9xSntnVsl8rVZOPABcC0x7bI0yDDhvJ2?=
 =?us-ascii?Q?6yQOmUfx7e+mI43lHQCkywNT3vD0xZM133WijmD4AH9nKI82jiBxX8Ap3vXd?=
 =?us-ascii?Q?RupwbXzrNi8vlO7p3GWp/vmTiYfBkymAJFkR7mna4YVYkSTr7VcKYNPXj+zo?=
 =?us-ascii?Q?NCohP1eAF+3tG8T+hAcfLVTPdp+EIVCgzuMxRcZoEAxoj0Pe0iiagFqfWi6F?=
 =?us-ascii?Q?e2IlbpeVv4GUse5QUmcilaDAyr9oqlwpK74jA8dlp63Z+ZpclEeEpCQSYrKH?=
 =?us-ascii?Q?x0EKEVeHYz74yzU3uwyoAKe9U+hA6nmbRSOOH51pT1NV+WZLnkYUsN41gJGp?=
 =?us-ascii?Q?U0PLz5wDCnD8vh4TuQSoWmbghbYKBKMR3dERUMWyIfx7FGTRDuqidTtQt2Of?=
 =?us-ascii?Q?qwPArQq1EJNcn2leqc+pkK2QToI68TbFR+HOcv8kW1e4r11t1rq7/LQcIpe/?=
 =?us-ascii?Q?cpGt5hO3t2cg7YVVDhu4hb0wGlBXxeZBXbDgaqbLOilLPgW1JOUP/TPSHHp/?=
 =?us-ascii?Q?fiGRRAotqRvNacVxtP1/7Zt1ay2YrJhTie8IRKee/xGk9/etKJuEcwPECA5M?=
 =?us-ascii?Q?k+pjFzkI0BZX0dg+jF6AeBAvt4PWuYctIT7Bamy3EojLIvER+bxg6jNZicxZ?=
 =?us-ascii?Q?4mNZlBYhwGxcCwDKL7VjDtBlpqFdNN4kr+oViTpP1QYNsS/ZzkafiZYWEiNw?=
 =?us-ascii?Q?G9RXeW5cMY+hwcWzqGTFyaH2bCRip+oiaojjeeS2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c0f027-db24-4379-dcfc-08de06a59d89
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 20:02:31.7592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8eIPpG0H5D1NwXYaTXm56N+FcB9uiJT7iCOs2KlzXwwmAqKV3QDw9mg0jALDARIn1TOzbjM9DqOC0ynNAWyEQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8849

On Wed, Oct 08, 2025 at 08:50:40PM +0300, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check may have
> been intended to catch invalid format types, but that's not needed as
> the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> the format type, so the type can't be incorrect. Drop the unneeded
> return value check.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 6822c2f7fc69..675f1d2b65d9 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -554,8 +554,6 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
>  	struct vb2_queue *vq;
>
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
>
>  	if (vb2_is_busy(vq))
>  		return -EBUSY;
> --
> Regards,
>
> Laurent Pinchart
>

