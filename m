Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4F83D35F4
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 10:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234284AbhGWHTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 03:19:52 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44985 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234190AbhGWHTv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 03:19:51 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E6BCD1BF205;
        Fri, 23 Jul 2021 08:00:21 +0000 (UTC)
Date:   Fri, 23 Jul 2021 10:00:21 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 12/13] media: i2c: Remove unused macros from ov8865
Message-ID: <YPp3FU0Tr9oGGcqc@aptenodytes>
References: <20210722203407.3588046-1-djrscally@gmail.com>
 <20210722203407.3588046-13-djrscally@gmail.com>
 <CAHp75Vcmo8rD=WpECbKfpByBr1pAL+7gV2eycZ=3M+YDWUzOFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ara9KTqUovWeeIyE"
Content-Disposition: inline
In-Reply-To: <CAHp75Vcmo8rD=WpECbKfpByBr1pAL+7gV2eycZ=3M+YDWUzOFw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Ara9KTqUovWeeIyE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 23 Jul 21, 01:19, Andy Shevchenko wrote:
> On Thursday, July 22, 2021, Daniel Scally <djrscally@gmail.com> wrote:
>=20
> > There are a number of macros defined in this driver that aren't actually
> > used within it. There's a lot of macros defined in total, so removing t=
he
> > unused ones helps make it a bit less busy.
> >
> > Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > ---
> >
> > I wavered about including this, because it might be helpful for someone
> > adding
> > support for other features in the future to have these already defined,
> > but in
> > the end I thought it slightly better to be less busy.
>=20
> Exactly! I would leave the registers and bitfield definitions untouched as
> they play role of documentation. Of course even if you remove them, they
> will be in the history, but a) harder to access; b) adding new feature may
> introduce slightly different names for the same things.

I agree that it's better to keep them around. for the same reasons.

Cheers,

Paul

> >  drivers/media/i2c/ov8865.c | 137 +------------------------------------
> >  1 file changed, 1 insertion(+), 136 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> > index dca4db3039bb..9b38f2e16906 100644
> > --- a/drivers/media/i2c/ov8865.c
> > +++ b/drivers/media/i2c/ov8865.c
> > @@ -46,8 +46,6 @@
> >  #define OV8865_PLL_CTRL6_REG                   0x306
> >  #define OV8865_PLL_CTRL6_SYS_DIV(v)            (((v) - 1) & BIT(0))
> >
> > -#define OV8865_PLL_CTRL8_REG                   0x308
> > -#define OV8865_PLL_CTRL9_REG                   0x309
> >  #define OV8865_PLL_CTRLA_REG                   0x30a
> >  #define OV8865_PLL_CTRLA_PRE_DIV_HALF(v)       (((v) - 1) & BIT(0))
> >  #define OV8865_PLL_CTRLB_REG                   0x30b
> > @@ -60,41 +58,21 @@
> >  #define OV8865_PLL_CTRLE_SYS_DIV(v)            ((v) & GENMASK(2, 0))
> >  #define OV8865_PLL_CTRLF_REG                   0x30f
> >  #define OV8865_PLL_CTRLF_SYS_PRE_DIV(v)                (((v) - 1) &
> > GENMASK(3, 0))
> > -#define OV8865_PLL_CTRL10_REG                  0x310
> > -#define OV8865_PLL_CTRL11_REG                  0x311
> >  #define OV8865_PLL_CTRL12_REG                  0x312
> >  #define OV8865_PLL_CTRL12_PRE_DIV_HALF(v)      ((((v) - 1) << 4) &
> > BIT(4))
> >  #define OV8865_PLL_CTRL12_DAC_DIV(v)           (((v) - 1) & GENMASK(3,=
 0))
