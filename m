Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D19EAD0F7
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 00:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731010AbfIHWOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Sep 2019 18:14:36 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:50548 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfIHWOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Sep 2019 18:14:35 -0400
Received: from penelope.horms.nl (195-23-252-147.net.novis.pt [195.23.252.147])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ABF5725B7AD;
        Mon,  9 Sep 2019 08:14:27 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id ED798E212E7; Sun,  8 Sep 2019 14:14:22 +0200 (CEST)
Date:   Sun, 8 Sep 2019 13:14:22 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] rcar-vin: Add support for outputting NV12
Message-ID: <20190908121422.ofa25gm3gm5gtwr4@verge.net.au>
References: <20190906144029.24080-1-niklas.soderlund+renesas@ragnatech.se>
 <20190906144029.24080-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190906144029.24080-3-niklas.soderlund+renesas@ragnatech.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 06, 2019 at 04:40:29PM +0200, Niklas Söderlund wrote:
> Most Gen3 boards can output frames in NV12 format, add support for this
> with a runtime check that the running hardware support it.

nit: s/support/supports/

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  |  5 ++-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 39 +++++++++++++++++----
>  2 files changed, 37 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 3cb29b2e0b2b18a9..0edae4181cdda9fe 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -118,6 +118,7 @@
>  #define VNDMR_ABIT		(1 << 2)
>  #define VNDMR_DTMD_YCSEP	(1 << 1)
>  #define VNDMR_DTMD_ARGB		(1 << 0)
> +#define VNDMR_DTMD_YCSEP_420	(3 << 0)
>  
>  /* Video n Data Mode Register 2 bits */
>  #define VNDMR2_VPS		(1 << 30)
> @@ -710,11 +711,13 @@ static int rvin_setup(struct rvin_dev *vin)
>  	 * Output format
>  	 */
>  	switch (vin->format.pixelformat) {
> +	case V4L2_PIX_FMT_NV12:
>  	case V4L2_PIX_FMT_NV16:
>  		rvin_write(vin,
>  			   ALIGN(vin->format.width * vin->format.height, 0x80),
>  			   VNUVAOF_REG);
> -		dmr = VNDMR_DTMD_YCSEP;
> +		dmr = vin->format.pixelformat == V4L2_PIX_FMT_NV12 ?
> +			VNDMR_DTMD_YCSEP_420 : VNDMR_DTMD_YCSEP;
>  		output_is_yuv = true;
>  		break;
>  	case V4L2_PIX_FMT_YUYV:
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index ba08f6c49956e899..51df827d91bc0ef3 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -30,6 +30,10 @@
>   */
>  
>  static const struct rvin_video_format rvin_formats[] = {
> +	{
> +		.fourcc			= V4L2_PIX_FMT_NV12,
> +		.bpp			= 1,
> +	},
>  	{
>  		.fourcc			= V4L2_PIX_FMT_NV16,
>  		.bpp			= 1,
> @@ -72,6 +76,9 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
>  	if (vin->info->model == RCAR_M1 && pixelformat == V4L2_PIX_FMT_XBGR32)
>  		return NULL;
>  
> +	if (pixelformat == V4L2_PIX_FMT_NV12 && !vin->info->nv12)
> +		return NULL;
> +
>  	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++)
>  		if (rvin_formats[i].fourcc == pixelformat)
>  			return rvin_formats + i;
> @@ -90,17 +97,29 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
>  	if (WARN_ON(!fmt))
>  		return -EINVAL;
>  
> -	align = pix->pixelformat == V4L2_PIX_FMT_NV16 ? 0x20 : 0x10;
> +	switch (pix->pixelformat) {
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV16:
> +		align = 0x20;
> +		break;
> +	default:
> +		align = 0x10;
> +		break;
> +	}
>  
>  	return ALIGN(pix->width, align) * fmt->bpp;
>  }
>  
>  static u32 rvin_format_sizeimage(struct v4l2_pix_format *pix)
>  {
> -	if (pix->pixelformat == V4L2_PIX_FMT_NV16)
> +	switch (pix->pixelformat) {
> +	case V4L2_PIX_FMT_NV12:
> +		return pix->bytesperline * pix->height * 3 / 2;
> +	case V4L2_PIX_FMT_NV16:
>  		return pix->bytesperline * pix->height * 2;
> -
> -	return pix->bytesperline * pix->height;
> +	default:
> +		return pix->bytesperline * pix->height;
> +	}
>  }
>  
>  static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
> @@ -132,8 +151,16 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
>  		break;
>  	}
>  
> -	/* HW limit width to a multiple of 32 (2^5) for NV16 else 2 (2^1) */
> -	walign = vin->format.pixelformat == V4L2_PIX_FMT_NV16 ? 5 : 1;
> +	/* HW limit width to a multiple of 32 (2^5) for NV12/16 else 2 (2^1) */
> +	switch (vin->format.pixelformat) {
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV16:
> +		walign = 5;
> +		break;
> +	default:
> +		walign = 1;
> +		break;
> +	}
>  
>  	/* Limit to VIN capabilities */
>  	v4l_bound_align_image(&pix->width, 2, vin->info->max_width, walign,
> -- 
> 2.23.0
> 
