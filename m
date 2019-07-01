Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E335B631
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 09:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfGAH5Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 03:57:16 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:57227 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfGAH5Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 03:57:16 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9996EE0009;
        Mon,  1 Jul 2019 07:57:04 +0000 (UTC)
Date:   Mon, 1 Jul 2019 09:58:17 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Message-ID: <20190701075817.i5onrydhxvacw4el@uno.localdomain>
References: <20190520201812.7937-1-marex@denx.de>
 <20190520201812.7937-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lplx7vbqnas2klla"
Content-Disposition: inline
In-Reply-To: <20190520201812.7937-2-marex@denx.de>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--lplx7vbqnas2klla
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Marek,
   long time due review, sorry about this.

On Mon, May 20, 2019 at 10:18:12PM +0200, Marek Vasut wrote:
> Add driver for the Intersil ISL7998x BT656-to-MIPI-CSI2 video decoder.

analog to CSI-2 or analog to BT.656 if you want to support both chip
versions.

> This chip supports 1/2/4 analog video inputs and converts them into
> 1/2/4 VCs in MIPI CSI2 stream.
>
> This driver currently supports ISL79987 and both 720x480 and 720x576
> resolutions, however as per specification, all inputs must use the
> same resolution and standard. The only supported pixel format is now
> YUYV/YUV422. The chip should support RGB565 on the CSI2 as well, but

it's a media bus format, just mention YUYV

> this is currently unsupported.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> To: linux-media@vger.kernel.org
> ---
>  drivers/media/i2c/Kconfig    |    6 +
>  drivers/media/i2c/Makefile   |    1 +
>  drivers/media/i2c/isl7998x.c | 1111 ++++++++++++++++++++++++++++++++++
>  3 files changed, 1118 insertions(+)
>  create mode 100644 drivers/media/i2c/isl7998x.c
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7793358ab8b3..af2ea08d6c59 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -929,6 +929,12 @@ config VIDEO_NOON010PC30
>  	help
>  	  This driver supports NOON010PC30 CIF camera from Siliconfile
>
> +config VIDEO_ISL7998X
> +	tristate "Intersil ISL7998x support"
> +	depends on I2C && VIDEO_V4L2

Don't you depend on OF too ?

> +	help
> +	  This driver supports Intersil ISL7998x BT656-to-MIPI-CSI2 bridge.

Please update this description as well as this chip is either CSI-2 or
BT.565, not both.

> +
>  source "drivers/media/i2c/m5mols/Kconfig"
>
>  config VIDEO_RJ54N1
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index d8ad9dad495d..a66f105a7bcc 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -113,6 +113,7 @@ obj-$(CONFIG_VIDEO_IMX258)	+= imx258.o
>  obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
>  obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
>  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
> +obj-$(CONFIG_VIDEO_ISL7998X)	+= isl7998x.o
>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
>
>  obj-$(CONFIG_SDR_MAX2175) += max2175.o
> diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> new file mode 100644
> index 000000000000..858e98d8b494
> --- /dev/null
> +++ b/drivers/media/i2c/isl7998x.c
> @@ -0,0 +1,1111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Intersil ISL7998x BT656-to-MIPI-CSI2 driver

Here as well.

> + *
> + * Copyright (C) 2018-2019 Marek Vasut <marex@denx.de>
> + */
> +#include <linux/videodev2.h>

Sorting inclusion alphabetically is always nice and help finding
duplicates.

