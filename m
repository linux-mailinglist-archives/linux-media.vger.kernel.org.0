Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE1B1265DD
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 16:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfLSPgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 10:36:52 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33877 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbfLSPgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 10:36:52 -0500
Received: by mail-wm1-f66.google.com with SMTP id f4so7306472wmj.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 07:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SbiFZ0JCmnkQczGm38PFjm60oTCbCUwQ9sqFs4XKCbw=;
        b=NzTxY8xS3LWyLVrQbUnOjqPz3qlP3E4sfuL/CQ4I/bu0IEN02TM8AOMSQbUQm4D8GQ
         wZJgLgKUifiU7g8A205ro48G6ybrIERuKW5dPcRegRrCg1/m8nxTSwHC+O7ga5qBGIZI
         MTC7coWQYqHTAph4HJ9XtMNxFGepMYhjdsMwQHKUVkxaY+baNVY5frc7ELwP/ClZGwUX
         N/CalJp9rCM+z1K8D497R0rDmGUkOLW+gAs4bUgT+K5IryxswA9XCBYSwO4Hx+LW18hN
         gcgc8D0UGdey5XoO0CTWISEG1PDalH/HJ49ksldhRji7UOHsO4o7TTXcR8VuBePJwK9o
         hmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SbiFZ0JCmnkQczGm38PFjm60oTCbCUwQ9sqFs4XKCbw=;
        b=mwXzi5smlPZkkmq1Tz75M80dCe9UfGFGOH8f5Mocxch4nMhX6NbXgAe8+z8Ey/0q7l
         gFAbPKAWOBfCy6ThIZdrkmfOA3mhBv+YnH2mdpCATcxiwrr8mJryKCyASi4Uq0FLdyWj
         9R3OBBSF73DxO/wa4z42hVJQDh/LUuz5fuWbBF4XUz4YM7zhrzjf4GwZhNmjSf5sBPrV
         6eb3V7GErTq690SvNAnpQULlrfajpJQnGt3vHJYGier/Hq7i6hXxkf3WHRApQaMwWUFi
         6HV+e6dFYjYI+vz4PpTnJyXjFIlKjIDKVJ2FdDEhvPgoZhhgMMQC2v3OERvuO36v+rdj
         XJYw==
X-Gm-Message-State: APjAAAVQE9k/ti8So9hWn5ncBdUxthfiuUpIJBohRhNFG0fIWq2a8Crp
        jxRKtoshWhVm+w4xp3SFJF0V3fHUyZQHMHygv2vpNQ==
X-Google-Smtp-Source: APXvYqxV7Gw4PP4ILehirKy8kCMtvIjbNWSt7MfNXgZCmLR2uxDLTsK7GAH8NSSqVQX22ek1cPBrXyHa1Xg7Y5NJnMo=
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr10619986wmd.102.1576769804935;
 Thu, 19 Dec 2019 07:36:44 -0800 (PST)
MIME-Version: 1.0
References: <20191211115441.10637-1-andrey.konovalov@linaro.org>
 <20191211115441.10637-3-andrey.konovalov@linaro.org> <3edcc4d5fc694c497bd67e9c3b8294a681c47ac1.camel@collabora.com>
 <a9f585c8-7033-7eb9-6db5-cb2ea2aa63b1@linaro.org>
In-Reply-To: <a9f585c8-7033-7eb9-6db5-cb2ea2aa63b1@linaro.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 19 Dec 2019 15:36:26 +0000
Message-ID: <CAPY8ntDnhcGOUpTX+k63=MU5PWn1c21vvS6Pqm3t75hDbzWVgg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX219 sensor
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>, mchehab@kernel.org,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, peter.griffin@linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel and Andrey

Thanks to Andrey for tidying up my patch, and Ezequiel for the review.

