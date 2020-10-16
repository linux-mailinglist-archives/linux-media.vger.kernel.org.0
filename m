Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372FB2903BC
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 13:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406735AbgJPLEf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 07:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406670AbgJPLEf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 07:04:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F59C061755;
        Fri, 16 Oct 2020 04:04:35 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FC11528;
        Fri, 16 Oct 2020 13:04:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602846272;
        bh=KpwAjDEbv0VgYYcCcN3JOEIMqRVebV5AYoRSvMrsZq4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=rVWhYl4bdvV0xA131ANG2T70nFbP0/YAeGXHBpXfzuF7xehT+3JHOHRxSCyiHCxDZ
         mlH0r2uQODH7sMLc2zc6TGDxJZdiEm7OlgJXWH4bqNHZZb6+W+ezcvltMZWQ8q6G57
         Ozrp7jsiRaHQP+6QpO3o9ewQ4wVTc0bYC3hgTD3c=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 5/7] media: i2c: max9286: Configure reverse channel
 amplitude
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20201016120625.64337-1-jacopo+renesas@jmondi.org>
 <20201016120625.64337-6-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <b27d0984-a1c5-d8a5-6e5a-1fefc3b87fd5@ideasonboard.com>
Date:   Fri, 16 Oct 2020 12:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016120625.64337-6-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/10/2020 13:06, Jacopo Mondi wrote:
> Adjust reverse channel amplitude according to the presence of
> the 'high-threshold" DTS property.
> 
> If no high threshold compensation is required, start with a low
> amplitude (100mV) and increase it after the remote serializers
> have probed and have enabled noise immunity on their reverse
> channels.
> 
> If high threshold compensation is required, configure the reverse
> channel with a 170mV amplitude before the remote serializers have
> probed.
> 
> This change is required for both rdacm20 and rdacm21 camera modules
> to be correctly probed when used in combination with the max9286
> deserializer.

My only fear here would be that perhaps on other cameras we need a more
fine-grained control of the amplitudes?

But I'll leave that discussion to the binding itself,

For this patch ...

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 31e27d0f34f1..4c72e1e6b27b 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -163,6 +163,8 @@ struct max9286_priv {
>  	unsigned int mux_channel;
>  	bool mux_open;
>  
> +	bool high_threshold;
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
> +	if (!priv->high_threshold)
> +		max9286_reverse_channel_setup(priv, 170);
>  	max9286_check_config_link(priv, priv->source_mask);
>  
>  	/*
> @@ -967,7 +973,12 @@ static int max9286_setup(struct max9286_priv *priv)
>  	 * only. This should be disabled after the mux is initialised.
>  	 */
>  	max9286_configure_i2c(priv, true);
> -	max9286_reverse_channel_setup(priv, 170);
> +
> +	/*
> +	 * Compensate the remote end high threshold with a larger channel
> +	 * amplitude if necessary.
> +	 */
> +	max9286_reverse_channel_setup(priv, priv->high_threshold ? 170 : 100);
>  
>  	/*
>  	 * Enable GMSL links, mask unused ones and autodetect link
> @@ -1235,6 +1246,12 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  	}
>  	of_node_put(node);
>  
> +	/*
> +	 * Parse 'high_threshold' property to configure the reverse channel
> +	 * amplitude.
> +	 */
> +	priv->high_threshold = device_property_present(dev, "high_threshold");
> +
>  	priv->route_mask = priv->source_mask;
>  
>  	return 0;
> 

