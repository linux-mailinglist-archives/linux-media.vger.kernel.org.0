Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96A39612E22
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 01:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiJaAAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Oct 2022 20:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiJaAAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Oct 2022 20:00:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B795F9FC8
        for <linux-media@vger.kernel.org>; Sun, 30 Oct 2022 17:00:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 796997C5;
        Mon, 31 Oct 2022 01:00:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667174435;
        bh=RySgfl+BrtaJUeobChYeqO9yMgoyrYlsMKCCBQHi48A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KUIqf/73D7OrFVdUluH92KQpamRUKYQWgJ5u3kvzCfTxZGSALFskyDmsWhUc4TPwd
         aGsEKc43B3gpPnFP+2IremKu0TaURTPlMWz/QXXjpAwZqNkWf2AESZd00WdzyJJH90
         j74sEFVnpJyrmlvmZqVqLTC2SbOenM89XUKS2l2E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221030225933.74570-2-nicholas@rothemail.net>
References: <20221030225933.74570-1-nicholas@rothemail.net> <20221030225933.74570-2-nicholas@rothemail.net>
Subject: Re: [PATCH] media: i2c: ov8858 Add driver for ov8858
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Nicholas Roth <nicholas@rothemail.net>
To:     Nicholas Roth <nicholas@rothemail.net>, linux-media@vger.kernel.org
Date:   Mon, 31 Oct 2022 00:00:32 +0000
Message-ID: <166717443256.1873815.14920767883603462440@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicholas,

Thank you for getting this on linux-media.

This is a fairly quick review to get things started, as I anticipate
more detailed review comments and discussions are likely.

There's interesting things in here, and first read I thought the OTP
(one time pad) was rockchip specific, due to the r1a r2a names, but
actually that might just be revision differences, so that will be
interesting to see what people make of it.

I don't know if the data in there is specified by omnivision, which
would mean it's something we can rely on to parse, or the integration
vendor, which would mean we can't rely on it ...


Quoting Nicholas Roth (2022-10-30 22:59:33)
> Currently, the ov8858 image sensor is supported downstream in Manjaro
> [1], which depends on Megi's kernel [2].
>=20
> TL;DR: This enables the PinePhone Pro's cameras to work in Waydroid.
>=20
> This is the front-facing (selfie) sensor in the PinePhone Pro.
> Work is ongoing to support the PinePhone Pro and other FOSS phone
> cameras in Waydroid [4], but libcamera's [3] contributing guidelines
> require sensors to be upstreamed.
>=20
> 1: https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephonepr=
o/-/blob/6.0-megi/PKGBUILD
> 2: https://github.com/megous/linux
> 3: libcamera.org
> 4: https://github.com/waydroid/waydroid/issues/519

All patches to the Linux Kernel are required to have a Signed-off-by
tag.

The kernel's submitting patches guide for the kernel is at:=20
 - https://www.kernel.org/doc/html/latest/process/submitting-patches.html


> ---
>  drivers/media/i2c/Kconfig  |   13 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/ov8858.c | 3016 ++++++++++++++++++++++++++++++++++++

We'll need a device tree binding document to be added.


>  3 files changed, 3030 insertions(+)
>  create mode 100644 drivers/media/i2c/ov8858.c
>=20
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7806d4b81716..bca35574c5e3 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -619,6 +619,19 @@ config VIDEO_OV8856
>           To compile this driver as a module, choose M here: the
>           module will be called ov8856.
> =20
> +config VIDEO_OV8858
> +       tristate "OmniVision OV8858 sensor support"
> +       depends on I2C && VIDEO_DEV
> +       select MEDIA_CONTROLLER
> +       select VIDEO_V4L2_SUBDEV_API
> +       select V4L2_FWNODE
> +       help
> +         This is a Video4Linux2 sensor driver for the OmniVision
> +         OV8858 camera sensor.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called ov8858.
> +
>  config VIDEO_OV8865
>         tristate "OmniVision OV8865 sensor support"
>         depends on I2C && PM && VIDEO_DEV
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 0a2933103dd9..d44934fbb92b 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -94,6 +94,7 @@ obj-$(CONFIG_VIDEO_OV7670) +=3D ov7670.o
>  obj-$(CONFIG_VIDEO_OV772X) +=3D ov772x.o
>  obj-$(CONFIG_VIDEO_OV7740) +=3D ov7740.o
>  obj-$(CONFIG_VIDEO_OV8856) +=3D ov8856.o
> +obj-$(CONFIG_VIDEO_OV8858) +=3D ov8858.o
>  obj-$(CONFIG_VIDEO_OV8865) +=3D ov8865.o
>  obj-$(CONFIG_VIDEO_OV9282) +=3D ov9282.o
>  obj-$(CONFIG_VIDEO_OV9640) +=3D ov9640.o
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> new file mode 100644
> index 000000000000..95dabebecb74
> --- /dev/null
> +++ b/drivers/media/i2c/ov8858.c
> @@ -0,0 +1,3016 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ov8858 driver
> + * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
> + * v0.1.0x00 : 1. create file.
> + * V0.0X01.0X02 fix mclk issue when probe multiple camera.
> + * V0.0X01.0X03 add enum_frame_interval function.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/sysfs.h>
> +#include <linux/slab.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/version.h>
> +#include "rk-camera-module.h"
> +
> +#include <media/v4l2-async.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-image-sizes.h>
> +#include <media/v4l2-mediabus.h>
> +#include <media/v4l2-subdev.h>
> +
> +#ifndef V4L2_CID_DIGITAL_GAIN
> +#define V4L2_CID_DIGITAL_GAIN          V4L2_CID_GAIN
> +#endif
> +#define OV8858_PIXEL_RATE              (360000000LL * 2LL * 2LL / 10LL)
> +
> +#define MIPI_FREQ                      360000000U
> +#define OV8858_XVCLK_FREQ              24000000
> +
> +#define CHIP_ID                                0x008858
> +#define OV8858_REG_CHIP_ID             0x300a
> +
> +#define OV8858_REG_CTRL_MODE           0x0100
> +#define OV8858_MODE_SW_STANDBY         0x0
> +#define OV8858_MODE_STREAMING          0x1
> +
> +#define OV8858_REG_EXPOSURE            0x3500
> +#define        OV8858_EXPOSURE_MIN             4
> +#define        OV8858_EXPOSURE_STEP            1
> +#define OV8858_VTS_MAX                 0x7fff
> +
> +#define OV8858_REG_GAIN_H              0x3508
> +#define OV8858_REG_GAIN_L              0x3509
> +#define OV8858_GAIN_H_MASK             0x07
> +#define OV8858_GAIN_H_SHIFT            8
> +#define OV8858_GAIN_L_MASK             0xff
> +#define OV8858_GAIN_MIN                        0x0
> +#define OV8858_GAIN_MAX                        0x7ff
> +#define OV8858_GAIN_STEP               1
> +#define OV8858_GAIN_DEFAULT            0x80
> +
> +#define OV8858_REG_DGAIN_H             0x350a
> +#define OV8858_REG_DGAIN_L             0x350b
> +#define OV8858_DGAIN_H_MASK            0xff
> +#define OV8858_DGAIN_H_SHIFT           6
> +#define OV8858_DGAIN_L_MASK            0x3f
> +#define OV8858_DGAIN_MIN               0x0
> +#define OV8858_DGAIN_MAX               0x3fff
> +#define OV8858_DGAIN_STEP              1
> +#define OV8858_DGAIN_DEFAULT           0x200
> +
> +#define OV8858_REG_TEST_PATTERN                0x5e00
> +#define        OV8858_TEST_PATTERN_ENABLE      0x80
> +#define        OV8858_TEST_PATTERN_DISABLE     0x0
> +
> +#define OV8858_REG_VTS                 0x380e
> +
> +#define REG_NULL                       0xFFFF
> +
> +#define OV8858_REG_VALUE_08BIT         1
> +#define OV8858_REG_VALUE_16BIT         2
> +#define OV8858_REG_VALUE_24BIT         3
> +
> +#define OV8858_LANES                   2
> +#define OV8858_BITS_PER_SAMPLE         10
> +
> +#define OV8858_CHIP_REVISION_REG       0x302A
> +#define OV8858_R1A                     0xb0
> +#define OV8858_R2A                     0xb2
> +
> +#define OF_CAMERA_PINCTRL_STATE_DEFAULT        "rockchip,camera_default"
> +#define OF_CAMERA_PINCTRL_STATE_SLEEP  "rockchip,camera_sleep"

There shouldn't be any platform specifics in this driver.


