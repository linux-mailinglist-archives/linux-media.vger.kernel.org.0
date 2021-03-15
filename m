Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11F5533C8EC
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 22:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhCOV65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 17:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhCOV63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 17:58:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31521C06174A;
        Mon, 15 Mar 2021 14:58:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95ABB316;
        Mon, 15 Mar 2021 22:58:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615845507;
        bh=gOmLzfVO5X98XqMgZCyxA1G4VvZj0a0c5tB5fZNrUWQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U7CpAT+bu4IaIHnLbrf7EQECDSQhAIjqrFqMmuuz6EQby161TBRKLpbWiNTjahD4m
         SRbFqaifprvT37rtXRDBJALZdoAzFA8VSRC+So+uKOOtGiSW+fc3QJnQNaLrkj6LcL
         LSbANlMTeMYft0S8r6nH45AdLPV0E7tb82tos1cg=
Date:   Mon, 15 Mar 2021 23:57:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/18] media: i2c: max9286: Rework comments in .bound()
Message-ID: <YE/YX7fzWroiDuYl@pendragon.ideasonboard.com>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-19-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210315131512.133720-19-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 15, 2021 at 02:15:12PM +0100, Jacopo Mondi wrote:
> Re-phrase a comment in .bound() callback to make it clear we register

s/Re-phrase/Rephrase/

> a subdev notifier and remove a redundant comment about disabling i2c
> auto-ack.
> 
> No functional changes intended.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/max9286.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index b6347639901e..16b2cb9b44a2 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -556,9 +556,9 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  		subdev->name, src_pad, index);
>  
>  	/*
> -	 * We can only register v4l2_async_notifiers, which do not provide a
> -	 * means to register a complete callback. bound_sources allows us to
> -	 * identify when all remote serializers have completed their probe.
> +	 * As we register a subdev notifiers we won't get a .complete() callback
> +	 * here, so we have to use bound_sources to identify when all remote
> +	 * serializers have probed.
>  	 */
>  	if (priv->bound_sources != priv->source_mask)
>  		return 0;
> @@ -581,16 +581,12 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  	/*
>  	 * All enabled sources have probed and enabled their reverse control
>  	 * channels:
> +	 * - The reverse channel amplitude stays high
>  	 * - Verify all configuration links are properly detected
> -	 * - Disable auto-ack as communication on the control channel are now
> -	 *   stable.
> +	 * - Disable auto-ack as communications on the control channel are now
> +	 *   stable
>  	 */
>  	max9286_check_config_link(priv, priv->source_mask);
> -
> -	/*
> -	 * Re-configure I2C with local acknowledge disabled after cameras have
> -	 * probed.
> -	 */
>  	max9286_configure_i2c(priv, false);
>  
>  	return max9286_set_pixelrate(priv);

-- 
Regards,

Laurent Pinchart
