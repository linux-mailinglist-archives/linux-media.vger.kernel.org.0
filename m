Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A6D85C98
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 10:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731996AbfHHIPM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 04:15:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50514 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731592AbfHHIPL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 04:15:11 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3B4BCC;
        Thu,  8 Aug 2019 10:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565252109;
        bh=NxaHzWpBJn9m5BgpAncvqk7gfKUP5iYYoCV7jyznrfM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pKHXRmZ3MMocBLGc4tHLh5TgYmP7437N0mlqrec9JtAMDizWM2rVb4+KG4mUMf1DU
         E3z7ifWbEp6on81bi4g+Z3a7NgVt9VOLXNut20MpPlBvNTTemOTi6a7UwJFDExxpsa
         l04au1kTX+T4824WKH8FHzZaOkYBJDCKFhPXFMUE=
Date:   Thu, 8 Aug 2019 11:15:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rcar-vin: Report correct image stride
Message-ID: <20190808081506.GB6055@pendragon.ideasonboard.com>
References: <20190808051058.3210-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190808051058.3210-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, Aug 08, 2019 at 07:10:58AM +0200, Niklas Söderlund wrote:
> The image stride was adjusted when it was written to hardware and not
> when configuring the format. Calculate the correct stride value and
> report it to userspace.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 10 ++++++----
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  5 ++++-
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index f16f2966f9628b72..3cb29b2e0b2b18a9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -577,6 +577,9 @@ static void rvin_crop_scale_comp_gen2(struct rvin_dev *vin)
>  
>  void rvin_crop_scale_comp(struct rvin_dev *vin)
>  {
> +	const struct rvin_video_format *fmt;
> +	u32 stride;
> +
>  	/* Set Start/End Pixel/Line Pre-Clip */
>  	rvin_write(vin, vin->crop.left, VNSPPRC_REG);
>  	rvin_write(vin, vin->crop.left + vin->crop.width - 1, VNEPPRC_REG);
> @@ -600,10 +603,9 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  	if (vin->info->model != RCAR_GEN3)
>  		rvin_crop_scale_comp_gen2(vin);
>  
> -	if (vin->format.pixelformat == V4L2_PIX_FMT_NV16)
> -		rvin_write(vin, ALIGN(vin->format.width, 0x20), VNIS_REG);
> -	else
> -		rvin_write(vin, ALIGN(vin->format.width, 0x10), VNIS_REG);
> +	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);

You may want as an optimisation to cache the active rvin_video_format
pointer in rvin_dev, but that can be done in a separate patch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	stride = vin->format.bytesperline / fmt->bpp;
> +	rvin_write(vin, stride, VNIS_REG);
>  }
>  
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index cfed0a2604133849..cbc1c07f0a9631a4 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -83,13 +83,16 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
>  				    struct v4l2_pix_format *pix)
>  {
>  	const struct rvin_video_format *fmt;
> +	u32 align;
>  
>  	fmt = rvin_format_from_pixel(vin, pix->pixelformat);
>  
>  	if (WARN_ON(!fmt))
>  		return -EINVAL;
>  
> -	return pix->width * fmt->bpp;
> +	align = pix->pixelformat == V4L2_PIX_FMT_NV16 ? 0x20 : 0x10;
> +
> +	return ALIGN(pix->width, align) * fmt->bpp;
>  }
>  
>  static u32 rvin_format_sizeimage(struct v4l2_pix_format *pix)

-- 
Regards,

Laurent Pinchart
