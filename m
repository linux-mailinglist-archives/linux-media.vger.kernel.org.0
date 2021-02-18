Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BBA31ECB2
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234139AbhBRQ6Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:58:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232455AbhBRPkY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 10:40:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2478C061574;
        Thu, 18 Feb 2021 07:39:41 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E3913E7;
        Thu, 18 Feb 2021 16:39:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613662780;
        bh=DmnvdwZV8yESaBMJksJjQrvF/K8QlpTjEqk5yRbepCU=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jvXFmBq7P95/RylozLm6qa5y5bZxYWP0ZUAYBEFJKhxMU1NGGi04lR6hXoJnQ60Xf
         OUaZBTGvg1RC2B99xdWSvAHluasdew8Har76VRc8FEe/V82tNiVH7WvhJ5ToHTBmna
         cgreUgH0SMcjMXqOrJt3v/nANy0Q67YfqDpoCWQw=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 11/16] media: i2c: max9286: Cache channel amplitude
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-12-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2b62ff38-7c9c-c24f-b7a6-8e3a65d3f669@ideasonboard.com>
Date:   Thu, 18 Feb 2021 15:39:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-12-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/02/2021 17:41, Jacopo Mondi wrote:
> Cache the current channel amplitude in a driver variable
> to skip updating it if the new requested value is the same
> as the currently configured one.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

I like this model better than deciding outside of the call :-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/media/i2c/max9286.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 1f14cd817fbf..4afb5ca06448 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -164,6 +164,7 @@ struct max9286_priv {
>  	bool mux_open;
>  
>  	u32 init_rev_chan_mv;
> +	u32 rev_chan_mv;
>  
>  	struct v4l2_ctrl_handler ctrls;
>  	struct v4l2_ctrl *pixelrate;
> @@ -340,8 +341,15 @@ static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
>  static void max9286_reverse_channel_setup(struct max9286_priv *priv,
>  					  unsigned int chan_amplitude)
>  {
> +	u8 chan_config;
> +
> +	if (priv->rev_chan_mv == chan_amplitude)
> +		return;
> +
> +	priv->rev_chan_mv = chan_amplitude;
> +
>  	/* Reverse channel transmission time: default to 1. */
> -	u8 chan_config = MAX9286_REV_TRF(1);
> +	chan_config = MAX9286_REV_TRF(1);
>  
>  	/*
>  	 * Reverse channel setup.
> @@ -563,8 +571,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  	 * - Disable auto-ack as communication on the control channel are now
>  	 *   stable.
>  	 */
> -	if (priv->init_rev_chan_mv < 170)
> -		max9286_reverse_channel_setup(priv, 170);
> +	max9286_reverse_channel_setup(priv, 170);
>  	max9286_check_config_link(priv, priv->source_mask);
>  
>  	/*
> 

