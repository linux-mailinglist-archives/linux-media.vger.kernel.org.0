Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFC433C88D
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 22:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbhCOViK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 17:38:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41552 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbhCOViE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 17:38:04 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C672316;
        Mon, 15 Mar 2021 22:38:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615844282;
        bh=PaMKd3UQr++ihsR12vj9zj6bohVlPxijufQebZ/vWM0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FjlFAa/rYbIsiwSLE+AHng9FZhPQVwJRwAT2ZpO7cpsX0DAcI9xtXcf5Gqn2Wu7Kn
         H/OuZx3QfZCBwkjyXZR4qX1aYT3W4czCyUWRGtJGlziE9uVBHGOVZuNaTtMWgLjXwq
         VK3cE3Aadm8fMde5rVm4OUXs+dumldLUR7sPV/vA=
Date:   Mon, 15 Mar 2021 23:37:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/18] media: i2c: rdacm20: Enable noise immunity
Message-ID: <YE/TlmrLV4ejOjlF@pendragon.ideasonboard.com>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210315131512.133720-3-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 15, 2021 at 02:14:56PM +0100, Jacopo Mondi wrote:
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

I'm still worried by the race with the MCU. Any update on dumping the
MCU configuration to check what it initializes ?

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 90eb73f0e6e9..f7fd5ae955d0 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -541,7 +541,13 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  
>  	dev_info(dev->dev, "Identified MAX9271 + OV10635 device\n");
>  
> -	return 0;
> +	/*
> +	 * Set reverse channel high threshold to increase noise immunity.
> +	 *
> +	 * This should be compensated by increasing the reverse channel
> +	 * amplitude on the remote deserializer side.
> +	 */
> +	return max9271_set_high_threshold(&dev->serializer, true);
>  }
>  
>  static int rdacm20_probe(struct i2c_client *client)

-- 
Regards,

Laurent Pinchart
