Return-Path: <linux-media+bounces-21339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 993CF9C5FCF
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 19:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57E78285812
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 18:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8342C21765B;
	Tue, 12 Nov 2024 17:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lrndfg4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB732144CB
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 17:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731434381; cv=none; b=NtVHfzq0i15fe0S9YJp66hVmXQjhiyjb27I8T8x12wZzjtzLUUMxBeIV8D9nVLvP6epYiccsnBjjuM7plrF+9qnHkh8LvIXjxMLyTlrHyzq48eLvLh0wo3hUCTGts2OpIHT7Qu2iIiuoCKqQn+cx53O9s6yQlOUGWPGeKlJLWWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731434381; c=relaxed/simple;
	bh=ZHGsxXifJAi+lQO/UGzTdMxjyOWMWPmnHn/y/EODsyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN5d6Yr8Qfh5zTLgjGt5j4tLtUdPbUVEQsUseBBnVJ4dy3+rGQs2Wp1BPHrDd+tY/tRcZgUdv3LSFcjd34eIwdmjHs+i0/YfTl4/rGYtjkQNdNKI0q3As9KiBQehRjFpX2zBgTijAgpxzZMsyx+8JLjatoMPp8kAq1dwrQEvB88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lrndfg4Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A25C710;
	Tue, 12 Nov 2024 18:59:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731434364;
	bh=ZHGsxXifJAi+lQO/UGzTdMxjyOWMWPmnHn/y/EODsyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lrndfg4YxvwLyJk8h4f2zvfwhYFweGsFKcje+4xRs5TNvIewxpv/vQYozWs9SioGm
	 zVUW1EF/hqEz6iPYgdbNPLfzeWTHVtT7x4Vdb81CMEsfhasHsAdHmm5YnljI8FODyA
	 dWJE/PP3HgMDFwvZwq+gRz+UkehAsa+EgJ4ZSulA=
Date: Tue, 12 Nov 2024 19:59:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 4/4] media: platform: rzg2l-cru: Add support for
 RAW10/12/14 data
Message-ID: <20241112175929.GC24067@pendragon.ideasonboard.com>
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

Hi Dan,

Thank you for the patch.

On Tue, Nov 12, 2024 at 12:46:14PM +0000, Daniel Scally wrote:
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> 
> Add support to the rzg2l-cru driver to capture 10/12/14 bit bayer
> data and output it into the CRU's 64-bit packed pixel format.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
> 

-- 
Regards,

Laurent Pinchart

