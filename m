Return-Path: <linux-media+bounces-19054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC49A98F186
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 16:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4B921C21409
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 14:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9412819F403;
	Thu,  3 Oct 2024 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NsIRBGCo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73119D07D;
	Thu,  3 Oct 2024 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727966084; cv=none; b=inBowz2gRNFl7iQomC0J2CtioKHWhIriUwvih1LOGqQAkRQ318uEE3/3dFRyPRJgHPCXGH458P2FSn/bgTjtqW8khttD3Dis84sjGb8htoqVKxkAQpJ8FRylM8IiSoAXdxgAxj9K44bL2WIFcXBjVAgu1kEhMzk4Pjku/wdvpws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727966084; c=relaxed/simple;
	bh=BHou78AvHykmKnBl7C+X621r8zN34SA2C5+dMQrkKH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpqwubUUkNm7OTcrNVXZgEO/OxwpgoiYOXlBBtroUbPpM/1+PwSjoRsJIFoqV4dus6QkazPv1fq5r6ydOeNo4rr7//+3U9cEa9o82NeyqAqdyHQQGKo6StWMC4jQMG2imIDKVQJzM4MbD76jgxyQbgdsCHYD689J+vcTszgpYIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NsIRBGCo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B39318D;
	Thu,  3 Oct 2024 16:33:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727965987;
	bh=BHou78AvHykmKnBl7C+X621r8zN34SA2C5+dMQrkKH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsIRBGCo64jJClZm8+pzLPHVcIXXQ5ej3BG6VHoFB9jQNcnPt4CaMkcWsrhaEh24/
	 QMXv691NTEEQztmiGznjoc4ufxQ8LcyImWVSaV+sCgc9/vG32ZplcmJx2l7R5fw1j2
	 3m1GhRwCcZunJgQSSthSQkJPw/K2xQCUx6ncjvGM=
Date: Thu, 3 Oct 2024 17:34:37 +0300
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
Subject: Re: [PATCH v3 15/17] media: rzg2l-cru: Refactor ICnDMR register
 configuration
Message-ID: <20241003143437.GD5468@pendragon.ideasonboard.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241001140919.206139-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001140919.206139-16-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Oct 01, 2024 at 03:09:17PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Refactor the ICnDMR register configuration in
> `rzg2l_cru_initialize_image_conv()` by adding a new member `icndmr` in the
> `rzg2l_cru_ip_format` structure.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Updated subject line and commit message
> - Re-used rzg2l_cru_ip_format_to_fmt() to fetch icndmr details
> - Collected RB tag
> 
> v1->v2
> - New patch
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  4 ++++
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |  1 +
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 10 ++++------
>  3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 39296a59b3da..51206373b7fe 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -31,6 +31,8 @@
>  #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
>  #define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
>  
> +#define ICnDMR_YCMODE_UYVY		(1 << 4)
> +
>  enum rzg2l_csi2_pads {
>  	RZG2L_CRU_IP_SINK = 0,
>  	RZG2L_CRU_IP_SOURCE,
> @@ -68,12 +70,14 @@ struct rzg2l_cru_ip {
>   * @format: 4CC format identifier (V4L2_PIX_FMT_*)
>   * @datatype: MIPI CSI2 data type
>   * @bpp: bytes per pixel
> + * @icndmr: ICnDMR register value
>   */
>  struct rzg2l_cru_ip_format {
>  	u32 code;
>  	u32 format;
>  	u32 datatype;
>  	u8 bpp;
> +	u32 icndmr;
>  };
>  
>  /**
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 6ce077ab42e2..f14ac949cc64 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -17,6 +17,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  		.format = V4L2_PIX_FMT_UYVY,
>  		.datatype = MIPI_CSI2_DT_YUV422_8B,
>  		.bpp = 2,
> +		.icndmr = ICnDMR_YCMODE_UYVY,
>  	},
>  };
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index c6c82b9b130a..c3d10b001b7c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -88,7 +88,6 @@
>  
>  /* CRU Data Output Mode Register */
>  #define ICnDMR				0x26c
> -#define ICnDMR_YCMODE_UYVY		(1 << 4)
>  
>  #define RZG2L_TIMEOUT_MS		100
>  #define RZG2L_RETRIES			10
> @@ -278,6 +277,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  					   u8 csi_vc)
>  {
>  	const struct v4l2_format_info *src_finfo, *dst_finfo;
> +	const struct rzg2l_cru_ip_format *cru_video_fmt;
>  	const struct rzg2l_cru_ip_format *cru_ip_fmt;
>  	u32 icndmr;
>  
> @@ -288,15 +288,13 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	dst_finfo = v4l2_format_info(cru->format.pixelformat);
>  
>  	/* Output format */
> -	switch (cru->format.pixelformat) {
> -	case V4L2_PIX_FMT_UYVY:
> -		icndmr = ICnDMR_YCMODE_UYVY;
> -		break;
> -	default:
> +	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
> +	if (!cru_video_fmt) {
>  		dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
>  			cru->format.pixelformat);
>  		return -EINVAL;
>  	}
> +	icndmr = cru_video_fmt->icndmr;

I think you can drop the icndmr local variable and write below

	/* Set output data format */
	rzg2l_cru_write(cru, ICnDMR, cru_video_fmt->icndmr);

With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	/* If input and output use same colorspace, do bypass mode */
>  	if (v4l2_is_format_yuv(src_finfo) && v4l2_is_format_yuv(dst_finfo))

-- 
Regards,

Laurent Pinchart

