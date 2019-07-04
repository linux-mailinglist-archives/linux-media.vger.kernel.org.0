Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAED5F7BE
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 14:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfGDMOi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 08:14:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53456 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727615AbfGDMOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 08:14:38 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1ABF24B;
        Thu,  4 Jul 2019 14:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562242475;
        bh=HEb3+MpUH+4ZkTQNuR07aMNqOT30m1zoi/vLiRlWUNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CURfVrIcrldc2vDDxwHoZf92Va7Fzj/QdWKsazO3/T8xFij3BxV545lzbg9hSVWIs
         9x5EmrhWJzJJ3up4NeAsZhhhueVDyYRlN/Yh+a+f+STHWJMoXL2YqZw6IdVWvyw+9n
         jz5D+4gdg4dD10RfuUtDiomqgIZwD+5zgpgcNf4k=
Date:   Thu, 4 Jul 2019 15:14:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/4] rcar-vin: Add support for RGB formats with alpha
 component
Message-ID: <20190704121415.GC6569@pendragon.ideasonboard.com>
References: <20190704015817.17083-1-niklas.soderlund+renesas@ragnatech.se>
 <20190704015817.17083-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190704015817.17083-4-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, Jul 04, 2019 at 03:58:16AM +0200, Niklas Söderlund wrote:
> The R-Car VIN module supports V4L2_PIX_FMT_ARGB555 and
> V4L2_PIX_FMT_ABGR32 pixel formats. Add the hardware register setup and
> allow the alpha component to be changed while streaming using the
> V4L2_CID_ALPHA_COMPONENT control.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 35 +++++++++++++++++++++
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  8 +++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 4e991cce5fb56a90..620976d173585694 100644
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
> @@ -1346,5 +1355,31 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>  
>  void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha)
>  {
> +	unsigned long flags;
> +	u32 dmr;
> +
> +	spin_lock_irqsave(&vin->qlock, flags);
> +
>  	vin->alpha = alpha;
> +
> +	if (vin->state == STOPPED)
> +		goto out;
> +
> +	switch (vin->format.pixelformat) {
> +	case V4L2_PIX_FMT_ARGB555:
> +		dmr = rvin_read(vin, VNDMR_REG) & ~VNDMR_ABIT;
> +		if (vin->alpha)
> +			dmr |= VNDMR_ABIT;
> +		break;
> +	case V4L2_PIX_FMT_ABGR32:
> +		dmr = rvin_read(vin, VNDMR_REG) & ~VNDMR_A8BIT_MASK;
> +		dmr |= VNDMR_A8BIT(vin->alpha);
> +		break;
> +	default:
> +		goto out;
> +	}
> +
> +	rvin_write(vin, dmr,  VNDMR_REG);
> +out:
> +	spin_unlock_irqrestore(&vin->qlock, flags);
>  }
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 0936bcd98df1f75d..f8b6ec4408b2f5fa 100644
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
> -- 
> 2.21.0
> 

-- 
Regards,

Laurent Pinchart
