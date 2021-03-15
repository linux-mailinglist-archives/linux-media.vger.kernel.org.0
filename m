Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D820E33C893
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 22:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbhCOVjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 17:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbhCOVjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 17:39:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D90C06174A;
        Mon, 15 Mar 2021 14:39:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE18A316;
        Mon, 15 Mar 2021 22:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615844359;
        bh=JJsaSdWGHL7XuToGZvOEbADw1Z1TItidNCMlsL4DT3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MRMk4sYg1KUWjhT1WnFSPwXnrBmE5fp26kuXSlmxM6FwKjWvrv0u2DFC4lC/rZO2O
         cAJChpPEWi14xxY7+HQlUvtbN1JoLsh312eOtjDYUdz4uOvYzLVJre1Ns+4qQCvQyQ
         TDUr5o/WJ7m/j0bC9d15wZ8QCvsng63unJBbYGBo=
Date:   Mon, 15 Mar 2021 23:38:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/18] media: i2c: max9271: Check max9271_write()
 return
Message-ID: <YE/T4x4HLow0gHbj@pendragon.ideasonboard.com>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-7-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210315131512.133720-7-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 15, 2021 at 02:15:00PM +0100, Jacopo Mondi wrote:
> Check the return value of the max9271_write() function in the
> max9271 library driver.
> 
> While at it, modify an existing condition to be made identical
> to other checks.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/max9271.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> index c495582dcff6..2c7dc7fb9846 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -106,7 +106,10 @@ int max9271_set_serial_link(struct max9271_device *dev, bool enable)
>  	 * Short delays here appear to show bit-errors in the writes following.
>  	 * Therefore a conservative delay seems best here.
>  	 */
> -	max9271_write(dev, 0x04, val);
> +	ret = max9271_write(dev, 0x04, val);
> +	if (ret < 0)
> +		return ret;
> +
>  	usleep_range(5000, 8000);
>  
>  	return 0;
> @@ -118,7 +121,7 @@ int max9271_configure_i2c(struct max9271_device *dev, u8 i2c_config)
>  	int ret;
>  
>  	ret = max9271_write(dev, 0x0d, i2c_config);
> -	if (ret)
> +	if (ret < 0)
>  		return ret;
>  
>  	/* The delay required after an I2C bus configuration change is not
> @@ -143,7 +146,10 @@ int max9271_set_high_threshold(struct max9271_device *dev, bool enable)
>  	 * Enable or disable reverse channel high threshold to increase
>  	 * immunity to power supply noise.
>  	 */
> -	max9271_write(dev, 0x08, enable ? ret | BIT(0) : ret & ~BIT(0));
> +	ret = max9271_write(dev, 0x08, enable ? ret | BIT(0) : ret & ~BIT(0));
> +	if (ret < 0)
> +		return ret;
> +
>  	usleep_range(2000, 2500);
>  
>  	return 0;
> @@ -152,6 +158,8 @@ EXPORT_SYMBOL_GPL(max9271_set_high_threshold);
>  
>  int max9271_configure_gmsl_link(struct max9271_device *dev)
>  {
> +	int ret;
> +
>  	/*
>  	 * Configure the GMSL link:
>  	 *
> @@ -162,16 +170,24 @@ int max9271_configure_gmsl_link(struct max9271_device *dev)
>  	 *
>  	 * TODO: Make the GMSL link configuration parametric.
>  	 */
> -	max9271_write(dev, 0x07, MAX9271_DBL | MAX9271_HVEN |
> -		      MAX9271_EDC_1BIT_PARITY);
> +	ret = max9271_write(dev, 0x07, MAX9271_DBL | MAX9271_HVEN |
> +			    MAX9271_EDC_1BIT_PARITY);
> +	if (ret < 0)
> +		return ret;
> +
>  	usleep_range(5000, 8000);
>  
>  	/*
>  	 * Adjust spread spectrum to +4% and auto-detect pixel clock
>  	 * and serial link rate.
>  	 */
> -	max9271_write(dev, 0x02, MAX9271_SPREAD_SPECT_4 | MAX9271_R02_RES |
> -		      MAX9271_PCLK_AUTODETECT | MAX9271_SERIAL_AUTODETECT);
> +	ret = max9271_write(dev, 0x02,
> +			    MAX9271_SPREAD_SPECT_4 | MAX9271_R02_RES |
> +			    MAX9271_PCLK_AUTODETECT |
> +			    MAX9271_SERIAL_AUTODETECT);
> +	if (ret < 0)
> +		return ret;
> +
>  	usleep_range(5000, 8000);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
