Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B3B33C04F
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 16:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbhCOPqm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 11:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbhCOPqM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 11:46:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99D9C06174A;
        Mon, 15 Mar 2021 08:46:11 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F29F3556;
        Mon, 15 Mar 2021 16:46:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615823170;
        bh=nu8Gce82/8YXWv4jDaw5uQPeKLuh08PfTtNioz/Z7GQ=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dtEilmM9dDsfprt13YcS4ga2cUztVfvlzkf080j44QsBK9GnT7llTxV7Hb0y9TZyt
         UCzYUtEN+hVAe37oEmSXMTb1O5PQRd3bLYNoQEWJKzLgqYVJP6C+N1NVaJGj79WiLb
         ine/oGoeOoGvBQHcIsZoAu6k/w8X94Erl/ecE81w=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 06/18] media: i2c: max9271: Check max9271_write()
 return
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-7-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <dc98a803-1559-e93c-3270-a55a0ca52849@ideasonboard.com>
Date:   Mon, 15 Mar 2021 15:46:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315131512.133720-7-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 15/03/2021 13:15, Jacopo Mondi wrote:
> Check the return value of the max9271_write() function in the
> max9271 library driver.
> 
> While at it, modify an existing condition to be made identical
> to other checks.

Excellent, much better to catch write errors early.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
> 

