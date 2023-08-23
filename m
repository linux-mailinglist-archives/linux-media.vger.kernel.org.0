Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8739785333
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 10:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbjHWI4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 04:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbjHWIzk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 04:55:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D6E1FF7
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 01:52:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C3CA5A4;
        Wed, 23 Aug 2023 10:50:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692780646;
        bh=74+M6XGz89TFZFwUUzsxQ569LQVhU2+4aMiznXpOFyU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NmdRYgN/MlFhoFWvtDWZbeY6zOUG49/CkGxxJ5F+lMkzm1iBJnQKJVd2aoGDCyVhL
         24aTHjzxbs8QlAwpfXTn2lwcf9fSAqjoRCB7xsFLuWv+LIYZ+l3YDpwlyFN5DY6HCC
         XGShsvKiUdhwsKdQ2pMkifr57bG0srKWACk4c/4s=
Date:   Wed, 23 Aug 2023 11:52:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 01/18] media: i2c: imx219: Convert to CCI register
 access helpers
Message-ID: <20230823085211.GC4143@pendragon.ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-2-laurent.pinchart@ideasonboard.com>
 <CAPY8ntAJJBpXunrzD_fSQi8BevNaOYP5ynC1zU=R3nQjWsE+TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAJJBpXunrzD_fSQi8BevNaOYP5ynC1zU=R3nQjWsE+TQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, Aug 22, 2023 at 04:38:07PM +0100, Dave Stevenson wrote:
> On Mon, 21 Aug 2023 at 23:29, Laurent Pinchart wrote:
> >
> > Use the new comon CCI register access helpers to replace the private
> 
> s/comon/common
> 
> > register access helpers in the imx219 driver. This simplifies the driver
> > by reducing the amount of code.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/Kconfig  |   1 +
> >  drivers/media/i2c/imx219.c | 515 ++++++++++++++++---------------------
> >  2 files changed, 221 insertions(+), 295 deletions(-)
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 226454b6a90d..f7cea5c53ead 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -118,6 +118,7 @@ config VIDEO_IMX219
> >         depends on I2C && VIDEO_DEV
> >         select MEDIA_CONTROLLER
> >         select VIDEO_V4L2_SUBDEV_API
> > +       select V4L2_CCI_I2C
> 
> Minor warning that this doesn't apply on top of master media-tree
> branch after 11ec2c45b554 "media: i2c: Remove common dependencies from
> sensor drivers".
> Trying to get patch to apply it put the fragment in totally the wrong place.

Oops. I'll rebase on top of v6.6-rc1 for v3 (unless I end up sending v3
earlier).

