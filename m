Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8D62DC51D
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 18:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgLPRPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 12:15:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42806 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726745AbgLPRPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 12:15:13 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5304A2CF;
        Wed, 16 Dec 2020 18:14:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608138870;
        bh=lQp49HTuWeMjvxFa2zqwz6oMJLl3H9JlTDtZ44pM+cY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XkaTb6qITxI537hN6t/JnLWql/DUCV+v0LvkoXm2zza7x+8k94Mj3MJQkkblhEVUC
         BLa2DbsYJgNCHamKu7T4WlHj5AU8VN/uTksS3EhFo5axyjRW7MQuTAqtglBbd4xNNs
         q7nB2RZ6am6J8BZB5HcCQ2ULltPNubfXqMDH4tmc=
Date:   Wed, 16 Dec 2020 19:14:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v6 4/5] media: i2c: max9286: Make channel amplitude
 programmable
Message-ID: <X9pAbzfmwHnj+GaN@pendragon.ideasonboard.com>
References: <20201215170957.92761-1-jacopo+renesas@jmondi.org>
 <20201215170957.92761-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215170957.92761-5-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Dec 15, 2020 at 06:09:56PM +0100, Jacopo Mondi wrote:
> Instrument the function that configures the reverse channel with a
> programmable amplitude value.
> 
> This change serves to prepare to adjust the reverse channel amplitude
> depending on the remote end high-threshold configuration.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 1cfc8801c0b2..021309c6dd6f 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -336,19 +336,29 @@ static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
>  	usleep_range(3000, 5000);
>  }
>  
> -static void max9286_reverse_channel_setup(struct max9286_priv *priv)
> +static void max9286_reverse_channel_setup(struct max9286_priv *priv,
> +					  unsigned int chan_amplitude)
>  {
> +	/* Reverse channel transmission time: default to 1. */
> +	u8 chan_config = MAX9286_REV_TRF(1);
> +
>  	/*
>  	 * Reverse channel setup.
>  	 *
>  	 * - Enable custom reverse channel configuration (through register 0x3f)
>  	 *   and set the first pulse length to 35 clock cycles.
> -	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> -	 *   high threshold enabled by the serializer driver.
> +	 * - Adjust reverse channel amplitude: values > 130 are programmed
> +	 *   using the additional +100mV REV_AMP_X boost flag
>  	 */
>  	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> -	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> -		      MAX9286_REV_AMP_X);
> +
> +	if (chan_amplitude > 100) {
> +		/* It is not possible to express values (100 < x < 130) */
> +		chan_amplitude = chan_amplitude < 130
> +			       ? 30 : chan_amplitude - 100;

This could also be written

		chan_amplitude = min(30, chan_amplitude - 100);

With or without the change,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		chan_config |= MAX9286_REV_AMP_X;
> +	}
> +	max9286_write(priv, 0x3b, chan_config | MAX9286_REV_AMP(chan_amplitude));
>  	usleep_range(2000, 2500);
>  }
>  
> @@ -957,7 +967,7 @@ static int max9286_setup(struct max9286_priv *priv)
>  	 * only. This should be disabled after the mux is initialised.
>  	 */
>  	max9286_configure_i2c(priv, true);
> -	max9286_reverse_channel_setup(priv);
> +	max9286_reverse_channel_setup(priv, 170);
>  
>  	/*
>  	 * Enable GMSL links, mask unused ones and autodetect link

-- 
Regards,

Laurent Pinchart
