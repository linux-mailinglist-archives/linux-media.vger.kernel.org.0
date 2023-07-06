Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81EAD7495D7
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 08:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjGFGoE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 02:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjGFGoD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 02:44:03 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25554123
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 23:44:02 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QxRnl4cPQzydf;
        Thu,  6 Jul 2023 09:43:55 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1688625837;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y8Ttt9sfdHN6iGl3Fc1ghH4Z3dW8fBgLc2zpTKeNLv0=;
        b=ITMUfWq03OiHq6mouXfw8znYrY99ZX9Vm7IG75OyCsOoXF/WBpknzq9FGyTQSK2B8cb3d2
        FitUQmM1W0RvqXXMDXKNrYNui71FlNSsiS9YxtVg2TpUThJkTBL7UOJc69GJlzt/bth+/J
        af50XL64jJ+87kKvuql8uwttVAVT9M0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1688625837;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y8Ttt9sfdHN6iGl3Fc1ghH4Z3dW8fBgLc2zpTKeNLv0=;
        b=AoQUc0ncz6X9uGwovIxXwGLeFVk4vWO4T96HFNrlcxuxkEbdAY121HnSMOHiEEoHIXej+E
        t2IX17CsEMVLABi+MnpZIRzsfU9xrRrVM7C49EB4eV7grnlUJIXKAGSvi7mZ02/7nv1qa4
        7z0Ayv8P87hD2Ac0Dfyw/0yyha+On7Q=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1688625837; a=rsa-sha256; cv=none;
        b=GBE595ZeNlvA0ZRXMV9DFKdu8bVjRH6mSSZ9dKk/yyq/fP+gK5CThc9DyUHHL+vE/HmNLT
        xLCIhCeqVdfmlHrhM6IsQIS3lM0f/qOISITrHpwu1rfJAOJjnt9HPHNUU2f8YuQOMpduV4
        83UtKDef0CzVV2ZFKRFNULtzJ3GGbos=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 17E56634CAA;
        Thu,  6 Jul 2023 09:43:55 +0300 (EEST)
Date:   Thu, 6 Jul 2023 06:43:54 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Message-ID: <ZKZiqlEB92lziDYm@valkosipuli.retiisi.eu>
References: <20230525190100.130010-1-hdegoede@redhat.com>
 <20230525190100.130010-4-hdegoede@redhat.com>
 <ZKVz+u9kTdcpq87p@valkosipuli.retiisi.eu>
 <4mdcekmadayjpvvcyjye5cmda52j75wqixw3c2erl3tz5sped7@ti5shg3puk4p>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4mdcekmadayjpvvcyjye5cmda52j75wqixw3c2erl3tz5sped7@ti5shg3puk4p>
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