> +#include <linux/delay.h>
> +#include <linux/gpio.h>
> +#include <linux/i2c.h>
> +#include <linux/log2.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/v4l2-mediabus.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-clk.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#define ISL7998x_WIDTH			720
> +#define ISL7998x_HEIGHT			480
> +#define ISL7998x_INPUTS			4
> +
> +#define V4L2_CID_TEST_PATTERN_COLOR	(V4L2_CID_USER_BASE | 0x1001)
> +#define V4L2_CID_TEST_PATTERN_CHANNELS	(V4L2_CID_USER_BASE | 0x1002)
> +#define V4L2_CID_TEST_PATTERN_BARS	(V4L2_CID_USER_BASE | 0x1003)
> +
> +#define ISL7998x_REG(page, reg)		(((page) << 8) | (reg))
> +
> +#define ISL7998x_REG_Pn_SIZE			256
> +#define ISL7998x_REG_Pn_BASE(n)			((n) * ISL7998x_REG_Pn_SIZE)
> +
> +#define ISL7998x_REG_Px_DEC_PAGE(page)		ISL7998x_REG((page), 0xff)
> +#define ISL7998x_REG_Px_DEC_PAGE_MASK		0xf
> +#define ISL7998x_REG_P0_PRODUCT_ID_CODE		ISL7998x_REG(0, 0x00)
> +#define ISL7998x_REG_P0_PRODUCT_REV_CODE	ISL7998x_REG(0, 0x01)
> +#define ISL7998x_REG_P0_SW_RESET_CTL		ISL7998x_REG(0, 0x02)
> +#define ISL7998x_REG_P0_IO_BUFFER_CTL		ISL7998x_REG(0, 0x03)
> +#define ISL7998x_REG_P0_IO_BUFFER_CTL_1_1	ISL7998x_REG(0, 0x04)
> +#define ISL7998x_REG_P0_IO_PAD_PULL_EN_CTL	ISL7998x_REG(0, 0x05)
> +#define ISL7998x_REG_P0_IO_BUFFER_CTL_1_2	ISL7998x_REG(0, 0x06)
> +#define ISL7998x_REG_P0_VIDEO_IN_CHAN_CTL	ISL7998x_REG(0, 0x07)
> +#define ISL7998x_REG_P0_CLK_CTL_1		ISL7998x_REG(0, 0x08)
> +#define ISL7998x_REG_P0_CLK_CTL_2		ISL7998x_REG(0, 0x09)
> +#define ISL7998x_REG_P0_CLK_CTL_3		ISL7998x_REG(0, 0x0a)
> +#define ISL7998x_REG_P0_CLK_CTL_4		ISL7998x_REG(0, 0x0b)
> +#define ISL7998x_REG_P0_MPP1_SYNC_CTL		ISL7998x_REG(0, 0x0c)
> +#define ISL7998x_REG_P0_MPP2_SYNC_CTL		ISL7998x_REG(0, 0x0d)
> +#define ISL7998x_REG_P0_IRQ_SYNC_CTL		ISL7998x_REG(0, 0x0e)
> +#define ISL7998x_REG_P0_INTERRUPT_STATUS	ISL7998x_REG(0, 0x10)
> +#define ISL7998x_REG_P0_CHAN_1_IRQ		ISL7998x_REG(0, 0x11)
> +#define ISL7998x_REG_P0_CHAN_2_IRQ		ISL7998x_REG(0, 0x12)
> +#define ISL7998x_REG_P0_CHAN_3_IRQ		ISL7998x_REG(0, 0x13)
> +#define ISL7998x_REG_P0_CHAN_4_IRQ		ISL7998x_REG(0, 0x14)
> +#define ISL7998x_REG_P0_SHORT_DIAG_IRQ		ISL7998x_REG(0, 0x15)
> +#define ISL7998x_REG_P0_CHAN_1_IRQ_EN		ISL7998x_REG(0, 0x16)
> +#define ISL7998x_REG_P0_CHAN_2_IRQ_EN		ISL7998x_REG(0, 0x17)
> +#define ISL7998x_REG_P0_CHAN_3_IRQ_EN		ISL7998x_REG(0, 0x18)
> +#define ISL7998x_REG_P0_CHAN_4_IRQ_EN		ISL7998x_REG(0, 0x19)
> +#define ISL7998x_REG_P0_SHORT_DIAG_IRQ_EN	ISL7998x_REG(0, 0x1a)
> +#define ISL7998x_REG_P0_CHAN_1_STATUS		ISL7998x_REG(0, 0x1b)
> +#define ISL7998x_REG_P0_CHAN_2_STATUS		ISL7998x_REG(0, 0x1c)
> +#define ISL7998x_REG_P0_CHAN_3_STATUS		ISL7998x_REG(0, 0x1d)
> +#define ISL7998x_REG_P0_CHAN_4_STATUS		ISL7998x_REG(0, 0x1e)
> +#define ISL7998x_REG_P0_SHORT_DIAG_STATUS	ISL7998x_REG(0, 0x1f)
> +#define ISL7998x_REG_P0_CLOCK_DELAY		ISL7998x_REG(0, 0x20)
> +
> +#define ISL7998x_REG_Px_DEC_INPUT_FMT(pg)	ISL7998x_REG((pg), 0x02)
> +#define ISL7998x_REG_Px_DEC_STATUS_1(pg)	ISL7998x_REG((pg), 0x03)
> +#define ISL7998x_REG_Px_DEC_HS_DELAY_CTL(pg)	ISL7998x_REG((pg), 0x04)
> +#define ISL7998x_REG_Px_DEC_ANCTL(pg)		ISL7998x_REG((pg), 0x06)
> +#define ISL7998x_REG_Px_DEC_CROP_HI(pg)		ISL7998x_REG((pg), 0x07)
> +#define ISL7998x_REG_Px_DEC_VDELAY_LO(pg)	ISL7998x_REG((pg), 0x08)
> +#define ISL7998x_REG_Px_DEC_VACTIVE_LO(pg)	ISL7998x_REG((pg), 0x09)
> +#define ISL7998x_REG_Px_DEC_HDELAY_LO(pg)	ISL7998x_REG((pg), 0x0a)
> +#define ISL7998x_REG_Px_DEC_HACTIVE_LO(pg)	ISL7998x_REG((pg), 0x0b)
> +#define ISL7998x_REG_Px_DEC_CNTRL1(pg)		ISL7998x_REG((pg), 0x0c)
> +#define ISL7998x_REG_Px_DEC_CSC_CTL(pg)		ISL7998x_REG((pg), 0x0d)
> +#define ISL7998x_REG_Px_DEC_BRIGHT(pg)		ISL7998x_REG((pg), 0x10)
> +#define ISL7998x_REG_Px_DEC_CONTRAST(pg)	ISL7998x_REG((pg), 0x11)
> +#define ISL7998x_REG_Px_DEC_SHARPNESS(pg)	ISL7998x_REG((pg), 0x12)
> +#define ISL7998x_REG_Px_DEC_SAT_U(pg)		ISL7998x_REG((pg), 0x13)
> +#define ISL7998x_REG_Px_DEC_SAT_V(pg)		ISL7998x_REG((pg), 0x14)
> +#define ISL7998x_REG_Px_DEC_HUE(pg)		ISL7998x_REG((pg), 0x15)
> +#define ISL7998x_REG_Px_DEC_VERT_PEAK(pg)	ISL7998x_REG((pg), 0x17)
> +#define ISL7998x_REG_Px_DEC_CORING(pg)		ISL7998x_REG((pg), 0x18)
> +#define ISL7998x_REG_Px_DEC_SDT(pg)		ISL7998x_REG((pg), 0x1c)
> +#define ISL7998x_REG_Px_DEC_SDT_DET		BIT(7)
> +#define ISL7998x_REG_Px_DEC_SDTR(pg)		ISL7998x_REG((pg), 0x1d)
> +#define ISL7998x_REG_Px_DEC_CLMPG(pg)		ISL7998x_REG((pg), 0x20)
> +#define ISL7998x_REG_Px_DEC_IAGC(pg)		ISL7998x_REG((pg), 0x21)
> +#define ISL7998x_REG_Px_DEC_AGCGAIN(pg)		ISL7998x_REG((pg), 0x22)
> +#define ISL7998x_REG_Px_DEC_PEAKWT(pg)		ISL7998x_REG((pg), 0x23)
> +#define ISL7998x_REG_Px_DEC_CLMPL(pg)		ISL7998x_REG((pg), 0x24)
> +#define ISL7998x_REG_Px_DEC_SYNCT(pg)		ISL7998x_REG((pg), 0x25)
> +#define ISL7998x_REG_Px_DEC_MISSCNT(pg)		ISL7998x_REG((pg), 0x26)
> +#define ISL7998x_REG_Px_DEC_PCLAMP(pg)		ISL7998x_REG((pg), 0x27)
> +#define ISL7998x_REG_Px_DEC_VERT_CTL_1(pg)	ISL7998x_REG((pg), 0x28)
> +#define ISL7998x_REG_Px_DEC_VERT_CTL_2(pg)	ISL7998x_REG((pg), 0x29)
> +#define ISL7998x_REG_Px_DEC_CLR_KILL_LVL(pg)	ISL7998x_REG((pg), 0x2a)
> +#define ISL7998x_REG_Px_DEC_COMB_FILTER_CTL(pg)	ISL7998x_REG((pg), 0x2b)
> +#define ISL7998x_REG_Px_DEC_LUMA_DELAY(pg)	ISL7998x_REG((pg), 0x2c)
> +#define ISL7998x_REG_Px_DEC_MISC1(pg)		ISL7998x_REG((pg), 0x2d)
> +#define ISL7998x_REG_Px_DEC_MISC2(pg)		ISL7998x_REG((pg), 0x2e)
> +#define ISL7998x_REG_Px_DEC_MISC3(pg)		ISL7998x_REG((pg), 0x2f)
> +#define ISL7998x_REG_Px_DEC_MVSN(pg)		ISL7998x_REG((pg), 0x30)
> +#define ISL7998x_REG_Px_DEC_CSTATUS2(pg)	ISL7998x_REG((pg), 0x31)
> +#define ISL7998x_REG_Px_DEC_HFREF(pg)		ISL7998x_REG((pg), 0x32)
> +#define ISL7998x_REG_Px_DEC_CLMD(pg)		ISL7998x_REG((pg), 0x33)
> +#define ISL7998x_REG_Px_DEC_ID_DET_CTL(pg)	ISL7998x_REG((pg), 0x34)
> +#define ISL7998x_REG_Px_DEC_CLCNTL(pg)		ISL7998x_REG((pg), 0x35)
> +#define ISL7998x_REG_Px_DEC_DIFF_CLMP_CTL_1(pg)	ISL7998x_REG((pg), 0x36)
> +#define ISL7998x_REG_Px_DEC_DIFF_CLMP_CTL_2(pg)	ISL7998x_REG((pg), 0x37)
> +#define ISL7998x_REG_Px_DEC_DIFF_CLMP_CTL_3(pg)	ISL7998x_REG((pg), 0x38)
> +#define ISL7998x_REG_Px_DEC_DIFF_CLMP_CTL_4(pg)	ISL7998x_REG((pg), 0x39)
> +#define ISL7998x_REG_Px_DEC_SHORT_DET_CTL(pg)	ISL7998x_REG((pg), 0x3a)
> +#define ISL7998x_REG_Px_DEC_SHORT_DET_CTL_1(pg)	ISL7998x_REG((pg), 0x3b)
> +#define ISL7998x_REG_Px_DEC_AFE_TST_MUX_CTL(pg)	ISL7998x_REG((pg), 0x3c)
> +#define ISL7998x_REG_Px_DEC_DATA_CONV(pg)	ISL7998x_REG((pg), 0x3d)
> +#define ISL7998x_REG_Px_DEC_INTERNAL_TEST(pg)	ISL7998x_REG((pg), 0x3f)
> +#define ISL7998x_REG_Px_DEC_H_DELAY_CTL(pg)	ISL7998x_REG((pg), 0x43)
> +#define ISL7998x_REG_Px_DEC_H_DELAY_II_HI(pg)	ISL7998x_REG((pg), 0x44)
> +#define ISL7998x_REG_Px_DEC_H_DELAY_II_LOW(pg)	ISL7998x_REG((pg), 0x45)
> +
> +#define ISL7998x_REG_Px_ACA_CTL_1(pg)		ISL7998x_REG((pg), 0x80)
> +#define ISL7998x_REG_Px_ACA_GAIN_CTL(pg)	ISL7998x_REG((pg), 0x81)
> +#define ISL7998x_REG_Px_ACA_Y_AVG_HI_LIMIT(pg)	ISL7998x_REG((pg), 0x82)
> +#define ISL7998x_REG_Px_ACA_Y_AVG_LO_LIMIT(pg)	ISL7998x_REG((pg), 0x83)
> +#define ISL7998x_REG_Px_ACA_Y_DET_THRESHOLD(pg)	ISL7998x_REG((pg), 0x84)
> +#define ISL7998x_REG_Px_ACA_BLACK_LVL(pg)	ISL7998x_REG((pg), 0x85)
> +#define ISL7998x_REG_Px_ACA_CENTER_LVL(pg)	ISL7998x_REG((pg), 0x86)
> +#define ISL7998x_REG_Px_ACA_WHITE_LVL(pg)	ISL7998x_REG((pg), 0x87)
> +#define ISL7998x_REG_Px_ACA_MEAN_OFF_LIMIT(pg)	ISL7998x_REG((pg), 0x88)
> +#define ISL7998x_REG_Px_ACA_MEAN_OFF_UPGAIN(pg)	ISL7998x_REG((pg), 0x89)
> +#define ISL7998x_REG_Px_ACA_MEAN_OFF_SLOPE(pg)	ISL7998x_REG((pg), 0x8a)
> +#define ISL7998x_REG_Px_ACA_MEAN_OFF_DNGAIN(pg)	ISL7998x_REG((pg), 0x8b)
> +#define ISL7998x_REG_Px_ACA_DELTA_CO_THRES(pg)	ISL7998x_REG((pg), 0x8c)
> +#define ISL7998x_REG_Px_ACA_DELTA_SLOPE(pg)	ISL7998x_REG((pg), 0x8d)
> +#define ISL7998x_REG_Px_ACA_LO_HI_AVG_THRES(pg)	ISL7998x_REG((pg), 0x8e)
> +#define ISL7998x_REG_Px_ACA_LO_MAX_LVL_CTL(pg)	ISL7998x_REG((pg), 0x8f)
> +#define ISL7998x_REG_Px_ACA_HI_MAX_LVL_CTL(pg)	ISL7998x_REG((pg), 0x90)
> +#define ISL7998x_REG_Px_ACA_LO_UPGAIN_CTL(pg)	ISL7998x_REG((pg), 0x91)
> +#define ISL7998x_REG_Px_ACA_LO_DNGAIN_CTL(pg)	ISL7998x_REG((pg), 0x92)
> +#define ISL7998x_REG_Px_ACA_HI_UPGAIN_CTL(pg)	ISL7998x_REG((pg), 0x93)
> +#define ISL7998x_REG_Px_ACA_HI_DNGAIN_CTL(pg)	ISL7998x_REG((pg), 0x94)
> +#define ISL7998x_REG_Px_ACA_LOPASS_FLT_COEF(pg)	ISL7998x_REG((pg), 0x95)
> +#define ISL7998x_REG_Px_ACA_PDF_INDEX(pg)	ISL7998x_REG((pg), 0x96)
> +#define ISL7998x_REG_Px_ACA_HIST_WIN_H_STT(pg)	ISL7998x_REG((pg), 0x97)
> +#define ISL7998x_REG_Px_ACA_HIST_WIN_H_SZ1(pg)	ISL7998x_REG((pg), 0x98)
> +#define ISL7998x_REG_Px_ACA_HIST_WIN_H_SZ2(pg)	ISL7998x_REG((pg), 0x99)
> +#define ISL7998x_REG_Px_ACA_HIST_WIN_V_STT(pg)	ISL7998x_REG((pg), 0x9a)
> +#define ISL7998x_REG_Px_ACA_HIST_WIN_V_SZ1(pg)	ISL7998x_REG((pg), 0x9b)
> +#define ISL7998x_REG_Px_ACA_HIST_WIN_V_SZ2(pg)	ISL7998x_REG((pg), 0x9c)
> +#define ISL7998x_REG_Px_ACA_Y_AVG(pg)		ISL7998x_REG((pg), 0xa0)
> +#define ISL7998x_REG_Px_ACA_Y_AVG_LIM(pg)	ISL7998x_REG((pg), 0xa1)
> +#define ISL7998x_REG_Px_ACA_LO_AVG(pg)		ISL7998x_REG((pg), 0xa2)
> +#define ISL7998x_REG_Px_ACA_HI_AVG(pg)		ISL7998x_REG((pg), 0xa3)
> +#define ISL7998x_REG_Px_ACA_Y_MAX(pg)		ISL7998x_REG((pg), 0xa4)
> +#define ISL7998x_REG_Px_ACA_Y_MIN(pg)		ISL7998x_REG((pg), 0xa5)
> +#define ISL7998x_REG_Px_ACA_MOFFSET(pg)		ISL7998x_REG((pg), 0xa6)
> +#define ISL7998x_REG_Px_ACA_LO_GAIN(pg)		ISL7998x_REG((pg), 0xa7)
> +#define ISL7998x_REG_Px_ACA_HI_GAIN(pg)		ISL7998x_REG((pg), 0xa8)
> +#define ISL7998x_REG_Px_ACA_LL_SLOPE(pg)	ISL7998x_REG((pg), 0xa9)
> +#define ISL7998x_REG_Px_ACA_LH_SLOPE(pg)	ISL7998x_REG((pg), 0xaa)
> +#define ISL7998x_REG_Px_ACA_HL_SLOPE(pg)	ISL7998x_REG((pg), 0xab)
> +#define ISL7998x_REG_Px_ACA_HH_SLOPE(pg)	ISL7998x_REG((pg), 0xac)
> +#define ISL7998x_REG_Px_ACA_X_LOW(pg)		ISL7998x_REG((pg), 0xad)
> +#define ISL7998x_REG_Px_ACA_X_MEAN(pg)		ISL7998x_REG((pg), 0xae)
> +#define ISL7998x_REG_Px_ACA_X_HIGH(pg)		ISL7998x_REG((pg), 0xaf)
> +#define ISL7998x_REG_Px_ACA_Y_LOW(pg)		ISL7998x_REG((pg), 0xb0)
> +#define ISL7998x_REG_Px_ACA_Y_MEAN(pg)		ISL7998x_REG((pg), 0xb1)
> +#define ISL7998x_REG_Px_ACA_Y_HIGH(pg)		ISL7998x_REG((pg), 0xb2)
> +#define ISL7998x_REG_Px_ACA_CTL_2(pg)		ISL7998x_REG((pg), 0xb3)
> +#define ISL7998x_REG_Px_ACA_CTL_3(pg)		ISL7998x_REG((pg), 0xb4)
> +#define ISL7998x_REG_Px_ACA_CTL_4(pg)		ISL7998x_REG((pg), 0xb5)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_HIST(pg)	ISL7998x_REG((pg), 0xc0)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_TL_H(pg)	ISL7998x_REG((pg), 0xc1)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_TL_L(pg)	ISL7998x_REG((pg), 0xc2)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_TL_H(pg)	ISL7998x_REG((pg), 0xc3)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_TL_L(pg)	ISL7998x_REG((pg), 0xc4)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_TR_H(pg)	ISL7998x_REG((pg), 0xc5)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_TR_L(pg)	ISL7998x_REG((pg), 0xc6)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_TR_H(pg)	ISL7998x_REG((pg), 0xc7)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_TR_L(pg)	ISL7998x_REG((pg), 0xc8)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_BL_H(pg)	ISL7998x_REG((pg), 0xc9)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_BL_L(pg)	ISL7998x_REG((pg), 0xca)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_BL_H(pg)	ISL7998x_REG((pg), 0xcb)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_BL_L(pg)	ISL7998x_REG((pg), 0xcc)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_BR_H(pg)	ISL7998x_REG((pg), 0xcd)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_BR_L(pg)	ISL7998x_REG((pg), 0xce)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_BR_H(pg)	ISL7998x_REG((pg), 0xcf)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_BR_L(pg)	ISL7998x_REG((pg), 0xd0)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_LM_H(pg)	ISL7998x_REG((pg), 0xd1)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_LM_L(pg)	ISL7998x_REG((pg), 0xd2)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_LM_H(pg)	ISL7998x_REG((pg), 0xd3)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_LM_L(pg)	ISL7998x_REG((pg), 0xd4)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_TM_H(pg)	ISL7998x_REG((pg), 0xd5)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_TM_L(pg)	ISL7998x_REG((pg), 0xd6)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_TM_H(pg)	ISL7998x_REG((pg), 0xd7)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_TM_L(pg)	ISL7998x_REG((pg), 0xd8)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_BM_H(pg)	ISL7998x_REG((pg), 0xd9)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_BM_L(pg)	ISL7998x_REG((pg), 0xda)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_BM_H(pg)	ISL7998x_REG((pg), 0xdb)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_BM_L(pg)	ISL7998x_REG((pg), 0xdc)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_RM_H(pg)	ISL7998x_REG((pg), 0xdd)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_X_RM_L(pg)	ISL7998x_REG((pg), 0xde)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_RM_H(pg)	ISL7998x_REG((pg), 0xdf)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_RM_L(pg)	ISL7998x_REG((pg), 0xe0)
> +#define ISL7998x_REG_Px_ACA_HIST_DATA_LO(pg)	ISL7998x_REG((pg), 0xe1)
> +#define ISL7998x_REG_Px_ACA_HIST_DATA_MID(pg)	ISL7998x_REG((pg), 0xe2)
> +#define ISL7998x_REG_Px_ACA_HIST_DATA_HI(pg)	ISL7998x_REG((pg), 0xe3)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_Y_CLR(pg)	ISL7998x_REG((pg), 0xe4)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_CB_CLR(pg)	ISL7998x_REG((pg), 0xe5)
> +#define ISL7998x_REG_Px_ACA_FLEX_WIN_CR_CLR(pg)	ISL7998x_REG((pg), 0xe6)
> +#define ISL7998x_REG_Px_ACA_XFER_HIST_HOST(pg)	ISL7998x_REG((pg), 0xe7)
> +
> +#define ISL7998x_REG_P5_LI_ENGINE_CTL		ISL7998x_REG(5, 0x00)
> +#define ISL7998x_REG_P5_LI_ENGINE_LINE_CTL	ISL7998x_REG(5, 0x01)
> +#define ISL7998x_REG_P5_LI_ENGINE_PIC_WIDTH	ISL7998x_REG(5, 0x02)
> +#define ISL7998x_REG_P5_LI_ENGINE_SYNC_CTL	ISL7998x_REG(5, 0x03)
> +#define ISL7998x_REG_P5_LI_ENGINE_VC_ASSIGNMENT	ISL7998x_REG(5, 0x04)
> +#define ISL7998x_REG_P5_LI_ENGINE_TYPE_CTL	ISL7998x_REG(5, 0x05)
> +#define ISL7998x_REG_P5_LI_ENGINE_FIFO_CTL	ISL7998x_REG(5, 0x06)
> +#define ISL7998x_REG_P5_MIPI_READ_START_CTL	ISL7998x_REG(5, 0x07)
> +#define ISL7998x_REG_P5_PSEUDO_FRM_FIELD_CTL	ISL7998x_REG(5, 0x08)
> +#define ISL7998x_REG_P5_ONE_FIELD_MODE_CTL	ISL7998x_REG(5, 0x09)
> +#define ISL7998x_REG_P5_MIPI_INT_HW_TST_CTR	ISL7998x_REG(5, 0x0a)
> +#define ISL7998x_REG_P5_TP_GEN_BAR_PATTERN	ISL7998x_REG(5, 0x0b)
> +#define ISL7998x_REG_P5_MIPI_PCNT_PSFRM		ISL7998x_REG(5, 0x0c)
> +#define ISL7998x_REG_P5_LI_ENGINE_TP_GEN_CTL	ISL7998x_REG(5, 0x0d)
> +#define ISL7998x_REG_P5_MIPI_VBLANK_PSFRM	ISL7998x_REG(5, 0x0e)
> +#define ISL7998x_REG_P5_LI_ENGINE_CTL_2		ISL7998x_REG(5, 0x0f)
> +#define ISL7998x_REG_P5_MIPI_WCNT_1		ISL7998x_REG(5, 0x10)
> +#define ISL7998x_REG_P5_MIPI_WCNT_2		ISL7998x_REG(5, 0x11)
> +#define ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_1	ISL7998x_REG(5, 0x12)
> +#define ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_2	ISL7998x_REG(5, 0x13)
> +#define ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_3	ISL7998x_REG(5, 0x14)
> +#define ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_4	ISL7998x_REG(5, 0x15)
> +#define ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_5	ISL7998x_REG(5, 0x16)
> +#define ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_6	ISL7998x_REG(5, 0x17)
> +#define ISL7998x_REG_P5_MIPI_DPHY_PARAMS_1	ISL7998x_REG(5, 0x18)
> +#define ISL7998x_REG_P5_MIPI_DPHY_SOT_PERIOD	ISL7998x_REG(5, 0x19)
> +#define ISL7998x_REG_P5_MIPI_DPHY_EOT_PERIOD	ISL7998x_REG(5, 0x1a)
> +#define ISL7998x_REG_P5_MIPI_DPHY_PARAMS_2	ISL7998x_REG(5, 0x1b)
> +#define ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_7	ISL7998x_REG(5, 0x1c)
> +#define ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_8	ISL7998x_REG(5, 0x1d)
> +#define ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_9	ISL7998x_REG(5, 0x1e)
> +#define ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_10	ISL7998x_REG(5, 0x1f)
> +#define ISL7998x_REG_P5_TP_GEN_MIPI		ISL7998x_REG(5, 0x20)
> +#define ISL7998x_REG_P5_ESC_MODE_TIME_CTL	ISL7998x_REG(5, 0x21)
> +#define ISL7998x_REG_P5_AUTO_TEST_ERR_DET	ISL7998x_REG(5, 0x22)
> +#define ISL7998x_REG_P5_MIPI_TIMING		ISL7998x_REG(5, 0x23)
> +#define ISL7998x_REG_P5_PIC_HEIGHT_HIGH		ISL7998x_REG(5, 0x24)
> +#define ISL7998x_REG_P5_PIC_HEIGHT_LOW		ISL7998x_REG(5, 0x25)
> +#define ISL7998x_REG_P5_MIPI_SP_HS_TRL_CTL	ISL7998x_REG(5, 0x26)
> +#define ISL7998x_REG_P5_FIFO_THRSH_CNT_1	ISL7998x_REG(5, 0x28)
> +#define ISL7998x_REG_P5_FIFO_THRSH_CNT_2	ISL7998x_REG(5, 0x29)
> +#define ISL7998x_REG_P5_TP_GEN_RND_SYNC_CTL_1	ISL7998x_REG(5, 0x2a)
> +#define ISL7998x_REG_P5_TP_GEN_RND_SYNC_CTL_2	ISL7998x_REG(5, 0x2b)
> +#define ISL7998x_REG_P5_PSF_FIELD_END_CTL_1	ISL7998x_REG(5, 0x2c)
> +#define ISL7998x_REG_P5_PSF_FIELD_END_CTL_2	ISL7998x_REG(5, 0x2d)
> +#define ISL7998x_REG_P5_PSF_FIELD_END_CTL_3	ISL7998x_REG(5, 0x2e)
> +#define ISL7998x_REG_P5_PSF_FIELD_END_CTL_4	ISL7998x_REG(5, 0x2f)
> +#define ISL7998x_REG_P5_MIPI_ANA_DATA_CTL_1	ISL7998x_REG(5, 0x30)
> +#define ISL7998x_REG_P5_MIPI_ANA_DATA_CTL_2	ISL7998x_REG(5, 0x31)
> +#define ISL7998x_REG_P5_MIPI_ANA_CLK_CTL	ISL7998x_REG(5, 0x32)
> +#define ISL7998x_REG_P5_PLL_ANA_STATUS		ISL7998x_REG(5, 0x33)
> +#define ISL7998x_REG_P5_PLL_ANA_MISC_CTL	ISL7998x_REG(5, 0x34)
> +#define ISL7998x_REG_P5_MIPI_ANA		ISL7998x_REG(5, 0x35)
> +#define ISL7998x_REG_P5_PLL_ANA			ISL7998x_REG(5, 0x36)
> +#define ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_1	ISL7998x_REG(5, 0x38)
> +#define ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_2	ISL7998x_REG(5, 0x39)
> +#define ISL7998x_REG_P5_H_LINE_CNT_1		ISL7998x_REG(5, 0x3a)
> +#define ISL7998x_REG_P5_H_LINE_CNT_2		ISL7998x_REG(5, 0x3b)
> +#define ISL7998x_REG_P5_HIST_LINE_CNT_1		ISL7998x_REG(5, 0x3c)
> +#define ISL7998x_REG_P5_HIST_LINE_CNT_2		ISL7998x_REG(5, 0x3d)

