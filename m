Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347EF3CAEBB
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 23:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbhGOVu7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 17:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhGOVu5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 17:50:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF7EC06175F;
        Thu, 15 Jul 2021 14:48:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE6E1340;
        Thu, 15 Jul 2021 23:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626385680;
        bh=3f7mh8euXbSQN6HcGF3I1ESl67jUlkhy/OhQpoacxLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EYcJl6FJhUAjs53UwnNFKnVlzYZhlfyuszTwoajZ6WCBfAqyEWb/VYhvID6A/4Ant
         ixTqCiKSisrfqc1BNBbpxWGSzVzhSNECiU9jQ+2ubkei9YwQXE1ZDBl3KrdBXjB2zb
         7fUQqlsnr8kSYXK3IVasqoAmri9JxhGSNB6H8Acs=
Date:   Fri, 16 Jul 2021 00:47:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     festevam@gmail.com, krzk@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, m.felsch@pengutronix.de,
        mchehab@kernel.org, phone-devel@vger.kernel.org, robh@kernel.org,
        shawnguo@kernel.org, slongerbeam@gmail.com
Subject: Re: [PATCH v6 2/3] media: imx: add a driver for i.MX8MQ mipi csi rx
 phy and controller
Message-ID: <YPCtDwgTMdFgejhi@pendragon.ideasonboard.com>
References: <20210714111931.324485-1-martin.kepplinger@puri.sm>
 <20210714111931.324485-3-martin.kepplinger@puri.sm>
 <YO8r6pZAduu1ZMK4@pendragon.ideasonboard.com>
 <33f9ab8ea253c01d3311346bc871d7f62213215f.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33f9ab8ea253c01d3311346bc871d7f62213215f.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Thu, Jul 15, 2021 at 08:49:51AM +0200, Martin Kepplinger wrote:
