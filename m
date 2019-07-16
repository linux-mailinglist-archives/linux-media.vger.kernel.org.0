Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 709A06A9DB
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 15:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbfGPNs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 09:48:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45466 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfGPNsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 09:48:55 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A808564;
        Tue, 16 Jul 2019 15:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1563284933;
        bh=hxxXMhlCevwJFXTVudIYyt0zSjnVVcpzeLvnnyEvgb8=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=MctwP8rtLiOEkRdlueeEYj6m3JZOxV3HOQTrXuhSYr4LDHQoxfXD6CS/22A1mcxLM
         c45a5iFw3D/w8apNqF9L/6LgKv4qkPiMoT4aJ+RTyR7Z8q57LgPAfFON/F0y4XhEIj
         mrqnz4DS3twEGo7/hf/uHEEA+xZdV9aVoWjXU2Wg=
Subject: Re: [PATCH] rcar-vin: Centralize black listing of pixel formats
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190705044350.22766-1-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <186f4a20-023c-dd39-82b0-991439171ee7@ideasonboard.com>
Date:   Tue, 16 Jul 2019 14:48:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705044350.22766-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 05/07/2019 05:43, Niklas Söderlund wrote:
> Instead of scattering black listing of pixel formats who are not
> supported on particular platforms move it to a central location.

I'd write this as:

The rcar-vin on the M1 platform lacks support for XBGR32 and this is
guarded against in multiple locations.

Centralise the format restriction by allowing the
rvin_format_from_pixel() function to inspect the current platform and
return a null pointer for unsupported formats.


> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Otherwise,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  |  2 +-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 23 +++++++++++----------
>  drivers/media/platform/rcar-vin/rcar-vin.h  |  4 +++-
>  3 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 91ab064404a185af..372d6b106b9970d2 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -794,7 +794,7 @@ static void rvin_set_slot_addr(struct rvin_dev *vin, int slot, dma_addr_t addr)
>  	int offsetx, offsety;
>  	dma_addr_t offset;
>  
> -	fmt = rvin_format_from_pixel(vin->format.pixelformat);
> +	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
>  
>  	/*
>  	 * There is no HW support for composition do the beast we can
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 0936bcd98df1f75d..04d798d8070f912c 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -56,10 +56,14 @@ static const struct rvin_video_format rvin_formats[] = {
>  	},
>  };
>  
> -const struct rvin_video_format *rvin_format_from_pixel(u32 pixelformat)
> +const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
> +						       u32 pixelformat)
>  {
>  	int i;
>  
> +	if (vin->info->model == RCAR_M1 && pixelformat == V4L2_PIX_FMT_XBGR32)
> +		return NULL;
> +
>  	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++)
>  		if (rvin_formats[i].fourcc == pixelformat)
>  			return rvin_formats + i;
> @@ -67,11 +71,12 @@ const struct rvin_video_format *rvin_format_from_pixel(u32 pixelformat)
>  	return NULL;
>  }
>  
> -static u32 rvin_format_bytesperline(struct v4l2_pix_format *pix)
> +static u32 rvin_format_bytesperline(struct rvin_dev *vin,
> +				    struct v4l2_pix_format *pix)
>  {
>  	const struct rvin_video_format *fmt;
>  
> -	fmt = rvin_format_from_pixel(pix->pixelformat);
> +	fmt = rvin_format_from_pixel(vin, pix->pixelformat);
>  
>  	if (WARN_ON(!fmt))
>  		return -EINVAL;
> @@ -91,9 +96,7 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
>  {
>  	u32 walign;
>  
> -	if (!rvin_format_from_pixel(pix->pixelformat) ||
> -	    (vin->info->model == RCAR_M1 &&
> -	     pix->pixelformat == V4L2_PIX_FMT_XBGR32))
> +	if (!rvin_format_from_pixel(vin, pix->pixelformat))
>  		pix->pixelformat = RVIN_DEFAULT_FORMAT;
>  
>  	switch (pix->field) {
> @@ -125,7 +128,7 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
>  	v4l_bound_align_image(&pix->width, 2, vin->info->max_width, walign,
>  			      &pix->height, 4, vin->info->max_height, 2, 0);
>  
> -	pix->bytesperline = rvin_format_bytesperline(pix);
> +	pix->bytesperline = rvin_format_bytesperline(vin, pix);
>  	pix->sizeimage = rvin_format_sizeimage(pix);
>  
>  	vin_dbg(vin, "Format %ux%u bpl: %u size: %u\n",
> @@ -181,9 +184,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  	if (pad_cfg == NULL)
>  		return -ENOMEM;
>  
> -	if (!rvin_format_from_pixel(pix->pixelformat) ||
> -	    (vin->info->model == RCAR_M1 &&
> -	     pix->pixelformat == V4L2_PIX_FMT_XBGR32))
> +	if (!rvin_format_from_pixel(vin, pix->pixelformat))
>  		pix->pixelformat = RVIN_DEFAULT_FORMAT;
>  
>  	v4l2_fill_mbus_format(&format.format, pix, vin->mbus_code);
> @@ -384,7 +385,7 @@ static int rvin_s_selection(struct file *file, void *fh,
>  		while ((r.top * vin->format.bytesperline) & HW_BUFFER_MASK)
>  			r.top--;
>  
> -		fmt = rvin_format_from_pixel(vin->format.pixelformat);
> +		fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
>  		while ((r.left * fmt->bpp) & HW_BUFFER_MASK)
>  			r.left--;
>  
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index 0b13b34d03e3dce4..ac1a6fe90015ed69 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -260,7 +260,9 @@ void rvin_dma_unregister(struct rvin_dev *vin);
>  int rvin_v4l2_register(struct rvin_dev *vin);
>  void rvin_v4l2_unregister(struct rvin_dev *vin);
>  
> -const struct rvin_video_format *rvin_format_from_pixel(u32 pixelformat);
> +const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
> +						       u32 pixelformat);
> +
>  
>  /* Cropping, composing and scaling */
>  void rvin_crop_scale_comp(struct rvin_dev *vin);
> 

