Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DF4320F49
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 03:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhBVCEL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 21:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbhBVCEK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 21:04:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61519C061574;
        Sun, 21 Feb 2021 18:03:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89DAD517;
        Mon, 22 Feb 2021 03:03:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613959408;
        bh=3+Z06nktataXtXvY4PntHi6rSu7jvSLOb2DO0aEka6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r5aRkcqyQ1KbTe/kGBkz9EVuzIgryJa1II5Y3HmtN+SjOWxgsZsl4HslhOSVdP/DA
         9SHy5CqJZYelCSekrf1bpXxz74LR4S+HjCHbJpyXrGJvStEBfLeJMhzqZDepmOFyC1
         /PAEMQoqo9U5OdVFObptHti36qwf0TXs/sDk9aZ8=
Date:   Mon, 22 Feb 2021 04:03:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/16] media: i2c: max9286: Initialize remotes when bound
Message-ID: <YDMQ1gyao0WCyQ0u@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-15-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210216174146.106639-15-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Feb 16, 2021 at 06:41:44PM +0100, Jacopo Mondi wrote:
> With the introduction of the .init() core subdev operation in the
> max9271 GMSL serializer, the max9286 deserializer needs to explicitly
> initialize the remote devices by calling the .init() subdev operation on
> each probed camera.
> 
> Call the .init() subdev operation at remote bound time and toggle
> the reverse channel amplitude to compensate for the remote ends
> noise immunity threshold.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 7913b5f2249e..c41284de89b6 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -554,25 +554,39 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  	dev_dbg(&priv->client->dev, "Bound %s pad: %u on index %u\n",
>  		subdev->name, src_pad, index);
>  
> +	/*
> +	 * Initialize the remote camera. Increase the channel amplitude
> +	 * to compensate for the remote noise immunity threshold.
> +	 */
> +	max9286_reverse_channel_setup(priv, MAX9286_REV_AMP_HIGH);
> +	ret = v4l2_subdev_call(subdev, core, init, 0);
> +	if (ret) {
> +		dev_err(&priv->client->dev,
> +			"Failed to initialize camera device %u\n", index);
> +		return ret;
> +	}
> +
>  	/*
>  	 * We can only register v4l2_async_notifiers, which do not provide a
>  	 * means to register a complete callback. bound_sources allows us to
>  	 * identify when all remote serializers have completed their probe.
>  	 */
> -	if (priv->bound_sources != priv->source_mask)
> +	if (priv->bound_sources != priv->source_mask) {
> +		/*
> +		 * If not all remotes have probed yet, restore the initial
> +		 * reverse channel amplitude to allow the next camera to probe.
> +		 */
> +		max9286_reverse_channel_setup(priv, priv->init_rev_chan_mv);
>  		return 0;
> +	}

Instead of going back and forth, would it make sense to incerase the
channel amplitude here, and call the init() subdev operation in a loop
over all cameras ?

Otherwise the patch looks good to me, but I agree with Kieran that it
should probably be squashed with 13/16.

>  
>  	/*
>  	 * All enabled sources have probed and enabled their reverse control
>  	 * channels:
> -	 *
> -	 * - Increase the reverse channel amplitude to compensate for the
> -	 *   remote ends high threshold
>  	 * - Verify all configuration links are properly detected
>  	 * - Disable auto-ack as communication on the control channel are now
>  	 *   stable.
>  	 */
> -	max9286_reverse_channel_setup(priv, MAX9286_REV_AMP_HIGH);
>  	max9286_check_config_link(priv, priv->source_mask);
>  
>  	/*

-- 
Regards,

Laurent Pinchart
