Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E59D84D2F88
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 13:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbiCIM6N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 07:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbiCIM6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 07:58:10 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A4D177D14
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 04:57:09 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id qx21so4704375ejb.13
        for <linux-media@vger.kernel.org>; Wed, 09 Mar 2022 04:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/wOVqoX4QekuxskrbH3S4hkS1AXmbr0g1iYDTwjRmXU=;
        b=KnSaQJmIWCY5fx0eJP8x+dNde4apvaTUJtUymbQZfkE9+WbzJJ9a+RLuAagskKWNIP
         ajjptNa1XzPjgyKPFwoK/CxxmQRqqkcMXi33fB6Gj3gibDS030gSrBOquT4AGpM4Du1S
         5ysjikNSNRzsN16ZvKi+OjgWwuyxHlE5XWhr1s3YY2fm5u3VhV3S4XvDOrzUJ1rk5xEW
         1eRCbPQtl3e7/oGh8eDYXyKsvgtrVV4zXDopPU5a2vJg+GL3WTfjIZ+KxTwbwq1sJlzK
         FRiLqWsgdQ3d9zOJFQVwgbJC/ZDxlhxgFWZRm4biFaJ5dBpBSs+SAapfcV4DkSd0jkcr
         YLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/wOVqoX4QekuxskrbH3S4hkS1AXmbr0g1iYDTwjRmXU=;
        b=QKsZKNTFkOuVIzA68AqrcD93n0+kHA49fFk9oM+5ThZL0OSWloYLcAhUcEu6na65cw
         eplKFy6BckBxFZDLTVxeRSU7rNgtt0DTdtsGHjlXaznrjdAFK2eGr7Yh/qiffy59qSZM
         ernr7ioE54ukrHC4b7LDlAm+Bn5+Q/ur/qIQ80wnV9PKoyQgyAzRZiF+DvbWoB6A3Mvf
         VHibvd2R4puXS9yr4xSOSZBjJY3dYzY7uYmgJOoN64m2J0T++58NTu9MXjckIfknzSbB
         k130QT+QzYgcL+U9xsRZUwsKQHf5885CruXAxa48HhI7aIqa/Zxo5nYUCJUcjSN533v7
         oJuw==
X-Gm-Message-State: AOAM532mY3M1pq4vKuWa9jGe56V+m1teP0BByMX/YmrBHt5CNKmCfqru
        WqoBEYXW7q6Gt7nu+LKrgC/+Kg6ZWhQ2mAOC72CnwA==
X-Google-Smtp-Source: ABdhPJz2KAcGHuxpwPFUJGJ+j7FU+yF4QG5dTWpmrkdMLkKFdn87lQR0qcVMi8Vb0qGwpAablj/GjUQvq1Ws5uDzAfs=
X-Received: by 2002:a17:907:7248:b0:6da:8410:c3c8 with SMTP id
 ds8-20020a170907724800b006da8410c3c8mr17998275ejc.200.1646830627755; Wed, 09
 Mar 2022 04:57:07 -0800 (PST)
MIME-Version: 1.0
References: <20220309102215.891001-1-petko.manolov@konsulko.com>
 <20220309102215.891001-2-petko.manolov@konsulko.com> <164682668750.856468.1538708322661359680@Monstersaurus>
In-Reply-To: <164682668750.856468.1538708322661359680@Monstersaurus>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 9 Mar 2022 12:56:51 +0000
Message-ID: <CAPY8ntDvyTnmCTHR0u=LCC1LBn-hgbnC_d059YR0y_4Qpin4iw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] media: ovm6211: Adds support for OVM6211
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Petko Manolov <petko.manolov@konsulko.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

 Hi Petko and Kieran

On Wed, 9 Mar 2022 at 11:51, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Hi Petko,
>
> Quoting Petko Manolov (2022-03-09 10:22:14)
> > OVM6211 is a black and white 160 kpixel (400x400) camera sensor from OmniVision.
> > It supports 400x400, 200x200 and 100x100 image sizes.  With careful register
>
> Looking below, I see you only have 400x400 and 400x200 modes
> implemented. It might be worth stating that here in the commit message.
> I started looking through here with the assumption you are supporting
> {400x400}, {200x200}, and {100x100}, but can see it's actually {400x400}
> and {400x200}.
>
>
> > programming it is possible to have non-square sizes as well.  The output formats
> > are 8/10-bit RAW, this driver is only using the former.  OVM6211 supports a
> > single lane MIPI transmitter interface with up to 600 Mbps data rate.
>
> Is it possible to implement the HBLANK/VBLANK controls on this sensor? I
> see some settings for frame intervals but not blanking. Perhaps the
> blanking is fixed? (I see it's a global shutter sensor, I'm not sure if
> that makes a difference here...)

The values being poked into OVM6211_TVTS_* in internal_set_stream look
like the normal VTS values of mode->height + V4L2_CID_VBLANK.

HTS is generally registers 0x380c & d on Omnivision sensors, so
V4L2_CID_HBLANK is HTS - mode->width.