On Thu, Jul 06, 2023 at 08:37:24AM +0200, Jacopo Mondi wrote:
> Hi Sakari, Hans
> 
> On Wed, Jul 05, 2023 at 01:45:30PM +0000, Sakari Ailus wrote:
> > Hi Hans,
> >
> > On Thu, May 25, 2023 at 09:00:58PM +0200, Hans de Goede wrote:
> > > Switch the atomisp-gc0310 driver to v4l2 async device registration.
> > >
> > > After this change this driver no longer depends on
> > > atomisp_gmin_platform and all atomisp-isms are gone.
> > >
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > > Changes in v2:
> > > - Drop v4l2_get_acpi_sensor_info() call in this patch
> > > - Wait for fwnode graph endpoint so that the bridge's ACPI
> > >   parsing gets a chance to register the GPIO mappings
> > >   before probing the sensor
> > > - Switch to endpoint matching
> > > ---
> > >  .../media/atomisp/i2c/atomisp-gc0310.c        | 29 ++++++++++++-------
> > >  .../media/atomisp/pci/atomisp_csi2_bridge.c   |  2 ++
> > >  2 files changed, 20 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > index 1829ba419e3e..9a11793f34f7 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > @@ -29,8 +29,6 @@
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-device.h>
> > >
> > > -#include "../include/linux/atomisp_gmin_platform.h"
> > > -
> > >  #define GC0310_NATIVE_WIDTH			656
> > >  #define GC0310_NATIVE_HEIGHT			496
> > >
> > > @@ -85,6 +83,7 @@ struct gc0310_device {
> > >  	struct mutex input_lock;
> > >  	bool is_streaming;
> > >
> > > +	struct fwnode_handle *ep_fwnode;
> > >  	struct gpio_desc *reset;
> > >  	struct gpio_desc *powerdown;
> > >
> > > @@ -596,11 +595,11 @@ static void gc0310_remove(struct i2c_client *client)
> > >
> > >  	dev_dbg(&client->dev, "gc0310_remove...\n");
> > >
> > > -	atomisp_unregister_subdev(sd);
> > > -	v4l2_device_unregister_subdev(sd);
> > > +	v4l2_async_unregister_subdev(sd);
> > >  	media_entity_cleanup(&dev->sd.entity);
> > >  	v4l2_ctrl_handler_free(&dev->ctrls.handler);
> > >  	mutex_destroy(&dev->input_lock);
> > > +	fwnode_handle_put(dev->ep_fwnode);
> > >  	pm_runtime_disable(&client->dev);
> > >  }
> > >
> > > @@ -613,19 +612,27 @@ static int gc0310_probe(struct i2c_client *client)
> > >  	if (!dev)
> > >  		return -ENOMEM;
> > >
> > > -	ret = v4l2_get_acpi_sensor_info(&client->dev, NULL);
> > > -	if (ret)
> > > -		return ret;
> > > +	/*
> > > +	 * Sometimes the fwnode graph is initialized by the bridge driver.
> > > +	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
> > > +	 */
> > > +	dev->ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
> > > +	if (!dev->ep_fwnode)
> > > +		return dev_err_probe(&client->dev, -EPROBE_DEFER, "waiting for fwnode graph endpoint\n");
> > >
> > >  	dev->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
> > > -	if (IS_ERR(dev->reset))
> > > +	if (IS_ERR(dev->reset)) {
> > > +		fwnode_handle_put(dev->ep_fwnode);
> > >  		return dev_err_probe(&client->dev, PTR_ERR(dev->reset),
> > >  				     "getting reset GPIO\n");
> > > +	}
> > >
> > >  	dev->powerdown = devm_gpiod_get(&client->dev, "powerdown", GPIOD_OUT_HIGH);
> > > -	if (IS_ERR(dev->powerdown))
> > > +	if (IS_ERR(dev->powerdown)) {
> > > +		fwnode_handle_put(dev->ep_fwnode);
> > >  		return dev_err_probe(&client->dev, PTR_ERR(dev->powerdown),
> > >  				     "getting powerdown GPIO\n");
> > > +	}
> > >
> > >  	mutex_init(&dev->input_lock);
> > >  	v4l2_i2c_subdev_init(&dev->sd, client, &gc0310_ops);
> > > @@ -645,6 +652,7 @@ static int gc0310_probe(struct i2c_client *client)
> > >  	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > >  	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
> > >  	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > +	dev->sd.fwnode = dev->ep_fwnode;
> >
> > Same for this one: leave as-is --- the v4l2_async_register_subdev()
> > function will set the device fwnode for this.
> >
> > >
> > >  	ret = gc0310_init_controls(dev);
> > >  	if (ret) {
> > > @@ -658,8 +666,7 @@ static int gc0310_probe(struct i2c_client *client)
> > >  		return ret;
> > >  	}
> >
> > This driver should (as well as ov2680) check for the link frequencies. This
> > is an old sensor so if all users eventually use this via firmware that
> > lacks this information, there's little benefit for adding the code. But
> > otherwise this is seen as a bug.
> >
> > <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks
> >
> > The raw cameras should use pixel rate and blanking controls for configuring
> > the frame interval. This one uses s_frame_interval instead, and it may be
> > difficult to find the information needed for the pixel rate based API.
> >
> > Cc Jacopo.
> 
> Thanks
> 
> If you intend to use these devices with libcamera be aware we mandate
> support for the following controls
> 
> V4L2_CID_ANALOGUE_GAIN
> V4L2_CID_EXPOSURE
> V4L2_CID_HBLANK
> V4L2_CID_PIXEL_RATE
> V4L2_CID_VBLANK
> 
> https://git.libcamera.org/libcamera/libcamera.git/tree/Documentation/sensor_driver_requirements.rst#n20
> 
> Do you think it would be possible to at least expose them read-only ?
> This -should- be ok for libcamera. Your s_frame_interval() calls then
> need to update the value of the controls.

Can libcamera use s_frame_interval or does it just mean the frame rate will
remain whatever it was when libcamera started?

-- 
Regards,

Sakari Ailus
