Return-Path: <linux-media+bounces-18514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794929847FA
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 16:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CD771C22D7C
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 14:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7751E1AAE1A;
	Tue, 24 Sep 2024 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b67ia4KP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5087E1B85F0
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189220; cv=none; b=BiUWcSMwOzJez0rBtZyLq+eHbW0rFmVx1mQ9ppog9ORq8Hhe6SlT1RaY/WRbcMoydqJXN0qxET/Cavcw/RjpUIkPfcCm50LBv0IjJ08fErINGpNCpk0Qfr07wsG15zbkxmFepQ9PB7z4xH6S4yL9tS1n49YFQuhkx7cbRZgLnRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189220; c=relaxed/simple;
	bh=G+BfhSKJJXqvRJhaoMU0G5zan6R9osH/KqBn5UGPx6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaWzEsaloJ/IzHtoDRgiCfanGUx4xSpC886JkkBcR7GG9lAlc/2nm2XLjVMPFacxkfwwfH1pA+MtGnIcnaAM/ZBlGsIhMWsQ0c4eDtXFDvDtFpP5xGPNJBcO1oN5bWZ08NmksztDSIyArEdjP0okIkZXnOOSEhdoUDhvCZyLJ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b67ia4KP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9C4BA8F;
	Tue, 24 Sep 2024 16:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727189130;
	bh=G+BfhSKJJXqvRJhaoMU0G5zan6R9osH/KqBn5UGPx6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b67ia4KPJEg2Qph9viJEfxm9YqVhITYkVE6JG2MrJ/KCpd7oXhxpkiYe5wu0KKgPr
	 TUj5kP7ammCH24Y5NTAHGsR9xgpgckHZuan5Hq5BaiTV40csCj1NtdzFeiNponwwVz
	 H+Vf8yt07kzk6P2e9WHslgy3OCfZIVH60G5D5UIA=
Date: Tue, 24 Sep 2024 17:46:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/4] media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
Message-ID: <20240924144625.GF20255@pendragon.ideasonboard.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-4-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920124115.375748-4-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Fri, Sep 20, 2024 at 01:41:14PM +0100, Daniel Scally wrote:
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> 
> Rather than open-code a calculation of the format's bytesperline
> and sizeimage, use the v4l2_fill_pixfmt() helper. This makes it
> easier to support the CRU packed pixel formats without over
> complicating the driver.
> 
> This change makes the .bpp member of struct rzg2l_cru_ip_format and
> the rzg2l_cru_ip_pix_fmt_to_bpp() function superfluous - remove them
> both.
> 
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 ---
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 16 --------------
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 21 ++-----------------
>  3 files changed, 2 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index dc50a5feb3de..858098b8a13f 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -68,14 +68,12 @@ struct rzg2l_cru_ip {
>   * @code: Media bus code
>   * @format: 4CC format identifier (V4L2_PIX_FMT_*)
>   * @datatype: MIPI CSI2 data type
> - * @bpp: bytes per pixel
>   * @icndmr: ICnDMR register value
>   */
>  struct rzg2l_cru_ip_format {
>  	u32 code;
>  	u32 format;
>  	u32 datatype;
> -	u8 bpp;
>  	u32 icndmr;
>  };
>  
> @@ -169,7 +167,6 @@ void rzg2l_cru_ip_subdev_unregister(struct rzg2l_cru_dev *cru);
>  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
>  
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
> -u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format);
>  int rzg2l_cru_ip_index_to_pix_fmt(u32 index);
>  int rzg2l_cru_ip_pix_fmt_to_icndmr(u32 format);
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 9bb192655f25..f2fea3a63444 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -16,35 +16,30 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>  		.format = V4L2_PIX_FMT_UYVY,
>  		.datatype = MIPI_CSI2_DT_YUV422_8B,
> -		.bpp = 2,
>  		.icndmr = ICnDMR_YCMODE_UYVY,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.format = V4L2_PIX_FMT_SBGGR8,
>  		.datatype = MIPI_CSI2_DT_RAW8,
> -		.bpp = 1,
>  		.icndmr = 0,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.format = V4L2_PIX_FMT_SGBRG8,
>  		.datatype = MIPI_CSI2_DT_RAW8,
> -		.bpp = 1,
>  		.icndmr = 0,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.format = V4L2_PIX_FMT_SGRBG8,
>  		.datatype = MIPI_CSI2_DT_RAW8,
> -		.bpp = 1,
>  		.icndmr = 0,
>  	},
>  	{
>  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.format = V4L2_PIX_FMT_SRGGB8,
>  		.datatype = MIPI_CSI2_DT_RAW8,
> -		.bpp = 1,
>  		.icndmr = 0,
>  	},
>  };
> @@ -60,17 +55,6 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
>  	return NULL;
>  }
>  
> -u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
> -		if (rzg2l_cru_ip_formats[i].format == format)
> -			return rzg2l_cru_ip_formats[i].bpp;
> -
> -	return 0;
> -}
> -
>  int rzg2l_cru_ip_index_to_pix_fmt(u32 index)
>  {
>  	if (index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 61e2f23053ee..01b39a2395df 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -800,27 +800,11 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
>   * V4L2 stuff
>   */
>  
> -static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
> -{
> -	u8 bpp;
> -
> -	bpp = rzg2l_cru_ip_pix_fmt_to_bpp(pix->pixelformat);
> -
> -	if (WARN_ON(!bpp))
> -		return 0;
> -
> -	return pix->width * bpp;
> -}
> -
> -static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
> -{
> -	return pix->bytesperline * pix->height;
> -}
>  
>  static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  				   struct v4l2_pix_format *pix)
>  {
> -	if (!rzg2l_cru_ip_pix_fmt_to_bpp(pix->pixelformat))
> +	if (rzg2l_cru_ip_pix_fmt_to_icndmr(pix->pixelformat) < 0)
>  		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
>  
>  	switch (pix->field) {
> @@ -840,8 +824,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH, 1,
>  			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
>  
> -	pix->bytesperline = rzg2l_cru_format_bytesperline(pix);
> -	pix->sizeimage = rzg2l_cru_format_sizeimage(pix);
> +	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
>  
>  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
>  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);

-- 
Regards,

Laurent Pinchart

