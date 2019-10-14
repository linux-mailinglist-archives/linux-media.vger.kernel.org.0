Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1CBD6B8B
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 00:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730613AbfJNWLQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 18:11:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48792 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731418AbfJNWLP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 18:11:15 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5F47324;
        Tue, 15 Oct 2019 00:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571091072;
        bh=lVp2fGnTgqHxMbcM4v4yT6Pl3tU/Nxv1y60NSQqlNgw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ebmqRfIy9fboJraQGkanoo3u9K9WWC6UCiyWhQCBTjAfNg8q+AKXHFKbmqIstzq7q
         ri2cKBVQ2DXXJS5e85H6eLwhwaTWqPkXaJ1KYqIaBeJi3MO/zsz/qJQs0o8dk74O14
         +WhoAIG1mRgoHXCCfnj08Pc3nZDwTyz8fhpgSLrA=
Date:   Tue, 15 Oct 2019 01:11:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH v2 2/2] rcar-vin: Add support for outputting NV12
Message-ID: <20191014221107.GI23442@pendragon.ideasonboard.com>
References: <20191014001615.2865301-1-niklas.soderlund+renesas@ragnatech.se>
 <20191014001615.2865301-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191014001615.2865301-3-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Mon, Oct 14, 2019 at 02:16:15AM +0200, Niklas Söderlund wrote:
> Most Gen3 boards can output frames in NV12 format, add support for this
> with a runtime check that the running hardware supports it.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  |  5 ++-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 39 +++++++++++++++++----
>  2 files changed, 37 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index af4f774149f08597..cf9029efeb0450cb 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -118,6 +118,7 @@
>  #define VNDMR_ABIT		(1 << 2)
>  #define VNDMR_DTMD_YCSEP	(1 << 1)

While at it, I would define this as (2 << 0).

>  #define VNDMR_DTMD_ARGB		(1 << 0)
> +#define VNDMR_DTMD_YCSEP_420	(3 << 0)
>  
>  /* Video n Data Mode Register 2 bits */
>  #define VNDMR2_VPS		(1 << 30)
> @@ -701,11 +702,13 @@ static int rvin_setup(struct rvin_dev *vin)
>  	 * Output format
>  	 */
>  	switch (vin->format.pixelformat) {
> +	case V4L2_PIX_FMT_NV12:
>  	case V4L2_PIX_FMT_NV16:
>  		rvin_write(vin,
>  			   ALIGN(vin->format.bytesperline * vin->format.height,
>  				 0x80), VNUVAOF_REG);
> -		dmr = VNDMR_DTMD_YCSEP;
> +		dmr = vin->format.pixelformat == V4L2_PIX_FMT_NV12 ?
> +			VNDMR_DTMD_YCSEP_420 : VNDMR_DTMD_YCSEP;

According to the datasheet, VNDMR_DTMD_YCSEP_420 is only valid for some
of the channels (see footnote of the VnDMR register documentation).

>  		output_is_yuv = true;
>  		break;
>  	case V4L2_PIX_FMT_YUYV:
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 13b7cd5d2e40415a..9e2e63ffcc47acad 100644
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
> @@ -124,8 +143,16 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
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

-- 
Regards,

Laurent Pinchart