> +
> +#define OV8858_NAME                    "ov8858"
> +#define OV8858_MEDIA_BUS_FMT           MEDIA_BUS_FMT_SBGGR10_1X10
> +
> +#define ov8858_write_1byte(client, reg, val)   \
> +       ov8858_write_reg((client), (reg), OV8858_REG_VALUE_08BIT, (val))
> +
> +#define ov8858_read_1byte(client, reg, val)    \
> +       ov8858_read_reg((client), (reg), OV8858_REG_VALUE_08BIT, (val))
> +
> +static const struct regval *ov8858_global_regs;
> +
> +struct ov8858_otp_info_r1a {
> +       int flag; // bit[7]: info, bit[6]:wb, bit[5]:vcm, bit[4]:lenc
> +       int module_id;
> +       int lens_id;
> +       int year;
> +       int month;
> +       int day;
> +       int rg_ratio;
> +       int bg_ratio;
> +       int light_rg;
> +       int light_bg;
> +       int lenc[110];
> +       int vcm_start;
> +       int vcm_end;
> +       int vcm_dir;
> +};
> +
> +struct ov8858_otp_info_r2a {
> +       int flag; // bit[7]: info, bit[6]:wb, bit[5]:vcm, bit[4]:lenc
> +       int module_id;
> +       int lens_id;
> +       int year;
> +       int month;
> +       int day;
> +       int rg_ratio;
> +       int bg_ratio;
> +       int lenc[240];
> +       int checksum;
> +       int vcm_start;
> +       int vcm_end;
> +       int vcm_dir;
> +};
> +
> +static const char * const ov8858_supply_names[] =3D {
> +       "avdd",         /* Analog power */
> +       "dovdd",        /* Digital I/O power */
> +       "dvdd",         /* Digital core power */
> +};
> +
> +#define OV8858_NUM_SUPPLIES ARRAY_SIZE(ov8858_supply_names)
> +
> +struct regval {
> +       u16 addr;
> +       u8 val;
> +};
> +
> +struct ov8858_mode {
> +       u32 width;
> +       u32 height;
> +       struct v4l2_fract max_fps;
> +       u32 hts_def;
> +       u32 vts_def;
> +       u32 exp_def;
> +       const struct regval *reg_list;
> +};
> +
> +struct ov8858 {
> +       struct i2c_client       *client;
> +       struct clk              *xvclk;
> +       struct gpio_desc        *reset_gpio;
> +       struct gpio_desc        *pwdn_gpio;
> +       struct regulator_bulk_data supplies[OV8858_NUM_SUPPLIES];
> +
> +       struct pinctrl          *pinctrl;
> +       struct pinctrl_state    *pins_default;
> +       struct pinctrl_state    *pins_sleep;
> +
> +       struct v4l2_subdev      subdev;
> +       struct media_pad        pad;
> +       struct v4l2_ctrl_handler ctrl_handler;
> +       struct v4l2_ctrl        *exposure;
> +       struct v4l2_ctrl        *anal_gain;
> +       struct v4l2_ctrl        *digi_gain;
> +       struct v4l2_ctrl        *hblank;
> +       struct v4l2_ctrl        *vblank;
> +       struct v4l2_ctrl        *test_pattern;
> +       struct mutex            mutex;
> +       bool                    streaming;
> +       const struct ov8858_mode *cur_mode;
> +       bool                    is_r2a;
> +       unsigned int            lane_num;
> +       unsigned int            cfg_num;
> +       unsigned int            pixel_rate;
> +
> +       struct ov8858_otp_info_r1a *otp_r1a;
> +       struct ov8858_otp_info_r2a *otp_r2a;
> +       u32                     module_index;
> +       const char              *module_facing;
> +       const char              *module_name;
> +       const char              *len_name;
> +       struct rkmodule_inf     module_inf;
> +       struct rkmodule_awb_cfg awb_cfg;
> +       struct rkmodule_lsc_cfg lsc_cfg;
> +};
> +
> +#define to_ov8858(sd) container_of(sd, struct ov8858, subdev)
> +
> +struct ov8858_id_name {
> +       u32 id;
> +       char name[RKMODULE_NAME_LEN];
> +};
> +
> +static const struct ov8858_id_name ov8858_module_info[] =3D {
> +       {0x01, "Sunny"},
> +       {0x02, "Truly"},
> +       {0x03, "A-kerr"},
> +       {0x04, "LiteArray"},
> +       {0x05, "Darling"},
> +       {0x06, "Qtech"},
> +       {0x07, "OFlim"},
> +       {0x08, "Huaquan/Kingcom"},
> +       {0x09, "Booyi"},
> +       {0x0a, "Laimu"},
> +       {0x0b, "WDSEN"},
> +       {0x0c, "Sunrise"},
> +       {0x0d, "CameraKing"},
> +       {0x0e, "Sunniness/Riyong"},
> +       {0x0f, "Tongju"},
> +       {0x10, "Seasons/Sijichun"},
> +       {0x11, "Foxconn"},
> +       {0x12, "Importek"},
> +       {0x13, "Altek"},
> +       {0x14, "ABICO/Ability"},
> +       {0x15, "Lite-on"},
> +       {0x16, "Chicony"},
> +       {0x17, "Primax"},
> +       {0x18, "AVC"},
> +       {0x19, "Suyin"},
> +       {0x21, "Sharp"},
> +       {0x31, "MCNEX"},
> +       {0x32, "SEMCO"},
> +       {0x33, "Partron"},
> +       {0x41, "Reach/Zhongliancheng"},
> +       {0x42, "BYD"},
> +       {0x43, "OSTEC(AoShunChuang)"},
> +       {0x44, "Chengli"},
> +       {0x45, "Jiali"},
> +       {0x46, "Chippack"},
> +       {0x47, "RongSheng"},
> +       {0x48, "ShineTech/ShenTai"},
> +       {0x49, "Brodsands"},
> +       {0x50, "Others"},
> +       {0x51, "Method"},
> +       {0x52, "Sunwin"},
> +       {0x53, "LG"},
> +       {0x54, "Goertek"},
> +       {0x00, "Unknown"}

This is an interesting list. We may need to investigate if this is
omnivision specific, or Rockchip specific. Eitherway, I suspect it won't
be suitable to stay in this file ... but I may be surprised.


> +};
> +
> +static const struct ov8858_id_name ov8858_lens_info[] =3D {
> +       {0x10, "Largan 9565A1"},
> +       {0x11, "Largan 9570A/A1"},
> +       {0x12, "Largan 9569A2/A3"},
> +       {0x13, "Largan 40108/A1"},
> +       {0x14, "Largan 50030A1"},
> +       {0x15, "Largan 40109A1"},
> +       {0x16, "Largan 40100/A1"},
> +       {0x17, "Largan 40112/A1"},
> +       {0x30, "Sunny 3813A"},
> +       {0x50, "Kantatsu R5AV08/BV"},
> +       {0x51, "Kantatsu S5AE08"},
> +       {0x52, "Kantatsu S5AE08"},
> +       {0x78, "GSEO 8738"},
> +       {0x79, "GSEO 8744"},
> +       {0x7a, "GSEO 8742"},
> +       {0x80, "Foxconn 8028"},
> +       {0xd8, "XinXu DS-8335"},
> +       {0xd9, "XinXu DS-8341"},
> +       {0x00, "Unknown"}

Same here, but it's going to be interesting to research where these
values come from, and who is setting them.


> +};
> +
> +/*
> + * Xclk 24Mhz
> + */
> +static const struct regval ov8858_global_regs_r1a[] =3D {
> +       //@@5.1.1.1 Initialization (Global Setting)
> +       //; Slave_ID=3D0x6c;
> +       //{0x0103 ,0x01 }, software reset
> +       {0x0100, 0x00},
> +       {0x0100, 0x00},
> +       {0x0100, 0x00},
> +       {0x0100, 0x00},
> +       {0x0302, 0x1e},
> +       {0x0303, 0x00},
> +       {0x0304, 0x03},
> +       {0x030e, 0x00},
> +       {0x030f, 0x09},
> +       {0x0312, 0x01},
> +       {0x031e, 0x0c},
> +       {0x3600, 0x00},
> +       {0x3601, 0x00},
> +       {0x3602, 0x00},
> +       {0x3603, 0x00},
> +       {0x3604, 0x22},
> +       {0x3605, 0x30},
> +       {0x3606, 0x00},
> +       {0x3607, 0x20},
> +       {0x3608, 0x11},
> +       {0x3609, 0x28},
> +       {0x360a, 0x00},
> +       {0x360b, 0x06},
> +       {0x360c, 0xdc},
> +       {0x360d, 0x40},
> +       {0x360e, 0x0c},
> +       {0x360f, 0x20},
> +       {0x3610, 0x07},
> +       {0x3611, 0x20},
> +       {0x3612, 0x88},
> +       {0x3613, 0x80},
> +       {0x3614, 0x58},
> +       {0x3615, 0x00},
> +       {0x3616, 0x4a},
> +       {0x3617, 0xb0},
> +       {0x3618, 0x56},
> +       {0x3619, 0x70},
> +       {0x361a, 0x99},
> +       {0x361b, 0x00},
> +       {0x361c, 0x07},
> +       {0x361d, 0x00},
> +       {0x361e, 0x00},
> +       {0x361f, 0x00},
> +       {0x3638, 0xff},
> +       {0x3633, 0x0c},
> +       {0x3634, 0x0c},
> +       {0x3635, 0x0c},
> +       {0x3636, 0x0c},
> +       {0x3645, 0x13},
> +       {0x3646, 0x83},
> +       {0x364a, 0x07},
> +       {0x3015, 0x01},
> +       {0x3018, 0x32},
> +       {0x3020, 0x93},
> +       {0x3022, 0x01},
> +       {0x3031, 0x0a},
> +       {0x3034, 0x00},
> +       {0x3106, 0x01},
> +       {0x3305, 0xf1},
> +       {0x3308, 0x00},
> +       {0x3309, 0x28},
> +       {0x330a, 0x00},
> +       {0x330b, 0x20},
> +       {0x330c, 0x00},
> +       {0x330d, 0x00},
> +       {0x330e, 0x00},
> +       {0x330f, 0x40},
> +       {0x3307, 0x04},
> +       {0x3500, 0x00},
> +       {0x3501, 0x4d},
> +       {0x3502, 0x40},
> +       {0x3503, 0x00},
> +       {0x3505, 0x80},
> +       {0x3508, 0x04},
> +       {0x3509, 0x00},
> +       {0x350c, 0x00},
> +       {0x350d, 0x80},
> +       {0x3510, 0x00},
> +       {0x3511, 0x02},
> +       {0x3512, 0x00},
> +       {0x3700, 0x18},
> +       {0x3701, 0x0c},
> +       {0x3702, 0x28},
> +       {0x3703, 0x19},
> +       {0x3704, 0x14},
> +       {0x3705, 0x00},
> +       {0x3706, 0x35},
> +       {0x3707, 0x04},
> +       {0x3708, 0x24},
> +       {0x3709, 0x33},
> +       {0x370a, 0x00},
> +       {0x370b, 0xb5},
> +       {0x370c, 0x04},
> +       {0x3718, 0x12},
> +       {0x3719, 0x31},
> +       {0x3712, 0x42},
> +       {0x3714, 0x24},
> +       {0x371e, 0x19},
> +       {0x371f, 0x40},
> +       {0x3720, 0x05},
> +       {0x3721, 0x05},
> +       {0x3724, 0x06},
> +       {0x3725, 0x01},
> +       {0x3726, 0x06},
> +       {0x3728, 0x05},
> +       {0x3729, 0x02},
> +       {0x372a, 0x03},
> +       {0x372b, 0x53},
> +       {0x372c, 0xa3},
> +       {0x372d, 0x53},
> +       {0x372e, 0x06},
> +       {0x372f, 0x10},
> +       {0x3730, 0x01},
> +       {0x3731, 0x06},
> +       {0x3732, 0x14},
> +       {0x3733, 0x10},
> +       {0x3734, 0x40},
> +       {0x3736, 0x20},
> +       {0x373a, 0x05},
> +       {0x373b, 0x06},
> +       {0x373c, 0x0a},
> +       {0x373e, 0x03},
> +       {0x3755, 0x10},
> +       {0x3758, 0x00},
> +       {0x3759, 0x4c},
> +       {0x375a, 0x06},
> +       {0x375b, 0x13},
> +       {0x375c, 0x20},
> +       {0x375d, 0x02},
> +       {0x375e, 0x00},
> +       {0x375f, 0x14},
> +       {0x3768, 0x22},
> +       {0x3769, 0x44},
> +       {0x376a, 0x44},
> +       {0x3761, 0x00},
> +       {0x3762, 0x00},
> +       {0x3763, 0x00},
> +       {0x3766, 0xff},
> +       {0x376b, 0x00},
> +       {0x3772, 0x23},
> +       {0x3773, 0x02},
> +       {0x3774, 0x16},
> +       {0x3775, 0x12},
> +       {0x3776, 0x04},
> +       {0x3777, 0x00},
> +       {0x3778, 0x1b},
> +       {0x37a0, 0x44},
> +       {0x37a1, 0x3d},
> +       {0x37a2, 0x3d},
> +       {0x37a3, 0x00},
> +       {0x37a4, 0x00},
> +       {0x37a5, 0x00},
> +       {0x37a6, 0x00},
> +       {0x37a7, 0x44},
> +       {0x37a8, 0x4c},
> +       {0x37a9, 0x4c},
> +       {0x3760, 0x00},
> +       {0x376f, 0x01},
> +       {0x37aa, 0x44},
> +       {0x37ab, 0x2e},
> +       {0x37ac, 0x2e},
> +       {0x37ad, 0x33},
> +       {0x37ae, 0x0d},
> +       {0x37af, 0x0d},
> +       {0x37b0, 0x00},
> +       {0x37b1, 0x00},
> +       {0x37b2, 0x00},
> +       {0x37b3, 0x42},
> +       {0x37b4, 0x42},
> +       {0x37b5, 0x33},
> +       {0x37b6, 0x00},
> +       {0x37b7, 0x00},
> +       {0x37b8, 0x00},
> +       {0x37b9, 0xff},
> +       {0x3800, 0x00},
> +       {0x3801, 0x0c},
> +       {0x3802, 0x00},
> +       {0x3803, 0x0c},
> +       {0x3804, 0x0c},
> +       {0x3805, 0xd3},
> +       {0x3806, 0x09},
> +       {0x3807, 0xa3},
> +       {0x3808, 0x06},
> +       {0x3809, 0x60},
> +       {0x380a, 0x04},
> +       {0x380b, 0xc8},
> +       {0x380c, 0x07},
> +       {0x380d, 0x88},
> +       {0x380e, 0x04},
> +       {0x380f, 0xdc},
> +       {0x3810, 0x00},
> +       {0x3811, 0x04},
> +       {0x3813, 0x02},
> +       {0x3814, 0x03},
> +       {0x3815, 0x01},
> +       {0x3820, 0x00},
> +       {0x3821, 0x67},
> +       {0x382a, 0x03},
> +       {0x382b, 0x01},
> +       {0x3830, 0x08},
> +       {0x3836, 0x02},
> +       {0x3837, 0x18},
> +       {0x3841, 0xff},
> +       {0x3846, 0x48},
> +       {0x3d85, 0x14},
> +       {0x3f08, 0x08},
> +       {0x3f0a, 0x80},
> +       {0x4000, 0xf1},
> +       {0x4001, 0x10},
> +       {0x4005, 0x10},
> +       {0x4002, 0x27},
> +       {0x4009, 0x81},
> +       {0x400b, 0x0c},
> +       {0x401b, 0x00},
> +       {0x401d, 0x00},
> +       {0x4020, 0x00},
> +       {0x4021, 0x04},
> +       {0x4022, 0x04},
> +       {0x4023, 0xb9},
> +       {0x4024, 0x05},
> +       {0x4025, 0x2a},
> +       {0x4026, 0x05},
> +       {0x4027, 0x2b},
> +       {0x4028, 0x00},
> +       {0x4029, 0x02},
> +       {0x402a, 0x04},
> +       {0x402b, 0x04},
> +       {0x402c, 0x02},
> +       {0x402d, 0x02},
> +       {0x402e, 0x08},
> +       {0x402f, 0x02},
> +       {0x401f, 0x00},
> +       {0x4034, 0x3f},
> +       {0x403d, 0x04},
> +       {0x4300, 0xff},
> +       {0x4301, 0x00},
> +       {0x4302, 0x0f},
> +       {0x4316, 0x00},
> +       {0x4500, 0x38},
> +       {0x4503, 0x18},
> +       {0x4600, 0x00},
> +       {0x4601, 0xcb},
> +       {0x481f, 0x32},
> +       {0x4837, 0x16},
> +       {0x4850, 0x10},
> +       {0x4851, 0x32},
> +       {0x4b00, 0x2a},
> +       {0x4b0d, 0x00},
> +       {0x4d00, 0x04},
> +       {0x4d01, 0x18},
> +       {0x4d02, 0xc3},
> +       {0x4d03, 0xff},
> +       {0x4d04, 0xff},
> +       {0x4d05, 0xff},
> +       {0x5000, 0x7e},
> +       {0x5001, 0x01},
> +       {0x5002, 0x08},
> +       {0x5003, 0x20},
> +       {0x5046, 0x12},
> +       {0x5901, 0x00},
> +       {0x5e00, 0x00},
> +       {0x5e01, 0x41},
> +       {0x382d, 0x7f},
> +       {0x4825, 0x3a},
> +       {0x4826, 0x40},
> +       {0x4808, 0x25},
> +       //{0x0100, 0x01},
> +       {REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + */
> +static const struct regval ov8858_global_regs_r2a_2lane[] =3D {
> +       // MIPI=3D720Mbps, SysClk=3D144Mhz,Dac Clock=3D360Mhz.
> +       //
> +       //
> +       // v00_01_00 (05/29/2014) : initial setting
> +       //
> +       // AM19 : 3617 <- 0xC0
> +       //
> +       // AM20 : change FWC_6K_EN to be default 0x3618=3D0x5a
> +       {0x0103, 0x01},// software reset for OVTATool only
> +       {0x0103, 0x01},// software reset
> +       {0x0100, 0x00},// software standby
> +       {0x0302, 0x1e},// pll1_multi
> +       {0x0303, 0x00},// pll1_divm
> +       {0x0304, 0x03},// pll1_div_mipi
> +       {0x030e, 0x02},// pll2_rdiv
> +       {0x030f, 0x04},// pll2_divsp
> +       {0x0312, 0x03},// pll2_pre_div0, pll2_r_divdac
> +       {0x031e, 0x0c},// pll1_no_lat
> +       {0x3600, 0x00},
> +       {0x3601, 0x00},
> +       {0x3602, 0x00},
> +       {0x3603, 0x00},
> +       {0x3604, 0x22},
> +       {0x3605, 0x20},
> +       {0x3606, 0x00},
> +       {0x3607, 0x20},
> +       {0x3608, 0x11},
> +       {0x3609, 0x28},
> +       {0x360a, 0x00},
> +       {0x360b, 0x05},
> +       {0x360c, 0xd4},
> +       {0x360d, 0x40},
> +       {0x360e, 0x0c},
> +       {0x360f, 0x20},
> +       {0x3610, 0x07},
> +       {0x3611, 0x20},
> +       {0x3612, 0x88},
> +       {0x3613, 0x80},
> +       {0x3614, 0x58},
> +       {0x3615, 0x00},
> +       {0x3616, 0x4a},
> +       {0x3617, 0x90},
> +       {0x3618, 0x5a},
> +       {0x3619, 0x70},
> +       {0x361a, 0x99},
> +       {0x361b, 0x0a},
> +       {0x361c, 0x07},
> +       {0x361d, 0x00},
> +       {0x361e, 0x00},
> +       {0x361f, 0x00},
> +       {0x3638, 0xff},
> +       {0x3633, 0x0f},
> +       {0x3634, 0x0f},
> +       {0x3635, 0x0f},
> +       {0x3636, 0x12},
> +       {0x3645, 0x13},
> +       {0x3646, 0x83},
> +       {0x364a, 0x07},
> +       {0x3015, 0x00},
> +       {0x3018, 0x32}, // MIPI 2 lane
> +       {0x3020, 0x93}, // Clock switch output normal, pclk_div =3D/1
> +       {0x3022, 0x01}, // pd_mipi enable when rst_sync
> +       {0x3031, 0x0a}, // MIPI 10-bit mode
> +       {0x3034, 0x00}, //
> +       {0x3106, 0x01}, // sclk_div, sclk_pre_div
> +       {0x3305, 0xf1},
> +       {0x3308, 0x00},
> +       {0x3309, 0x28},
> +       {0x330a, 0x00},
> +       {0x330b, 0x20},
> +       {0x330c, 0x00},
> +       {0x330d, 0x00},
> +       {0x330e, 0x00},
> +       {0x330f, 0x40},
> +       {0x3307, 0x04},
> +       {0x3500, 0x00}, // exposure H
> +       {0x3501, 0x4d}, // exposure M
> +       {0x3502, 0x40}, // exposure L
> +       {0x3503, 0x80}, // gain delay ?, exposure delay 1 frame, real gain
> +       {0x3505, 0x80}, // gain option
> +       {0x3508, 0x02}, // gain H
> +       {0x3509, 0x00}, // gain L
> +       {0x350c, 0x00}, // short gain H
> +       {0x350d, 0x80}, // short gain L
> +       {0x3510, 0x00}, // short exposure H
> +       {0x3511, 0x02}, // short exposure M
> +       {0x3512, 0x00}, // short exposure L
> +       {0x3700, 0x18},
> +       {0x3701, 0x0c},
> +       {0x3702, 0x28},
> +       {0x3703, 0x19},
> +       {0x3704, 0x14},
> +       {0x3705, 0x00},
> +       {0x3706, 0x82},
> +       {0x3707, 0x04},
> +       {0x3708, 0x24},
> +       {0x3709, 0x33},
> +       {0x370a, 0x01},
> +       {0x370b, 0x82},
> +       {0x370c, 0x04},
> +       {0x3718, 0x12},
> +       {0x3719, 0x31},
> +       {0x3712, 0x42},
> +       {0x3714, 0x24},
> +       {0x371e, 0x19},
> +       {0x371f, 0x40},
> +       {0x3720, 0x05},
> +       {0x3721, 0x05},
> +       {0x3724, 0x06},
> +       {0x3725, 0x01},
> +       {0x3726, 0x06},
> +       {0x3728, 0x05},
> +       {0x3729, 0x02},
> +       {0x372a, 0x03},
> +       {0x372b, 0x53},
> +       {0x372c, 0xa3},
> +       {0x372d, 0x53},
> +       {0x372e, 0x06},
> +       {0x372f, 0x10},
> +       {0x3730, 0x01},
> +       {0x3731, 0x06},
> +       {0x3732, 0x14},
> +       {0x3733, 0x10},
> +       {0x3734, 0x40},
> +       {0x3736, 0x20},
> +       {0x373a, 0x05},
> +       {0x373b, 0x06},
> +       {0x373c, 0x0a},
> +       {0x373e, 0x03},
> +       {0x3750, 0x0a},
> +       {0x3751, 0x0e},
> +       {0x3755, 0x10},
> +       {0x3758, 0x00},
> +       {0x3759, 0x4c},
> +       {0x375a, 0x06},
> +       {0x375b, 0x13},
> +       {0x375c, 0x20},
> +       {0x375d, 0x02},
> +       {0x375e, 0x00},
> +       {0x375f, 0x14},
> +       {0x3768, 0x22},
> +       {0x3769, 0x44},
> +       {0x376a, 0x44},
> +       {0x3761, 0x00},
> +       {0x3762, 0x00},
> +       {0x3763, 0x00},
> +       {0x3766, 0xff},
> +       {0x376b, 0x00},
> +       {0x3772, 0x23},
> +       {0x3773, 0x02},
> +       {0x3774, 0x16},
> +       {0x3775, 0x12},
> +       {0x3776, 0x04},
> +       {0x3777, 0x00},
> +       {0x3778, 0x17},
> +       {0x37a0, 0x44},
> +       {0x37a1, 0x3d},
> +       {0x37a2, 0x3d},
> +       {0x37a3, 0x00},
> +       {0x37a4, 0x00},
> +       {0x37a5, 0x00},
> +       {0x37a6, 0x00},
> +       {0x37a7, 0x44},
> +       {0x37a8, 0x4c},
> +       {0x37a9, 0x4c},
> +       {0x3760, 0x00},
> +       {0x376f, 0x01},
> +       {0x37aa, 0x44},
> +       {0x37ab, 0x2e},
> +       {0x37ac, 0x2e},
> +       {0x37ad, 0x33},
> +       {0x37ae, 0x0d},
> +       {0x37af, 0x0d},
> +       {0x37b0, 0x00},
> +       {0x37b1, 0x00},
> +       {0x37b2, 0x00},
> +       {0x37b3, 0x42},
> +       {0x37b4, 0x42},
> +       {0x37b5, 0x31},
> +       {0x37b6, 0x00},
> +       {0x37b7, 0x00},
> +       {0x37b8, 0x00},
> +       {0x37b9, 0xff},
> +       {0x3800, 0x00}, // x start H
> +       {0x3801, 0x0c}, // x start L
> +       {0x3802, 0x00}, // y start H
> +       {0x3803, 0x0c}, // y start L
> +       {0x3804, 0x0c}, // x end H
> +       {0x3805, 0xd3}, // x end L
> +       {0x3806, 0x09}, // y end H
> +       {0x3807, 0xa3}, // y end L
> +       {0x3808, 0x06}, // x output size H
> +       {0x3809, 0x60}, // x output size L
> +       {0x380a, 0x04}, // y output size H
> +       {0x380b, 0xc8}, // y output size L
> +       {0x380c, 0x07}, // HTS H
> +       {0x380d, 0x88}, // HTS L
> +       {0x380e, 0x04}, // VTS H
> +       {0x380f, 0xdc}, // VTS L
> +       {0x3810, 0x00}, // ISP x win H
> +       {0x3811, 0x04}, // ISP x win L
> +       {0x3813, 0x02}, // ISP y win L
> +       {0x3814, 0x03}, // x odd inc
> +       {0x3815, 0x01}, // x even inc
> +       {0x3820, 0x00}, // vflip off
> +       {0x3821, 0x67}, // mirror on, bin on
> +       {0x382a, 0x03}, // y odd inc
> +       {0x382b, 0x01}, // y even inc
> +       {0x3830, 0x08}, //
> +       {0x3836, 0x02}, //
> +       {0x3837, 0x18}, //
> +       {0x3841, 0xff}, // window auto size enable
> +       {0x3846, 0x48}, //
> +       {0x3d85, 0x16}, // OTP power up load data enable
> +       {0x3d8c, 0x73}, // OTP setting start High
> +       {0x3d8d, 0xde}, // OTP setting start Low
> +       {0x3f08, 0x08}, //
> +       {0x3f0a, 0x00}, //
> +       {0x4000, 0xf1}, // out_range_trig, format_chg_trig
> +       {0x4001, 0x10}, // total 128 black column
> +       {0x4005, 0x10}, // BLC target L
> +       {0x4002, 0x27}, // value used to limit BLC offset
> +       {0x4009, 0x81}, // final BLC offset limitation enable
> +       {0x400b, 0x0c}, // DCBLC on, DCBLC manual mode on
> +       {0x401b, 0x00}, // zero line R coefficient
> +       {0x401d, 0x00}, // zoro line T coefficient
> +       {0x4020, 0x00}, // Anchor left start H
> +       {0x4021, 0x04}, // Anchor left start L
> +       {0x4022, 0x06}, // Anchor left end H
> +       {0x4023, 0x00}, // Anchor left end L
> +       {0x4024, 0x0f}, // Anchor right start H
> +       {0x4025, 0x2a}, // Anchor right start L
> +       {0x4026, 0x0f}, // Anchor right end H
> +       {0x4027, 0x2b}, // Anchor right end L
> +       {0x4028, 0x00}, // top zero line start
> +       {0x4029, 0x02}, // top zero line number
> +       {0x402a, 0x04}, // top black line start
> +       {0x402b, 0x04}, // top black line number
> +       {0x402c, 0x00}, // bottom zero line start
> +       {0x402d, 0x02}, // bottom zoro line number
> +       {0x402e, 0x04}, // bottom black line start
> +       {0x402f, 0x04}, // bottom black line number
> +       {0x401f, 0x00}, // interpolation x/y disable, Anchor one disable
> +       {0x4034, 0x3f}, //
> +       {0x403d, 0x04}, // md_precision_en
> +       {0x4300, 0xff}, // clip max H
> +       {0x4301, 0x00}, // clip min H
> +       {0x4302, 0x0f}, // clip min L, clip max L
> +       {0x4316, 0x00}, //
> +       {0x4500, 0x58}, //
> +       {0x4503, 0x18}, //
> +       {0x4600, 0x00}, //
> +       {0x4601, 0xcb}, //
> +       {0x481f, 0x32}, // clk prepare min
> +       {0x4837, 0x16}, // global timing
> +       {0x4850, 0x10}, // lane 1 =3D 1, lane 0 =3D 0
> +       {0x4851, 0x32}, // lane 3 =3D 3, lane 2 =3D 2
> +       {0x4b00, 0x2a}, //
> +       {0x4b0d, 0x00}, //
> +       {0x4d00, 0x04}, // temperature sensor
> +       {0x4d01, 0x18}, //
> +       {0x4d02, 0xc3}, //
> +       {0x4d03, 0xff}, //
> +       {0x4d04, 0xff}, //
> +       {0x4d05, 0xff}, // temperature sensor
> +       {0x5000, 0xfe}, // lenc on, slave/master AWB gain/statistics enab=
le
> +       {0x5001, 0x01}, // BLC on
> +       {0x5002, 0x08}, // H scale off, WBMATCH off, OTP_DPC
> +       {0x5003, 0x20}, // DPC_DBC buffer control enable, WB
> +       {0x501e, 0x93}, // enable digital gain
> +       {0x5046, 0x12}, //
> +       {0x5780, 0x3e}, // DPC
> +       {0x5781, 0x0f}, //
> +       {0x5782, 0x44}, //
> +       {0x5783, 0x02}, //
> +       {0x5784, 0x01}, //
> +       {0x5785, 0x00}, //
> +       {0x5786, 0x00}, //
> +       {0x5787, 0x04}, //
> +       {0x5788, 0x02}, //
> +       {0x5789, 0x0f}, //
> +       {0x578a, 0xfd}, //
> +       {0x578b, 0xf5}, //
> +       {0x578c, 0xf5}, //
> +       {0x578d, 0x03}, //
> +       {0x578e, 0x08}, //
> +       {0x578f, 0x0c}, //
> +       {0x5790, 0x08}, //
> +       {0x5791, 0x04}, //
> +       {0x5792, 0x00}, //
> +       {0x5793, 0x52}, //
> +       {0x5794, 0xa3}, // DPC
> +       {0x5871, 0x0d}, // Lenc
> +       {0x5870, 0x18}, //
> +       {0x586e, 0x10}, //
> +       {0x586f, 0x08}, //
> +       {0x58f7, 0x01}, //
> +       {0x58f8, 0x3d}, // Lenc
> +       {0x5901, 0x00}, // H skip off, V skip off
> +       {0x5b00, 0x02}, // OTP DPC start address
> +       {0x5b01, 0x10}, // OTP DPC start address
> +       {0x5b02, 0x03}, // OTP DPC end address
> +       {0x5b03, 0xcf}, // OTP DPC end address
> +       {0x5b05, 0x6c}, // recover method =3D 2b11,
> +       {0x5e00, 0x00}, // use 0x3ff to test pattern off
> +       {0x5e01, 0x41}, // window cut enable
> +       {0x382d, 0x7f}, //
> +       {0x4825, 0x3a}, // lpx_p_min
> +       {0x4826, 0x40}, // hs_prepare_min
> +       {0x4808, 0x25}, // wake up delay in 1/1024 s
> +       {0x3763, 0x18}, //
> +       {0x3768, 0xcc}, //
> +       {0x470b, 0x28}, //
> +       {0x4202, 0x00}, //
> +       {0x400d, 0x10}, // BLC offset trigger L
> +       {0x4040, 0x04}, // BLC gain th2
> +       {0x403e, 0x04}, // BLC gain th1
> +       {0x4041, 0xc6}, // BLC
> +       {0x3007, 0x80},
> +       {0x400a, 0x01},
> +       {REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + * max_framerate 30fps
> + * mipi_datarate per lane 720Mbps
> + */
> +static const struct regval ov8858_1632x1224_regs_2lane[] =3D {
> +       // MIPI=3D720Mbps, SysClk=3D144Mhz,Dac Clock=3D360Mhz.
> +       //
> +       // MIPI=3D720Mbps, SysClk=3D144Mhz,Dac Clock=3D360Mhz.
> +       //
> +       //
> +       // v00_01_00 (05/29/2014) : initial setting
> +       //
> +       // AM19 : 3617 <- 0xC0
> +       //
> +       // AM20 : change FWC_6K_EN to be default 0x3618=3D0x5a
> +       {0x0100, 0x00},
> +       {0x3501, 0x4d}, // exposure M
> +       {0x3502, 0x40}, // exposure L
> +       {0x3778, 0x17}, //
> +       {0x3808, 0x06}, // x output size H
> +       {0x3809, 0x60}, // x output size L
> +       {0x380a, 0x04}, // y output size H
> +       {0x380b, 0xc8}, // y output size L
> +       {0x380c, 0x07}, // HTS H
> +       {0x380d, 0x88}, // HTS L
> +       {0x380e, 0x04}, // VTS H
> +       {0x380f, 0xdc}, // VTS L
> +       {0x3814, 0x03}, // x odd inc
> +       {0x3821, 0x67}, // mirror on, bin on
> +       {0x382a, 0x03}, // y odd inc
> +       {0x3830, 0x08},
> +       {0x3836, 0x02},
> +       {0x3f0a, 0x00},
> +       {0x4001, 0x10}, // total 128 black column
> +       {0x4022, 0x06}, // Anchor left end H
> +       {0x4023, 0x00}, // Anchor left end L
> +       {0x4025, 0x2a}, // Anchor right start L
> +       {0x4027, 0x2b}, // Anchor right end L
> +       {0x402b, 0x04}, // top black line number
> +       {0x402f, 0x04}, // bottom black line number
> +       {0x4500, 0x58},
> +       {0x4600, 0x00},
> +       {0x4601, 0xcb},
> +       {0x382d, 0x7f},
> +       {0x0100, 0x01},
> +       {REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + * max_framerate 15fps
> + * mipi_datarate per lane 720Mbps
> + */
> +static const struct regval ov8858_3264x2448_regs_2lane[] =3D {
> +       {0x0100, 0x00},
> +       {0x3501, 0x9a},// exposure M
> +       {0x3502, 0x20},// exposure L
> +       {0x3778, 0x1a},//
> +       {0x3808, 0x0c},// x output size H
> +       {0x3809, 0xc0},// x output size L
> +       {0x380a, 0x09},// y output size H
> +       {0x380b, 0x90},// y output size L
> +       {0x380c, 0x07},// HTS H
> +       {0x380d, 0x94},// HTS L
> +       {0x380e, 0x09},// VTS H
> +       {0x380f, 0xaa},// VTS L
> +       {0x3814, 0x01},// x odd inc
> +       {0x3821, 0x46},// mirror on, bin off
> +       {0x382a, 0x01},// y odd inc
> +       {0x3830, 0x06},
> +       {0x3836, 0x01},
> +       {0x3f0a, 0x00},
> +       {0x4001, 0x00},// total 256 black column
> +       {0x4022, 0x0c},// Anchor left end H
> +       {0x4023, 0x60},// Anchor left end L
> +       {0x4025, 0x36},// Anchor right start L
> +       {0x4027, 0x37},// Anchor right end L
> +       {0x402b, 0x08},// top black line number
> +       {0x402f, 0x08},// bottom black line number
> +       {0x4500, 0x58},
> +       {0x4600, 0x01},
> +       {0x4601, 0x97},
> +       {0x382d, 0xff},
> +       {REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + */
> +static const struct regval ov8858_global_regs_r2a_4lane[] =3D {
> +       //
> +       // MIPI=3D720Mbps, SysClk=3D144Mhz,Dac Clock=3D360Mhz.
> +       //
> +       // v00_01_00 (05/29/2014) : initial setting
> +       //
> +       // AM19 : 3617 <- 0xC0
> +       //
> +       // AM20 : change FWC_6K_EN to be default 0x3618=3D0x5a
> +       {0x0103, 0x01}, // software reset for OVTATool only
> +       {0x0103, 0x01}, // software reset
> +       {0x0100, 0x00}, // software standby
> +       {0x0302, 0x1e}, // pll1_multi
> +       {0x0303, 0x00}, // pll1_divm
> +       {0x0304, 0x03}, // pll1_div_mipi
> +       {0x030e, 0x00}, // pll2_rdiv
> +       {0x030f, 0x04}, // pll2_divsp
> +       {0x0312, 0x01}, // pll2_pre_div0, pll2_r_divdac
> +       {0x031e, 0x0c}, // pll1_no_lat
> +       {0x3600, 0x00},
> +       {0x3601, 0x00},
> +       {0x3602, 0x00},
> +       {0x3603, 0x00},
> +       {0x3604, 0x22},
> +       {0x3605, 0x20},
> +       {0x3606, 0x00},
> +       {0x3607, 0x20},
> +       {0x3608, 0x11},
> +       {0x3609, 0x28},
> +       {0x360a, 0x00},
> +       {0x360b, 0x05},
> +       {0x360c, 0xd4},
> +       {0x360d, 0x40},
> +       {0x360e, 0x0c},
> +       {0x360f, 0x20},
> +       {0x3610, 0x07},
> +       {0x3611, 0x20},
> +       {0x3612, 0x88},
> +       {0x3613, 0x80},
> +       {0x3614, 0x58},
> +       {0x3615, 0x00},
> +       {0x3616, 0x4a},
> +       {0x3617, 0x90},
> +       {0x3618, 0x5a},
> +       {0x3619, 0x70},
> +       {0x361a, 0x99},
> +       {0x361b, 0x0a},
> +       {0x361c, 0x07},
> +       {0x361d, 0x00},
> +       {0x361e, 0x00},
> +       {0x361f, 0x00},
> +       {0x3638, 0xff},
> +       {0x3633, 0x0f},
> +       {0x3634, 0x0f},
> +       {0x3635, 0x0f},
> +       {0x3636, 0x12},
> +       {0x3645, 0x13},
> +       {0x3646, 0x83},
> +       {0x364a, 0x07},
> +       {0x3015, 0x01}, //
> +       {0x3018, 0x72}, // MIPI 4 lane
> +       {0x3020, 0x93}, // Clock switch output normal, pclk_div =3D/1
> +       {0x3022, 0x01}, // pd_mipi enable when rst_sync
> +       {0x3031, 0x0a}, // MIPI 10-bit mode
> +       {0x3034, 0x00}, //
> +       {0x3106, 0x01}, // sclk_div, sclk_pre_div
> +       {0x3305, 0xf1},
> +       {0x3308, 0x00},
> +       {0x3309, 0x28},
> +       {0x330a, 0x00},
> +       {0x330b, 0x20},
> +       {0x330c, 0x00},
> +       {0x330d, 0x00},
> +       {0x330e, 0x00},
> +       {0x330f, 0x40},
> +       {0x3307, 0x04},
> +       {0x3500, 0x00}, // exposure H
> +       {0x3501, 0x4d}, // exposure M
> +       {0x3502, 0x40}, // exposure L
> +       {0x3503, 0x80}, // gain delay ?, exposure delay 1 frame, real gain
> +       {0x3505, 0x80}, // gain option
> +       {0x3508, 0x04}, // gain H
> +       {0x3509, 0x00}, // gain L
> +       {0x350c, 0x00}, // short gain H
> +       {0x350d, 0x80}, // short gain L
> +       {0x3510, 0x00}, // short exposure H
> +       {0x3511, 0x02}, // short exposure M
> +       {0x3512, 0x00}, // short exposure L
> +       {0x3700, 0x30},
> +       {0x3701, 0x18},
> +       {0x3702, 0x50},
> +       {0x3703, 0x32},
> +       {0x3704, 0x28},
> +       {0x3705, 0x00},
> +       {0x3706, 0x82},
> +       {0x3707, 0x08},
> +       {0x3708, 0x48},
> +       {0x3709, 0x66},
> +       {0x370a, 0x01},
> +       {0x370b, 0x82},
> +       {0x370c, 0x07},
> +       {0x3718, 0x14},
> +       {0x3719, 0x31},
> +       {0x3712, 0x44},
> +       {0x3714, 0x24},
> +       {0x371e, 0x31},
> +       {0x371f, 0x7f},
> +       {0x3720, 0x0a},
> +       {0x3721, 0x0a},
> +       {0x3724, 0x0c},
> +       {0x3725, 0x02},
> +       {0x3726, 0x0c},
> +       {0x3728, 0x0a},
> +       {0x3729, 0x03},
> +       {0x372a, 0x06},
> +       {0x372b, 0xa6},
> +       {0x372c, 0xa6},
> +       {0x372d, 0xa6},
> +       {0x372e, 0x0c},
> +       {0x372f, 0x20},
> +       {0x3730, 0x02},
> +       {0x3731, 0x0c},
> +       {0x3732, 0x28},
> +       {0x3733, 0x10},
> +       {0x3734, 0x40},
> +       {0x3736, 0x30},
> +       {0x373a, 0x0a},
> +       {0x373b, 0x0b},
> +       {0x373c, 0x14},
> +       {0x373e, 0x06},
> +       {0x3750, 0x0a},
> +       {0x3751, 0x0e},
> +       {0x3755, 0x10},
> +       {0x3758, 0x00},
> +       {0x3759, 0x4c},
> +       {0x375a, 0x0c},
> +       {0x375b, 0x26},
> +       {0x375c, 0x20},
> +       {0x375d, 0x04},
> +       {0x375e, 0x00},
> +       {0x375f, 0x28},
> +       {0x3768, 0x22},
> +       {0x3769, 0x44},
> +       {0x376a, 0x44},
> +       {0x3761, 0x00},
> +       {0x3762, 0x00},
> +       {0x3763, 0x00},
> +       {0x3766, 0xff},
> +       {0x376b, 0x00},
> +       {0x3772, 0x46},
> +       {0x3773, 0x04},
> +       {0x3774, 0x2c},
> +       {0x3775, 0x13},
> +       {0x3776, 0x08},
> +       {0x3777, 0x00},
> +       {0x3778, 0x17},
> +       {0x37a0, 0x88},
> +       {0x37a1, 0x7a},
> +       {0x37a2, 0x7a},
> +       {0x37a3, 0x00},
> +       {0x37a4, 0x00},
> +       {0x37a5, 0x00},
> +       {0x37a6, 0x00},
> +       {0x37a7, 0x88},
> +       {0x37a8, 0x98},
> +       {0x37a9, 0x98},
> +       {0x3760, 0x00},
> +       {0x376f, 0x01},
> +       {0x37aa, 0x88},
> +       {0x37ab, 0x5c},
> +       {0x37ac, 0x5c},
> +       {0x37ad, 0x55},
> +       {0x37ae, 0x19},
> +       {0x37af, 0x19},
> +       {0x37b0, 0x00},
> +       {0x37b1, 0x00},
> +       {0x37b2, 0x00},
> +       {0x37b3, 0x84},
> +       {0x37b4, 0x84},
> +       {0x37b5, 0x60},
> +       {0x37b6, 0x00},
> +       {0x37b7, 0x00},
> +       {0x37b8, 0x00},
> +       {0x37b9, 0xff},
> +       {0x3800, 0x00}, // x start H
> +       {0x3801, 0x0c}, // x start L
> +       {0x3802, 0x00}, // y start H
> +       {0x3803, 0x0c}, // y start L
> +       {0x3804, 0x0c}, // x end H
> +       {0x3805, 0xd3}, // x end L
> +       {0x3806, 0x09}, // y end H
> +       {0x3807, 0xa3}, // y end L
> +       {0x3808, 0x06}, // x output size H
> +       {0x3809, 0x60}, // x output size L
> +       {0x380a, 0x04}, // y output size H
> +       {0x380b, 0xc8}, // y output size L
> +       {0x380c, 0x07}, // HTS H
> +       {0x380d, 0x88}, // HTS L
> +       {0x380e, 0x04}, // VTS H
> +       {0x380f, 0xdc}, // VTS L
> +       {0x3810, 0x00}, // ISP x win H
> +       {0x3811, 0x04}, // ISP x win L
> +       {0x3813, 0x02}, // ISP y win L
> +       {0x3814, 0x03}, // x odd inc
> +       {0x3815, 0x01}, // x even inc
> +       {0x3820, 0x00}, // vflip off
> +       {0x3821, 0x67}, // mirror on, bin o
> +       {0x382a, 0x03}, // y odd inc
> +       {0x382b, 0x01}, // y even inc
> +       {0x3830, 0x08},
> +       {0x3836, 0x02},
> +       {0x3837, 0x18},
> +       {0x3841, 0xff}, // window auto size enable
> +       {0x3846, 0x48}, //
> +       {0x3d85, 0x16}, // OTP power up load data/setting enable enable
> +       {0x3d8c, 0x73}, // OTP setting start High
> +       {0x3d8d, 0xde}, // OTP setting start Low
> +       {0x3f08, 0x10}, //
> +       {0x3f0a, 0x00}, //
> +       {0x4000, 0xf1}, // out_range/format_chg/gain/exp_chg trig enable
> +       {0x4001, 0x10}, // total 128 black column
> +       {0x4005, 0x10}, // BLC target L
> +       {0x4002, 0x27}, // value used to limit BLC offset
> +       {0x4009, 0x81}, // final BLC offset limitation enable
> +       {0x400b, 0x0c}, // DCBLC on, DCBLC manual mode on
> +       {0x401b, 0x00}, // zero line R coefficient
> +       {0x401d, 0x00}, // zoro line T coefficient
> +       {0x4020, 0x00}, // Anchor left start H
> +       {0x4021, 0x04}, // Anchor left start L
> +       {0x4022, 0x06}, // Anchor left end H
> +       {0x4023, 0x00}, // Anchor left end L
> +       {0x4024, 0x0f}, // Anchor right start H
> +       {0x4025, 0x2a}, // Anchor right start L
> +       {0x4026, 0x0f}, // Anchor right end H
> +       {0x4027, 0x2b}, // Anchor right end L
> +       {0x4028, 0x00}, // top zero line start
> +       {0x4029, 0x02}, // top zero line number
> +       {0x402a, 0x04}, // top black line start
> +       {0x402b, 0x04}, // top black line number
> +       {0x402c, 0x00}, // bottom zero line start
> +       {0x402d, 0x02}, // bottom zoro line number
> +       {0x402e, 0x04}, // bottom black line start
> +       {0x402f, 0x04}, // bottom black line number
> +       {0x401f, 0x00}, // interpolation x/y disable, Anchor one disable
> +       {0x4034, 0x3f},
> +       {0x403d, 0x04}, // md_precision_en
> +       {0x4300, 0xff}, // clip max H
> +       {0x4301, 0x00}, // clip min H
> +       {0x4302, 0x0f}, // clip min L, clip max L
> +       {0x4316, 0x00},
> +       {0x4500, 0x58},
> +       {0x4503, 0x18},
> +       {0x4600, 0x00},
> +       {0x4601, 0xcb},
> +       {0x481f, 0x32}, // clk prepare min
> +       {0x4837, 0x16}, // global timing
> +       {0x4850, 0x10}, // lane 1 =3D 1, lane 0 =3D 0
> +       {0x4851, 0x32}, // lane 3 =3D 3, lane 2 =3D 2
> +       {0x4b00, 0x2a},
> +       {0x4b0d, 0x00},
> +       {0x4d00, 0x04}, // temperature sensor
> +       {0x4d01, 0x18}, //
> +       {0x4d02, 0xc3}, //
> +       {0x4d03, 0xff}, //
> +       {0x4d04, 0xff}, //
> +       {0x4d05, 0xff}, // temperature sensor
> +       {0x5000, 0xfe}, // lenc on, slave/master AWB gain/statistics enab=
le
> +       {0x5001, 0x01}, // BLC on
> +       {0x5002, 0x08}, // WBMATCH sensor's gain, H scale/WBMATCH/OTP_DPC=
 off
> +       {0x5003, 0x20}, // DPC_DBC buffer control enable, WB
> +       {0x501e, 0x93}, // enable digital gain
> +       {0x5046, 0x12}, //
> +       {0x5780, 0x3e}, // DPC
> +       {0x5781, 0x0f}, //
> +       {0x5782, 0x44}, //
> +       {0x5783, 0x02}, //
> +       {0x5784, 0x01}, //
> +       {0x5785, 0x00}, //
> +       {0x5786, 0x00}, //
> +       {0x5787, 0x04}, //
> +       {0x5788, 0x02}, //
> +       {0x5789, 0x0f}, //
> +       {0x578a, 0xfd}, //
> +       {0x578b, 0xf5}, //
> +       {0x578c, 0xf5}, //
> +       {0x578d, 0x03}, //
> +       {0x578e, 0x08}, //
> +       {0x578f, 0x0c}, //
> +       {0x5790, 0x08}, //
> +       {0x5791, 0x04}, //
> +       {0x5792, 0x00}, //
> +       {0x5793, 0x52}, //
> +       {0x5794, 0xa3}, // DPC
> +       {0x5871, 0x0d}, // Lenc
> +       {0x5870, 0x18}, //
> +       {0x586e, 0x10}, //
> +       {0x586f, 0x08}, //
> +       {0x58f7, 0x01}, //
> +       {0x58f8, 0x3d}, // Lenc
> +       {0x5901, 0x00}, // H skip off, V skip off
> +       {0x5b00, 0x02}, // OTP DPC start address
> +       {0x5b01, 0x10}, // OTP DPC start address
> +       {0x5b02, 0x03}, // OTP DPC end address
> +       {0x5b03, 0xcf}, // OTP DPC end address
> +       {0x5b05, 0x6c}, // recover method =3D 2b11
> +       {0x5e00, 0x00}, // use 0x3ff to test pattern off
> +       {0x5e01, 0x41}, // window cut enable
> +       {0x382d, 0x7f}, //
> +       {0x4825, 0x3a}, // lpx_p_min
> +       {0x4826, 0x40}, // hs_prepare_min
> +       {0x4808, 0x25}, // wake up delay in 1/1024 s
> +       {0x3763, 0x18},
> +       {0x3768, 0xcc},
> +       {0x470b, 0x28},
> +       {0x4202, 0x00},
> +       {0x400d, 0x10}, // BLC offset trigger L
> +       {0x4040, 0x04}, // BLC gain th2
> +       {0x403e, 0x04}, // BLC gain th1
> +       {0x4041, 0xc6}, // BLC
> +       {0x3007, 0x80},
> +       {0x400a, 0x01},
> +       {REG_NULL, 0x00},
> +};
> +
> +/*
> + * Xclk 24Mhz
> + * max_framerate 30fps
> + * mipi_datarate per lane 720Mbps
> + */
> +static const struct regval ov8858_3264x2448_regs_4lane[] =3D {
> +       {0x0100, 0x00},
> +       {0x3501, 0x9a}, // exposure M
> +       {0x3502, 0x20}, // exposure L
> +       {0x3508, 0x02}, // gain H
> +       {0x3808, 0x0c}, // x output size H
> +       {0x3809, 0xc0}, // x output size L
> +       {0x380a, 0x09}, // y output size H
> +       {0x380b, 0x90}, // y output size L
> +       {0x380c, 0x07}, // HTS H
> +       {0x380d, 0x94}, // HTS L
> +       {0x380e, 0x09}, // VTS H
> +       {0x380f, 0xaa}, // VTS L
> +       {0x3814, 0x01}, // x odd inc
> +       {0x3821, 0x46}, // mirror on, bin off
> +       {0x382a, 0x01}, // y odd inc
> +       {0x3830, 0x06},
> +       {0x3836, 0x01},
> +       {0x3f0a, 0x00},
> +       {0x4001, 0x00}, // total 256 black column
> +       {0x4022, 0x0c}, // Anchor left end H
> +       {0x4023, 0x60}, // Anchor left end L
> +       {0x4025, 0x36}, // Anchor right start L
> +       {0x4027, 0x37}, // Anchor right end L
> +       {0x402b, 0x08}, // top black line number
> +       {0x402f, 0x08}, // interpolation x/y disable, Anchor one disable
> +       {0x4500, 0x58},
> +       {0x4600, 0x01},
> +       {0x4601, 0x97},
> +       {0x382d, 0xff},
> +       {REG_NULL, 0x00},
> +};
> +
> +static const struct ov8858_mode supported_modes_2lane[] =3D {
> +       {
> +               .width =3D 3264,
> +               .height =3D 2448,
> +               .max_fps =3D {
> +                       .numerator =3D 10000,
> +                       .denominator =3D 150000,
> +               },
> +               .exp_def =3D 0x09a0,
> +               .hts_def =3D 0x0794 * 2,
> +               .vts_def =3D 0x09aa,
> +               .reg_list =3D ov8858_3264x2448_regs_2lane,
> +       },
> +       {
> +               .width =3D 1632,
> +               .height =3D 1224,
> +               .max_fps =3D {
> +                       .numerator =3D 10000,
> +                       .denominator =3D 300000,
> +               },
> +               .exp_def =3D 0x04d0,
> +               .hts_def =3D 0x0788,
> +               .vts_def =3D 0x04dc,
> +               .reg_list =3D ov8858_1632x1224_regs_2lane,
> +       },
> +};
> +
> +static const struct ov8858_mode supported_modes_4lane[] =3D {
> +       {
> +               .width =3D 3264,
> +               .height =3D 2448,
> +               .max_fps =3D {
> +                       .numerator =3D 10000,
> +                       .denominator =3D 300000,
> +               },
> +               .exp_def =3D 0x09a0,
> +               .hts_def =3D 0x0794 * 2,
> +               .vts_def =3D 0x09aa,
> +               .reg_list =3D ov8858_3264x2448_regs_4lane,
> +       },
> +};
> +
> +static const struct ov8858_mode *supported_modes;
> +
> +static const s64 link_freq_menu_items[] =3D {
> +       MIPI_FREQ
> +};
> +
> +static const char * const ov8858_test_pattern_menu[] =3D {
> +       "Disabled",
> +       "Vertical Color Bar Type 1",
> +       "Vertical Color Bar Type 2",
> +       "Vertical Color Bar Type 3",
> +       "Vertical Color Bar Type 4"
> +};
> +
> +/* Write registers up to 4 at a time */
> +static int ov8858_write_reg(struct i2c_client *client, u16 reg,
> +                           u32 len, u32 val)
> +{
> +       u32 buf_i, val_i;
> +       u8 buf[6];
> +       u8 *val_p;
> +       __be32 val_be;
> +
> +       if (len > 4)
> +               return -EINVAL;
> +
> +       buf[0] =3D reg >> 8;
> +       buf[1] =3D reg & 0xff;
> +
> +       val_be =3D cpu_to_be32(val);
> +       val_p =3D (u8 *)&val_be;
> +       buf_i =3D 2;
> +       val_i =3D 4 - len;
> +
> +       while (val_i < 4)
> +               buf[buf_i++] =3D val_p[val_i++];
> +
> +       if (i2c_master_send(client, buf, len + 2) !=3D len + 2)
> +               return -EIO;
> +
> +       return 0;
> +}
> +
> +static int ov8858_write_array(struct i2c_client *client,
> +                             const struct regval *regs)
> +{
> +       u32 i;
> +       int ret =3D 0;
> +
> +       for (i =3D 0; ret =3D=3D 0 && regs[i].addr !=3D REG_NULL; i++)
> +               ret =3D ov8858_write_reg(client, regs[i].addr,
> +                                       OV8858_REG_VALUE_08BIT,
> +                                       regs[i].val);
> +
> +       return ret;
> +}
> +
> +/* Read registers up to 4 at a time */
> +static int ov8858_read_reg(struct i2c_client *client, u16 reg,
> +                          unsigned int len, u32 *val)
> +{
> +       struct i2c_msg msgs[2];
> +       u8 *data_be_p;
> +       __be32 data_be =3D 0;
> +       __be16 reg_addr_be =3D cpu_to_be16(reg);
> +       int ret;
> +
> +       if (len > 4 || !len)
> +               return -EINVAL;
> +
> +       data_be_p =3D (u8 *)&data_be;
> +       /* Write register address */
> +       msgs[0].addr =3D client->addr;
> +       msgs[0].flags =3D 0;
> +       msgs[0].len =3D 2;
> +       msgs[0].buf =3D (u8 *)&reg_addr_be;
> +
> +       /* Read data from register */
> +       msgs[1].addr =3D client->addr;
> +       msgs[1].flags =3D I2C_M_RD;
> +       msgs[1].len =3D len;
> +       msgs[1].buf =3D &data_be_p[4 - len];
> +
> +       ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +       if (ret !=3D ARRAY_SIZE(msgs))
> +               return -EIO;
> +
> +       *val =3D be32_to_cpu(data_be);
> +
> +       return 0;
> +}
> +
> +static int ov8858_get_reso_dist(const struct ov8858_mode *mode,
> +                               struct v4l2_mbus_framefmt *framefmt)
> +{
> +       return abs(mode->width - framefmt->width) +
> +              abs(mode->height - framefmt->height);
> +}
> +
> +static const struct ov8858_mode *
> +ov8858_find_best_fit(struct ov8858 *ov8858,
> +                    struct v4l2_subdev_format *fmt)
> +{
> +       struct v4l2_mbus_framefmt *framefmt =3D &fmt->format;
> +       int dist;
> +       int cur_best_fit =3D 0;
> +       int cur_best_fit_dist =3D -1;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ov8858->cfg_num; i++) {
> +               dist =3D ov8858_get_reso_dist(&supported_modes[i], framef=
mt);
> +               if (cur_best_fit_dist =3D=3D -1 || dist < cur_best_fit_di=
st) {
> +                       cur_best_fit_dist =3D dist;
> +                       cur_best_fit =3D i;
> +               }
> +       }
> +
> +       return &supported_modes[cur_best_fit];
> +}
> +
> +static int ov8858_set_fmt(struct v4l2_subdev *sd,
> +                         struct v4l2_subdev_state *state,
> +                         struct v4l2_subdev_format *fmt)
> +{
> +       struct ov8858 *ov8858 =3D to_ov8858(sd);
> +       const struct ov8858_mode *mode;
> +       s64 h_blank, vblank_def;
> +
> +       mutex_lock(&ov8858->mutex);
> +
> +       mode =3D ov8858_find_best_fit(ov8858, fmt);
> +       fmt->format.code =3D OV8858_MEDIA_BUS_FMT;
> +       fmt->format.width =3D mode->width;
> +       fmt->format.height =3D mode->height;
> +       fmt->format.field =3D V4L2_FIELD_NONE;
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API

The Kconfig 'selects' this - so the #ifdef is redundant, we 'know' it is
defined.

> +               *v4l2_subdev_get_try_format(sd, state, fmt->pad) =3D fmt-=
>format;
> +#else
> +               mutex_unlock(&ov8858->mutex);
> +               return -ENOTTY;
> +#endif
> +       } else {
> +               ov8858->cur_mode =3D mode;
> +               h_blank =3D mode->hts_def - mode->width;
> +               __v4l2_ctrl_modify_range(ov8858->hblank, h_blank,
> +                                        h_blank, 1, h_blank);
> +               vblank_def =3D mode->vts_def - mode->height;
> +               __v4l2_ctrl_modify_range(ov8858->vblank, vblank_def,
> +                                        OV8858_VTS_MAX - mode->height,
> +                                        1, vblank_def);
> +       }
> +
> +       mutex_unlock(&ov8858->mutex);
> +
> +       return 0;
> +}
> +
> +static int ov8858_get_fmt(struct v4l2_subdev *sd,
> +                         struct v4l2_subdev_state *state,
> +                         struct v4l2_subdev_format *fmt)
> +{
> +       struct ov8858 *ov8858 =3D to_ov8858(sd);
> +       const struct ov8858_mode *mode =3D ov8858->cur_mode;
> +
> +       mutex_lock(&ov8858->mutex);
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API

Same.


> +               fmt->format =3D *v4l2_subdev_get_try_format(sd, state, fm=
t->pad);
> +#else
> +               mutex_unlock(&ov8858->mutex);
> +               return -ENOTTY;
> +#endif
> +       } else {
> +               fmt->format.width =3D mode->width;
> +               fmt->format.height =3D mode->height;
> +               fmt->format.code =3D OV8858_MEDIA_BUS_FMT;
> +               fmt->format.field =3D V4L2_FIELD_NONE;
> +       }
> +       mutex_unlock(&ov8858->mutex);
> +
> +       return 0;
> +}
> +
> +static int ov8858_enum_mbus_code(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state,
> +                                struct v4l2_subdev_mbus_code_enum *code)
> +{
> +       if (code->index !=3D 0)
> +               return -EINVAL;
> +       code->code =3D OV8858_MEDIA_BUS_FMT;
> +
> +       return 0;
> +}
> +
> +static int ov8858_enum_frame_sizes(struct v4l2_subdev *sd,
> +                                  struct v4l2_subdev_state *state,
> +                                  struct v4l2_subdev_frame_size_enum *fs=
e)
> +{
> +       struct ov8858 *ov8858 =3D to_ov8858(sd);
> +
> +       if (fse->index >=3D ov8858->cfg_num)
> +               return -EINVAL;
> +
> +       if (fse->code !=3D OV8858_MEDIA_BUS_FMT)
> +               return -EINVAL;
> +
> +       fse->min_width  =3D supported_modes[fse->index].width;
> +       fse->max_width  =3D supported_modes[fse->index].width;
> +       fse->max_height =3D supported_modes[fse->index].height;
> +       fse->min_height =3D supported_modes[fse->index].height;
> +
> +       return 0;
> +}
> +
> +static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
> +{
> +       u32 val;
> +
> +       if (pattern)
> +               val =3D (pattern - 1) | OV8858_TEST_PATTERN_ENABLE;
> +       else
> +               val =3D OV8858_TEST_PATTERN_DISABLE;
> +
> +       return ov8858_write_reg(ov8858->client,
> +                                OV8858_REG_TEST_PATTERN,
> +                                OV8858_REG_VALUE_08BIT,
> +                                val);
> +}
> +
> +static int ov8858_g_frame_interval(struct v4l2_subdev *sd,
> +                                  struct v4l2_subdev_frame_interval *fi)
> +{
> +       struct ov8858 *ov8858 =3D to_ov8858(sd);
> +       const struct ov8858_mode *mode =3D ov8858->cur_mode;
> +
> +       mutex_lock(&ov8858->mutex);
> +       fi->interval =3D mode->max_fps;
> +       mutex_unlock(&ov8858->mutex);
> +
> +       return 0;
> +}
> +
> +static void ov8858_get_r1a_otp(struct ov8858_otp_info_r1a *otp_r1a,
> +                              struct rkmodule_inf *inf)

I'm weary that 'r1a' might mean this is 'rockchip' specific OTP.

It's valuable information for us to figure out later, but I don't know
how we handle OTP on cameras 'upstream' ... that could be a matter of
discussions to come.

<edit, looks like the r1, r2, might be revisions of the sensor
indicating different OTP layouts?>


> +{
> +       u32 i, j;
> +       int rg, bg;
> +
> +       /* fac */
> +       if (otp_r1a->flag & 0x80) {
> +               inf->fac.flag =3D 1;
> +               inf->fac.year =3D otp_r1a->year;
> +               inf->fac.month =3D otp_r1a->month;
> +               inf->fac.day =3D otp_r1a->day;
> +
> +               for (i =3D 0; i < ARRAY_SIZE(ov8858_module_info) - 1; i++=
) {
> +                       if (ov8858_module_info[i].id =3D=3D otp_r1a->modu=
le_id)
> +                               break;
> +               }
> +               strlcpy(inf->fac.module, ov8858_module_info[i].name,
> +                       sizeof(inf->fac.module));
> +
> +               for (i =3D 0; i < ARRAY_SIZE(ov8858_lens_info) - 1; i++) {
> +                       if (ov8858_lens_info[i].id =3D=3D otp_r1a->lens_i=
d)
> +                               break;
> +               }
> +               strlcpy(inf->fac.lens, ov8858_lens_info[i].name,
> +                       sizeof(inf->fac.lens));
> +       }
> +
> +       /* awb */
> +       if (otp_r1a->flag & 0x40) {
> +               if (otp_r1a->light_rg =3D=3D 0)
> +                       /* no light source information in OTP ,light fact=
or =3D 1 */
> +                       rg =3D otp_r1a->rg_ratio;
> +               else
> +                       rg =3D otp_r1a->rg_ratio * (otp_r1a->light_rg + 5=
12) / 1024;
> +
> +               if (otp_r1a->light_bg =3D=3D 0)
> +                       /* no light source information in OTP ,light fact=
or =3D 1 */
> +                       bg =3D otp_r1a->bg_ratio;
> +               else
> +                       bg =3D otp_r1a->bg_ratio * (otp_r1a->light_bg + 5=
12) / 1024;
> +
> +               inf->awb.flag =3D 1;
> +               inf->awb.r_value =3D rg;
> +               inf->awb.b_value =3D bg;
> +               inf->awb.gr_value =3D 0x200;
> +               inf->awb.gb_value =3D 0x200;
> +
> +               inf->awb.golden_r_value =3D 0;
> +               inf->awb.golden_b_value =3D 0;
> +               inf->awb.golden_gr_value =3D 0;
> +               inf->awb.golden_gb_value =3D 0;
> +       }
> +
> +       /* af */
> +       if (otp_r1a->flag & 0x20) {
> +               inf->af.flag =3D 1;
> +               inf->af.vcm_start =3D otp_r1a->vcm_start;
> +               inf->af.vcm_end =3D otp_r1a->vcm_end;
> +               inf->af.vcm_dir =3D otp_r1a->vcm_dir;
> +       }
> +
> +       /* lsc */
> +       if (otp_r1a->flag & 0x10) {
> +               inf->lsc.flag =3D 1;
> +               inf->lsc.decimal_bits =3D 0;
> +               inf->lsc.lsc_w =3D 6;
> +               inf->lsc.lsc_h =3D 6;
> +
> +               j =3D 0;
> +               for (i =3D 0; i < 36; i++) {
> +                       inf->lsc.lsc_gr[i] =3D otp_r1a->lenc[j++];
> +                       inf->lsc.lsc_gb[i] =3D inf->lsc.lsc_gr[i];
> +               }
> +               for (i =3D 0; i < 36; i++)
> +                       inf->lsc.lsc_b[i] =3D otp_r1a->lenc[j++] + otp_r1=
a->lenc[108];
> +               for (i =3D 0; i < 36; i++)
> +                       inf->lsc.lsc_r[i] =3D otp_r1a->lenc[j++] + otp_r1=
a->lenc[109];
> +       }
> +}
> +
> +static void ov8858_get_r2a_otp(struct ov8858_otp_info_r2a *otp_r2a,
> +                              struct rkmodule_inf *inf)
> +{
> +       unsigned int i, j;
> +       int rg, bg;
> +
> +       /* fac / awb */
> +       if (otp_r2a->flag & 0xC0) {
> +               inf->fac.flag =3D 1;
> +               inf->fac.year =3D otp_r2a->year;
> +               inf->fac.month =3D otp_r2a->month;
> +               inf->fac.day =3D otp_r2a->day;
> +
> +               for (i =3D 0; i < ARRAY_SIZE(ov8858_module_info) - 1; i++=
) {
> +                       if (ov8858_module_info[i].id =3D=3D otp_r2a->modu=
le_id)
> +                               break;
> +               }
> +               strlcpy(inf->fac.module, ov8858_module_info[i].name,
> +                       sizeof(inf->fac.module));
> +
> +               for (i =3D 0; i < ARRAY_SIZE(ov8858_lens_info) - 1; i++) {
> +                       if (ov8858_lens_info[i].id =3D=3D otp_r2a->lens_i=
d)
> +                               break;
> +               }
> +               strlcpy(inf->fac.lens, ov8858_lens_info[i].name,
> +                       sizeof(inf->fac.lens));
> +
> +               rg =3D otp_r2a->rg_ratio;
> +               bg =3D otp_r2a->bg_ratio;
> +
> +               inf->awb.flag =3D 1;
> +               inf->awb.r_value =3D rg;
> +               inf->awb.b_value =3D bg;
> +               inf->awb.gr_value =3D 0x200;
> +               inf->awb.gb_value =3D 0x200;
> +
> +               inf->awb.golden_r_value =3D 0;
> +               inf->awb.golden_b_value =3D 0;
> +               inf->awb.golden_gr_value =3D 0;
> +               inf->awb.golden_gb_value =3D 0;
> +       }
> +
> +       /* af */
> +       if (otp_r2a->flag & 0x20) {
> +               inf->af.flag =3D 1;
> +               inf->af.vcm_start =3D otp_r2a->vcm_start;
> +               inf->af.vcm_end =3D otp_r2a->vcm_end;
> +               inf->af.vcm_dir =3D otp_r2a->vcm_dir;
> +       }
> +
> +       /* lsc */
> +       if (otp_r2a->flag & 0x10) {
> +               inf->lsc.flag =3D 1;
> +               inf->lsc.decimal_bits =3D 0;
> +               inf->lsc.lsc_w =3D 8;
> +               inf->lsc.lsc_h =3D 10;
> +
> +               j =3D 0;
> +               for (i =3D 0; i < 80; i++) {
> +                       inf->lsc.lsc_gr[i] =3D otp_r2a->lenc[j++];
> +                       inf->lsc.lsc_gb[i] =3D inf->lsc.lsc_gr[i];
> +               }
> +               for (i =3D 0; i < 80; i++)
> +                       inf->lsc.lsc_b[i] =3D otp_r2a->lenc[j++];
> +               for (i =3D 0; i < 80; i++)
> +                       inf->lsc.lsc_r[i] =3D otp_r2a->lenc[j++];
> +       }
> +}
> +
> +static void ov8858_get_module_inf(struct ov8858 *ov8858,
> +                                 struct rkmodule_inf *inf)
> +{
> +       struct ov8858_otp_info_r1a *otp_r1a =3D ov8858->otp_r1a;
> +       struct ov8858_otp_info_r2a *otp_r2a =3D ov8858->otp_r2a;
> +
> +       strlcpy(inf->base.sensor, OV8858_NAME, sizeof(inf->base.sensor));
> +       strlcpy(inf->base.module, ov8858->module_name, sizeof(inf->base.m=
odule));
> +       strlcpy(inf->base.lens, ov8858->len_name, sizeof(inf->base.lens));
> +
> +       if (ov8858->is_r2a) {
> +               if (otp_r2a)
> +                       ov8858_get_r2a_otp(otp_r2a, inf);
> +       } else {
> +               if (otp_r1a)
> +                       ov8858_get_r1a_otp(otp_r1a, inf);
> +       }
> +}
> +
> +static void ov8858_set_awb_cfg(struct ov8858 *ov8858,
> +                              struct rkmodule_awb_cfg *cfg)
> +{
> +       mutex_lock(&ov8858->mutex);
> +       memcpy(&ov8858->awb_cfg, cfg, sizeof(*cfg));
> +       mutex_unlock(&ov8858->mutex);
> +}
> +
> +static void ov8858_set_lsc_cfg(struct ov8858 *ov8858,
> +                              struct rkmodule_lsc_cfg *cfg)
> +{
> +       mutex_lock(&ov8858->mutex);
> +       memcpy(&ov8858->lsc_cfg, cfg, sizeof(*cfg));
> +       mutex_unlock(&ov8858->mutex);
> +}
> +
> +static long ov8858_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void =
*arg)
> +{
> +       struct ov8858 *ov8858 =3D to_ov8858(sd);
> +       long ret =3D 0;
> +
> +       switch (cmd) {
> +       case RKMODULE_GET_MODULE_INFO:
> +               ov8858_get_module_inf(ov8858, (struct rkmodule_inf *)arg);
> +               break;
> +       case RKMODULE_AWB_CFG:
> +               ov8858_set_awb_cfg(ov8858, (struct rkmodule_awb_cfg *)arg=
);
> +               break;
> +       case RKMODULE_LSC_CFG:
> +               ov8858_set_lsc_cfg(ov8858, (struct rkmodule_lsc_cfg *)arg=
);
> +               break;

So as they are, these ioctl extensions will likely have to be simply
removed.


> +       default:
> +               ret =3D -ENOTTY;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +#ifdef CONFIG_COMPAT
> +static long ov8858_compat_ioctl32(struct v4l2_subdev *sd,
> +                                 unsigned int cmd, unsigned long arg)
> +{
> +       void __user *up =3D compat_ptr(arg);
> +       struct rkmodule_inf *inf;
> +       struct rkmodule_awb_cfg *awb_cfg;
> +       struct rkmodule_lsc_cfg *lsc_cfg;
> +       long ret =3D 0;
> +
> +       switch (cmd) {
> +       case RKMODULE_GET_MODULE_INFO:
> +               inf =3D kzalloc(sizeof(*inf), GFP_KERNEL);
> +               if (!inf) {
> +                       ret =3D -ENOMEM;
> +                       return ret;
> +               }
> +
> +               ret =3D ov8858_ioctl(sd, cmd, inf);
> +               if (!ret)
> +                       ret =3D copy_to_user(up, inf, sizeof(*inf));
> +               kfree(inf);
> +               break;
> +       case RKMODULE_AWB_CFG:
> +               awb_cfg =3D kzalloc(sizeof(*awb_cfg), GFP_KERNEL);
> +               if (!awb_cfg) {
> +                       ret =3D -ENOMEM;
> +                       return ret;
> +               }
> +
> +               ret =3D copy_from_user(awb_cfg, up, sizeof(*awb_cfg));
> +               if (!ret)
> +                       ret =3D ov8858_ioctl(sd, cmd, awb_cfg);
> +               kfree(awb_cfg);
> +               break;
> +       case RKMODULE_LSC_CFG:
> +               lsc_cfg =3D kzalloc(sizeof(*lsc_cfg), GFP_KERNEL);
> +               if (!lsc_cfg) {
> +                       ret =3D -ENOMEM;
> +                       return ret;
> +               }
> +
> +               ret =3D copy_from_user(lsc_cfg, up, sizeof(*lsc_cfg));
> +               if (!ret)
> +                       ret =3D ov8858_ioctl(sd, cmd, lsc_cfg);
> +               kfree(lsc_cfg);
> +               break;
> +       default:
> +               ret =3D -ENOTTY;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +#endif
> +
> +/*----------------------------------------------------------------------=
----*/
> +static int ov8858_apply_otp_r1a(struct ov8858 *ov8858)
> +{
> +       int rg, bg, R_gain, G_gain, B_gain, base_gain, temp;
> +       struct i2c_client *client =3D ov8858->client;
> +       struct ov8858_otp_info_r1a *otp_ptr =3D ov8858->otp_r1a;
> +       struct rkmodule_awb_cfg *awb_cfg =3D &ov8858->awb_cfg;
> +       struct rkmodule_lsc_cfg *lsc_cfg =3D &ov8858->lsc_cfg;
> +       u32 golden_bg_ratio =3D 0;
> +       u32 golden_rg_ratio =3D 0;
> +       u32 golden_g_value =3D 0;
> +       u32 i;
> +
> +       if (awb_cfg->enable) {
> +               golden_g_value =3D (awb_cfg->golden_gb_value +
> +                                 awb_cfg->golden_gr_value) / 2;
> +               golden_bg_ratio =3D awb_cfg->golden_b_value * 0x200 / gol=
den_g_value;
> +               golden_rg_ratio =3D awb_cfg->golden_r_value * 0x200 / gol=
den_g_value;
> +       }
> +
> +       /* apply OTP WB Calibration */
> +       if ((otp_ptr->flag & 0x40) && golden_bg_ratio && golden_rg_ratio)=
 {
> +               if (otp_ptr->light_rg =3D=3D 0)
> +                       /*
> +                        * no light source information in OTP,
> +                        * light factor =3D 1
> +                        */
> +                       rg =3D otp_ptr->rg_ratio;
> +               else
> +                       rg =3D otp_ptr->rg_ratio *
> +                            (otp_ptr->light_rg + 512) / 1024;
> +
> +               if (otp_ptr->light_bg =3D=3D 0)
> +                       /*
> +                        * no light source information in OTP,
> +                        * light factor =3D 1
> +                        */
> +                       bg =3D otp_ptr->bg_ratio;
> +               else
> +                       bg =3D otp_ptr->bg_ratio *
> +                            (otp_ptr->light_bg + 512) / 1024;
> +
> +               /* calculate G gain */
> +               R_gain =3D (golden_rg_ratio * 1000) / rg;
> +               B_gain =3D (golden_bg_ratio * 1000) / bg;
> +               G_gain =3D 1000;
> +               if (R_gain < 1000 || B_gain < 1000) {
> +                       if (R_gain < B_gain)
> +                               base_gain =3D R_gain;
> +                       else
> +                               base_gain =3D B_gain;
> +               } else {
> +                       base_gain =3D G_gain;
> +               }
> +               R_gain =3D 0x400 * R_gain / (base_gain);
> +               B_gain =3D 0x400 * B_gain / (base_gain);
> +               G_gain =3D 0x400 * G_gain / (base_gain);
> +
> +               /* update sensor WB gain */
> +               if (R_gain > 0x400) {
> +                       ov8858_write_1byte(client, 0x5032, R_gain >> 8);
> +                       ov8858_write_1byte(client, 0x5033, R_gain & 0x00f=
f);
> +               }
> +               if (G_gain > 0x400) {
> +                       ov8858_write_1byte(client, 0x5034, G_gain >> 8);
> +                       ov8858_write_1byte(client, 0x5035, G_gain & 0x00f=
f);
> +               }
> +               if (B_gain > 0x400) {
> +                       ov8858_write_1byte(client, 0x5036, B_gain >> 8);
> +                       ov8858_write_1byte(client, 0x5037, B_gain & 0x00f=
f);
> +               }
> +
> +               dev_dbg(&client->dev, "apply awb gain: 0x%x, 0x%x, 0x%x\n=
",
> +                       R_gain, G_gain, B_gain);
> +       }
> +
> +       /* apply OTP Lenc Calibration */
> +       if ((otp_ptr->flag & 0x10) && lsc_cfg->enable) {
> +               ov8858_read_1byte(client, 0x5000, &temp);
> +               temp =3D 0x80 | temp;
> +               ov8858_write_1byte(client, 0x5000, temp);
> +               for (i =3D 0; i < ARRAY_SIZE(otp_ptr->lenc); i++) {
> +                       ov8858_write_1byte(client, 0x5800 + i,
> +                                          otp_ptr->lenc[i]);
> +                       dev_dbg(&client->dev, "apply lenc[%d]: 0x%x\n",
> +                               i, otp_ptr->lenc[i]);
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int ov8858_apply_otp_r2a(struct ov8858 *ov8858)
> +{
> +       int rg, bg, R_gain, G_gain, B_gain, base_gain, temp;
> +       struct i2c_client *client =3D ov8858->client;
> +       struct ov8858_otp_info_r2a *otp_ptr =3D ov8858->otp_r2a;
> +       struct rkmodule_awb_cfg *awb_cfg =3D &ov8858->awb_cfg;
> +       struct rkmodule_lsc_cfg *lsc_cfg =3D &ov8858->lsc_cfg;
> +       u32 golden_bg_ratio =3D 0;
> +       u32 golden_rg_ratio =3D 0;
> +       u32 golden_g_value =3D 0;
> +       u32 i;
> +
> +       if (awb_cfg->enable) {
> +               golden_g_value =3D (awb_cfg->golden_gb_value +
> +                                 awb_cfg->golden_gr_value) / 2;
> +               golden_bg_ratio =3D awb_cfg->golden_b_value * 0x200 / gol=
den_g_value;
> +               golden_rg_ratio =3D awb_cfg->golden_r_value * 0x200 / gol=
den_g_value;
> +       }
> +
> +       /* apply OTP WB Calibration */
> +       if ((otp_ptr->flag & 0xC0) && golden_bg_ratio && golden_rg_ratio)=
 {
> +               rg =3D otp_ptr->rg_ratio;
> +               bg =3D otp_ptr->bg_ratio;
> +               /* calculate G gain */
> +               R_gain =3D (golden_rg_ratio * 1000) / rg;
> +               B_gain =3D (golden_bg_ratio * 1000) / bg;
> +               G_gain =3D 1000;
> +               if (R_gain < 1000 || B_gain < 1000) {
> +                       if (R_gain < B_gain)
> +                               base_gain =3D R_gain;
> +                       else
> +                               base_gain =3D B_gain;
> +               } else {
> +                       base_gain =3D G_gain;
> +               }
> +               R_gain =3D 0x400 * R_gain / (base_gain);
> +               B_gain =3D 0x400 * B_gain / (base_gain);
> +               G_gain =3D 0x400 * G_gain / (base_gain);
> +
> +               /* update sensor WB gain */
> +               if (R_gain > 0x400) {
> +                       ov8858_write_1byte(client, 0x5032, R_gain >> 8);
> +                       ov8858_write_1byte(client, 0x5033, R_gain & 0x00f=
f);
> +               }
> +               if (G_gain > 0x400) {
> +                       ov8858_write_1byte(client, 0x5034, G_gain >> 8);
> +                       ov8858_write_1byte(client, 0x5035, G_gain & 0x00f=
f);
> +               }
> +               if (B_gain > 0x400) {
> +                       ov8858_write_1byte(client, 0x5036, B_gain >> 8);
> +                       ov8858_write_1byte(client, 0x5037, B_gain & 0x00f=
f);
> +               }
> +
> +               dev_dbg(&client->dev, "apply awb gain: 0x%x, 0x%x, 0x%x\n=
",
> +                       R_gain, G_gain, B_gain);
> +       }
> +
> +       /* apply OTP Lenc Calibration */
> +       if ((otp_ptr->flag & 0x10) && lsc_cfg->enable) {
> +               ov8858_read_1byte(client, 0x5000, &temp);
> +               temp =3D 0x80 | temp;
> +               ov8858_write_1byte(client, 0x5000, temp);
> +               for (i =3D 0; i < ARRAY_SIZE(otp_ptr->lenc); i++) {
> +                       ov8858_write_1byte(client, 0x5800 + i,
> +                                          otp_ptr->lenc[i]);
> +                       dev_dbg(&client->dev, "apply lenc[%d]: 0x%x\n",
> +                               i, otp_ptr->lenc[i]);
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int ov8858_apply_otp(struct ov8858 *ov8858)
> +{
> +       int ret =3D 0;
> +
> +       if (ov8858->is_r2a && ov8858->otp_r2a)
> +               ret =3D ov8858_apply_otp_r2a(ov8858);
> +       else if (ov8858->otp_r1a)
> +               ret =3D ov8858_apply_otp_r1a(ov8858);
> +
> +       return ret;
> +}
> +
> +static int __ov8858_start_stream(struct ov8858 *ov8858)
> +{
> +       int ret;
> +
> +       ret =3D ov8858_write_array(ov8858->client, ov8858_global_regs);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ov8858_write_array(ov8858->client, ov8858->cur_mode->reg_=
list);
> +       if (ret)
> +               return ret;
> +
> +       /* In case these controls are set before streaming */
> +       mutex_unlock(&ov8858->mutex);
> +       ret =3D v4l2_ctrl_handler_setup(&ov8858->ctrl_handler);
> +       mutex_lock(&ov8858->mutex);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ov8858_apply_otp(ov8858);
> +       if (ret)
> +               return ret;
> +
> +       return ov8858_write_reg(ov8858->client,
> +                               OV8858_REG_CTRL_MODE,
> +                               OV8858_REG_VALUE_08BIT,
> +                               OV8858_MODE_STREAMING);
> +}
> +
> +static int __ov8858_stop_stream(struct ov8858 *ov8858)
> +{
> +       return ov8858_write_reg(ov8858->client,
> +                               OV8858_REG_CTRL_MODE,
> +                               OV8858_REG_VALUE_08BIT,
> +                               OV8858_MODE_SW_STANDBY);
> +}
> +
> +static int ov8858_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +       struct ov8858 *ov8858 =3D to_ov8858(sd);
> +       struct i2c_client *client =3D ov8858->client;
> +       int ret =3D 0;
> +
> +       mutex_lock(&ov8858->mutex);
> +       on =3D !!on;
> +       if (on =3D=3D ov8858->streaming)
> +               goto unlock_and_return;
> +
> +       if (on) {
> +               ret =3D pm_runtime_get_sync(&client->dev);
> +               if (ret < 0) {
> +                       pm_runtime_put_noidle(&client->dev);
> +                       goto unlock_and_return;
> +               }
> +
> +               ret =3D __ov8858_start_stream(ov8858);
> +               if (ret) {
> +                       v4l2_err(sd, "start stream failed while write reg=
s\n");
> +                       pm_runtime_put(&client->dev);
> +                       goto unlock_and_return;
> +               }
> +       } else {
> +               __ov8858_stop_stream(ov8858);
> +               pm_runtime_put(&client->dev);
> +       }
> +
> +       ov8858->streaming =3D on;
> +
> +unlock_and_return:
> +       mutex_unlock(&ov8858->mutex);
> +
> +       return ret;
> +}
> +
> +/* Calculate the delay in us by clock rate and clock cycles */
> +static inline u32 ov8858_cal_delay(u32 cycles)
> +{
> +       return DIV_ROUND_UP(cycles, OV8858_XVCLK_FREQ / 1000 / 1000);
> +}
> +
> +static int __ov8858_power_on(struct ov8858 *ov8858)
> +{
> +       int ret;
> +       u32 delay_us;
> +       struct device *dev =3D &ov8858->client->dev;
> +
> +       if (!IS_ERR_OR_NULL(ov8858->pins_default)) {
> +               ret =3D pinctrl_select_state(ov8858->pinctrl,
> +                                          ov8858->pins_default);
> +               if (ret < 0)
> +                       dev_err(dev, "could not set pins\n");
> +       }
> +
> +       ret =3D clk_set_rate(ov8858->xvclk, OV8858_XVCLK_FREQ);
> +       if (ret < 0)
> +               dev_warn(dev, "Failed to set xvclk rate (24MHz)\n");
> +       if (clk_get_rate(ov8858->xvclk) !=3D OV8858_XVCLK_FREQ)
> +               dev_warn(dev, "xvclk mismatched, modes are based on 24MHz=
\n");
> +
> +       ret =3D clk_prepare_enable(ov8858->xvclk);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to enable xvclk\n");
> +               return ret;
> +       }
> +
> +       ret =3D regulator_bulk_enable(OV8858_NUM_SUPPLIES, ov8858->suppli=
es);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to enable regulators\n");
> +               goto disable_clk;
> +       }
> +
> +       mdelay(20);
> +
> +       gpiod_set_value_cansleep(ov8858->reset_gpio, 0);
> +       gpiod_set_value_cansleep(ov8858->pwdn_gpio, 0);
> +
> +       /* 8192 cycles prior to first SCCB transaction */
> +       //delay_us =3D ov8858_cal_delay(8192);
> +       //usleep_range(delay_us, delay_us * 2);
> +       mdelay(10);
> +
> +       return 0;
> +
> +disable_clk:
> +       clk_disable_unprepare(ov8858->xvclk);
> +
> +       return ret;
> +}
> +
> +static void __ov8858_power_off(struct ov8858 *ov8858)
> +{
> +       int ret;
> +       struct device *dev =3D &ov8858->client->dev;
> +
> +       gpiod_set_value_cansleep(ov8858->pwdn_gpio, 1);
> +       clk_disable_unprepare(ov8858->xvclk);
> +       gpiod_set_value_cansleep(ov8858->reset_gpio, 1);
> +
> +       if (!IS_ERR_OR_NULL(ov8858->pins_sleep)) {
> +               ret =3D pinctrl_select_state(ov8858->pinctrl,
> +                                          ov8858->pins_sleep);
> +               if (ret < 0)
> +                       dev_dbg(dev, "could not set pins\n");
> +       }
> +
> +       regulator_bulk_disable(OV8858_NUM_SUPPLIES, ov8858->supplies);
> +}
> +
> +static int ov8858_runtime_resume(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct ov8858 *ov8858 =3D to_ov8858(sd);
> +
> +       return __ov8858_power_on(ov8858);
> +}
> +
> +static int ov8858_runtime_suspend(struct device *dev)
> +{
> +       struct i2c_client *client =3D to_i2c_client(dev);
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct ov8858 *ov8858 =3D to_ov8858(sd);
> +
> +       __ov8858_power_off(ov8858);
> +
> +       return 0;
> +}
> +
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> +static int ov8858_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +       struct ov8858 *ov8858 =3D to_ov8858(sd);
> +       struct v4l2_mbus_framefmt *try_fmt =3D
> +                               v4l2_subdev_get_try_format(sd, fh->state,=
 0);
> +       const struct ov8858_mode *def_mode =3D &supported_modes[0];
> +
> +       mutex_lock(&ov8858->mutex);
> +       /* Initialize try_fmt */
> +       try_fmt->width =3D def_mode->width;
> +       try_fmt->height =3D def_mode->height;
> +       try_fmt->code =3D OV8858_MEDIA_BUS_FMT;
> +       try_fmt->field =3D V4L2_FIELD_NONE;
> +
> +       mutex_unlock(&ov8858->mutex);
> +       /* No crop or compose */
> +
> +       return 0;
> +}
> +#endif
> +
> +static int ov8858_enum_frame_interval(struct v4l2_subdev *sd,
> +                                     struct v4l2_subdev_state *state,
> +                                     struct v4l2_subdev_frame_interval_e=
num *fie)
> +{
> +       struct ov8858 *ov8858 =3D to_ov8858(sd);
> +
> +       if (fie->index >=3D ov8858->cfg_num)
> +               return -EINVAL;
> +
> +       if (fie->code !=3D OV8858_MEDIA_BUS_FMT)
> +               return -EINVAL;
> +
> +       fie->width =3D supported_modes[fie->index].width;
> +       fie->height =3D supported_modes[fie->index].height;
> +       fie->interval =3D supported_modes[fie->index].max_fps;
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops ov8858_pm_ops =3D {
> +       SET_RUNTIME_PM_OPS(ov8858_runtime_suspend,
> +                          ov8858_runtime_resume, NULL)
> +};
> +
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API

Redundant,

> +static const struct v4l2_subdev_internal_ops ov8858_internal_ops =3D {
> +       .open =3D ov8858_open,
> +};
> +#endif
> +
> +static const struct v4l2_subdev_core_ops ov8858_core_ops =3D {
> +       .ioctl =3D ov8858_ioctl,
> +#ifdef CONFIG_COMPAT
> +       .compat_ioctl32 =3D ov8858_compat_ioctl32,
> +#endif
> +};

ov8858_core_ops is likely to be removed ...

> +
> +static const struct v4l2_subdev_video_ops ov8858_video_ops =3D {
> +       .s_stream =3D ov8858_s_stream,
> +       .g_frame_interval =3D ov8858_g_frame_interval,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ov8858_pad_ops =3D {
> +       .enum_mbus_code =3D ov8858_enum_mbus_code,
> +       .enum_frame_size =3D ov8858_enum_frame_sizes,
> +       .enum_frame_interval =3D ov8858_enum_frame_interval,
> +       .get_fmt =3D ov8858_get_fmt,
> +       .set_fmt =3D ov8858_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops ov8858_subdev_ops =3D {
> +       .core   =3D &ov8858_core_ops,
> +       .video  =3D &ov8858_video_ops,
> +       .pad    =3D &ov8858_pad_ops,
> +};
> +
> +static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct ov8858 *ov8858 =3D container_of(ctrl->handler,
> +                                            struct ov8858, ctrl_handler);
> +       struct i2c_client *client =3D ov8858->client;
> +       s64 max;
> +       int ret =3D 0;
> +
> +       /* Propagate change of current control to all related controls */
> +       switch (ctrl->id) {
> +       case V4L2_CID_VBLANK:
> +               /* Update max exposure while meeting expected vblanking */
> +               max =3D ov8858->cur_mode->height + ctrl->val - 4;
> +               __v4l2_ctrl_modify_range(ov8858->exposure,
> +                                        ov8858->exposure->minimum, max,
> +                                        ov8858->exposure->step,
> +                                        ov8858->exposure->default_value);
> +               break;
> +       }
> +
> +       if (pm_runtime_get(&client->dev) <=3D 0)
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE:
> +               /* 4 least significant bits of expsoure are fractional pa=
rt */
> +               ret =3D ov8858_write_reg(ov8858->client,
> +                                       OV8858_REG_EXPOSURE,
> +                                       OV8858_REG_VALUE_24BIT,
> +                                       ctrl->val << 4);
> +               break;
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               ret =3D ov8858_write_reg(ov8858->client,
> +                                       OV8858_REG_GAIN_H,
> +                                       OV8858_REG_VALUE_08BIT,
> +                                       (ctrl->val >> OV8858_GAIN_H_SHIFT=
) &
> +                                       OV8858_GAIN_H_MASK);
> +               ret |=3D ov8858_write_reg(ov8858->client,
> +                                       OV8858_REG_GAIN_L,
> +                                       OV8858_REG_VALUE_08BIT,
> +                                       ctrl->val & OV8858_GAIN_L_MASK);
> +               break;
> +       case V4L2_CID_DIGITAL_GAIN:
> +               ret =3D ov8858_write_reg(ov8858->client,
> +                                       OV8858_REG_DGAIN_H,
> +                                       OV8858_REG_VALUE_08BIT,
> +                                       (ctrl->val >> OV8858_DGAIN_H_SHIF=
T) &
> +                                       OV8858_DGAIN_H_MASK);
> +               ret |=3D ov8858_write_reg(ov8858->client,
> +                                       OV8858_REG_DGAIN_L,
> +                                       OV8858_REG_VALUE_08BIT,
> +                                       ctrl->val & OV8858_DGAIN_L_MASK);
> +               break;
> +       case V4L2_CID_VBLANK:
> +               ret =3D ov8858_write_reg(ov8858->client,
> +                                       OV8858_REG_VTS,
> +                                       OV8858_REG_VALUE_16BIT,
> +                                       ctrl->val + ov8858->cur_mode->hei=
ght);
> +               break;
> +       case V4L2_CID_TEST_PATTERN:
> +               ret =3D ov8858_enable_test_pattern(ov8858, ctrl->val);
> +               break;
> +       default:
> +               dev_warn(&client->dev, "%s Unhandled id:0x%x, val:0x%x\n",
> +                        __func__, ctrl->id, ctrl->val);
> +               break;
> +       }
> +
> +       pm_runtime_put(&client->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ov8858_ctrl_ops =3D {
> +       .s_ctrl =3D ov8858_set_ctrl,
> +};
> +
> +static int ov8858_initialize_controls(struct ov8858 *ov8858)
> +{
> +       const struct ov8858_mode *mode;
> +       struct v4l2_ctrl_handler *handler;
> +       struct v4l2_ctrl *ctrl;
> +       s64 exposure_max, vblank_def;
> +       u32 h_blank;
> +       int ret;
> +
> +       handler =3D &ov8858->ctrl_handler;
> +       mode =3D ov8858->cur_mode;
> +       ret =3D v4l2_ctrl_handler_init(handler, 8);
> +       if (ret)
> +               return ret;
> +       handler->lock =3D &ov8858->mutex;
> +
> +       ctrl =3D v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ,
> +                                     0, 0, link_freq_menu_items);
> +       if (ctrl)
> +               ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE,
> +                         0, ov8858->pixel_rate, 1, ov8858->pixel_rate);
> +
> +       h_blank =3D mode->hts_def - mode->width;
> +       ov8858->hblank =3D v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLA=
NK,
> +                               h_blank, h_blank, 1, h_blank);
> +       if (ov8858->hblank)
> +               ov8858->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       vblank_def =3D mode->vts_def - mode->height;
> +       ov8858->vblank =3D v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +                               V4L2_CID_VBLANK, vblank_def,
> +                               OV8858_VTS_MAX - mode->height,
> +                               1, vblank_def);
> +
> +       exposure_max =3D mode->vts_def - 4;
> +       ov8858->exposure =3D v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +                               V4L2_CID_EXPOSURE, OV8858_EXPOSURE_MIN,
> +                               exposure_max, OV8858_EXPOSURE_STEP,
> +                               mode->exp_def);
> +
> +       ov8858->anal_gain =3D v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +                               V4L2_CID_ANALOGUE_GAIN, OV8858_GAIN_MIN,
> +                               OV8858_GAIN_MAX, OV8858_GAIN_STEP,
> +                               OV8858_GAIN_DEFAULT);
> +
> +       ov8858->digi_gain =3D v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +                               V4L2_CID_DIGITAL_GAIN, OV8858_DGAIN_MIN,
> +                               OV8858_DGAIN_MAX, OV8858_DGAIN_STEP,
> +                               OV8858_DGAIN_DEFAULT);
> +
> +       ov8858->test_pattern =3D v4l2_ctrl_new_std_menu_items(handler,
> +                               &ov8858_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +                               ARRAY_SIZE(ov8858_test_pattern_menu) - 1,
> +                               0, 0, ov8858_test_pattern_menu);
> +
> +       if (handler->error) {
> +               ret =3D handler->error;
> +               dev_err(&ov8858->client->dev,
> +                       "Failed to init controls(%d)\n", ret);
> +               goto err_free_handler;
> +       }
> +
> +       ov8858->subdev.ctrl_handler =3D handler;
> +
> +       return 0;
> +
> +err_free_handler:
> +       v4l2_ctrl_handler_free(handler);
> +
> +       return ret;
> +}
> +
> +static int ov8858_otp_read_r1a(struct ov8858 *ov8858)
> +{
> +       int otp_flag, addr, temp, i;
> +       struct ov8858_otp_info_r1a *otp_ptr;
> +       struct device *dev =3D &ov8858->client->dev;
> +       struct i2c_client *client =3D ov8858->client;
> +
> +       otp_ptr =3D kzalloc(sizeof(*otp_ptr), GFP_KERNEL);
> +       if (!otp_ptr)
> +               return -ENOMEM;
> +
> +       otp_flag =3D 0;
> +       ov8858_read_1byte(client, 0x7010, &otp_flag);
> +       if ((otp_flag & 0xc0) =3D=3D 0x40)
> +               addr =3D 0x7011; /* base address of info group 1 */
> +       else if ((otp_flag & 0x30) =3D=3D 0x10)
> +               addr =3D 0x7016; /* base address of info group 2 */
> +       else if ((otp_flag & 0x0c) =3D=3D 0x04)
> +               addr =3D 0x701b; /* base address of info group 3 */
> +       else
> +               addr =3D 0;
> +
> +       if (addr !=3D 0) {
> +               otp_ptr->flag =3D 0x80; /* valid info in OTP */
> +               ov8858_read_1byte(client, addr, &otp_ptr->module_id);
> +               ov8858_read_1byte(client, addr + 1, &otp_ptr->lens_id);
> +               ov8858_read_1byte(client, addr + 2, &otp_ptr->year);
> +               ov8858_read_1byte(client, addr + 3, &otp_ptr->month);
> +               ov8858_read_1byte(client, addr + 4, &otp_ptr->day);
> +               dev_dbg(dev, "fac info: module(0x%x) lens(0x%x) time(%d_%=
d_%d)!\n",
> +                       otp_ptr->module_id,
> +                       otp_ptr->lens_id,
> +                       otp_ptr->year,
> +                       otp_ptr->month,
> +                       otp_ptr->day);
> +       }
> +
> +       /* OTP base information and WB calibration data */
> +       ov8858_read_1byte(client, 0x7020, &otp_flag);
> +       if ((otp_flag & 0xc0) =3D=3D 0x40)
> +               addr =3D 0x7021; /* base address of info group 1 */
> +       else if ((otp_flag & 0x30) =3D=3D 0x10)
> +               addr =3D 0x7026; /* base address of info group 2 */
> +       else if ((otp_flag & 0x0c) =3D=3D 0x04)
> +               addr =3D 0x702b; /* base address of info group 3 */
> +       else
> +               addr =3D 0;
> +
> +       if (addr !=3D 0) {
> +               otp_ptr->flag |=3D 0x40; /* valid info and AWB in OTP */
> +               ov8858_read_1byte(client, addr + 4, &temp);
> +               ov8858_read_1byte(client, addr, &otp_ptr->rg_ratio);
> +               otp_ptr->rg_ratio =3D (otp_ptr->rg_ratio << 2) +
> +                                   ((temp >> 6) & 0x03);
> +               ov8858_read_1byte(client, addr + 1, &otp_ptr->bg_ratio);
> +               otp_ptr->bg_ratio =3D (otp_ptr->bg_ratio << 2) +
> +                                   ((temp >> 4) & 0x03);
> +               ov8858_read_1byte(client, addr + 2, &otp_ptr->light_rg);
> +               otp_ptr->light_rg =3D (otp_ptr->light_rg << 2) +
> +                                   ((temp >> 2) & 0x03);
> +               ov8858_read_1byte(client, addr + 3, &otp_ptr->light_bg);
> +               otp_ptr->light_bg =3D (otp_ptr->light_bg << 2) +
> +                                   ((temp) & 0x03);
> +               dev_dbg(dev, "awb info: (0x%x, 0x%x, 0x%x, 0x%x)!\n",
> +                       otp_ptr->rg_ratio, otp_ptr->bg_ratio,
> +                       otp_ptr->light_rg, otp_ptr->light_bg);
> +       }
> +
> +       /* OTP VCM Calibration */
> +       ov8858_read_1byte(client, 0x7030, &otp_flag);
> +       if ((otp_flag & 0xc0) =3D=3D 0x40)
> +               addr =3D 0x7031; /* base address of VCM Calibration group=
 1 */
> +       else if ((otp_flag & 0x30) =3D=3D 0x10)
> +               addr =3D 0x7034; /* base address of VCM Calibration group=
 2 */
> +       else if ((otp_flag & 0x0c) =3D=3D 0x04)
> +               addr =3D 0x7037; /* base address of VCM Calibration group=
 3 */
> +       else
> +               addr =3D 0;
> +       if (addr !=3D 0) {
> +               otp_ptr->flag |=3D 0x20;
> +               ov8858_read_1byte(client, addr + 2, &temp);
> +               ov8858_read_1byte(client, addr, &otp_ptr->vcm_start);
> +               otp_ptr->vcm_start =3D (otp_ptr->vcm_start << 2) |
> +                                    ((temp >> 6) & 0x03);
> +               ov8858_read_1byte(client, addr + 1, &otp_ptr->vcm_end);
> +               otp_ptr->vcm_end =3D (otp_ptr->vcm_end << 2) |
> +                                  ((temp >> 4) & 0x03);
> +               otp_ptr->vcm_dir =3D (temp >> 2) & 0x03;
> +               dev_dbg(dev, "vcm_info: 0x%x, 0x%x, 0x%x!\n",
> +                       otp_ptr->vcm_start,
> +                       otp_ptr->vcm_end,
> +                       otp_ptr->vcm_dir);
> +       }
> +
> +       /* OTP Lenc Calibration */
> +       ov8858_read_1byte(client, 0x703a, &otp_flag);
> +       if ((otp_flag & 0xc0) =3D=3D 0x40)
> +               addr =3D 0x703b; /* base address of Lenc Calibration grou=
p 1 */
> +       else if ((otp_flag & 0x30) =3D=3D 0x10)
> +               addr =3D 0x70a9; /* base address of Lenc Calibration grou=
p 2 */
> +       else if ((otp_flag & 0x0c) =3D=3D 0x04)
> +               addr =3D 0x7117; /* base address of Lenc Calibration grou=
p 3 */
> +       else
> +               addr =3D 0;
> +       if (addr !=3D 0) {
> +               otp_ptr->flag |=3D 0x10;
> +               for (i =3D 0; i < 110; i++) {
> +                       ov8858_read_1byte(client, addr + i, &otp_ptr->len=
c[i]);
> +                       dev_dbg(dev, "lsc 0x%x!\n", otp_ptr->lenc[i]);
> +               }
> +       }
> +
> +       for (i =3D 0x7010; i <=3D 0x7184; i++)
> +               ov8858_write_1byte(client, i, 0); /* clear OTP buffer */
> +
> +       if (otp_ptr->flag) {
> +               ov8858->otp_r1a =3D otp_ptr;
> +       } else {
> +               ov8858->otp_r1a =3D NULL;
> +               dev_info(dev, "otp_r1a is null!\n");
> +               kfree(otp_ptr);
> +       }
> +
> +       return 0;
> +}
> +
> +static int ov8858_otp_read_r2a(struct ov8858 *ov8858)
> +{
> +       struct ov8858_otp_info_r2a *otp_ptr;
> +       int otp_flag, addr, temp, checksum, i;
> +       struct device *dev =3D &ov8858->client->dev;
> +       struct i2c_client *client =3D ov8858->client;
> +
> +       otp_ptr =3D kzalloc(sizeof(*otp_ptr), GFP_KERNEL);
> +       if (!otp_ptr)
> +               return -ENOMEM;
> +
> +       /* OTP base information and WB calibration data */
> +       otp_flag =3D 0;
> +       ov8858_read_1byte(client, 0x7010, &otp_flag);
> +       if ((otp_flag & 0xc0) =3D=3D 0x40)
> +               addr =3D 0x7011; /* base address of info group 1 */
> +       else if ((otp_flag & 0x30) =3D=3D 0x10)
> +               addr =3D 0x7019; /* base address of info group 2 */
> +       else
> +               addr =3D 0;
> +
> +       if (addr !=3D 0) {
> +               otp_ptr->flag =3D 0xC0; /* valid info and AWB in OTP */
> +               ov8858_read_1byte(client, addr, &otp_ptr->module_id);
> +               ov8858_read_1byte(client, addr + 1, &otp_ptr->lens_id);
> +               ov8858_read_1byte(client, addr + 2, &otp_ptr->year);
> +               ov8858_read_1byte(client, addr + 3, &otp_ptr->month);
> +               ov8858_read_1byte(client, addr + 4, &otp_ptr->day);
> +               ov8858_read_1byte(client, addr + 7, &temp);
> +               ov8858_read_1byte(client, addr + 5, &otp_ptr->rg_ratio);
> +               otp_ptr->rg_ratio =3D (otp_ptr->rg_ratio << 2) +
> +                                   ((temp >> 6) & 0x03);
> +               ov8858_read_1byte(client, addr + 6, &otp_ptr->bg_ratio);
> +               otp_ptr->bg_ratio =3D (otp_ptr->bg_ratio << 2) +
> +                                   ((temp >> 4) & 0x03);
> +
> +               dev_dbg(dev, "fac info: module(0x%x) lens(0x%x) time(%d_%=
d_%d) !\n",
> +                       otp_ptr->module_id,
> +                       otp_ptr->lens_id,
> +                       otp_ptr->year,
> +                       otp_ptr->month,
> +                       otp_ptr->day);
> +               dev_dbg(dev, "awb info: (0x%x, 0x%x)!\n",
> +                       otp_ptr->rg_ratio,
> +                       otp_ptr->bg_ratio);
> +       }
> +
> +       /* OTP VCM Calibration */
> +       ov8858_read_1byte(client, 0x7021, &otp_flag);
> +       if ((otp_flag & 0xc0) =3D=3D 0x40)
> +               addr =3D 0x7022; /* base address of VCM Calibration group=
 1 */
> +       else if ((otp_flag & 0x30) =3D=3D 0x10)
> +               addr =3D 0x7025; /* base address of VCM Calibration group=
 2 */
> +       else
> +               addr =3D 0;
> +
> +       if (addr !=3D 0) {
> +               otp_ptr->flag |=3D 0x20;
> +               ov8858_read_1byte(client, addr + 2, &temp);
> +               ov8858_read_1byte(client, addr, &otp_ptr->vcm_start);
> +               otp_ptr->vcm_start =3D (otp_ptr->vcm_start << 2) |
> +                                    ((temp >> 6) & 0x03);
> +               ov8858_read_1byte(client, addr + 1, &otp_ptr->vcm_end);
> +               otp_ptr->vcm_end =3D (otp_ptr->vcm_end << 2) |
> +                                  ((temp >> 4) & 0x03);
> +               otp_ptr->vcm_dir =3D (temp >> 2) & 0x03;
> +       }
> +
> +       /* OTP Lenc Calibration */
> +       ov8858_read_1byte(client, 0x7028, &otp_flag);
> +       if ((otp_flag & 0xc0) =3D=3D 0x40)
> +               addr =3D 0x7029; /* base address of Lenc Calibration grou=
p 1 */
> +       else if ((otp_flag & 0x30) =3D=3D 0x10)
> +               addr =3D 0x711a; /* base address of Lenc Calibration grou=
p 2 */
> +       else
> +               addr =3D 0;
> +
> +       if (addr !=3D 0) {
> +               checksum =3D 0;
> +               for (i =3D 0; i < 240; i++) {
> +                       ov8858_read_1byte(client, addr + i, &otp_ptr->len=
c[i]);
> +                       checksum +=3D otp_ptr->lenc[i];
> +                       dev_dbg(dev, "lsc_info: 0x%x!\n", otp_ptr->lenc[i=
]);
> +               }
> +               checksum =3D (checksum) % 255 + 1;
> +               ov8858_read_1byte(client, addr + 240, &otp_ptr->checksum);
> +               if (otp_ptr->checksum =3D=3D checksum)
> +                       otp_ptr->flag |=3D 0x10;
> +       }
> +
> +       for (i =3D 0x7010; i <=3D 0x720a; i++)
> +               ov8858_write_1byte(client, i, 0); /* clear OTP buffer */
> +
> +       if (otp_ptr->flag) {
> +               ov8858->otp_r2a =3D otp_ptr;
> +       } else {
> +               ov8858->otp_r2a =3D NULL;
> +               dev_info(dev, "otp_r2a is null!\n");
> +               kfree(otp_ptr);
> +       }
> +
> +       return 0;
> +}
> +
> +static int ov8858_otp_read(struct ov8858 *ov8858)
> +{
> +       int temp =3D 0;
> +       int ret =3D 0;
> +       struct i2c_client *client =3D ov8858->client;
> +
> +       /* stream on  */
> +       ov8858_write_1byte(client,
> +                          OV8858_REG_CTRL_MODE,
> +                          OV8858_MODE_STREAMING);
> +
> +       ov8858_read_1byte(client, 0x5002, &temp);
> +       ov8858_write_1byte(client, 0x5002, (temp & (~0x08)));
> +
> +       /* read OTP into buffer */
> +       ov8858_write_1byte(client, 0x3d84, 0xC0);
> +       ov8858_write_1byte(client, 0x3d88, 0x70); /* OTP start address */
> +       ov8858_write_1byte(client, 0x3d89, 0x10);
> +       if (ov8858->is_r2a) {
> +               ov8858_write_1byte(client, 0x3d8A, 0x72); /* OTP end addr=
ess */
> +               ov8858_write_1byte(client, 0x3d8B, 0x0a);
> +       } else {
> +               ov8858_write_1byte(client, 0x3d8A, 0x71); /* OTP end addr=
ess */
> +               ov8858_write_1byte(client, 0x3d8B, 0x84);
> +       }
> +       ov8858_write_1byte(client, 0x3d81, 0x01); /* load otp into buffer=
 */
> +       usleep_range(10000, 20000);
> +
> +       if (ov8858->is_r2a)
> +               ret =3D ov8858_otp_read_r2a(ov8858);
> +       else
> +               ret =3D ov8858_otp_read_r1a(ov8858);
> +
> +       /* set 0x5002[3] to "1" */
> +       ov8858_read_1byte(client, 0x5002, &temp);
> +       ov8858_write_1byte(client, 0x5002, 0x08 | (temp & (~0x08)));
> +
> +       /* stream off */
> +       ov8858_write_1byte(client,
> +                          OV8858_REG_CTRL_MODE,
> +                          OV8858_MODE_SW_STANDBY);
> +
> +       return ret;
> +}
> +
> +static int ov8858_check_sensor_id(struct ov8858 *ov8858,
> +                                  struct i2c_client *client)
> +{
> +       struct device *dev =3D &ov8858->client->dev;
> +       u32 id =3D 0;
> +       int ret;
> +
> +       ret =3D ov8858_read_reg(client, OV8858_REG_CHIP_ID,
> +                             OV8858_REG_VALUE_24BIT, &id);
> +       if (id !=3D CHIP_ID) {
> +               dev_err(dev, "Unexpected sensor id(%06x), ret(%d)\n", id,=
 ret);
> +               return ret;
> +       }
> +
> +       ret =3D ov8858_read_reg(client, OV8858_CHIP_REVISION_REG,
> +                             OV8858_REG_VALUE_08BIT, &id);
> +       if (ret) {
> +               dev_err(dev, "Read chip revision register error\n");
> +               return ret;
> +       }
> +
> +       dev_info(dev, "Detected OV%06x sensor, REVISION 0x%x\n", CHIP_ID,=
 id);
> +
> +       if (id =3D=3D OV8858_R2A) {
> +               if (4 =3D=3D ov8858->lane_num) {
> +                       ov8858_global_regs =3D ov8858_global_regs_r2a_4la=
ne;
> +               } else {
> +                       ov8858_global_regs =3D ov8858_global_regs_r2a_2la=
ne;
> +               }
> +
> +               ov8858->is_r2a =3D true;
> +       } else {
> +               ov8858_global_regs =3D ov8858_global_regs_r1a;
> +               ov8858->is_r2a =3D false;
> +               dev_warn(dev, "R1A may not work well current!\n");
> +       }
> +
> +       return 0;
> +}
> +
> +static int ov8858_configure_regulators(struct ov8858 *ov8858)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < OV8858_NUM_SUPPLIES; i++)
> +               ov8858->supplies[i].supply =3D ov8858_supply_names[i];
> +
> +       return devm_regulator_bulk_get(&ov8858->client->dev,
> +                                      OV8858_NUM_SUPPLIES,
> +                                      ov8858->supplies);
> +}
> +
> +static int ov8858_parse_of(struct ov8858 *ov8858)
> +{
> +       struct device *dev =3D &ov8858->client->dev;
> +       struct device_node *endpoint;
> +       struct fwnode_handle *fwnode;
> +       int rval;
> +
> +       endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
> +       if (!endpoint) {
> +               dev_err(dev, "Failed to get endpoint\n");
> +               return -EINVAL;
> +       }
> +
> +       fwnode =3D of_fwnode_handle(endpoint);
> +       rval =3D fwnode_property_read_u32_array(fwnode, "data-lanes", NUL=
L, 0);
> +       if (rval <=3D 0) {
> +               dev_warn(dev, " Get mipi lane num failed!\n");
> +               return -1;
> +       }
> +
> +       ov8858->lane_num =3D rval;
> +       if (4 =3D=3D ov8858->lane_num) {
> +               ov8858->cur_mode =3D &supported_modes_4lane[0];
> +               supported_modes =3D supported_modes_4lane;
> +               ov8858->cfg_num =3D ARRAY_SIZE(supported_modes_4lane);
> +
> +               /* pixel rate =3D link frequency * 2 * lanes / BITS_PER_S=
AMPLE */
> +               ov8858->pixel_rate =3D MIPI_FREQ * 2U * ov8858->lane_num =
/ 10U;
> +               dev_info(dev, "lane_num(%d)  pixel_rate(%u)\n",
> +                                ov8858->lane_num, ov8858->pixel_rate);
> +       } else {
> +               ov8858->cur_mode =3D &supported_modes_2lane[0];
> +               supported_modes =3D supported_modes_2lane;
> +               ov8858->cfg_num =3D ARRAY_SIZE(supported_modes_2lane);
> +
> +               /*pixel rate =3D link frequency * 2 * lanes / BITS_PER_SA=
MPLE */
> +               ov8858->pixel_rate =3D MIPI_FREQ * 2U * (ov8858->lane_num=
) / 10U;
> +               dev_info(dev, "lane_num(%d)  pixel_rate(%u)\n",
> +                                ov8858->lane_num, ov8858->pixel_rate);
> +       }
> +       return 0;
> +}
> +
> +static int ov8858_probe(struct i2c_client *client,
> +                        const struct i2c_device_id *id)
> +{
> +       struct device *dev =3D &client->dev;
> +       struct device_node *node =3D dev->of_node;
> +       struct ov8858 *ov8858;
> +       struct v4l2_subdev *sd;
> +       char facing[2];
> +       int ret;
> +
> +       ov8858 =3D devm_kzalloc(dev, sizeof(*ov8858), GFP_KERNEL);
> +       if (!ov8858)
> +               return -ENOMEM;
> +
> +       ov8858->client =3D client;
> +
> +       ret =3D of_property_read_u32(node, RKMODULE_CAMERA_MODULE_INDEX,
> +                                  &ov8858->module_index);

I'm not sure this one will apply to upstream.

> +       ret |=3D of_property_read_string(node, RKMODULE_CAMERA_MODULE_FAC=
ING,
> +                                      &ov8858->module_facing);
> +       ret |=3D of_property_read_string(node, RKMODULE_CAMERA_MODULE_NAM=
E,
> +                                      &ov8858->module_name);
> +       ret |=3D of_property_read_string(node, RKMODULE_CAMERA_LENS_NAME,
> +                                      &ov8858->len_name);

I believe we have a defined parameter for location and orientation we'll ha=
ve to
update this to use.

I don't think upstream has a defined way to manage the lens specifics
yet, so it will be interesting to push discussion on how we can identify
that.



> +       if (ret)
> +               return dev_err_probe(dev, -EINVAL,
> +                       "could not get module information!\n");
> +
> +       ov8858->xvclk =3D devm_clk_get(dev, "xvclk");
> +       if (IS_ERR(ov8858->xvclk))
> +               return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
> +                                    "Failed to get xvclk\n");
> +
> +       ov8858->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> +                                                    GPIOD_OUT_HIGH);
> +       if (IS_ERR(ov8858->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(ov8858->reset_gpio),
> +                                    "Failed to get reset gpio\n");
> +
> +       ov8858->pwdn_gpio =3D devm_gpiod_get_optional(dev, "powerdown",
> +                                                   GPIOD_OUT_HIGH);
> +       if (IS_ERR(ov8858->pwdn_gpio))
> +               return dev_err_probe(dev, PTR_ERR(ov8858->pwdn_gpio),
> +                                    "Failed to get powerdown gpio\n");
> +
> +       ret =3D ov8858_configure_regulators(ov8858);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to get power regulators\n");
> +
> +       ret =3D ov8858_parse_of(ov8858);
> +       if (ret !=3D 0)
> +               return -EINVAL;
> +
> +       /*
> +       ov8858->pinctrl =3D devm_pinctrl_get(dev);
> +       if (!IS_ERR(ov8858->pinctrl)) {
> +               ov8858->pins_default =3D
> +                       pinctrl_lookup_state(ov8858->pinctrl,
> +                                            OF_CAMERA_PINCTRL_STATE_DEFA=
ULT);
> +               if (IS_ERR(ov8858->pins_default))
> +                       dev_err(dev, "could not get default pinstate\n");
> +
> +               ov8858->pins_sleep =3D
> +                       pinctrl_lookup_state(ov8858->pinctrl,
> +                                            OF_CAMERA_PINCTRL_STATE_SLEE=
P);
> +               if (IS_ERR(ov8858->pins_sleep))
> +                       dev_err(dev, "could not get sleep pinstate\n");
> +       }
> +         */
> +
> +       mutex_init(&ov8858->mutex);
> +
> +       sd =3D &ov8858->subdev;
> +       v4l2_i2c_subdev_init(sd, client, &ov8858_subdev_ops);
> +       ret =3D ov8858_initialize_controls(ov8858);
> +       if (ret)
> +               goto err_destroy_mutex;
> +
> +       ret =3D __ov8858_power_on(ov8858);
> +       if (ret)
> +               goto err_free_handler;
> +
> +       ret =3D ov8858_check_sensor_id(ov8858, client);
> +       if (ret)
> +               goto err_power_off;
> +
> +       ov8858_otp_read(ov8858);
> +
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API

This has been selected.

> +       sd->internal_ops =3D &ov8858_internal_ops;
> +       sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +#endif
> +#ifdef CONFIG_MEDIA_CONTROLLER

This has been selected.

> +       ov8858->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +       ret =3D media_entity_pads_init(&sd->entity, 1, &ov8858->pad);
> +       if (ret < 0)
> +               goto err_power_off;
> +#endif
> +
> +       memset(facing, 0, sizeof(facing));
> +       if (strcmp(ov8858->module_facing, "back") =3D=3D 0)
> +               facing[0] =3D 'b';
> +       else
> +               facing[0] =3D 'f';
> +
> +       snprintf(sd->name, sizeof(sd->name), "m%02d_%s_%s %s",
> +                ov8858->module_index, facing,
> +                OV8858_NAME, dev_name(sd->dev));

This is too 'arbitrary'. As I understand it, sensors define their sensor
name in the device, and properties like module_facing, are exposed
through controls.


> +       ret =3D v4l2_async_register_subdev_sensor(sd);
> +       if (ret) {
> +               dev_err(dev, "v4l2 async register subdev failed\n");
> +               goto err_clean_entity;
> +       }
> +
> +       pm_runtime_set_active(dev);
> +       pm_runtime_enable(dev);
> +       pm_runtime_idle(dev);
> +
> +       return 0;
> +
> +err_clean_entity:
> +#ifdef CONFIG_MEDIA_CONTROLLER

already selected

> +       media_entity_cleanup(&sd->entity);
> +#endif
> +err_power_off:
> +       __ov8858_power_off(ov8858);
> +err_free_handler:
> +       v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
> +err_destroy_mutex:
> +       mutex_destroy(&ov8858->mutex);
> +
> +       return ret;
> +}
> +
> +static int ov8858_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct ov8858 *ov8858 =3D to_ov8858(sd);
> +
> +       v4l2_async_unregister_subdev(sd);
> +#ifdef CONFIG_MEDIA_CONTROLLER

already selected

> +       media_entity_cleanup(&sd->entity);
> +#endif
> +       v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
> +       if (ov8858->otp_r2a)
> +               kfree(ov8858->otp_r2a);
> +       if (ov8858->otp_r1a)
> +               kfree(ov8858->otp_r1a);
> +       mutex_destroy(&ov8858->mutex);
> +
> +       pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               __ov8858_power_off(ov8858);
> +       pm_runtime_set_suspended(&client->dev);
> +
> +       return 0;
> +}
> +
> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id ov8858_of_match[] =3D {
> +       { .compatible =3D "ovti,ov8858" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, ov8858_of_match);
> +#endif
> +
> +static const struct i2c_device_id ov8858_match_id[] =3D {
> +       { "ovti,ov8858", 0 },

This will report missing device tree bindings. That should be a separate
patch, but kept as part of the series.

There's lots of examples for other ov sensors to follow to generate this
from.


> +       { },
> +};
> +
> +static struct i2c_driver ov8858_i2c_driver =3D {
> +       .driver =3D {
> +               .name =3D OV8858_NAME,
> +               .pm =3D &ov8858_pm_ops,
> +               .of_match_table =3D of_match_ptr(ov8858_of_match),
> +       },
> +       .probe          =3D &ov8858_probe,
> +       .remove         =3D &ov8858_remove,
> +       .id_table       =3D ov8858_match_id,
> +};
> +
> +module_i2c_driver(ov8858_i2c_driver);
> +
> +MODULE_DESCRIPTION("OmniVision ov8858 sensor driver");
> +MODULE_LICENSE("GPL v2");
> --=20
> 2.34.1
>
