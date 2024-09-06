Return-Path: <linux-media+bounces-17833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B49C96FE7F
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 01:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E70DF285CE4
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 23:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7F015B54E;
	Fri,  6 Sep 2024 23:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a/G89qKC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC591B85FB;
	Fri,  6 Sep 2024 23:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725665554; cv=none; b=hOEwMiDvpP2dwQIuAyzju0MpHqlF1IIoCG/zRQnY6fYstXLlsU+hcDRsdGiEj/pdH3YhkbVKYY+gKFbRPnEsurzqu7FyOKqDVx+hfobP8dU9P1vjPnA+u05jWDbVdAaQzQLKZFd9fpZUVD/bUuVfRdH3cOgzWUMLGQCtqX8iOK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725665554; c=relaxed/simple;
	bh=9cJfH4NLc/qIUN2K8fFcxBg7BoHlDuzHVGZRVrUjwSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1vEOPQFPuGlakJEEe0n66nwOM6y+dYJa9Bioz9ujNlvsEGmmZXOkswiqh9yc0QnIOgRUcatWpMahXQoOYLwGhuySAhtNEXplYNZnrKOYh0fc0Zjecu/xxKmQmyVbziJe9Mu9q00wKTPQ/MRc02RDZpBy/81R2VgZqyIAXo9VnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a/G89qKC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8702C3D5;
	Sat,  7 Sep 2024 01:31:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725665475;
	bh=9cJfH4NLc/qIUN2K8fFcxBg7BoHlDuzHVGZRVrUjwSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/G89qKC0TVkmYZLF2bRjz+p3HCdQLJ1p11fVNZYiI30cD77JRhTUBYhd36D8GZ4n
	 As+s4XRHkg6zlTMVSImoJIVS2OXuosBdon099dBfa86U4REmq5KcLk/TBtiPWSRRp6
	 ltOpdNPqpBj5kKGoYiihLk5V/LHmpoNh8VjPoHwQ=
Date: Sat, 7 Sep 2024 02:32:27 +0300
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
Subject: Re: [PATCH 3/3] media: platform: rzg2l-cru: Add support to capture
 8bit raw sRGB
