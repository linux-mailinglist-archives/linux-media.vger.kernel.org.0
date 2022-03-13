Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D35654D75E7
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 15:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234636AbiCMOnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 10:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233811AbiCMOnu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 10:43:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C94179A03
        for <linux-media@vger.kernel.org>; Sun, 13 Mar 2022 07:42:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0FB0475;
        Sun, 13 Mar 2022 15:42:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647182561;
        bh=NTxbgNVy/KnwtdmCuGZt39VrhG4yYipTY1JNIAD/3KU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i1Wldj/ck+dLE8bagEVz7vwDFx5HEUPAnNoJWb4QBzX/8/pYD/Sh5VyQJN5eObOex
         P8mJdUBWWDycgFQUCXSyha/RhdCVu2h8k5hOdc0eOSljRQhShvqT8rwJM+3/JsoZXM
         7m5+M1y6BqxReTOKFhLR9oBpWCTttRjOl8TsW8RQ=
Date:   Sun, 13 Mar 2022 16:42:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 5/6] media: i2c: ov5670: Add runtime_pm operations
Message-ID: <Yi4C0KK0kFXZ/qiZ@pendragon.ideasonboard.com>
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-6-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220310130829.96001-6-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Mar 10, 2022 at 02:08:28PM +0100, Jacopo Mondi wrote:
> Implement the power up and power down routines and install them as
> runtime_pm handler for runtime_suspend and runtime_resume operations.
> 
> Rework the runtime_pm enablement and the chip power handling during
> probe, as calling pm_runtime_idle() in a driver that registers no
> idle callback is a nop.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5670.c | 59 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index ca5191d043ce..c9f69ffef210 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -2,6 +2,8 @@
>  // Copyright (c) 2017 Intel Corporation.
>  
>  #include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>

Isn't this header needed in the previous patch ?

>  #include <linux/i2c.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> @@ -2422,6 +2424,39 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
>  	return ret;
>  }
>  
> +static int __maybe_unused ov5670_power_on(struct device *dev)

I'd name this ov5670_runtime_resume(), and the following function
ov5670_runtime_suspend().

> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov5670 *ov5670 = to_ov5670(sd);
> +	int ret = 0;

No need to initialize ret.

> +
> +	ret = regulator_bulk_enable(OV5670_NUM_SUPPLIES, ov5670->supplies);
> +	if (ret)
> +		return ret;
> +
> +	gpiod_set_value_cansleep(ov5670->pwdn_gpio, 0);
> +	gpiod_set_value_cansleep(ov5670->reset_gpio, 0);
> +
> +	/* 8192 * 2 clock pulses before the first SCCB transaction. */
> +	usleep_range(1000, 1500);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused ov5670_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov5670 *ov5670 = to_ov5670(sd);
> +
> +	gpiod_set_value_cansleep(ov5670->reset_gpio, 1);
> +	gpiod_set_value_cansleep(ov5670->pwdn_gpio, 1);
> +	regulator_bulk_disable(OV5670_NUM_SUPPLIES, ov5670->supplies);
> +
> +	return 0;
> +}
> +
>  static int __maybe_unused ov5670_suspend(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> @@ -2549,14 +2584,25 @@ static int ov5670_probe(struct i2c_client *client)
>  		goto error_print;
>  	}
>  
> +	pm_runtime_enable(&client->dev);
> +
>  	full_power = acpi_dev_state_d0(&client->dev);

That's peculiar. Sakari, is this needed, or is there a way to rely on
runtime PM only ? Or on another API that would abstract the differences
between ACPI and OF ?

>  	if (full_power) {
> +		ret = pm_runtime_resume_and_get(&client->dev);
> +		if (ret) {
> +			err_msg = "Failed to power on";
> +			goto error_print;
> +		}
> +
>  		/* Check module identity */
>  		ret = ov5670_identify_module(ov5670);
>  		if (ret) {
>  			err_msg = "ov5670_identify_module() error";
> -			goto error_print;
> +			goto error_power_off;
>  		}
> +
> +		/* Set the device's state to active if it's in D0 state. */
> +		pm_runtime_set_active(&client->dev);
>  	}
>  
>  	mutex_init(&ov5670->mutex);
> @@ -2593,11 +2639,7 @@ static int ov5670_probe(struct i2c_client *client)
>  
>  	ov5670->streaming = false;
>  
> -	/* Set the device's state to active if it's in D0 state. */
> -	if (full_power)
> -		pm_runtime_set_active(&client->dev);
> -	pm_runtime_enable(&client->dev);
> -	pm_runtime_idle(&client->dev);
> +	pm_runtime_suspend(&client->dev);
>  
>  	return 0;
>  
> @@ -2610,6 +2652,9 @@ static int ov5670_probe(struct i2c_client *client)
>  error_mutex_destroy:
>  	mutex_destroy(&ov5670->mutex);
>  
> +error_power_off:
> +	pm_runtime_put(&client->dev);
> +
>  error_print:
>  	dev_err(&client->dev, "%s: %s %d\n", __func__, err_msg, ret);
>  
> @@ -2626,6 +2671,7 @@ static int ov5670_remove(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  	mutex_destroy(&ov5670->mutex);
>  
> +	pm_runtime_put(&client->dev);
>  	pm_runtime_disable(&client->dev);
>  
>  	return 0;
> @@ -2633,6 +2679,7 @@ static int ov5670_remove(struct i2c_client *client)
>  
>  static const struct dev_pm_ops ov5670_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(ov5670_suspend, ov5670_resume)
> +	SET_RUNTIME_PM_OPS(ov5670_power_off, ov5670_power_on, NULL)
>  };
>  
>  #ifdef CONFIG_ACPI

-- 
Regards,

Laurent Pinchart
