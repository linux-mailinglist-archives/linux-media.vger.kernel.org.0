Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACCBA320F1A
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 02:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbhBVBa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 20:30:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54738 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhBVBa0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 20:30:26 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 483AE517;
        Mon, 22 Feb 2021 02:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613957384;
        bh=WIYtArx8kmB0bXNl34Zf0YcBtLjG5KZn46ZFZXcecfY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SGRmlIAl98Xa6QRVSVdfZvpUgHfGUlDNhm8dirby3KsDKKu9oTwfSMRkNhulp9spj
         xNLfhNoMOIrsNgi7fjEEDJW6FIlBIskHTQdPbFTOVKAFOf7PCWCk3m5ljn8U07FEef
         dpRC3zr6V3aaFD7HwfGiw4anSBVD8khSBlIJfEbo=
Date:   Mon, 22 Feb 2021 03:29:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/16] media: i2c: max9286: Rename reverse_channel_mv
Message-ID: <YDMI7TnwreLNT7yh@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-11-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210216174146.106639-11-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Feb 16, 2021 at 06:41:40PM +0100, Jacopo Mondi wrote:
> Rename the reverse_channel_mv variable to init_rev_chan_mv as
> the next patches will cache the reverse channel amplitude in
> a new driver variable.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 1d9951215868..1f14cd817fbf 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -163,7 +163,7 @@ struct max9286_priv {
>  	unsigned int mux_channel;
>  	bool mux_open;
>  
> -	u32 reverse_channel_mv;
> +	u32 init_rev_chan_mv;

Maybe it could be time to add some kerneldoc to this structure, or just
a comment for this field, to explain what it stores ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	struct v4l2_ctrl_handler ctrls;
>  	struct v4l2_ctrl *pixelrate;
> @@ -563,7 +563,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  	 * - Disable auto-ack as communication on the control channel are now
>  	 *   stable.
>  	 */
> -	if (priv->reverse_channel_mv < 170)
> +	if (priv->init_rev_chan_mv < 170)
>  		max9286_reverse_channel_setup(priv, 170);
>  	max9286_check_config_link(priv, priv->source_mask);
>  
> @@ -971,7 +971,7 @@ static int max9286_setup(struct max9286_priv *priv)
>  	 * only. This should be disabled after the mux is initialised.
>  	 */
>  	max9286_configure_i2c(priv, true);
> -	max9286_reverse_channel_setup(priv, priv->reverse_channel_mv);
> +	max9286_reverse_channel_setup(priv, priv->init_rev_chan_mv);
>  
>  	/*
>  	 * Enable GMSL links, mask unused ones and autodetect link
> @@ -1236,9 +1236,9 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  	if (of_property_read_u32(dev->of_node,
>  				 "maxim,reverse-channel-microvolt",
>  				 &reverse_channel_microvolt))
> -		priv->reverse_channel_mv = 170;
> +		priv->init_rev_chan_mv = 170;
>  	else
> -		priv->reverse_channel_mv = reverse_channel_microvolt / 1000U;
> +		priv->init_rev_chan_mv = reverse_channel_microvolt / 1000U;
>  
>  	priv->route_mask = priv->source_mask;
>  

-- 
Regards,

Laurent Pinchart