Not all the above definitions are used. While it doesn't hurt to have
them here, it's a pretty scary list of registers entries.

> +
> +static const struct reg_sequence isl7998x_init_seq_1[] = {
> +	{ ISL7998x_REG_P0_SHORT_DIAG_IRQ_EN, 0xff },
> +	{ ISL7998x_REG_Px_DEC_SDT(0x1), 0x07 },
> +	{ ISL7998x_REG_Px_DEC_SHORT_DET_CTL_1(0x1), 0x03 },
> +	{ ISL7998x_REG_Px_DEC_SDT(0x2), 0x07 },
> +	{ ISL7998x_REG_Px_DEC_SHORT_DET_CTL_1(0x2), 0x03 },
> +	{ ISL7998x_REG_Px_DEC_SDT(0x3), 0x07 },
> +	{ ISL7998x_REG_Px_DEC_SHORT_DET_CTL_1(0x3), 0x03 },
> +	{ ISL7998x_REG_Px_DEC_SDT(0x4), 0x07 },
> +	{ ISL7998x_REG_Px_DEC_SHORT_DET_CTL_1(0x4), 0x03 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_CTL, 0x00 },
> +	{ ISL7998x_REG_P0_SW_RESET_CTL, 0x1f, 10 },
> +	{ ISL7998x_REG_P0_IO_BUFFER_CTL, 0x00 },
> +	{ ISL7998x_REG_P0_MPP2_SYNC_CTL, 0xc9 },
> +	{ ISL7998x_REG_P0_IRQ_SYNC_CTL, 0xc9 },
> +	{ ISL7998x_REG_P0_CHAN_1_IRQ, 0x03 },
> +	{ ISL7998x_REG_P0_CHAN_2_IRQ, 0x00 },
> +	{ ISL7998x_REG_P0_CHAN_3_IRQ, 0x00 },
> +	{ ISL7998x_REG_P0_CHAN_4_IRQ, 0x00 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_CTL, 0x02 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_LINE_CTL, 0x85 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_PIC_WIDTH, 0xa0 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_SYNC_CTL, 0x18 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_TYPE_CTL, 0x40 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_FIFO_CTL, 0x40 },
> +	{ ISL7998x_REG_P5_MIPI_WCNT_1, 0x05 },
> +	{ ISL7998x_REG_P5_MIPI_WCNT_2, 0xa0 },
> +	{ ISL7998x_REG_P5_TP_GEN_MIPI, 0x00 },
> +	{ ISL7998x_REG_P5_ESC_MODE_TIME_CTL, 0x0c },
> +	{ ISL7998x_REG_P5_MIPI_SP_HS_TRL_CTL, 0x00 },
> +	{ ISL7998x_REG_P5_TP_GEN_RND_SYNC_CTL_1, 0x00 },
> +	{ ISL7998x_REG_P5_TP_GEN_RND_SYNC_CTL_2, 0x19 },
> +	{ ISL7998x_REG_P5_PSF_FIELD_END_CTL_1, 0x18 },
> +	{ ISL7998x_REG_P5_PSF_FIELD_END_CTL_2, 0xf1 },
> +	{ ISL7998x_REG_P5_PSF_FIELD_END_CTL_3, 0x00 },
> +	{ ISL7998x_REG_P5_PSF_FIELD_END_CTL_4, 0xf1 },
> +	{ ISL7998x_REG_P5_MIPI_ANA_DATA_CTL_1, 0x00 },
> +	{ ISL7998x_REG_P5_MIPI_ANA_DATA_CTL_2, 0x00 },
> +	{ ISL7998x_REG_P5_MIPI_ANA_CLK_CTL, 0x00 },
> +	{ ISL7998x_REG_P5_PLL_ANA_STATUS, 0xc0 },
> +	{ ISL7998x_REG_P5_PLL_ANA_MISC_CTL, 0x18 },
> +	{ ISL7998x_REG_P5_PLL_ANA, 0x00 },
> +	{ ISL7998x_REG_P0_SW_RESET_CTL, 0x10, 10 },
> +	/* Page 0xf means write to all of pages 1,2,3,4 */
> +	{ ISL7998x_REG_Px_DEC_VDELAY_LO(0xf), 0x14 },
> +	{ ISL7998x_REG_Px_DEC_MISC3(0xf), 0xe6 },
> +	{ ISL7998x_REG_Px_DEC_CLMD(0xf), 0x85 },
> +	{ ISL7998x_REG_Px_DEC_H_DELAY_II_LOW(0xf), 0x11 },
> +	{ ISL7998x_REG_Px_ACA_XFER_HIST_HOST(0xf), 0x00 },
> +	{ ISL7998x_REG_P0_CLK_CTL_1, 0x1f },
> +	{ ISL7998x_REG_P0_CLK_CTL_2, 0x43 },
> +	{ ISL7998x_REG_P0_CLK_CTL_3, 0x4f },
> +};
> +
> +static const struct reg_sequence isl7998x_init_seq_2[] = {

Is seq_2 alternative to the first? Care to comment a bit what these
do, if we have to live with register writes sequences?

> +	{ ISL7998x_REG_P5_LI_ENGINE_SYNC_CTL, 0x10 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_VC_ASSIGNMENT, 0xe4 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_TYPE_CTL, 0x00 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_FIFO_CTL, 0x60 },
> +	{ ISL7998x_REG_P5_MIPI_READ_START_CTL, 0x2b },
> +	{ ISL7998x_REG_P5_PSEUDO_FRM_FIELD_CTL, 0x02 },
> +	{ ISL7998x_REG_P5_ONE_FIELD_MODE_CTL, 0x00 },
> +	{ ISL7998x_REG_P5_MIPI_INT_HW_TST_CTR, 0x62 },
> +	{ ISL7998x_REG_P5_TP_GEN_BAR_PATTERN, 0x02 },
> +	{ ISL7998x_REG_P5_MIPI_PCNT_PSFRM, 0x36 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_TP_GEN_CTL, 0x00 },
> +	{ ISL7998x_REG_P5_MIPI_VBLANK_PSFRM, 0x6c },
> +	{ ISL7998x_REG_P5_LI_ENGINE_CTL_2, 0x00 },
> +	{ ISL7998x_REG_P5_MIPI_WCNT_1, 0x05 },
> +	{ ISL7998x_REG_P5_MIPI_WCNT_2, 0xa0 },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_1, 0x77 },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_2, 0x17 },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_3, 0x08 },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_4, 0x38 },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_5, 0x14 },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_6, 0xf6 },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_PARAMS_1, 0x00 },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_SOT_PERIOD, 0x17 },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_EOT_PERIOD, 0x0a },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_PARAMS_2, 0x71 },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_7, 0x7a },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_8, 0x0f },
> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_9, 0x8c },
> +	{ ISL7998x_REG_P5_MIPI_SP_HS_TRL_CTL, 0x08 },
> +	{ ISL7998x_REG_P5_FIFO_THRSH_CNT_1, 0x01 },
> +	{ ISL7998x_REG_P5_FIFO_THRSH_CNT_2, 0x0e },
> +	{ ISL7998x_REG_P5_TP_GEN_RND_SYNC_CTL_1, 0x00 },
> +	{ ISL7998x_REG_P5_TP_GEN_RND_SYNC_CTL_2, 0x00 },
> +	{ ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_1, 0x03 },
> +	{ ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_2, 0xc0 },
> +	{ ISL7998x_REG_P5_H_LINE_CNT_1, 0x06 },
> +	{ ISL7998x_REG_P5_H_LINE_CNT_2, 0xb3 },
> +	{ ISL7998x_REG_P5_HIST_LINE_CNT_1, 0x00 },
> +	{ ISL7998x_REG_P5_HIST_LINE_CNT_2, 0xf1 },
> +	{ ISL7998x_REG_P5_LI_ENGINE_FIFO_CTL, 0x00 },
> +	{ ISL7998x_REG_P5_MIPI_ANA, 0x00 },
> +	/*
> +	 * Wait a bit after reset so that the chip can capture a frame
> +	 * and update internal line counters.
> +	 */
> +	{ ISL7998x_REG_P0_SW_RESET_CTL, 0x00, 50 },
> +};
> +
> +struct isl7998x_datafmt {
> +	u32			code;
> +	enum v4l2_colorspace	colorspace;
> +};
> +
> +static const struct isl7998x_datafmt isl7998x_colour_fmts[] = {
> +	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_COLORSPACE_SRGB },

