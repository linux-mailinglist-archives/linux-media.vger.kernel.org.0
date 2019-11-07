Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77C81F2AD3
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 10:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbfKGJhX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 04:37:23 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45241 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfKGJhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 04:37:23 -0500
Received: by mail-ed1-f66.google.com with SMTP id b5so1309830eds.12
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 01:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c5bYIPVtXld0wr5eH+6XLdO4kYgyG1B25XIM9B4AIOE=;
        b=ihJVFoOGmFTkQ5MHRXIbN5zm2DVQRDhzOBZ+W44tplt8z+gJAFSfdBa/TjTBhN0+a/
         iFiegnWcv5QbSkvi9fvJMWQpi/UsXmE4AUAhdQEsUKABEq7HpEeL8VNnsPavgJwvrnuJ
         lQj8471ShuBOqV2e459IoOFoToXWwwYxnZEpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c5bYIPVtXld0wr5eH+6XLdO4kYgyG1B25XIM9B4AIOE=;
        b=fUZitC5uVR007GzDTNo+JkFIZ4OPsHLtvHY6clc92U1pVUr9pKq1N+mhpv5IL5VZeC
         oxWTBIhpmBYvz9476tMpV9JZ6Iaxn78oxBc6hnNcwiB5uiy+Hx7MnSQiWYn6+1/++aOr
         9+N3/RmpSbR7GMLFnOxrx7rNH28Uj1EeZF/vbboDFAFlSG9krX+GLYxc6b7fk2hAZq6U
         jTPrxqxsrW/OGhUYsEuV350XbekPaqVeQTQ+qxgxvlDQAMJULJyoc8BhBiKzH7R5v3L2
         jbtkGHtQjGShTlL0qqojKyUyZRv4/PEsosEKsLaQ+qRr9GBhmEzEDywedGTd2rgt+6jE
         HQ5A==
X-Gm-Message-State: APjAAAWTNM26hug7PPTan+SAdlBFqqDDgNR5O7F5FSbL4/CorN+mgBxZ
        sZ/VjvrEnKPZ18M0A5ew6XaLF+W2glk8MA==
X-Google-Smtp-Source: APXvYqwgOo0E7/F4LS3HQF0+/m1PATrKE3JXXLpSmQYJh+cer2jN66zhyhypa8EVyDG1hmjAOtOqMA==
X-Received: by 2002:a17:906:a38d:: with SMTP id k13mr2016183ejz.213.1573119437945;
        Thu, 07 Nov 2019 01:37:17 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id b21sm41101edv.59.2019.11.07.01.37.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2019 01:37:16 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id t1so2209269wrv.4
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 01:37:16 -0800 (PST)
X-Received: by 2002:a5d:4946:: with SMTP id r6mr1244314wrs.155.1573119435341;
 Thu, 07 Nov 2019 01:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20191104105713.24311-1-dongchun.zhu@mediatek.com>
 <20191104105713.24311-3-dongchun.zhu@mediatek.com> <20191105211229.GB15049@kekkonen.localdomain>
 <CAAFQd5C-QeLjNRxfoVmm8fu1_EzEXM4d+ut4b4O+TcyO-d+pAQ@mail.gmail.com> <20191107092940.GA18424@paasikivi.fi.intel.com>