> >
> > -#define OV8865_PLL_CTRL1B_REG                  0x31b
> > -#define OV8865_PLL_CTRL1C_REG                  0x31c
> > -
> >  #define OV8865_PLL_CTRL1E_REG                  0x31e
> >  #define OV8865_PLL_CTRL1E_PLL1_NO_LAT          BIT(3)
> >
> > -#define OV8865_PAD_OEN0_REG                    0x3000
> > -
> > -#define OV8865_PAD_OEN2_REG                    0x3002
> > -
> > -#define OV8865_CLK_RST5_REG                    0x3005
> > -
> >  #define OV8865_CHIP_ID_HH_REG                  0x300a
> >  #define OV8865_CHIP_ID_HH_VALUE                        0x00
> >  #define OV8865_CHIP_ID_H_REG                   0x300b
> >  #define OV8865_CHIP_ID_H_VALUE                 0x88
> >  #define OV8865_CHIP_ID_L_REG                   0x300c
> >  #define OV8865_CHIP_ID_L_VALUE                 0x65
> > -#define OV8865_PAD_OUT2_REG                    0x300d
> > -
> > -#define OV8865_PAD_SEL2_REG                    0x3010
> > -#define OV8865_PAD_PK_REG                      0x3011
> > -#define OV8865_PAD_PK_DRIVE_STRENGTH_1X                (0 << 5)
> > -#define OV8865_PAD_PK_DRIVE_STRENGTH_2X                (1 << 5)
> > -#define OV8865_PAD_PK_DRIVE_STRENGTH_3X                (2 << 5)
> > -#define OV8865_PAD_PK_DRIVE_STRENGTH_4X                (3 << 5)
> >
> >  #define OV8865_PUMP_CLK_DIV_REG                        0x3015
> > -#define OV8865_PUMP_CLK_DIV_PUMP_N(v)          (((v) << 4) & GENMASK(6,
> > 4))
> >  #define OV8865_PUMP_CLK_DIV_PUMP_P(v)          ((v) & GENMASK(2, 0))
> >
> >  #define OV8865_MIPI_SC_CTRL0_REG               0x3018
> > @@ -102,21 +80,12 @@
> >                                                  GENMASK(7, 5))
> >  #define OV8865_MIPI_SC_CTRL0_MIPI_EN           BIT(4)
> >  #define OV8865_MIPI_SC_CTRL0_UNKNOWN           BIT(1)
> > -#define OV8865_MIPI_SC_CTRL0_LANES_PD_MIPI     BIT(0)
> > -#define OV8865_MIPI_SC_CTRL1_REG               0x3019
> > -#define OV8865_CLK_RST0_REG                    0x301a
> > -#define OV8865_CLK_RST1_REG                    0x301b
> > -#define OV8865_CLK_RST2_REG                    0x301c
> > -#define OV8865_CLK_RST3_REG                    0x301d
> > -#define OV8865_CLK_RST4_REG                    0x301e
> >
> >  #define OV8865_PCLK_SEL_REG                    0x3020
> >  #define OV8865_PCLK_SEL_PCLK_DIV_MASK          BIT(3)
> >  #define OV8865_PCLK_SEL_PCLK_DIV(v)            ((((v) - 1) << 3) & BIT=
(3))
> >
> > -#define OV8865_MISC_CTRL_REG                   0x3021
> >  #define OV8865_MIPI_SC_CTRL2_REG               0x3022
> > -#define OV8865_MIPI_SC_CTRL2_CLK_LANES_PD_MIPI BIT(1)
> >  #define OV8865_MIPI_SC_CTRL2_PD_MIPI_RST_SYNC  BIT(0)
> >
> >  #define OV8865_MIPI_BIT_SEL_REG                        0x3031
> > @@ -125,7 +94,6 @@
> >  #define OV8865_CLK_SEL0_PLL1_SYS_SEL(v)                (((v) << 7) &
> > BIT(7))
> >  #define OV8865_CLK_SEL1_REG                    0x3033
> >  #define OV8865_CLK_SEL1_MIPI_EOF               BIT(5)
> > -#define OV8865_CLK_SEL1_UNKNOWN                        BIT(2)
> >  #define OV8865_CLK_SEL1_PLL_SCLK_SEL_MASK      BIT(1)
> >  #define OV8865_CLK_SEL1_PLL_SCLK_SEL(v)                (((v) << 1) &
> > BIT(1))
> >
> > @@ -142,7 +110,6 @@
> >  #define OV8865_EXPOSURE_CTRL_H(v)              (((v) & GENMASK(15, 8))=
 >>
> > 8)
> >  #define OV8865_EXPOSURE_CTRL_L_REG             0x3502
> >  #define OV8865_EXPOSURE_CTRL_L(v)              ((v) & GENMASK(7, 0))
> > -#define OV8865_EXPOSURE_GAIN_MANUAL_REG                0x3503
> >
> >  #define OV8865_GAIN_CTRL_H_REG                 0x3508
> >  #define OV8865_GAIN_CTRL_H(v)                  (((v) & GENMASK(12, 8))=
 >>
> > 8)
> > @@ -197,18 +164,6 @@
> >  #define OV8865_INC_X_ODD(v)                    ((v) & GENMASK(4, 0))
> >  #define OV8865_INC_X_EVEN_REG                  0x3815
> >  #define OV8865_INC_X_EVEN(v)                   ((v) & GENMASK(4, 0))
> > -#define OV8865_VSYNC_START_H_REG               0x3816
> > -#define OV8865_VSYNC_START_H(v)                        (((v) &
> > GENMASK(15, 8)) >> 8)
> > -#define OV8865_VSYNC_START_L_REG               0x3817
> > -#define OV8865_VSYNC_START_L(v)                        ((v) & GENMASK(=
7,
> > 0))
> > -#define OV8865_VSYNC_END_H_REG                 0x3818
> > -#define OV8865_VSYNC_END_H(v)                  (((v) & GENMASK(15, 8))=
 >>