You set the colorspace to 0 in s/g_fmt, while you could simply
hardcode SRGB if you know that's the one the chip provides (which
seems reasonable).

> +};
> +
> +/* Menu items for LINK_FREQ V4L2 control */
> +static const s64 link_freq_menu_items[] = {
> +	108000000, 216000000, 432000000
> +};
> +
> +/* Menu items for TEST_PATTERN V4L2 control */
> +static const char * const isl7998x_test_pattern_menu[] = {
> +	"Disabled", "Enabled-PAL (720x576)", "Enabled-NTSC (720x480)"
> +};
> +
> +struct isl7998x {
> +	struct v4l2_subdev		subdev;
> +	struct regmap			*regmap;
> +	struct gpio_desc		*pd_gpio;
> +	unsigned int			nr_mipi_lanes;
> +	u32				nr_inputs;
> +
> +	unsigned int			width;
> +	unsigned int			height;
> +	const struct isl7998x_datafmt	*fmt;
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	struct media_pad		pad;
> +#endif
> +
> +	struct v4l2_ctrl_handler	ctrl_handler;
> +	struct mutex			ctrl_mutex;

it's common practice to state what a mutex protect if it's part of the
device structure. Care to do so?


> +	/* V4L2 Controls */
> +	struct v4l2_ctrl		*link_freq;
> +	u8				test_pattern_enabled;
> +	u8				test_pattern_bars;
> +	u8				test_pattern_chans;
> +	u8				test_pattern_color;
> +};
> +
> +static struct isl7998x *sd_to_isl7998x(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct isl7998x, subdev);
> +}
> +
> +static struct isl7998x *i2c_to_isl7998x(const struct i2c_client *client)
> +{
> +	return sd_to_isl7998x(i2c_get_clientdata(client));
> +}
> +
> +static int isl7998x_init(struct isl7998x *isl7998x)
> +{
> +	const unsigned int lanes = isl7998x->nr_mipi_lanes;
> +	const u32 isl7998x_video_in_chan_map[] = { 0x00, 0x11, 0x02, 0x02 };
> +	const struct reg_sequence isl7998x_init_seq_custom[] = {
> +		{ ISL7998x_REG_P0_VIDEO_IN_CHAN_CTL,
> +		  isl7998x_video_in_chan_map[isl7998x->nr_inputs - 1] },
> +		{ ISL7998x_REG_P0_CLK_CTL_4, (lanes == 1) ? 0x40 : 0x41 },
> +		{ ISL7998x_REG_P5_LI_ENGINE_CTL, (lanes == 1) ? 0x01 : 0x02 },
> +		{ ISL7998x_REG_P5_LI_ENGINE_LINE_CTL,
> +		  0x20 | ((isl7998x->width >> 7) & 0x1f) },
> +		{ ISL7998x_REG_P5_LI_ENGINE_PIC_WIDTH,
> +		  (isl7998x->width << 1) & 0xff },
> +	};
> +	struct regmap *regmap = isl7998x->regmap;
> +	int ret;
> +
> +	ret = regmap_register_patch(regmap, isl7998x_init_seq_1,
> +				      ARRAY_SIZE(isl7998x_init_seq_1));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_register_patch(regmap, isl7998x_init_seq_custom,
> +				      ARRAY_SIZE(isl7998x_init_seq_custom));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_register_patch(regmap, isl7998x_init_seq_2,
> +				      ARRAY_SIZE(isl7998x_init_seq_2));
> +}
> +
> +static int isl7998x_g_mbus_config(struct v4l2_subdev *sd,
> +				  struct v4l2_mbus_config *cfg)

