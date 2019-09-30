Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D907C205A
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 14:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729357AbfI3MIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 08:08:55 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40300 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbfI3MIz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 08:08:55 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UC8pVN096699;
        Mon, 30 Sep 2019 07:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569845331;
        bh=//vTiosdwJT+rD+7Qz5nDZjcgclNAYeYGAiyyAUOZrk=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=M3zR5Zp4lhpwb5Bv5jVHmHC+YHbKnk8QBhi1SbkHqrxjq5V55vflu1NEzRFGlgjEa
         mmp4HpnS0vut7bvSxbsRtYlmekYax302ziCoxZvZSZKQxQNh+ONzK8WM/V8OOmVDyT
         xgPFugH0zu44DFMmXIdyghJnotepM9C1SUaiEJ6I=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UC8pni046690
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 07:08:51 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 07:08:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 07:08:51 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with SMTP id x8UC8pek015627;
        Mon, 30 Sep 2019 07:08:51 -0500
Date:   Mon, 30 Sep 2019 07:11:02 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v4 6/8] media: i2c: ov2659: Add powerdown/reset gpio
 handling
Message-ID: <20190930121102.krt3mid4ceifmnla@ti.com>
References: <20190927184722.31989-1-bparrot@ti.com>
 <20190927184722.31989-7-bparrot@ti.com>
 <CA+V-a8vdjYoVxScjBAt5fb-sPWjsj53R8JpEfWt4Dvd5Kcr_0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CA+V-a8vdjYoVxScjBAt5fb-sPWjsj53R8JpEfWt4Dvd5Kcr_0Q@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Lad, Prabhakar <prabhakar.csengg@gmail.com> wrote on Fri [2019-Sep-27 22:09:45 +0100]:
> Hi Benoit,
> 
> thank you for the patch.
> 
> On Fri, Sep 27, 2019 at 7:49 PM Benoit Parrot <bparrot@ti.com> wrote:
> >
> > On some board it is possible that the sensor 'powerdown' and or 'reset'
> > pin might be controlled by gpio instead of being tied.
> >
> > To implement we add pm_runtime support which will handle the power
> > up/down sequence when it is available otherwise the sensor will be
> > powered on at module insertion/probe and powered off at module removal.
> >
> > Now originally the driver assumed that the sensor would always stay
> > powered and keep its register setting. We cannot assume this anymore, so
> > every time we "power up" we need to re-program the initial registers
> > configuration first. This was previously done only at probe time.
> >
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/i2c/Kconfig  |  2 +-
> >  drivers/media/i2c/ov2659.c | 88 +++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 87 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 7eee1812bba3..315c1d8bdb7b 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -634,7 +634,7 @@ config VIDEO_OV2640
> >  config VIDEO_OV2659
> >         tristate "OmniVision OV2659 sensor support"
> >         depends on VIDEO_V4L2 && I2C
> > -       depends on MEDIA_CAMERA_SUPPORT
> > +       depends on MEDIA_CAMERA_SUPPORT && GPIOLIB
> >         select V4L2_FWNODE
> >         help
> >           This is a Video4Linux2 sensor driver for the OmniVision
> > diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> > index cd4625432264..7d0baa386644 100644
> > --- a/drivers/media/i2c/ov2659.c
> > +++ b/drivers/media/i2c/ov2659.c
> > @@ -22,9 +22,11 @@
> >
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> > +#include <linux/pm_runtime.h>
> >
> >  #include <media/i2c/ov2659.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -218,6 +220,11 @@ struct ov2659 {
> >         struct sensor_register *format_ctrl_regs;
> >         struct ov2659_pll_ctrl pll;
> >         int streaming;
> > +       /* used to control the sensor PWDN pin */
> > +       struct gpio_desc *pwdn_gpio;
> > +       /* used to control the sensor RESETB pin */
> > +       struct gpio_desc *resetb_gpio;
> > +       int on;
> >  };
> >
> >  static const struct sensor_register ov2659_init_regs[] = {
> > @@ -1184,10 +1191,19 @@ static int ov2659_s_stream(struct v4l2_subdev *sd, int on)
> >                 /* Stop Streaming Sequence */
> >                 ov2659_set_streaming(ov2659, 0);
> >                 ov2659->streaming = on;
> > +               pm_runtime_put(&client->dev);
> >                 goto unlock;
> >         }
> >
> > -       ret = ov2659_set_pixel_clock(ov2659);
> > +       ret = pm_runtime_get_sync(&client->dev);
> > +       if (ret < 0) {
> > +               pm_runtime_put_noidle(&client->dev);
> > +               goto unlock;
> > +       }
> > +
> > +       ret = ov2659_init(sd, 0);
> > +       if (!ret)
> > +               ret = ov2659_set_pixel_clock(ov2659);
> >         if (!ret)
> >                 ret = ov2659_set_frame_size(ov2659);
> >         if (!ret)
> > @@ -1229,6 +1245,9 @@ static int ov2659_s_ctrl(struct v4l2_ctrl *ctrl)
> >         struct ov2659 *ov2659 =
> >                         container_of(ctrl->handler, struct ov2659, ctrls);
> >
> > +       if (!ov2659->on)
> > +               return 0;
> > +
> why is this check only in s_ctrl() ? I think we could just drop this variable.

Well, it is the only place which would yield i2c access without
explicitly turning on power, so we need to make sure it is already on.

See Sakari's comment in the previous iteration.

Benoit