On Wed, 18 Dec 2019 at 22:29, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Ezequiel,
>
> Thank you for reviewing the patch!
>
> On 14.12.2019 08:52, Ezequiel Garcia wrote:
> > Hi Andrey, Dave:
> >
> > I'm really happy to see this. Thanks for your upstreaming effort :)
> > I mostly have minor comments, the driver looks quite good.
> >
> > On Wed, 2019-12-11 at 14:54 +0300, Andrey Konovalov wrote:
> >> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>
> >> Adds a driver for the 8MPix Sony IMX219 CSI2 sensor.
> >> Whilst the sensor supports 2 or 4 CSI2 data lanes, this driver
> >> currently only supports 2 lanes.
> >> 8MPix @ 15fps, 1080P @ 30fps (cropped FOV), and 1640x1232 (2x2 binned)
> >> @ 30fps are currently supported.
> >>
> >> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> >> ---
> >>   drivers/media/i2c/Kconfig  |   12 +
> >>   drivers/media/i2c/Makefile |    1 +
> >>   drivers/media/i2c/imx219.c | 1248 ++++++++++++++++++++++++++++++++++++
> >>   3 files changed, 1261 insertions(+)
> >>   create mode 100644 drivers/media/i2c/imx219.c
> >>
> >> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> >> index c68e002d26ea..6fa5af1f72b9 100644
> >> --- a/drivers/media/i2c/Kconfig
> >> +++ b/drivers/media/i2c/Kconfig
> >> @@ -591,6 +591,18 @@ config VIDEO_IMX214
> >>        To compile this driver as a module, choose M here: the
> >>        module will be called imx214.
> >>
> >> +config VIDEO_IMX219
> >> +    tristate "Sony IMX219 sensor support"
> >> +    depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> >> +    depends on MEDIA_CAMERA_SUPPORT
> >> +    select V4L2_FWNODE
> >> +    help
> >> +      This is a Video4Linux2 sensor driver for the Sony
> >> +      IMX219 camera.
> >> +
> >> +      To compile this driver as a module, choose M here: the
> >> +      module will be called imx219.
> >> +
> >>   config VIDEO_IMX258
> >>      tristate "Sony IMX258 sensor support"
> >>      depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> >> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> >> index c147bb9d28db..77bf7d0b691f 100644
> >> --- a/drivers/media/i2c/Makefile
> >> +++ b/drivers/media/i2c/Makefile
> >> @@ -111,6 +111,7 @@ obj-$(CONFIG_VIDEO_OV2659)       += ov2659.o
> >>   obj-$(CONFIG_VIDEO_TC358743)       += tc358743.o
> >>   obj-$(CONFIG_VIDEO_HI556)  += hi556.o
> >>   obj-$(CONFIG_VIDEO_IMX214) += imx214.o
> >> +obj-$(CONFIG_VIDEO_IMX219)  += imx219.o
> >>   obj-$(CONFIG_VIDEO_IMX258) += imx258.o
> >>   obj-$(CONFIG_VIDEO_IMX274) += imx274.o
> >>   obj-$(CONFIG_VIDEO_IMX290) += imx290.o
> >> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> >> new file mode 100644
> >> index 000000000000..a76e071279f2
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/imx219.c
> >> @@ -0,0 +1,1248 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * A V4L2 driver for Sony IMX219 cameras.
> >> + * Copyright (C) 2019, Raspberry Pi (Trading) Ltd
> >> + *
> >> + * Based on Sony imx258 camera driver
> >> + * Copyright (C) 2018 Intel Corporation
> >> + *
> >> + * DT / fwnode changes, and regulator / GPIO control taken from imx214 driver
> >> + * Copyright 2018 Qtechnology A/S
> >> + *
> >> + * Flip handling taken from the Sony IMX319 driver.
> >> + * Copyright (C) 2018 Intel Corporation
> >> + *
> >> + */
> >> +
> >> +#include <linux/clk.h>
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/clkdev.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/gpio/consumer.h>
> >> +#include <linux/i2c.h>
> >> +#include <linux/module.h>
> >> +#include <linux/pm_runtime.h>
> >> +#include <linux/regulator/consumer.h>
> >> +#include <media/v4l2-ctrls.h>
> >> +#include <media/v4l2-device.h>
> >> +#include <media/v4l2-event.h>
> >> +#include <media/v4l2-fwnode.h>
> >> +#include <media/v4l2-mediabus.h>
> >> +#include <asm/unaligned.h>
> >> +
> >> +#define IMX219_REG_VALUE_08BIT              1
> >> +#define IMX219_REG_VALUE_16BIT              2
> >> +
> >> +#define IMX219_REG_MODE_SELECT              0x0100
> >> +#define IMX219_MODE_STANDBY         0x00
> >> +#define IMX219_MODE_STREAMING               0x01
> >> +
> >> +/* Chip ID */
> >> +#define IMX219_REG_CHIP_ID          0x0000
> >> +#define IMX219_CHIP_ID                      0x0219
> >> +
> >> +/* pixel rate is fixed at 182.4M for all the modes */
> >> +#define IMX219_PIXEL_RATE           182400000
> >> +
> >> +/* V_TIMING internal */
> >> +#define IMX219_REG_VTS                      0x0160
> >> +#define IMX219_VTS_15FPS            0x0dc6
> >> +#define IMX219_VTS_30FPS_1080P              0x06e3
> >> +#define IMX219_VTS_30FPS_BINNED             0x06e3
> >> +#define IMX219_VTS_MAX                      0xffff
> >> +
> >> +#define IMX219_VBLANK_MIN           4
> >> +
> >> +/*Frame Length Line*/
> >> +#define IMX219_FLL_MIN                      0x08a6
> >> +#define IMX219_FLL_MAX                      0xffff
> >> +#define IMX219_FLL_STEP                     1
> >> +#define IMX219_FLL_DEFAULT          0x0c98
> >> +
> >> +/* HBLANK control - read only */
> >> +#define IMX219_PPL_DEFAULT          3448
> >> +
> >> +/* Exposure control */
> >> +#define IMX219_REG_EXPOSURE         0x015a
> >> +#define IMX219_EXPOSURE_MIN         4
> >> +#define IMX219_EXPOSURE_STEP                1
> >> +#define IMX219_EXPOSURE_DEFAULT             0x640
> >> +#define IMX219_EXPOSURE_MAX         65535
> >> +
> >> +/* Analog gain control */
> >> +#define IMX219_REG_ANALOG_GAIN              0x0157
> >> +#define IMX219_ANA_GAIN_MIN         0
> >> +#define IMX219_ANA_GAIN_MAX         232
> >> +#define IMX219_ANA_GAIN_STEP                1
> >> +#define IMX219_ANA_GAIN_DEFAULT             0x0
> >> +
> >> +/* Digital gain control */
> >> +#define IMX219_REG_DIGITAL_GAIN             0x0158
> >> +#define IMX219_DGTL_GAIN_MIN                0x0100
> >> +#define IMX219_DGTL_GAIN_MAX                0x0fff
> >> +#define IMX219_DGTL_GAIN_DEFAULT    0x0100
> >> +#define IMX219_DGTL_GAIN_STEP               1
> >> +
> >> +#define IMX219_REG_ORIENTATION              0x0172
> >> +
> >> +/* Test Pattern Control */
> >> +#define IMX219_REG_TEST_PATTERN             0x0600
> >> +#define IMX219_TEST_PATTERN_DISABLE 0
> >> +#define IMX219_TEST_PATTERN_SOLID_COLOR     1
> >> +#define IMX219_TEST_PATTERN_COLOR_BARS      2
> >> +#define IMX219_TEST_PATTERN_GREY_COLOR      3
> >> +#define IMX219_TEST_PATTERN_PN9             4
> >> +
> >> +/* Test pattern colour components */
> >> +#define IMX219_REG_TESTP_RED                0x0602
> >> +#define IMX219_REG_TESTP_GREENR             0x0604
> >> +#define IMX219_REG_TESTP_BLUE               0x0606
> >> +#define IMX219_REG_TESTP_GREENB             0x0608
> >> +#define IMX219_TESTP_COLOUR_MIN             0
> >> +#define IMX219_TESTP_COLOUR_MAX             0x03ff
> >> +#define IMX219_TESTP_COLOUR_STEP    1
> >> +#define IMX219_TESTP_RED_DEFAULT    IMX219_TESTP_COLOUR_MAX
> >> +#define IMX219_TESTP_GREENR_DEFAULT 0
> >> +#define IMX219_TESTP_BLUE_DEFAULT   0
> >> +#define IMX219_TESTP_GREENB_DEFAULT 0
> >> +
> >> +struct imx219_reg {
> >> +    u16 address;
> >> +    u8 val;
> >> +};
> >> +
> >> +struct imx219_reg_list {
> >> +    u32 num_of_regs;
> >
> > s/u32/unsigned int? unless there is a need
> > for this to have a fixed width.
>
> Will fix in v2. There is no need to use u32 here.
>
> > Same goes for other u32 variables.
>
> The v4l2_ctrl_new_*() functions take s32 or u32 as their integer arguments,
> and those u32 variables are used to pass the args.
> Also there are drivers (e.g. imx319.c) which use u32 quite a lot.
>
> But OK. I can change most of the u32 and s32 to unsigned int and int.
> Will do that in v2 of the patch.
>
> >> +    const struct imx219_reg *regs;
> >> +};
> >> +
> >> +/* Mode : resolution and related config&values */
> >> +struct imx219_mode {
> >> +    /* Frame width */
> >
> > This is probably a too much of a nitpick: the driver is full of these
> > type of comments "Frame width", for a width field.
> >
> > Now, I really don't want to get dragged into a commenting-anti-pattern
> > debate (the internet's trucks are already filled with those),
> > yet I can't resist
> > mentioning that I see an excess of comments
> > for stuff whose meaning is pretty obvious and self-explained.
>
> This looks excessive indeed, but I would prefer to keep these particular "Frame width" and
> "Frame height" comments. Though this is quite obvious from the context the width/height fields
> are used in, but there are few other widths and heights in the driver so..
>
> > Same goes for functions whose name is self-explanatory,
> > where no comment is needed:
> >
> >      /* Check module identity */
> >      ret = imx219_identify_module(imx219);
> >
> >      /* Initialize subdev */
> >      v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
> >
> > ... and others similar.
>
> Agreed. I'll remove these and the similar ones in v2.
>
> > I guess my view is aligned with that of the coding style doc:
> >
> > """
> > Comments are good, but there is also a danger of over-commenting.  NEVER
> > try to explain HOW your code works in a comment: it's much better to
> > write the code so that the **working** is obvious, and it's a waste of
> > time to explain badly written code.
> > """
>
> I fully agree. Just I prefer to overcomment the data structures than to undercomment them.
>
> >> +    u32 width;
> >> +    /* Frame height */
> >> +    u32 height;
> >> +
> >> +    /* V-timing */
> >> +    u32 vts_def;
> >> +
> >> +    /* Default register values */
> >> +    struct imx219_reg_list reg_list;
> >> +};
> >> +
> >> +/*
> >> + * Register sets lifted off the i2C interface from the Raspberry Pi firmware
> >> + * driver.
> >> + * 3280x2464 = mode 2, 1920x1080 = mode 1, and 1640x1232 = mode 4.
> >> + */
> >> +static const struct imx219_reg mode_3280x2464_regs[] = {
> >> +    {0x0100, 0x00},
> >> +    {0x30eb, 0x0c},
> >> +    {0x30eb, 0x05},
> >> +    {0x300a, 0xff},
> >> +    {0x300b, 0xff},
> >> +    {0x30eb, 0x05},
> >> +    {0x30eb, 0x09},
> >> +    {0x0114, 0x01},
> >> +    {0x0128, 0x00},
> >> +    {0x012a, 0x18},
> >> +    {0x012b, 0x00},
> >> +    {0x0164, 0x00},
> >> +    {0x0165, 0x00},
> >> +    {0x0166, 0x0c},
> >> +    {0x0167, 0xcf},
> >> +    {0x0168, 0x00},
> >> +    {0x0169, 0x00},
> >> +    {0x016a, 0x09},
> >> +    {0x016b, 0x9f},
> >> +    {0x016c, 0x0c},
> >> +    {0x016d, 0xd0},
> >> +    {0x016e, 0x09},
> >> +    {0x016f, 0xa0},
> >> +    {0x0170, 0x01},
> >> +    {0x0171, 0x01},
> >> +    {0x0174, 0x00},
> >> +    {0x0175, 0x00},
> >> +    {0x018c, 0x0a},
> >> +    {0x018d, 0x0a},
> >> +    {0x0301, 0x05},
> >> +    {0x0303, 0x01},
> >> +    {0x0304, 0x03},
> >> +    {0x0305, 0x03},
> >> +    {0x0306, 0x00},
> >> +    {0x0307, 0x39},
> >> +    {0x0309, 0x0a},
> >> +    {0x030b, 0x01},
> >> +    {0x030c, 0x00},
> >> +    {0x030d, 0x72},
> >> +    {0x0624, 0x0c},
> >> +    {0x0625, 0xd0},
> >> +    {0x0626, 0x09},
> >> +    {0x0627, 0xa0},
> >> +    {0x455e, 0x00},
> >> +    {0x471e, 0x4b},
> >> +    {0x4767, 0x0f},
> >> +    {0x4750, 0x14},
> >> +    {0x4540, 0x00},
> >> +    {0x47b4, 0x14},
> >> +    {0x4713, 0x30},
> >> +    {0x478b, 0x10},
> >> +    {0x478f, 0x10},
> >> +    {0x4793, 0x10},
> >> +    {0x4797, 0x0e},
> >> +    {0x479b, 0x0e},
> >> +
> >
> > I bet this extra line has a meaning. Perhaps you can add a comment here.
>
> Well,
>
> >> +    {0x0172, 0x00},
>
> - this sets IMX219_REG_ORIENTATION to defaut (no horisontal or vertical flips).
>
> >> +    {0x0162, 0x0d},
> >> +    {0x0163, 0x78},
>
> 0x0d78 equals to IMX219_PPL_DEFAULT (pixels per line, right?), and this is the fixed value
> in this driver (even though the frame width is not the same in different modes; there is a comment
> on that in imx219_set_pad_format()).
>
> I don't know if setting these two parameters last in the row has a special meaning.
>
> Maybe Dave can add something here,
> but otherwise I am OK with either having this extra line, or deleting it.

Yes, those were the few register values that get overwritten by controls.
I haven't checked, but if they are guaranteed to be written by the
control handler under all conditions, then they can be dropped out of
these tables.

> >> +};
> >> +
> >> +static const struct imx219_reg mode_1920_1080_regs[] = {
> >> +    {0x0100, 0x00},
> >> +    {0x30eb, 0x05},
> >> +    {0x30eb, 0x0c},
> >> +    {0x300a, 0xff},
> >> +    {0x300b, 0xff},
> >> +    {0x30eb, 0x05},
> >> +    {0x30eb, 0x09},
> >> +    {0x0114, 0x01},
> >> +    {0x0128, 0x00},
> >> +    {0x012a, 0x18},
> >> +    {0x012b, 0x00},
> >> +    {0x0162, 0x0d},
> >> +    {0x0163, 0x78},
> >> +    {0x0164, 0x02},
> >> +    {0x0165, 0xa8},
> >> +    {0x0166, 0x0a},
> >> +    {0x0167, 0x27},
> >> +    {0x0168, 0x02},
> >> +    {0x0169, 0xb4},
> >> +    {0x016a, 0x06},
> >> +    {0x016b, 0xeb},
> >> +    {0x016c, 0x07},
> >> +    {0x016d, 0x80},
> >> +    {0x016e, 0x04},
> >> +    {0x016f, 0x38},
> >> +    {0x0170, 0x01},
> >> +    {0x0171, 0x01},
> >> +    {0x0174, 0x00},
> >> +    {0x0175, 0x00},
> >> +    {0x018c, 0x0a},
> >> +    {0x018d, 0x0a},
> >> +    {0x0301, 0x05},
> >> +    {0x0303, 0x01},
> >> +    {0x0304, 0x03},
> >> +    {0x0305, 0x03},
> >> +    {0x0306, 0x00},
> >> +    {0x0307, 0x39},
> >> +    {0x0309, 0x0a},
> >> +    {0x030b, 0x01},
> >> +    {0x030c, 0x00},
> >> +    {0x030d, 0x72},
> >> +    {0x0624, 0x07},
> >> +    {0x0625, 0x80},
> >> +    {0x0626, 0x04},
> >> +    {0x0627, 0x38},
> >> +    {0x455e, 0x00},
> >> +    {0x471e, 0x4b},
> >> +    {0x4767, 0x0f},
> >> +    {0x4750, 0x14},
> >> +    {0x4540, 0x00},
> >> +    {0x47b4, 0x14},
> >> +    {0x4713, 0x30},
> >> +    {0x478b, 0x10},
> >> +    {0x478f, 0x10},
> >> +    {0x4793, 0x10},
> >> +    {0x4797, 0x0e},
> >> +    {0x479b, 0x0e},
> >> +
> >
> > Ditto.
> >
> >> +    {0x0172, 0x00},
> >> +    {0x0162, 0x0d},
> >> +    {0x0163, 0x78},
> >> +};
> >> +
> >> +static const struct imx219_reg mode_1640_1232_regs[] = {
> >> +    {0x0100, 0x00},
> >> +    {0x30eb, 0x0c},
> >> +    {0x30eb, 0x05},
> >> +    {0x300a, 0xff},
> >> +    {0x300b, 0xff},
> >> +    {0x30eb, 0x05},
> >> +    {0x30eb, 0x09},
> >> +    {0x0114, 0x01},
> >> +    {0x0128, 0x00},
> >> +    {0x012a, 0x18},
> >> +    {0x012b, 0x00},
> >> +    {0x0164, 0x00},
> >> +    {0x0165, 0x00},
> >> +    {0x0166, 0x0c},
> >> +    {0x0167, 0xcf},
> >> +    {0x0168, 0x00},
> >> +    {0x0169, 0x00},
> >> +    {0x016a, 0x09},
> >> +    {0x016b, 0x9f},
> >> +    {0x016c, 0x06},
> >> +    {0x016d, 0x68},
> >> +    {0x016e, 0x04},
> >> +    {0x016f, 0xd0},
> >> +    {0x0170, 0x01},
> >> +    {0x0171, 0x01},
> >> +    {0x0174, 0x01},
> >> +    {0x0175, 0x01},
> >> +    {0x018c, 0x0a},
> >> +    {0x018d, 0x0a},
> >> +    {0x0301, 0x05},
> >> +    {0x0303, 0x01},
> >> +    {0x0304, 0x03},
> >> +    {0x0305, 0x03},
> >> +    {0x0306, 0x00},
> >> +    {0x0307, 0x39},
> >> +    {0x0309, 0x0a},
> >> +    {0x030b, 0x01},
> >> +    {0x030c, 0x00},
> >> +    {0x030d, 0x72},
> >> +    {0x0624, 0x06},
> >> +    {0x0625, 0x68},
> >> +    {0x0626, 0x04},
> >> +    {0x0627, 0xd0},
> >> +    {0x455e, 0x00},
> >> +    {0x471e, 0x4b},
> >> +    {0x4767, 0x0f},
> >> +    {0x4750, 0x14},
> >> +    {0x4540, 0x00},
> >> +    {0x47b4, 0x14},
> >> +    {0x4713, 0x30},
> >> +    {0x478b, 0x10},
> >> +    {0x478f, 0x10},
> >> +    {0x4793, 0x10},
> >> +    {0x4797, 0x0e},
> >> +    {0x479b, 0x0e},
> >> +
> >> +    {0x0172, 0x00},
> >> +    {0x0162, 0x0d},
> >> +    {0x0163, 0x78},
> >> +};
> >> +
> >> +static const char * const imx219_test_pattern_menu[] = {
> >> +    "Disabled",
> >> +    "Color Bars",
> >> +    "Solid Color",
> >> +    "Grey Color Bars",
> >> +    "PN9"
> >> +};
> >> +
> >> +static const int imx219_test_pattern_val[] = {
> >> +    IMX219_TEST_PATTERN_DISABLE,
> >> +    IMX219_TEST_PATTERN_COLOR_BARS,
> >> +    IMX219_TEST_PATTERN_SOLID_COLOR,
> >> +    IMX219_TEST_PATTERN_GREY_COLOR,
> >> +    IMX219_TEST_PATTERN_PN9,
> >> +};
> >> +
> >> +/* regulator supplies */
> >> +static const char * const imx219_supply_name[] = {
> >> +    /* Supplies can be enabled in any order */
> >> +    "VANA",  /* Analog (2.8V) supply */
> >> +    "VDIG",  /* Digital Core (1.8V) supply */
> >> +    "VDDL",  /* IF (1.2V) supply */
> >> +};
> >> +
> >> +#define IMX219_NUM_SUPPLIES ARRAY_SIZE(imx219_supply_name)
> >> +
> >> +#define IMX219_XCLR_DELAY_MS 10     /* Initialisation delay after XCLR low->high */
> >> +
> >> +/* Mode configs */
> >> +static const struct imx219_mode supported_modes[] = {
> >> +    {
> >> +            /* 8MPix 15fps mode */
> >> +            .width = 3280,
> >> +            .height = 2464,
> >> +            .vts_def = IMX219_VTS_15FPS,
> >> +            .reg_list = {
> >> +                    .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> >> +                    .regs = mode_3280x2464_regs,
> >> +            },
> >> +    },
> >> +    {
> >> +            /* 1080P 30fps cropped */
> >> +            .width = 1920,
> >> +            .height = 1080,
> >> +            .vts_def = IMX219_VTS_30FPS_1080P,
> >> +            .reg_list = {
> >> +                    .num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
> >> +                    .regs = mode_1920_1080_regs,
> >> +            },
> >> +    },
> >> +    {
> >> +            /* 2x2 binned 30fps mode */
> >> +            .width = 1640,
> >> +            .height = 1232,
> >> +            .vts_def = IMX219_VTS_30FPS_BINNED,
> >> +            .reg_list = {
> >> +                    .num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
> >> +                    .regs = mode_1640_1232_regs,
> >> +            },
> >> +    },
> >> +};
> >> +
> >> +struct imx219 {
> >> +    struct device *dev;
> >> +
> >> +    struct v4l2_subdev sd;
> >> +    struct media_pad pad;
> >> +
> >> +    struct v4l2_fwnode_endpoint ep; /* the parsed DT endpoint info */
> >> +    struct clk *xclk; /* system clock to IMX219 */
> >> +    u32 xclk_freq;
> >> +
> >> +    struct gpio_desc *xclr_gpio;
> >> +    struct regulator_bulk_data supplies[IMX219_NUM_SUPPLIES];
> >> +
> >> +    struct v4l2_ctrl_handler ctrl_handler;
> >> +    /* V4L2 Controls */
> >> +    struct v4l2_ctrl *pixel_rate;
> >> +    struct v4l2_ctrl *exposure;
> >> +    struct v4l2_ctrl *vflip;
> >> +    struct v4l2_ctrl *hflip;
> >> +    struct v4l2_ctrl *vblank;
> >> +    struct v4l2_ctrl *hblank;
> >> +
> >> +    /* Current mode */
> >> +    const struct imx219_mode *mode;
> >> +
> >> +    /*
> >> +     * Mutex for serialized access:
> >> +     * Protect sensor module set pad format and start/stop streaming safely.
> >> +     */
> >> +    struct mutex mutex;
> >> +
> >> +    /* Streaming on/off */
> >> +    bool streaming;
> >> +};
> >> +
> >> +static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> >> +{
> >> +    return container_of(_sd, struct imx219, sd);
> >> +}
> >> +
> >> +/* Read registers up to 2 at a time */
> >> +static int imx219_read_reg(struct imx219 *imx219, u16 reg, u32 len, u32 *val)
> >> +{
> >> +    struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >> +    struct i2c_msg msgs[2];
> >> +    u8 addr_buf[2] = { reg >> 8, reg & 0xff };
> >> +    u8 data_buf[4] = { 0, };
> >> +    int ret;
> >> +
> >> +    if (len > 4)
> >> +            return -EINVAL;
> >> +
> >> +    /* Write register address */
> >> +    msgs[0].addr = client->addr;
> >> +    msgs[0].flags = 0;
> >> +    msgs[0].len = ARRAY_SIZE(addr_buf);
> >> +    msgs[0].buf = addr_buf;
> >> +
> >> +    /* Read data from register */
> >> +    msgs[1].addr = client->addr;
> >> +    msgs[1].flags = I2C_M_RD;
> >> +    msgs[1].len = len;
> >> +    msgs[1].buf = &data_buf[4 - len];
> >> +
> >> +    ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> >> +    if (ret != ARRAY_SIZE(msgs))
> >> +            return -EIO;
> >> +
> >> +    *val = get_unaligned_be32(data_buf);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +/* Write registers up to 2 at a time */
> >> +static int imx219_write_reg(struct imx219 *imx219, u16 reg, u32 len, u32 val)
> >> +{
> >> +    struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >> +    u8 buf[6];
> >> +
> >> +    if (len > 4)
> >> +            return -EINVAL;
> >> +
> >> +    put_unaligned_be16(reg, buf);
> >> +    put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> >> +    if (i2c_master_send(client, buf, len + 2) != len + 2)
> >> +            return -EIO;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +/* Write a list of registers */
> >> +static int imx219_write_regs(struct imx219 *imx219,
> >> +                         const struct imx219_reg *regs, u32 len)
> >> +{
> >> +    struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >> +    unsigned int i;
> >> +    int ret;
> >> +
> >> +    for (i = 0; i < len; i++) {
> >> +            ret = imx219_write_reg(imx219, regs[i].address, 1, regs[i].val);
> >> +            if (ret) {
> >> +                    dev_err_ratelimited(&client->dev,
> >> +                                        "Failed to write reg 0x%4.4x. error = %d\n",
> >> +                                        regs[i].address, ret);
> >> +
> >> +                    return ret;
> >> +            }
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +/* Get bayer order based on flip setting. */
> >> +static u32 imx219_get_format_code(struct imx219 *imx219)
> >> +{
> >> +    /*
> >> +     * Only one bayer order is supported.
> >> +     * It depends on the flip settings.
> >> +     */
> >> +    u32 code;
> >> +    static const u32 codes[2][2] = {
> >> +            { MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SGRBG10_1X10, },
> >> +            { MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SBGGR10_1X10, },
> >> +    }
> >> +
> >> +    lockdep_assert_held(&imx219->mutex);
> >> +    code = codes[imx219->vflip->val][imx219->hflip->val];
> >> +
> >
> > Nitpick: returning codes[..]; seems straighter, and thus more readable.
>
> Will fix in v2.
>
> >> +    return code;
> >> +}
> >> +
> >> +static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >> +{
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +    struct v4l2_mbus_framefmt *try_fmt =
> >> +            v4l2_subdev_get_try_format(sd, fh->pad, 0);
> >> +
> >> +    mutex_lock(&imx219->mutex);
> >> +
> >> +    /* Initialize try_fmt */
> >> +    try_fmt->width = supported_modes[0].width;
> >> +    try_fmt->height = supported_modes[0].height;
> >> +    try_fmt->code = imx219_get_format_code(imx219);
> >> +    try_fmt->field = V4L2_FIELD_NONE;
> >> +
> >> +    mutex_unlock(&imx219->mutex);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >> +{
> >> +    struct imx219 *imx219 =
> >> +            container_of(ctrl->handler, struct imx219, ctrl_handler);
> >> +    struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >> +    int ret = 0;
> >> +
> >
> > Don't think you need to assign 'ret'.
>
> Right. Will fix in v2 of the patch.
>
> >> +    if (ctrl->id == V4L2_CID_VBLANK) {
> >> +            s64 exposure_max, exposure_def;
> >> +
> >> +            /* Update max exposure while meeting expected vblanking */
> >> +            exposure_max = imx219->mode->height + ctrl->val - 4;
> >> +            exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> >> +                    exposure_max : IMX219_EXPOSURE_DEFAULT;
> >> +            __v4l2_ctrl_modify_range(imx219->exposure,
> >> +                                     imx219->exposure->minimum,
> >> +                                     exposure_max, imx219->exposure->step,
> >> +                                     exposure_def);
> >> +    }
> >> +
> >> +    /*
> >> +     * Applying V4L2 control value only happens
> >> +     * when power is up for streaming
> >> +     */
> >> +    if (pm_runtime_get_if_in_use(&client->dev) == 0)
> >> +            return 0;
> >> +
> >> +    switch (ctrl->id) {
> >> +    case V4L2_CID_ANALOGUE_GAIN:
> >> +            ret = imx219_write_reg(imx219, IMX219_REG_ANALOG_GAIN,
> >> +                                   IMX219_REG_VALUE_08BIT, ctrl->val);
> >> +            break;
> >> +    case V4L2_CID_EXPOSURE:
> >> +            ret = imx219_write_reg(imx219, IMX219_REG_EXPOSURE,
> >> +                                   IMX219_REG_VALUE_16BIT, ctrl->val);
> >> +            break;
> >> +    case V4L2_CID_DIGITAL_GAIN:
> >> +            ret = imx219_write_reg(imx219, IMX219_REG_DIGITAL_GAIN,
> >> +                                   IMX219_REG_VALUE_16BIT, ctrl->val);
> >> +            break;
> >> +    case V4L2_CID_TEST_PATTERN:
> >> +            ret = imx219_write_reg(imx219, IMX219_REG_TEST_PATTERN,
> >> +                                   IMX219_REG_VALUE_16BIT,
> >> +                                   imx219_test_pattern_val[ctrl->val]);
> >> +            break;
> >> +    case V4L2_CID_HFLIP:
> >> +    case V4L2_CID_VFLIP:
> >> +            ret = imx219_write_reg(imx219, IMX219_REG_ORIENTATION, 1,
> >> +                                   imx219->hflip->val |
> >> +                                   imx219->vflip->val << 1);
> >> +            break;
> >> +    case V4L2_CID_VBLANK:
> >> +            ret = imx219_write_reg(imx219, IMX219_REG_VTS,
> >> +                                   IMX219_REG_VALUE_16BIT,
> >> +                                   imx219->mode->height + ctrl->val);
> >> +            break;
> >> +    case V4L2_CID_TEST_PATTERN_RED:
> >> +            ret = imx219_write_reg(imx219, IMX219_REG_TESTP_RED,
> >> +                                   IMX219_REG_VALUE_16BIT, ctrl->val);
> >> +            break;
> >> +    case V4L2_CID_TEST_PATTERN_GREENR:
> >> +            ret = imx219_write_reg(imx219, IMX219_REG_TESTP_GREENR,
> >> +                                   IMX219_REG_VALUE_16BIT, ctrl->val);
> >> +            break;
> >> +    case V4L2_CID_TEST_PATTERN_BLUE:
> >> +            ret = imx219_write_reg(imx219, IMX219_REG_TESTP_BLUE,
> >> +                                   IMX219_REG_VALUE_16BIT, ctrl->val);
> >> +            break;
> >> +    case V4L2_CID_TEST_PATTERN_GREENB:
> >> +            ret = imx219_write_reg(imx219, IMX219_REG_TESTP_GREENB,
> >> +                                   IMX219_REG_VALUE_16BIT, ctrl->val);
> >> +            break;
> >> +    default:
> >> +            dev_info(&client->dev,
> >> +                     "ctrl(id:0x%x,val:0x%x) is not handled\n",
> >> +                     ctrl->id, ctrl->val);
> >> +            ret = -EINVAL;
> >> +            break;
> >> +    }
> >> +
> >> +    pm_runtime_put(&client->dev);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> +static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
> >> +    .s_ctrl = imx219_set_ctrl,
> >> +};
> >> +
> >> +static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
> >> +                             struct v4l2_subdev_pad_config *cfg,
> >> +                             struct v4l2_subdev_mbus_code_enum *code)
> >> +{
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +
> >> +    /* Only one bayer order(GRBG) is supported */
> >> +    if (code->index > 0)
> >> +            return -EINVAL;
> >> +
> >> +    code->code = imx219_get_format_code(imx219);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> >> +                              struct v4l2_subdev_pad_config *cfg,
> >> +                              struct v4l2_subdev_frame_size_enum *fse)
> >> +{
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +
> >> +    if (fse->index >= ARRAY_SIZE(supported_modes))
> >> +            return -EINVAL;
> >> +
> >> +    if (fse->code != imx219_get_format_code(imx219))
> >> +            return -EINVAL;
> >> +
> >> +    fse->min_width = supported_modes[fse->index].width;
> >> +    fse->max_width = fse->min_width;
> >> +    fse->min_height = supported_modes[fse->index].height;
> >> +    fse->max_height = fse->min_height;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
> >> +{
> >> +    fmt->colorspace = V4L2_COLORSPACE_SRGB;
> >> +    fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> >> +    fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> >> +                                                      fmt->colorspace,
> >> +                                                      fmt->ycbcr_enc);
> >> +    fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> >> +}
> >> +
> >> +static void imx219_update_pad_format(struct imx219 *imx219,
> >> +                                 const struct imx219_mode *mode,
> >> +                                 struct v4l2_subdev_format *fmt)
> >> +{
> >> +    fmt->format.width = mode->width;
> >> +    fmt->format.height = mode->height;
> >> +    fmt->format.code = imx219_get_format_code(imx219);
> >> +    fmt->format.field = V4L2_FIELD_NONE;
> >> +
> >> +    imx219_reset_colorspace(&fmt->format);
> >> +}
> >> +
> >> +static int __imx219_get_pad_format(struct imx219 *imx219,
> >> +                               struct v4l2_subdev_pad_config *cfg,
> >> +                               struct v4l2_subdev_format *fmt)
> >> +{
> >> +    if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> >> +            fmt->format = *v4l2_subdev_get_try_format(&imx219->sd, cfg,
> >> +                                                      fmt->pad);
> >> +    else
> >> +            imx219_update_pad_format(imx219, imx219->mode, fmt);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int imx219_get_pad_format(struct v4l2_subdev *sd,
> >> +                             struct v4l2_subdev_pad_config *cfg,
> >> +                             struct v4l2_subdev_format *fmt)
> >> +{
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +    int ret;
> >> +
> >> +    mutex_lock(&imx219->mutex);
> >> +    ret = __imx219_get_pad_format(imx219, cfg, fmt);
> >> +    mutex_unlock(&imx219->mutex);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> +static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >> +                             struct v4l2_subdev_pad_config *cfg,
> >> +                             struct v4l2_subdev_format *fmt)
> >> +{
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +    const struct imx219_mode *mode;
> >> +    struct v4l2_mbus_framefmt *framefmt;
> >> +    s64 exposure_max, exposure_def, hblank;
> >> +
> >> +    mutex_lock(&imx219->mutex);
> >> +
> >> +    /* Bayer order varies with flips */
> >> +    fmt->format.code = imx219_get_format_code(imx219);
> >> +
> >> +    mode = v4l2_find_nearest_size(supported_modes,
> >> +                                  ARRAY_SIZE(supported_modes),
> >> +                                  width, height,
> >> +                                  fmt->format.width, fmt->format.height);
> >> +    imx219_update_pad_format(imx219, mode, fmt);
> >> +    if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >> +            framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> >> +            *framefmt = fmt->format;
> >> +    } else if (imx219->mode != mode) {
> >> +            imx219->mode = mode;
> >> +            /* Update limits and set FPS to default */
> >> +            __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> >> +                                     IMX219_VTS_MAX - mode->height, 1,
> >> +                                     mode->vts_def - mode->height);
> >> +            __v4l2_ctrl_s_ctrl(imx219->vblank,
> >> +                               mode->vts_def - mode->height);
> >> +            /* Update max exposure while meeting expected vblanking */
> >> +            exposure_max = mode->vts_def - 4;
> >> +            exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> >> +                    exposure_max : IMX219_EXPOSURE_DEFAULT;
> >> +            __v4l2_ctrl_modify_range(imx219->exposure,
> >> +                                     imx219->exposure->minimum,
> >> +                                     exposure_max, imx219->exposure->step,
> >> +                                     exposure_def);
> >> +            /*
> >> +             * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
> >> +             * depends on mode->width only, and is not changeble in any
> >> +             * way other than changing the mode.
> >> +             */
> >> +            hblank = IMX219_PPL_DEFAULT - mode->width;
> >> +            __v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1,
> >> +                                     hblank);
> >> +    }
> >> +
> >> +    mutex_unlock(&imx219->mutex);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +/* Start streaming */
> >> +static int imx219_start_streaming(struct imx219 *imx219)
> >> +{
> >> +    struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >> +    const struct imx219_reg_list *reg_list;
> >> +    int ret;
> >> +
> >> +    /* Apply default values of current mode */
> >> +    reg_list = &imx219->mode->reg_list;
> >> +    ret = imx219_write_regs(imx219, reg_list->regs, reg_list->num_of_regs);
> >> +    if (ret) {
> >> +            dev_err(&client->dev, "%s failed to set mode\n", __func__);
> >> +            return ret;
> >> +    }
> >> +
> >> +    /* Apply customized values from user */
> >> +    ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    /* set stream on register */
> >> +    return imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> >> +                            IMX219_REG_VALUE_08BIT, IMX219_MODE_STREAMING);
> >> +}
> >> +
> >> +/* Stop streaming */
> >> +static int imx219_stop_streaming(struct imx219 *imx219)
> >> +{
> >> +    struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >> +    int ret;
> >> +
> >> +    /* set stream off register */
> >> +    ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> >> +                           IMX219_REG_VALUE_08BIT, IMX219_MODE_STANDBY);
> >> +    if (ret)
> >> +            dev_err(&client->dev, "%s failed to set stream\n", __func__);
> >> +
> >> +    /*
> >> +     * Return success even if it was an error, as there is nothing the
> >> +     * caller can do about it.
> >> +     */
> >
> > Just change this function return to void, instead?
>
> Maybe something like that (functionally the same, but probably more self-explaining):
>
> -----8<-----
> @@ -798,11 +796,7 @@ static int imx219_stop_streaming(struct imx219 *imx219)
>          if (ret)
>                  dev_err(&client->dev, "%s failed to set stream\n", __func__);
>
> -       /*
> -        * Return success even if it was an error, as there is nothing the
> -        * caller can do about it.
> -        */
> -       return 0;
> +       return ret;
>   }
>
>   static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
> @@ -832,7 +826,7 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>                  if (ret)
>                          goto err_rpm_put;
>          } else {
> -               imx219_stop_streaming(imx219);
> +               (void)imx219_stop_streaming(imx219);
>                  pm_runtime_put(&client->dev);
>          }
> -----8<-----
>
> ?
>
> >> +    return 0;
> >> +}
> >> +
> >> +static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
> >> +{
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +    struct i2c_client *client = v4l2_get_subdevdata(sd);
> >> +    int ret = 0;
> >> +
> >> +    mutex_lock(&imx219->mutex);
> >> +    if (imx219->streaming == enable) {
> >> +            mutex_unlock(&imx219->mutex);
> >> +            return 0;
> >> +    }
> >> +
> >> +    if (enable) {
> >> +            ret = pm_runtime_get_sync(&client->dev);
> >> +            if (ret < 0) {
> >> +                    pm_runtime_put_noidle(&client->dev);
> >> +                    goto err_unlock;
> >> +            }
> >> +
> >> +            /*
> >> +             * Apply default & customized values
> >> +             * and then start streaming.
> >> +             */
> >> +            ret = imx219_start_streaming(imx219);
> >> +            if (ret)
> >> +                    goto err_rpm_put;
> >> +    } else {
> >> +            imx219_stop_streaming(imx219);
> >> +            pm_runtime_put(&client->dev);
> >> +    }
> >> +
> >> +    imx219->streaming = enable;
> >> +
> >> +    /* vflip and hflip cannot change during streaming */
> >> +    __v4l2_ctrl_grab(imx219->vflip, enable);
> >> +    __v4l2_ctrl_grab(imx219->hflip, enable);
> >> +
> >> +    mutex_unlock(&imx219->mutex);
> >> +
> >> +    return ret;
> >> +
> >> +err_rpm_put:
> >> +    pm_runtime_put(&client->dev);
> >> +err_unlock:
> >> +    mutex_unlock(&imx219->mutex);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> +/* Power/clock management functions */
> >> +static int imx219_power_on(struct device *dev)
> >> +{
> >> +    struct i2c_client *client = to_i2c_client(dev);
> >> +    struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +    int ret;
> >> +
> >> +    ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
> >> +                                imx219->supplies);
> >> +    if (ret) {
> >> +            dev_err(&client->dev, "%s: failed to enable regulators\n",
> >> +                    __func__);
> >> +            return ret;
> >> +    }
> >> +
> >> +    ret = clk_prepare_enable(imx219->xclk);
> >> +    if (ret) {
> >> +            dev_err(&client->dev, "%s: failed to enable clock\n",
> >> +                    __func__);
> >> +            goto reg_off;
> >> +    }
> >> +
> >> +    gpiod_set_value_cansleep(imx219->xclr_gpio, 1);
> >> +    msleep(IMX219_XCLR_DELAY_MS);
> >> +
> >> +    return 0;
> >> +reg_off:
> >> +    regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> >> +    return ret;
> >> +}
> >> +
> >> +static int imx219_power_off(struct device *dev)
> >> +{
> >> +    struct i2c_client *client = to_i2c_client(dev);
> >> +    struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +
> >> +    gpiod_set_value_cansleep(imx219->xclr_gpio, 0);
> >> +    regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> >> +    clk_disable_unprepare(imx219->xclk);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int __maybe_unused imx219_suspend(struct device *dev)
> >> +{
> >> +    struct i2c_client *client = to_i2c_client(dev);
> >> +    struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +
> >> +    if (imx219->streaming)
> >> +            imx219_stop_streaming(imx219);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int __maybe_unused imx219_resume(struct device *dev)
> >> +{
> >> +    struct i2c_client *client = to_i2c_client(dev);
> >> +    struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +    int ret;
> >> +
> >> +    if (imx219->streaming) {
> >> +            ret = imx219_start_streaming(imx219);
> >> +            if (ret)
> >> +                    goto error;
> >> +    }
> >> +
> >> +    return 0;
> >> +
> >> +error:
> >> +    imx219_stop_streaming(imx219);
> >> +    imx219->streaming = 0;
> >> +    return ret;
> >> +}
> >> +
> >> +static int imx219_get_regulators(struct imx219 *imx219)
> >> +{
> >> +    struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >> +    int i;
> >> +
> >> +    for (i = 0; i < IMX219_NUM_SUPPLIES; i++)
> >> +            imx219->supplies[i].supply = imx219_supply_name[i];
> >> +
> >> +    return devm_regulator_bulk_get(&client->dev,
> >> +                                   IMX219_NUM_SUPPLIES,
> >> +                                   imx219->supplies);
> >> +}
> >> +
> >> +/* Verify chip ID */
> >> +static int imx219_identify_module(struct imx219 *imx219)
> >> +{
> >> +    struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >> +    int ret;
> >> +    u32 val;
> >> +
> >> +    ret = imx219_power_on(imx219->dev);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    ret = imx219_read_reg(imx219, IMX219_REG_CHIP_ID,
> >> +                          IMX219_REG_VALUE_16BIT, &val);
> >> +    if (ret) {
> >> +            dev_err(&client->dev, "failed to read chip id %x\n",
> >> +                    IMX219_CHIP_ID);
> >> +            goto power_off;
> >> +    }
> >> +
> >> +    if (val != IMX219_CHIP_ID) {
> >> +            dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
> >> +                    IMX219_CHIP_ID, val);
> >> +            ret = -EIO;
> >> +    }
> >> +
> >
> > I wonder if this is not a bit obscure: it's not obvious
> > from a first read that the device is left powered on successful
> > identification.
> >
> > Perhaps you can have:
> >
> >      return 0;
> >
> > And then goto err_power_off on the error paths.
> > This way, it's clear that powering off is only
> > to be done on error.
>
> OK. Makes sense. Will fix in v2.
>
> > OTOH, why do we need to leave the device powered on probe?
>
> Let me try what happens if I leave powering the sensor on and off
> to dev_pm_ops. (Seems like it *should* work in theory, but maybe
> there were some hidden problems.)
> (Also I would only be able to check if the sensor works or not - can't
> do the electrical signals or power consumption measurements etc.)
>
> Anyway, leaving the sensor powered on shouldn't hurt, as the sensor
> is kept in lower power mode when it is not streaming (MIPI signals
> are passive - the indication on that is the "clock-noncontinuous"
> property in the DT bindings; also there is no code in the driver
> to change that, then the imx219 sensor must always "turn off"
> MIPI lines when it is not streaming - with the reg setting currently
> used at least).
>
> >> +power_off:
> >
> > (and with the above, s/power_off/err_power_off)
>
> Yes, OK.

This is lifted pretty much verbatim from the imx214 driver, although
there the imx214_power_on call is in the main probe function as it
doesn't bother checking a CHIP_ID register.
There's no need for the sensor to be left powered, but I thought the
pm_runtime_idle() within probe will power it down in the success case.
If things work with a pm_runtime_get() before identify, and a
pm_runtime_put() after, then I'm more than happy with that. PM is not
subsystem I've done a lot of work with, so I'm still fumbling about
slightly.

There is the comment in the imx214 driver [1]
"Enable power initially, to avoid warnings from clk_disable on power_off"
so there does appear to be some magic sequencing that was required
there, and therefore probably applies here too. (Either that or both
are wrong).

[1] https://elixir.bootlin.com/linux/v5.4.5/source/drivers/media/i2c/imx214.c#L996

> >> +    if (ret)
> >> +            imx219_power_off(imx219->dev);
> >> +    return ret;
> >> +}
> >> +
> >> +static const struct v4l2_subdev_core_ops imx219_core_ops = {
> >> +    .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> >> +    .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> >> +};
> >> +
> >> +static const struct v4l2_subdev_video_ops imx219_video_ops = {
> >> +    .s_stream = imx219_set_stream,
> >> +};
> >> +
> >> +static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> >> +    .enum_mbus_code = imx219_enum_mbus_code,
> >> +    .get_fmt = imx219_get_pad_format,
> >> +    .set_fmt = imx219_set_pad_format,
> >> +    .enum_frame_size = imx219_enum_frame_size,
> >> +};
> >> +
> >> +static const struct v4l2_subdev_ops imx219_subdev_ops = {
> >> +    .core = &imx219_core_ops,
> >> +    .video = &imx219_video_ops,
> >> +    .pad = &imx219_pad_ops,
> >> +};
> >> +
> >> +static const struct v4l2_subdev_internal_ops imx219_internal_ops = {
> >> +    .open = imx219_open,
> >> +};
> >> +
> >> +/* Initialize control handlers */
> >> +static int imx219_init_controls(struct imx219 *imx219)
> >> +{
> >> +    struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >> +    struct v4l2_ctrl_handler *ctrl_hdlr;
> >> +    u32 height = imx219->mode->height;
> >> +    s64 hblank, exposure_max, exposure_def;
> >> +    int i, ret;
> >> +
> >> +    ctrl_hdlr = &imx219->ctrl_handler;
> >> +    ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    mutex_init(&imx219->mutex);
> >> +    ctrl_hdlr->lock = &imx219->mutex;
> >> +
> >> +    /* By default, PIXEL_RATE is read only */
> >> +    imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> >> +                                           V4L2_CID_PIXEL_RATE,
> >> +                                           IMX219_PIXEL_RATE,
> >> +                                           IMX219_PIXEL_RATE, 1,
> >> +                                           IMX219_PIXEL_RATE);
> >> +
> >> +    /* Initial vblank/hblank/exposure parameters based on current mode */
> >> +    imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> >> +                                       V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
> >> +                                       IMX219_VTS_MAX - height, 1,
> >> +                                       imx219->mode->vts_def - height);
> >> +    hblank = IMX219_PPL_DEFAULT - imx219->mode->width;
> >> +    imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> >> +                                       V4L2_CID_HBLANK, hblank, hblank,
> >> +                                       1, hblank);
> >> +    if (imx219->hblank)
> >> +            imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> > Certainly not part of this patch, but I wonder if we shouldn't
> > have something like v4l2_ctrl_new_std_with_flags.
> >
> >> +    exposure_max = imx219->mode->vts_def - 4;
> >> +    exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> >> +            exposure_max : IMX219_EXPOSURE_DEFAULT;
> >> +    imx219->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> >> +                                         V4L2_CID_EXPOSURE,
> >> +                                         IMX219_EXPOSURE_MIN, exposure_max,
> >> +                                         IMX219_EXPOSURE_STEP,
> >> +                                         exposure_def);
> >> +
> >> +    v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> >> +                      IMX219_ANA_GAIN_MIN, IMX219_ANA_GAIN_MAX,
> >> +                      IMX219_ANA_GAIN_STEP, IMX219_ANA_GAIN_DEFAULT);
> >> +
> >> +    v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> >> +                      IMX219_DGTL_GAIN_MIN, IMX219_DGTL_GAIN_MAX,
> >> +                      IMX219_DGTL_GAIN_STEP, IMX219_DGTL_GAIN_DEFAULT);
> >> +
> >> +    imx219->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> >> +                                      V4L2_CID_HFLIP, 0, 1, 1, 0);
> >> +    if (imx219->hflip)
> >> +            imx219->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> >> +
> >> +    imx219->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> >> +                                      V4L2_CID_VFLIP, 0, 1, 1, 0);
> >> +    if (imx219->vflip)
> >> +            imx219->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> >> +
> >> +    v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx219_ctrl_ops,
> >> +                                 V4L2_CID_TEST_PATTERN,
> >> +                                 ARRAY_SIZE(imx219_test_pattern_menu) - 1,
> >> +                                 0, 0, imx219_test_pattern_menu);
> >> +    for (i = 0; i < 4; i++) {
> >> +            /*
> >> +             * The assumption is that
> >> +             * V4L2_CID_TEST_PATTERN_GREENR == V4L2_CID_TEST_PATTERN_RED + 1
> >> +             * V4L2_CID_TEST_PATTERN_BLUE   == V4L2_CID_TEST_PATTERN_RED + 2
> >> +             * V4L2_CID_TEST_PATTERN_GREENB == V4L2_CID_TEST_PATTERN_RED + 3
> >> +             */
> >> +            v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> >> +                              V4L2_CID_TEST_PATTERN_RED + i,
> >> +                              IMX219_TESTP_COLOUR_MIN,
> >> +                              IMX219_TESTP_COLOUR_MAX,
> >> +                              IMX219_TESTP_COLOUR_STEP,
> >> +                              IMX219_TESTP_COLOUR_MAX);
> >> +            /* The "Solid color" pattern is white by default */
> >> +    }
> >> +
> >> +    if (ctrl_hdlr->error) {
> >> +            ret = ctrl_hdlr->error;
> >> +            dev_err(&client->dev, "%s control init failed (%d)\n",
> >> +                    __func__, ret);
> >> +            goto error;
> >> +    }
> >> +
> >> +    imx219->sd.ctrl_handler = ctrl_hdlr;
> >> +
> >> +    return 0;
> >> +
> >> +error:
> >> +    v4l2_ctrl_handler_free(ctrl_hdlr);
> >> +    mutex_destroy(&imx219->mutex);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> +static void imx219_free_controls(struct imx219 *imx219)
> >> +{
> >> +    v4l2_ctrl_handler_free(imx219->sd.ctrl_handler);
> >> +    mutex_destroy(&imx219->mutex);
> >> +}
> >> +
> >> +static int imx219_probe(struct i2c_client *client,
> >> +                    const struct i2c_device_id *id)
> >> +{
> >> +    struct device *dev = &client->dev;
> >> +    struct fwnode_handle *endpoint;
> >> +    struct imx219 *imx219;
> >> +    int ret;
> >> +
> >> +    imx219 = devm_kzalloc(&client->dev, sizeof(*imx219), GFP_KERNEL);
> >> +    if (!imx219)
> >> +            return -ENOMEM;
> >> +
> >> +    imx219->dev = dev;
> >> +
> >> +    /* Initialize subdev */
> >> +    v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
> >> +
> >> +    /* Get CSI2 bus config */
> >> +    endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> >> +                                              NULL);
> >> +    if (!endpoint) {
> >> +            dev_err(dev, "endpoint node not found\n");
> >> +            return -EINVAL;
> >> +    }
> >> +
> >> +    ret = v4l2_fwnode_endpoint_parse(endpoint, &imx219->ep);
> >> +    fwnode_handle_put(endpoint);
> >> +    if (ret) {
> >> +            dev_err(dev, "Could not parse endpoint\n");
> >> +            return ret;
> >> +    }
> >> +
> >> +    /* Get system clock (xclk) */
> >> +    imx219->xclk = devm_clk_get(dev, "xclk");
> >> +    if (IS_ERR(imx219->xclk)) {
> >> +            dev_err(dev, "failed to get xclk\n");
> >> +            return PTR_ERR(imx219->xclk);
> >> +    }
> >> +
> >> +    imx219->xclk_freq = clk_get_rate(imx219->xclk);
> >> +    if (imx219->xclk_freq != 24000000) {
> >
> > Use a macro for the value?
>
> Will fix in v2 of the patch.
>
> >> +            dev_err(dev, "xclk frequency not supported: %d Hz\n",
> >> +                    imx219->xclk_freq);
> >> +            return -EINVAL;
> >> +    }
> >> +
> >> +    ret = imx219_get_regulators(imx219);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    /* request optional power down pin */
> >> +    imx219->xclr_gpio = devm_gpiod_get_optional(dev, "xclr",
> >
> > This could be named powerdown instead of xclr, and it'd
> > be self-explanatory.
>
> "xclr" is most probably the sensor pin name. Then I would better keep it
> as is - not to confuse those who can read the datasheet.

Correct. The datasheet describes that pin as XCLR, therefore I believe
the normal expectation is to retain that name through DT and the
driver.
Rereading the datasheet it's an active high line, so the comment
really ought to refer to an enable or power up pin, not power down.

FYI Our particular configuration uses a single GPIO to power up the
regulators, clock, and XCLR in sequence. The final iteration of our DT
has a GPIO driven from a fixed regulator and xclr_gpio not defined,
but earlier versions used this (not optional) GPIO.

> >> +                                                GPIOD_OUT_HIGH);
> >> +
> >> +    /* Check module identity */
> >> +    ret = imx219_identify_module(imx219);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >
> > As I mentioned above, why do we leave the device powered?
> > If that is really needed, I'd put a comment about it here.
>
> Right. Answered above (will check if it works OK w/o leaving
> the sensor powered).

