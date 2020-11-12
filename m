Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194852B11E0
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 23:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgKLWiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 17:38:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55196 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgKLWiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 17:38:22 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A76BA2A;
        Thu, 12 Nov 2020 23:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605220700;
        bh=top5SVkJIiCwvOi6k6GoaH/il4eAOquCUL2Sl1ifdv0=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=O6MPtCiKKib7bwjKZmhj+iENMZ2Ekvdnu5PtsWP3lo7mwUCf86Uexaio24ZKxKLng
         TIyOyqzKKv0h+Ulrt1KeTN4fiUjZ+8ibu4Y2TUPx3erikylcQSdPIKrnm4chwP7+1p
         E//n5AWkHpiN9ttACk8dOKk4lSncab7Gr8KOSwUw=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v4 5/8] media: i2c: max9286: Configure reverse channel
 amplitude
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20201112162729.101384-1-jacopo+renesas@jmondi.org>
 <20201112162729.101384-6-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <27d1af63-279c-143d-7154-04a24e9a0d2a@ideasonboard.com>
Date:   Thu, 12 Nov 2020 22:38:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112162729.101384-6-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 12/11/2020 16:27, Jacopo Mondi wrote:
> Adjust the initial reverse channel amplitude parsing from
> firmware interface the 'maxim,initial-reverse-channel-mV'
> property.
> 
> This change is required for both rdacm20 and rdacm21 camera
> modules to be correctly probed when used in combination with
> the max9286 deserializer.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/max9286.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 31e27d0f34f1..11ba047f3793 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -163,6 +163,8 @@ struct max9286_priv {
>  	unsigned int mux_channel;
>  	bool mux_open;
>  
> +	u32 reverse_channel_mV;
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
> +	if (priv->reverse_channel_mV < 170)
> +		max9286_reverse_channel_setup(priv, 170);
>  	max9286_check_config_link(priv, priv->source_mask);
>  
>  	/*
> @@ -967,7 +973,7 @@ static int max9286_setup(struct max9286_priv *priv)
>  	 * only. This should be disabled after the mux is initialised.
>  	 */
>  	max9286_configure_i2c(priv, true);
> -	max9286_reverse_channel_setup(priv, 170);
> +	max9286_reverse_channel_setup(priv, priv->reverse_channel_mV);
>  
>  	/*
>  	 * Enable GMSL links, mask unused ones and autodetect link
> @@ -1235,6 +1241,18 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  	}
>  	of_node_put(node);
>  
> +	/*
> +	 * Parse the initial value of the reverse channel amplitude from
> +	 * the firmware interface.
> +	 *
> +	 * Default it to 170mV for backward compatibility with DTB that do not
> +	 * provide the property.
> +	 */
> +	if (of_property_read_u32(dev->of_node,
> +				 "maxim,initial-reverse-channel-mV",
> +				 &priv->reverse_channel_mV))
> +		priv->reverse_channel_mV = 170;
> +
>  	priv->route_mask = priv->source_mask;
>  
>  	return 0;
> 

