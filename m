Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4606C5FB34
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 17:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbfGDPuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 11:50:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58638 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbfGDPuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 11:50:15 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6399624B;
        Thu,  4 Jul 2019 17:50:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562255413;
        bh=ZS2fV0Db2L1MSQseZZtqEpIAUXqz1ug5dF2NxPJZyLk=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=YyALO3nZftx+XhoSgg+nXJvSgAPHKEYRKEfa5EmS3FeXfmLxy1nWTW2ICDPqhtxO3
         p/4YqSHlyoxh8sXuG8wPHGUmuw8SwV4aL7ED58wbxEh6ajiCzG6Jc0mDnn9OpmCtgk
         Zjtu7fNSFPYPi2IP2nLoBTuGYrI5b8NOkvqVWzlk=
Subject: Re: [PATCH v3 3/4] rcar-vin: Add support for RGB formats with alpha
 component
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190704015817.17083-1-niklas.soderlund+renesas@ragnatech.se>
 <20190704015817.17083-4-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <e5e86b42-b53e-ccf1-211a-4b5551a03125@ideasonboard.com>
Date:   Thu, 4 Jul 2019 16:50:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190704015817.17083-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 04/07/2019 02:58, Niklas Söderlund wrote:
> The R-Car VIN module supports V4L2_PIX_FMT_ARGB555 and
> V4L2_PIX_FMT_ABGR32 pixel formats. Add the hardware register setup and
> allow the alpha component to be changed while streaming using the
> V4L2_CID_ALPHA_COMPONENT control.

Hrm, I expected there to be more ARGB formats supported, but the Gen3
datasheet does seem to indicate only the two.


> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

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
> 

