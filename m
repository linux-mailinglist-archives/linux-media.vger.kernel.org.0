Return-Path: <linux-media+bounces-18727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B07C988CFF
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 01:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54B1E1C2111F
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 23:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A263715E;
	Fri, 27 Sep 2024 23:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a2l+Wd1i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44C71FB3
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 23:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727479656; cv=none; b=mzVt6TZ0bR/o7U++96H8P5OEuIlhp6AB3nqRculELechkRuz+PbZG3JKIPh0hwwutTCKMUD2P6NM8Wn0QRqeqVSSLedtjoeVbiFxWa7diYP40jCu6S8HnQs1rfUNK3OOoHlGO/3mtwz3iKZFhJJYOrP+DAsc98WWa46xjy9KPzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727479656; c=relaxed/simple;
	bh=cOY/wGPKt5CHFDj2cP7HvNJi3ZLSQcRaxXwOfdbX0Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRB/OcoWsQpu/GxP8RnbKgc5sDZyzVpWnmcQihhr2eJRcSc4fagMnVrMMtrOs8VFGEFljbkEuRarPyPnuSa4Yz5agBrNu8qdf9Y6Vjk2ZZgj6KZqXqukRtFPewui8yG1qBv6ltggHpI0DtW1V18ukm4kll7nO6Fn+4/qrrdxMaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a2l+Wd1i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 452B79EC;
	Sat, 28 Sep 2024 01:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727479563;
	bh=cOY/wGPKt5CHFDj2cP7HvNJi3ZLSQcRaxXwOfdbX0Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2l+Wd1i9x7uPn8YUGw4++N2mNNUleTsvD+MgCPq8JowE+En+JRtkOkYuOb3fZmop
	 ATBooyTKUcP2QJBsPCPS/72E3sJabp+hYyhiRpYWgD7mH/FHQ7DBfPw7L/bQaViW/4
	 8wdhZuEQAhuz9xHJewSaJC6dAmE7yPHNLqJWDSSc=
Date: Sat, 28 Sep 2024 02:27:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 3/4] media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
Message-ID: <20240927232729.GR12322@pendragon.ideasonboard.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-4-dan.scally@ideasonboard.com>
 <OSZPR01MB7019254D2E2BC702CE6222ACAA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OSZPR01MB7019254D2E2BC702CE6222ACAA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>

On Fri, Sep 27, 2024 at 12:51:24PM +0000, Prabhakar Mahadev Lad wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> 
> > From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > 
> > Rather than open-code a calculation of the format's bytesperline and
> > sizeimage, use the v4l2_fill_pixfmt() helper. This makes it easier to
> > support the CRU packed pixel formats without over complicating the driver.
> > 
> > This change makes the .bpp member of struct rzg2l_cru_ip_format and the
> > rzg2l_cru_ip_pix_fmt_to_bpp() function superfluous - remove them both.
> > 
> > Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 16 --------------
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 21 ++-----------------
> >  3 files changed, 2 insertions(+), 38 deletions(-)
> >
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> This patch doesn't apply cleanly on top of media-stage + [0]
> 
> [0] https://lore.kernel.org/all/20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Is it fine with you to wait for v3 of your series and rebase this one on
top ?

> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index dc50a5feb3de..858098b8a13f 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -68,14 +68,12 @@ struct rzg2l_cru_ip {
> >   * @code: Media bus code
> >   * @format: 4CC format identifier (V4L2_PIX_FMT_*)
> >   * @datatype: MIPI CSI2 data type
> > - * @bpp: bytes per pixel
> >   * @icndmr: ICnDMR register value
> >   */
> >  struct rzg2l_cru_ip_format {
> >  	u32 code;
> >  	u32 format;
> >  	u32 datatype;
> > -	u8 bpp;
> >  	u32 icndmr;
> >  };
> > 
> > @@ -169,7 +167,6 @@ void rzg2l_cru_ip_subdev_unregister(struct
> > rzg2l_cru_dev *cru);  struct v4l2_mbus_framefmt
> > *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
> > 
> >  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int
> > code);
> > -u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format);  int
> > rzg2l_cru_ip_index_to_pix_fmt(u32 index);  int
> > rzg2l_cru_ip_pix_fmt_to_icndmr(u32 format);
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > index 9bb192655f25..f2fea3a63444 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > @@ -16,35 +16,30 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
> >  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> >  		.format = V4L2_PIX_FMT_UYVY,
> >  		.datatype = MIPI_CSI2_DT_YUV422_8B,
> > -		.bpp = 2,
> >  		.icndmr = ICnDMR_YCMODE_UYVY,
> >  	},
> >  	{
> >  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> >  		.format = V4L2_PIX_FMT_SBGGR8,
> >  		.datatype = MIPI_CSI2_DT_RAW8,
> > -		.bpp = 1,
> >  		.icndmr = 0,
> >  	},
> >  	{
> >  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> >  		.format = V4L2_PIX_FMT_SGBRG8,
> >  		.datatype = MIPI_CSI2_DT_RAW8,
> > -		.bpp = 1,
> >  		.icndmr = 0,
> >  	},
> >  	{
> >  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> >  		.format = V4L2_PIX_FMT_SGRBG8,
> >  		.datatype = MIPI_CSI2_DT_RAW8,
> > -		.bpp = 1,
> >  		.icndmr = 0,
> >  	},
> >  	{
> >  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> >  		.format = V4L2_PIX_FMT_SRGGB8,
> >  		.datatype = MIPI_CSI2_DT_RAW8,
> > -		.bpp = 1,
> >  		.icndmr = 0,
> >  	},
> >  };
> > @@ -60,17 +55,6 @@ const struct rzg2l_cru_ip_format
> > *rzg2l_cru_ip_code_to_fmt(unsigned int code)
> >  	return NULL;
> >  }
> > 
> > -u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format) -{
> > -	unsigned int i;
> > -
> > -	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
> > -		if (rzg2l_cru_ip_formats[i].format == format)
> > -			return rzg2l_cru_ip_formats[i].bpp;
> > -
> > -	return 0;
> > -}
> > -
> >  int rzg2l_cru_ip_index_to_pix_fmt(u32 index)  {
> >  	if (index >= ARRAY_SIZE(rzg2l_cru_ip_formats)) diff --git
> > a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 61e2f23053ee..01b39a2395df 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -800,27 +800,11 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev
> > *cru)
> >   * V4L2 stuff
> >   */
> > 
> > -static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix) -{
> > -	u8 bpp;
> > -
> > -	bpp = rzg2l_cru_ip_pix_fmt_to_bpp(pix->pixelformat);
> > -
> > -	if (WARN_ON(!bpp))
> > -		return 0;
> > -
> > -	return pix->width * bpp;
> > -}
> > -
> > -static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix) -{
> > -	return pix->bytesperline * pix->height;
> > -}
> > 
> >  static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
> >  				   struct v4l2_pix_format *pix)
> >  {
> > -	if (!rzg2l_cru_ip_pix_fmt_to_bpp(pix->pixelformat))
> > +	if (rzg2l_cru_ip_pix_fmt_to_icndmr(pix->pixelformat) < 0)
> >  		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
> > 
> >  	switch (pix->field) {
> > @@ -840,8 +824,7 @@ static void rzg2l_cru_format_align(struct
> > rzg2l_cru_dev *cru,
> >  	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH,
> > 1,
> >  			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2,
> > 0);
> > 
> > -	pix->bytesperline = rzg2l_cru_format_bytesperline(pix);
> > -	pix->sizeimage = rzg2l_cru_format_sizeimage(pix);
> > +	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
> > 
> >  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
> >  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);

-- 
Regards,

Laurent Pinchart

