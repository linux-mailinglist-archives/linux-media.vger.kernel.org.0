Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455B8320EFB
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 02:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhBVBQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 20:16:47 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54556 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhBVBQq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 20:16:46 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC36A517;
        Mon, 22 Feb 2021 02:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613956563;
        bh=UVHO10vcFfsxKsUXdutKQiERSU0wNuxiQ+myyfBxtEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EMozBtUBWfIxfHjpGfcaRRUP01UQTchlH/FsB/rGgYP7QzQXcH15gr3rL2Xpa52v3
         MJ2DXfIWhbI96uCyE83jW359j6F6t9nlPJOJ2/VQ1Qc/l6Pa4UzkcrMMeKaXGd5NL6
         X/FY+xFWkvhGTtuOuTV5dZ1YKhqZmcxpohJ3d3D4=
Date:   Mon, 22 Feb 2021 03:15:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/16] media: i2c: rdacm20: Re-work ov10635 reset
Message-ID: <YDMFuJ/SJ2wJstHe@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-7-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210216174146.106639-7-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Feb 16, 2021 at 06:41:36PM +0100, Jacopo Mondi wrote:
> The OV10635 image sensor embedded in the camera module is currently
> reset after the MAX9271 initialization with two long delays that were
> most probably not correctly characterized.
> 
> Re-work the image sensor reset procedure by holding the chip in reset
> during the MAX9271 configuration, removing the long sleep delays and
> only wait after the chip exits from reset for 350-500 microseconds
> interval, which is larger than the minimum (2048 * (1 / XVCLK)) timeout
> characterized in the chip manual.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index e982373908f2..ea30cc936531 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -477,6 +477,15 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  	if (ret)
>  		return ret;
>  
> +	/* Hold OV10635 in reset during max9271 configuration. */
> +	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> +	if (ret)
> +		return ret;
> +
> +	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> +	if (ret)
> +		return ret;
> +

Unrelated to this patch, it could be nice to rename the GPIO-related
functions to use a similar naming scheme as the gpiod API.

>  	ret = max9271_configure_gmsl_link(&dev->serializer);
>  	if (ret)
>  		return ret;
> @@ -490,23 +499,11 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  		return ret;
>  	dev->serializer.client->addr = dev->addrs[0];
>  
> -	/*
> -	 * Reset the sensor by cycling the OV10635 reset signal connected to the
> -	 * MAX9271 GPIO1 and verify communication with the OV10635.
> -	 */
> -	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> -	if (ret)
> -		return ret;
> -
> -	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> -	if (ret)
> -		return ret;
> -	usleep_range(10000, 15000);

The OV10635 requires the reset signal to be asserted for at least 200µs.
Is this guaranteed by the different calls we have here after asserting
reset ? Maybe a comment to explain this could be useful ?

> -
> +	/* Release ov10635 from reset and initialize it. */
>  	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
> -	usleep_range(10000, 15000);

Maybe a comment here to state that the delay has to be at least 2048
XVCLK cycles would be useful ?

With these taken into account,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	usleep_range(350, 500);
>  
>  	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {
>  		ret = ov10635_read16(dev, OV10635_PID);

-- 
Regards,

Laurent Pinchart
