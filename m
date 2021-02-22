Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815B5320F2D
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 02:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhBVBgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 20:36:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhBVBgK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 20:36:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97081C061574;
        Sun, 21 Feb 2021 17:35:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7278517;
        Mon, 22 Feb 2021 02:35:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613957729;
        bh=w93vWuoMNvv5niDXg7wAlxjj/FGqCUStQqpuRckm2Xw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YQlZuLZH4wWj9oDmjLlEUaIVptrGhu+ARsqZZsgvub35DtAAHAqyEafawjjow4DR6
         sXNNvNWs0q4TEgiFO19iCbH3xCmXN5w8nG55Gf2klwcYJ7PMTPTv8gJjhaaSpHrtNR
         ZQwVtVbzlhjY/HmVL0QgK9dUA22SFDXvIi1H+SuU=
Date:   Mon, 22 Feb 2021 03:35:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/16] media: i2c: max9286: Define high channel amplitude
Message-ID: <YDMKRo+HU2ebyAqV@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-13-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210216174146.106639-13-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Feb 16, 2021 at 06:41:42PM +0100, Jacopo Mondi wrote:
> Provide a macro to define the reverse channel amplitude to
> be used to compensate the remote serializer noise immunity.
> 
> While at it, update a comment.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 4afb5ca06448..7913b5f2249e 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -113,6 +113,7 @@
>  #define MAX9286_REV_TRF(n)		((n) << 4)
>  #define MAX9286_REV_AMP(n)		((((n) - 30) / 10) << 1) /* in mV */
>  #define MAX9286_REV_AMP_X		BIT(0)
> +#define MAX9286_REV_AMP_HIGH		170
>  /* Register 0x3f */
>  #define MAX9286_EN_REV_CFG		BIT(6)
>  #define MAX9286_REV_FLEN(n)		((n) - 20)
> @@ -566,12 +567,12 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  	 * channels:
>  	 *
>  	 * - Increase the reverse channel amplitude to compensate for the
> -	 *   remote ends high threshold, if not done already
> +	 *   remote ends high threshold

I would have done this in the previous patch, but it doesn't matter
much.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	 * - Verify all configuration links are properly detected
>  	 * - Disable auto-ack as communication on the control channel are now
>  	 *   stable.
>  	 */
> -	max9286_reverse_channel_setup(priv, 170);
> +	max9286_reverse_channel_setup(priv, MAX9286_REV_AMP_HIGH);
>  	max9286_check_config_link(priv, priv->source_mask);
>  
>  	/*

-- 
Regards,

Laurent Pinchart