Message-ID: <20240906233227.GD12915@pendragon.ideasonboard.com>
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906173947.282402-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240906173947.282402-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, Sep 06, 2024 at 06:39:47PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support to capture 8bit Bayer formats.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  5 ++
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  7 ++-
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  9 +++-
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 51 ++++++++++++++++---
>  4 files changed, 61 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 174760239548..83c664cb0929 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -58,6 +58,11 @@ struct rzg2l_cru_ip {
>  	struct v4l2_subdev *remote;
>  };
>  
> +enum rzg2l_cru_fmt {
> +	RZG2L_YUV = 0,
> +	RZG2L_RAW_BAYER,
> +	RZG2L_USER_DEFINED,
> +};
>  /**
>   * struct rzg2l_cru_dev - Renesas CRU device structure
>   * @dev:		(OF) device
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index a7e4a0c109da..b14c92cd7c18 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -18,6 +18,7 @@
>  #include <linux/sys_soc.h>
>  #include <linux/units.h>
>  
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -188,7 +189,11 @@ struct rzg2l_csi2_format {
>  };
>  
>  static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
> -	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .datatype = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
> +	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
> +	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
> +	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
>  };
>  
>  static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index ac8ebae4ed07..5f60be92ea85 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/delay.h>
> +#include <media/mipi-csi2.h>

I would add a blank line on both sides.

>  #include "rzg2l-cru.h"
>  
>  struct rzg2l_cru_ip_format {
> @@ -15,7 +16,11 @@ struct rzg2l_cru_ip_format {
>  };
>  
>  static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
> -	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .datatype = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
> +	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
> +	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
> +	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
>  };
>  
>  enum rzg2l_csi2_pads {
> @@ -149,7 +154,7 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
>  	if (fse->index != 0)
>  		return -EINVAL;
>  
> -	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
> +	if (!rzg2l_cru_ip_code_to_fmt(fse->code))
>  		return -EINVAL;
>  
>  	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 6101a070e785..66a0b80e8da7 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -15,6 +15,7 @@
>  #include <linux/delay.h>
>  #include <linux/pm_runtime.h>
>  
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/videobuf2-dma-contig.h>
>  
> @@ -78,6 +79,7 @@
>  #define ICnMC				0x208
>  #define ICnMC_CSCTHR			BIT(5)
>  #define ICnMC_INF_YUV8_422		(0x1e << 16)
> +#define ICnMC_INF_RAW8			(0x2a << 16)
>  #define ICnMC_INF_USER			(0x30 << 16)

It looks like the INF field contains the MIPI data type. I would replace
this with

#define ICnMC_INF(x)			((x) << 16)

and use it as

	ICnMC_INF(MIPI_CSI2_DT_RAW8)

>  #define ICnMC_VCSEL(x)			((x) << 22)
>  #define ICnMC_INF_MASK			GENMASK(21, 16)
> @@ -203,6 +205,10 @@ static int rzg2l_cru_mc_validate_format(struct rzg2l_cru_dev *cru,
>  
>  	switch (fmt.format.code) {
>  	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
>  		break;
>  	default:
>  		return -EPIPE;
> @@ -300,7 +306,7 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
>  }
>  
> -static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
> +static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, enum rzg2l_cru_fmt *input_fmt,
>  				 struct v4l2_mbus_framefmt *ip_sd_fmt)
>  {
>  	u32 icnmc;
> @@ -308,11 +314,18 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
>  	switch (ip_sd_fmt->code) {
>  	case MEDIA_BUS_FMT_UYVY8_1X16:
>  		icnmc = ICnMC_INF_YUV8_422;
> -		*input_is_yuv = true;
> +		*input_fmt = RZG2L_YUV;
> +		break;
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		icnmc = ICnMC_INF_RAW8;
> +		*input_fmt = RZG2L_RAW_BAYER;
>  		break;
>  	default:
> -		*input_is_yuv = false;
>  		icnmc = ICnMC_INF_USER;
> +		*input_fmt = RZG2L_USER_DEFINED;
>  		break;
>  	}
>  
> @@ -327,17 +340,23 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
>  static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  					   struct v4l2_mbus_framefmt *ip_sd_fmt)
>  {
> -	bool output_is_yuv = false;
> -	bool input_is_yuv = false;
> +	enum rzg2l_cru_fmt input_fmt, output_fmt;
>  	u32 icndmr;
>  
> -	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt);
> +	rzg2l_cru_csi2_setup(cru, &input_fmt, ip_sd_fmt);
>  
>  	/* Output format */
>  	switch (cru->format.pixelformat) {
>  	case V4L2_PIX_FMT_UYVY:
>  		icndmr = ICnDMR_YCMODE_UYVY;
> -		output_is_yuv = true;
> +		output_fmt = RZG2L_YUV;
> +		break;
> +	case V4L2_PIX_FMT_SBGGR8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SRGGB8:
> +		icndmr = 0;
> +		output_fmt = RZG2L_RAW_BAYER;
>  		break;
>  	default:
>  		dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
> @@ -346,7 +365,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	}
>  
>  	/* If input and output use same colorspace, do bypass mode */
> -	if (output_is_yuv == input_is_yuv)
> +	if (input_fmt == output_fmt)
>  		rzg2l_cru_write(cru, ICnMC,
>  				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
>  	else
> @@ -809,6 +828,22 @@ static const struct v4l2_format_info rzg2l_cru_formats[] = {
>  		.format = V4L2_PIX_FMT_UYVY,
>  		.bpp[0] = 2,
>  	},
> +	{
> +		.format = V4L2_PIX_FMT_SBGGR8,
> +		.bpp[0] = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_SGBRG8,
> +		.bpp[0] = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_SGRBG8,
> +		.bpp[0] = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_SRGGB8,
> +		.bpp[0] = 1,
> +	},
>  };

I think all of this could be simplified if you add the format to the
rzg2l_cru_ip_format structure, as well as a rzg2l_cru_fmt member, and
used rzg2l_cru_ip_format through the driver.
rzg2l_cru_initialize_image_conv() would look up the rzg2l_cru_ip_format
entry based on the code, and would pass that to rzg2l_cru_csi2_setup(),
which wouldn't have to return an input_fmt. You could even add the
icndmr value to the structure too, to avoid a switch/case.

>  
>  const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format)

-- 
Regards,

Laurent Pinchart

