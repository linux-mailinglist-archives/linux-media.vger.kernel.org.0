Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE3D4ED78F
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 12:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234499AbiCaKKJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 06:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233909AbiCaKKI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 06:10:08 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AF4202172
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 03:08:20 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 3B0E01B0004C;
        Thu, 31 Mar 2022 13:08:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1648721298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jdcvEse6/qxKmRyQGr3EY11OweBSvECWptUoOZrvNOQ=;
        b=vZAN/YzAZMnWsOjzGeBUzpeB/55B+zp6CYUlOM3U1lam0Dum7y4p1yQLHSBoMFFgBdOWtS
        jLiV23go3aZsEA6jTyqx5EU8koArJuzxIV+JkLPjNoRCAZlXZvlTAOIENFmoCi5MY51iUw
        zNn+PZrQ1US6FuNgyN8MTmoVTliC5gwvfqf0YXQ1G1V5YgZZ1YQkMaPldEBZWADnlvrRzH
        ZwQeC9IczQyKeaJgGWiQD8qeZArDm51L6A+BtHBhWa+GfDmowcYgbAx0yhZbVVpwil6hb/
        yTPgq0wbqq2VXEm92TuInLffeF6dgcFFLmBw7TK01EcDlPcfjnlJzPnM4jkk7g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B1087634C90;
        Thu, 31 Mar 2022 13:08:17 +0300 (EEST)
Date:   Thu, 31 Mar 2022 13:08:17 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 6/8] media: i2c: ov5670: Add runtime_pm operations
Message-ID: <YkV9kf6UQ5kxZwbe@valkosipuli.retiisi.eu>
References: <20220329090133.338073-1-jacopo@jmondi.org>
 <20220329090133.338073-7-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329090133.338073-7-jacopo@jmondi.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1648721298; a=rsa-sha256;
        cv=none;
        b=o2VSNWFIy8XYJTVyaIFli3jSyNkSu7CMNNTNHCGfFcV9PcnyFV5jrp+fWZUuHFy9CH2nBz
        R7PpL0JZW182VMlValNHib9jNfrzY9wjjIbX57eH8bbvai0WpgboVvs9A54aQMLXTii/dl
        aaIXcj9T2OGqTlF1rzqnf0AdtfCZaUx3P/c6WhvEiSBE4dNUm8v489xX7WI1Jnm2j4JXSl
        4KZW1ga0FDH9DnL5u71qaWZi6O/17qAaZLl+wTXmlcL8LwLaKMFjoDr3tCcOvs0jvT+wEf
        IPstGzKdytnIqZWb6EE+ovUDd5K4gSn5MFI/qrdw949U5+F7CIuy2mQBGeOt6g==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1648721298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jdcvEse6/qxKmRyQGr3EY11OweBSvECWptUoOZrvNOQ=;
        b=MQp24xo6J6NJp6vVAxwnvGJbQ2H1nLtKafDtDJfseKHulDIs0+P3NEynSz+RvOgLW0l7ps
        NKWN6bvr7ROF/GhTic/z5Qchnvs5MOzfSVybKQlxryyitdMQ/ogapYFeOPXLSsuk0CleYK
        Ndf1DtFm85htjz23Il1ykvV5AGBtBuIK4ZItiG+jiGW9nRD+xbx1DXAGuyMs99wcxWBfOH
        zgGKlzk3pmzJkrYugdP44ljwPDa2xkYGwcGbTOtH6TE12SjgAvoVnvYI374zt9RQ3Ms2tS
        AkLsmu+VoTPO7KOq7EXnYH8nA/YJBhGVR26PZQR/Fnz4Fi/CmFlrYNL4PsAJ6Q==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Mar 29, 2022 at 11:01:31AM +0200, Jacopo Mondi wrote:
> Implement the power up and power down routines and install them as
> runtime_pm handler for runtime_suspend and runtime_resume operations.
> 
> Rework the runtime_pm enablement and the chip power handling during
> probe, as calling pm_runtime_idle() in a driver that registers no
> idle callback is a nop.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5670.c | 58 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 9e69b4008917..b63b07d8ca2f 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -4,6 +4,7 @@
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> @@ -2424,6 +2425,39 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
>  	return ret;
>  }
>  
> +static int __maybe_unused ov5670_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov5670 *ov5670 = to_ov5670(sd);
> +	int ret;
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
> +static int __maybe_unused ov5670_runtime_suspend(struct device *dev)
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
> @@ -2564,14 +2598,25 @@ static int ov5670_probe(struct i2c_client *client)
>  		goto error_print;
>  	}
>  
> +	pm_runtime_enable(&client->dev);
> +
>  	full_power = acpi_dev_state_d0(&client->dev);
>  	if (full_power) {
> +		ret = pm_runtime_resume_and_get(&client->dev);

This will power the device on, but only on OF systems.

Could you instead power the device on on OF systems explicitly? That's what
other drivers do, too. The changes would be probably more simple to
implement, too.

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
> @@ -2608,11 +2653,7 @@ static int ov5670_probe(struct i2c_client *client)
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
> @@ -2625,6 +2666,9 @@ static int ov5670_probe(struct i2c_client *client)
>  error_mutex_destroy:
>  	mutex_destroy(&ov5670->mutex);
>  
> +error_power_off:
> +	pm_runtime_put(&client->dev);
> +
>  error_print:
>  	dev_err(&client->dev, "%s: %s %d\n", __func__, err_msg, ret);
>  
> @@ -2641,6 +2685,7 @@ static int ov5670_remove(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  	mutex_destroy(&ov5670->mutex);
>  
> +	pm_runtime_put(&client->dev);
>  	pm_runtime_disable(&client->dev);
>  
>  	return 0;
> @@ -2648,6 +2693,7 @@ static int ov5670_remove(struct i2c_client *client)
>  
>  static const struct dev_pm_ops ov5670_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(ov5670_suspend, ov5670_resume)
> +	SET_RUNTIME_PM_OPS(ov5670_runtime_suspend, ov5670_runtime_resume, NULL)
>  };
>  
>  #ifdef CONFIG_ACPI

-- 
Regards,

Sakari Ailus
