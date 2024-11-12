Return-Path: <linux-media+bounces-21320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2D39C598F
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 14:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0C8B1F2343C
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 13:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAE31FBF56;
	Tue, 12 Nov 2024 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B+OPZ4m8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C2F1F4737
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731419537; cv=none; b=cOdOJWc/oG5utdB0fo+0Lxjyibf3Iw3DXTUuB+L0Y/5jWSC4TY3NG3xjzqcZLvgQch4prr3FoWag9fMbXG3M02+AwDuNFxjhw73IB2CGDLI7YdhrMbDG1I84JRHvCZen6X+u6n7nnhU+Up8YBQ28U/YkkoapjT5CuFu/2yg31uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731419537; c=relaxed/simple;
	bh=FUrXg0q7uUmpmwXPYlfQ/pIdrXRcKWQpNV02e2SBx4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MS/wt57AFd4uinfBTgliRL6HVh6yg7p07vq+QaNVH8119mNMwEIjjaojGvB/2nJ2goVxY9yMyunCNYL9LYNOQpymKsgkqBjo/TGF1Mt/FZ2oQRyoJAF7vaA3MbnsPQeEynGpXnRWBAglnMXDMm9JWTmH3XZHTR1sEmtJlj4TIBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B+OPZ4m8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-14-222.net.vodafone.it [5.90.14.222])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37154710;
	Tue, 12 Nov 2024 14:52:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731419521;
	bh=FUrXg0q7uUmpmwXPYlfQ/pIdrXRcKWQpNV02e2SBx4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+OPZ4m8CzUznYM/7/VjNHu28r22w4o3u2bkScWDcn51AIB8vvpPslyTCkVUr2Msx
	 Wq2BJKTnBhE1k8xTlsBt7W9YzFpIOLE7eSG1NLd6PooKo45a+RygjCDq+NZM8Y2IBU
	 E7X8NrdBUwsQ5Stx9rv8FuYnEj8RrtRBBOvz1OHE=
Date: Tue, 12 Nov 2024 14:52:09 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 4/4] media: platform: rzg2l-cru: Add support for
 RAW10/12/14 data
Message-ID: <axp2cmbb6bcbonjtoqeny6gcyul5bbz5hjqbi35vpmtd45wm5q@pxvlmfl4c3wk>
References: <20241112124614.646281-1-dan.scally@ideasonboard.com>
 <20241112124614.646281-5-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241112124614.646281-5-dan.scally@ideasonboard.com>

Hi Dan

On Tue, Nov 12, 2024 at 12:46:14PM +0000, Daniel Scally wrote:
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>
> Add support to the rzg2l-cru driver to capture 10/12/14 bit bayer
> data and output it into the CRU's 64-bit packed pixel format.
>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Looks good to me
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j


> ---
> Changes in v2:
>
> 	- Minor updates accounting for rebase
>
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 12 +++
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 84 +++++++++++++++++++
>  2 files changed, 96 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index cbefd43de09b..e77cce2a8ddf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -192,6 +192,18 @@ static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
>  	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, },
>  	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, },
>  	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10, },
> +	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, },
> +	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, },
> +	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, },
> +	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12, },
> +	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .bpp = 12, },
> +	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .bpp = 12, },
> +	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12, },
> +	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .bpp = 14, },
> +	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .bpp = 14, },
> +	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .bpp = 14, },
> +	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .bpp = 14, },
>  };
>
>  static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 399a337dbafb..3e93c801f1b5 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -47,6 +47,90 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  		.icndmr = 0,
>  		.yuv = false,
>  	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.format = V4L2_PIX_FMT_CRU_SBGGR10,
> +		.datatype = MIPI_CSI2_DT_RAW10,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.format = V4L2_PIX_FMT_CRU_SGBRG10,
> +		.datatype = MIPI_CSI2_DT_RAW10,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.format = V4L2_PIX_FMT_CRU_SGRBG10,
> +		.datatype = MIPI_CSI2_DT_RAW10,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.format = V4L2_PIX_FMT_CRU_SRGGB10,
> +		.datatype = MIPI_CSI2_DT_RAW10,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.format = V4L2_PIX_FMT_CRU_SBGGR12,
> +		.datatype = MIPI_CSI2_DT_RAW12,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.format = V4L2_PIX_FMT_CRU_SGBRG12,
> +		.datatype = MIPI_CSI2_DT_RAW12,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.format = V4L2_PIX_FMT_CRU_SGRBG12,
> +		.datatype = MIPI_CSI2_DT_RAW12,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.format = V4L2_PIX_FMT_CRU_SRGGB12,
> +		.datatype = MIPI_CSI2_DT_RAW12,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.format = V4L2_PIX_FMT_CRU_SBGGR14,
> +		.datatype = MIPI_CSI2_DT_RAW14,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.format = V4L2_PIX_FMT_CRU_SGBRG14,
> +		.datatype = MIPI_CSI2_DT_RAW14,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.format = V4L2_PIX_FMT_CRU_SGRBG14,
> +		.datatype = MIPI_CSI2_DT_RAW14,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.format = V4L2_PIX_FMT_CRU_SRGGB14,
> +		.datatype = MIPI_CSI2_DT_RAW14,
> +		.icndmr = 0,
> +		.yuv = false,
> +	},
>  };
>
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
> --
> 2.34.1
>