In-Reply-To: <20191107092940.GA18424@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 7 Nov 2019 18:37:01 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CrGYFm0NA0PahxQcgrZO0fS_eLuPXWq6Bno+F99bRXxw@mail.gmail.com>
Message-ID: <CAAFQd5CrGYFm0NA0PahxQcgrZO0fS_eLuPXWq6Bno+F99bRXxw@mail.gmail.com>
Subject: Re: [V5, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        andriy.shevchenko@linux.intel.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>, shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 7, 2019 at 6:29 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz,
>
> On Thu, Nov 07, 2019 at 04:58:09PM +0900, Tomasz Figa wrote:
> > On Wed, Nov 6, 2019 at 6:16 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dongchun,
> > >
> > > On Mon, Nov 04, 2019 at 06:57:13PM +0800, Dongchun Zhu wrote:
> > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > > The OV02A10 is a 1/5" CMOS sensor from Omnivision, supporting
> > > > output format: 10-bit RAW.
> > > >
> > > > This chip has a single MIPI lane interface and use the I2C bus
> > > > for control and the CSI-2 bus for data.
> > > >
> > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > ---
> > > >  MAINTAINERS                 |    1 +
> > > >  drivers/media/i2c/Kconfig   |   12 +
> > > >  drivers/media/i2c/Makefile  |    1 +
> > > >  drivers/media/i2c/ov02a10.c | 1113 +++++++++++++++++++++++++++++++++++++++++++
> > > >  4 files changed, 1127 insertions(+)
> > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index ca503fc..0ce4af9 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -11954,6 +11954,7 @@ M:    Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > >  L:   linux-media@vger.kernel.org
> > > >  T:   git git://linuxtv.org/media_tree.git
> > > >  S:   Maintained
> > > > +F:   drivers/media/i2c/ov02a10.c
> > > >  F:   Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > > >
> > > >  OMNIVISION OV2680 SENSOR DRIVER
> > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > index 7eee181..3be8c0e 100644
> > > > --- a/drivers/media/i2c/Kconfig
> > > > +++ b/drivers/media/i2c/Kconfig
> > > > @@ -620,6 +620,18 @@ config VIDEO_IMX355
> > > >         To compile this driver as a module, choose M here: the
> > > >         module will be called imx355.
> > > >
> > > > +config VIDEO_OV02A10
> > > > +     tristate "OmniVision OV02A10 sensor support"
> > > > +     depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > > > +     depends on MEDIA_CAMERA_SUPPORT
> > > > +     select V4L2_FWNODE
> > > > +     help
> > > > +       This is a Video4Linux2 sensor driver for the OmniVision
> > > > +       OV02A10 camera sensor.
> > > > +
> > > > +       To compile this driver as a module, choose M here: the
> > > > +       module will be called ov02a10.
> > > > +
> > > >  config VIDEO_OV2640
> > > >       tristate "OmniVision OV2640 sensor support"
> > > >       depends on VIDEO_V4L2 && I2C
> > > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > > index beb170b..c0774d4 100644
> > > > --- a/drivers/media/i2c/Makefile
> > > > +++ b/drivers/media/i2c/Makefile
> > > > @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
> > > >  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
> > > >  obj-$(CONFIG_VIDEO_UPD64031A) += upd64031a.o
> > > >  obj-$(CONFIG_VIDEO_UPD64083) += upd64083.o
> > > > +obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
> > > >  obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
> > > >  obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
> > > >  obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
> > > > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > > > new file mode 100644
> > > > index 0000000..f1ed4eb
> > > > --- /dev/null
> > > > +++ b/drivers/media/i2c/ov02a10.c
> > > > @@ -0,0 +1,1113 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +// Copyright (c) 2019 MediaTek Inc.
> > > > +
> > > > +#include <linux/clk.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/device.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/pm_runtime.h>
> > > > +#include <linux/regulator/consumer.h>
> > > > +#include <media/media-entity.h>
> > > > +#include <media/v4l2-async.h>
> > > > +#include <media/v4l2-ctrls.h>
> > > > +#include <media/v4l2-subdev.h>
> > > > +#include <media/v4l2-fwnode.h>
> > > > +
> > > > +#define CHIP_ID                                              0x2509
> > > > +#define OV02A10_REG_CHIP_ID_H                                0x02
> > > > +#define OV02A10_REG_CHIP_ID_L                                0x03
> > > > +#define OV02A10_ID(_msb, _lsb)                               ((_msb) << 8 | (_lsb))
> > > > +
> > > > +/* Bit[1] vertical upside down */
> > > > +/* Bit[0] horizontal mirror */
> > > > +#define REG_MIRROR_FLIP_CONTROL                              0x3f
> > > > +
> > > > +/* Orientation */
> > > > +#define REG_MIRROR_FLIP_ENABLE                               0x03
> > > > +
> > > > +/* Bit[7] clock HS mode enable
> > > > + * 0: Clock continue
> > > > + * 1: Clock HS
> > > > + * Bit[6:2] HS VOD adjust
> > > > + * Bit[1:0] P VHI adjust
> > > > + */
> > > > +#define REG_HS_MODE_BLC                                      0x9d
> > > > +
> > > > +#define CLOCK_HS_MODE_ENABLE                         BIT(7)
> > > > +#define CLOCK_HS_VOD_ADJUST  (BIT(6) | BIT(5) | BIT(4) | BIT(3) | BIT(2))
> > > > +
> > > > +/* Bit[2:0] MIPI transmission speed select */
> > > > +#define TX_SPEED_AREA_SEL                            0xa1
> > > > +
> > > > +#define REG_PAGE_SWITCH                                      0xfd
> > > > +#define REG_GLOBAL_EFFECTIVE                         0x01
> > > > +#define REG_ENABLE                                   BIT(0)
> > > > +#define OV02A10_MASK_8_BITS                          0xff
> > > > +
> > > > +#define REG_SC_CTRL_MODE                             0xac
> > > > +#define SC_CTRL_MODE_STANDBY                         0x00
> > > > +#define SC_CTRL_MODE_STREAMING                               0x01
> > > > +
> > > > +#define OV02A10_EXP_SHIFT                            8
> > > > +#define OV02A10_REG_EXPOSURE_H                               0x03
> > > > +#define OV02A10_REG_EXPOSURE_L                               0x04
> > > > +#define      OV02A10_EXPOSURE_MIN                            4
> > > > +#define OV02A10_EXPOSURE_MAX_MARGIN                  4
> > > > +#define      OV02A10_EXPOSURE_STEP                           1
> > > > +
> > > > +#define OV02A10_VTS_SHIFT                            8
> > > > +#define OV02A10_REG_VTS_H                            0x05
> > > > +#define OV02A10_REG_VTS_L                            0x06
> > > > +#define OV02A10_VTS_MAX                                      0x209f
> > > > +#define OV02A10_VTS_MIN                                      0x04cf
> > > > +#define OV02A10_BASIC_LINE                           1224
> > > > +
> > > > +#define OV02A10_REG_GAIN                             0x24
> > > > +#define OV02A10_GAIN_MIN                             0x10
> > > > +#define OV02A10_GAIN_MAX                             0xf8
> > > > +#define OV02A10_GAIN_STEP                            0x01
> > > > +#define OV02A10_GAIN_DEFAULT                         0x40
> > > > +
> > > > +/* Test pattern control */
> > > > +#define OV02A10_REG_TEST_PATTERN                     0xb6
> > > > +#define OV02A10_TEST_PATTERN_ENABLE                  BIT(0)
> > > > +
> > > > +#define OV02A10_LINK_FREQ_390MHZ                     390000000ULL
> > > > +#define OV02A10_ECLK_FREQ                            24000000
> > > > +#define OV02A10_DATA_LANES                           1
> > > > +#define OV02A10_BITS_PER_SAMPLE                              10
> > > > +
> > > > +static const char * const ov02a10_supply_names[] = {
> > > > +     "dovdd",        /* Digital I/O power */
> > > > +     "avdd",         /* Analog power */
> > > > +     "dvdd",         /* Digital core power */
> > > > +};
> > > > +
> > > > +#define OV02A10_NUM_SUPPLIES ARRAY_SIZE(ov02a10_supply_names)
> > > > +
> > > > +struct ov02a10_reg {
> > > > +     u8 addr;
> > > > +     u8 val;
> > > > +};
> > > > +
> > > > +struct ov02a10_reg_list {
> > > > +     u32 num_of_regs;
> > > > +     const struct ov02a10_reg *regs;
> > > > +};
> > > > +
> > > > +struct ov02a10_mode {
> > > > +     u32 width;
> > > > +     u32 height;
> > > > +     u32 exp_def;
> > > > +     u32 hts_def;
> > > > +     u32 vts_def;
> > > > +     const struct ov02a10_reg_list reg_list;
> > > > +};
> > > > +
> > > > +struct ov02a10 {
> > > > +     u32                     eclk_freq;
> > > > +     u32                     mipi_clock_tx_speed;
> > > > +     u32                     mipi_clock_hs_vod_adjust_cnt;
> > > > +
> > > > +     struct clk              *eclk;
> > > > +     struct gpio_desc        *pd_gpio;
> > > > +     struct gpio_desc        *n_rst_gpio;
> > > > +     struct regulator_bulk_data supplies[OV02A10_NUM_SUPPLIES];
> > > > +
> > > > +     bool                    streaming;
> > > > +     bool                    upside_down;
> > > > +     bool                    mipi_clock_hs_mode_enable;
> > > > +
> > > > +     /*
> > > > +      * Serialize control access, get/set format, get selection
> > > > +      * and start streaming.
> > > > +      */
> > > > +     struct mutex            mutex;
> > > > +     struct v4l2_subdev      subdev;
> > > > +     struct media_pad        pad;
> > > > +     struct v4l2_ctrl        *anal_gain;
> > > > +     struct v4l2_ctrl        *exposure;
> > > > +     struct v4l2_ctrl        *hblank;
> > > > +     struct v4l2_ctrl        *vblank;
> > > > +     struct v4l2_ctrl        *test_pattern;
> > > > +     struct v4l2_mbus_framefmt       fmt;
> > > > +     struct v4l2_ctrl_handler ctrl_handler;
> > > > +
> > > > +     const struct ov02a10_mode *cur_mode;
> > > > +};
> > > > +
> > > > +static inline struct ov02a10 *to_ov02a10(struct v4l2_subdev *sd)
> > > > +{
> > > > +     return container_of(sd, struct ov02a10, subdev);
> > > > +}
> > > > +
> > > > +/*
> > > > + * eclk 24Mhz
> > > > + * pclk 39Mhz
> > > > + * linelength 934(0x3a6)
> > > > + * framelength 1390(0x56E)
> > > > + * grabwindow_width 1600
> > > > + * grabwindow_height 1200
> > > > + * max_framerate 30fps
> > > > + * mipi_datarate per lane 780Mbps
> > > > + */
> > > > +static const struct ov02a10_reg ov02a10_1600x1200_regs[] = {
> > > > +     {0xfd, 0x01},
> > > > +     {0xac, 0x00},
> > > > +     {0xfd, 0x00},
> > > > +     {0x2f, 0x29},
> > > > +     {0x34, 0x00},
> > > > +     {0x35, 0x21},
> > > > +     {0x30, 0x15},
> > > > +     {0x33, 0x01},
> > > > +     {0xfd, 0x01},
> > > > +     {0x44, 0x00},
> > > > +     {0x2a, 0x4c},
> > > > +     {0x2b, 0x1e},
> > > > +     {0x2c, 0x60},
> > > > +     {0x25, 0x11},
> > > > +     {0x03, 0x01},
> > > > +     {0x04, 0xae},
> > > > +     {0x09, 0x00},
> > > > +     {0x0a, 0x02},
> > > > +     {0x06, 0xa6},
> > > > +     {0x31, 0x00},
> > > > +     {0x24, 0x40},
> > > > +     {0x01, 0x01},
> > > > +     {0xfb, 0x73},
> > > > +     {0xfd, 0x01},
> > > > +     {0x16, 0x04},
> > > > +     {0x1c, 0x09},
> > > > +     {0x21, 0x42},
> > > > +     {0x12, 0x04},
> > > > +     {0x13, 0x10},
> > > > +     {0x11, 0x40},
> > > > +     {0x33, 0x81},
> > > > +     {0xd0, 0x00},
> > > > +     {0xd1, 0x01},
> > > > +     {0xd2, 0x00},
> > > > +     {0x50, 0x10},
> > > > +     {0x51, 0x23},
> > > > +     {0x52, 0x20},
> > > > +     {0x53, 0x10},
> > > > +     {0x54, 0x02},
> > > > +     {0x55, 0x20},
> > > > +     {0x56, 0x02},
> > > > +     {0x58, 0x48},
> > > > +     {0x5d, 0x15},
> > > > +     {0x5e, 0x05},
> > > > +     {0x66, 0x66},
> > > > +     {0x68, 0x68},
> > > > +     {0x6b, 0x00},
> > > > +     {0x6c, 0x00},
> > > > +     {0x6f, 0x40},
> > > > +     {0x70, 0x40},
> > > > +     {0x71, 0x0a},
> > > > +     {0x72, 0xf0},
> > > > +     {0x73, 0x10},
> > > > +     {0x75, 0x80},
> > > > +     {0x76, 0x10},
> > > > +     {0x84, 0x00},
> > > > +     {0x85, 0x10},
> > > > +     {0x86, 0x10},
> > > > +     {0x87, 0x00},
> > > > +     {0x8a, 0x22},
> > > > +     {0x8b, 0x22},
> > > > +     {0x19, 0xf1},
> > > > +     {0x29, 0x01},
> > > > +     {0xfd, 0x01},
> > > > +     {0x9d, 0xd6},
> > > > +     {0xa0, 0x29},
> > > > +     {0xa1, 0x03},
> > > > +     {0xad, 0x62},
> > > > +     {0xae, 0x00},
> > > > +     {0xaf, 0x85},
> > > > +     {0xb1, 0x01},
> > > > +     {0x8e, 0x06},
> > > > +     {0x8f, 0x40},
> > > > +     {0x90, 0x04},
> > > > +     {0x91, 0xb0},
> > > > +     {0x45, 0x01},
> > > > +     {0x46, 0x00},
> > > > +     {0x47, 0x6c},
> > > > +     {0x48, 0x03},
> > > > +     {0x49, 0x8b},
> > > > +     {0x4a, 0x00},
> > > > +     {0x4b, 0x07},
> > > > +     {0x4c, 0x04},
> > > > +     {0x4d, 0xb7},
> > > > +     {0xf0, 0x40},
> > > > +     {0xf1, 0x40},
> > > > +     {0xf2, 0x40},
> > > > +     {0xf3, 0x40},
> > > > +     {0x3f, 0x00},
> > > > +     {0xfd, 0x01},
> > > > +     {0x05, 0x00},
> > > > +     {0x06, 0xa6},
> > > > +     {0xfd, 0x01},
> > > > +};
> > > > +
> > > > +static const char * const ov02a10_test_pattern_menu[] = {
> > > > +     "Disabled",
> > > > +     "Color Bar",
> > > > +};
> > > > +
> > > > +static const s64 link_freq_menu_items[] = {
> > > > +     OV02A10_LINK_FREQ_390MHZ
> > > > +};
> > > > +
> > > > +static u64 to_pixel_rate(u32 f_index)
> > > > +{
> > > > +     u64 pixel_rate = link_freq_menu_items[f_index] * 2 * OV02A10_DATA_LANES;
> > > > +
> > > > +     do_div(pixel_rate, OV02A10_BITS_PER_SAMPLE);
> > > > +
> > > > +     return pixel_rate;
> > > > +}
> > > > +
> > > > +static const struct ov02a10_mode supported_modes[] = {
> > > > +     {
> > > > +             .width = 1600,
> > > > +             .height = 1200,
> > > > +             .exp_def = 0x01ae,
> > > > +             .hts_def = 0x03a6,
> > > > +             .vts_def = 0x056e,
> > > > +             .reg_list = {
> > > > +                     .num_of_regs = ARRAY_SIZE(ov02a10_1600x1200_regs),
> > > > +                     .regs = ov02a10_1600x1200_regs,
> > > > +             },
> > > > +     },
> > > > +};
> > > > +
> > > > +static int ov02a10_write_array(struct ov02a10 *ov02a10,
> > > > +                            const struct ov02a10_reg_list *r_list)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     unsigned int i;
> > > > +     int ret;
> > > > +
> > > > +     for (i = 0; i < r_list->num_of_regs; i++) {
> > > > +             ret = i2c_smbus_write_byte_data(client,
> > > > +                                             r_list->regs[i].addr,
> > > > +                                             r_list->regs[i].val);
> > > > +             if (ret < 0)
> > > > +                     return ret;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int ov02a10_read_smbus(struct ov02a10 *ov02a10, unsigned char reg,
> > > > +                           unsigned char *val)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     int ret;
> > > > +
> > > > +     ret = i2c_smbus_read_byte_data(client, reg);
> > > > +     if (ret >= 0) {
> > > > +             *val = (unsigned char)ret;
> > > > +             ret = 0;
> > > > +     }
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int ov02a10_mod_reg(struct ov02a10 *ov02a10, u8 reg, u8 mask, u8 val)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     u8 readval;
> > > > +     int ret;
> > > > +
> > > > +     ret = ov02a10_read_smbus(ov02a10, reg, &readval);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     readval &= ~mask;
> > > > +     val &= mask;
> > > > +     val |= readval;
> > > > +
> > > > +     return i2c_smbus_write_byte_data(client, reg, val);
> > > > +}
> > > > +
> > > > +static void ov02a10_fill_fmt(const struct ov02a10_mode *mode,
> > > > +                          struct v4l2_mbus_framefmt *fmt)
> > > > +{
> > > > +     fmt->width = mode->width;
> > > > +     fmt->height = mode->height;
> > > > +     fmt->field = V4L2_FIELD_NONE;
> > > > +}
> > > > +
> > > > +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> > > > +                        struct v4l2_subdev_pad_config *cfg,
> > > > +                        struct v4l2_subdev_format *fmt)
> > > > +{
> > > > +     struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > +     struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > > +
> > > > +     mutex_lock(&ov02a10->mutex);
> > > > +
> > > > +     if (ov02a10->streaming) {
> > > > +             mutex_unlock(&ov02a10->mutex);
> > > > +             return -EBUSY;
> > > > +     }
> > > > +
> > > > +     /* Only one sensor mode supported */
> > > > +     mbus_fmt->code = ov02a10->fmt.code;
> > > > +     ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > > +     ov02a10->fmt = fmt->format;
> > > > +
> > > > +     mutex_unlock(&ov02a10->mutex);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int ov02a10_get_fmt(struct v4l2_subdev *sd,
> > > > +                        struct v4l2_subdev_pad_config *cfg,
> > > > +                        struct v4l2_subdev_format *fmt)
> > > > +{
> > > > +     struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > +     struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > > +
> > > > +     mutex_lock(&ov02a10->mutex);
> > > > +
> > > > +     fmt->format = ov02a10->fmt;
> > > > +     mbus_fmt->code = ov02a10->fmt.code;
> > > > +     ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > > +
> > > > +     mutex_unlock(&ov02a10->mutex);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
> > > > +                               struct v4l2_subdev_pad_config *cfg,
> > > > +                               struct v4l2_subdev_mbus_code_enum *code)
> > > > +{
> > > > +     struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > +
> > > > +     if (code->index >= ARRAY_SIZE(supported_modes))
> > > > +             return -EINVAL;
> > > > +
> > > > +     code->code = ov02a10->fmt.code;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int ov02a10_enum_frame_sizes(struct v4l2_subdev *sd,
> > > > +                                 struct v4l2_subdev_pad_config *cfg,
> > > > +                                 struct v4l2_subdev_frame_size_enum *fse)
> > > > +{
> > > > +     if (fse->index >= ARRAY_SIZE(supported_modes))
> > > > +             return -EINVAL;
> > > > +
> > > > +     fse->min_width  = supported_modes[fse->index].width;
> > > > +     fse->max_width  = supported_modes[fse->index].width;
> > > > +     fse->max_height = supported_modes[fse->index].height;
> > > > +     fse->min_height = supported_modes[fse->index].height;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int ov02a10_check_sensor_id(struct ov02a10 *ov02a10)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     u16 id;
> > > > +     u8 pid = 0;
> > > > +     u8 ver = 0;
> > > > +     int ret;
> > > > +
> > > > +     /* Check sensor revision */
> > > > +     ret = ov02a10_read_smbus(ov02a10, OV02A10_REG_CHIP_ID_H, &pid);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret = ov02a10_read_smbus(ov02a10, OV02A10_REG_CHIP_ID_L, &ver);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     id = OV02A10_ID(pid, ver);
> > > > +     if (id != CHIP_ID) {
> > > > +             dev_err(&client->dev, "Unexpected sensor id(%04x)\n", id);
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     dev_dbg(&client->dev, "Detected OV%04X sensor\n", id);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int __maybe_unused ov02a10_power_on(struct device *dev)
> > > > +{
> > > > +     struct i2c_client *client = to_i2c_client(dev);
> > > > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > +     struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > +     int ret;
> > > > +
> > > > +     gpiod_set_value_cansleep(ov02a10->n_rst_gpio, GPIOD_OUT_LOW);
> > > > +     gpiod_set_value_cansleep(ov02a10->pd_gpio, GPIOD_OUT_HIGH);
> > > > +
> > > > +     ret = clk_prepare_enable(ov02a10->eclk);
> > > > +     if (ret < 0) {
> > > > +             dev_err(dev, "failed to enable eclk\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > +     if (ret < 0) {
> > > > +             dev_err(dev, "failed to enable regulators\n");
> > > > +             goto disable_clk;
> > > > +     }
> > > > +     usleep_range(5000, 6000);
> > > > +
> > > > +     gpiod_set_value_cansleep(ov02a10->pd_gpio, GPIOD_OUT_LOW);
> > > > +     usleep_range(5000, 6000);
> > > > +
> > > > +     gpiod_set_value_cansleep(ov02a10->n_rst_gpio, GPIOD_OUT_HIGH);
> > > > +     usleep_range(5000, 6000);
> > > > +
> > > > +     ret = ov02a10_check_sensor_id(ov02a10);
> > > > +     if (ret)
> > > > +             goto disable_regulator;
> > > > +
> > > > +     return 0;
> > > > +
> > > > +disable_regulator:
> > > > +     regulator_bulk_disable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > +disable_clk:
> > > > +     clk_disable_unprepare(ov02a10->eclk);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int __maybe_unused ov02a10_power_off(struct device *dev)
> > > > +{
> > > > +     struct i2c_client *client = to_i2c_client(dev);
> > > > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > +     struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > +
> > > > +     gpiod_set_value_cansleep(ov02a10->n_rst_gpio, GPIOD_OUT_LOW);
> > > > +     clk_disable_unprepare(ov02a10->eclk);
> > > > +     gpiod_set_value_cansleep(ov02a10->pd_gpio, GPIOD_OUT_HIGH);
> > > > +     regulator_bulk_disable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int __ov02a10_start_stream(struct ov02a10 *ov02a10)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     const struct ov02a10_reg_list *reg_list;
> > > > +     int ret;
> > > > +
> > > > +     /* Apply default values of current mode */
> > > > +     reg_list = &ov02a10->cur_mode->reg_list;
> > > > +     ret = ov02a10_write_array(ov02a10, reg_list);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     /* Apply customized values from user */
> > > > +     ret = __v4l2_ctrl_handler_setup(ov02a10->subdev.ctrl_handler);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     /* Set orientation to 180 degree */
> > > > +     if (ov02a10->upside_down) {
> > > > +             ret = i2c_smbus_write_byte_data(client, REG_MIRROR_FLIP_CONTROL,
> > > > +                                             REG_MIRROR_FLIP_ENABLE);
> > > > +             if (ret) {
> > > > +                     dev_err(&client->dev, "failed to set orientation\n");
> > > > +                     return ret;
> > > > +             }
> > > > +             ret = i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > > +                                             REG_ENABLE);
> > > > +             if (ret < 0)
> > > > +                     return ret;
> > > > +     }
> > > > +
> > > > +     /* Set clock lane transmission mode according to DT property */
> > > > +     ret = ov02a10_mod_reg(ov02a10, REG_HS_MODE_BLC, CLOCK_HS_MODE_ENABLE,
> > > > +                           ov02a10->mipi_clock_hs_mode_enable ?
> > > > +                           CLOCK_HS_MODE_ENABLE : 0);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     /* Set clock lane hs vod adjust to DT property */
> > > > +     ret = ov02a10_mod_reg(ov02a10, REG_HS_MODE_BLC, CLOCK_HS_VOD_ADJUST,
> > > > +                           ov02a10->mipi_clock_hs_vod_adjust_cnt << 2);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     /* Set mipi tx speed according to DT property */
> > > > +     ret = i2c_smbus_write_byte_data(client, TX_SPEED_AREA_SEL,
> > > > +                                     ov02a10->mipi_clock_tx_speed);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     /* Set stream on register */
> > > > +     return i2c_smbus_write_byte_data(client,
> > > > +                                      REG_SC_CTRL_MODE,
> > > > +                                      SC_CTRL_MODE_STREAMING);
> > > > +}
> > > > +
> > > > +static int __ov02a10_stop_stream(struct ov02a10 *ov02a10)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +
> > > > +     return i2c_smbus_write_byte_data(client,
> > > > +                              REG_SC_CTRL_MODE, SC_CTRL_MODE_STANDBY);
> > >
> > > Alignment. Please run checkpatch.pl on this.
> > >
> > > > +}
> > > > +
> > > > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > > > +                                struct v4l2_subdev_pad_config *cfg)
> > > > +{
> > > > +     struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > +     struct v4l2_subdev_format fmt = { 0 };
> > > > +
> > > > +     fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> > > > +     fmt.format.width = ov02a10->cur_mode->width;
> > > > +     fmt.format.height = ov02a10->cur_mode->width;
> > >
> > > Please use the default mode, not the current one.
> > >
> > > > +
> > > > +     ov02a10_set_fmt(sd, cfg, &fmt);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> > > > +{
> > > > +     struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     int ret = 0;
> > > > +
> > > > +     dev_dbg(&client->dev, "ov02a10 s_stream (%d)\n", on);
> > > > +     mutex_lock(&ov02a10->mutex);
> > > > +
> > > > +     if (ov02a10->streaming == on)
> > > > +             goto unlock_and_return;
> > > > +
> > > > +     if (on) {
> > > > +             ret = pm_runtime_get_sync(&client->dev);
> > > > +             if (ret < 0) {
> > > > +                     pm_runtime_put_noidle(&client->dev);
> > > > +                     goto unlock_and_return;
> > > > +             }
> > > > +
> > > > +             ret = __ov02a10_start_stream(ov02a10);
> > > > +             if (ret) {
> > > > +                     __ov02a10_stop_stream(ov02a10);
> > > > +                     ov02a10->streaming = !on;
> > > > +                     goto err_rpm_put;
> > > > +             }
> > > > +     } else {
> > > > +             __ov02a10_stop_stream(ov02a10);
> > > > +             pm_runtime_put(&client->dev);
> > > > +     }
> > > > +
> > > > +     ov02a10->streaming = on;
> > > > +     mutex_unlock(&ov02a10->mutex);
> > > > +
> > > > +     return ret;
> > > > +
> > > > +err_rpm_put:
> > > > +     pm_runtime_put(&client->dev);
> > > > +unlock_and_return:
> > > > +     mutex_unlock(&ov02a10->mutex);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static const struct dev_pm_ops ov02a10_pm_ops = {
> > > > +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > > > +                             pm_runtime_force_resume)
> > > > +     SET_RUNTIME_PM_OPS(ov02a10_power_off, ov02a10_power_on, NULL)
> > > > +};
> > > > +
> > > > +/*
> > > > + * ov02a10_set_exposure - Function called when setting exposure time
> > > > + * @priv: Pointer to device structure
> > > > + * @val: Variable for exposure time, in the unit of micro-second
> > > > + *
> > > > + * Set exposure time based on input value.
> > > > + *
> > > > + * Return: 0 on success
> > > > + */
> > > > +static int ov02a10_set_exposure(struct ov02a10 *ov02a10, int val)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     int ret;
> > > > +
> > > > +     ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     ret = i2c_smbus_write_byte_data(client, OV02A10_REG_EXPOSURE_H,
> > > > +                                     ((val >> OV02A10_EXP_SHIFT) &
> > > > +                                     OV02A10_MASK_8_BITS));
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     ret = i2c_smbus_write_byte_data(client, OV02A10_REG_EXPOSURE_L,
> > > > +                                     (val & OV02A10_MASK_8_BITS));
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > > +                                      REG_ENABLE);
> > > > +}
> > > > +
> > > > +static int ov02a10_set_gain(struct ov02a10 *ov02a10, int val)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     int ret;
> > > > +
> > > > +     ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     ret = i2c_smbus_write_byte_data(client, OV02A10_REG_GAIN,
> > > > +                                     (val & OV02A10_MASK_8_BITS));
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > > +                                      REG_ENABLE);
> > > > +}
> > > > +
> > > > +static int ov02a10_set_vblank(struct ov02a10 *ov02a10, int val)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     int ret;
> > > > +
> > > > +     ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
> > > > +                                     (((val + ov02a10->cur_mode->height -
> > > > +                                     OV02A10_BASIC_LINE) >>
> > > > +                                     OV02A10_VTS_SHIFT) &
> > > > +                                     OV02A10_MASK_8_BITS));
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_L,
> > > > +                                     ((val + ov02a10->cur_mode->height -
> > > > +                                     OV02A10_BASIC_LINE) &
> > > > +                                     OV02A10_MASK_8_BITS));
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > > +                                      REG_ENABLE);
> > > > +}
> > > > +
> > > > +static int ov02a10_set_test_pattern(struct ov02a10 *ov02a10, int pattern)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     int ret;
> > > > +
> > > > +     if (pattern)
> > > > +             pattern = OV02A10_TEST_PATTERN_ENABLE;
> > > > +
> > > > +     ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     ret = i2c_smbus_write_byte_data(client, OV02A10_REG_TEST_PATTERN,
> > > > +                                     pattern);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     ret = i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > > +                                     REG_ENABLE);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     return i2c_smbus_write_byte_data(client, REG_SC_CTRL_MODE,
> > > > +                                      SC_CTRL_MODE_STREAMING);
> > > > +}
> > > > +
> > > > +static int ov02a10_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > +{
> > > > +     struct ov02a10 *ov02a10 = container_of(ctrl->handler,
> > > > +                                            struct ov02a10, ctrl_handler);
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     s64 max_expo;
> > > > +     int ret = 0;
> > > > +
> > > > +     /* Propagate change of current control to all related controls */
> > > > +     if (ctrl->id == V4L2_CID_VBLANK) {
> > > > +             /* Update max exposure while meeting expected vblanking */
> > > > +             max_expo = ov02a10->cur_mode->height + ctrl->val -
> > > > +                        OV02A10_EXPOSURE_MAX_MARGIN;
> > > > +             __v4l2_ctrl_modify_range(ov02a10->exposure,
> > > > +                                      ov02a10->exposure->minimum, max_expo,
> > > > +                                      ov02a10->exposure->step,
> > > > +                                      ov02a10->exposure->default_value);
> > > > +     }
> > > > +
> > > > +     /* V4L2 controls values will be applied only when power is already up */
> > > > +     if (!pm_runtime_get_if_in_use(&client->dev))
> > > > +             return 0;
> > > > +
> > > > +     switch (ctrl->id) {
> > > > +     case V4L2_CID_EXPOSURE:
> > > > +             ret = ov02a10_set_exposure(ov02a10, ctrl->val);
> > > > +             break;
> > > > +     case V4L2_CID_ANALOGUE_GAIN:
> > > > +             ret = ov02a10_set_gain(ov02a10, ctrl->val);
> > > > +             break;
> > > > +     case V4L2_CID_VBLANK:
> > > > +             ret = ov02a10_set_vblank(ov02a10, ctrl->val);
> > > > +             break;
> > > > +     case V4L2_CID_TEST_PATTERN:
> > > > +             ret = ov02a10_set_test_pattern(ov02a10, ctrl->val);
> > > > +             break;
> > > > +     };
> > > > +
> > > > +     pm_runtime_put(&client->dev);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static const struct v4l2_subdev_video_ops ov02a10_video_ops = {
> > > > +     .s_stream = ov02a10_s_stream,
> > > > +};
> > > > +
> > > > +static const struct v4l2_subdev_pad_ops ov02a10_pad_ops = {
> > > > +     .init_cfg = ov02a10_entity_init_cfg,
> > > > +     .enum_mbus_code = ov02a10_enum_mbus_code,
> > > > +     .enum_frame_size = ov02a10_enum_frame_sizes,
> > > > +     .get_fmt = ov02a10_get_fmt,
> > > > +     .set_fmt = ov02a10_set_fmt,
> > > > +};
> > > > +
> > > > +static const struct v4l2_subdev_ops ov02a10_subdev_ops = {
> > > > +     .video  = &ov02a10_video_ops,
> > > > +     .pad    = &ov02a10_pad_ops,
> > > > +};
> > > > +
> > > > +static const struct media_entity_operations ov02a10_subdev_entity_ops = {
> > > > +     .link_validate = v4l2_subdev_link_validate,
> > > > +};
> > > > +
> > > > +static const struct v4l2_ctrl_ops ov02a10_ctrl_ops = {
> > > > +     .s_ctrl = ov02a10_set_ctrl,
> > > > +};
> > > > +
> > > > +static int ov02a10_initialize_controls(struct ov02a10 *ov02a10)
> > > > +{
> > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > > +     const struct ov02a10_mode *mode;
> > > > +     struct v4l2_ctrl_handler *handler;
> > > > +     struct v4l2_ctrl *ctrl;
> > > > +     u64 exposure_max;
> > > > +     u32 pixel_rate, h_blank;
> > > > +     int ret;
> > > > +
> > > > +     handler = &ov02a10->ctrl_handler;
> > > > +     mode = ov02a10->cur_mode;
> > > > +     ret = v4l2_ctrl_handler_init(handler, 7);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     handler->lock = &ov02a10->mutex;
> > > > +
> > > > +     ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ,
> > > > +                                   0, 0, link_freq_menu_items);
> > > > +     if (ctrl)
> > > > +             ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > +
> > > > +     pixel_rate = to_pixel_rate(0);
> > > > +     v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE,
> > > > +                       0, pixel_rate, 1, pixel_rate);
> > > > +
> > > > +     h_blank = mode->hts_def - mode->width;
> > > > +     ov02a10->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
> > > > +                                         h_blank, h_blank, 1, h_blank);
> > > > +     if (ov02a10->hblank)
> > > > +             ov02a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > +
> > > > +     ov02a10->vblank = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > > > +                                         V4L2_CID_VBLANK, mode->vts_def -
> > > > +                                         mode->height,
> > > > +                                         OV02A10_VTS_MAX - mode->height, 1,
> > > > +                                         mode->vts_def - mode->height);
> > > > +
> > > > +     exposure_max = mode->vts_def - 4;
> > > > +     ov02a10->exposure = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > > > +                                           V4L2_CID_EXPOSURE,
> > > > +                                           OV02A10_EXPOSURE_MIN,
> > > > +                                           exposure_max,
> > > > +                                           OV02A10_EXPOSURE_STEP,
> > > > +                                           mode->exp_def);
> > > > +
> > > > +     ov02a10->anal_gain = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > > > +                                            V4L2_CID_ANALOGUE_GAIN,
> > > > +                                            OV02A10_GAIN_MIN,
> > > > +                                            OV02A10_GAIN_MAX,
> > > > +                                            OV02A10_GAIN_STEP,
> > > > +                                            OV02A10_GAIN_DEFAULT);
> > > > +
> > > > +     ov02a10->test_pattern =
> > > > +             v4l2_ctrl_new_std_menu_items(handler,
> > > > +                                          &ov02a10_ctrl_ops,
> > > > +                                          V4L2_CID_TEST_PATTERN,
> > > > +                                          ARRAY_SIZE(ov02a10_test_pattern_menu) -
> > > > +                                          1, 0, 0,
> > > > +                                          ov02a10_test_pattern_menu);
> > > > +
> > > > +     if (handler->error) {
> > > > +             ret = handler->error;
> > > > +             dev_err(&client->dev, "failed to init controls(%d)\n", ret);
> > > > +             goto err_free_handler;
> > > > +     }
> > > > +
> > > > +     ov02a10->subdev.ctrl_handler = handler;
> > > > +
> > > > +     return 0;
> > > > +
> > > > +err_free_handler:
> > > > +     v4l2_ctrl_handler_free(handler);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
> > > > +{
> > > > +     struct fwnode_handle *ep;
> > > > +     struct fwnode_handle *fwnode = dev_fwnode(dev);
> > > > +     struct v4l2_fwnode_endpoint bus_cfg = {
> > > > +             .bus_type = V4L2_MBUS_CSI2_DPHY
> > > > +     };
> > > > +     unsigned int i, j;
> > > > +     int ret;
> > > > +
> > > > +     if (!fwnode)
> > > > +             return -ENXIO;
> > > > +
> > > > +     ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> > > > +     if (!ep)
> > > > +             return -ENXIO;
> > > > +
> > > > +     ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > > > +     fwnode_handle_put(ep);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     /* Optional indication of mipi clock lane mode */
> > > > +     if (bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)
> > > > +             ov02a10->mipi_clock_hs_mode_enable = true;
> > > > +
> > > > +     if (!bus_cfg.nr_of_link_frequencies) {
> > > > +             dev_err(dev, "no link frequencies defined");
> > > > +             ret = -EINVAL;
> > > > +             goto check_hwcfg_error;
> > > > +     }
> > > > +
> > > > +     for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> > > > +             for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> > > > +                     if (link_freq_menu_items[i] ==
> > > > +                             bus_cfg.link_frequencies[j])
> > > > +                             break;
> > > > +             }
> > > > +
> > > > +             if (j == bus_cfg.nr_of_link_frequencies) {
> > > > +                     dev_err(dev, "no link frequency %lld supported",
> > > > +                             link_freq_menu_items[i]);
> > > > +                     ret = -EINVAL;
> > > > +                     goto check_hwcfg_error;
> > > > +             }
> > > > +     }
> > > > +
> > > > +check_hwcfg_error:
> > > > +     v4l2_fwnode_endpoint_free(&bus_cfg);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int ov02a10_probe(struct i2c_client *client)
> > > > +{
> > > > +     struct device *dev = &client->dev;
> > > > +     struct ov02a10 *ov02a10;
> > > > +     unsigned int rotation;
> > > > +     unsigned int clock_lane_tx_speed;
> > > > +     unsigned int hs_vod_adjust_cnt;
> > > > +     unsigned int i;
> > > > +     int ret;
> > > > +
> > > > +     ov02a10 = devm_kzalloc(dev, sizeof(*ov02a10), GFP_KERNEL);
> > > > +     if (!ov02a10)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ret = ov02a10_check_hwcfg(dev, ov02a10);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed to check HW configuration: %d", ret);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
> > > > +     ov02a10->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > > > +
> > > > +     /* Optional indication of physical rotation of sensor */
> > > > +     ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation",
> > > > +                                    &rotation);
> > > > +     if (!ret) {
> > > > +             switch (rotation) {
> > > > +             case 180:
> > > > +                     ov02a10->upside_down = true;
> > > > +                     ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > > > +                     break;
> > > > +             case 0:
> > > > +                     break;
> > > > +             default:
> > > > +                     dev_warn(dev, "%u degrees rotation is not supported, ignoring...\n",
> > > > +                              rotation);
> > > > +             }
> > > > +     }
> > > > +
> > > > +     /* Optional indication of HS VOD adjust */
> > > > +     ret = fwnode_property_read_u32(dev_fwnode(dev),
> > > > +                                    "ovti,hs-vod-adjust",
> > >
> > > Fits on previous line.
> > >
> > > > +                                    &hs_vod_adjust_cnt);
> > > > +     if (!ret)
> > > > +             ov02a10->mipi_clock_hs_vod_adjust_cnt = hs_vod_adjust_cnt;
> > > > +     else
> > > > +             dev_warn(dev, "failed to get hs vod adjust, using default\n");
> > > > +
> > > > +     /* Optional indication of mipi tx speed */
> > > > +     ret = fwnode_property_read_u32(dev_fwnode(dev),
> > > > +                                    "ovti,mipi-tx-speed",
> > >
> > > I guess this does, too.
> > >
> > > Neither property is documented in bindings. What are they for?
> > >
> > > > +                                    &clock_lane_tx_speed);
> > > > +
> > > > +     if (!ret)
> > > > +             ov02a10->mipi_clock_tx_speed = clock_lane_tx_speed;
> > > > +     else
> > > > +             dev_warn(dev, "failed to get mipi tx speed, using default\n");
> > > > +
> > > > +     /* Get system clock (eclk) */
> > > > +     ov02a10->eclk = devm_clk_get(dev, "eclk");
> > > > +     if (IS_ERR(ov02a10->eclk)) {
> > > > +             dev_err(dev, "failed to get eclk\n");
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> > > > +                                    &ov02a10->eclk_freq);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed to get eclk frequency\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     ret = clk_set_rate(ov02a10->eclk, ov02a10->eclk_freq);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed to set eclk frequency (24MHz)\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     if (clk_get_rate(ov02a10->eclk) != OV02A10_ECLK_FREQ) {
> > > > +             dev_warn(dev, "wrong eclk frequency %d Hz, expected: %d Hz\n",
> > > > +                      ov02a10->eclk_freq, OV02A10_ECLK_FREQ);
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     ov02a10->pd_gpio = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
> > > > +     if (IS_ERR(ov02a10->pd_gpio)) {
> > > > +             dev_err(dev, "failed to get powerdown-gpios\n");
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     ov02a10->n_rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > > +     if (IS_ERR(ov02a10->n_rst_gpio)) {
> > > > +             dev_err(dev, "failed to get reset-gpios\n");
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     for (i = 0; i < OV02A10_NUM_SUPPLIES; i++)
> > > > +             ov02a10->supplies[i].supply = ov02a10_supply_names[i];
> > > > +
> > > > +     ret = devm_regulator_bulk_get(dev, OV02A10_NUM_SUPPLIES,
> > > > +                                   ov02a10->supplies);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed to get regulators\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     mutex_init(&ov02a10->mutex);
> > > > +     ov02a10->cur_mode = &supported_modes[0];
> > > > +     ret = ov02a10_initialize_controls(ov02a10);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed to initialize controls\n");
> > > > +             goto err_destroy_mutex;
> > > > +     }
> > > > +
> > > > +     ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > +     ov02a10->subdev.entity.ops = &ov02a10_subdev_entity_ops;
> > > > +     ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > > +     ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > > +     ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
> > > > +     if (ret < 0) {
> > > > +             dev_err(dev, "failed to init entity pads: %d", ret);
> > > > +             goto err_free_handler;
> > > > +     }
> > > > +
> > > > +     ret = v4l2_async_register_subdev(&ov02a10->subdev);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> > > > +             goto err_clean_entity;
> > > > +     }
> > > > +
> > > > +     pm_runtime_enable(dev);
> > >
> > > You also need pm_runtime_set_active() before pm_runtime_enable(), and to
> > > power the device down, pm_runtime_idle() after it.
> > >
> > > Where did you power up the sensor?
> > >
> >
> > Why do we need to power it up? I think probe is expected to leave it
> > powered off.
>
> I missed the driver does not power the sensor on for verifying it's really
> there.
>
> That's not really an issue I guess. But this also results in the driver not
> working without runtime PM: the driver needs to explicitly power on the
> device in that case.

Good point, I keep forgetting about this. Perhaps something like this
in _probe() could work?

pm_runtime_enable(dev);
if (!pm_runtime_enabled(dev))
    ov02a10_power_on(...);

Then _remove() would handle this naturally, because it checks for
!pm_runtime_status_suspended() and that function returns false ifndef
CONFIG_PM.

Best regards,
Tomasz
