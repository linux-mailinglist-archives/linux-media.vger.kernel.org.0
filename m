Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09052DC50A
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 18:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgLPRHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 12:07:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgLPRHn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 12:07:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A6FC061794;
        Wed, 16 Dec 2020 09:07:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD0842CF;
        Wed, 16 Dec 2020 18:07:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608138422;
        bh=OlfD7AtWphDsrmkvwm8vCIjYjQo67vrD4eAV4eLzQ08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LEYW4Id6wc+35dzrj1yleJDxv6nagJTdcxXOV9yDEbLXDW6d9TdtvyT9kfwXqiT2W
         gsqn7M4lIm8aP/FGtYS4cq+xByO9XqF22mu3Qo8+WRcTJKc+sGmsRdnSDEL/Wtdeiy
         D6v44Tu5Lm7tDEIjC1EfSE29DWvmidh3dsrk98iU=
Date:   Wed, 16 Dec 2020 19:06:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com,
        Kieran Bingham <kieran.bingham+renesasa@ideasonboard.com>
Subject: Re: [PATCH v6 3/5] media: i2c: max9286: Break-out reverse channel
 setup
Message-ID: <X9o+ryM1UiFNSuea@pendragon.ideasonboard.com>
References: <20201215170957.92761-1-jacopo+renesas@jmondi.org>
 <20201215170957.92761-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215170957.92761-4-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Dec 15, 2020 at 06:09:55PM +0100, Jacopo Mondi wrote:
> Break out the reverse channel setup configuration procedure to its own
> function.
> 
> This change prepares for configuring the reverse channel conditionally
> to the remote side high threshold configuration.
> 
> No functional changes intended.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesasa@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/max9286.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index c82c1493e099..1cfc8801c0b2 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -336,6 +336,22 @@ static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
>  	usleep_range(3000, 5000);
>  }
>  
> +static void max9286_reverse_channel_setup(struct max9286_priv *priv)
> +{
> +	/*
> +	 * Reverse channel setup.
> +	 *
> +	 * - Enable custom reverse channel configuration (through register 0x3f)
> +	 *   and set the first pulse length to 35 clock cycles.
> +	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> +	 *   high threshold enabled by the serializer driver.
> +	 */
> +	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> +	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> +		      MAX9286_REV_AMP_X);
> +	usleep_range(2000, 2500);
> +}
> +
>  /*
>   * max9286_check_video_links() - Make sure video links are detected and locked
>   *
> @@ -941,19 +957,7 @@ static int max9286_setup(struct max9286_priv *priv)
>  	 * only. This should be disabled after the mux is initialised.
>  	 */
>  	max9286_configure_i2c(priv, true);
> -
> -	/*
> -	 * Reverse channel setup.
> -	 *
> -	 * - Enable custom reverse channel configuration (through register 0x3f)
> -	 *   and set the first pulse length to 35 clock cycles.
> -	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> -	 *   high threshold enabled by the serializer driver.
> -	 */
> -	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> -	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> -		      MAX9286_REV_AMP_X);
> -	usleep_range(2000, 2500);
> +	max9286_reverse_channel_setup(priv);
>  
>  	/*
>  	 * Enable GMSL links, mask unused ones and autodetect link

-- 
Regards,

Laurent Pinchart