> 
> Cheers,
> --Prabhakar
> 
> >         switch (ctrl->id) {
> >         case V4L2_CID_TEST_PATTERN:
> >                 return ov2659_set_test_pattern(ov2659, ctrl->val);
> > @@ -1246,6 +1265,43 @@ static const char * const ov2659_test_pattern_menu[] = {
> >         "Vertical Color Bars",
> >  };
> >
> > +static int ov2659_power_off(struct device *dev)
> > +{
> > +       struct i2c_client *client = to_i2c_client(dev);
> > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +       struct ov2659 *ov2659 = to_ov2659(sd);
> > +
> > +       dev_dbg(&client->dev, "%s:\n", __func__);
> > +
> > +       gpiod_set_value(ov2659->pwdn_gpio, 1);
> > +
> > +       ov2659->on = false;
> > +
> > +       return 0;
> > +}
> > +
> > +static int ov2659_power_on(struct device *dev)
> > +{
> > +       struct i2c_client *client = to_i2c_client(dev);
> > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +       struct ov2659 *ov2659 = to_ov2659(sd);
> > +
> > +       dev_dbg(&client->dev, "%s:\n", __func__);
> > +
> > +       gpiod_set_value(ov2659->pwdn_gpio, 0);
> > +
> > +       if (ov2659->resetb_gpio) {
> > +               gpiod_set_value(ov2659->resetb_gpio, 1);
> > +               usleep_range(500, 1000);
> > +               gpiod_set_value(ov2659->resetb_gpio, 0);
> > +               usleep_range(3000, 5000);
> > +       }
> > +
> > +       ov2659->on = true;
> > +
> > +       return 0;
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * V4L2 subdev internal operations
> >   */
> > @@ -1326,7 +1382,6 @@ static int ov2659_detect(struct v4l2_subdev *sd)
> >                         ret = -ENODEV;
> >                 } else {
> >                         dev_info(&client->dev, "Found OV%04X sensor\n", id);
> > -                       ret = ov2659_init(sd, 0);
> >                 }
> >         }
> >
> > @@ -1403,6 +1458,18 @@ static int ov2659_probe(struct i2c_client *client)
> >             ov2659->xvclk_frequency > 27000000)
> >                 return -EINVAL;
> >
> > +       /* Optional gpio don't fail if not present */
> > +       ov2659->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
> > +                                                   GPIOD_OUT_LOW);
> > +       if (IS_ERR(ov2659->pwdn_gpio))
> > +               return PTR_ERR(ov2659->pwdn_gpio);
> > +
> > +       /* Optional gpio don't fail if not present */
> > +       ov2659->resetb_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> > +                                                     GPIOD_OUT_HIGH);
> > +       if (IS_ERR(ov2659->resetb_gpio))
> > +               return PTR_ERR(ov2659->resetb_gpio);
> > +
> >         v4l2_ctrl_handler_init(&ov2659->ctrls, 2);
> >         ov2659->link_frequency =
> >                         v4l2_ctrl_new_std(&ov2659->ctrls, &ov2659_ctrl_ops,
> > @@ -1448,6 +1515,8 @@ static int ov2659_probe(struct i2c_client *client)
> >         ov2659->frame_size = &ov2659_framesizes[2];
> >         ov2659->format_ctrl_regs = ov2659_formats[0].format_ctrl_regs;
> >
> > +       ov2659_power_on(&client->dev);
> > +
> >         ret = ov2659_detect(sd);
> >         if (ret < 0)
> >                 goto error;
> > @@ -1461,10 +1530,15 @@ static int ov2659_probe(struct i2c_client *client)
> >
> >         dev_info(&client->dev, "%s sensor driver registered !!\n", sd->name);
> >
> > +       pm_runtime_set_active(&client->dev);
> > +       pm_runtime_enable(&client->dev);
> > +       pm_runtime_idle(&client->dev);
> > +
> >         return 0;
> >
> >  error:
> >         v4l2_ctrl_handler_free(&ov2659->ctrls);
> > +       ov2659_power_off(&client->dev);
> >         media_entity_cleanup(&sd->entity);
> >         mutex_destroy(&ov2659->lock);
> >         return ret;
> > @@ -1480,9 +1554,18 @@ static int ov2659_remove(struct i2c_client *client)
> >         media_entity_cleanup(&sd->entity);
> >         mutex_destroy(&ov2659->lock);
> >
> > +       pm_runtime_disable(&client->dev);
> > +       if (!pm_runtime_status_suspended(&client->dev))
> > +               ov2659_power_off(&client->dev);
> > +       pm_runtime_set_suspended(&client->dev);
> > +
> >         return 0;
> >  }
> >
> > +static const struct dev_pm_ops ov2659_pm_ops = {
> > +       SET_RUNTIME_PM_OPS(ov2659_power_off, ov2659_power_on, NULL)
> > +};
> > +
> >  static const struct i2c_device_id ov2659_id[] = {
> >         { "ov2659", 0 },
> >         { /* sentinel */ },
> > @@ -1500,6 +1583,7 @@ MODULE_DEVICE_TABLE(of, ov2659_of_match);
> >  static struct i2c_driver ov2659_i2c_driver = {
> >         .driver = {
> >                 .name   = DRIVER_NAME,
> > +               .pm     = &ov2659_pm_ops,
> >                 .of_match_table = of_match_ptr(ov2659_of_match),
> >         },
> >         .probe_new      = ov2659_probe,
> > --
> > 2.17.1
> >
