Return-Path: <linux-media+bounces-19053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB6F98F157
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 16:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1025CB22791
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 14:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3456D19E98A;
	Thu,  3 Oct 2024 14:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ssKRajTp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AB012EBDB;
	Thu,  3 Oct 2024 14:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727965556; cv=none; b=uN6sV8Xe0UUoPdIzTMFADWalUqhh+mn0OrjWqJD2SRPM2YcHDOZG1/gdtjAjg4L/oqcCtI3x8thhrfszixoAm4sFEeqAoaYFSv8t+EWpqU6CGUVxWhOAQfLdJh4049r/JLvrnzQACmGr5jTLOpW/SXGRE5KjETkaBDCaeyRUgl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727965556; c=relaxed/simple;
	bh=LI3v4Gzw7fu82Mr1OMw10wv6EB32YRESYvSBRVGN5mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZfJ7BFo6NZ98DE0CwGVCL6wo9kHu04gHCJ6MtsmbG4loGp15FgseZlL2BtsHKfrOlEg79wH2TFXB+xWBFjJhYZ+d49zYWSh1owTgoowzfA4yGGR91KDUyQm9D3c9DrdyRU9d2pqKndyn2oL7fik6uj+oYAluFH45QwkZC4lKNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ssKRajTp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56F5818D;
	Thu,  3 Oct 2024 16:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727965459;
	bh=LI3v4Gzw7fu82Mr1OMw10wv6EB32YRESYvSBRVGN5mA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssKRajTpi+XFvCU4OH/HagSv7Qu6aU2MvPxXRrT0gLbMpIVmlN0Lo+cf3V5kmhQrX
	 92qmKspP/NgUmF47B7x6np0HXJWUd3Ftvfos0GA23ahUalp1yWdJjnuR34FwvNpuVj
	 ljzOd86kUW9i92Ej3iubqwbH/i46shN5b3EC7E+U=
Date: Thu, 3 Oct 2024 17:25:49 +0300
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
Subject: Re: [PATCH v3 10/17] media: rzg2l-cru: Simplify handling of
 supported formats
Message-ID: <20241003142549.GC5468@pendragon.ideasonboard.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241001140919.206139-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001140919.206139-11-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

Just one minor comment below.

On Tue, Oct 01, 2024 at 03:09:12PM +0100, Prabhakar wrote:
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
>   `rzg2l_cru_ip_format_to_fmt()`, and
>   `rzg2l_cru_ip_index_to_fmt()` to streamline format lookups.
> - Refactored the `rzg2l_cru_csi2_setup` and format alignment functions
>   to utilize the new helpers.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Updated subject line and commit message
> - Implemented rzg2l_cru_ip_format_to_fmt() and rzg2l_cru_ip_index_to_fmt()
> - Dropped checking fmt in rzg2l_cru_initialize_image_conv()
> 
> v1->v2
> - New patch
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    | 20 +++++-
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 35 ++++++++--
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 67 ++++++-------------
>  3 files changed, 68 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 4fe24bdde5b2..39296a59b3da 100644
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
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
> +
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 7b006a0bfaae..12aac9d6cb4b 100644
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
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
> +		if (rzg2l_cru_ip_formats[i].format == format)
> +			return &rzg2l_cru_ip_formats[i];

	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
		if (rzg2l_cru_ip_formats[i].format == format)
			return &rzg2l_cru_ip_formats[i];
	}

Sakari can probably handle this when applying the series to his tree.

> +
> +	return NULL;
> +}
> +
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index)
> +{
> +	if (index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
> +		return NULL;
> +
> +	return &rzg2l_cru_ip_formats[index];
> +}
> +
>  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
>  {
>  	struct v4l2_subdev_state *state;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index de88c0fab961..ceb9012c9d70 100644
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
> @@ -328,17 +317,20 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
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
> @@ -347,7 +339,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	}
>  
>  	/* If input and output use same colorspace, do bypass mode */
> -	if (output_is_yuv == input_is_yuv)
> +	if (v4l2_is_format_yuv(src_finfo) && v4l2_is_format_yuv(dst_finfo))
>  		rzg2l_cru_write(cru, ICnMC,
>  				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
>  	else
> @@ -810,35 +802,15 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
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
> -
> -	fmt = rzg2l_cru_format_from_pixel(pix->pixelformat);
> +	const struct rzg2l_cru_ip_format *fmt;
>  
> +	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
>  	if (WARN_ON(!fmt))
> -		return -EINVAL;
> +		return 0;
>  
> -	return pix->width * fmt->bpp[0];
> +	return pix->width * fmt->bpp;
>  }
>  
>  static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
> @@ -849,7 +821,7 @@ static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
>  static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  				   struct v4l2_pix_format *pix)
>  {
> -	if (!rzg2l_cru_format_from_pixel(pix->pixelformat))
> +	if (!rzg2l_cru_ip_format_to_fmt(pix->pixelformat))
>  		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
>  
>  	switch (pix->field) {
> @@ -941,10 +913,13 @@ static int rzg2l_cru_g_fmt_vid_cap(struct file *file, void *priv,
>  static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
>  				      struct v4l2_fmtdesc *f)
>  {
> -	if (f->index >= ARRAY_SIZE(rzg2l_cru_formats))
> +	const struct rzg2l_cru_ip_format *fmt;
> +
> +	fmt = rzg2l_cru_ip_index_to_fmt(f->index);
> +	if (!fmt)
>  		return -EINVAL;
>  
> -	f->pixelformat = rzg2l_cru_formats[f->index].format;
> +	f->pixelformat = fmt->format;
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 

-- 
Regards,

Laurent Pinchart

