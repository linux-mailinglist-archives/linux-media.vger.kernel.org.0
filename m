Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9463731ECB8
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbhBRQ6k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:58:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33058 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232730AbhBRQC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 11:02:58 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED42F3E7;
        Thu, 18 Feb 2021 17:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613664019;
        bh=+fg4ZdYS3PaFeKu9P08ymW/RCB8AxtGAFSyL34K0jjU=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pOIMR0ovOb19HoGIScfXBqUfGhjiMfaWVe4lAro4kD3Ad4dt3lKR0LOy+f2xggAiK
         86eRjaiidiGAwzgbZJ+W2W7kUDfxKefPRWmfnlVZXkJeUEoKkBiIEY4Pro/DG8/VnB
         XcC/gz8ff15aeURrsdDkDNvY1Wx+e5WjrF94EAmI=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 14/16] media: i2c: max9286: Initialize remotes when bound
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-15-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2c4299af-4e1f-9a72-b24b-bb7876bb1e5b@ideasonboard.com>
Date:   Thu, 18 Feb 2021 16:00:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-15-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/02/2021 17:41, Jacopo Mondi wrote:
> With the introduction of the .init() core subdev operation in the
> max9271 GMSL serializer, the max9286 deserializer needs to explicitly
> initialize the remote devices by calling the .init() subdev operation on
> each probed camera.
> 
> Call the .init() subdev operation at remote bound time and toggle
> the reverse channel amplitude to compensate for the remote ends
> noise immunity threshold.
> 

Should this patch be merged with the previous one to keep the RDACM2x
and max9286 usage aligned?

I expect it won't compile fail, but it would fail a test (if bisecting
was testing the capture).

Seems to look ok, given the previous patch as a dependency:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


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

Oh - wow, now I see why we definitely need to store both the initial and
the current value.



>  		return 0;
> +	}
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
> 

