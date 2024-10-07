Return-Path: <linux-media+bounces-19191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAB399381A
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 22:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9512E1F2237A
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BF31DE4E9;
	Mon,  7 Oct 2024 20:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YygHHYdA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CF31DE4D3;
	Mon,  7 Oct 2024 20:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728332505; cv=none; b=iRK1tOdw7YhkCNgzcq1XpkKmLwyNXyeggWaYgIt1AbN+id8jGSwbk53dGbEkQSiF/tuzUT26/SslXuUNRILA5vbiBHUv3JmO722rKpmTfnq8ePAXpKwl+WoNpLLFXYSyNLsEz3MVJzcGkTVuOiHna3+g7/9+Dmw1d7g64UFteOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728332505; c=relaxed/simple;
	bh=Ob+W0OpfiPXT/RLK3EV+M7HNJhR1KOSyXwZB67F02yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWzA5chi0l5YohgUvz7VCLgmIUMwKkb1kS2ON7fNP//ODdzyBSecPXb6nc9g99dp12FHW4PrvMS1yJ+vkkbs+wRDW9SrAQym81+HtQH7N5ucDKt8GKyBJIGReccgl6IxDnNMI4yGwHFTe0qMYh7UtouQayIdwQFu6yx8E9b0ngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YygHHYdA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07CEA2EC;
	Mon,  7 Oct 2024 22:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728332406;
	bh=Ob+W0OpfiPXT/RLK3EV+M7HNJhR1KOSyXwZB67F02yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YygHHYdAOxRYls13j+pBckd7M16lZRMOa5QPkVmENQh7iFvM6izYmWYc56161c8xZ
	 mQ5qAjrufx7/bgMJtvtR5wP78YCHl2QeuTj8EziRUgEEQYlLqTfQTds2TdxrWcRfPd
	 dv7iDbY+Z6HSQ52E+3CUJ9k9p0ginNbEAPT02e7U=
Date: Mon, 7 Oct 2024 23:21:37 +0300
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
Subject: Re: [PATCH v4 10/17] media: rzg2l-cru: Simplify handling of
 supported formats
Message-ID: <20241007202137.GK14766@pendragon.ideasonboard.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241007184839.190519-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007184839.190519-11-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Mon, Oct 07, 2024 at 07:48:32PM +0100, Prabhakar wrote:
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

The general rule is once change, one patch. Bundling multiple changes
together makes review more difficult. A bullet list of changes in a
commit message is a sign you're bundling too many changed together.

You can still group related changes together when it makes sensor. For
instance moving rzg2l_cru_ip_format to rzg2l-cru.h and adding the
rzg2l_cru_ip_code_to_fmt() & co helper functions can be one patch.

> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    | 20 +++++-
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 36 ++++++++--
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 67 ++++++-------------
>  3 files changed, 69 insertions(+), 54 deletions(-)
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
> index 7b006a0bfaae..fde6f4781cfb 100644
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
> @@ -27,6 +31,26 @@ static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int c
>  	return NULL;
>  }
>  
> +const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
> +		if (rzg2l_cru_ip_formats[i].format == format)
> +			return &rzg2l_cru_ip_formats[i];
> +	}
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

I would pass the rzg2l_cru_ip_format pointer (make it const) to this
function instead of csi2_datatype.

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

I think this should be

	if (v4l2_is_format_yuv(src_finfo) == v4l2_is_format_yuv(dst_finfo))

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

This change isn't described in the commit message. 

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

Here you're calling rzg2l_cru_ip_format_to_fmt(), and just below the
function calls rzg2l_cru_format_bytesperline(), which calls
rzg2l_cru_format_from_pixel() again. Store the pointer here, drop the
rzg2l_cru_format_bytesperline() function, and just write

	pix->bytesperline = pix->width * fmt->bpp;

below. I would also inline rzg2l_cru_format_sizeimage() in this function
as there's a single caller.

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

-- 
Regards,

Laurent Pinchart

