Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03D817A2713
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 21:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236881AbjIOTUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 15:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236873AbjIOTTn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 15:19:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9179998;
        Fri, 15 Sep 2023 12:19:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EBD21536;
        Fri, 15 Sep 2023 21:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694805482;
        bh=1Mtbwzle4hZvst63THmBknZjiCbKniG5zLHOofYhMRM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pFF/e5fV8LhjfyUd4igEc7glVVjlKiH3fP9iXL6aPVywFhp9JJ1fUW4DLta2KWre2
         AeGyyf0VRGQizdnW47GDVdnQA7pSzJL7HeooMNRBDMy83OIE00iRQFDRGNhOJLBQgz
         /XkHnu+ZANT4+WBk6B9wRfLgrBBhm2yUjiyys2Lo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntCeo2LVCRbcrx8q+RSvo2B+KcUYRCAkoHCeVywioknM2A@mail.gmail.com>
References: <20230915165946.4183839-1-kieran.bingham@ideasonboard.com> <20230915165946.4183839-3-kieran.bingham@ideasonboard.com> <CAPY8ntCeo2LVCRbcrx8q+RSvo2B+KcUYRCAkoHCeVywioknM2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add ROHM BU64754 Camera Autofocus Actuator
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Gerald Loacker <gerald.loacker@wolfvision.net>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 15 Sep 2023 20:19:32 +0100
Message-ID: <169480557269.84025.9501931492272338428@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Quoting Dave Stevenson (2023-09-15 18:44:02)
> Hi Kieran
>=20
> On Fri, 15 Sept 2023 at 18:02, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> >
> > Add support for the ROHM BU64754 Motor Driver for Camera Autofocus. A
> > V4L2 Subdevice is registered and provides a single
> > V4L2_CID_FOCUS_ABSOLUTE control.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > ---
> >  MAINTAINERS                 |   1 +
> >  drivers/media/i2c/Kconfig   |  13 ++
> >  drivers/media/i2c/Makefile  |   1 +
> >  drivers/media/i2c/bu64754.c | 308 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 323 insertions(+)
> >  create mode 100644 drivers/media/i2c/bu64754.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f43e0ffcaf56..fd244560c317 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18576,6 +18576,7 @@ L:      linux-media@vger.kernel.org
> >  S:     Maintained
> >  T:     git git://linuxtv.org/media_tree.git
> >  F:     Documentation/devicetree/bindings/media/i2c/rohm,bu64754.yaml
> > +F:     drivers/media/i2c/bu64754.c
> >
> >  ROHM MULTIFUNCTION BD9571MWV-M PMIC DEVICE DRIVERS
> >  M:     Marek Vasut <marek.vasut+renesas@gmail.com>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 74ff833ff48c..b7b8004816ed 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -641,6 +641,19 @@ config VIDEO_AK7375
> >           capability. This is designed for linear control of
> >           voice coil motors, controlled via I2C serial interface.
> >
> > +config VIDEO_BU64754
> > +       tristate "BU64754 Motor Driver for Camera Autofocus"
> > +       depends on I2C && VIDEO_DEV
> > +       select MEDIA_CONTROLLER
> > +       select VIDEO_V4L2_SUBDEV_API
> > +       select V4L2_ASYNC
> > +       select V4L2_CCI_I2C
> > +       help
> > +         This is a driver for the BU64754 Motor Driver for Camera
> > +         Autofocus. The BU64754 is an actuator driver IC which can
> > +         control the actuator position precisely using an internal
> > +         Hall Sensor.
>=20
> I can't find any data on this driver.
> Is it still expecting a VCM and hence near instantaneous movement? I
> was noting your comment on the hall sensor and thinking you
> potentially needed to be able to report whether the target position
> had been reached or not. Michael's series at [1] was trying to address
> that.

The hall sensor is internal. The component description is just a
slightly fixed grammar of the product brief.

As I understand it, this is a VCM yes but I have so little visibility.