> Am Mittwoch, dem 14.07.2021 um 21:24 +0300 schrieb Laurent Pinchart:
> > Hi Martin,
> > 
> > Thank you for the patch.
> 
> thank you for reviewing.
> 
> > On Wed, Jul 14, 2021 at 01:19:30PM +0200, Martin Kepplinger wrote:
> > > Add a driver to support the i.MX8MQ MIPI CSI receiver. The hardware
> > > side
> > > is based on
> > >  
> > > https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c?h=imx_5.4.70_2.3.0
> > > 
> > > It's built as part of VIDEO_IMX7_CSI because that's documented to
> > > support
> > > i.MX8M platforms. This driver adds i.MX8MQ support where currently
> > > only the
> > > i.MX8MM platform has been supported.
> > > 
> > > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > > ---
> > >  drivers/staging/media/imx/Makefile           |   1 +
> > >  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 949
> > > +++++++++++++++++++
> > >  2 files changed, 950 insertions(+)
> > >  create mode 100644 drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > > 
> > > diff --git a/drivers/staging/media/imx/Makefile
> > > b/drivers/staging/media/imx/Makefile
> > > index 6ac33275cc97..19c2fc54d424 100644
> > > --- a/drivers/staging/media/imx/Makefile
> > > +++ b/drivers/staging/media/imx/Makefile
> > > @@ -16,3 +16,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
> > >  
> > >  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> > >  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-mipi-csis.o
> > > +obj-$(CONFIG_VIDEO_IMX7_CSI) += imx8mq-mipi-csi2.o
> > > diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > > b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > > new file mode 100644
> > > index 000000000000..949b3ef7a20a
> > > --- /dev/null
> > > +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > > @@ -0,0 +1,949 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Freescale i.MX8MQ SoC series MIPI-CSI2 receiver driver
> > 
> > Maybe they should be called NXP these days :-)
> > 
> > > + *
> > > + * Copyright (C) 2021 Purism SPC
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/interconnect.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/io.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/reset.h>
> > > +#include <linux/spinlock.h>
> > > +
> > > +#include <media/v4l2-common.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-mc.h>
> > > +#include <media/v4l2-subdev.h>
> > > +
> > > +#define MIPI_CSI2_DRIVER_NAME                  "imx8mq-mipi-csi2"
> > > +#define
> > > MIPI_CSI2_SUBDEV_NAME                  MIPI_CSI2_DRIVER_NAME
> > > +
> > > +#define MIPI_CSI2_PAD_SINK                     0
> > > +#define MIPI_CSI2_PAD_SOURCE                   1
> > > +#define MIPI_CSI2_PADS_NUM                     2
> > > +
> > > +#define MIPI_CSI2_DEF_PIX_WIDTH                        640
> > > +#define MIPI_CSI2_DEF_PIX_HEIGHT               480
> > > +
> > > +/* Register map definition */
> > > +
> > > +/* i.MX8MQ CSI-2 controller CSR */
> > > +#define CSI2RX_CFG_NUM_LANES                   0x100
> > > +#define CSI2RX_CFG_DISABLE_DATA_LANES          0x104
> > > +#define CSI2RX_BIT_ERR                         0x108
> > > +#define CSI2RX_IRQ_STATUS                      0x10c
> > > +#define CSI2RX_IRQ_MASK                                0x110
> > > +#define CSI2RX_IRQ_MASK_ALL                    0x1ff
> > > +#define CSI2RX_IRQ_MASK_ULPS_STATUS_CHANGE     0x8
> > > +#define CSI2RX_ULPS_STATUS                     0x114
> > > +#define CSI2RX_PPI_ERRSOT_HS                   0x118
> > > +#define CSI2RX_PPI_ERRSOTSYNC_HS               0x11c
> > > +#define CSI2RX_PPI_ERRESC                      0x120
> > > +#define CSI2RX_PPI_ERRSYNCESC                  0x124
> > > +#define CSI2RX_PPI_ERRCONTROL                  0x128
> > > +#define CSI2RX_CFG_DISABLE_PAYLOAD_0           0x12c
> > > +#define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL       0x188
> > > +#define CSI2RX_CFG_DISABLE_PAYLOAD_1           0x130
> > > +
> > > +enum {
> > > +       ST_POWERED      = 1,
> > > +       ST_STREAMING    = 2,
> > > +       ST_SUSPENDED    = 4,
> > > +};
> > > +
> > > +static const char * const imx8mq_mipi_csi_clk_id[] = {
> > > +       "core",
> > > +       "esc",
> > > +       "ui",
> > > +};
> > > +
> > > +#define CSI2_NUM_CLKS  ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
> > > +
> > > +#define        GPR_CSI2_1_RX_ENABLE            BIT(13)
> > > +#define        GPR_CSI2_1_VID_INTFC_ENB        BIT(12)
> > > +#define        GPR_CSI2_1_HSEL                 BIT(10)
> > > +#define        GPR_CSI2_1_CONT_CLK_MODE        BIT(8)
> > > +#define        GPR_CSI2_1_S_PRG_RXHS_SETTLE(x) (((x) & 0x3f) << 2)
> > > +
> > > +/*
> > > + * The send level configures the number of entries that must
> > > accumulate in
> > > + * the Pixel FIFO before the data will be transferred to the video
> > > output.
> > > + * See  
> > > https://community.nxp.com/t5/i-MX-Processors/IMX8M-MIPI-CSI-Host-Controller-send-level/m-p/864005/highlight/true#M131704
> > > + */
> > > +#define CSI2RX_SEND_LEVEL                      64
> > > +
> > > +struct csi_state {
> > > +       struct device *dev;
> > > +       void __iomem *regs;
> > > +       struct clk_bulk_data clks[CSI2_NUM_CLKS];
> > > +       struct reset_control *rst;
> > > +       struct regulator *mipi_phy_regulator;
> > > +
> > > +       struct v4l2_subdev sd;
> > > +       struct media_pad pads[MIPI_CSI2_PADS_NUM];
> > > +       struct v4l2_async_notifier notifier;
> > > +       struct v4l2_subdev *src_sd;
> > > +
> > > +       struct v4l2_fwnode_bus_mipi_csi2 bus;
> > > +
> > > +       struct mutex lock; /* Protect csi2_fmt, format_mbus, state,
> > > hs_settle*/
> > 
> > Missing space before */
> > 
> > > +       const struct csi2_pix_format *csi2_fmt;
> > > +       struct v4l2_mbus_framefmt format_mbus[MIPI_CSI2_PADS_NUM];
> > > +       u32 state;
> > > +       u32 hs_settle;
> > > +
> > > +       struct regmap *phy_gpr;
> > > +       u8 phy_gpr_reg;
> > > +
> > > +       struct icc_path                 *icc_path;
> > > +       s32                             icc_path_bw;
> > > +};
> > > +
> > > +/* ---------------------------------------------------------------
> > > --------------
> > > + * Format helpers
> > > + */
> > > +
> > > +struct csi2_pix_format {
> > > +       u32 code;
> > > +       u8 width;
> > > +};
> > > +
> > > +static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
> > > +       /* RAW (Bayer and greyscale) formats. */
> > > +       {
> > > +               .code = MEDIA_BUS_FMT_SBGGR8_1X8,
> > > +               .width = 8,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SGBRG8_1X8,
> > > +               .width = 8,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SGRBG8_1X8,
> > > +               .width = 8,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SRGGB8_1X8,
> > > +               .width = 8,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_Y8_1X8,
> > > +               .width = 8,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SBGGR10_1X10,
> > > +               .width = 10,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SGBRG10_1X10,
> > > +               .width = 10,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SGRBG10_1X10,
> > > +               .width = 10,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SRGGB10_1X10,
> > > +               .width = 10,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_Y10_1X10,
> > > +               .width = 10,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SBGGR12_1X12,
> > > +               .width = 12,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SGBRG12_1X12,
> > > +               .width = 12,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SGRBG12_1X12,
> > > +               .width = 12,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SRGGB12_1X12,
> > > +               .width = 12,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_Y12_1X12,
> > > +               .width = 12,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SBGGR14_1X14,
> > > +               .width = 14,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SGBRG14_1X14,
> > > +               .width = 14,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SGRBG14_1X14,
> > > +               .width = 14,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_SRGGB14_1X14,
> > > +               .width = 14,
> > > +       }, {
> > > +       /* YUV formats */
> > > +               .code = MEDIA_BUS_FMT_YUYV8_2X8,
> > > +               .width = 16,
> > > +       }, {
> > > +               .code = MEDIA_BUS_FMT_YUYV8_1X16,
> > > +               .width = 16,
> > > +       }
> > > +};
> > > +
> > > +static const struct csi2_pix_format *find_csi2_format(u32 code)
> > > +{
> > > +       unsigned int i;
> > > +
> > > +       for (i = 0; i < ARRAY_SIZE(imx8mq_mipi_csi_formats); i++)
> > > +               if (code == imx8mq_mipi_csi_formats[i].code)
> > > +                       return &imx8mq_mipi_csi_formats[i];
> > > +       return NULL;
> > > +}
> > > +
> > > +/* ---------------------------------------------------------------
> > > --------------
> > > + * Hardware configuration
> > > + */
> > > +
> > > +static inline void imx8mq_mipi_csi_write(struct csi_state *state,
> > > u32 reg, u32 val)
> > > +{
> > > +       writel(val, state->regs + reg);
> > > +}
> > > +
> > > +static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
> > > +{
> > > +       int ret;
> > > +
> > > +       ret = reset_control_assert(state->rst);
> > 
> > That's peculiar, is there no need to deassert reset ?
> 
> I tried different things here that would look more intuitive, but in
> the end only this worked, which is directly taken from
> https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c?h=imx_5.4.70_2.3.0#n105
> (actual register value read from DT) that results in exactly the same
> register bits set like this assertation.

It's very likely that these are self-clearing reset bits.

I would have adviced using reset_control_assert(), but it looks like the
reset controller driver doesn't support that operation. Could you add a
comment here to explain what's going on, maybe with a note to tell that
the reset-imx7 driver should implement the .reset() operation ?

-- 
Regards,

Laurent Pinchart
