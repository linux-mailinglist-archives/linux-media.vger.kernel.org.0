Return-Path: <linux-media+bounces-18719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7FB988CAE
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 01:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0729282470
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 23:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B9A1B7904;
	Fri, 27 Sep 2024 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UFbBFbEg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DB1B78F1;
	Fri, 27 Sep 2024 22:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727477970; cv=none; b=nrPmAm2reW/BsncNMYAyIjBQHDKbNQ93UUmVWnF/XMGej1Ft+RSGIKS8ELlqBwov7H0Y/Tfdl2m5NtuTpq7+EzhuZGIuy72+H8sPA3EdyV+fQ0hao1/uKzYcdvQZCC16FzJNzBl5b+A2ku3T4mk3IwEYZVCPQPH9i5cVh3geVJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727477970; c=relaxed/simple;
	bh=7smdabxTMYp/mYhZxYS34HpwOQWtRqSoXG+NV/JQ3wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDpj6MpLYpyiKQN5REQHVaV39wRF1GiEbZnA+5LqMvxE5NDm9xPi6q3A+kNBT8FlFJkAOB0lIh5fe+k03zfzUZ9TSPVH6eI0S9aZVQj8YQCR3WYBfCQ3xdVSC7e3eWLiJK2ChfW20Rhj7Tayz1/QkxP979Ha5M2Ms9BGc/FVN+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UFbBFbEg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F07F161;
	Sat, 28 Sep 2024 00:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727477877;
	bh=7smdabxTMYp/mYhZxYS34HpwOQWtRqSoXG+NV/JQ3wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFbBFbEgWJb7l3l7tOj0/nFh/yN26uNiWtl8mY4OBJqu/HVdzYZYSMAECJh1AsbrV
	 dgxBerCMKLmJhzbk0qUgTeZXioZMrZCCq4bT72Fw4GTEqonriHjFIdwugKF+9nXwdE
	 2TYCEjP0yq/6L+Z9cfWd7QlEb150FcA0Yjvby8v8=
Date: Sat, 28 Sep 2024 01:59:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 10/16] media: platform: rzg2l-cru: Simplify handling
 of supported formats
Message-ID: <20240927225923.GJ12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-11-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:51PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Refactor the handling of supported formats in the RZ/G2L CRU driver by
> moving the `rzg2l_cru_ip_format` struct to the common header to allow
> reuse across multiple files and adding pixelformat and bpp members to it.
> This change centralizes format handling, making it easier to manage and
> extend.
> 
> - Moved the `rzg2l_cru_ip_format` struct to `rzg2l-cru.h` for better
>   accessibility.
> - Added format, datatype and bpp members to `rzg2l_cru_ip_format` struct
> - Dropped rzg2l_cru_formats
> - Introduced helper functions `rzg2l_cru_ip_code_to_fmt()`,
>   `rzg2l_cru_ip_pix_fmt_to_bpp()`, and
>   `rzg2l_cru_ip_index_to_pix_fmt()` to streamline format lookups.
> - Refactored the `rzg2l_cru_csi2_setup` and format alignment functions
>   to utilize the new helpers.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    | 20 +++++-
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 35 +++++++--
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 71 +++++++------------
>  3 files changed, 72 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 4fe24bdde5b2..24097df14881 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -62,6 +62,20 @@ struct rzg2l_cru_ip {
>  	struct v4l2_subdev *remote;
>  };
>  
> +/**
> + * struct rzg2l_cru_ip_format - CRU IP format
> + * @code: Media bus code
> + * @format: 4CC format identifier (V4L2_PIX_FMT_*)
> + * @datatype: MIPI CSI2 data type
> + * @bpp: bytes per pixel
> + */
> +struct rzg2l_cru_ip_format {
> +	u32 code;
> +	u32 format;
> +	u32 datatype;
> +	u8 bpp;
> +};
> +
>  /**
>   * struct rzg2l_cru_dev - Renesas CRU device structure
>   * @dev:		(OF) device
> @@ -144,10 +158,12 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
>  irqreturn_t rzg2l_cru_irq(int irq, void *data);
>  
> -const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
> -
>  int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_ip_subdev_unregister(struct rzg2l_cru_dev *cru);
>  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
>  
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
> +u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format);
> +int rzg2l_cru_ip_index_to_pix_fmt(u32 index);
> +
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index cc297e137f3e..2d3b985b7b0d 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -6,17 +6,21 @@
>   */
>  
>  #include <linux/delay.h>
> -#include "rzg2l-cru.h"
>  
> -struct rzg2l_cru_ip_format {
> -	u32 code;
> -};
> +#include <media/mipi-csi2.h>
> +
> +#include "rzg2l-cru.h"
>  
>  static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
> -	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, },
> +	{
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.format = V4L2_PIX_FMT_UYVY,
> +		.datatype = MIPI_CSI2_DT_YUV422_8B,
> +		.bpp = 2,
> +	},
>  };
>  
> -static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
>  {
>  	unsigned int i;
>  
> @@ -27,6 +31,25 @@ static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int c
>  	return NULL;
>  }
>  
> +u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
> +		if (rzg2l_cru_ip_formats[i].format == format)
> +			return rzg2l_cru_ip_formats[i].bpp;
> +
> +	return 0;
> +}