> >         select V4L2_FWNODE
> >         help
> >           This is a Video4Linux2 sensor driver for the Sony
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index ec53abe2e84e..c5aeec50b9e8 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -21,40 +21,49 @@
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> > +
> > +#include <media/v4l2-cci.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-mediabus.h>
> > -#include <asm/unaligned.h>
> >
> > -#define IMX219_REG_VALUE_08BIT         1
> > -#define IMX219_REG_VALUE_16BIT         2
> > +/* Chip ID */
> > +#define IMX219_REG_CHIP_ID             CCI_REG16(0x0000)
> > +#define IMX219_CHIP_ID                 0x0219
> >
> > -#define IMX219_REG_MODE_SELECT         0x0100
> > +#define IMX219_REG_MODE_SELECT         CCI_REG8(0x0100)
> >  #define IMX219_MODE_STANDBY            0x00
> >  #define IMX219_MODE_STREAMING          0x01
> >
> > -/* Chip ID */
> > -#define IMX219_REG_CHIP_ID             0x0000
> > -#define IMX219_CHIP_ID                 0x0219
> > -
> > -/* External clock frequency is 24.0M */
> > -#define IMX219_XCLK_FREQ               24000000
> > -
> > -/* Pixel rate is fixed for all the modes */
> > -#define IMX219_PIXEL_RATE              182400000
> > -#define IMX219_PIXEL_RATE_4LANE                280800000
> > -
> > -#define IMX219_DEFAULT_LINK_FREQ       456000000
> > -#define IMX219_DEFAULT_LINK_FREQ_4LANE 363000000
> 
> Moving these blocks around made reviewing harder, but such is life.
> 
> With the typo fixed and potential rebase (or at least making Sakari aware)
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> > -
> > -#define IMX219_REG_CSI_LANE_MODE       0x0114
> > +#define IMX219_REG_CSI_LANE_MODE       CCI_REG8(0x0114)
> >  #define IMX219_CSI_2_LANE_MODE         0x01
> >  #define IMX219_CSI_4_LANE_MODE         0x03
> >
> > +/* Analog gain control */
> > +#define IMX219_REG_ANALOG_GAIN         CCI_REG8(0x0157)
> > +#define IMX219_ANA_GAIN_MIN            0
> > +#define IMX219_ANA_GAIN_MAX            232
> > +#define IMX219_ANA_GAIN_STEP           1
> > +#define IMX219_ANA_GAIN_DEFAULT                0x0
> > +
> > +/* Digital gain control */
> > +#define IMX219_REG_DIGITAL_GAIN                CCI_REG16(0x0158)
> > +#define IMX219_DGTL_GAIN_MIN           0x0100
> > +#define IMX219_DGTL_GAIN_MAX           0x0fff
> > +#define IMX219_DGTL_GAIN_DEFAULT       0x0100
> > +#define IMX219_DGTL_GAIN_STEP          1
> > +
> > +/* Exposure control */
> > +#define IMX219_REG_EXPOSURE            CCI_REG16(0x015a)
> > +#define IMX219_EXPOSURE_MIN            4
> > +#define IMX219_EXPOSURE_STEP           1
> > +#define IMX219_EXPOSURE_DEFAULT                0x640
> > +#define IMX219_EXPOSURE_MAX            65535
> > +
> >  /* V_TIMING internal */
> > -#define IMX219_REG_VTS                 0x0160
> > +#define IMX219_REG_VTS                 CCI_REG16(0x0160)
> >  #define IMX219_VTS_15FPS               0x0dc6
> >  #define IMX219_VTS_30FPS_1080P         0x06e3
> >  #define IMX219_VTS_30FPS_BINNED                0x06e3
> > @@ -72,37 +81,16 @@
> >  /* HBLANK control - read only */
> >  #define IMX219_PPL_DEFAULT             3448
> >
> > -/* Exposure control */
> > -#define IMX219_REG_EXPOSURE            0x015a
> > -#define IMX219_EXPOSURE_MIN            4
> > -#define IMX219_EXPOSURE_STEP           1
> > -#define IMX219_EXPOSURE_DEFAULT                0x640
> > -#define IMX219_EXPOSURE_MAX            65535
> > -
> > -/* Analog gain control */
> > -#define IMX219_REG_ANALOG_GAIN         0x0157
> > -#define IMX219_ANA_GAIN_MIN            0
> > -#define IMX219_ANA_GAIN_MAX            232
> > -#define IMX219_ANA_GAIN_STEP           1
> > -#define IMX219_ANA_GAIN_DEFAULT                0x0
> > -
> > -/* Digital gain control */
> > -#define IMX219_REG_DIGITAL_GAIN                0x0158
> > -#define IMX219_DGTL_GAIN_MIN           0x0100
> > -#define IMX219_DGTL_GAIN_MAX           0x0fff
> > -#define IMX219_DGTL_GAIN_DEFAULT       0x0100
> > -#define IMX219_DGTL_GAIN_STEP          1
> > -
> > -#define IMX219_REG_ORIENTATION         0x0172
> > +#define IMX219_REG_ORIENTATION         CCI_REG8(0x0172)
> >
> >  /* Binning  Mode */
> > -#define IMX219_REG_BINNING_MODE                0x0174
> > +#define IMX219_REG_BINNING_MODE                CCI_REG16(0x0174)
> >  #define IMX219_BINNING_NONE            0x0000
> >  #define IMX219_BINNING_2X2             0x0101
> >  #define IMX219_BINNING_2X2_ANALOG      0x0303
> >
> >  /* Test Pattern Control */
> > -#define IMX219_REG_TEST_PATTERN                0x0600
> > +#define IMX219_REG_TEST_PATTERN                CCI_REG16(0x0600)
> >  #define IMX219_TEST_PATTERN_DISABLE    0
> >  #define IMX219_TEST_PATTERN_SOLID_COLOR        1
> >  #define IMX219_TEST_PATTERN_COLOR_BARS 2
> > @@ -110,10 +98,10 @@
> >  #define IMX219_TEST_PATTERN_PN9                4
> >
> >  /* Test pattern colour components */
> > -#define IMX219_REG_TESTP_RED           0x0602
> > -#define IMX219_REG_TESTP_GREENR                0x0604
> > -#define IMX219_REG_TESTP_BLUE          0x0606
> > -#define IMX219_REG_TESTP_GREENB                0x0608
> > +#define IMX219_REG_TESTP_RED           CCI_REG16(0x0602)
> > +#define IMX219_REG_TESTP_GREENR                CCI_REG16(0x0604)
> > +#define IMX219_REG_TESTP_BLUE          CCI_REG16(0x0606)
> > +#define IMX219_REG_TESTP_GREENB                CCI_REG16(0x0608)
> >  #define IMX219_TESTP_COLOUR_MIN                0
> >  #define IMX219_TESTP_COLOUR_MAX                0x03ff
> >  #define IMX219_TESTP_COLOUR_STEP       1
> > @@ -122,6 +110,16 @@
> >  #define IMX219_TESTP_BLUE_DEFAULT      0
> >  #define IMX219_TESTP_GREENB_DEFAULT    0
> >
> > +/* External clock frequency is 24.0M */
> > +#define IMX219_XCLK_FREQ               24000000
> > +
> > +/* Pixel rate is fixed for all the modes */
> > +#define IMX219_PIXEL_RATE              182400000
> > +#define IMX219_PIXEL_RATE_4LANE                280800000
> > +
> > +#define IMX219_DEFAULT_LINK_FREQ       456000000
> > +#define IMX219_DEFAULT_LINK_FREQ_4LANE 363000000
> > +
> >  /* IMX219 native and active pixel array size. */
> >  #define IMX219_NATIVE_WIDTH            3296U
> >  #define IMX219_NATIVE_HEIGHT           2480U
> > @@ -130,14 +128,9 @@
> >  #define IMX219_PIXEL_ARRAY_WIDTH       3280U
> >  #define IMX219_PIXEL_ARRAY_HEIGHT      2464U
> >
> > -struct imx219_reg {
> > -       u16 address;
> > -       u8 val;
> > -};
> > -
> >  struct imx219_reg_list {
> >         unsigned int num_of_regs;
> > -       const struct imx219_reg *regs;
> > +       const struct cci_reg_sequence *regs;
> >  };
> >
> >  /* Mode : resolution and related config&values */
> > @@ -160,53 +153,53 @@ struct imx219_mode {
> >         bool binning;
> >  };
> >
> > -static const struct imx219_reg imx219_common_regs[] = {
> > -       {0x0100, 0x00}, /* Mode Select */
> > +static const struct cci_reg_sequence imx219_common_regs[] = {
> > +       { CCI_REG8(0x0100), 0x00 },     /* Mode Select */
> >
> >         /* To Access Addresses 3000-5fff, send the following commands */
> > -       {0x30eb, 0x0c},
> > -       {0x30eb, 0x05},
> > -       {0x300a, 0xff},
> > -       {0x300b, 0xff},
> > -       {0x30eb, 0x05},
> > -       {0x30eb, 0x09},
> > +       { CCI_REG8(0x30eb), 0x0c },
> > +       { CCI_REG8(0x30eb), 0x05 },
> > +       { CCI_REG8(0x300a), 0xff },
> > +       { CCI_REG8(0x300b), 0xff },
> > +       { CCI_REG8(0x30eb), 0x05 },
> > +       { CCI_REG8(0x30eb), 0x09 },
> >
> >         /* PLL Clock Table */
> > -       {0x0301, 0x05}, /* VTPXCK_DIV */
> > -       {0x0303, 0x01}, /* VTSYSCK_DIV */
> > -       {0x0304, 0x03}, /* PREPLLCK_VT_DIV 0x03 = AUTO set */
> > -       {0x0305, 0x03}, /* PREPLLCK_OP_DIV 0x03 = AUTO set */
> > -       {0x0306, 0x00}, /* PLL_VT_MPY */
> > -       {0x0307, 0x39},
> > -       {0x030b, 0x01}, /* OP_SYS_CLK_DIV */
> > -       {0x030c, 0x00}, /* PLL_OP_MPY */
> > -       {0x030d, 0x72},
> > +       { CCI_REG8(0x0301), 0x05 },     /* VTPXCK_DIV */
> > +       { CCI_REG8(0x0303), 0x01 },     /* VTSYSCK_DIV */
> > +       { CCI_REG8(0x0304), 0x03 },     /* PREPLLCK_VT_DIV 0x03 = AUTO set */
> > +       { CCI_REG8(0x0305), 0x03 },     /* PREPLLCK_OP_DIV 0x03 = AUTO set */
> > +       { CCI_REG8(0x0306), 0x00 },     /* PLL_VT_MPY */
> > +       { CCI_REG8(0x0307), 0x39 },
> > +       { CCI_REG8(0x030b), 0x01 },     /* OP_SYS_CLK_DIV */
> > +       { CCI_REG8(0x030c), 0x00 },     /* PLL_OP_MPY */
> > +       { CCI_REG8(0x030d), 0x72 },
> >
> >         /* Undocumented registers */
> > -       {0x455e, 0x00},
> > -       {0x471e, 0x4b},
> > -       {0x4767, 0x0f},
> > -       {0x4750, 0x14},
> > -       {0x4540, 0x00},
> > -       {0x47b4, 0x14},
> > -       {0x4713, 0x30},
> > -       {0x478b, 0x10},
> > -       {0x478f, 0x10},
> > -       {0x4793, 0x10},
> > -       {0x4797, 0x0e},
> > -       {0x479b, 0x0e},
> > +       { CCI_REG8(0x455e), 0x00 },
> > +       { CCI_REG8(0x471e), 0x4b },
> > +       { CCI_REG8(0x4767), 0x0f },
> > +       { CCI_REG8(0x4750), 0x14 },
> > +       { CCI_REG8(0x4540), 0x00 },
> > +       { CCI_REG8(0x47b4), 0x14 },
> > +       { CCI_REG8(0x4713), 0x30 },
> > +       { CCI_REG8(0x478b), 0x10 },
> > +       { CCI_REG8(0x478f), 0x10 },
> > +       { CCI_REG8(0x4793), 0x10 },
> > +       { CCI_REG8(0x4797), 0x0e },
> > +       { CCI_REG8(0x479b), 0x0e },
> >
> >         /* Frame Bank Register Group "A" */
> > -       {0x0162, 0x0d}, /* Line_Length_A */
> > -       {0x0163, 0x78},
> > -       {0x0170, 0x01}, /* X_ODD_INC_A */
> > -       {0x0171, 0x01}, /* Y_ODD_INC_A */
> > +       { CCI_REG8(0x0162), 0x0d },     /* Line_Length_A */
> > +       { CCI_REG8(0x0163), 0x78 },
> > +       { CCI_REG8(0x0170), 0x01 },     /* X_ODD_INC_A */
> > +       { CCI_REG8(0x0171), 0x01 },     /* Y_ODD_INC_A */
> >
> >         /* Output setup registers */
> > -       {0x0114, 0x01}, /* CSI 2-Lane Mode */
> > -       {0x0128, 0x00}, /* DPHY Auto Mode */
> > -       {0x012a, 0x18}, /* EXCK_Freq */
> > -       {0x012b, 0x00},
> > +       { CCI_REG8(0x0114), 0x01 },     /* CSI 2-Lane Mode */
> > +       { CCI_REG8(0x0128), 0x00 },     /* DPHY Auto Mode */
> > +       { CCI_REG8(0x012a), 0x18 },     /* EXCK_Freq */
> > +       { CCI_REG8(0x012b), 0x00 },
> >  };
> >
> >  /*
> > @@ -214,92 +207,92 @@ static const struct imx219_reg imx219_common_regs[] = {
> >   * driver.
> >   * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 7.
> >   */
> > -static const struct imx219_reg mode_3280x2464_regs[] = {
> > -       {0x0164, 0x00},
> > -       {0x0165, 0x00},
> > -       {0x0166, 0x0c},
> > -       {0x0167, 0xcf},
> > -       {0x0168, 0x00},
> > -       {0x0169, 0x00},
> > -       {0x016a, 0x09},
> > -       {0x016b, 0x9f},
> > -       {0x016c, 0x0c},
> > -       {0x016d, 0xd0},
> > -       {0x016e, 0x09},
> > -       {0x016f, 0xa0},
> > -       {0x0624, 0x0c},
> > -       {0x0625, 0xd0},
> > -       {0x0626, 0x09},
> > -       {0x0627, 0xa0},
> > +static const struct cci_reg_sequence mode_3280x2464_regs[] = {
> > +       { CCI_REG8(0x0164), 0x00 },
> > +       { CCI_REG8(0x0165), 0x00 },
> > +       { CCI_REG8(0x0166), 0x0c },
> > +       { CCI_REG8(0x0167), 0xcf },
> > +       { CCI_REG8(0x0168), 0x00 },
> > +       { CCI_REG8(0x0169), 0x00 },
> > +       { CCI_REG8(0x016a), 0x09 },
> > +       { CCI_REG8(0x016b), 0x9f },
> > +       { CCI_REG8(0x016c), 0x0c },
> > +       { CCI_REG8(0x016d), 0xd0 },
> > +       { CCI_REG8(0x016e), 0x09 },
> > +       { CCI_REG8(0x016f), 0xa0 },
> > +       { CCI_REG8(0x0624), 0x0c },
> > +       { CCI_REG8(0x0625), 0xd0 },
> > +       { CCI_REG8(0x0626), 0x09 },
> > +       { CCI_REG8(0x0627), 0xa0 },
> >  };
> >
> > -static const struct imx219_reg mode_1920_1080_regs[] = {
> > -       {0x0164, 0x02},
> > -       {0x0165, 0xa8},
> > -       {0x0166, 0x0a},
> > -       {0x0167, 0x27},
> > -       {0x0168, 0x02},
> > -       {0x0169, 0xb4},
> > -       {0x016a, 0x06},
> > -       {0x016b, 0xeb},
> > -       {0x016c, 0x07},
> > -       {0x016d, 0x80},
> > -       {0x016e, 0x04},
> > -       {0x016f, 0x38},
> > -       {0x0624, 0x07},
> > -       {0x0625, 0x80},
> > -       {0x0626, 0x04},
> > -       {0x0627, 0x38},
> > +static const struct cci_reg_sequence mode_1920_1080_regs[] = {
> > +       { CCI_REG8(0x0164), 0x02 },
> > +       { CCI_REG8(0x0165), 0xa8 },
> > +       { CCI_REG8(0x0166), 0x0a },
> > +       { CCI_REG8(0x0167), 0x27 },
> > +       { CCI_REG8(0x0168), 0x02 },
> > +       { CCI_REG8(0x0169), 0xb4 },
> > +       { CCI_REG8(0x016a), 0x06 },
> > +       { CCI_REG8(0x016b), 0xeb },
> > +       { CCI_REG8(0x016c), 0x07 },
> > +       { CCI_REG8(0x016d), 0x80 },
> > +       { CCI_REG8(0x016e), 0x04 },
> > +       { CCI_REG8(0x016f), 0x38 },
> > +       { CCI_REG8(0x0624), 0x07 },
> > +       { CCI_REG8(0x0625), 0x80 },
> > +       { CCI_REG8(0x0626), 0x04 },
> > +       { CCI_REG8(0x0627), 0x38 },
> >  };
> >
> > -static const struct imx219_reg mode_1640_1232_regs[] = {
> > -       {0x0164, 0x00},
> > -       {0x0165, 0x00},
> > -       {0x0166, 0x0c},
> > -       {0x0167, 0xcf},
> > -       {0x0168, 0x00},
> > -       {0x0169, 0x00},
> > -       {0x016a, 0x09},
> > -       {0x016b, 0x9f},
> > -       {0x016c, 0x06},
> > -       {0x016d, 0x68},
> > -       {0x016e, 0x04},
> > -       {0x016f, 0xd0},
> > -       {0x0624, 0x06},
> > -       {0x0625, 0x68},
> > -       {0x0626, 0x04},
> > -       {0x0627, 0xd0},
> > +static const struct cci_reg_sequence mode_1640_1232_regs[] = {
> > +       { CCI_REG8(0x0164), 0x00 },
> > +       { CCI_REG8(0x0165), 0x00 },
> > +       { CCI_REG8(0x0166), 0x0c },
> > +       { CCI_REG8(0x0167), 0xcf },
> > +       { CCI_REG8(0x0168), 0x00 },
> > +       { CCI_REG8(0x0169), 0x00 },
> > +       { CCI_REG8(0x016a), 0x09 },
> > +       { CCI_REG8(0x016b), 0x9f },
> > +       { CCI_REG8(0x016c), 0x06 },
> > +       { CCI_REG8(0x016d), 0x68 },
> > +       { CCI_REG8(0x016e), 0x04 },
> > +       { CCI_REG8(0x016f), 0xd0 },
> > +       { CCI_REG8(0x0624), 0x06 },
> > +       { CCI_REG8(0x0625), 0x68 },
> > +       { CCI_REG8(0x0626), 0x04 },
> > +       { CCI_REG8(0x0627), 0xd0 },
> >  };
> >
> > -static const struct imx219_reg mode_640_480_regs[] = {
> > -       {0x0164, 0x03},
> > -       {0x0165, 0xe8},
> > -       {0x0166, 0x08},
> > -       {0x0167, 0xe7},
> > -       {0x0168, 0x02},
> > -       {0x0169, 0xf0},
> > -       {0x016a, 0x06},
> > -       {0x016b, 0xaf},
> > -       {0x016c, 0x02},
> > -       {0x016d, 0x80},
> > -       {0x016e, 0x01},
> > -       {0x016f, 0xe0},
> > -       {0x0624, 0x06},
> > -       {0x0625, 0x68},
> > -       {0x0626, 0x04},
> > -       {0x0627, 0xd0},
> > +static const struct cci_reg_sequence mode_640_480_regs[] = {
> > +       { CCI_REG8(0x0164), 0x03 },
> > +       { CCI_REG8(0x0165), 0xe8 },
> > +       { CCI_REG8(0x0166), 0x08 },
> > +       { CCI_REG8(0x0167), 0xe7 },
> > +       { CCI_REG8(0x0168), 0x02 },
> > +       { CCI_REG8(0x0169), 0xf0 },
> > +       { CCI_REG8(0x016a), 0x06 },
> > +       { CCI_REG8(0x016b), 0xaf },
> > +       { CCI_REG8(0x016c), 0x02 },
> > +       { CCI_REG8(0x016d), 0x80 },
> > +       { CCI_REG8(0x016e), 0x01 },
> > +       { CCI_REG8(0x016f), 0xe0 },
> > +       { CCI_REG8(0x0624), 0x06 },
> > +       { CCI_REG8(0x0625), 0x68 },
> > +       { CCI_REG8(0x0626), 0x04 },
> > +       { CCI_REG8(0x0627), 0xd0 },
> >  };
> >
> > -static const struct imx219_reg raw8_framefmt_regs[] = {
> > -       {0x018c, 0x08},
> > -       {0x018d, 0x08},
> > -       {0x0309, 0x08},
> > +static const struct cci_reg_sequence raw8_framefmt_regs[] = {
> > +       { CCI_REG8(0x018c), 0x08 },
> > +       { CCI_REG8(0x018d), 0x08 },
> > +       { CCI_REG8(0x0309), 0x08 },
> >  };
> >
> > -static const struct imx219_reg raw10_framefmt_regs[] = {
> > -       {0x018c, 0x0a},
> > -       {0x018d, 0x0a},
> > -       {0x0309, 0x0a},
> > +static const struct cci_reg_sequence raw10_framefmt_regs[] = {
> > +       { CCI_REG8(0x018c), 0x0a },
> > +       { CCI_REG8(0x018d), 0x0a },
> > +       { CCI_REG8(0x0309), 0x0a },
> >  };
> >
> >  static const s64 imx219_link_freq_menu[] = {
> > @@ -460,6 +453,7 @@ struct imx219 {
> >         struct v4l2_subdev sd;
> >         struct media_pad pad;
> >
> > +       struct regmap *regmap;
> >         struct clk *xclk; /* system clock to IMX219 */
> >         u32 xclk_freq;
> >
> > @@ -491,78 +485,6 @@ static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> >         return container_of(_sd, struct imx219, sd);
> >  }
> >
> > -/* Read registers up to 2 at a time */
> > -static int imx219_read_reg(struct imx219 *imx219, u16 reg, u32 len, u32 *val)
> > -{
> > -       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > -       struct i2c_msg msgs[2];
> > -       u8 addr_buf[2] = { reg >> 8, reg & 0xff };
> > -       u8 data_buf[4] = { 0, };
> > -       int ret;
> > -
> > -       if (len > 4)
> > -               return -EINVAL;
> > -
> > -       /* Write register address */
> > -       msgs[0].addr = client->addr;
> > -       msgs[0].flags = 0;
> > -       msgs[0].len = ARRAY_SIZE(addr_buf);
> > -       msgs[0].buf = addr_buf;
> > -
> > -       /* Read data from register */
> > -       msgs[1].addr = client->addr;
> > -       msgs[1].flags = I2C_M_RD;
> > -       msgs[1].len = len;
> > -       msgs[1].buf = &data_buf[4 - len];
> > -
> > -       ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > -       if (ret != ARRAY_SIZE(msgs))
> > -               return -EIO;
> > -
> > -       *val = get_unaligned_be32(data_buf);
> > -
> > -       return 0;
> > -}
> > -
> > -/* Write registers up to 2 at a time */
> > -static int imx219_write_reg(struct imx219 *imx219, u16 reg, u32 len, u32 val)
> > -{
> > -       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > -       u8 buf[6];
> > -
> > -       if (len > 4)
> > -               return -EINVAL;
> > -
> > -       put_unaligned_be16(reg, buf);
> > -       put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> > -       if (i2c_master_send(client, buf, len + 2) != len + 2)
> > -               return -EIO;
> > -
> > -       return 0;
> > -}
> > -
> > -/* Write a list of registers */
> > -static int imx219_write_regs(struct imx219 *imx219,
> > -                            const struct imx219_reg *regs, u32 len)
> > -{
> > -       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > -       unsigned int i;
> > -       int ret;
> > -
> > -       for (i = 0; i < len; i++) {
> > -               ret = imx219_write_reg(imx219, regs[i].address, 1, regs[i].val);
> > -               if (ret) {
> > -                       dev_err_ratelimited(&client->dev,
> > -                                           "Failed to write reg 0x%4.4x. error = %d\n",
> > -                                           regs[i].address, ret);
> > -
> > -                       return ret;
> > -               }
> > -       }
> > -
> > -       return 0;
> > -}
> > -
> >  /* Get bayer order based on flip setting. */
> >  static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
> >  {
> > @@ -586,7 +508,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >         struct imx219 *imx219 =
> >                 container_of(ctrl->handler, struct imx219, ctrl_handler);
> >         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > -       int ret;
> > +       int ret = 0;
> >
> >         if (ctrl->id == V4L2_CID_VBLANK) {
> >                 int exposure_max, exposure_def;
> > @@ -610,48 +532,45 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >
> >         switch (ctrl->id) {
> >         case V4L2_CID_ANALOGUE_GAIN:
> > -               ret = imx219_write_reg(imx219, IMX219_REG_ANALOG_GAIN,
> > -                                      IMX219_REG_VALUE_08BIT, ctrl->val);
> > +               cci_write(imx219->regmap, IMX219_REG_ANALOG_GAIN,
> > +                         ctrl->val, &ret);
> >                 break;
> >         case V4L2_CID_EXPOSURE:
> > -               ret = imx219_write_reg(imx219, IMX219_REG_EXPOSURE,
> > -                                      IMX219_REG_VALUE_16BIT, ctrl->val);
> > +               cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > +                         ctrl->val, &ret);
> >                 break;
> >         case V4L2_CID_DIGITAL_GAIN:
> > -               ret = imx219_write_reg(imx219, IMX219_REG_DIGITAL_GAIN,
> > -                                      IMX219_REG_VALUE_16BIT, ctrl->val);
> > +               cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > +                         ctrl->val, &ret);
> >                 break;
> >         case V4L2_CID_TEST_PATTERN:
> > -               ret = imx219_write_reg(imx219, IMX219_REG_TEST_PATTERN,
> > -                                      IMX219_REG_VALUE_16BIT,
> > -                                      imx219_test_pattern_val[ctrl->val]);
> > +               cci_write(imx219->regmap, IMX219_REG_TEST_PATTERN,
> > +                         imx219_test_pattern_val[ctrl->val], &ret);
> >                 break;
> >         case V4L2_CID_HFLIP:
> >         case V4L2_CID_VFLIP:
> > -               ret = imx219_write_reg(imx219, IMX219_REG_ORIENTATION, 1,
> > -                                      imx219->hflip->val |
> > -                                      imx219->vflip->val << 1);
> > +               cci_write(imx219->regmap, IMX219_REG_ORIENTATION,
> > +                         imx219->hflip->val | imx219->vflip->val << 1, &ret);
> >                 break;
> >         case V4L2_CID_VBLANK:
> > -               ret = imx219_write_reg(imx219, IMX219_REG_VTS,
> > -                                      IMX219_REG_VALUE_16BIT,
> > -                                      imx219->mode->height + ctrl->val);
> > +               cci_write(imx219->regmap, IMX219_REG_VTS,
> > +                         imx219->mode->height + ctrl->val, &ret);
> >                 break;
> >         case V4L2_CID_TEST_PATTERN_RED:
> > -               ret = imx219_write_reg(imx219, IMX219_REG_TESTP_RED,
> > -                                      IMX219_REG_VALUE_16BIT, ctrl->val);
> > +               cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
> > +                         ctrl->val, &ret);
> >                 break;
> >         case V4L2_CID_TEST_PATTERN_GREENR:
> > -               ret = imx219_write_reg(imx219, IMX219_REG_TESTP_GREENR,
> > -                                      IMX219_REG_VALUE_16BIT, ctrl->val);
> > +               cci_write(imx219->regmap, IMX219_REG_TESTP_GREENR,
> > +                         ctrl->val, &ret);
> >                 break;
> >         case V4L2_CID_TEST_PATTERN_BLUE:
> > -               ret = imx219_write_reg(imx219, IMX219_REG_TESTP_BLUE,
> > -                                      IMX219_REG_VALUE_16BIT, ctrl->val);
> > +               cci_write(imx219->regmap, IMX219_REG_TESTP_BLUE,
> > +                         ctrl->val, &ret);
> >                 break;
> >         case V4L2_CID_TEST_PATTERN_GREENB:
> > -               ret = imx219_write_reg(imx219, IMX219_REG_TESTP_GREENB,
> > -                                      IMX219_REG_VALUE_16BIT, ctrl->val);
> > +               cci_write(imx219->regmap, IMX219_REG_TESTP_GREENB,
> > +                         ctrl->val, &ret);
> >                 break;
> >         default:
> >                 dev_info(&client->dev,
> > @@ -802,15 +721,15 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >         case MEDIA_BUS_FMT_SGRBG8_1X8:
> >         case MEDIA_BUS_FMT_SGBRG8_1X8:
> >         case MEDIA_BUS_FMT_SBGGR8_1X8:
> > -               return imx219_write_regs(imx219, raw8_framefmt_regs,
> > -                                       ARRAY_SIZE(raw8_framefmt_regs));
> > +               return cci_multi_reg_write(imx219->regmap, raw8_framefmt_regs,
> > +                                          ARRAY_SIZE(raw8_framefmt_regs), NULL);
> >
> >         case MEDIA_BUS_FMT_SRGGB10_1X10:
> >         case MEDIA_BUS_FMT_SGRBG10_1X10:
> >         case MEDIA_BUS_FMT_SGBRG10_1X10:
> >         case MEDIA_BUS_FMT_SBGGR10_1X10:
> > -               return imx219_write_regs(imx219, raw10_framefmt_regs,
> > -                                       ARRAY_SIZE(raw10_framefmt_regs));
> > +               return cci_multi_reg_write(imx219->regmap, raw10_framefmt_regs,
> > +                                          ARRAY_SIZE(raw10_framefmt_regs), NULL);
> >         }
> >
> >         return -EINVAL;
> > @@ -819,28 +738,24 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >  static int imx219_set_binning(struct imx219 *imx219,
> >                               const struct v4l2_mbus_framefmt *format)
> >  {
> > -       if (!imx219->mode->binning) {
> > -               return imx219_write_reg(imx219, IMX219_REG_BINNING_MODE,
> > -                                       IMX219_REG_VALUE_16BIT,
> > -                                       IMX219_BINNING_NONE);
> > -       }
> > +       if (!imx219->mode->binning)
> > +               return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
> > +                                IMX219_BINNING_NONE, NULL);
> >
> >         switch (format->code) {
> >         case MEDIA_BUS_FMT_SRGGB8_1X8:
> >         case MEDIA_BUS_FMT_SGRBG8_1X8:
> >         case MEDIA_BUS_FMT_SGBRG8_1X8:
> >         case MEDIA_BUS_FMT_SBGGR8_1X8:
> > -               return imx219_write_reg(imx219, IMX219_REG_BINNING_MODE,
> > -                                       IMX219_REG_VALUE_16BIT,
> > -                                       IMX219_BINNING_2X2_ANALOG);
> > +               return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
> > +                                IMX219_BINNING_2X2_ANALOG, NULL);
> >
> >         case MEDIA_BUS_FMT_SRGGB10_1X10:
> >         case MEDIA_BUS_FMT_SGRBG10_1X10:
> >         case MEDIA_BUS_FMT_SGBRG10_1X10:
> >         case MEDIA_BUS_FMT_SBGGR10_1X10:
> > -               return imx219_write_reg(imx219, IMX219_REG_BINNING_MODE,
> > -                                       IMX219_REG_VALUE_16BIT,
> > -                                       IMX219_BINNING_2X2);
> > +               return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
> > +                                IMX219_BINNING_2X2, NULL);
> >         }
> >
> >         return -EINVAL;
> > @@ -879,9 +794,9 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> >
> >  static int imx219_configure_lanes(struct imx219 *imx219)
> >  {
> > -       return imx219_write_reg(imx219, IMX219_REG_CSI_LANE_MODE,
> > -                               IMX219_REG_VALUE_08BIT, (imx219->lanes == 2) ?
> > -                               IMX219_CSI_2_LANE_MODE : IMX219_CSI_4_LANE_MODE);
> > +       return cci_write(imx219->regmap, IMX219_REG_CSI_LANE_MODE,
> > +                        imx219->lanes == 2 ? IMX219_CSI_2_LANE_MODE :
> > +                        IMX219_CSI_4_LANE_MODE, NULL);
> >  };
> >
> >  static int imx219_start_streaming(struct imx219 *imx219,
> > @@ -897,7 +812,8 @@ static int imx219_start_streaming(struct imx219 *imx219,
> >                 return ret;
> >
> >         /* Send all registers that are common to all modes */
> > -       ret = imx219_write_regs(imx219, imx219_common_regs, ARRAY_SIZE(imx219_common_regs));
> > +       ret = cci_multi_reg_write(imx219->regmap, imx219_common_regs,
> > +                                 ARRAY_SIZE(imx219_common_regs), NULL);
> >         if (ret) {
> >                 dev_err(&client->dev, "%s failed to send mfg header\n", __func__);
> >                 goto err_rpm_put;
> > @@ -912,7 +828,8 @@ static int imx219_start_streaming(struct imx219 *imx219,
> >
> >         /* Apply default values of current mode */
> >         reg_list = &imx219->mode->reg_list;
> > -       ret = imx219_write_regs(imx219, reg_list->regs, reg_list->num_of_regs);
> > +       ret = cci_multi_reg_write(imx219->regmap, reg_list->regs,
> > +                                 reg_list->num_of_regs, NULL);
> >         if (ret) {
> >                 dev_err(&client->dev, "%s failed to set mode\n", __func__);
> >                 goto err_rpm_put;
> > @@ -939,8 +856,8 @@ static int imx219_start_streaming(struct imx219 *imx219,
> >                 goto err_rpm_put;
> >
> >         /* set stream on register */
> > -       ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> > -                              IMX219_REG_VALUE_08BIT, IMX219_MODE_STREAMING);
> > +       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> > +                       IMX219_MODE_STREAMING, NULL);
> >         if (ret)
> >                 goto err_rpm_put;
> >
> > @@ -961,8 +878,8 @@ static void imx219_stop_streaming(struct imx219 *imx219)
> >         int ret;
> >
> >         /* set stream off register */
> > -       ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> > -                              IMX219_REG_VALUE_08BIT, IMX219_MODE_STANDBY);
> > +       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> > +                       IMX219_MODE_STANDBY, NULL);
> >         if (ret)
> >                 dev_err(&client->dev, "%s failed to set stream\n", __func__);
> >
> > @@ -1101,10 +1018,9 @@ static int imx219_identify_module(struct imx219 *imx219)
> >  {
> >         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >         int ret;
> > -       u32 val;
> > +       u64 val;
> >
> > -       ret = imx219_read_reg(imx219, IMX219_REG_CHIP_ID,
> > -                             IMX219_REG_VALUE_16BIT, &val);
> > +       ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
> >         if (ret) {
> >                 dev_err(&client->dev, "failed to read chip id %x\n",
> >                         IMX219_CHIP_ID);
> > @@ -1112,7 +1028,7 @@ static int imx219_identify_module(struct imx219 *imx219)
> >         }
> >
> >         if (val != IMX219_CHIP_ID) {
> > -               dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
> > +               dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
> >                         IMX219_CHIP_ID, val);
> >                 return -EIO;
> >         }
> > @@ -1336,6 +1252,13 @@ static int imx219_probe(struct i2c_client *client)
> >         if (imx219_check_hwcfg(dev, imx219))
> >                 return -EINVAL;
> >
> > +       imx219->regmap = devm_cci_regmap_init_i2c(client, 16);
> > +       if (IS_ERR(imx219->regmap)) {
> > +               ret = PTR_ERR(imx219->regmap);
> > +               dev_err(dev, "failed to initialize CCI: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> >         /* Get system clock (xclk) */
> >         imx219->xclk = devm_clk_get(dev, NULL);
> >         if (IS_ERR(imx219->xclk)) {
> > @@ -1379,17 +1302,19 @@ static int imx219_probe(struct i2c_client *client)
> >          * streaming is started, so upon power up switch the modes to:
> >          * streaming -> standby
> >          */
> > -       ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> > -                              IMX219_REG_VALUE_08BIT, IMX219_MODE_STREAMING);
> > +       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> > +                       IMX219_MODE_STREAMING, NULL);
> >         if (ret < 0)
> >                 goto error_power_off;
> > +
> >         usleep_range(100, 110);
> >
> >         /* put sensor back to standby mode */
> > -       ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> > -                              IMX219_REG_VALUE_08BIT, IMX219_MODE_STANDBY);
> > +       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> > +                       IMX219_MODE_STANDBY, NULL);
> >         if (ret < 0)
> >                 goto error_power_off;
> > +
> >         usleep_range(100, 110);
> >
> >         ret = imx219_init_controls(imx219);

-- 
Regards,

Laurent Pinchart
