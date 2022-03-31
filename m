Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED314ED7CF
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 12:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234169AbiCaKf0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 06:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234624AbiCaKfX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 06:35:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C9B5F4DA
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 03:33:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A144A486;
        Thu, 31 Mar 2022 12:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648722809;
        bh=mDSAPlurM/GQZyOx50EqV3KgYI5OgiNMyO02fhZthgk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ste3bZXIh6IVo5ezkeG3wguPWpbBiyVdEse6TkxCrOAsxi5csTC6WYlWqI9kz203c
         deVDXAdY4xcE0ZjUaE44OL9cSEGVJCAbCuOdmR0AW69Aw4bcG2MXBoRRZbZle5Gu2L
         4gXygM1Jy9TTK9d0aJKqzySFv5Amf4zjgOC5qUB0=
Date:   Thu, 31 Mar 2022 13:33:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 6/8] media: i2c: ov5670: Add runtime_pm operations
Message-ID: <YkWDd17CaGuQCmw/@pendragon.ideasonboard.com>
References: <20220329090133.338073-1-jacopo@jmondi.org>
 <20220329090133.338073-7-jacopo@jmondi.org>
 <YkV9kf6UQ5kxZwbe@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YkV9kf6UQ5kxZwbe@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Mar 31, 2022 at 01:08:17PM +0300, Sakari Ailus wrote:
> On Tue, Mar 29, 2022 at 11:01:31AM +0200, Jacopo Mondi wrote:
> > Implement the power up and power down routines and install them as
> > runtime_pm handler for runtime_suspend and runtime_resume operations.
> > 
> > Rework the runtime_pm enablement and the chip power handling during
> > probe, as calling pm_runtime_idle() in a driver that registers no
> > idle callback is a nop.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5670.c | 58 ++++++++++++++++++++++++++++++++++----
> >  1 file changed, 52 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > index 9e69b4008917..b63b07d8ca2f 100644
> > --- a/drivers/media/i2c/ov5670.c
> > +++ b/drivers/media/i2c/ov5670.c
> > @@ -4,6 +4,7 @@
> >  #include <linux/acpi.h>
> >  #include <linux/clk.h>
> >  #include <linux/gpio/consumer.h>
> > +#include <linux/delay.h>
> >  #include <linux/i2c.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> > @@ -2424,6 +2425,39 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
> >  	return ret;
> >  }
> >  
> > +static int __maybe_unused ov5670_runtime_resume(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct ov5670 *ov5670 = to_ov5670(sd);
> > +	int ret;
> > +
> > +	ret = regulator_bulk_enable(OV5670_NUM_SUPPLIES, ov5670->supplies);
> > +	if (ret)
> > +		return ret;
> > +
> > +	gpiod_set_value_cansleep(ov5670->pwdn_gpio, 0);
> > +	gpiod_set_value_cansleep(ov5670->reset_gpio, 0);
> > +
> > +	/* 8192 * 2 clock pulses before the first SCCB transaction. */
> > +	usleep_range(1000, 1500);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused ov5670_runtime_suspend(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct ov5670 *ov5670 = to_ov5670(sd);
> > +
> > +	gpiod_set_value_cansleep(ov5670->reset_gpio, 1);
> > +	gpiod_set_value_cansleep(ov5670->pwdn_gpio, 1);
> > +	regulator_bulk_disable(OV5670_NUM_SUPPLIES, ov5670->supplies);
> > +
> > +	return 0;
> > +}
> > +
> >  static int __maybe_unused ov5670_suspend(struct device *dev)
> >  {
> >  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > @@ -2564,14 +2598,25 @@ static int ov5670_probe(struct i2c_client *client)
> >  		goto error_print;
> >  	}
> >  
> > +	pm_runtime_enable(&client->dev);
> > +
> >  	full_power = acpi_dev_state_d0(&client->dev);
> >  	if (full_power) {
> > +		ret = pm_runtime_resume_and_get(&client->dev);
> 
> This will power the device on, but only on OF systems.
> 
> Could you instead power the device on on OF systems explicitly? That's what
> other drivers do, too. The changes would be probably more simple to
> implement, too.

Can we fix ACPI to do something more sane instead ? :-) I don't want to
see those complicated patterns replicated in all drivers.

> > +		if (ret) {
> > +			err_msg = "Failed to power on";
> > +			goto error_print;
> > +		}
> > +
> >  		/* Check module identity */
> >  		ret = ov5670_identify_module(ov5670);
> >  		if (ret) {
> >  			err_msg = "ov5670_identify_module() error";
> > -			goto error_print;
> > +			goto error_power_off;
> >  		}
> > +
> > +		/* Set the device's state to active if it's in D0 state. */
> > +		pm_runtime_set_active(&client->dev);
> >  	}
> >  
> >  	mutex_init(&ov5670->mutex);
> > @@ -2608,11 +2653,7 @@ static int ov5670_probe(struct i2c_client *client)
> >  
> >  	ov5670->streaming = false;
> >  
> > -	/* Set the device's state to active if it's in D0 state. */
> > -	if (full_power)
> > -		pm_runtime_set_active(&client->dev);
> > -	pm_runtime_enable(&client->dev);
> > -	pm_runtime_idle(&client->dev);
> > +	pm_runtime_suspend(&client->dev);
> >  
> >  	return 0;
> >  
> > @@ -2625,6 +2666,9 @@ static int ov5670_probe(struct i2c_client *client)
> >  error_mutex_destroy:
> >  	mutex_destroy(&ov5670->mutex);
> >  
> > +error_power_off:
> > +	pm_runtime_put(&client->dev);
> > +
> >  error_print:
> >  	dev_err(&client->dev, "%s: %s %d\n", __func__, err_msg, ret);
> >  
> > @@ -2641,6 +2685,7 @@ static int ov5670_remove(struct i2c_client *client)
> >  	v4l2_ctrl_handler_free(sd->ctrl_handler);
> >  	mutex_destroy(&ov5670->mutex);
> >  
> > +	pm_runtime_put(&client->dev);
> >  	pm_runtime_disable(&client->dev);
> >  
> >  	return 0;
> > @@ -2648,6 +2693,7 @@ static int ov5670_remove(struct i2c_client *client)
> >  
> >  static const struct dev_pm_ops ov5670_pm_ops = {
> >  	SET_SYSTEM_SLEEP_PM_OPS(ov5670_suspend, ov5670_resume)
> > +	SET_RUNTIME_PM_OPS(ov5670_runtime_suspend, ov5670_runtime_resume, NULL)
> >  };
> >  
> >  #ifdef CONFIG_ACPI

-- 
Regards,

Laurent Pinchart
