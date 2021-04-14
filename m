Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1E535FE4D
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 01:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbhDNXOo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 19:14:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38788 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbhDNXOm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 19:14:42 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A92E951E;
        Thu, 15 Apr 2021 01:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618442058;
        bh=8bq/OH4iT+lM6HDvwgt2xqwKGsOYhettA/liqKFhkNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BxTf3nvS6XChHzkMYwkmG5cDVmUKrSQ8nE7zFcJC8iUuOqEKG1eagqO5niPjY98pc
         jFEojpzPbght/e45+/1xltTPrSzeHCQIWxrZxVyJKtfZDHI0KV4NslAc5/2rCry9VL
         pm4lfnCfDu5exrsi/tL4+CC5nWS25yTslriebNik=
Date:   Thu, 15 Apr 2021 02:14:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/17] media: i2c: rdacm20: Enable noise immunity
Message-ID: <YHd3SUvpot1M4mfU@pendragon.ideasonboard.com>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
 <20210412093451.14198-12-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412093451.14198-12-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Apr 12, 2021 at 11:34:45AM +0200, Jacopo Mondi wrote:
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
> index c1a717153303..5e0314a2b1ca 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -539,7 +539,19 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
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
>  static int rdacm20_probe(struct i2c_client *client)

-- 
Regards,

Laurent Pinchart
