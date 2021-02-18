Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9AF731ECAC
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbhBRQ6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhBRPJY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 10:09:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5A2C0617A9;
        Thu, 18 Feb 2021 07:06:09 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 546383E7;
        Thu, 18 Feb 2021 16:06:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613660765;
        bh=dSBqhVkp/iAa5cgZEEnWPWhwlXHCmngOAaA5uAmLBNs=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=I7tWCKzD49p26ryzl1QeMEiSvCHKvWl9rbIEGioJtgnr+AvMalEvrkQNZ5B5teWD6
         GvXB0w8YJYTWIyOBzS13TDcDYXRA0/5Vp3clfTxMEXxsHdvDi1FogO7txLbSXr38AY
         BJ1nL82Gy9bjMhBNAt7U58M3kOOFEcp3TZ0c7mjg=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 10/16] media: i2c: max9286: Rename reverse_channel_mv
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-11-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <9e1cca71-e0f0-4d66-d3f5-268760c53eec@ideasonboard.com>
Date:   Thu, 18 Feb 2021 15:06:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-11-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/02/2021 17:41, Jacopo Mondi wrote:
> Rename the reverse_channel_mv variable to init_rev_chan_mv as
> the next patches will cache the reverse channel amplitude in
> a new driver variable.
> 

I've been trying to figure out if we really do need two variables to
store this now, but I can't see an easy way to factor out the
initialisation value, and I like the idea of caching the current stored
value.

So

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

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
> 