>=20
> [1] https://patchwork.linuxtv.org/project/linux-media/cover/20230406-feat=
ure-controls-lens-v2-0-faa8ad2bc404@wolfvision.net/
>=20
> > +
> >  config VIDEO_DW9714
> >         tristate "DW9714 lens voice coil support"
> >         depends on I2C && VIDEO_DEV
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 80b00d39b48f..e62aa0df7b1a 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -22,6 +22,7 @@ obj-$(CONFIG_VIDEO_AR0521) +=3D ar0521.o
> >  obj-$(CONFIG_VIDEO_BT819) +=3D bt819.o
> >  obj-$(CONFIG_VIDEO_BT856) +=3D bt856.o
> >  obj-$(CONFIG_VIDEO_BT866) +=3D bt866.o
> > +obj-$(CONFIG_VIDEO_BU64754) +=3D bu64754.o
> >  obj-$(CONFIG_VIDEO_CCS) +=3D ccs/
> >  obj-$(CONFIG_VIDEO_CCS_PLL) +=3D ccs-pll.o
> >  obj-$(CONFIG_VIDEO_CS3308) +=3D cs3308.o
> > diff --git a/drivers/media/i2c/bu64754.c b/drivers/media/i2c/bu64754.c
> > new file mode 100644
> > index 000000000000..3367b6f17660
> > --- /dev/null
> > +++ b/drivers/media/i2c/bu64754.c
> > @@ -0,0 +1,308 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * The BU64754 is an actuator driver IC which can control the
> > + * actuator position precisely using an internal Hall Sensor.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +
> > +#define BU64754_REG_ACTIVE     CCI_REG16(0x07)
> > +#define BU64754_ACTIVE_MODE    0x8080
> > +
> > +#define BU64754_REG_SERVE      CCI_REG16(0xd9)
> > +#define BU64754_SERVE_ON       0x0404
> > +
> > +#define BU64754_REG_POSITION   CCI_REG16(0x45)
> > +#define BU64753_POSITION_MAX   1023 /* 0x3ff */
> > +
> > +#define BU64754_POWER_ON_DELAY 800 /* uS : t1, t3 */
> > +
> > +struct bu64754 {
> > +       struct device *dev;
> > +
> > +       struct v4l2_ctrl_handler ctrls_vcm;
> > +       struct v4l2_subdev sd;
> > +       struct regmap *cci;
> > +
> > +       u16 current_val;
> > +       struct regulator *vdd;
> > +       struct notifier_block notifier;
> > +};
> > +
> > +static inline struct bu64754 *sd_to_bu64754(struct v4l2_subdev *subdev)
> > +{
> > +       return container_of(subdev, struct bu64754, sd);
> > +}
> > +
> > +static int bu64754_set(struct bu64754 *bu64754, u16 position)
> > +{
> > +       int ret;
> > +
> > +       ret =3D cci_write(bu64754->cci, BU64754_REG_POSITION, position,=
 NULL);
> > +       if (ret) {
> > +               dev_err(bu64754->dev, "Set position failed ret=3D%d\n",=
 ret);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int bu64754_active(struct bu64754 *bu64754)
> > +{
> > +       int ret;
> > +
> > +       /* Power on */
> > +       ret =3D cci_write(bu64754->cci, BU64754_REG_ACTIVE, BU64754_ACT=
IVE_MODE,
> > +                       NULL);
> > +       if (ret < 0) {
> > +               dev_err(bu64754->dev, "Failed to set active mode ret =
=3D %d\n",
> > +                       ret);
> > +               return ret;
> > +       }
> > +
> > +       /* Serve on */
> > +       ret =3D cci_write(bu64754->cci, BU64754_REG_SERVE, BU64754_SERV=
E_ON,
> > +                       NULL);
> > +       if (ret < 0) {
> > +               dev_err(bu64754->dev, "Failed to enable serve ret =3D %=
d\n",
> > +                       ret);
> > +               return ret;
> > +       }
> > +
> > +       return bu64754_set(bu64754, bu64754->current_val);
> > +}
> > +
> > +static int bu64754_standby(struct bu64754 *bu64754)
> > +{
> > +       int ret;
> > +
> > +       cci_write(bu64754->cci, BU64754_REG_ACTIVE, 0, &ret);
> > +       if (ret < 0)
> > +               dev_err(bu64754->dev, "Failed to set active mode ret =
=3D %d\n",
> > +                       ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static int bu64754_regulator_event(struct notifier_block *nb,
> > +                                  unsigned long action, void *data)
> > +{
> > +       struct bu64754 *bu64754 =3D container_of(nb, struct bu64754, no=
tifier);
> > +
> > +       if (action & REGULATOR_EVENT_ENABLE) {
> > +               /*
> > +                * Initialisation delay between VDD low->high and avail=
ability
> > +                * i2c operation.
> > +                */
> > +               usleep_range(BU64754_POWER_ON_DELAY,
> > +                            BU64754_POWER_ON_DELAY + 100);
> > +
> > +               bu64754_active(bu64754);
> > +       } else if (action & REGULATOR_EVENT_PRE_DISABLE) {
> > +               bu64754_standby(bu64754);
> > +       }
>=20
> Presumably this is based on the assumption that the same regulator
> controls sensor and lens, so when the sensor is powered up the lens
> position gets restored.
> I'm sure when I suggested doing the same previously it was shot down
> in flames ... found it [2]
>=20
> Personally I think it makes sense that the lens powers up
> automagically, and have almost exactly the same code as this in a
> couple of our VCM drivers, but others disagree.

I've tested this on the Raspberry Pi, and I expect this design model
comes from you originally then. I thought it was a good way to handle
things, but I wasn't aware that others had already disagreed.

Being a module that will connect over the RPi interface, with a single
POWER_EN, indeed - the regulators are shared with the camera, and
synchronising how it is handled seemed reasonable. I guess I have some
more reading to do now then.

I'm already thinking about making a 'simple-vcm' module or parent-driver
that can reduce the boilerplate for the vcms though. There's very little
difference between them all ... and I think they could be abstracted out
substantially to simplify adding new devices.

--
Kieran



>=20
>   Dave
>=20
> [2] https://lore.kernel.org/all/CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=3D=
UeOe0n-o8WrA@mail.gmail.com/
>=20
> > +
> > +       return 0;
> > +}
> > +
> > +static int bu64754_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct bu64754 *bu64754 =3D container_of(ctrl->handler,
> > +               struct bu64754, ctrls_vcm);
> > +
> > +       if (ctrl->id =3D=3D V4L2_CID_FOCUS_ABSOLUTE) {
> > +               bu64754->current_val =3D ctrl->val;
> > +               return bu64754_set(bu64754, ctrl->val);
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops bu64754_vcm_ctrl_ops =3D {
> > +       .s_ctrl =3D bu64754_set_ctrl,
> > +};
> > +
> > +static int bu64754_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh =
*fh)
> > +{
> > +       return pm_runtime_resume_and_get(sd->dev);
> > +}
> > +
> > +static int bu64754_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh=
 *fh)
> > +{
> > +       pm_runtime_put(sd->dev);
> > +       return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_internal_ops bu64754_int_ops =3D {
> > +       .open =3D bu64754_open,
> > +       .close =3D bu64754_close,
> > +};
> > +
> > +static const struct v4l2_subdev_ops bu64754_ops =3D { };
> > +
> > +static void bu64754_subdev_cleanup(struct bu64754 *bu64754)
> > +{
> > +       v4l2_async_unregister_subdev(&bu64754->sd);
> > +       v4l2_ctrl_handler_free(&bu64754->ctrls_vcm);
> > +       media_entity_cleanup(&bu64754->sd.entity);
> > +}
> > +
> > +static int bu64754_init_controls(struct bu64754 *bu64754)
> > +{
> > +       struct v4l2_ctrl_handler *hdl =3D &bu64754->ctrls_vcm;
> > +       const struct v4l2_ctrl_ops *ops =3D &bu64754_vcm_ctrl_ops;
> > +
> > +       v4l2_ctrl_handler_init(hdl, 1);
> > +
> > +       v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE,
> > +                         0, BU64753_POSITION_MAX, 1, 0);
> > +
> > +       bu64754->current_val =3D 0;
> > +
> > +       bu64754->sd.ctrl_handler =3D hdl;
> > +       if (hdl->error) {
> > +               dev_err(bu64754->dev, "%s fail error: 0x%x\n",
> > +                       __func__, hdl->error);
> > +               return hdl->error;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int bu64754_probe(struct i2c_client *client)
> > +{
> > +       struct bu64754 *bu64754;
> > +       int ret;
> > +
> > +       bu64754 =3D devm_kzalloc(&client->dev, sizeof(*bu64754), GFP_KE=
RNEL);
> > +       if (!bu64754)
> > +               return -ENOMEM;
> > +
> > +       bu64754->dev =3D &client->dev;
> > +
> > +       bu64754->cci =3D devm_cci_regmap_init_i2c(client, 8);
> > +       if (IS_ERR(bu64754->cci)) {
> > +               dev_err(bu64754->dev, "Failed to initialize CCI\n");
> > +               return PTR_ERR(bu64754->cci);
> > +       }
> > +
> > +       bu64754->vdd =3D devm_regulator_get_optional(&client->dev, "vdd=
");
> > +       if (IS_ERR(bu64754->vdd)) {
> > +               if (PTR_ERR(bu64754->vdd) !=3D -ENODEV)
> > +                       return PTR_ERR(bu64754->vdd);
> > +
> > +               bu64754->vdd =3D NULL;
> > +       } else {
> > +               bu64754->notifier.notifier_call =3D bu64754_regulator_e=
vent;
> > +
> > +               ret =3D regulator_register_notifier(bu64754->vdd,
> > +                                                 &bu64754->notifier);
> > +               if (ret) {
> > +                       dev_err(bu64754->dev,
> > +                               "could not register regulator notifier\=
n");
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       v4l2_i2c_subdev_init(&bu64754->sd, client, &bu64754_ops);
> > +       bu64754->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +       bu64754->sd.internal_ops =3D &bu64754_int_ops;
> > +       bu64754->sd.entity.function =3D MEDIA_ENT_F_LENS;
> > +
> > +       ret =3D bu64754_init_controls(bu64754);
> > +       if (ret)
> > +               goto err_cleanup;
> > +
> > +       ret =3D media_entity_pads_init(&bu64754->sd.entity, 0, NULL);
> > +       if (ret < 0)
> > +               goto err_cleanup;
> > +
> > +       ret =3D v4l2_async_register_subdev(&bu64754->sd);
> > +       if (ret < 0)
> > +               goto err_cleanup;
> > +
> > +       if (!bu64754->vdd)
> > +               pm_runtime_set_active(&client->dev);
> > +
> > +       pm_runtime_enable(&client->dev);
> > +       pm_runtime_idle(&client->dev);
> > +
> > +       return 0;
> > +
> > +err_cleanup:
> > +       v4l2_ctrl_handler_free(&bu64754->ctrls_vcm);
> > +       media_entity_cleanup(&bu64754->sd.entity);
> > +
> > +       return ret;
> > +}
> > +
> > +static void bu64754_remove(struct i2c_client *client)
> > +{
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct bu64754 *bu64754 =3D sd_to_bu64754(sd);
> > +
> > +       if (bu64754->vdd)
> > +               regulator_unregister_notifier(bu64754->vdd,
> > +                                             &bu64754->notifier);
> > +
> > +       pm_runtime_disable(&client->dev);
> > +
> > +       bu64754_subdev_cleanup(bu64754);
> > +}
> > +
> > +static int __maybe_unused bu64754_vcm_suspend(struct device *dev)
> > +{
> > +       struct i2c_client *client =3D to_i2c_client(dev);
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct bu64754 *bu64754 =3D sd_to_bu64754(sd);
> > +
> > +       if (bu64754->vdd)
> > +               return regulator_disable(bu64754->vdd);
> > +
> > +       return bu64754_standby(bu64754);
> > +}
> > +
> > +static int  __maybe_unused bu64754_vcm_resume(struct device *dev)
> > +{
> > +       struct i2c_client *client =3D to_i2c_client(dev);
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct bu64754 *bu64754 =3D sd_to_bu64754(sd);
> > +
> > +       if (bu64754->vdd)
> > +               return regulator_enable(bu64754->vdd);
> > +
> > +       return bu64754_active(bu64754);
> > +}
> > +
> > +static const struct of_device_id bu64754_of_table[] =3D {
> > +       { .compatible =3D "rohm,bu64754", },
> > +       { /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, bu64754_of_table);
> > +
> > +static SIMPLE_DEV_PM_OPS(bu64754_pm, bu64754_vcm_suspend, bu64754_vcm_=
resume);
> > +
> > +static struct i2c_driver bu64754_i2c_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "bu64754",
> > +               .pm =3D &bu64754_pm,
> > +               .of_match_table =3D bu64754_of_table,
> > +       },
> > +       .probe =3D bu64754_probe,
> > +       .remove =3D bu64754_remove,
> > +};
> > +
> > +module_i2c_driver(bu64754_i2c_driver);
> > +
> > +MODULE_AUTHOR("Kieran Bingham <kieran.bingham@ideasonboard.com>");
> > +MODULE_DESCRIPTION("ROHM BU64754 VCM driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >
