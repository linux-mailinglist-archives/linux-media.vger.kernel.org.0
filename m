Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 859E074A0E2
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 17:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbjGFP0K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 11:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjGFP0E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 11:26:04 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2BE1997
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 08:26:02 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e34ad47eeso762014a12.0
        for <linux-media@vger.kernel.org>; Thu, 06 Jul 2023 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688657161; x=1691249161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shLTqDWBu5XzZYtiN3R9WDzSj66GzB8U95qERMVQSR8=;
        b=dhNL0mP668p66Vy2cwqRmFJKC+qzlU1gjCTfY8dbW29mneI9wWlBP7EFH5ZjezJFjE
         iJeauz98yNKJ+EklsCojq0yf4ah5mUop66tUEW/a3mSJLn9aIeHNOkUPLxfMI/BvRR5N
         bTblhNQB2N0NfCxHzdp4WTTW9py+Hv583cz0ppZ+hUKCTePlNJmvFLmwOlKXQdtPqDe7
         XY0P1QnZ+Idio9REuBPoxu0lXuRjKe2cjyxwdHrEYZWaIloNo8sLVDPNWLgyHbHS7Pi8
         W2B48c5WHAGhBJukMBV7cq5anTIcFzlU/7bclE7jw3eE5vTPDGT/q43QLUu7whOUiKEB
         /7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688657161; x=1691249161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shLTqDWBu5XzZYtiN3R9WDzSj66GzB8U95qERMVQSR8=;
        b=IhLjWTkR9hwlU9xnP65TT0DHMTjMeEKJNTbj73n+lobHPnnIfbxMgAVvnw+YL9N7HW
         IE6CahvkcyuB+dH4ljtXKoc5TYlAR2f585jiGCXvLVRYyMNjAI7z000da/rIc+S1mei+
         uyWV6QtWWwtDo6jEZe6AsYBFaa/MRGbM4BqdlArP+23P//exJmMx8u+XTUepsp3MbFsT
         IOa94BHrwsMXXEPyARD06U01LL/Z0vjwfevYK5Cc19iyf/P9qMH6IezqvZwIBYcXwp7B
         s67OzI1XGdwVP0rdjvlAX6tEKI/nifpxkHnrb1reFtq8fDkjmks+1UI7D8zSTRwkwiCN
         WQlQ==
X-Gm-Message-State: ABy/qLa6yMZH/R293GtX6qGMq2NsTYB5u41ee7H3ZavRtwKYLVEMZFX+
        1vszt1J2q7eC2hMiK3V/BGi/lCjhaWdYgRoWlgNta8kTk7ARQw==
X-Google-Smtp-Source: APBJJlEa0jiSvpbWf2x8FyOghH4+PIaY7Pq218EVxMOsldKCYlsHziaSwInrPvm6mM9K6mAPkc9W304A1rkcBC6nYVs=
X-Received: by 2002:a17:906:72de:b0:991:dc98:69ff with SMTP id
 m30-20020a17090672de00b00991dc9869ffmr1674176ejl.67.1688657160522; Thu, 06
 Jul 2023 08:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230706145745.115719-1-hdegoede@redhat.com> <20230706145745.115719-2-hdegoede@redhat.com>
In-Reply-To: <20230706145745.115719-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 6 Jul 2023 18:25:24 +0300
Message-ID: <CAHp75VfXOuUnq720mHgZEbK3Ya8zaBVp86FCELKFxQtLjTmU+g@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] media: i2c: Add driver for DW9719 VCM
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org, Daniel Scally <djrscally@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 6, 2023 at 5:58=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> From: Daniel Scally <djrscally@gmail.com>
>
> Add a driver for the DW9719 VCM. The driver creates a v4l2 subdevice
> and registers a control to set the desired focus.

A few nit-picks below, but looks fine to me
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4 (Hans de Goede)
> - Back to a standalone patch again (instead of being part of a series)
> - Switch to using CCI helpers for register access
> - Use new DEFINE_RUNTIME_DEV_PM_OPS() for pm-ops
> - Make v4l2_subdev first member of dw9719_device
> - Drop v4l2_ctrl_handler_init() ret value check
> - Turn of VCM on dw9719_remove() if necessary
>
> Changes in v3 (Hans de Goede)
> - New patch in v3 of this series based on Dan Scally's initial
>   DW9719 upstream submission:
>   https://lore.kernel.org/all/20211128232115.38833-1-djrscally@gmail.com/
> - Drop hack to enable "vsio" regulator, this is no longer necessary
>   now that there iscamera a device-link making the VCM a runtime-pm consu=
mer
>   of the sensor
> - Add checking of device-properties for sac-mode and vcm-freq,
>   as requested by Sakari, this is done similar to the dw9768:
>   Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
>   Note no devicetree binding doc is added since currently only
>   i2c_device_id enumeration (instantiated by IPU bridge) is
>   supported
> ---
>  MAINTAINERS                |   7 +
>  drivers/media/i2c/Kconfig  |  12 ++
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/dw9719.c | 348 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 368 insertions(+)
>  create mode 100644 drivers/media/i2c/dw9719.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 494682dd437f..cf8e799f6ea2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6266,6 +6266,13 @@ T:       git git://linuxtv.org/media_tree.git
>  F:     Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
>  F:     drivers/media/i2c/dw9714.c
>
> +DONGWOON DW9719 LENS VOICE COIL DRIVER
> +M:     Daniel Scally <djrscally@gmail.com>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +T:     git git://linuxtv.org/media_tree.git
> +F:     drivers/media/i2c/dw9719.c
> +
>  DONGWOON DW9768 LENS VOICE COIL DRIVER
>  L:     linux-media@vger.kernel.org
>  S:     Orphan
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 26dc365365d8..9f2331e9836a 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -875,6 +875,18 @@ config VIDEO_DW9714
>           capability. This is designed for linear control of
>           voice coil motors, controlled via I2C serial interface.
>
> +config VIDEO_DW9719
> +       tristate "DW9719 lens voice coil support"
> +       depends on I2C && VIDEO_DEV
> +       select MEDIA_CONTROLLER
> +       select VIDEO_V4L2_SUBDEV_API
> +       select V4L2_ASYNC
> +       select V4L2_CCI_I2C
> +       help
> +         This is a driver for the DW9719 camera lens voice coil.
> +         This is designed for linear control of voice coil motors,
> +         controlled via I2C serial interface.
> +
>  config VIDEO_DW9768
>         tristate "DW9768 lens voice coil support"
>         depends on I2C && VIDEO_DEV
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index d175a2e2fb19..745f8d07e649 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_VIDEO_DS90UB913) +=3D ds90ub913.o
>  obj-$(CONFIG_VIDEO_DS90UB953) +=3D ds90ub953.o
>  obj-$(CONFIG_VIDEO_DS90UB960) +=3D ds90ub960.o
>  obj-$(CONFIG_VIDEO_DW9714) +=3D dw9714.o
> +obj-$(CONFIG_VIDEO_DW9719) +=3D dw9719.o
>  obj-$(CONFIG_VIDEO_DW9768) +=3D dw9768.o
>  obj-$(CONFIG_VIDEO_DW9807_VCM) +=3D dw9807-vcm.o
>  obj-$(CONFIG_VIDEO_ET8EK8) +=3D et8ek8/
> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> new file mode 100644
> index 000000000000..d8975b5bcfa9
> --- /dev/null
> +++ b/drivers/media/i2c/dw9719.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2012 Intel Corporation
> +
> +/*
> + * Based on linux/modules/camera/drivers/media/i2c/imx/dw9719.c in this =
repo:
> + * https://github.com/ZenfoneArea/android_kernel_asus_zenfone5
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/types.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define DW9719_MAX_FOCUS_POS   1023
> +#define DW9719_CTRL_STEPS      16
> +#define DW9719_CTRL_DELAY_US   1000
> +
> +#define DW9719_INFO                    CCI_REG8(0)
> +#define DW9719_ID                      0xF1
> +
> +#define DW9719_CONTROL                 CCI_REG8(2)
> +#define DW9719_ENABLE_RINGING          0x02
> +
> +#define DW9719_VCM_CURRENT             CCI_REG16(3)
> +
> +#define DW9719_MODE                    CCI_REG8(6)
> +#define DW9719_MODE_SAC_SHIFT          4
> +#define DW9719_MODE_SAC3               4
> +
> +#define DW9719_VCM_FREQ                        CCI_REG8(7)
> +#define DW9719_DEFAULT_VCM_FREQ                0x60
> +
> +#define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
> +
> +struct dw9719_device {
> +       struct v4l2_subdev sd;
> +       struct device *dev;
> +       struct regmap *regmap;
> +       struct regulator *regulator;
> +       u32 sac_mode;
> +       u32 vcm_freq;
> +
> +       struct dw9719_v4l2_ctrls {
> +               struct v4l2_ctrl_handler handler;
> +               struct v4l2_ctrl *focus;
> +       } ctrls;
> +};
> +
> +static int dw9719_detect(struct dw9719_device *dw9719)
> +{
> +       int ret;
> +       u64 val;
> +
> +       ret =3D cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (val !=3D DW9719_ID) {
> +               dev_err(dw9719->dev, "Failed to detect correct id\n");
> +               return -ENXIO;
> +       }
> +
> +       return 0;
> +}
> +
> +static int dw9719_power_down(struct dw9719_device *dw9719)
> +{
> +       return regulator_disable(dw9719->regulator);
> +}
> +
> +static int dw9719_power_up(struct dw9719_device *dw9719)
> +{
> +       int ret;
> +
> +       ret =3D regulator_enable(dw9719->regulator);
> +
> +       /* Jiggle SCL pin to wake up device */
> +       cci_write(dw9719->regmap, DW9719_CONTROL, 1, &ret);
> +
> +       /* Need 100us to transit from SHUTDOWN to STANDBY*/

