Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765F4224588
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 23:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgGQVCb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 17:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgGQVCb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 17:02:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEB6C0619D2;
        Fri, 17 Jul 2020 14:02:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E37B171D;
        Fri, 17 Jul 2020 23:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595019749;
        bh=0uhzC+Mssd0si73Nzsm1nP0SdZBHYqve9sskX1Uq63M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xp4odvCctrRVBrDSt+CGwsBRuvtrE2vbRxjBjGI+SZ8fxI+IfTTX8cq1UR+QRvVY1
         xb0YmrSS+S5+zy5bnARv+N7sjoDFggE0O3W1y5uMaEKOr8DQq7C0ak36WQGWrtRItR
         Q1aGHzzbEXNf0a+2/WQMFRdlGqMzg07efNUHyuho=
Date:   Sat, 18 Jul 2020 00:02:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 11/13] media: i2c: ov5640: Initialize DVP polarities as
 default
Message-ID: <20200717210220.GM5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-12-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-12-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:57PM +0200, Jacopo Mondi wrote:
> With the bindings now updated to initialize the DVP synchronism

s/synchronism/synchronization/

> signals to the values reported by the datasheet, update the driver
> to respect the same default values.
> 
> The driver works-around a documentation bug and reports the VSYNC
> polarity control bit to be inverted. Regardless of the actual
> value written to the hardware register, initialize the DVP configuration
> to the defaults reported by the chip manual and the bindings document:
> 
> - VSYNC: active low
> - HREF:	active low
> - PCLK:	active high
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 2fe4a7ac0592..012ef1df59aa 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1212,9 +1212,9 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>  {
>  	int ret;
>  	unsigned int flags = sensor->ep.bus.parallel.flags;
> -	u8 pclk_pol = 0;
> +	u8 pclk_pol = 1;
>  	u8 hsync_pol = 0;
> -	u8 vsync_pol = 0;
> +	u8 vsync_pol = 1;
>  
>  	/*
>  	 * Note about parallel port configuration.
> @@ -1229,9 +1229,9 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>  	 * devicetree endpoint control lines properties.
>  	 * If no endpoint control lines properties are set,
>  	 * polarity will be as below:
> -	 * - VSYNC:	active high
> +	 * - VSYNC:	active low
>  	 * - HREF:	active low
> -	 * - PCLK:	active low
> +	 * - PCLK:	active high

This changes the existing behaviour, doesn't it break DT backward
compatibility ?

>  	 */
>  
>  	if (on) {
> @@ -1245,12 +1245,12 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>  		 *		datasheet and hardware, 0 is active high
>  		 *		and 1 is active low...)
>  		 */
> -		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> -			pclk_pol = 1;
> +		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> +			pclk_pol = 0;
>  		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>  			hsync_pol = 1;
> -		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> -			vsync_pol = 1;
> +		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
> +			vsync_pol = 0;
>  
>  		ret = ov5640_write_reg(sensor,
>  				       OV5640_REG_POLARITY_CTRL00,

-- 
Regards,

Laurent Pinchart
