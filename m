Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028722DC53B
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 18:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgLPRXH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 12:23:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbgLPRXH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 12:23:07 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 561CB2CF;
        Wed, 16 Dec 2020 18:22:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608139344;
        bh=+Vts7F/npTpqt8B0ttMWAaU+iOYW1Jwk+4duOpA5KX0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qmwy+BAu1SU4I3GEBtlfsTnay4t3By7RNhmgWWpZQPYK/3edpi7r39ohXaEDFrxen
         RFEmm9/c1FjYVK/IAi0NVW0qacqwi2qEGOa6VgkMS1IvncGl99ajrXg6+8kTea9xqy
         WIrJH/S836LZu1hFdqtyldqVknS4KrWH6wd4hDJI=
Date:   Wed, 16 Dec 2020 19:22:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v6 5/5] media: i2c: max9286: Configure reverse channel
 amplitude
Message-ID: <X9pCSfxE722rnPHE@pendragon.ideasonboard.com>
References: <20201215170957.92761-1-jacopo+renesas@jmondi.org>
 <20201215170957.92761-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215170957.92761-6-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Dec 15, 2020 at 06:09:57PM +0100, Jacopo Mondi wrote:
> Adjust the initial reverse channel amplitude parsing from
> firmware interface the 'maxim,reverse-channel-microvolt'
> property.
> 
> This change is required for both rdacm20 and rdacm21 camera
> modules to be correctly probed when used in combination with
> the max9286 deserializer.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 021309c6dd6f..9b40a4890c4d 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -163,6 +163,8 @@ struct max9286_priv {
>  	unsigned int mux_channel;
>  	bool mux_open;
>  
> +	u32 reverse_channel_mv;
> +
>  	struct v4l2_ctrl_handler ctrls;
>  	struct v4l2_ctrl *pixelrate;
>  
> @@ -557,10 +559,14 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  	 * All enabled sources have probed and enabled their reverse control
>  	 * channels:
>  	 *
> +	 * - Increase the reverse channel amplitude to compensate for the
> +	 *   remote ends high threshold, if not done already
>  	 * - Verify all configuration links are properly detected
>  	 * - Disable auto-ack as communication on the control channel are now
>  	 *   stable.
>  	 */
> +	if (priv->reverse_channel_mv < 170)
> +		max9286_reverse_channel_setup(priv, 170);

I'm beginning to wonder if there will be a need in the future to not
increase the reverse channel amplitude (keeping the threshold low on the
remote side). An increased amplitude increases power consumption, and if
the environment isn't noisy, a low amplitude would work. The device tree
would then need to specify both the initial amplitude required by the
remote side, and the desired amplitude after initialization. What do you
think ? Is it overkill ? We don't have to implement this now, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

but if this feature could be required later, we may want to take into
account in the naming of the new DT property to reflect the fact that it
is the initial value.

>  	max9286_check_config_link(priv, priv->source_mask);
>  
>  	/*
> @@ -967,7 +973,7 @@ static int max9286_setup(struct max9286_priv *priv)
>  	 * only. This should be disabled after the mux is initialised.
>  	 */
>  	max9286_configure_i2c(priv, true);
> -	max9286_reverse_channel_setup(priv, 170);
> +	max9286_reverse_channel_setup(priv, priv->reverse_channel_mv);
>  
>  	/*
>  	 * Enable GMSL links, mask unused ones and autodetect link
> @@ -1131,6 +1137,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  	struct device_node *i2c_mux;
>  	struct device_node *node = NULL;
>  	unsigned int i2c_mux_mask = 0;
> +	u32 reverse_channel_microvolt;
>  
>  	/* Balance the of_node_put() performed by of_find_node_by_name(). */
>  	of_node_get(dev->of_node);
> @@ -1221,6 +1228,20 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  	}
>  	of_node_put(node);
>  
> +	/*
> +	 * Parse the initial value of the reverse channel amplitude from
> +	 * the firmware interface and convert it to millivolts.
> +	 *
> +	 * Default it to 170mV for backward compatibility with DTBs that do not
> +	 * provide the property.
> +	 */
> +	if (of_property_read_u32(dev->of_node,
> +				 "maxim,reverse-channel-microvolt",
> +				 &reverse_channel_microvolt))
> +		priv->reverse_channel_mv = 170;
> +	else
> +		priv->reverse_channel_mv = reverse_channel_microvolt / 1000U;
> +
>  	priv->route_mask = priv->source_mask;
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