Instead of making this a ad-hoc 4cc -> bpp conversion, I would rename
the function to rzg2l_cru_ip_format_to_fmt() (or something similar) and
return a const struct rzg2l_cru_ip_format *. The caller can use the .bpp
field.

> +
> +int rzg2l_cru_ip_index_to_pix_fmt(u32 index)
> +{
> +	if (index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
> +		return -EINVAL;
> +
> +	return rzg2l_cru_ip_formats[index].format;

There's no guarantee the 4CC won't map to a negative 32-bit integer. I
would return a onst struct rzg2l_cru_ip_format * from this function, and
rename it accordingly. The call can then use the .format field.

> +}
> +
>  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
>  {
>  	struct v4l2_subdev_state *state;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index de88c0fab961..014c0ff2721b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -300,21 +300,10 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
>  }
>  
> -static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
> -				 struct v4l2_mbus_framefmt *ip_sd_fmt, u8 csi_vc)
> +static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, u8 csi_vc,
> +				 u32 csi2_datatype)
>  {
> -	u32 icnmc;
> -
> -	switch (ip_sd_fmt->code) {
> -	case MEDIA_BUS_FMT_UYVY8_1X16:
> -		icnmc = ICnMC_INF(MIPI_CSI2_DT_YUV422_8B);
> -		*input_is_yuv = true;
> -		break;
> -	default:
> -		*input_is_yuv = false;
> -		icnmc = ICnMC_INF(MIPI_CSI2_DT_USER_DEFINED(0));
> -		break;
> -	}
> +	u32 icnmc = ICnMC_INF(csi2_datatype);
>  
>  	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
>  
> @@ -328,17 +317,23 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  					   struct v4l2_mbus_framefmt *ip_sd_fmt,
>  					   u8 csi_vc)
>  {
> -	bool output_is_yuv = false;
> -	bool input_is_yuv = false;
> +	const struct v4l2_format_info *src_finfo, *dst_finfo;
> +	const struct rzg2l_cru_ip_format *cru_ip_fmt;
>  	u32 icndmr;
>  
> -	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt, csi_vc);
> +	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
> +	if (!cru_ip_fmt)
> +		return -EINVAL;

I think you can drop this check, as the code is guaranteed to be valid.

> +
> +	rzg2l_cru_csi2_setup(cru, csi_vc, cru_ip_fmt->datatype);
> +
> +	src_finfo = v4l2_format_info(cru_ip_fmt->format);
> +	dst_finfo = v4l2_format_info(cru->format.pixelformat);
>  
>  	/* Output format */
>  	switch (cru->format.pixelformat) {
>  	case V4L2_PIX_FMT_UYVY:
>  		icndmr = ICnDMR_YCMODE_UYVY;
> -		output_is_yuv = true;
>  		break;
>  	default:
>  		dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
> @@ -347,7 +342,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	}
>  
>  	/* If input and output use same colorspace, do bypass mode */
> -	if (output_is_yuv == input_is_yuv)
> +	if (v4l2_is_format_yuv(src_finfo) && v4l2_is_format_yuv(dst_finfo))
>  		rzg2l_cru_write(cru, ICnMC,
>  				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
>  	else
> @@ -810,35 +805,16 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
>  /* -----------------------------------------------------------------------------
>   * V4L2 stuff
>   */
> -
> -static const struct v4l2_format_info rzg2l_cru_formats[] = {
> -	{
> -		.format = V4L2_PIX_FMT_UYVY,
> -		.bpp[0] = 2,
> -	},
> -};
> -
> -const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_formats); i++)
> -		if (rzg2l_cru_formats[i].format == format)
> -			return rzg2l_cru_formats + i;
> -
> -	return NULL;
> -}
> -
>  static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
>  {
> -	const struct v4l2_format_info *fmt;
> +	u8 bpp;
>  
> -	fmt = rzg2l_cru_format_from_pixel(pix->pixelformat);
> +	bpp = rzg2l_cru_ip_pix_fmt_to_bpp(pix->pixelformat);
>  
> -	if (WARN_ON(!fmt))
> -		return -EINVAL;
> +	if (WARN_ON(!bpp))
> +		return 0;
>  
> -	return pix->width * fmt->bpp[0];
> +	return pix->width * bpp;
>  }
>  
>  static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
> @@ -849,7 +825,7 @@ static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
>  static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  				   struct v4l2_pix_format *pix)
>  {
> -	if (!rzg2l_cru_format_from_pixel(pix->pixelformat))
> +	if (!rzg2l_cru_ip_pix_fmt_to_bpp(pix->pixelformat))
>  		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
>  
>  	switch (pix->field) {
> @@ -941,10 +917,13 @@ static int rzg2l_cru_g_fmt_vid_cap(struct file *file, void *priv,
>  static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
>  				      struct v4l2_fmtdesc *f)
>  {
> -	if (f->index >= ARRAY_SIZE(rzg2l_cru_formats))
> +	int ret;
> +
> +	ret = rzg2l_cru_ip_index_to_pix_fmt(f->index);
> +	if (ret < 0)
>  		return -EINVAL;
>  
> -	f->pixelformat = rzg2l_cru_formats[f->index].format;
> +	f->pixelformat = ret;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