> > 8)
> > -#define OV8865_VSYNC_END_L_REG                 0x3819
> > -#define OV8865_VSYNC_END_L(v)                  ((v) & GENMASK(7, 0))
> > -#define OV8865_HSYNC_FIRST_H_REG               0x381a
> > -#define OV8865_HSYNC_FIRST_H(v)                        (((v) &
> > GENMASK(15, 8)) >> 8)
> > -#define OV8865_HSYNC_FIRST_L_REG               0x381b
> > -#define OV8865_HSYNC_FIRST_L(v)                        ((v) & GENMASK(=
7,
> > 0))
> >
> >  #define OV8865_FORMAT1_REG                     0x3820
> >  #define OV8865_FORMAT1_FLIP_VERT_ISP_EN                BIT(2)
> > @@ -240,10 +195,6 @@
> >  #define OV8865_AUTO_SIZE_CTRL_CROP_END_X_REG   BIT(2)
> >  #define OV8865_AUTO_SIZE_CTRL_CROP_START_Y_REG BIT(1)
> >  #define OV8865_AUTO_SIZE_CTRL_CROP_START_X_REG BIT(0)
> > -#define OV8865_AUTO_SIZE_X_OFFSET_H_REG                0x3842
> > -#define OV8865_AUTO_SIZE_X_OFFSET_L_REG                0x3843
> > -#define OV8865_AUTO_SIZE_Y_OFFSET_H_REG                0x3844
> > -#define OV8865_AUTO_SIZE_Y_OFFSET_L_REG                0x3845
> >  #define OV8865_AUTO_SIZE_BOUNDARIES_REG                0x3846
> >  #define OV8865_AUTO_SIZE_BOUNDARIES_Y(v)       (((v) << 4) & GENMASK(7,
> > 4))
> >  #define OV8865_AUTO_SIZE_BOUNDARIES_X(v)       ((v) & GENMASK(3, 0))
> > @@ -259,30 +210,10 @@
> >  #define OV8865_BLC_CTRL0_TRIG_FORMAT_EN                BIT(6)
> >  #define OV8865_BLC_CTRL0_TRIG_GAIN_EN          BIT(5)
> >  #define OV8865_BLC_CTRL0_TRIG_EXPOSURE_EN      BIT(4)
> > -#define OV8865_BLC_CTRL0_TRIG_MANUAL_EN                BIT(3)
> > -#define OV8865_BLC_CTRL0_FREEZE_EN             BIT(2)
> > -#define OV8865_BLC_CTRL0_ALWAYS_EN             BIT(1)
> >  #define OV8865_BLC_CTRL0_FILTER_EN             BIT(0)
> >  #define OV8865_BLC_CTRL1_REG                   0x4001
> > -#define OV8865_BLC_CTRL1_DITHER_EN             BIT(7)
> > -#define OV8865_BLC_CTRL1_ZERO_LINE_DIFF_EN     BIT(6)
> > -#define OV8865_BLC_CTRL1_COL_SHIFT_256         (0 << 4)
> >  #define OV8865_BLC_CTRL1_COL_SHIFT_128         (1 << 4)
> > -#define OV8865_BLC_CTRL1_COL_SHIFT_64          (2 << 4)
> > -#define OV8865_BLC_CTRL1_COL_SHIFT_32          (3 << 4)
> >  #define OV8865_BLC_CTRL1_OFFSET_LIMIT_EN       BIT(2)
> > -#define OV8865_BLC_CTRL1_COLUMN_CANCEL_EN      BIT(1)
> > -#define OV8865_BLC_CTRL2_REG                   0x4002
> > -#define OV8865_BLC_CTRL3_REG                   0x4003
> > -#define OV8865_BLC_CTRL4_REG                   0x4004
> > -#define OV8865_BLC_CTRL5_REG                   0x4005
> > -#define OV8865_BLC_CTRL6_REG                   0x4006
> > -#define OV8865_BLC_CTRL7_REG                   0x4007
> > -#define OV8865_BLC_CTRL8_REG                   0x4008
> > -#define OV8865_BLC_CTRL9_REG                   0x4009
> > -#define OV8865_BLC_CTRLA_REG                   0x400a
> > -#define OV8865_BLC_CTRLB_REG                   0x400b
> > -#define OV8865_BLC_CTRLC_REG                   0x400c
> >  #define OV8865_BLC_CTRLD_REG                   0x400d
> >  #define OV8865_BLC_CTRLD_OFFSET_TRIGGER(v)     ((v) & GENMASK(7, 0))
> >
> > @@ -337,66 +268,8 @@
> >
> >  /* MIPI */
> >
> > -#define OV8865_MIPI_CTRL0_REG                  0x4800
> > -#define OV8865_MIPI_CTRL1_REG                  0x4801
> > -#define OV8865_MIPI_CTRL2_REG                  0x4802
> > -#define OV8865_MIPI_CTRL3_REG                  0x4803
> > -#define OV8865_MIPI_CTRL4_REG                  0x4804
> > -#define OV8865_MIPI_CTRL5_REG                  0x4805
> > -#define OV8865_MIPI_CTRL6_REG                  0x4806
> > -#define OV8865_MIPI_CTRL7_REG                  0x4807
> > -#define OV8865_MIPI_CTRL8_REG                  0x4808
> > -
> > -#define OV8865_MIPI_FCNT_MAX_H_REG             0x4810
> > -#define OV8865_MIPI_FCNT_MAX_L_REG             0x4811
> > -
> > -#define OV8865_MIPI_CTRL13_REG                 0x4813
> > -#define OV8865_MIPI_CTRL14_REG                 0x4814
> > -#define OV8865_MIPI_CTRL15_REG                 0x4815
> > -#define OV8865_MIPI_EMBEDDED_DT_REG            0x4816
> > -
> > -#define OV8865_MIPI_HS_ZERO_MIN_H_REG          0x4818
> > -#define OV8865_MIPI_HS_ZERO_MIN_L_REG          0x4819
> > -#define OV8865_MIPI_HS_TRAIL_MIN_H_REG         0x481a
> > -#define OV8865_MIPI_HS_TRAIL_MIN_L_REG         0x481b
> > -#define OV8865_MIPI_CLK_ZERO_MIN_H_REG         0x481c
> > -#define OV8865_MIPI_CLK_ZERO_MIN_L_REG         0x481d
> > -#define OV8865_MIPI_CLK_PREPARE_MAX_REG                0x481e
> > -#define OV8865_MIPI_CLK_PREPARE_MIN_REG                0x481f
> > -#define OV8865_MIPI_CLK_POST_MIN_H_REG         0x4820
> > -#define OV8865_MIPI_CLK_POST_MIN_L_REG         0x4821
> > -#define OV8865_MIPI_CLK_TRAIL_MIN_H_REG                0x4822
> > -#define OV8865_MIPI_CLK_TRAIL_MIN_L_REG                0x4823
> > -#define OV8865_MIPI_LPX_P_MIN_H_REG            0x4824
> > -#define OV8865_MIPI_LPX_P_MIN_L_REG            0x4825
> > -#define OV8865_MIPI_HS_PREPARE_MIN_REG         0x4826
> > -#define OV8865_MIPI_HS_PREPARE_MAX_REG         0x4827
> > -#define OV8865_MIPI_HS_EXIT_MIN_H_REG          0x4828
> > -#define OV8865_MIPI_HS_EXIT_MIN_L_REG          0x4829
> > -#define OV8865_MIPI_UI_HS_ZERO_MIN_REG         0x482a
> > -#define OV8865_MIPI_UI_HS_TRAIL_MIN_REG                0x482b
> > -#define OV8865_MIPI_UI_CLK_ZERO_MIN_REG                0x482c
> > -#define OV8865_MIPI_UI_CLK_PREPARE_REG         0x482d
> > -#define OV8865_MIPI_UI_CLK_POST_MIN_REG                0x482e
> > -#define OV8865_MIPI_UI_CLK_TRAIL_MIN_REG       0x482f
> > -#define OV8865_MIPI_UI_LPX_P_MIN_REG           0x4830
> > -#define OV8865_MIPI_UI_HS_PREPARE_REG          0x4831
> > -#define OV8865_MIPI_UI_HS_EXIT_MIN_REG         0x4832
> > -#define OV8865_MIPI_PKT_START_SIZE_REG         0x4833
> > -
> >  #define OV8865_MIPI_PCLK_PERIOD_REG            0x4837
> > -#define OV8865_MIPI_LP_GPIO0_REG               0x4838
> > -#define OV8865_MIPI_LP_GPIO1_REG               0x4839
> > -
> > -#define OV8865_MIPI_CTRL3C_REG                 0x483c
> > -#define OV8865_MIPI_LP_GPIO4_REG               0x483d
> > -
> > -#define OV8865_MIPI_CTRL4A_REG                 0x484a
> > -#define OV8865_MIPI_CTRL4B_REG                 0x484b
> > -#define OV8865_MIPI_CTRL4C_REG                 0x484c
> > -#define OV8865_MIPI_LANE_TEST_PATTERN_REG      0x484d
> > -#define OV8865_MIPI_FRAME_END_DELAY_REG                0x484e
> > -#define OV8865_MIPI_CLOCK_TEST_PATTERN_REG     0x484f
> > +
> >  #define OV8865_MIPI_LANE_SEL01_REG             0x4850
> >  #define OV8865_MIPI_LANE_SEL01_LANE0(v)                (((v) << 0) &
> > GENMASK(2, 0))
> >  #define OV8865_MIPI_LANE_SEL01_LANE1(v)                (((v) << 4) &
> > GENMASK(6, 4))
> > @@ -407,7 +280,6 @@
> >  /* ISP */
> >
> >  #define OV8865_ISP_CTRL0_REG                   0x5000
> > -#define OV8865_ISP_CTRL0_LENC_EN               BIT(7)
> >  #define OV8865_ISP_CTRL0_WHITE_BALANCE_EN      BIT(4)
> >  #define OV8865_ISP_CTRL0_DPC_BLACK_EN          BIT(2)
> >  #define OV8865_ISP_CTRL0_DPC_WHITE_EN          BIT(1)
> > @@ -416,17 +288,11 @@
> >  #define OV8865_ISP_CTRL2_REG                   0x5002
> >  #define OV8865_ISP_CTRL2_DEBUG                 BIT(3)
> >  #define OV8865_ISP_CTRL2_VARIOPIXEL_EN         BIT(2)
> > -#define OV8865_ISP_CTRL2_VSYNC_LATCH_EN                BIT(0)
> > -#define OV8865_ISP_CTRL3_REG                   0x5003
> >
> >  #define OV8865_ISP_GAIN_RED_H_REG              0x5018
> >  #define OV8865_ISP_GAIN_RED_H(v)               (((v) & GENMASK(13, 6))=
 >>
