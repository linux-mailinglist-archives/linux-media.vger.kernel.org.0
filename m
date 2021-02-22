Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23FF320F28
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 02:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbhBVBey (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 20:34:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbhBVBeX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 20:34:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51235C061786;
        Sun, 21 Feb 2021 17:33:43 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26E00517;
        Mon, 22 Feb 2021 02:33:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613957621;
        bh=wx/q4aKq6oZLLuL1Nx2ZFt8o5HHVbpEPzovBML6ZPsE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KqAl0Urg83qLVmpcnAX79PNEt21LGr50I8ElUQsyQra82DkUYhR1Nu9JLIKTpwCyb
         lADckXnbS7GHTXOwAySeG/D/DDbYyS9Pw/NNLTMD8AdZvWLS4UD6JjicLUTeHexwJu
         KzQQMOfbRFTJRsahOl/hoiCt9TEy7O9Mg3ySfQqU=
Date:   Mon, 22 Feb 2021 03:33:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/16] media: i2c: max9286: Cache channel amplitude
Message-ID: <YDMJ2nVwi/ByVEgF@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-12-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210216174146.106639-12-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Feb 16, 2021 at 06:41:41PM +0100, Jacopo Mondi wrote:
> Cache the current channel amplitude in a driver variable
> to skip updating it if the new requested value is the same
> as the currently configured one.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
