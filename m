Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2AB6CEF8A
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 18:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjC2QfS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 12:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjC2QfM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 12:35:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821274201
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 09:35:11 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46F69AD0;
        Wed, 29 Mar 2023 18:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680107709;
        bh=aEVGcAl0M9DbOte7f3uFpfG9esBQyKFt20w2k4Pv5I4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gvntv1tPIT9jFrDmv7PaQ0YlFiKwIf+Mj1rVPPd8P7uB08sV5OwMjeWZ0gRFOJCLx
         1ZcOkCmDeIe/Bu50saRNBuYqPp2sktRXoLAS7erHl5U/8XFfSodH905Plr5wBcTQiz
         Tr+YB4bPyhXeEezUMKl2xcmSxiluORC0m0bD4Kto=
Date:   Wed, 29 Mar 2023 18:35:05 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 1/1] media: ov5670: Fix probe on ACPI
Message-ID: <20230329163505.fxujfyvvnq77jnd4@uno.localdomain>
References: <20230329152210.1554736-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230329152210.1554736-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Wed, Mar 29, 2023 at 06:22:10PM +0300, Sakari Ailus wrote:
> devm_clk_get() will return either an error or NULL, which the driver
> handles, continuing to use the clock of reading the value of the
> clock-frequency property.
>
> However, the value of ov5670->xvclk is left as-is and the other clock
> framework functions aren't capable of handling error values.
>
> Assign ov5670->xvclk to NULL if the clock cannot be found (apart from probe
> deferral case).
>
> Fixes: 8004c91e2095 ("media: i2c: ov5670: Use common clock framework")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Ah yes! Thanks for spotting

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5670.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index f79d908f4531..50c73ad86e21 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -2661,14 +2661,16 @@ static int ov5670_probe(struct i2c_client *client)
>  	}
>
>  	ov5670->xvclk = devm_clk_get(&client->dev, NULL);
> -	if (!IS_ERR_OR_NULL(ov5670->xvclk))
> +	if (!IS_ERR_OR_NULL(ov5670->xvclk)) {
>  		input_clk = clk_get_rate(ov5670->xvclk);
> -	else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
> +	} else if (PTR_ERR(ov5670->xvclk) == -ENOENT) {
>  		device_property_read_u32(&client->dev, "clock-frequency",
>  					 &input_clk);
> -	else
> +		ov5670->xvclk = NULL;
> +	} else {
>  		return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
>  				     "error getting clock\n");
> +	}
>
>  	if (input_clk != OV5670_XVCLK_FREQ) {
>  		dev_err(&client->dev,
> --
> 2.30.2
>
