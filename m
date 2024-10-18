Return-Path: <linux-media+bounces-19911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8879A48B6
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 23:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 799F728305C
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 21:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A17918E37C;
	Fri, 18 Oct 2024 21:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iuy0Ywur"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B6213541B;
	Fri, 18 Oct 2024 21:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729285718; cv=none; b=gFv1Z1sXqMq3cr3maWqbQT1o4In6L8LFH9woHz4Hv+VcXb/lbJTXjTwTNP2M2rExlZvgDcuDEYqN/+Px6xwBeBUPp4Izy2/jbRkv/bUftb7O7OpYQMvvM2li5Pb334nqR10NhE47XKnkN8wy+19BYD2NVNLm+ZhV2M8OrMbM7Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729285718; c=relaxed/simple;
	bh=SvKt67n2zji81Um2vUUrt/85YdAkt079QTWL93keV8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBBOygSw3eU2VO4lCBqqPPOQLqZLfoN2VK8ITdbVjZfbpwDZ1NOk9V5sqV0Uy6Eb6w/iqqWouQqIuJXbzC8+Ycp6dP4Mro22bYhjbv8bEsliVXIvoA6YHjiBlTUyAyL4MtoUAgiUIKQMfUeS6Ks+spIuhluI0bhbyrtKoO9bQM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iuy0Ywur; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2339C268;
	Fri, 18 Oct 2024 23:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729285610;
	bh=SvKt67n2zji81Um2vUUrt/85YdAkt079QTWL93keV8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iuy0YwurjR5qcNZlG8GYF/Z2J8r36u0HLZ6aJx7471/9BDVtLCjcqjgzEeAxXVy+b
	 6o8gQ6u9za+23VrEjsPYHkCY0rRHrVIwi/kXXi1Ew2EBfP4vkD/Slf5f7ymXcXZKMa
	 53SLTdf7ijbex049MP94tKIjJqshO9A17kWCSVNw=
Date: Sat, 19 Oct 2024 00:08:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 23/23] media: renesas: rzg2l-cru: Add 'yuv' flag to IP
 format structure
Message-ID: <20241018210828.GA13357@pendragon.ideasonboard.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241018133446.223516-24-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018133446.223516-24-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, Oct 18, 2024 at 02:34:46PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a 'yuv' flag to the `rzg2l_cru_ip_format` structure to indicate
> whether a given format is YUV-based and update the `rzg2l_cru_ip_formats`
> array with this flag appropriately. This change enables a more efficient
> way to check if the input and output formats use the same colorspace.
> 
> With this change, we can eliminate the use of `v4l2_format_info()` in
> `rzg2l_cru_initialize_image_conv()` as the necessary details for the source
> and destination formats are already available through the `yuv` flag.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 ++
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c    | 5 +++++
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 6 +-----
>  3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index a83e78d9b0be..8b898ce05b84 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -69,6 +69,7 @@ struct rzg2l_cru_ip {
>   * @format: 4CC format identifier (V4L2_PIX_FMT_*)
>   * @icndmr: ICnDMR register value
>   * @bpp: bytes per pixel
> + * @yuv: Flag to indicate whether the format is YUV-based.
>   */
>  struct rzg2l_cru_ip_format {
>  	u32 code;
> @@ -76,6 +77,7 @@ struct rzg2l_cru_ip_format {
>  	u32 format;
>  	u32 icndmr;
>  	u8 bpp;
> +	bool yuv;
>  };
>  
>  /**
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index d935d981f9d3..76a2b451f1da 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -18,6 +18,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  		.format = V4L2_PIX_FMT_UYVY,
>  		.bpp = 2,
>  		.icndmr = ICnDMR_YCMODE_UYVY,
> +		.yuv = true,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> @@ -25,6 +26,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  		.datatype = MIPI_CSI2_DT_RAW8,
>  		.bpp = 1,
>  		.icndmr = 0,
> +		.yuv = false,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> @@ -32,6 +34,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  		.datatype = MIPI_CSI2_DT_RAW8,
>  		.bpp = 1,
>  		.icndmr = 0,
> +		.yuv = false,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> @@ -39,6 +42,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  		.datatype = MIPI_CSI2_DT_RAW8,
>  		.bpp = 1,
>  		.icndmr = 0,
> +		.yuv = false,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> @@ -46,6 +50,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  		.datatype = MIPI_CSI2_DT_RAW8,
>  		.bpp = 1,
>  		.icndmr = 0,
> +		.yuv = false,
>  	},
>  };
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index a4dc3689599c..e980afc32504 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -210,7 +210,6 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  					   struct v4l2_mbus_framefmt *ip_sd_fmt,
>  					   u8 csi_vc)
>  {
> -	const struct v4l2_format_info *src_finfo, *dst_finfo;
>  	const struct rzg2l_cru_ip_format *cru_video_fmt;
>  	const struct rzg2l_cru_ip_format *cru_ip_fmt;
>  
> @@ -225,11 +224,8 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  		return -EINVAL;
>  	}
>  
> -	src_finfo = v4l2_format_info(cru_ip_fmt->format);
> -	dst_finfo = v4l2_format_info(cru->format.pixelformat);
> -
>  	/* If input and output use same colorspace, do bypass mode */
> -	if (v4l2_is_format_yuv(src_finfo) == v4l2_is_format_yuv(dst_finfo))
> +	if (cru_ip_fmt->yuv == cru_video_fmt->yuv)
>  		rzg2l_cru_write(cru, ICnMC,
>  				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
>  	else

-- 
Regards,

Laurent Pinchart

