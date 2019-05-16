Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 101AB2032B
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 12:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfEPKIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 06:08:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55128 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfEPKIk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 06:08:40 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAA40320;
        Thu, 16 May 2019 12:08:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558001319;
        bh=6s8kAvNgNn5JUz5hVROKZXvniwdPzAbUcNsZ4JLIOp8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oR2G2BScWsy5MbruKFtAobqeiKJBpOapcJXPt0eOHSFJvzgAAIJwMvre8638+2IDM
         GUVm0eFSqNuEsKyHkYpJent+ZEVwvAnbUH3NfBLHTokaRSHVccaz78a/EvwgqFL3ri
         JWTmPYWZts9ItZve6ehA3z+NBWyfebEGX7mYz5vs=
Date:   Thu, 16 May 2019 13:08:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] rcar-vin: Add support for RGB formats with alpha
 component
Message-ID: <20190516100822.GC4995@pendragon.ideasonboard.com>
References: <20190516004746.3794-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516004746.3794-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516004746.3794-4-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, May 16, 2019 at 02:47:46AM +0200, Niklas Söderlund wrote:
> The R-Car VIN module supports V4L2_PIX_FMT_ARGB555 and
> V4L2_PIX_FMT_ABGR32 pixel formats. Add the hardware register setup and
> allow the alpha component to be changed while streaming using the
> V4L2_CID_ALPHA_COMPONENT control.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 30 +++++++++++++++++++++
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  8 ++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 4e991cce5fb56a90..5c0ed27c5d05dd45 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -111,8 +111,11 @@
>  #define VNIE_EFE		(1 << 1)
>  
>  /* Video n Data Mode Register bits */
> +#define VNDMR_A8BIT(n)		((n & 0xff) << 24)
> +#define VNDMR_A8BIT_MASK	(0xff << 24)
>  #define VNDMR_EXRGB		(1 << 8)
>  #define VNDMR_BPSM		(1 << 4)
> +#define VNDMR_ABIT		(1 << 2)
>  #define VNDMR_DTMD_YCSEP	(1 << 1)
>  #define VNDMR_DTMD_ARGB		(1 << 0)
>  
> @@ -730,6 +733,12 @@ static int rvin_setup(struct rvin_dev *vin)
>  		/* Note: not supported on M1 */
>  		dmr = VNDMR_EXRGB;
>  		break;
> +	case V4L2_PIX_FMT_ARGB555:
> +		dmr = (vin->alpha ? VNDMR_ABIT : 0) | VNDMR_DTMD_ARGB;
> +		break;
> +	case V4L2_PIX_FMT_ABGR32:
> +		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
> +		break;
>  	default:
>  		vin_err(vin, "Invalid pixelformat (0x%x)\n",
>  			vin->format.pixelformat);
> @@ -1346,5 +1355,26 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>  
>  void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha)

OK, I now see why you added a rvin_set_alpha() function. It makes sense,
but I think you need to protect this with a lock to avoid races between
stream start and control set. Or are we already protected by a lock the
serialises all V4L2 ioctls for the VIN video node ?

>  {
> +	u32 dmr;
> +
>  	vin->alpha = alpha;
> +
> +	if (vin->state == STOPPED)
> +		return;
> +
> +	switch (vin->format.pixelformat) {
> +	case V4L2_PIX_FMT_ARGB555:
> +		dmr = rvin_read(vin, VNDMR_REG) & ~VNDMR_ABIT;
> +		if (vin->alpha)
> +			dmr |= VNDMR_ABIT;
> +		break;

Should you cache the DNDMR valid to avoid a hardware read ?

> +	case V4L2_PIX_FMT_ABGR32:
> +		dmr = rvin_read(vin, VNDMR_REG) & ~VNDMR_A8BIT_MASK;
> +		dmr |= VNDMR_A8BIT(vin->alpha);
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	rvin_write(vin, dmr,  VNDMR_REG);
>  }
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 7cbdcbf9b090c638..bb2900f5d000f9a6 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -54,6 +54,14 @@ static const struct rvin_video_format rvin_formats[] = {
>  		.fourcc			= V4L2_PIX_FMT_XBGR32,
>  		.bpp			= 4,
>  	},
> +	{
> +		.fourcc			= V4L2_PIX_FMT_ARGB555,
> +		.bpp			= 2,
> +	},
> +	{
> +		.fourcc			= V4L2_PIX_FMT_ABGR32,
> +		.bpp			= 4,
> +	},
>  };
>  
>  const struct rvin_video_format *rvin_format_from_pixel(u32 pixelformat)

-- 
Regards,

Laurent Pinchart