> Also I see there is exposure control, but no gain. Should
> V4L2_CID_ANALOGUE_GAIN be implemented/supported?
>
> https://www.ovt.com/wp-content/uploads/2022/01/OVM6211-PB-v1.6-WEB.pdf
> shows at least that there is a gain control component.
>
>
> >
> > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> > ---
> >  drivers/media/i2c/Kconfig   |   10 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/ovm6211.c | 1018 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 1029 insertions(+)
> >  create mode 100644 drivers/media/i2c/ovm6211.c
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index fe66093b8849..aebe6a5f237e 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -1049,6 +1049,16 @@ config VIDEO_OV5648
> >           To compile this driver as a module, choose M here: the
> >           module will be called ov5648.
> >
> > +config VIDEO_OVM6211
> > +       tristate "OmniVision OVM6211 sensor support"
> > +       depends on I2C && VIDEO_V4L2
> > +       help
> > +         This is a Video4Linux2 sensor driver for the OmniVision
> > +         OVM6211 camera.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called ovm6211.
> > +
> >  config VIDEO_OV6650
> >         tristate "OmniVision OV6650 sensor support"
> >         depends on I2C && VIDEO_V4L2
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index f6b80ef6f41d..9e9998966c18 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -78,6 +78,7 @@ obj-$(CONFIG_VIDEO_OV5670) += ov5670.o
> >  obj-$(CONFIG_VIDEO_OV5675) += ov5675.o
> >  obj-$(CONFIG_VIDEO_OV5693) += ov5693.o
> >  obj-$(CONFIG_VIDEO_OV5695) += ov5695.o
> > +obj-$(CONFIG_VIDEO_OVM6211) += ovm6211.o
> >  obj-$(CONFIG_VIDEO_OV6650) += ov6650.o
> >  obj-$(CONFIG_VIDEO_OV7251) += ov7251.o
> >  obj-$(CONFIG_VIDEO_OV7640) += ov7640.o
> > diff --git a/drivers/media/i2c/ovm6211.c b/drivers/media/i2c/ovm6211.c
> > new file mode 100644
> > index 000000000000..7cfcc0bf5e48
> > --- /dev/null
> > +++ b/drivers/media/i2c/ovm6211.c
> > @@ -0,0 +1,1018 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2021 Petko Manolov <petko.manolov@konsulko.com>
> > + * Copyright (C) 2021 DEKA Research & Development Corp.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +/* System Control */
> > +#define OVM6211_SC_MODE_SELECT         0x0100
> > +#define OVM6211_SC_SOFTWARE_RESET      0x0103
> > +#define OVM6211_SC_SCCB_ID1            0x0109
> > +#define OVM6211_SC_CHIP_ID_HIGH                0x300a
> > +#define OVM6211_SC_CHIP_ID_LOW         0x300b
> > +#define OVM6211_SC_REG0C               0x300c
> > +#define OVM6211_SC_REG10               0x3010
> > +#define OVM6211_SC_MIPI_PHY            0x3012
> > +#define OVM6211_SC_MIPI_PHY2           0x3013
> > +#define OVM6211_SC_MIPI_SC_CTRL0       0x3014
> > +#define OVM6211_SC_MIPI_SC_CTRL1       0x3015
> > +#define OVM6211_SC_CLKRST0             0x3016
> > +#define OVM6211_SC_CLKRST1             0x3017
> > +#define OVM6211_SC_CLKRST2             0x3018
> > +#define OVM6211_SC_CLKRST3             0x3019
> > +#define OVM6211_SC_CLKRST4             0x301a
> > +#define OVM6211_SC_CLKRST5             0x301b
> > +#define OVM6211_SC_CLKRST6             0x301c
> > +#define OVM6211_SC_CLOCK_SEL           0x301e
> > +#define OVM6211_SC_MISC_CTRL           0x301f
> > +#define OVM6211_SC_LOW_PWR_CTRL                0x3023
> > +#define OVM6211_SC_REG27               0x3027
> > +#define OVM6211_SC_GP_IO_IN1           0x3029
> > +#define OVM6211_SC_GP_IO_IN2           0x302a
> > +#define OVM6211_SC_SCCB_ID2            0x302b
> > +#define OVM6211_SC_AUTO_SLEEP_PERIOD0  0x302c
> > +#define OVM6211_SC_AUTO_SLEEP_PERIOD1  0x302d
> > +#define OVM6211_SC_AUTO_SLEEP_PERIOD2  0x302e
> > +#define OVM6211_SC_AUTO_SLEEP_PERIOD3  0x302f
> > +#define OVM6211_SC_LP_CTRL0            0x3030
> > +#define OVM6211_SC_REG37               0x3037
> > +#define OVM6211_SC_REG3B               0x303b
> > +/* PLL Control */
> > +#define OVM6211_PLL_PLL0               0x3080
> > +#define OVM6211_PLL_PLL1               0x3081
> > +#define OVM6211_PLL_PLL2               0x3082
> > +#define OVM6211_PLL_PLL18              0x3098
> > +#define OVM6211_PLL_PLL19              0x3099
> > +#define OVM6211_PLL_PLL1A              0x309a
> > +#define OVM6211_PLL_PLL1B              0x309b
> > +#define OVM6211_PLL_PLL1C              0x309c
> > +#define OVM6211_PLL_PLL1D              0x309d
> > +#define OVM6211_PLL_PLL1E              0x309e
> > +#define OVM6211_PLL_PLL1F              0x309f
> > +#define OVM6211_PLL_VT_PIX_CLK_DIV     0x30b0
> > +#define OVM6211_PLL_VT_SYS_CLK_DIV     0x30b1
> > +#define OVM6211_PLL_MULTIPLIER         0x30b3
> > +#define OVM6211_PLL_PLL1_PRE_PLL_DIV   0x30b4
> > +#define OVM6211_PLL_PLL1_OP_PIX_CLK_DIV        0x30b5
> > +#define OVM6211_PLL_PLL1_OP_SYS_CLK_DIV        0x30b6
> > +/* SCCB and group hold */
> > +#define OVM6211_SB_SRB_CTRL            0x3106
> > +#define OVM6211_SB_SWITCH              0x31ff
> > +/* AEC/AGC */
> > +#define OVM6211_AEC_EXPO1              0x3500
> > +#define OVM6211_AEC_EXPO2              0x3501
> > +#define OVM6211_AEC_EXPO3              0x3502
> > +#define OVM6211_AEC_MANUAL             0x3503
> > +#define OVM6211_AGC_MAN_SNR_GAIN1      0x3504
> > +#define OVM6211_AGC_MAN_SNR_GAIN2      0x3505
> > +/* timing conrol registers */

s/conrol /control