> > 6)
> >  #define OV8865_ISP_GAIN_RED_L_REG              0x5019
> >  #define OV8865_ISP_GAIN_RED_L(v)               ((v) & GENMASK(5, 0))
> > -#define OV8865_ISP_GAIN_GREEN_H_REG            0x501a
> > -#define OV8865_ISP_GAIN_GREEN_H(v)             (((v) & GENMASK(13, 6))=
 >>
> > 6)
> > -#define OV8865_ISP_GAIN_GREEN_L_REG            0x501b
> > -#define OV8865_ISP_GAIN_GREEN_L(v)             ((v) & GENMASK(5, 0))
> >  #define OV8865_ISP_GAIN_BLUE_H_REG             0x501c
> >  #define OV8865_ISP_GAIN_BLUE_H(v)              (((v) & GENMASK(13, 6))=
 >>
> > 6)
> >  #define OV8865_ISP_GAIN_BLUE_L_REG             0x501d
> > @@ -434,7 +300,6 @@
> >
> >  /* VarioPixel */
> >
> > -#define OV8865_VAP_CTRL0_REG                   0x5900
> >  #define OV8865_VAP_CTRL1_REG                   0x5901
> >  #define OV8865_VAP_CTRL1_HSUB_COEF(v)          ((((v) - 1) << 2) & \
> >                                                  GENMASK(3, 2))
> > --
> > 2.25.1
> >
> >
>=20
> --=20
> With Best Regards,
> Andy Shevchenko

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Ara9KTqUovWeeIyE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmD6dxUACgkQ3cLmz3+f
v9Hnywf/eSRncAotT1XSt6MA9PlOIIBdpHxbMUOmf0vXufZeFggXZJt9ZstPGaID
ibvRd2vBppBx7lw4eQ/ZPO+Zfp+cJsCtmnUTpGOGaoUmVqh2qpGwHYU19kB1mfb6
9z+jafBQpmzwEH/UZVrhOfkLM24K+Rahdqjgf8a9sr1oT+LC2kcxEo2DzQKN73Ii
ZNG3/pVquZaP7ZhAiZboRQ8J2b4Y359g4m2LbxggUrFjJQtHFxY7pH8t+flU1gPK
lkYnia9ZLc3XY95KmYumEy6iWANsa/h0DQTYXsBp5L3+5tyYNY0tqASzOUm6FVIf
2VUITIHv6UKJClJt84m7H7ilJCvF4g==
=g7F+
-----END PGP SIGNATURE-----

--Ara9KTqUovWeeIyE--
