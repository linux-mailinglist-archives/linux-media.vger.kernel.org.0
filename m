Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546822F5765
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 04:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729482AbhAMXZb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 18:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729455AbhAMXY4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 18:24:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAA6C0617B0;
        Wed, 13 Jan 2021 15:13:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B627B2B3;
        Thu, 14 Jan 2021 00:09:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610579399;
        bh=iVRN00n/spCpSEj4NS0krWGJVX1l7bXk5Za8pGWfP74=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bwcP71HYQqhgaYMrpLnwc68pbPEksa5K56iTNj6ku2gHLKt76TOW602Ounh3AdEpQ
         7IYU+lwmVIS4bIwJc+n5ulQ5ylkt9B+x/W6Zfzfm/Lqj89EKLchZSbKdVJA9FV2oBp
         0f6WqwoKJ2HInX8zC8H3RRjA+seGpg8Yuy6JTOrc=
Date:   Thu, 14 Jan 2021 01:09:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v7 2/7] fixup! media: i2c: rdacm21: Fix GPIO handling
Message-ID: <X/99thQ5z/lJGrjJ@pendragon.ideasonboard.com>
References: <20210113185506.119808-1-jacopo+renesas@jmondi.org>
 <20210113185506.119808-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210113185506.119808-3-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Jan 13, 2021 at 07:55:00PM +0100, Jacopo Mondi wrote:
> The MAX9271 GPIO line connected to the OV490 RESETB line is
> GPIO1, not GPO. As the GPIO1 line is not enabled by default, first
> enable it then control the OV490 reset during the MAX9271 configuration
> procedure.
> 
> Before this change the embedded OV490 ISP was not actually reset.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm21.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index f3841369768c..0428e3209463 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -425,27 +425,23 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
>  	if (ret)
>  		return ret;
>  
> -	ret = max9271_configure_gmsl_link(&dev->serializer);
> +	/* Enable GPIO1 and hold OV490 in reset during max9271 configuration. */
> +	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
>  
> -	/* Set GPO high to hold OV490 in reset. */
> -	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPO);
> +	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
>  
> -	ret = max9271_set_address(&dev->serializer, dev->addrs[0]);
> +	ret = max9271_configure_gmsl_link(&dev->serializer);
>  	if (ret)
>  		return ret;
> -	dev->serializer.client->addr = dev->addrs[0];
>  
> -	/*
> -	 * Release OV490 from reset and program address translation
> -	 * before performing OV490 configuration.
> -	 */
> -	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPO);
> +	ret = max9271_set_address(&dev->serializer, dev->addrs[0]);
>  	if (ret)
>  		return ret;
> +	dev->serializer.client->addr = dev->addrs[0];
>  
>  	ret = max9271_set_translation(&dev->serializer, dev->addrs[1],
>  				      OV490_I2C_ADDRESS);
> @@ -453,6 +449,12 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
>  		return ret;
>  	dev->isp->addr = dev->addrs[1];
>  
> +	/* Release OV490 from reset and initialize it. */
> +	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> +	if (ret)
> +		return ret;
> +	usleep_range(3000, 5000);
> +
>  	ret = ov490_initialize(dev);
>  	if (ret)
>  		return ret;

-- 
Regards,

Laurent Pinchart