> > +#define        OVM6211_TVTS_HI                 0x380e
> > +#define        OVM6211_TVTS_LO                 0x380f
> > +/*Strobe frame span registers*/
> > +#define OVM6211_STROBE_SPAN1           0x3b8d
> > +#define OVM6211_STROBE_SPAN2           0x3b8e
> > +#define OVM6211_STROBE_SPAN3           0x3b8f
> > +/* format control */
> > +#define OVM6211_DATA_MAX_H             0x4300
> > +#define OVM6211_DATA_MIN_H             0x4301
> > +#define OVM6211_CLIP_L                 0x4302
> > +#define OVM6211_FORMAT_CTRL3           0x4303
> > +#define OVM6211_FORMAT_CTRL4           0x4304
> > +#define OVM6211_VSYNC_WIDTH_H          0x4311
> > +#define OVM6211_VSYNC_WIDTH_L          0x4312
> > +#define OVM6211_VSYNC_CTRL             0x4313
> > +#define OVM6211_VSYNC_DELAY1           0x4314
> > +#define OVM6211_VSYNC_DELAY2           0x4315
> > +#define OVM6211_VSYNC_DELAY3           0x4316
> > +#define OVM6211_TST_PATTERN_CTRL       0x4320
> > +/* MIPI */
> > +#define OVM6211_MIPI_CTRL00            0x4800
> > +#define OVM6211_MIPI_CTRL01            0x4801
> > +#define OVM6211_MIPI_CTRL02            0x4802
> > +#define OVM6211_MIPI_CTRL03            0x4803
> > +#define OVM6211_MIPI_CTRL04            0x4804
> > +#define OVM6211_MIPI_CTRL05            0x4805
> > +#define OVM6211_MIPI_CTRL06            0x4806
> > +#define OVM6211_MIPI_MAX_FRAME_COUNT_H 0x4810
> > +#define OVM6211_MIPI_MAX_FRAME_COUNT_L 0x4811
> > +#define OVM6211_MIPI_SHORT_PKT_COUNTER_H       0x4812
> > +#define OVM6211_MIPI_SHORT_PKT_COUNTER_L       0x4813
> > +#define OVM6211_MIPI_CTRL14            0x4814
> > +#define OVM6211_MIPI_DT_SPKT           0x4815
> > +#define OVM6211_MIPI_REG_MAX_H         0x4835
> > +#define OVM6211_MIPI_REG_MAX_L         0x4836
> > +#define OVM6211_PCLK_PERIOD            0x4837
> > +#define OVM6211_WKUP_DLY               0x4838
> > +#define OVM6211_DIR_DLY                        0x483a
> > +#define OVM6211_MIPI_LP_GPIO           0x483b
> > +#define OVM6211_MIPI_CTRL3C            0x483c
> > +#define OVM6211_T_TA_GO                        0x483d
> > +#define OVM6211_T_TA_SURE              0x483e
> > +#define OVM6211_T_TA_GET               0x483f
> > +#define OVM6211_MIPI_CLIP_MAX_H                0x4846
> > +#define OVM6211_MIPI_CLIP_MAX_L                0x4847
> > +#define OVM6211_MIPI_CLIP_MIN_H                0x4848
> > +#define OVM6211_MIPI_CLIP_MIN_L                0x4848
> > +#define OVM6211_REG_INTR_MAN           0x4850
> > +#define OVM6211_REG_TX_WR              0x4851
> > +/* ISP top */
> > +#define OVM6211_ISP_CTRL00             0x5000
> > +#define OVM6211_ISP_CTRL01             0x5001
> > +#define OVM6211_ISP_CTRL02             0x5002
> > +#define OVM6211_ISP_CTRL03             0x5003
> > +#define OVM6211_ISP_CTRL04             0x5004
> > +#define OVM6211_ISP_CTRL05             0x5005
> > +#define OVM6211_ISP_CTRL06             0x5006
> > +#define OVM6211_ISP_CTRL07             0x5007
> > +#define OVM6211_ISP_CTRL08             0x5008
> > +#define OVM6211_ISP_CTRL09             0x5009
> > +/* window control */
> > +#define OVM6211_MAN_XSTART_OFF_H       0x5a00
> > +#define OVM6211_MAN_XSTART_OFF_L       0x5a01
> > +#define OVM6211_MAN_YSTART_OFF_H       0x5a02
> > +#define OVM6211_MAN_YSTART_OFF_L       0x5a03
> > +#define OVM6211_MAN_WIN_WIDTH_H                0x5a04
> > +#define OVM6211_MAN_WIN_WIDTH_L                0x5a05
> > +#define OVM6211_MAN_WIN_HEIGHT_H       0x5a06
> > +#define OVM6211_MAN_WIN_HEIGHT_L       0x5a07
> > +#define OVM6211_WIN_MAN                        0x5a08
> > +
> > +#define        OVM6211_LAST_REG                0x5e08
> > +/* end of OVM6211 definitions */
> > +
> > +#define        DEF_LINK_FREQ                   38400000LL
> > +
> > +enum ovm6211_mode_id {
> > +       OVM6211_MODE_Y8_400_200 = 0,
> > +       OVM6211_MODE_Y8_400_400,
> > +       OVM6211_NUM_MODES,
> > +};
> > +
> > +struct ovm6211_pixfmt {
> > +       u32 code;
> > +       u32 colorspace;
> > +};
> > +
> > +static const struct ovm6211_pixfmt ovm6211_formats[] = {
> > +       { MEDIA_BUS_FMT_Y8_1X8,   V4L2_COLORSPACE_RAW, },
> > +       { MEDIA_BUS_FMT_Y8_1X8,   V4L2_COLORSPACE_RAW, },
>
> Is one entry enough here?
>
> The color space isn't even used is it?
> It could probably be hardcoded in ovm6211_enum_mbus_code(), and then get
> rid of struct ovm6211_pixfmt too?
>
> Unless you expect other bus formats or colorspace to be supported?
>
>
> > +};
> > +
> > +enum ovm6211_framerate_ids {
> > +       OVM6211_10_FPS = 0,
> > +       OVM6211_15_FPS,
> > +       OVM6211_30_FPS,
> > +       OVM6211_45_FPS,
> > +       OVM6211_60_FPS,
> > +       OVM6211_NUM_FRAMERATES,
> > +};
> > +
> > +static const int ovm6211_framerates[] = {
> > +       [OVM6211_10_FPS] = 10,
> > +       [OVM6211_15_FPS] = 15,
> > +       [OVM6211_30_FPS] = 30,
> > +       [OVM6211_45_FPS] = 45,
> > +       [OVM6211_60_FPS] = 60,
> > +};
> > +
> > +/* regulator supplies */
> > +static const char * const ovm6211_supply_name[] = {
> > +       "dovdd",
> > +       "avdd",
> > +};
> > +
> > +static const struct regmap_config ovm6211_regmap_config = {
> > +       .reg_bits       = 16,
> > +       .val_bits       = 8,
> > +       .max_register   = OVM6211_LAST_REG,
> > +       .cache_type     = REGCACHE_NONE,
> > +};
> > +
> > +struct reg_value {
> > +       u16 reg_addr;
> > +       u8 val;
> > +       u8 mask;
> > +       u32 delay_ms;
> > +};
> > +
> > +struct ovm6211_mode_info {
> > +       enum ovm6211_mode_id id;
> > +       u32 width;
> > +       u32 height;
> > +       const struct reg_value *reg_data;
> > +       u32 reg_data_size;
> > +       u32 pixel_clock;
> > +};
> > +
> > +struct ovm6211_ctrls {
> > +       struct v4l2_ctrl_handler handler;
> > +       struct {
> > +               struct v4l2_ctrl *auto_exp;
> > +               struct v4l2_ctrl *exposure;
> > +       };
> > +       struct {
> > +               struct v4l2_ctrl *auto_gain;
> > +               struct v4l2_ctrl *gain;
> > +       };
> > +       struct v4l2_ctrl *link_freq;
> > +};
> > +
> > +struct ovm6211_dev {
> > +       struct i2c_client *i2c_client;
> > +       struct regmap *regmap;
> > +       struct v4l2_subdev sd;
> > +       struct media_pad pad;
> > +       struct v4l2_fwnode_endpoint ep; /* the parsed DT endpoint info */
> > +
> > +       struct regulator_bulk_data supplies[ARRAY_SIZE(ovm6211_supply_name)];
> > +       struct gpio_desc *reset_gpio;
> > +       struct gpio_desc *pwdn_gpio;
> > +
> > +       struct mutex lock;
> > +
> > +       struct v4l2_mbus_framefmt fmt;
> > +
> > +       const struct ovm6211_mode_info *cur_mode;
> > +       enum ovm6211_framerate_ids cur_fr_id;
> > +       struct v4l2_fract frame_interval;
> > +
> > +       struct ovm6211_ctrls ctrls;
> > +
> > +       u32 exposure;
> > +       bool pending_mode_change;
> > +       bool pending_fi_change;
> > +       bool streaming;
> > +};
> > +
> > +static inline struct ovm6211_dev *to_ovm6211_dev(struct v4l2_subdev *sd)
> > +{
> > +       return container_of(sd, struct ovm6211_dev, sd);
> > +}
> > +
> > +static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
> > +{
> > +       return &container_of(ctrl->handler, struct ovm6211_dev,
> > +                            ctrls.handler)->sd;
> > +}
> > +
> > +static const struct reg_value ovm6211_init_y8_400_400[] = {
> > +       {0x0103, 0x01, 0, 0}, {0x0100, 0x00, 0, 0}, {0x3005, 0x08, 0, 0},
> > +       {0x3013, 0x12, 0, 0}, {0x3014, 0x04, 0, 0}, {0x3016, 0x10, 0, 0},
> > +       {0x3017, 0x00, 0, 0}, {0x3018, 0x00, 0, 0}, {0x301a, 0x00, 0, 0},
> > +       {0x301b, 0x00, 0, 0}, {0x301c, 0x00, 0, 0}, {0x3037, 0xf0, 0, 0},
> > +       {0x3080, 0x01, 0, 0}, {0x3081, 0x00, 0, 0}, {0x3082, 0x01, 0, 0},
> > +       {0x3098, 0x04, 0, 0}, {0x3099, 0x28, 0, 0}, {0x309a, 0x06, 0, 0},
> > +       {0x309b, 0x04, 0, 0}, {0x309c, 0x00, 0, 0}, {0x309d, 0x00, 0, 0},
> > +       {0x309e, 0x01, 0, 0}, {0x309f, 0x00, 0, 0}, {0x30b0, 0x08, 0, 0},
> > +       {0x30b1, 0x02, 0, 0}, {0x30b2, 0x00, 0, 0}, {0x30b3, 0x28, 0, 0},
> > +       {0x30b4, 0x02, 0, 0}, {0x30b5, 0x00, 0, 0}, {0x3106, 0xd9, 0, 0},
> > +       {0x3500, 0x00, 0, 0}, {0x3501, 0x1b, 0, 0}, {0x3502, 0x20, 0, 0},
> > +       {0x3503, 0x07, 0, 0}, {0x3509, 0x10, 0, 0}, {0x350b, 0x10, 0, 0},
> > +       {0x3600, 0xfc, 0, 0}, {0x3620, 0xb7, 0, 0}, {0x3621, 0x05, 0, 0},
> > +       {0x3626, 0x31, 0, 0}, {0x3627, 0x40, 0, 0}, {0x3632, 0xa3, 0, 0},
> > +       {0x3633, 0x34, 0, 0}, {0x3634, 0x40, 0, 0}, {0x3636, 0x00, 0, 0},
> > +       {0x3660, 0x80, 0, 0}, {0x3662, 0x03, 0, 0}, {0x3664, 0xf0, 0, 0},
> > +       {0x366a, 0x10, 0, 0}, {0x366b, 0x06, 0, 0}, {0x3680, 0xf4, 0, 0},
> > +       {0x3681, 0x50, 0, 0}, {0x3682, 0x00, 0, 0}, {0x3708, 0x20, 0, 0},
> > +       {0x3709, 0x40, 0, 0}, {0x370d, 0x03, 0, 0}, {0x373b, 0x02, 0, 0},
> > +       {0x373c, 0x08, 0, 0}, {0x3742, 0x00, 0, 0}, {0x3744, 0x16, 0, 0},
> > +       {0x3745, 0x08, 0, 0}, {0x3781, 0xfc, 0, 0}, {0x3788, 0x00, 0, 0},
> > +       {0x3800, 0x00, 0, 0}, {0x3801, 0x04, 0, 0}, {0x3802, 0x00, 0, 0},
> > +       {0x3803, 0x04, 0, 0}, {0x3804, 0x01, 0, 0}, {0x3805, 0x9b, 0, 0},
> > +       {0x3806, 0x01, 0, 0}, {0x3807, 0x9b, 0, 0}, {0x3808, 0x01, 0, 0},
> > +       {0x3809, 0x90, 0, 0}, {0x380a, 0x01, 0, 0}, {0x380b, 0x90, 0, 0},
> > +       {0x380c, 0x05, 0, 0}, {0x380d, 0xf2, 0, 0}, {0x380e, 0x03, 0, 0},
> > +       {0x380f, 0x6c, 0, 0}, {0x3810, 0x00, 0, 0}, {0x3811, 0x04, 0, 0},

No point in having 0x380e & 0x380f in these tables if you're going to
overwrite it based on frame rate.

> > +       {0x3812, 0x00, 0, 0}, {0x3813, 0x04, 0, 0}, {0x3814, 0x11, 0, 0},
> > +       {0x3815, 0x11, 0, 0}, {0x3820, 0x00, 0, 0}, {0x3821, 0x00, 0, 0},
> > +       {0x382b, 0xfa, 0, 0}, {0x382f, 0x04, 0, 0}, {0x3832, 0x00, 0, 0},
> > +       {0x3833, 0x05, 0, 0}, {0x3834, 0x00, 0, 0}, {0x3835, 0x05, 0, 0},
> > +       {0x3882, 0x04, 0, 0}, {0x3883, 0x00, 0, 0}, {0x38a4, 0x10, 0, 0},
> > +       {0x38a5, 0x00, 0, 0}, {0x38b1, 0x03, 0, 0}, {0x3b80, 0x00, 0, 0},
> > +       {0x3b81, 0xff, 0, 0}, {0x3b82, 0x10, 0, 0}, {0x3b83, 0x00, 0, 0},
> > +       {0x3b84, 0x08, 0, 0}, {0x3b85, 0x00, 0, 0}, {0x3b86, 0x01, 0, 0},
> > +       {0x3b87, 0x00, 0, 0}, {0x3b88, 0x00, 0, 0}, {0x3b89, 0x00, 0, 0},
> > +       {0x3b8a, 0x00, 0, 0}, {0x3b8b, 0x05, 0, 0}, {0x3b8c, 0x00, 0, 0},
> > +       {0x3b8d, 0x00, 0, 0}, {0x3b8e, 0x01, 0, 0}, {0x3b8f, 0xb2, 0, 0},
> > +       {0x3b94, 0x05, 0, 0}, {0x3b95, 0xf2, 0, 0}, {0x3b96, 0xc0, 0, 0},
> > +       {0x4004, 0x04, 0, 0}, {0x404e, 0x01, 0, 0}, {0x4801, 0x0f, 0, 0},
> > +       {0x4806, 0x0f, 0, 0}, {0x4837, 0x43, 0, 0}, {0x5a08, 0x00, 0, 0},
> > +       {0x5a01, 0x00, 0, 0}, {0x5a03, 0x00, 0, 0}, {0x5a04, 0x10, 0, 0},
> > +       {0x5a05, 0xa0, 0, 0}, {0x5a06, 0x0c, 0, 0}, {0x5a07, 0x78, 0, 0},
> > +};
> > +
> > +static const struct reg_value ovm6211_init_y8_400_200[] = {
> > +       {0x0103, 0x01, 0, 0}, {0x0100, 0x00, 0, 0}, {0x3005, 0x08, 0, 0},
> > +       {0x3013, 0x12, 0, 0}, {0x3014, 0x04, 0, 0}, {0x3016, 0x10, 0, 0},
> > +       {0x3017, 0x00, 0, 0}, {0x3018, 0x00, 0, 0}, {0x301a, 0x00, 0, 0},
> > +       {0x301b, 0x00, 0, 0}, {0x301c, 0x00, 0, 0}, {0x3037, 0xf0, 0, 0},
> > +       {0x3080, 0x01, 0, 0}, {0x3081, 0x00, 0, 0}, {0x3082, 0x01, 0, 0},
> > +       {0x3098, 0x04, 0, 0}, {0x3099, 0x28, 0, 0}, {0x309a, 0x06, 0, 0},
> > +       {0x309b, 0x04, 0, 0}, {0x309c, 0x00, 0, 0}, {0x309d, 0x00, 0, 0},
> > +       {0x309e, 0x01, 0, 0}, {0x309f, 0x00, 0, 0}, {0x30b0, 0x08, 0, 0},
> > +       {0x30b1, 0x02, 0, 0}, {0x30b2, 0x00, 0, 0}, {0x30b3, 0x28, 0, 0},
> > +       {0x30b4, 0x02, 0, 0}, {0x30b5, 0x00, 0, 0}, {0x3106, 0xd9, 0, 0},
> > +       {0x3500, 0x00, 0, 0}, {0x3501, 0x1b, 0, 0}, {0x3502, 0x20, 0, 0},
> > +       {0x3503, 0x07, 0, 0}, {0x3509, 0x10, 0, 0}, {0x350b, 0x10, 0, 0},
> > +       {0x3600, 0xfc, 0, 0}, {0x3620, 0xb7, 0, 0}, {0x3621, 0x05, 0, 0},
> > +       {0x3626, 0x31, 0, 0}, {0x3627, 0x40, 0, 0}, {0x3632, 0xa3, 0, 0},
> > +       {0x3633, 0x34, 0, 0}, {0x3634, 0x40, 0, 0}, {0x3636, 0x00, 0, 0},
> > +       {0x3660, 0x80, 0, 0}, {0x3662, 0x03, 0, 0}, {0x3664, 0xf0, 0, 0},
> > +       {0x366a, 0x10, 0, 0}, {0x366b, 0x06, 0, 0}, {0x3680, 0xf4, 0, 0},
> > +       {0x3681, 0x50, 0, 0}, {0x3682, 0x00, 0, 0}, {0x3708, 0x20, 0, 0},
> > +       {0x3709, 0x40, 0, 0}, {0x370d, 0x03, 0, 0}, {0x373b, 0x02, 0, 0},
> > +       {0x373c, 0x08, 0, 0}, {0x3742, 0x00, 0, 0}, {0x3744, 0x16, 0, 0},
> > +       {0x3745, 0x08, 0, 0}, {0x3781, 0xfc, 0, 0}, {0x3788, 0x00, 0, 0},
> > +       {0x3800, 0x00, 0, 0}, {0x3801, 0x04, 0, 0}, {0x3802, 0x00, 0, 0},
> > +       {0x3803, 0x04, 0, 0}, {0x3804, 0x01, 0, 0}, {0x3805, 0x9b, 0, 0},
> > +       {0x3806, 0x01, 0, 0}, {0x3807, 0x9b, 0, 0}, {0x3808, 0x01, 0, 0},
> > +       {0x3809, 0x90, 0, 0}, {0x380a, 0x00, 0, 0}, {0x380b, 0xc8, 0, 0},
> > +       {0x380c, 0x05, 0, 0}, {0x380d, 0xf2, 0, 0}, {0x380e, 0x0d, 0, 0},
> > +       {0x380f, 0xb0, 0, 0}, {0x3810, 0x00, 0, 0}, {0x3811, 0x04, 0, 0},
> > +       {0x3812, 0x00, 0, 0}, {0x3813, 0x9a, 0, 0}, {0x3814, 0x11, 0, 0},
> > +       {0x3815, 0x11, 0, 0}, {0x3820, 0x00, 0, 0}, {0x3821, 0x00, 0, 0},
> > +       {0x382b, 0xfa, 0, 0}, {0x382f, 0x04, 0, 0}, {0x3832, 0x00, 0, 0},
> > +       {0x3833, 0x05, 0, 0}, {0x3834, 0x00, 0, 0}, {0x3835, 0x05, 0, 0},
> > +       {0x3882, 0x04, 0, 0}, {0x3883, 0x00, 0, 0}, {0x38a4, 0x10, 0, 0},
> > +       {0x38a5, 0x00, 0, 0}, {0x38b1, 0x03, 0, 0}, {0x3b80, 0x00, 0, 0},
> > +       {0x3b81, 0xff, 0, 0}, {0x3b82, 0x10, 0, 0}, {0x3b83, 0x00, 0, 0},
> > +       {0x3b84, 0x08, 0, 0}, {0x3b85, 0x00, 0, 0}, {0x3b86, 0x01, 0, 0},
> > +       {0x3b87, 0x00, 0, 0}, {0x3b88, 0x00, 0, 0}, {0x3b89, 0x00, 0, 0},
> > +       {0x3b8a, 0x00, 0, 0}, {0x3b8b, 0x05, 0, 0}, {0x3b8c, 0x00, 0, 0},
> > +       {0x3b8d, 0x00, 0, 0}, {0x3b8e, 0x01, 0, 0}, {0x3b8f, 0xb2, 0, 0},
> > +       {0x3b94, 0x05, 0, 0}, {0x3b95, 0xf2, 0, 0}, {0x3b96, 0xc0, 0, 0},
> > +       {0x4004, 0x04, 0, 0}, {0x404e, 0x01, 0, 0}, {0x4801, 0x0f, 0, 0},
> > +       {0x4806, 0x0f, 0, 0}, {0x4837, 0x43, 0, 0}, {0x5a08, 0x00, 0, 0},
> > +       {0x5a01, 0x00, 0, 0}, {0x5a03, 0x00, 0, 0}, {0x5a04, 0x10, 0, 0},
> > +       {0x5a05, 0xa0, 0, 0}, {0x5a06, 0x0c, 0, 0}, {0x5a07, 0x78, 0, 0},
> > +};

