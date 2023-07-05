Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11FF7748553
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 15:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjGENpk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 09:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232186AbjGENpi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 09:45:38 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58834171B
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 06:45:35 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Qx1Bg0f6dz49Q6j;
        Wed,  5 Jul 2023 16:45:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1688564731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=puj1uIPdJ4ZCoFcXtZAIsv9hM1yeoJmRMEkHXSHwEKU=;
        b=gYSqL8awrO/byRxEm9rm3TurunGaLlZuELtQ6MEJY2JGMN2fEdhlG+BWH/qCVOxo2wjmyV
        EBHaLlQb7KHAH4W0V9MqNZU7s6jTBnm3DAysK/8PbYV2LzOyBD3kcP/B7ZGegRdTowCgiN
        5pmtb7647tDiofFOwxajyBZ3bEMbgWDcNYkY2KxfdigxspPqv0ZLS9JXtGIIT1pfQSHpUR
        8SGyfcMsGnUb1wpgGbMiNIojhmky6mXLSUGWDgRz5VTnmCuUm+xRkBZiLGuEZOiS1K/qvz
        hBZhsBqB781ymE5PgOy25oc3yb/bpE7aKGLX46taaF9tNI+LY2jMEcLQ12qqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1688564731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=puj1uIPdJ4ZCoFcXtZAIsv9hM1yeoJmRMEkHXSHwEKU=;
        b=e0g3GETquS4TaLeXPhG0mtteycGciR7gRB5I1ihOKZzEqRlESiyO4vOOjrQUEcQd9aA9Qk
        +nSaX6i7cPWrGXSZN4NF5IMgxCk0OyqUNYimEd/P/ODbHNoCxohA3tV4IPqcRwSMyzBa3A
        KLZLpPakHtBFH3cQmXXq8ykPoaT6J/MVmY+6Qop9hFHwvgF/npwWqiCH8x/z5l6At/zHEf
        91eDOeea0ecTogwrBN+f0RZwSf93rEkQhULjMT3PT1YofWp70vnoabAnOgjXnS92M8QGgh
        MwZu/iMUqCIXQcrCp1cNkAHjMmTeTZcZvpG57CGHqC9JDhnD4cSVtsQeu5h2wQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1688564731; a=rsa-sha256;
        cv=none;
        b=IKAAETH0Zcsq1LyirDrkBorcrsnlAKTz5HFX7eXeugVsm7foZKBwiNrBbKslH7m2YZc2Eb
        wh5J7wjXKhGBO/WaF1vthB4gM+8yS7srb+V/0uX+/1irNDLFmC9t/0nnCy0xSSTdWPRaua
        M5BIpiYOsc9/gcCDcxCnEh5A5puL3p8k5BazPm3Fb+dwN9pLlWooRbpxN+mZG5jZzyYEfc
        +ooacFU6nEwA6yxS4qLM5wqjMrxkDkiXTfepZhKXoYvuqn3bqU80/mAx904Ons9JBh8rDl
        ilIUqfGf2Wz2Y7INVg45fJ6OdL9Gol8zr3+ZMIAGqiaOHriuZxktzu+dS35pzQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 95EEF634C98;
        Wed,  5 Jul 2023 16:45:30 +0300 (EEST)
Date:   Wed, 5 Jul 2023 13:45:30 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 3/5] media: atomisp: gc0310: Turn into standard v4l2
 sensor driver
Message-ID: <ZKVz+u9kTdcpq87p@valkosipuli.retiisi.eu>
References: <20230525190100.130010-1-hdegoede@redhat.com>
 <20230525190100.130010-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525190100.130010-4-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, May 25, 2023 at 09:00:58PM +0200, Hans de Goede wrote:
> Switch the atomisp-gc0310 driver to v4l2 async device registration.
> 
> After this change this driver no longer depends on
> atomisp_gmin_platform and all atomisp-isms are gone.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Drop v4l2_get_acpi_sensor_info() call in this patch
> - Wait for fwnode graph endpoint so that the bridge's ACPI
>   parsing gets a chance to register the GPIO mappings
>   before probing the sensor
> - Switch to endpoint matching
> ---
>  .../media/atomisp/i2c/atomisp-gc0310.c        | 29 ++++++++++++-------
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |  2 ++
>  2 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 1829ba419e3e..9a11793f34f7 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -29,8 +29,6 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  
> -#include "../include/linux/atomisp_gmin_platform.h"
> -
>  #define GC0310_NATIVE_WIDTH			656
>  #define GC0310_NATIVE_HEIGHT			496
>  
> @@ -85,6 +83,7 @@ struct gc0310_device {
>  	struct mutex input_lock;
>  	bool is_streaming;
>  
> +	struct fwnode_handle *ep_fwnode;
>  	struct gpio_desc *reset;
>  	struct gpio_desc *powerdown;
>  
> @@ -596,11 +595,11 @@ static void gc0310_remove(struct i2c_client *client)
>  
>  	dev_dbg(&client->dev, "gc0310_remove...\n");
>  
> -	atomisp_unregister_subdev(sd);
> -	v4l2_device_unregister_subdev(sd);
> +	v4l2_async_unregister_subdev(sd);
>  	media_entity_cleanup(&dev->sd.entity);
>  	v4l2_ctrl_handler_free(&dev->ctrls.handler);
>  	mutex_destroy(&dev->input_lock);
> +	fwnode_handle_put(dev->ep_fwnode);
>  	pm_runtime_disable(&client->dev);
>  }
>  
> @@ -613,19 +612,27 @@ static int gc0310_probe(struct i2c_client *client)
>  	if (!dev)
>  		return -ENOMEM;
>  
> -	ret = v4l2_get_acpi_sensor_info(&client->dev, NULL);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * Sometimes the fwnode graph is initialized by the bridge driver.
> +	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
> +	 */
> +	dev->ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
> +	if (!dev->ep_fwnode)
> +		return dev_err_probe(&client->dev, -EPROBE_DEFER, "waiting for fwnode graph endpoint\n");
>  
>  	dev->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(dev->reset))
> +	if (IS_ERR(dev->reset)) {
> +		fwnode_handle_put(dev->ep_fwnode);
>  		return dev_err_probe(&client->dev, PTR_ERR(dev->reset),
>  				     "getting reset GPIO\n");
> +	}
>  
>  	dev->powerdown = devm_gpiod_get(&client->dev, "powerdown", GPIOD_OUT_HIGH);
> -	if (IS_ERR(dev->powerdown))
> +	if (IS_ERR(dev->powerdown)) {
> +		fwnode_handle_put(dev->ep_fwnode);
>  		return dev_err_probe(&client->dev, PTR_ERR(dev->powerdown),
>  				     "getting powerdown GPIO\n");
> +	}
>  
>  	mutex_init(&dev->input_lock);
>  	v4l2_i2c_subdev_init(&dev->sd, client, &gc0310_ops);
> @@ -645,6 +652,7 @@ static int gc0310_probe(struct i2c_client *client)
>  	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	dev->sd.fwnode = dev->ep_fwnode;

Same for this one: leave as-is --- the v4l2_async_register_subdev()
function will set the device fwnode for this.

>  
>  	ret = gc0310_init_controls(dev);
>  	if (ret) {
> @@ -658,8 +666,7 @@ static int gc0310_probe(struct i2c_client *client)
>  		return ret;
>  	}

This driver should (as well as ov2680) check for the link frequencies. This
is an old sensor so if all users eventually use this via firmware that
lacks this information, there's little benefit for adding the code. But
otherwise this is seen as a bug.

<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks

The raw cameras should use pixel rate and blanking controls for configuring
the frame interval. This one uses s_frame_interval instead, and it may be
difficult to find the information needed for the pixel rate based API.

Cc Jacopo.

>  
> -	ret = atomisp_register_sensor_no_gmin(&dev->sd, 1, ATOMISP_INPUT_FORMAT_RAW_8,
> -					      atomisp_bayer_order_grbg);
> +	ret = v4l2_async_register_subdev_sensor(&dev->sd);
>  	if (ret) {
>  		gc0310_remove(client);
>  		return ret;
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index d7d9cac2c3b8..5268a0d25051 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -89,6 +89,8 @@ static const guid_t atomisp_dsm_guid =
>   * power-management and with v4l2-async probing.
>   */
>  static const struct atomisp_csi2_sensor_config supported_sensors[] = {
> +	/* GalaxyCore GC0310 */
> +	{ "INT0310", 1 },
>  	/* Omnivision OV2680 */
>  	{ "OVTI2680", 1 },
>  };

-- 
Kind regards,

Sakari Ailus