Still missing space before */.

> +       fsleep(100);
> +
> +       cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, =
&ret);
> +       cci_write(dw9719->regmap, DW9719_MODE,
> +                 dw9719->sac_mode << DW9719_MODE_SAC_SHIFT, &ret);
> +       cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret=
);
> +
> +       if (ret)
> +               dw9719_power_down(dw9719);
> +
> +       return ret;
> +}
> +
> +static int dw9719_t_focus_abs(struct dw9719_device *dw9719, s32 value)
> +{
> +       return cci_write(dw9719->regmap, DW9719_VCM_CURRENT, value, NULL)=
;
> +}
> +
> +static int dw9719_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct dw9719_device *dw9719 =3D container_of(ctrl->handler,
> +                                                   struct dw9719_device,
> +                                                   ctrls.handler);
> +       int ret;
> +
> +       /* Only apply changes to the controls if the device is powered up=
 */
> +       if (!pm_runtime_get_if_in_use(dw9719->dev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_FOCUS_ABSOLUTE:
> +               ret =3D dw9719_t_focus_abs(dw9719, ctrl->val);
> +               break;
> +       default:
> +               ret =3D -EINVAL;
> +       }
> +
> +       pm_runtime_put(dw9719->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops dw9719_ctrl_ops =3D {
> +       .s_ctrl =3D dw9719_set_ctrl,
> +};
> +
> +static int dw9719_suspend(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct dw9719_device *dw9719 =3D to_dw9719_device(sd);
> +       int ret;
> +       int val;
> +
> +       for (val =3D dw9719->ctrls.focus->val; val >=3D 0;
> +            val -=3D DW9719_CTRL_STEPS) {
> +               ret =3D dw9719_t_focus_abs(dw9719, val);
> +               if (ret)
> +                       return ret;

Maybe have a separate definition for the upper limit and put a comment
why we need it this way.

> +               usleep_range(DW9719_CTRL_DELAY_US, DW9719_CTRL_DELAY_US +=
 10);
> +       }
> +
> +       return dw9719_power_down(dw9719);
> +}
> +
> +static int dw9719_resume(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct dw9719_device *dw9719 =3D to_dw9719_device(sd);
> +       int current_focus =3D dw9719->ctrls.focus->val;
> +       int ret;
> +       int val;
> +
> +       ret =3D dw9719_power_up(dw9719);
> +       if (ret)
> +               return ret;
> +
> +       for (val =3D current_focus % DW9719_CTRL_STEPS; val < current_foc=
us;
> +            val +=3D DW9719_CTRL_STEPS) {
> +               ret =3D dw9719_t_focus_abs(dw9719, val);
> +               if (ret)
> +                       goto err_power_down;
> +
> +               usleep_range(DW9719_CTRL_DELAY_US, DW9719_CTRL_DELAY_US +=
 10);
> +       }
> +
> +       return 0;
> +
> +err_power_down:
> +       dw9719_power_down(dw9719);
> +       return ret;
> +}
> +
> +static int dw9719_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh=
)
> +{
> +       return pm_runtime_resume_and_get(sd->dev);
> +}
> +
> +static int dw9719_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *f=
h)
> +{
> +       pm_runtime_put(sd->dev);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops dw9719_internal_ops =3D {
> +       .open =3D dw9719_open,
> +       .close =3D dw9719_close,
> +};
> +
> +static int dw9719_init_controls(struct dw9719_device *dw9719)
> +{
> +       const struct v4l2_ctrl_ops *ops =3D &dw9719_ctrl_ops;
> +       int ret;
> +
> +       v4l2_ctrl_handler_init(&dw9719->ctrls.handler, 1);
> +
> +       dw9719->ctrls.focus =3D v4l2_ctrl_new_std(&dw9719->ctrls.handler,=
 ops,
> +                                               V4L2_CID_FOCUS_ABSOLUTE, =
0,
> +                                               DW9719_MAX_FOCUS_POS, 1, =
0);
> +
> +       if (dw9719->ctrls.handler.error) {
> +               dev_err(dw9719->dev, "Error initialising v4l2 ctrls\n");
> +               ret =3D dw9719->ctrls.handler.error;
> +               goto err_free_handler;
> +       }
> +
> +       dw9719->sd.ctrl_handler =3D &dw9719->ctrls.handler;
> +       return 0;
> +
> +err_free_handler:
> +       v4l2_ctrl_handler_free(&dw9719->ctrls.handler);
> +       return ret;
> +}
> +
> +static const struct v4l2_subdev_ops dw9719_ops =3D { };
> +
> +static int dw9719_probe(struct i2c_client *client)
> +{
> +       struct dw9719_device *dw9719;
> +       int ret;
> +
> +       dw9719 =3D devm_kzalloc(&client->dev, sizeof(*dw9719), GFP_KERNEL=
);
> +       if (!dw9719)
> +               return -ENOMEM;
> +
> +       dw9719->regmap =3D devm_cci_regmap_init_i2c(client, 8);
> +       if (IS_ERR(dw9719->regmap))
> +               return PTR_ERR(dw9719->regmap);
> +
> +       dw9719->dev =3D &client->dev;
> +       dw9719->sac_mode =3D DW9719_MODE_SAC3;
> +       dw9719->vcm_freq =3D DW9719_DEFAULT_VCM_FREQ;
> +
> +       /* Optional indication of SAC mode select */
> +       device_property_read_u32(&client->dev, "dongwoon,sac-mode",
> +                                &dw9719->sac_mode);
> +
> +       /* Optional indication of VCM frequency */
> +       device_property_read_u32(&client->dev, "dongwoon,vcm-freq",
> +                                &dw9719->vcm_freq);
> +
> +       dw9719->regulator =3D devm_regulator_get(&client->dev, "vdd");
> +       if (IS_ERR(dw9719->regulator))
> +               return dev_err_probe(&client->dev, PTR_ERR(dw9719->regula=
tor),
> +                                    "getting regulator\n");
> +
> +       v4l2_i2c_subdev_init(&dw9719->sd, client, &dw9719_ops);
> +       dw9719->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +       dw9719->sd.internal_ops =3D &dw9719_internal_ops;
> +
> +       ret =3D dw9719_init_controls(dw9719);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D media_entity_pads_init(&dw9719->sd.entity, 0, NULL);
> +       if (ret < 0)
> +               goto err_free_ctrl_handler;
> +
> +       dw9719->sd.entity.function =3D MEDIA_ENT_F_LENS;
> +
> +       /*
> +        * We need the driver to work in the event that pm runtime is dis=
able in
> +        * the kernel, so power up and verify the chip now. In the event =
that
> +        * runtime pm is disabled this will leave the chip on, so that th=
e lens
> +        * will work.
> +        */
> +
> +       ret =3D dw9719_power_up(dw9719);
> +       if (ret)
> +               goto err_cleanup_media;
> +
> +       ret =3D dw9719_detect(dw9719);
> +       if (ret)
> +               goto err_powerdown;
> +
> +       pm_runtime_set_active(&client->dev);
> +       pm_runtime_get_noresume(&client->dev);
> +       pm_runtime_enable(&client->dev);
> +
> +       ret =3D v4l2_async_register_subdev(&dw9719->sd);
> +       if (ret < 0)
> +               goto err_pm_runtime;
> +
> +       pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> +       pm_runtime_use_autosuspend(&client->dev);
> +       pm_runtime_put_autosuspend(&client->dev);
> +
> +       return ret;
> +
> +err_pm_runtime:
> +       pm_runtime_disable(&client->dev);
> +       pm_runtime_put_noidle(&client->dev);
> +err_powerdown:
> +       dw9719_power_down(dw9719);
> +err_cleanup_media:
> +       media_entity_cleanup(&dw9719->sd.entity);
> +err_free_ctrl_handler:
> +       v4l2_ctrl_handler_free(&dw9719->ctrls.handler);
> +
> +       return ret;
> +}
> +
> +static void dw9719_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct dw9719_device *dw9719 =3D
> +               container_of(sd, struct dw9719_device, sd);
> +
> +       v4l2_async_unregister_subdev(sd);
> +       v4l2_ctrl_handler_free(&dw9719->ctrls.handler);
> +       media_entity_cleanup(&dw9719->sd.entity);
> +
> +       pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               dw9719_power_down(dw9719);
> +       pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static const struct i2c_device_id dw9719_id_table[] =3D {
> +       { "dw9719" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(dw9719_pm_ops, dw9719_suspend, dw9719_r=
esume,
> +                                NULL);

I would logically split this, i.e.

static DEFINE_RUNTIME_DEV_PM_OPS(dw9719_pm_ops,
                                 dw9719_suspend, dw9719_resume,
                                 NULL);

Or

static DEFINE_RUNTIME_DEV_PM_OPS(dw9719_pm_ops,
                                 dw9719_suspend, dw9719_resume, NULL);

> +static struct i2c_driver dw9719_i2c_driver =3D {
> +       .driver =3D {
> +               .name =3D "dw9719",
> +               .pm =3D pm_sleep_ptr(&dw9719_pm_ops),
> +       },
> +       .probe =3D dw9719_probe,
> +       .remove =3D dw9719_remove,
> +       .id_table =3D dw9719_id_table,
> +};
> +module_i2c_driver(dw9719_i2c_driver);
> +
> +MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
> +MODULE_DESCRIPTION("DW9719 VCM Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.41.0
>


--=20
With Best Regards,
Andy Shevchenko
