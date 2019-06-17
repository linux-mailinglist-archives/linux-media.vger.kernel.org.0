Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B637648586
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 16:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfFQOeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 10:34:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34924 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfFQOeA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 10:34:00 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77D362AF;
        Mon, 17 Jun 2019 16:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560782038;
        bh=nFb4UIdKnuWq3S4dj9spMe1F4yQqcBgMrLJlkNt4UD8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TvpsDewF6TnWT3xfexgL0FVz6Ti4FuCtbjc1ogaZgGNtviyI8nlC7qVY5SvpeVX2N
         YO856pCMss8TO6563uBxSKLKyN2UOHwbUCQ+vL2+mDW2ps/H2jqnfOVH4lggb7AETw
         d93ca77qqsWXZCIyBRzW3KFZmGtoQf1Oshay4qes=
Date:   Mon, 17 Jun 2019 17:33:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rcar-vin: Add support for RGB formats with alpha
 component
Message-ID: <20190617143341.GC4777@pendragon.ideasonboard.com>
References: <20190613000439.28746-1-niklas.soderlund+renesas@ragnatech.se>
 <20190613000439.28746-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190613000439.28746-4-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, Jun 13, 2019 at 02:04:39AM +0200, Niklas Söderlund wrote:
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
>  {
> +	u32 dmr;
> +
>  	vin->alpha = alpha;
> +
> +	if (vin->state == STOPPED)

The state is protected by the vin->qlock spinlock. Is it safe to check
it here without holding the spinlock ? The answer may be yes if you can
guarantee that no code patch will race except for the IRQ handler, and
guarantee that the race with the IRQ handler isn't an issue.

Additionally, what happens if the control is set and streaming is then
started ? I don't see in call to v4l2_ctrl_handler_setup() in 2/3 or
3/3.

> +		return;
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
