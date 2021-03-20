Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C5E342E47
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 17:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhCTQRY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 12:17:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47058 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhCTQRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 12:17:21 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DC7A8D3;
        Sat, 20 Mar 2021 17:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616257040;
        bh=6p2jriRZclh8y6rdajV+oCAU7mSMijJBs3p1FWS1S6M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jBO5B9ksTc7ZYhYqPaMHT+BNU+mCgEWJjcLJfTRoOO6lhADDAaf1qyCKx0fn9ChCr
         Iiuve4FHm44zcz12zgDrnsNDsXAm27SqO6Ol6a71demj+E3x7SKFpKAOB6Z82QxXSh
         eiRfDkUiKKDNYCp85kgFEF1R98i/XC88ekVQRa5I=
Date:   Sat, 20 Mar 2021 18:16:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/19] media: i2c: rdacm20: Enable noise immunity
Message-ID: <YFYf6NHwgJglCHkN@pendragon.ideasonboard.com>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
 <20210319164148.199192-15-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210319164148.199192-15-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Mar 19, 2021 at 05:41:43PM +0100, Jacopo Mondi wrote:
> Enable the noise immunity threshold at the end of the rdacm20
> initialization routine.
> 
> The rdacm20 camera module has been so far tested with a startup
> delay that allowed the embedded MCU to program the serializer. If
> the initialization routine is run before the MCU programs the
> serializer and the image sensor and their addresses gets changed
> by the rdacm20 driver it is required to manually enable the noise
> immunity threshold to make the communication on the control channel
> more reliable.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm20.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 2881e752efbe..554fd3b3ec3d 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -518,7 +518,19 @@ static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
>  
>  	dev_info(dev->dev, "Identified MAX9271 + OV10635 device\n");
>  
> -	return 0;
> +	/*
> +	 * Set reverse channel high threshold to increase noise immunity.
> +	 *
> +	 * This should be compensated by increasing the reverse channel
> +	 * amplitude on the remote deserializer side.
> +	 *
> +	 * TODO Inspect the embedded MCU programming sequence to make sure
> +	 * there are no conflicts with the configuration applied here.
> +	 *
> +	 * TODO Clarify the embedded MCU startup delay to avoid write
> +	 * collisions on the I2C bus.
> +	 */
> +	return max9271_set_high_threshold(&dev->serializer, true);
>  }
>  
>  static const struct v4l2_subdev_core_ops rdacm20_core_ops = {

-- 
Regards,

Laurent Pinchart