These two tables are identical except for registers 0x380a, 0x380b,
0x380f, and 0x3813. More commonly you'd have a common table, and then
the diffs for specific modes.

Also the mask and delay fields are always 0, therefore they seem redundant.

> > +static struct ovm6211_mode_info
> > +ovm6211_mode_data[OVM6211_NUM_MODES] = {
> > +       {OVM6211_MODE_Y8_400_200,
> > +        400, 200,
> > +        ovm6211_init_y8_400_200,
> > +        ARRAY_SIZE(ovm6211_init_y8_400_200),
> > +        400 * 400 * 60 * 2,
> > +       },
> > +       {OVM6211_MODE_Y8_400_400,
> > +        400, 400,
> > +        ovm6211_init_y8_400_400,
> > +        ARRAY_SIZE(ovm6211_init_y8_400_400),
> > +        400 * 400 * 60 * 2,
> > +       },
> > +};
> > +
> > +static const s64 link_freq_menu_items[] = {
> > +       DEF_LINK_FREQ,
> > +};
> > +
> > +#ifdef CONFIG_VIDEO_ADV_DEBUG
> > +static int ovm6211_get_register(struct v4l2_subdev *sd,
> > +                               struct v4l2_dbg_register *reg)
> > +{
> > +       struct ovm6211_dev *sensor = to_ovm6211_dev(sd);
> > +       struct regmap *regmap = sensor->regmap;
> > +       unsigned int val = 0;
> > +       int ret;
> > +
> > +       ret = regmap_read(regmap, reg->reg, &val);
> > +       reg->val = val;
> > +       reg->size = 1;
> > +
> > +       return ret;
> > +}
> > +
> > +static int ovm6211_set_register(struct v4l2_subdev *sd,
> > +                               const struct v4l2_dbg_register *reg)
> > +{
> > +       struct ovm6211_dev *sensor = to_ovm6211_dev(sd);
> > +       struct regmap *regmap = sensor->regmap;
> > +
> > +       return regmap_write(regmap, reg->reg, reg->val & 0xff);
> > +}
> > +#endif
> > +
> > +static int ovm6211_write_reg(struct ovm6211_dev *sensor, u16 reg, u8 val)
> > +{
> > +       struct i2c_client *client = sensor->i2c_client;
> > +       struct regmap *regmap = sensor->regmap;
> > +       int ret;
> > +
> > +       ret = regmap_write(regmap, reg, val);
> > +       if (ret < 0)
> > +               dev_err(&client->dev, "error writing reg %u\n", reg);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ovm6211_read_reg(struct ovm6211_dev *sensor, u16 reg, u8 *val)
> > +{
> > +       struct i2c_client *client = sensor->i2c_client;
> > +       struct regmap *regmap = sensor->regmap;
> > +       unsigned int r;
> > +       int ret;
> > +
> > +       ret = regmap_read(regmap, reg, &r);
> > +       if (ret < 0)
> > +               dev_err(&client->dev, "error reading reg %u\n", reg);
> > +       *val = r & 0xff;
> > +
> > +       return ret;
> > +}
> > +
> > +static int ovm6211_mod_reg(struct ovm6211_dev *sensor, u16 reg, u8 mask, u8 val)
> > +{
> > +       u8 readval;
> > +       int ret;
> > +
> > +       ret = ovm6211_read_reg(sensor, reg, &readval);
> > +       if (ret)
> > +               return ret;
> > +
> > +       readval &= ~mask;
> > +       val &= mask;
> > +       val |= readval;
> > +
> > +       return ovm6211_write_reg(sensor, reg, val);
> > +}
> > +
> > +static int ovm6211_load_regs(struct ovm6211_dev *sensor,
> > +                            const struct ovm6211_mode_info *mode)
> > +{
> > +       const struct reg_value *regs = mode->reg_data;
> > +       unsigned int i;
> > +       u32 delay_ms;
> > +       u16 reg_addr;
> > +       u8 mask, val;
> > +       int ret = 0;
> > +
> > +       for (i = 0; i < mode->reg_data_size; ++i, ++regs) {
> > +               delay_ms = regs->delay_ms;
> > +               reg_addr = regs->reg_addr;
> > +               val = regs->val;
> > +               mask = regs->mask;
> > +
> > +               if (mask)
> > +                       ret = ovm6211_mod_reg(sensor, reg_addr, mask, val);
> > +               else
> > +                       ret = ovm6211_write_reg(sensor, reg_addr, val);
> > +
> > +               if (ret)
> > +                       break;
> > +
> > +               if (delay_ms)
> > +                       usleep_range(1000 * delay_ms, 1000 * delay_ms + 100);
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +static void ovm6211_soft_reset(struct ovm6211_dev *sensor)
> > +{
> > +       ovm6211_write_reg(sensor, OVM6211_SC_SOFTWARE_RESET, 0x01);
> > +       usleep_range(5000, 9000);
> > +       ovm6211_write_reg(sensor, OVM6211_SC_SOFTWARE_RESET, 0x00);
> > +}
> > +
> > +static int ovm6211_set_exposure(struct ovm6211_dev *sensor, u32 exposure)
> > +{
> > +       u32 ce;
> > +       u8 v;
> > +
> > +       ovm6211_read_reg(sensor, OVM6211_TVTS_HI, &v);
> > +       ce = v << 8;
> > +       ovm6211_read_reg(sensor, OVM6211_TVTS_LO, &v);
> > +       ce |= v;
> > +       ce -= 4;

This clipping of exposure should be done as part of the support for
VBLANK, setting the range of the exposure control to be between
whatever the minimum is and TVTS - 4.

> > +       if (ce < exposure)
> > +               exposure = ce;
> > +
> > +       ovm6211_mod_reg(sensor, OVM6211_AEC_MANUAL, 1, 1);
> > +
> > +       ovm6211_write_reg(sensor, OVM6211_AEC_EXPO1, (exposure >> 12) & 0x0f);
> > +       ovm6211_write_reg(sensor, OVM6211_AEC_EXPO2, (exposure >>  4) & 0xff);
> > +       ovm6211_write_reg(sensor, OVM6211_AEC_EXPO3, (exposure <<  4) & 0xf0);
> > +
> > +       /* set strobe width equal to exposure time */
> > +       ovm6211_write_reg(sensor, OVM6211_STROBE_SPAN1,
> > +                         (exposure >> 16) & 0xff);
> > +       ovm6211_write_reg(sensor, OVM6211_STROBE_SPAN2,
> > +                         (exposure >> 8) & 0xff);
> > +       ovm6211_write_reg(sensor, OVM6211_STROBE_SPAN3, (exposure) & 0xff);
> > +
> > +       return 0;
> > +}
> > +
> > +static int internal_set_stream(struct ovm6211_dev *sensor, bool on)
> > +{
> > +       u8 hi, lo;
> > +
> > +       if (sensor->pending_fi_change == false)
> > +               goto stream;
> > +
> > +       switch (sensor->cur_fr_id) {
> > +       case OVM6211_10_FPS:
> > +               hi = 0x14;
> > +               lo = 0x88;
> > +               break;
> > +       case OVM6211_15_FPS:
> > +               hi = 0x0d;
> > +               lo = 0xb0;
> > +               break;
> > +       case OVM6211_30_FPS:
> > +               hi = 0x06;
> > +               lo = 0xd8;
> > +               break;
> > +       case OVM6211_45_FPS:
> > +               hi = 0x04;
> > +               lo = 0x90;
> > +               break;
> > +       case OVM6211_60_FPS:
> > +               hi = 0x03;
> > +               lo = 0x6c;
> > +               break;
> > +       case OVM6211_NUM_FRAMERATES:
> > +               return -EINVAL;
> > +       }
> > +
> > +       sensor->pending_fi_change = false;
> > +       ovm6211_write_reg(sensor, OVM6211_TVTS_HI, hi);
> > +       ovm6211_write_reg(sensor, OVM6211_TVTS_LO, lo);
> > +stream:
> > +       ovm6211_write_reg(sensor, OVM6211_SC_MODE_SELECT, 0);
> > +       if (on) {
> > +               usleep_range(4000, 5000);
> > +               if (sensor->exposure)
> > +                       ovm6211_set_exposure(sensor, sensor->exposure);
> > +               ovm6211_write_reg(sensor, OVM6211_SC_MODE_SELECT, 1);
> > +               sensor->streaming = true;
> > +       } else {
> > +               sensor->streaming = false;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static struct ovm6211_mode_info *ovm6211_find_mode(int w, int h)
> > +{
> > +       return v4l2_find_nearest_size(ovm6211_mode_data,
> > +                                     ARRAY_SIZE(ovm6211_mode_data),
> > +                                     width, height, w, h);
> > +}
> > +
> > +static int ovm6211_set_mode(struct ovm6211_dev *sensor)
> > +{
> > +       const struct ovm6211_mode_info *mode = sensor->cur_mode;
> > +
> > +       ovm6211_soft_reset(sensor);
> > +       ovm6211_load_regs(sensor, mode);

None of your v4l2_ctrl settings will be valid now as you've done a reset.
Use v4l2_ctrl_handler_setup to call s_ctrl on all the defined controls
to restore their current values.

> > +
> > +       return 0;
> > +}
> > +
> > +/* --------------- Subdev Operations --------------- */
> > +
> > +static int ovm6211_get_fmt(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_state *state,
> > +                          struct v4l2_subdev_format *format)
> > +{
> > +       struct ovm6211_dev *sensor = to_ovm6211_dev(sd);
> > +       struct v4l2_mbus_framefmt *fmt;
> > +
> > +       mutex_lock(&sensor->lock);
> > +
> > +       if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> > +               fmt = v4l2_subdev_get_try_format(&sensor->sd, state, format->pad);
> > +               format->format = *fmt;
> > +       } else {
> > +               /* these are hardcoded as we don't support anything else */
> > +               format->format.colorspace  = V4L2_COLORSPACE_RAW;
> > +               format->format.field = V4L2_FIELD_NONE;
> > +               format->format.code = MEDIA_BUS_FMT_Y8_1X8;
> > +               format->format.width = sensor->cur_mode->width;
> > +               format->format.height = sensor->cur_mode->height;
> > +       }
> > +
> > +       mutex_unlock(&sensor->lock);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ovm6211_set_fmt(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_state *state,
> > +                          struct v4l2_subdev_format *format)
> > +{
> > +       struct ovm6211_dev *sensor = to_ovm6211_dev(sd);
> > +       struct v4l2_mbus_framefmt *fmt = &format->format;
> > +       struct ovm6211_mode_info *mode;
> > +
> > +       mutex_lock(&sensor->lock);
> > +
> > +       if (sensor->streaming)
> > +               return -EBUSY;
> > +
> > +       /* these are hardcoded as we don't support anything else */
> > +       format->format.colorspace  = V4L2_COLORSPACE_RAW;
> > +       format->format.field = V4L2_FIELD_NONE;
> > +       format->format.code = MEDIA_BUS_FMT_Y8_1X8;
> > +       mode = ovm6211_find_mode(format->format.width, format->format.height);
> > +       format->format.width = mode->width;
> > +       format->format.height = mode->height;
> > +
> > +       if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> > +               fmt = v4l2_subdev_get_try_format(&sensor->sd, state, format->pad);
> > +               *fmt = format->format;
> > +               goto out;
> > +       }
> > +       sensor->cur_mode = mode;
> > +out:
> > +       mutex_unlock(&sensor->lock);
> > +
> > +       return 0;
> > +}
> > +
> > +/*
> > + * Sensor Controls.
> > + */
> > +
> > +static int ovm6211_set_ctrl_exposure(struct ovm6211_dev *sensor, enum
> > +                                    v4l2_exposure_auto_type auto_exposure)
> > +{
> > +       struct ovm6211_ctrls *ctrls = &sensor->ctrls;
> > +
> > +       if (auto_exposure == V4L2_EXPOSURE_AUTO) {
> > +               sensor->exposure = 0;
> > +       } else {
> > +               sensor->exposure = ctrls->exposure->val;
> > +               ovm6211_set_exposure(sensor, sensor->exposure);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int ovm6211_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > +       struct ovm6211_dev *sensor = to_ovm6211_dev(sd);
> > +       int ret;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_EXPOSURE_AUTO:
> > +               ret = ovm6211_set_ctrl_exposure(sensor, ctrl->val);
> > +               break;
> > +       case V4L2_CID_LINK_FREQ:
>
> Is this actually adjustable? Or should LINK_FREQ always return DEF_LINK_FREQ?
>
> Aha perhaps it does because it's a menu entry with only one entry ...

More normally LINK_FREQ is a read only control, in which case there is
no s_ctrl handler required.

> > +               return 0;
> > +       case V4L2_CID_PIXEL_RATE:
>
> Is it valid to just openly accept any LINK_FREQ/PIXEL_RATE?

Seeing as there is no call to v4l2_ctrl_new_std for
V4L2_CID_PIXEL_RATE, this would never be called.

> > +               return 0;
> > +       default:

No case for V4L2_CID_EXPOSURE, so trying to set that would fail.

> > +               ret = -EINVAL;
> > +               break;
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops ovm6211_ctrl_ops = {
> > +       .s_ctrl = ovm6211_s_ctrl,
> > +};
> > +
> > +static int ovm6211_init_controls(struct ovm6211_dev *sensor)
> > +{
> > +       const struct v4l2_ctrl_ops *ops = &ovm6211_ctrl_ops;
> > +       struct ovm6211_ctrls *ctrls = &sensor->ctrls;
> > +       struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> > +       int ret;
> > +
> > +       v4l2_ctrl_handler_init(hdl, 16);
> > +
> > +       hdl->lock = &sensor->lock;
> > +
> > +       ctrls->auto_exp = v4l2_ctrl_new_std_menu(hdl, ops, V4L2_CID_EXPOSURE_AUTO,
> > +                                                V4L2_EXPOSURE_MANUAL, 0,
> > +                                                V4L2_EXPOSURE_AUTO);
> > +       ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
> > +                                           0, 65535, 1, 0);
> > +       v4l2_ctrl_auto_cluster(3, &ctrls->auto_exp, 0, false);

v4l2_ctrl_auto_cluster is meant to take an array of controls. You've
passed in a pointer to the first entry in struct ovm6211_ctrls. Whilst
auto_exp and exposure are grouped together under a struct, you've
asked for a cluster of 3 controls, so auto_gain would get added to the
cluster too.
Except you haven't initialised auto_gain (or gain), so that may give
vaguely random results.

> > +       ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> > +                                                 0, 0, link_freq_menu_items);
> > +
> > +       if (hdl->error) {
> > +               ret = hdl->error;
> > +               goto free_ctrls;
> > +       }
> > +
> > +       ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;

How can this be volatile if there is no g_volatile_ctrl op in struct
v4l2_ctrl_ops?

> > +       sensor->sd.ctrl_handler = hdl;
> > +
> > +       return 0;
> > +
> > +free_ctrls:
> > +       v4l2_ctrl_handler_free(hdl);
> > +       return ret;
> > +}
> > +
> > +static int ovm6211_g_frame_interval(struct v4l2_subdev *sd,
> > +                                   struct v4l2_subdev_frame_interval *fi)
> > +{
> > +       struct ovm6211_dev *sensor = to_ovm6211_dev(sd);
> > +
> > +       mutex_lock(&sensor->lock);
> > +       fi->interval = sensor->frame_interval;
> > +       mutex_unlock(&sensor->lock);
> > +
> > +       return 0;
> > +}
> > +
> > +static int internal_set_frame_interval(struct ovm6211_dev *sensor, struct
> > +                                      v4l2_subdev_frame_interval *fi)
> > +{
> > +       u32 fr_rate;
> > +       int i, ret = -EINVAL;
> > +
> > +       if (fi->interval.numerator == 0)
> > +               goto out;
> > +
> > +       fr_rate = fi->interval.denominator / fi->interval.numerator;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(ovm6211_framerates); i++) {
> > +               if (ovm6211_framerates[i] == fr_rate)
> > +                       break;
> > +       }
> > +
> > +       if (i == ARRAY_SIZE(ovm6211_framerates))
> > +               goto out;
> > +
> > +       sensor->cur_fr_id = i;
> > +       sensor->frame_interval = fi->interval;
> > +       ret = 0;
> > +out:
> > +       return ret;
> > +}
> > +
> > +static int ovm6211_s_frame_interval(struct v4l2_subdev *sd,
> > +                                   struct v4l2_subdev_frame_interval *fi)
> > +{
> > +       struct ovm6211_dev *sensor = to_ovm6211_dev(sd);
> > +       int ret;
> > +
> > +       mutex_lock(&sensor->lock);
> > +       ret = internal_set_frame_interval(sensor, fi);
> > +       sensor->pending_fi_change = true;
> > +       mutex_unlock(&sensor->lock);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ovm6211_enum_mbus_code(struct v4l2_subdev *sd,
> > +                                 struct v4l2_subdev_state *state,
> > +                                 struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +       if (code->index >= ARRAY_SIZE(ovm6211_formats))
> > +               return -EINVAL;
> > +
> > +       code->code = ovm6211_formats[code->index].code;
> > +
> > +       return 0;
> > +}
> > +
> > +static int ovm6211_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +       struct ovm6211_dev *sensor = to_ovm6211_dev(sd);
> > +       int ret = 0;
> > +
> > +       mutex_lock(&sensor->lock);
> > +
> > +       if (enable)
> > +               ret = ovm6211_set_mode(sensor);
> > +       internal_set_stream(sensor, enable);
> > +
> > +       mutex_unlock(&sensor->lock);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops ovm6211_core_ops = {
> > +#ifdef CONFIG_VIDEO_ADV_DEBUG
> > +       .g_register = ovm6211_get_register,
> > +       .s_register = ovm6211_set_register,
> > +#endif
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops ovm6211_video_ops = {
> > +       .g_frame_interval = ovm6211_g_frame_interval,
> > +       .s_frame_interval = ovm6211_s_frame_interval,
> > +       .s_stream = ovm6211_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops ovm6211_pad_ops = {
> > +       .enum_mbus_code = ovm6211_enum_mbus_code,
> > +       .get_fmt = ovm6211_get_fmt,
> > +       .set_fmt = ovm6211_set_fmt,
> > +};
> > +
> > +static const struct v4l2_subdev_ops ovm6211_subdev_ops = {
> > +       .core = &ovm6211_core_ops,
> > +       .video = &ovm6211_video_ops,
> > +       .pad = &ovm6211_pad_ops,
> > +};
> > +
> > +static int ovm6211_get_regulators(struct ovm6211_dev *sensor)
> > +{
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(ovm6211_supply_name); i++)
> > +               sensor->supplies[i].supply = ovm6211_supply_name[i];
> > +
> > +       return devm_regulator_bulk_get(&sensor->i2c_client->dev,
> > +                                      ARRAY_SIZE(ovm6211_supply_name),
> > +                                      sensor->supplies);
> > +}
> > +
> > +static int ovm6211_check_chip_id(struct ovm6211_dev *sensor)
> > +{
> > +       struct i2c_client *client = sensor->i2c_client;
> > +       struct regmap *regmap = sensor->regmap;
> > +       unsigned int cid;
> > +       int ret = 0;
> > +
> > +       ret = regmap_read(regmap, OVM6211_SC_CHIP_ID_HIGH, &cid);
> > +       if (ret || cid != 0x67) {
> > +               ret = ENXIO;
> > +               goto err;
> > +       }
> > +
> > +       ret = regmap_read(regmap, OVM6211_SC_CHIP_ID_LOW, &cid);
> > +       if (ret || cid != 0x10) {
> > +               ret = -ENXIO;
> > +               goto err;
> > +       }
> > +
> > +       ret = regmap_read(regmap, OVM6211_SC_REG0C, &cid);
> > +       if (ret)
> > +               goto err;
> > +
> > +       dev_info(&client->dev,"found OVM6211, sub revision: 0x%02X\n", cid);
> > +       return 0;
> > +err:
> > +       dev_err(&client->dev, "failed to detect OVM6211\n");
> > +       return ret;
> > +}
> > +
> > +static int ovm6211_probe(struct i2c_client *client)
> > +{
> > +       struct device *dev = &client->dev;
> > +       struct fwnode_handle *endpoint;
> > +       struct ovm6211_dev *sensor;
> > +       struct v4l2_mbus_framefmt *fmt;
> > +       int ret;
> > +
> > +       sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> > +       if (!sensor)
> > +               return -ENOMEM;
> > +
> > +       sensor->i2c_client = client;
> > +
> > +       fmt = &sensor->fmt;
> > +       fmt->code = MEDIA_BUS_FMT_Y8_1X8;
> > +       fmt->colorspace = V4L2_COLORSPACE_RAW;
> > +       fmt->field = V4L2_FIELD_NONE;
> > +       fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +       fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> > +       fmt->width = 400;
> > +       fmt->height = 200;
>
> Is the 400x200 mode just subsampling?
>
> Should 400x200 be listed as a supported image size in your commit
> message?
>
>
> > +
> > +       sensor->frame_interval.numerator = 1;
> > +       sensor->frame_interval.denominator = ovm6211_framerates[OVM6211_45_FPS];
> > +       sensor->cur_fr_id = OVM6211_45_FPS;
> > +       sensor->cur_mode = &ovm6211_mode_data[OVM6211_MODE_Y8_400_200];
> > +
> > +       sensor->ep.bus_type = V4L2_MBUS_CSI2_DPHY;
> > +       endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
> > +       if (!endpoint) {
> > +               dev_err(dev, "endpoint node not found\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret = v4l2_fwnode_endpoint_parse(endpoint, &sensor->ep);
> > +       fwnode_handle_put(endpoint);
> > +       if (ret) {
> > +               dev_err(dev, "Could not parse endpoint\n");
> > +               return ret;
> > +       }
> > +
> > +       /* request optional power down pin */
> > +       sensor->pwdn_gpio = devm_gpiod_get_optional(dev, "powerdown",
> > +                                                   GPIOD_OUT_HIGH);
> > +       if (IS_ERR(sensor->pwdn_gpio))
> > +               return PTR_ERR(sensor->pwdn_gpio);
> > +
> > +       /* request optional reset pin */
> > +       sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > +                                                    GPIOD_OUT_HIGH);
> > +       if (IS_ERR(sensor->reset_gpio))
> > +               return PTR_ERR(sensor->reset_gpio);

You request these GPIOs and regulators, but then never enable them.
pm_runtime support?

You don't request a clock, but the sensor will take an input clock
between 6 and 27MHz. The register PLL configuration is going to be for
one specific input clock frequency, so that ought to be validated, or
multiple clock frequencies supported.

 Dave

> > +       sensor->regmap = devm_regmap_init_i2c(client, &ovm6211_regmap_config);
> > +       if (IS_ERR(sensor->regmap)) {
> > +               dev_err(dev, "regmap init failed\n");
> > +               return PTR_ERR(sensor->regmap);
> > +       }
> > +
> > +       v4l2_i2c_subdev_init(&sensor->sd, client, &ovm6211_subdev_ops);
> > +
> > +       mutex_init(&sensor->lock);
> > +
> > +       sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +                           V4L2_SUBDEV_FL_HAS_EVENTS;
> > +       sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +       sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +       ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> > +       if (ret)
> > +               goto entity_cleanup;
> > +
> > +       ret = ovm6211_get_regulators(sensor);
> > +       if (ret)
> > +               goto entity_cleanup;
> > +
> > +       ret = ovm6211_check_chip_id(sensor);
> > +       if (ret)
> > +               goto entity_cleanup;
> > +
> > +       ret = ovm6211_init_controls(sensor);
> > +       if (ret)
> > +               goto entity_cleanup;
> > +
> > +       ovm6211_load_regs(sensor, sensor->cur_mode);
> > +
> > +       ret = v4l2_async_register_subdev_sensor(&sensor->sd);
> > +       if (ret)
> > +               goto free_ctrls;
> > +
> > +       return 0;
> > +
> > +free_ctrls:
> > +       v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +entity_cleanup:
> > +       media_entity_cleanup(&sensor->sd.entity);
> > +       mutex_destroy(&sensor->lock);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ovm6211_remove(struct i2c_client *client)
> > +{
> > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +       struct ovm6211_dev *sensor = to_ovm6211_dev(sd);
> > +
> > +       v4l2_async_unregister_subdev(&sensor->sd);
> > +       media_entity_cleanup(&sensor->sd.entity);
> > +       v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +       mutex_destroy(&sensor->lock);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct i2c_device_id ovm6211_id[] = {
> > +       { "ovm6211", 0 },
> > +       {},
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ovm6211_id);
> > +
> > +static const struct of_device_id ovm6211_dt_ids[] = {
> > +       { .compatible = "ovti,ovm6211" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ovm6211_dt_ids);
> > +
> > +static struct i2c_driver ovm6211_i2c_driver = {
> > +       .driver = {
> > +               .name  = "ovm6211",
> > +               .of_match_table = ovm6211_dt_ids,
> > +       },
> > +       .probe_new = ovm6211_probe,
> > +       .remove   = ovm6211_remove,
> > +};
> > +
> > +module_i2c_driver(ovm6211_i2c_driver);
> > +
> > +MODULE_AUTHOR("Petko Manolov <petko.manolov@konsulko.com>");
> > +MODULE_DESCRIPTION("OVM6211 MIPI Camera Subdev Driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.30.2
> >