I don't recall the detail, but I have a vague recall of something else
proding the sensor.
I'm more than happy if there's a cleaner solution, or this is just unnecessary.


> >> +    /* Set default mode to max resolution */
> >> +    imx219->mode = &supported_modes[0];
> >> +
> >> +    ret = imx219_init_controls(imx219);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    /* Initialize subdev */
> >> +    imx219->sd.internal_ops = &imx219_internal_ops;
> >> +    imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >> +    imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> >> +
> >> +    /* Initialize source pad */
> >> +    imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
> >> +
> >> +    ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> >> +    if (ret)
> >> +            goto error_handler_free;
> >> +
> >> +    ret = v4l2_async_register_subdev_sensor_common(&imx219->sd);
> >> +    if (ret < 0)
> >> +            goto error_media_entity;
> >> +
> >> +    pm_runtime_set_active(dev);
> >> +    pm_runtime_enable(dev);
> >> +    pm_runtime_idle(dev);
> >> +
> >> +    return 0;
> >> +
> >> +error_media_entity:
> >> +    media_entity_cleanup(&imx219->sd.entity);
> >> +
> >> +error_handler_free:
> >> +    imx219_free_controls(imx219);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> +static int imx219_remove(struct i2c_client *client)
> >> +{
> >> +    struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +
> >> +    v4l2_async_unregister_subdev(sd);
> >> +    media_entity_cleanup(&sd->entity);
> >> +    imx219_free_controls(imx219);
> >> +
> >> +    pm_runtime_disable(&client->dev);
> >> +    pm_runtime_set_suspended(&client->dev);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static const struct of_device_id imx219_dt_ids[] = {
> >> +    { .compatible = "sony,imx219" },
> >> +    { /* sentinel */ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, imx219_dt_ids);
> >> +
> >> +static const struct dev_pm_ops imx219_pm_ops = {
> >> +    SET_SYSTEM_SLEEP_PM_OPS(imx219_suspend, imx219_resume)
> >> +    SET_RUNTIME_PM_OPS(imx219_power_off, imx219_power_on, NULL)
> >> +};
> >> +
> >> +static struct i2c_driver imx219_i2c_driver = {
> >> +    .driver = {
> >> +            .name = "imx219",
> >> +            .of_match_table = imx219_dt_ids,
> >> +            .pm = &imx219_pm_ops,
> >> +    },
> >> +    .probe = imx219_probe,
> >> +    .remove = imx219_remove,
> >> +};
> >> +
> >> +module_i2c_driver(imx219_i2c_driver);
> >> +
> >> +MODULE_AUTHOR("Dave Stevenson <dave.stevenson@raspberrypi.com");
> >> +MODULE_DESCRIPTION("Sony IMX219 sensor driver");
> >> +MODULE_LICENSE("GPL v2");
> >
> > Thanks,
> > Ezequiel
>
> Thanks,
> Andrey

Cheers.
 Dave