g_mbus_configg (as well as s_mbus_config) is deprecated. Does your
bridge driver -really- need this? What platform is that?

> +{
> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> +
> +	cfg->type = V4L2_MBUS_CSI2_DPHY;
> +	cfg->flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> +	if (isl7998x->nr_mipi_lanes == 1)
> +		cfg->flags |= V4L2_MBUS_CSI2_1_LANE;
> +	else
> +		cfg->flags |= V4L2_MBUS_CSI2_2_LANE;
> +
> +	return 0;
> +}
> +
> +static int isl7998x_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> +
> +	return isl7998x_init(isl7998x);
> +}
> +
> +static int isl7998x_enum_mbus_code(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->pad || code->index >= ARRAY_SIZE(isl7998x_colour_fmts))
> +		return -EINVAL;
> +
> +	code->code = isl7998x_colour_fmts[code->index].code;
> +	return 0;
> +}
> +
> +static const unsigned int isl7998x_std_res[] = {
> +	480, 576, 576, 480, 480, 576, 480, 480
> +};
> +
> +static int isl7998x_update_std(struct isl7998x *isl7998x)
> +{
> +	unsigned int height[ISL7998x_INPUTS];
> +	u8 scanning = GENMASK(ISL7998x_INPUTS - 1, 0);
> +	unsigned int i;
> +	int ret;
> +	u32 reg;
> +
> +	while (true) {
> +		for (i = 0; i < ISL7998x_INPUTS; i++) {

Cycle on all inputs or just the active ones?

> +			ret = regmap_read(isl7998x->regmap,
> +					  ISL7998x_REG_Px_DEC_SDT(i + 1), &reg);
> +			if (ret)
> +				return ret;
> +
> +			/* Detection is still in progress, restart. */
> +			if (reg & ISL7998x_REG_Px_DEC_SDT_DET) {
> +				scanning = GENMASK(ISL7998x_INPUTS - 1, 0);
> +				break;
> +			}
> +
> +			scanning &= ~BIT(i);
> +			height[i] = isl7998x_std_res[(reg >> 4) & 0x7];
> +		}
> +
> +		if (!scanning)
> +			break;
> +
> +		mdelay(1);

mm, seems quite an arbitrary value here. Do you have a better
characterization in the manual, and could you use usleep_range() to
help the scheduler to coalesce wake-ups ?

> +	}
> +
> +	/*
> +	 * According to Renesas FAE, all input cameras must have the
> +	 * same standard on this chip.
> +	 */
> +	for (i = 1; i < isl7998x->nr_inputs ; i++)
> +		if (height[i - 1] != height[i])

What about width? Ah seems like only 720 is accepted.

> +			return -EINVAL;
> +
> +	isl7998x->height = height[0];
> +
> +	return 0;
> +}
> +
> +static int isl7998x_get_fmt(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_pad_config *cfg,
> +			    struct v4l2_subdev_format *format)
> +{
> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> +	struct v4l2_mbus_framefmt *mf = &format->format;
> +
> +	if (format->pad != 0)
> +		return -EINVAL;
> +
> +	if (isl7998x->test_pattern_enabled == 1) {
> +		mf->width	= 720;
> +		mf->height	= 576;
> +	} else if (isl7998x->test_pattern_enabled == 2) {
> +		mf->width	= 720;
> +		mf->height	= 480;
> +	} else {
> +		mf->width	= isl7998x->width;
> +		mf->height	= isl7998x->height;
> +	}
> +
> +	mf->code	= isl7998x->fmt->code;
> +	mf->field	= V4L2_FIELD_INTERLACED;
> +	mf->colorspace	= 0;
> +
> +	return 0;
> +}
> +
> +static int isl7998x_set_fmt(struct v4l2_subdev *sd,
> +		struct v4l2_subdev_pad_config *cfg,
> +		struct v4l2_subdev_format *format)
> +{
> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> +	struct v4l2_mbus_framefmt *mf = &format->format;
> +	int ret;
> +
> +	if (format->pad != 0)
> +		return -EINVAL;
> +
> +	if (format->format.width != 720 ||
> +	    (format->format.height != 480 && format->format.height != 576))
> +		return -EINVAL;
> +
> +	if (format->format.code != MEDIA_BUS_FMT_YUYV8_2X8)
> +		return -EINVAL;
> +
> +	mf->width	= format->format.width;
> +	mf->height	= format->format.height;
> +	mf->code	= format->format.code;
> +	mf->field	= V4L2_FIELD_INTERLACED;
> +	mf->colorspace	= 0;
> +
> +	if (format->which != V4L2_SUBDEV_FORMAT_TRY) {

Since you don't depend on VIDEO_V4L2_SUBDEV_API you might want to have
a look at how other drivers handle FORMAT_TRY when V4L2_SUBDEV_API is
not enabled. I know, it's not great :)

> +		ret = isl7998x_update_std(isl7998x);
> +		if (ret)
> +			return ret;
> +		mf->width = isl7998x->width;
> +		mf->height = isl7998x->height;
> +		isl7998x->fmt = &isl7998x_colour_fmts[0];
> +	}
> +
> +	return 0;
> +}
> +
> +static int isl7998x_set_test_pattern(struct isl7998x *isl7998x)
> +{
> +	const struct reg_sequence isl7998x_init_seq_tpg_off[] = {
> +		{ ISL7998x_REG_P5_LI_ENGINE_TP_GEN_CTL, 0 },
> +		{ ISL7998x_REG_P5_LI_ENGINE_CTL_2, 0 }
> +	};
> +	const struct reg_sequence isl7998x_init_seq_tpg_on[] = {
> +		{ ISL7998x_REG_P5_TP_GEN_BAR_PATTERN,
> +		  isl7998x->test_pattern_bars << 6 },
> +		{ ISL7998x_REG_P5_LI_ENGINE_CTL_2,
> +		  isl7998x->test_pattern_enabled == 1 ? BIT(2) : 0 },
> +		{ ISL7998x_REG_P5_LI_ENGINE_TP_GEN_CTL,
> +		  (isl7998x->test_pattern_chans << 4) |
> +		  (isl7998x->test_pattern_color << 2) }
> +	};
> +	struct regmap *regmap = isl7998x->regmap;
> +
> +	if (isl7998x->test_pattern_enabled) {
> +		return regmap_register_patch(regmap, isl7998x_init_seq_tpg_on,
> +					ARRAY_SIZE(isl7998x_init_seq_tpg_on));
> +	} else {
> +		return regmap_register_patch(regmap, isl7998x_init_seq_tpg_off,
> +					ARRAY_SIZE(isl7998x_init_seq_tpg_off));
> +	}
> +}
> +
> +static int isl7998x_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct isl7998x *isl7998x = container_of(ctrl->handler,
> +					       struct isl7998x, ctrl_handler);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN_BARS:
> +		isl7998x->test_pattern_bars = ctrl->val & 0x3;
> +		return isl7998x_set_test_pattern(isl7998x);
> +	case V4L2_CID_TEST_PATTERN_CHANNELS:
> +		isl7998x->test_pattern_chans = ctrl->val & 0xf;
> +		return isl7998x_set_test_pattern(isl7998x);
> +	case V4L2_CID_TEST_PATTERN_COLOR:
> +		isl7998x->test_pattern_color = ctrl->val & 0x3;
> +		return isl7998x_set_test_pattern(isl7998x);
> +	case V4L2_CID_TEST_PATTERN:
> +		isl7998x->test_pattern_enabled = !!ctrl->val;
> +		return isl7998x_set_test_pattern(isl7998x);
> +	}
> +
> +	return 0;
> +}
> +
> +static int isl7998x_get_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct isl7998x *isl7998x = container_of(ctrl->handler,
> +					       struct isl7998x, ctrl_handler);
> +
> +	v4l2_info(&isl7998x->subdev, "ctrl(id:0x%x,val:0x%x) is not handled\n",
> +		  ctrl->id, ctrl->val);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops isl7998x_subdev_video_ops = {
> +	.g_mbus_config	= isl7998x_g_mbus_config,
> +	.s_stream	= isl7998x_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops isl7998x_subdev_pad_ops = {
> +	.enum_mbus_code = isl7998x_enum_mbus_code,

Given the limited number of sizes you support, would you consider
adding .enum_frame_size support?

> +	.get_fmt	= isl7998x_get_fmt,
> +	.set_fmt	= isl7998x_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops isl7998x_subdev_ops = {
> +	.video		= &isl7998x_subdev_video_ops,
> +	.pad		= &isl7998x_subdev_pad_ops,
> +};
> +
> +static const struct media_entity_operations isl7998x_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static const struct v4l2_ctrl_ops isl7998x_ctrl_ops = {
> +	.s_ctrl			= isl7998x_set_ctrl,
> +	.g_volatile_ctrl	= isl7998x_get_ctrl,
> +};
> +
> +static const char * const isl7998x_test_pattern_bars[] = {
> +	"bbbbwb", "bbbwwb", "bbwbwb", "bbwwwb"
> +};
> +
> +static const char * const isl7998x_test_pattern_colors[] = {
> +	"Yellow", "Blue", "Green", "Pink"
> +};
> +
> +static const struct v4l2_ctrl_config isl7998x_ctrls[] = {
> +	{
> +		.ops		= &isl7998x_ctrl_ops,
> +		.id		= V4L2_CID_TEST_PATTERN_BARS,
> +		.type		= V4L2_CTRL_TYPE_MENU,
> +		.name		= "Test Pattern Bars",
> +		.max		= ARRAY_SIZE(isl7998x_test_pattern_bars) - 1,
> +		.def		= 0,
> +		.qmenu		= isl7998x_test_pattern_bars,
> +	}, {
> +		.ops		= &isl7998x_ctrl_ops,
> +		.id		= V4L2_CID_TEST_PATTERN_CHANNELS,
> +		.type		= V4L2_CTRL_TYPE_INTEGER,
> +		.name		= "Test Pattern Channels",
> +		.min		= 0,
> +		.max		= 0xf,
> +		.step		= 1,
> +		.def		= 0,
> +		.flags		= 0,
> +	}, {
> +		.ops		= &isl7998x_ctrl_ops,
> +		.id		= V4L2_CID_TEST_PATTERN_COLOR,
> +		.type		= V4L2_CTRL_TYPE_MENU,
> +		.name		= "Test Pattern Color",
> +		.max		= ARRAY_SIZE(isl7998x_test_pattern_colors) - 1,
> +		.def		= 0,
> +		.qmenu		= isl7998x_test_pattern_colors,
> +	},
> +};
> +
> +#define ISL7998x_REG_DECODER_ACA_READABLE_RANGE(page)			\
> +	/* Decoder range */						\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_INPUT_FMT(page),		\
> +			 ISL7998x_REG_Px_DEC_HS_DELAY_CTL(page)),	\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_ANCTL(page),		\
> +			 ISL7998x_REG_Px_DEC_CSC_CTL(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_BRIGHT(page),		\
> +			 ISL7998x_REG_Px_DEC_HUE(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_VERT_PEAK(page),		\
> +			 ISL7998x_REG_Px_DEC_CORING(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_SDT(page),			\
> +			 ISL7998x_REG_Px_DEC_SDTR(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_CLMPG(page),		\
> +			 ISL7998x_REG_Px_DEC_DATA_CONV(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_INTERNAL_TEST(page),	\
> +			 ISL7998x_REG_Px_DEC_INTERNAL_TEST(page)),	\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_H_DELAY_CTL(page),		\
> +			 ISL7998x_REG_Px_DEC_H_DELAY_II_LOW(page)),	\
> +	/* ACA range */							\
> +	regmap_reg_range(ISL7998x_REG_Px_ACA_CTL_1(page),		\
> +			 ISL7998x_REG_Px_ACA_HIST_WIN_V_SZ2(page)),	\
> +	regmap_reg_range(ISL7998x_REG_Px_ACA_Y_AVG(page),		\
> +			 ISL7998x_REG_Px_ACA_CTL_4(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_ACA_FLEX_WIN_HIST(page),	\
> +			 ISL7998x_REG_Px_ACA_XFER_HIST_HOST(page)),	\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(page),		\
> +			 ISL7998x_REG_Px_DEC_PAGE(page))
> +
> +#define ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(page)			\
> +	/* Decoder range */						\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_INPUT_FMT(page),		\
> +			 ISL7998x_REG_Px_DEC_INPUT_FMT(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_HS_DELAY_CTL(page),	\
> +			 ISL7998x_REG_Px_DEC_HS_DELAY_CTL(page)),	\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_ANCTL(page),		\
> +			 ISL7998x_REG_Px_DEC_CSC_CTL(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_BRIGHT(page),		\
> +			 ISL7998x_REG_Px_DEC_HUE(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_VERT_PEAK(page),		\
> +			 ISL7998x_REG_Px_DEC_CORING(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_SDT(page),			\
> +			 ISL7998x_REG_Px_DEC_SDTR(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_CLMPG(page),		\
> +			 ISL7998x_REG_Px_DEC_MISC3(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_CLMD(page),		\
> +			 ISL7998x_REG_Px_DEC_DATA_CONV(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_INTERNAL_TEST(page),	\
> +			 ISL7998x_REG_Px_DEC_INTERNAL_TEST(page)),	\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_H_DELAY_CTL(page),		\
> +			 ISL7998x_REG_Px_DEC_H_DELAY_II_LOW(page)),	\
> +	/* ACA range */							\
> +	regmap_reg_range(ISL7998x_REG_Px_ACA_CTL_1(page),		\
> +			 ISL7998x_REG_Px_ACA_HIST_WIN_V_SZ2(page)),	\
> +	regmap_reg_range(ISL7998x_REG_Px_ACA_CTL_2(page),		\
> +			 ISL7998x_REG_Px_ACA_CTL_4(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_ACA_FLEX_WIN_HIST(page),	\
> +			 ISL7998x_REG_Px_ACA_HIST_DATA_LO(page)),	\
> +	regmap_reg_range(ISL7998x_REG_Px_ACA_XFER_HIST_HOST(page),	\
> +			 ISL7998x_REG_Px_ACA_XFER_HIST_HOST(page)),	\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(page),		\
> +			 ISL7998x_REG_Px_DEC_PAGE(page))
> +
> +#define ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(page)			\
> +	/* Decoder range */						\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_STATUS_1(page),		\
> +			 ISL7998x_REG_Px_DEC_STATUS_1(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_SDT(page),			\
> +			 ISL7998x_REG_Px_DEC_SDT(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_MVSN(page),		\
> +			 ISL7998x_REG_Px_DEC_HFREF(page)),		\
> +	/* ACA range */							\
> +	regmap_reg_range(ISL7998x_REG_Px_ACA_Y_AVG(page),		\
> +			 ISL7998x_REG_Px_ACA_Y_HIGH(page)),		\
> +	regmap_reg_range(ISL7998x_REG_Px_ACA_HIST_DATA_LO(page),	\
> +			 ISL7998x_REG_Px_ACA_FLEX_WIN_CR_CLR(page))
> +
> +static const struct regmap_range isl7998x_readable_ranges[] = {
> +	regmap_reg_range(ISL7998x_REG_P0_PRODUCT_ID_CODE,
> +			 ISL7998x_REG_P0_IRQ_SYNC_CTL),
> +	regmap_reg_range(ISL7998x_REG_P0_INTERRUPT_STATUS,
> +			 ISL7998x_REG_P0_CLOCK_DELAY),
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(0),
> +			 ISL7998x_REG_Px_DEC_PAGE(0)),
> +
> +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(1),
> +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(2),
> +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(3),
> +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(4),
> +
> +	regmap_reg_range(ISL7998x_REG_P5_LI_ENGINE_CTL,
> +			 ISL7998x_REG_P5_MIPI_SP_HS_TRL_CTL),
> +	regmap_reg_range(ISL7998x_REG_P5_FIFO_THRSH_CNT_1,
> +			 ISL7998x_REG_P5_PLL_ANA),
> +	regmap_reg_range(ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_1,
> +			 ISL7998x_REG_P5_HIST_LINE_CNT_2),
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(5),
> +			 ISL7998x_REG_Px_DEC_PAGE(5)),
> +};
> +
> +static const struct regmap_range isl7998x_writeable_ranges[] = {
> +	regmap_reg_range(ISL7998x_REG_P0_SW_RESET_CTL,
> +			 ISL7998x_REG_P0_IRQ_SYNC_CTL),
> +	regmap_reg_range(ISL7998x_REG_P0_CHAN_1_IRQ,
> +			 ISL7998x_REG_P0_SHORT_DIAG_IRQ_EN),
> +	regmap_reg_range(ISL7998x_REG_P0_CLOCK_DELAY,
> +			 ISL7998x_REG_P0_CLOCK_DELAY),
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(0),
> +			 ISL7998x_REG_Px_DEC_PAGE(0)),
> +
> +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(1),
> +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(2),
> +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(3),
> +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(4),
> +
> +	regmap_reg_range(ISL7998x_REG_P5_LI_ENGINE_CTL,
> +			 ISL7998x_REG_P5_ESC_MODE_TIME_CTL),
> +	regmap_reg_range(ISL7998x_REG_P5_MIPI_SP_HS_TRL_CTL,
> +			 ISL7998x_REG_P5_PLL_ANA),
> +	regmap_reg_range(ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_1,
> +			 ISL7998x_REG_P5_HIST_LINE_CNT_2),
> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(5),
> +			 ISL7998x_REG_Px_DEC_PAGE(5)),
> +
> +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(0xf),
> +};
> +
> +static const struct regmap_range isl7998x_volatile_ranges[] = {
> +	regmap_reg_range(ISL7998x_REG_P0_MPP1_SYNC_CTL,
> +			 ISL7998x_REG_P0_IRQ_SYNC_CTL),
> +	regmap_reg_range(ISL7998x_REG_P0_INTERRUPT_STATUS,
> +			 ISL7998x_REG_P0_INTERRUPT_STATUS),
> +	regmap_reg_range(ISL7998x_REG_P0_CHAN_1_STATUS,
> +			 ISL7998x_REG_P0_SHORT_DIAG_STATUS),
> +
> +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(1),
> +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(2),
> +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(3),
> +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(4),
> +
> +	regmap_reg_range(ISL7998x_REG_P5_AUTO_TEST_ERR_DET,
> +			 ISL7998x_REG_P5_PIC_HEIGHT_LOW),
> +};
> +
> +static const struct regmap_access_table isl7998x_readable_table = {
> +	.yes_ranges = isl7998x_readable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(isl7998x_readable_ranges),
> +};
> +
> +static const struct regmap_access_table isl7998x_writeable_table = {
> +	.yes_ranges = isl7998x_writeable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(isl7998x_writeable_ranges),
> +};
> +
> +static const struct regmap_access_table isl7998x_volatile_table = {
> +	.yes_ranges = isl7998x_volatile_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(isl7998x_volatile_ranges),
> +};
> +
> +static const struct regmap_range_cfg isl7998x_ranges[] = {
> +	{
> +		.range_min	= ISL7998x_REG_Pn_BASE(0),
> +		.range_max	= ISL7998x_REG_Px_ACA_XFER_HIST_HOST(0xf),
> +		.selector_reg	= ISL7998x_REG_Px_DEC_PAGE(0),
> +		.selector_mask	= ISL7998x_REG_Px_DEC_PAGE_MASK,
> +		.window_start	= 0,
> +		.window_len	= 256,
> +	}
> +};
> +
> +static const struct regmap_config isl7998x_regmap = {
> +	.reg_bits	= 8,
> +	.val_bits	= 8,
> +	.max_register	= ISL7998x_REG_Px_ACA_XFER_HIST_HOST(0xf),
> +	.ranges		= isl7998x_ranges,
> +	.num_ranges	= ARRAY_SIZE(isl7998x_ranges),
> +	.rd_table	= &isl7998x_readable_table,
> +	.wr_table	= &isl7998x_writeable_table,
> +	.volatile_table	= &isl7998x_volatile_table,
> +	.cache_type	= REGCACHE_RBTREE,
> +};

regmap's great, but do you really need this, as it seems to me you
mostly write initialization tables at s_stream and init time and
that's it.

> +
> +static int isl7998x_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *did)
> +{
> +	struct device *dev = &client->dev;
> +	struct v4l2_fwnode_endpoint endpoint;
> +	struct device_node *ep;
> +	struct isl7998x *isl7998x;
> +	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> +	u32 chip_id;
> +	int i, ret;
> +
> +	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA);
> +	if (!ret) {
> +		dev_warn(&adapter->dev,
> +			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
> +		return -EIO;
> +	}
> +
> +	isl7998x = devm_kzalloc(dev, sizeof(*isl7998x), GFP_KERNEL);
> +	if (!isl7998x)
> +		return -ENOMEM;
> +
> +	/* Default to all four inputs active unless specified otherwise. */
> +	ret = of_property_read_u32(dev->of_node, "isil,num-inputs",
> +				   &isl7998x->nr_inputs);
> +	if (ret)
> +		isl7998x->nr_inputs = 4;
> +
> +	if (isl7998x->nr_inputs != 1 && isl7998x->nr_inputs != 2 &&
> +	    isl7998x->nr_inputs != 4) {
> +		dev_err(dev, "Invalid number of inputs selected in DT\n");
> +		return -EINVAL;
> +	}

Depending on the outcome of the discussion on bindings, this might
change to a DT parsing routine.

> +
> +	isl7998x->pd_gpio = devm_gpiod_get_optional(dev, "pd", GPIOD_OUT_HIGH);
> +	if (IS_ERR(isl7998x->pd_gpio)) {
> +		dev_err(dev, "Failed to retrieve/request PD GPIO: %ld\n",
> +			PTR_ERR(isl7998x->pd_gpio));
> +		return PTR_ERR(isl7998x->pd_gpio);
> +	}
> +
> +	isl7998x->regmap = devm_regmap_init_i2c(client, &isl7998x_regmap);
> +	if (IS_ERR(isl7998x->regmap)) {
> +		ret = PTR_ERR(isl7998x->regmap);
> +		dev_err(dev, "Failed to allocate register map: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	if (!ep) {
> +		dev_err(dev, "Missing endpoint node\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &endpoint);
> +	of_node_put(ep);
> +	if (ret) {
> +		dev_err(dev, "Failed to parse endpoint\n");
> +		return ret;
> +	}
> +
> +	if (endpoint.bus_type != V4L2_MBUS_CSI2_DPHY ||
> +	    endpoint.bus.mipi_csi2.num_data_lanes == 0 ||
> +	    endpoint.bus.mipi_csi2.num_data_lanes > 2) {
> +		dev_err(dev, "Invalid bus type or number of MIPI lanes\n");
> +		return -EINVAL;
> +	}
> +
> +	isl7998x->nr_mipi_lanes = endpoint.bus.mipi_csi2.num_data_lanes;
> +
> +	v4l2_i2c_subdev_init(&isl7998x->subdev, client, &isl7998x_subdev_ops);
> +	isl7998x->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;

The subdevice has a devnode in userspace, do you want to depend on
VIDEO_V4L2_SUBDEV_API to allow userspace to control the subdevice?

> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	isl7998x->pad.flags = MEDIA_PAD_FL_SOURCE;

Again, depending on the outcome of the bindings discussion, the number
and nature of pads could change.

> +	isl7998x->subdev.entity.ops = &isl7998x_entity_ops;
> +	isl7998x->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;

Is this a sensor? I would have used IF_BRIDGE (or more appropriate
ones if you find them) but not sensor.

> +	ret = media_entity_pads_init(&isl7998x->subdev.entity, 1,
> +				     &isl7998x->pad);
> +	if (ret < 0)
> +		return ret;
> +#endif
> +
> +	isl7998x->width = ISL7998x_WIDTH;
> +	isl7998x->height = ISL7998x_HEIGHT;
> +	isl7998x->fmt = &isl7998x_colour_fmts[0];
> +
> +	ret = v4l2_ctrl_handler_init(&isl7998x->ctrl_handler,
> +				     2 + ARRAY_SIZE(isl7998x_ctrls));
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&isl7998x->ctrl_mutex);
> +	isl7998x->ctrl_handler.lock = &isl7998x->ctrl_mutex;
> +	isl7998x->link_freq = v4l2_ctrl_new_int_menu(&isl7998x->ctrl_handler,
> +				&isl7998x_ctrl_ops, V4L2_CID_LINK_FREQ,
> +				ARRAY_SIZE(link_freq_menu_items) - 1,
> +				endpoint.bus.mipi_csi2.num_data_lanes == 2 ?
> +				1 : 0, link_freq_menu_items);
> +	isl7998x->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	for (i = 0; i < ARRAY_SIZE(isl7998x_ctrls); i++) {
> +		v4l2_ctrl_new_custom(&isl7998x->ctrl_handler,
> +				     &isl7998x_ctrls[i], NULL);
> +	}
> +
> +	v4l2_ctrl_new_std_menu_items(&isl7998x->ctrl_handler,
> +				&isl7998x_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +				ARRAY_SIZE(isl7998x_test_pattern_menu) - 1,
> +				0, 0, isl7998x_test_pattern_menu);
> +

Before registering the handler please check if ctrl_handler.error
reports if anything  has failed.

> +	isl7998x->subdev.ctrl_handler = &isl7998x->ctrl_handler;
> +
> +	isl7998x->subdev.dev = dev;

v4l2_i2c_subdev_init does this for you. Doesn't hurt though.

> +	ret = v4l2_async_register_subdev(&isl7998x->subdev);
> +	if (ret < 0)
> +		goto err_entity_cleanup;
> +
> +	/*
> +	 * Turn the chip ON and keep it ON, otherwise the camera standard
> +	 * detection takes about 600 mS every time we do VIDIOC_G_FMT.
> +	 */

ouch. do you need to query the HW at G_FMT time? Can't you cache the
lastly applied format and return it without having to keep the chip
on? The same for s_fmt, if the device is powered off, cache the format
and apply at s_stream time. Is this possible with this device?

(Now that I've read the rest of the driver, yes, you cache the format
at g_fmt time, but you apply it at s_fmt time. Can this be post-poned
to s_stream and let the chip power off? Also, the usage of runtime_pm is
encouraged)

> +	if (isl7998x->pd_gpio)
> +		gpiod_set_value(isl7998x->pd_gpio, 0);
> +
> +	ret = regmap_read(isl7998x->regmap, ISL7998x_REG_P0_PRODUCT_ID_CODE,
> +			  &chip_id);
> +	if (ret) {
> +		dev_err(dev, "Failed to read ID register: %d\n", ret);
> +		goto err_init_cleanup;
> +	}
> +
> +	dev_info(dev, "ISL7998x found (id=%x)\n", chip_id);
> +
> +	ret = isl7998x_init(isl7998x);
> +	if (ret)
> +		goto err_init_cleanup;
> +
> +	ret = isl7998x_update_std(isl7998x);
> +	if (ret)
> +		goto err_init_cleanup;
> +
> +	return 0;
> +
> +err_init_cleanup:
> +	if (isl7998x->pd_gpio)
> +		gpiod_set_value(isl7998x->pd_gpio, 1);
> +err_entity_cleanup:
> +#ifdef CONFIG_MEDIA_CONTROLLER

media_entity_cleanup() is already protected and resolve to a nop if
CONFIG_MEDIA_CONTROLLER is not defined.

> +	media_entity_cleanup(&isl7998x->subdev.entity);
> +#endif

Empty line before return is always nice to have :)

> +	return ret;
> +}
> +
> +static int isl7998x_remove(struct i2c_client *client)
> +{
> +	struct isl7998x *isl7998x = i2c_to_isl7998x(client);
> +
> +	if (isl7998x->pd_gpio)
> +		gpiod_set_value(isl7998x->pd_gpio, 1);
> +	v4l2_async_unregister_subdev(&isl7998x->subdev);
> +	v4l2_ctrl_handler_free(isl7998x->subdev.ctrl_handler);
> +	media_entity_cleanup(&isl7998x->subdev.entity);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id isl7998x_of_match[] = {
> +	{ .compatible = "isil,isl79987", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, isl7998x_of_match);
> +
> +static const struct i2c_device_id isl7998x_id[] = {
> +	{ "isl79987", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, isl7998x_id);
> +
> +static struct i2c_driver isl7998x_i2c_driver = {
> +	.driver = {
> +		.name = "isl7998x",
> +		.of_match_table = of_match_ptr(isl7998x_of_match),
> +	},
> +	.probe		= isl7998x_probe,

As you don't you use the second argument of the probe function, you
can use .probe_new and drop the i2c_device_id table from the driver.

> +	.remove		= isl7998x_remove,
> +	.id_table	= isl7998x_id,
> +};
> +
> +module_i2c_driver(isl7998x_i2c_driver);
> +
> +MODULE_DESCRIPTION("Intersil ISL7998x BT656-to-MIPI-CSI2 driver");
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_LICENSE("GPL");

This doesn't match the SPDX header.

Again, sorry for the late review!

Cheers
  j

> --
> 2.20.1
>
>

--lplx7vbqnas2klla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0ZvRQACgkQcjQGjxah
VjzRZxAAofC+WFNOfeRXr2r9GW6/P43ubStBgMFXTXHh24DSnbv1yaBvqpLPPN6J
lSGkra3fC8Rk5FeQHPpSdps2jTSD8QNlXslaUu/pRKr2YdgWoQAiSV1oOy+QCAtI
uf/kGuNbjnH0bCDvt7hYtp3OSX/+ZclCwbz4VstuW40n3GzgP+zfnMXMbf+BbCdP
SmKdpAiEHFYDS+9bdz+vON8WF6vDxpL1unmNfg3ZPNPsoFAwJdeh6+tJuRpdcQwi
cBTJwKhtuBWbsZXhdQMY74IWR15oxW9nBrd3TXim6yCiujdm77i14unnHUhdHIRQ
IunIH4r4U9R+cMocZr8i0gI2PjS0FW7viHoxHO3JSZIQ42hNq97nhcTTJ982O51S
KBon/grjAxHEvBJ5DHxoailLykoSq4Fern7ByMB9uAd6xlsxki2FI2HqLt9+KRof
c6+Vv+nl1cK4w4qEQIKORuRE2xvkNYJOf6JaCPnb1oAlCDW4B+3QbdQxaLY3ffs6
nXoSVTu7g9nE+XBm/b1FMuCtpMzPn8tx+GyyOPkch/NJwigvX128aS+G6ptUzLdg
G+aoCb2SITHGEkXbjScd0mIqWN1CaWs+a8Qah5evnNBY3wyZP8AXQgSCswxVgr1Y
FYQKzBs62UvbbU5kS0L7BCmGpEoRzrGZEbM99TJQiC2VSzhEBM8=
=gMkg
-----END PGP SIGNATURE-----

--lplx7vbqnas2klla--
