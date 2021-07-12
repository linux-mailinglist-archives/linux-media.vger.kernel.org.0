Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F53E3C65BE
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 23:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbhGLV4e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 17:56:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58690 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhGLV4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 17:56:33 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFD60CC;
        Mon, 12 Jul 2021 23:53:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626126823;
        bh=+zXex5U5JOyFoUf4n00N5HbqZxbwsjB5c6m7ocxPCBE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kymr9ZIS3/r8Dp3lPoo3uYWSiMVBgXSrQyQ6RB20q+kUugy1Ccd7h+u6hLJw3z6/e
         QgHqCIjzopxdRRSWpCgmbmgXZb/ulvM369UFyyCW15+toviplsU+s4TP7fFQVbmJl4
         q9LTVV4hqTe6IjsoPrLCWSJIsQA03Ta+pYVVKoXo=
Date:   Tue, 13 Jul 2021 00:52:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     m.felsch@pengutronix.de, robh@kernel.org,
        devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mchehab@kernel.org,
        phone-devel@vger.kernel.org, shawnguo@kernel.org,
        slongerbeam@gmail.com
Subject: Re: [PATCH v5 2/3] media: imx: add a driver for i.MX8MQ mipi csi rx
 phy and controller
Message-ID: <YOy5uH6bSzRjO/f8@pendragon.ideasonboard.com>
References: <20210618095753.114557-1-martin.kepplinger@puri.sm>
 <20210618095753.114557-3-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618095753.114557-3-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

Thank you for the patch.

On Fri, Jun 18, 2021 at 11:57:52AM +0200, Martin Kepplinger wrote:
> Add a driver to support the i.MX8MQ MIPI CSI receiver. The hardware side
> is based on
> https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c?h=imx_5.4.70_2.3.0
> 
> It's built as part of VIDEO_IMX7_CSI because that's documented to support
> i.MX8M platforms. This driver adds i.MX8MQ support where currently only the
> i.MX8MM platform has been supported.

Overall this is really nice work. I have quite a few review comments,
but hopefully nothing that should be difficult to handle.

> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  drivers/staging/media/imx/Makefile           |   1 +
>  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 963 +++++++++++++++++++
>  2 files changed, 964 insertions(+)
>  create mode 100644 drivers/staging/media/imx/imx8mq-mipi-csi2.c
> 
> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> index 6ac33275cc97..19c2fc54d424 100644
> --- a/drivers/staging/media/imx/Makefile
> +++ b/drivers/staging/media/imx/Makefile
> @@ -16,3 +16,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
>  
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-mipi-csis.o
> +obj-$(CONFIG_VIDEO_IMX7_CSI) += imx8mq-mipi-csi2.o
> diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> new file mode 100644
> index 000000000000..0f101ac67cd6
> --- /dev/null
> +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> @@ -0,0 +1,963 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Freescale i.MX8MQ SoC series MIPI-CSI2 receiver driver
> + *
> + * Copyright (C) 2021 Purism SPC
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

This should go before module.h.

> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/spinlock.h>
> +#include <linux/interconnect.h>

Abd this before interrupt.h.

> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define MIPI_CSI2_DRIVER_NAME			"imx8mq-mipi-csi2"
> +#define MIPI_CSI2_SUBDEV_NAME			MIPI_CSI2_DRIVER_NAME
> +
> +#define MIPI_CSI2_PAD_SINK			0
> +#define MIPI_CSI2_PAD_SOURCE			1
> +#define MIPI_CSI2_PADS_NUM			2
> +
> +#define MIPI_CSI2_DEF_PIX_WIDTH			640
> +#define MIPI_CSI2_DEF_PIX_HEIGHT		480
> +
> +/* Register map definition */
> +
> +/* i.MX8MQ CSI-2 controller CSR */
> +#define CSI2RX_CFG_NUM_LANES			0x100
> +#define CSI2RX_CFG_DISABLE_DATA_LANES		0x104
> +#define CSI2RX_BIT_ERR				0x108
> +#define CSI2RX_IRQ_STATUS			0x10C

Could you please use lowercase hex constants through the driver ?

> +#define CSI2RX_IRQ_MASK				0x110
> +#define CSI2RX_IRQ_MASK_ALL			0x1ff
> +#define CSI2RX_IRQ_MASK_ULPS_STATUS_CHANGE	0x8
> +#define CSI2RX_ULPS_STATUS			0x114
> +#define CSI2RX_PPI_ERRSOT_HS			0x118
> +#define CSI2RX_PPI_ERRSOTSYNC_HS		0x11C
> +#define CSI2RX_PPI_ERRESC			0x120
> +#define CSI2RX_PPI_ERRSYNCESC			0x124
> +#define CSI2RX_PPI_ERRCONTROL			0x128
> +#define CSI2RX_CFG_DISABLE_PAYLOAD_0		0x12C
> +#define CSI2RX_CFG_DISABLE_PAYLOAD_1		0x130
> +
> +enum {
> +	ST_POWERED	= 1,
> +	ST_STREAMING	= 2,
> +	ST_SUSPENDED	= 4,
> +};
> +
> +static const char * const imx8mq_mipi_csi_clk_id[] = {
> +	"core",
> +	"esc",
> +	"ui",
> +};
> +
> +#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
> +#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
> +#define	GPR_CSI2_1_HSEL			BIT(10)
> +#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
> +#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3F) << 2)
> +
> +struct csi_state {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct clk_bulk_data *clks;

You could declare this as an array to avoid dynamic allocation.

	struct clk_bulk_data *clks[CSI_NUM_CLKS];

with CSI_NUM_CLKS defined as

#define CSI_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)

just after imx8mq_mipi_csi_clk_id.

> +	struct reset_control *rst;
> +	struct regulator *mipi_phy_regulator;
> +	u8 index;

This is never set and used in a single location. I'd drop it.

> +
> +	struct v4l2_subdev sd;
> +	struct media_pad pads[MIPI_CSI2_PADS_NUM];
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_subdev *src_sd;
> +
> +	struct v4l2_fwnode_bus_mipi_csi2 bus;
> +	u32 hs_settle;
> +	u32 clk_settle;
> +
> +	struct mutex lock;	/* Protect csi2_fmt, format_mbus and state */
> +	const struct csi2_pix_format *csi2_fmt;
> +	struct v4l2_mbus_framefmt format_mbus;
> +	u32 state;
> +
> +	struct regmap *phy_gpr;
> +	u8 phy_gpr_reg;
> +
> +	u32 send_level;

While the other fields are relatively self-explicit, I'm not sure what
this is. A comment wouldn't hurt. As the value is set to 64 and never
modified, you could also define a corresponding macro and drop the
field.

> +
> +	struct icc_path			*icc_path;
> +	s32				icc_path_bw;
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Format helpers
> + */
> +
> +struct csi2_pix_format {
> +	u32 code;
> +	u8 width;
> +};
> +
> +static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
> +	/* RAW (Bayer and greyscale) formats. */
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.width = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.width = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.width = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.width = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_Y8_1X8,
> +		.width = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.width = 10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.width = 10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.width = 10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.width = 10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_Y10_1X10,
> +		.width = 10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.width = 12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.width = 12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.width = 12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.width = 12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_Y12_1X12,
> +		.width = 12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.width = 14,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.width = 14,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.width = 14,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.width = 14,
> +	}, {
> +	/* YUV formats */
> +		.code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.width = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.width = 16,
> +	}
> +};
> +
> +static const struct csi2_pix_format *find_csi2_format(u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx8mq_mipi_csi_formats); i++)
> +		if (code == imx8mq_mipi_csi_formats[i].code)
> +			return &imx8mq_mipi_csi_formats[i];
> +	return NULL;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Hardware configuration
> + */
> +
> +static inline void imx8mq_mipi_csi_write(struct csi_state *state, u32 reg, u32 val)
> +{
> +	writel(val, state->regs + reg);
> +}
> +
> +static void imx8mq_mipi_csi_sw_reset(struct csi_state *state)
> +{
> +	int ret;
> +
> +	ret = reset_control_assert(state->rst);
> +	if (ret < 0)
> +		dev_err(state->dev, "Failed to assert resets: %d\n", ret);

Should you return an error here (and handle it in the caller) ?

> +
> +	msleep(20);

That's fairly long, is it a documented daily ? If not, have you tested
operation without it ?

> +}
> +
> +static void imx8mq_mipi_csi_system_enable(struct csi_state *state, int on)
> +{
> +	if (!on) {
> +		imx8mq_mipi_csi_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, 0xf);
> +		return;
> +	}
> +
> +	regmap_update_bits(state->phy_gpr,
> +			   state->phy_gpr_reg,
> +			   0x3FFF,
> +			   GPR_CSI2_1_RX_ENABLE |
> +			   GPR_CSI2_1_VID_INTFC_ENB |
> +			   GPR_CSI2_1_HSEL |
> +			   GPR_CSI2_1_CONT_CLK_MODE |
> +			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(state->hs_settle));
> +}
> +
> +static void imx8mq_mipi_csi_set_params(struct csi_state *state)
> +{
> +	int lanes = state->bus.num_data_lanes;
> +	u32 val = 0;
> +	int i;
> +
> +	imx8mq_mipi_csi_write(state, CSI2RX_CFG_NUM_LANES, lanes - 1);
> +
> +	for (i = 0; i < lanes; i++)
> +		val |= (1 << i);
> +
> +	val = 0xF & ~val;
> +	imx8mq_mipi_csi_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, val);

You could also write

	imx8mq_mipi_csi_write(state, CSI2RX_CFG_DISABLE_DATA_LANES,
			      (0xf << lanes) & 0xf);

> +
> +	imx8mq_mipi_csi_write(state, CSI2RX_IRQ_MASK, CSI2RX_IRQ_MASK_ALL);
> +
> +	imx8mq_mipi_csi_write(state, 0x180, 1);
> +	/* vid_vc */
> +	imx8mq_mipi_csi_write(state, 0x184, 1);
> +	imx8mq_mipi_csi_write(state, 0x188, state->send_level);

Register 0x188 is documented, so a macro would be nice.

> +}
> +
> +static int imx8mq_mipi_csi_clk_enable(struct csi_state *state)
> +{
> +	return clk_bulk_prepare_enable(ARRAY_SIZE(imx8mq_mipi_csi_clk_id),
> +				       state->clks);

I'd use ARRAY_SIZE(state->clks) here and below where applicable (if you
agree with my proposal above to make clks an array).

> +}
> +
> +static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
> +{
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(imx8mq_mipi_csi_clk_id),
> +				   state->clks);
> +}
> +
> +static int imx8mq_mipi_csi_clk_get(struct csi_state *state)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	state->clks = devm_kcalloc(state->dev,
> +				   ARRAY_SIZE(imx8mq_mipi_csi_clk_id),
> +				   sizeof(*state->clks), GFP_KERNEL);
> +
> +	if (!state->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx8mq_mipi_csi_clk_id); i++)
> +		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
> +
> +	ret = devm_clk_bulk_get(state->dev, ARRAY_SIZE(imx8mq_mipi_csi_clk_id),
> +				state->clks);
> +	return ret;

	return devm_clk_bulk_get(state->dev, ARRAY_SIZE(state->clks),
				 state->clks);

> +}
> +
> +static void imx8mq_mipi_csi_start_stream(struct csi_state *state)
> +{
> +	imx8mq_mipi_csi_sw_reset(state);
> +	imx8mq_mipi_csi_set_params(state);
> +	imx8mq_mipi_csi_system_enable(state, true);
> +}
> +
> +static void imx8mq_mipi_csi_stop_stream(struct csi_state *state)
> +{
> +	imx8mq_mipi_csi_system_enable(state, false);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * V4L2 subdev operations
> + */
> +
> +static struct csi_state *mipi_sd_to_csi2_state(struct v4l2_subdev *sdev)
> +{
> +	return container_of(sdev, struct csi_state, sd);
> +}
> +
> +static int imx8mq_mipi_csi_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	int ret;
> +
> +	imx8mq_mipi_csi_write(state, CSI2RX_IRQ_MASK,
> +			      CSI2RX_IRQ_MASK_ULPS_STATUS_CHANGE);
> +
> +	if (enable) {
> +		ret = pm_runtime_get_sync(state->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(state->dev);
> +			return ret;
> +		}
> +		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
> +		if (ret < 0 && ret != -ENOIOCTLCMD)
> +			goto done;

.s_power() is deprecated for sensors, so I would drop this.

> +	}
> +
> +	mutex_lock(&state->lock);
> +
> +	if (enable) {
> +		if (state->state & ST_SUSPENDED) {
> +			ret = -EBUSY;
> +			goto unlock;
> +		}
> +
> +		imx8mq_mipi_csi_start_stream(state);
> +		ret = v4l2_subdev_call(state->src_sd, video, s_stream, 1);
> +		if (ret < 0)
> +			goto unlock;
> +
> +		state->state |= ST_STREAMING;
> +	} else {
> +		v4l2_subdev_call(state->src_sd, video, s_stream, 0);
> +		ret = v4l2_subdev_call(state->src_sd, core, s_power, 0);

This sohuld be dropped too.

> +		if (ret == -ENOIOCTLCMD)
> +			ret = 0;
> +		imx8mq_mipi_csi_stop_stream(state);
> +		state->state &= ~ST_STREAMING;
> +	}
> +
> +unlock:
> +	mutex_unlock(&state->lock);
> +
> +done:
> +	if (!enable || ret < 0)
> +		pm_runtime_put(state->dev);
> +
> +	return ret;
> +}
> +
> +static struct v4l2_mbus_framefmt *
> +imx8mq_mipi_csi_get_format(struct csi_state *state,
> +			   struct v4l2_subdev_pad_config *cfg,
> +			   enum v4l2_subdev_format_whence which,
> +			   unsigned int pad)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
> +		return v4l2_subdev_get_try_format(&state->sd, cfg, pad);
> +
> +	return &state->format_mbus;
> +}
> +
> +static int imx8mq_mipi_csi_init_cfg(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	struct v4l2_mbus_framefmt *fmt_sink;
> +	struct v4l2_mbus_framefmt *fmt_source;
> +	enum v4l2_subdev_format_whence which;
> +
> +	which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> +	fmt_sink = imx8mq_mipi_csi_get_format(state, cfg, which, MIPI_CSI2_PAD_SINK);
> +
> +	fmt_sink->code = MEDIA_BUS_FMT_SGBRG10_1X10;
> +	fmt_sink->width = MIPI_CSI2_DEF_PIX_WIDTH;
> +	fmt_sink->height = MIPI_CSI2_DEF_PIX_HEIGHT;
> +	fmt_sink->field = V4L2_FIELD_NONE;
> +
> +	fmt_sink->colorspace = V4L2_COLORSPACE_RAW;
> +	fmt_sink->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt_sink->colorspace);
> +	fmt_sink->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt_sink->colorspace);
> +	fmt_sink->quantization =
> +		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt_sink->colorspace,
> +					      fmt_sink->ycbcr_enc);
> +
> +	/*
> +	 * When called from imx8mq_mipi_csi_subdev_init() to initialize the
> +	 * active configuration, cfg is NULL, which indicates there's no source
> +	 * pad configuration to set.
> +	 */
> +	if (!cfg)
> +		return 0;
> +
> +	fmt_source = imx8mq_mipi_csi_get_format(state, cfg, which,
> +						MIPI_CSI2_PAD_SOURCE);

When which == V4L2_SUBDEV_FORMAT_ACTIVE, imx8mq_mipi_csi_get_format()
will return &state->format_mbus for both the sink and the source. To
avoid corner cases and handling of special behaviours, I would recommend
turning state->format_mbus into an array of two elements, one for the
sink and one for the source. The little bit of extra memory used for the
redundant information is I think a fair price for making the format
handling code easier to read and follow.

This will also prepare for ongoing work in the V4L2 subdev core that
will store per-pad v4l2_mbus_framefmt in the v4l2_subdev structure,
simplifying drivers.

> +	*fmt_source = *fmt_sink;
> +
> +	return 0;
> +}
> +
> +static int imx8mq_mipi_csi_get_fmt(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	fmt = imx8mq_mipi_csi_get_format(state, cfg, sdformat->which,
> +					 sdformat->pad);
> +
> +	mutex_lock(&state->lock);
> +
> +	sdformat->format = *fmt;
> +
> +	mutex_unlock(&state->lock);
> +
> +	return 0;
> +}
> +
> +static int imx8mq_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
> +					  struct v4l2_subdev_pad_config *cfg,
> +					  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +
> +	/*
> +	 * We can't transcode in any way, the source format is identical
> +	 * to the sink format.
> +	 */
> +	if (code->pad == MIPI_CSI2_PAD_SOURCE) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		fmt = imx8mq_mipi_csi_get_format(state, cfg, code->which,
> +						 code->pad);
> +		code->code = fmt->code;
> +		return 0;
> +	}
> +
> +	if (code->pad != MIPI_CSI2_PAD_SINK)
> +		return -EINVAL;
> +
> +	if (code->index >= ARRAY_SIZE(imx8mq_mipi_csi_formats))
> +		return -EINVAL;
> +
> +	code->code = imx8mq_mipi_csi_formats[code->index].code;
> +
> +	return 0;
> +}
> +
> +static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	struct csi2_pix_format const *csi2_fmt;
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	/*
> +	 * The device can't transcode in any way, the source format can't be
> +	 * modified.
> +	 */
> +	if (sdformat->pad == MIPI_CSI2_PAD_SOURCE)
> +		return imx8mq_mipi_csi_get_fmt(sd, cfg, sdformat);
> +
> +	if (sdformat->pad != MIPI_CSI2_PAD_SINK)
> +		return -EINVAL;
> +
> +	csi2_fmt = find_csi2_format(sdformat->format.code);
> +	if (!csi2_fmt) {
> +		dev_err(state->dev, "no format found based on code %d\n",
> +			sdformat->format.code);

This isn't an error, it can happen, no message is needed. Otherwise
userspace will have a way to flood the kernel log.

> +		csi2_fmt = &imx8mq_mipi_csi_formats[0];
> +	}
> +
> +	fmt = imx8mq_mipi_csi_get_format(state, cfg, sdformat->which,
> +					 sdformat->pad);
> +
> +	mutex_lock(&state->lock);
> +
> +	fmt->code = csi2_fmt->code;
> +	fmt->width = sdformat->format.width;
> +	fmt->height = sdformat->format.height;
> +
> +	sdformat->format = *fmt;
> +
> +	/* Propagate the format from sink to source. */
> +	fmt = imx8mq_mipi_csi_get_format(state, cfg, sdformat->which,
> +					 MIPI_CSI2_PAD_SOURCE);
> +	*fmt = sdformat->format;
> +
> +	/* Store the CSI2 format descriptor for active formats. */
> +	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		state->csi2_fmt = csi2_fmt;
> +
> +	mutex_unlock(&state->lock);
> +
> +	/* https://community.nxp.com/t5/i-MX-Processors/Explenation-for-HS-SETTLE-parameter-in-MIPI-CSI-D-PHY-registers/m-p/764275/highlight/true#M118744 */
> +	if (sdformat->format.width * sdformat->format.height > 720 * 480)
> +		state->hs_settle = 0x9;
> +	else
> +		state->hs_settle = 0x14;

I don't think this is correct. The data rate referenced in table 35 is
the data rate per lane, equal to twice the link frequency. The link
frequency should be retrieved from the sensor, and the calculation be
done accordingly. Furthermore, this should be moved to stream start
time, as the sensor link frequency can vary until then.

> +
> +	state->send_level = 64;

Shouldn't this be covered by the mutex ?

> +
> +	dev_dbg(state->dev,
> +		"%s: format %dx%d send_level %d hs_settle 0x%X\n", __func__,

%u instead of %d for unsigned values, and Mu for hs_settle too as it's
%an integer value, not a bitfield.

> +		sdformat->format.width, sdformat->format.height,
> +		state->send_level, state->hs_settle);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops imx8mq_mipi_csi_video_ops = {
> +	.s_stream	= imx8mq_mipi_csi_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx8mq_mipi_csi_pad_ops = {
> +	.init_cfg		= imx8mq_mipi_csi_init_cfg,
> +	.enum_mbus_code		= imx8mq_mipi_csi_enum_mbus_code,
> +	.get_fmt		= imx8mq_mipi_csi_get_fmt,
> +	.set_fmt		= imx8mq_mipi_csi_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops imx8mq_mipi_csi_subdev_ops = {
> +	.video	= &imx8mq_mipi_csi_video_ops,
> +	.pad	= &imx8mq_mipi_csi_pad_ops,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Media entity operations
> + */
> +
> +static int imx8mq_mipi_csi_link_setup(struct media_entity *entity,
> +				      const struct media_pad *local_pad,
> +				      const struct media_pad *remote_pad,
> +				      u32 flags)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	struct v4l2_subdev *remote_sd;
> +
> +	/* We only care about the link to the source. */
> +	if (!(local_pad->flags & MEDIA_PAD_FL_SINK))
> +		return 0;
> +
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	if (flags & MEDIA_LNK_FL_ENABLED) {
> +		if (state->src_sd)
> +			return -EBUSY;
> +
> +		state->src_sd = remote_sd;
> +	} else {
> +		state->src_sd = NULL;
> +	}

As you support a single source subdev, I would make the link immutable,
and set src_sd in imx8mq_mipi_csi_notify_bound().

> +
> +	return 0;
> +}
> +
> +static const struct media_entity_operations imx8mq_mipi_csi_entity_ops = {
> +	.link_setup	= imx8mq_mipi_csi_link_setup,
> +	.link_validate	= v4l2_subdev_link_validate,
> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Async subdev notifier
> + */
> +
> +static struct csi_state *
> +mipi_notifier_to_csi2_state(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct csi_state, notifier);
> +}
> +
> +static int imx8mq_mipi_csi_notify_bound(struct v4l2_async_notifier *notifier,
> +					struct v4l2_subdev *sd,
> +					struct v4l2_async_subdev *asd)
> +{
> +	struct csi_state *state = mipi_notifier_to_csi2_state(notifier);
> +	struct media_pad *sink = &state->sd.entity.pads[MIPI_CSI2_PAD_SINK];
> +
> +	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
> +}
> +
> +static const struct v4l2_async_notifier_operations imx8mq_mipi_csi_notify_ops = {
> +	.bound = imx8mq_mipi_csi_notify_bound,
> +};
> +
> +static int imx8mq_mipi_csi_async_register(struct csi_state *state)
> +{
> +	struct v4l2_fwnode_endpoint vep = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct v4l2_async_subdev *asd;
> +	struct fwnode_handle *ep;
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_async_notifier_init(&state->notifier);
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	if (ret)
> +		goto err_parse;
> +
> +	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> +			dev_err(state->dev,
> +				"data lanes reordering is not supported");
> +			ret = -EINVAL;
> +			goto err_parse;
> +		}
> +	}
> +
> +	state->bus = vep.bus.mipi_csi2;
> +
> +	dev_dbg(state->dev, "data lanes: %d flags: 0x%08X\n",

s/X/x/

> +		state->bus.num_data_lanes,
> +		state->bus.flags);
> +
> +	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&state->notifier,
> +							   ep, struct v4l2_async_subdev);
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		goto err_parse;
> +	}
> +
> +	fwnode_handle_put(ep);
> +
> +	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
> +
> +	ret = v4l2_async_subdev_notifier_register(&state->sd, &state->notifier);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_async_register_subdev(&state->sd);
> +
> +err_parse:
> +	fwnode_handle_put(ep);
> +
> +	return ret;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Suspend/resume
> + */
> +
> +static int imx8mq_mipi_csi_pm_suspend(struct device *dev, bool runtime)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	int ret = 0;
> +
> +	mutex_lock(&state->lock);
> +
> +	if (state->state & ST_POWERED) {
> +		imx8mq_mipi_csi_stop_stream(state);
> +		imx8mq_mipi_csi_clk_disable(state);
> +		state->state &= ~ST_POWERED;
> +		if (!runtime)
> +			state->state |= ST_SUSPENDED;
> +	}
> +
> +	mutex_unlock(&state->lock);
> +
> +	ret = icc_set_bw(state->icc_path, 0, 0);
> +	if (ret)
> +		dev_err(dev, "icc_set_bw failed with %d\n", ret);
> +
> +	return ret ? -EAGAIN : 0;
> +}
> +
> +static int imx8mq_mipi_csi_pm_resume(struct device *dev, bool runtime)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	int ret = 0;
> +
> +	ret = icc_set_bw(state->icc_path, 0, state->icc_path_bw);
> +	if (ret) {
> +		dev_err(dev, "icc_set_bw failed with %d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_lock(&state->lock);
> +
> +	if (!runtime && !(state->state & ST_SUSPENDED))
> +		goto unlock;
> +
> +	if (!(state->state & ST_POWERED)) {
> +		state->state |= ST_POWERED;
> +		ret = imx8mq_mipi_csi_clk_enable(state);

Enabling the clocks in the PM resume handler is correct, but they should
also be disabled in the PM suspend handler.

> +	}
> +	if (state->state & ST_STREAMING)
> +		imx8mq_mipi_csi_start_stream(state);

This will cause problems when the i.MX7 CSI bridge driver will implement
runtime PM support, as it should then start and stop the whole pipeline,
which will conflict with the code here. We can handle this later I
suppose.

> +
> +	state->state &= ~ST_SUSPENDED;
> +
> +unlock:
> +	mutex_unlock(&state->lock);
> +
> +	return ret ? -EAGAIN : 0;
> +}
> +
> +static int __maybe_unused imx8mq_mipi_csi_suspend(struct device *dev)
> +{
> +	return imx8mq_mipi_csi_pm_suspend(dev, false);
> +}
> +
> +static int __maybe_unused imx8mq_mipi_csi_resume(struct device *dev)
> +{
> +	return imx8mq_mipi_csi_pm_resume(dev, false);
> +}
> +
> +static int __maybe_unused imx8mq_mipi_csi_runtime_suspend(struct device *dev)
> +{
> +	return imx8mq_mipi_csi_pm_suspend(dev, true);
> +}
> +
> +static int __maybe_unused imx8mq_mipi_csi_runtime_resume(struct device *dev)
> +{
> +	return imx8mq_mipi_csi_pm_resume(dev, true);
> +}
> +
> +static const struct dev_pm_ops imx8mq_mipi_csi_pm_ops = {
> +	SET_RUNTIME_PM_OPS(imx8mq_mipi_csi_runtime_suspend,
> +			   imx8mq_mipi_csi_runtime_resume,
> +			   NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(imx8mq_mipi_csi_suspend, imx8mq_mipi_csi_resume)
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Probe/remove & platform driver
> + */
> +
> +static int imx8mq_mipi_csi_subdev_init(struct csi_state *state)
> +{
> +	struct v4l2_subdev *sd = &state->sd;
> +
> +	v4l2_subdev_init(sd, &imx8mq_mipi_csi_subdev_ops);
> +	sd->owner = THIS_MODULE;
> +	snprintf(sd->name, sizeof(sd->name), "%s.%d",
> +		 MIPI_CSI2_SUBDEV_NAME, state->index);

state->index is always 0. To ensure uniqueness of entity names, in case
an SoC integrates multiple instances of this subdev, I would replace
state->index with dev_name(state->dev) and the format string with "%s
%s".

> +
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->ctrl_handler = NULL;

You could drop this line as all fields are zero-initialized.

> +
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops = &imx8mq_mipi_csi_entity_ops;
> +
> +	sd->dev = state->dev;
> +
> +	state->csi2_fmt = &imx8mq_mipi_csi_formats[0];
> +	imx8mq_mipi_csi_init_cfg(sd, NULL);
> +
> +	state->pads[MIPI_CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK
> +					 | MEDIA_PAD_FL_MUST_CONNECT;
> +	state->pads[MIPI_CSI2_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
> +					   | MEDIA_PAD_FL_MUST_CONNECT;
> +	return media_entity_pads_init(&sd->entity, MIPI_CSI2_PADS_NUM,
> +				      state->pads);
> +}
> +
> +static void imx8mq_mipi_csi_release_icc(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(&pdev->dev);
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +
> +	icc_put(state->icc_path);
> +}
> +
> +static int imx8mq_mipi_csi_init_icc(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(&pdev->dev);
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +
> +	/* Optional interconnect request */
> +	state->icc_path = of_icc_get(&pdev->dev, "dram");
> +	if (IS_ERR_OR_NULL(state->icc_path))
> +		return PTR_ERR_OR_ZERO(state->icc_path);
> +
> +	state->icc_path_bw = MBps_to_icc(700);
> +
> +	return 0;
> +}
> +
> +static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
> +{
> +	struct device *dev = state->dev;
> +	struct device_node *np = state->dev->of_node;
> +	struct device_node *node;
> +	phandle ph;
> +	u32 out_val[2];
> +	int ret = 0;
> +
> +	state->rst = devm_reset_control_array_get_exclusive(dev);
> +	if (IS_ERR(state->rst)) {
> +		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
> +		return PTR_ERR(state->rst);
> +	}
> +
> +	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
> +					 ARRAY_SIZE(out_val));
> +	if (ret) {
> +		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ph = *out_val;
> +
> +	node = of_find_node_by_phandle(ph);
> +	if (!node) {
> +		ret = -ENODEV;
> +		dev_err(dev, "Error finding node by phandle\n");
> +		goto out;

You can return -ENODEV directly here, there's no need to call
of_node_put(node) as node is NULL.

> +	}
> +	state->phy_gpr = syscon_node_to_regmap(node);

I'd call

	of_node_put(node);

here, and you can drop the out label.

> +	if (IS_ERR(state->phy_gpr)) {
> +		ret = PTR_ERR(state->phy_gpr);
> +		dev_err(dev, "failed to get gpr regmap: %pe\n", state->phy_gpr);
> +		goto out;
> +	}
> +
> +	state->phy_gpr_reg = out_val[1];
> +	dev_dbg(dev, "phy gpr register set to 0x%X\n", state->phy_gpr_reg);
> +
> +out:
> +	of_node_put(node);
> +	return ret;
> +}
> +
> +static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct csi_state *state;
> +	int ret;
> +
> +	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	mutex_init(&state->lock);
> +
> +	state->dev = dev;
> +
> +	ret = imx8mq_mipi_csi_parse_dt(state);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Acquire resources. */
> +	state->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(state->regs))
> +		return PTR_ERR(state->regs);
> +
> +	ret = imx8mq_mipi_csi_clk_get(state);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Initialize and register the subdev. */
> +	ret = imx8mq_mipi_csi_subdev_init(state);
> +	if (ret < 0)
> +		goto disable_clock;
> +
> +	platform_set_drvdata(pdev, &state->sd);
> +
> +	ret = imx8mq_mipi_csi_async_register(state);
> +	if (ret < 0) {
> +		dev_err(dev, "async register failed: %d\n", ret);
> +		goto cleanup;
> +	}

This should be the last operation, as the subdev could be used as soon
as it gets registered.

> +
> +	ret = imx8mq_mipi_csi_init_icc(pdev);
> +	if (ret)
> +		goto cleanup;
> +
> +	/* Enable runtime PM. */
> +	pm_runtime_enable(dev);
> +	if (!pm_runtime_enabled(dev)) {
> +		ret = imx8mq_mipi_csi_pm_resume(dev, true);
> +		if (ret < 0) {
> +			imx8mq_mipi_csi_release_icc(pdev);
> +			goto cleanup;
> +		}
> +	}
> +
> +	return 0;
> +
> +cleanup:
> +	media_entity_cleanup(&state->sd.entity);
> +	v4l2_async_notifier_unregister(&state->notifier);
> +	v4l2_async_notifier_cleanup(&state->notifier);
> +	v4l2_async_unregister_subdev(&state->sd);
> +disable_clock:
> +	imx8mq_mipi_csi_clk_disable(state);
> +	mutex_destroy(&state->lock);
> +
> +	return ret;
> +}
> +
> +static int imx8mq_mipi_csi_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +
> +	v4l2_async_notifier_unregister(&state->notifier);
> +	v4l2_async_notifier_cleanup(&state->notifier);
> +	v4l2_async_unregister_subdev(&state->sd);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	imx8mq_mipi_csi_pm_suspend(&pdev->dev, true);
> +	imx8mq_mipi_csi_clk_disable(state);
> +	media_entity_cleanup(&state->sd.entity);
> +	mutex_destroy(&state->lock);
> +	pm_runtime_set_suspended(&pdev->dev);
> +	imx8mq_mipi_csi_release_icc(pdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
> +	{ .compatible = "fsl,imx8mq-mipi-csi2",},

Missing space before }

> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);
> +
> +static struct platform_driver imx8mq_mipi_csi_driver = {
> +	.probe		= imx8mq_mipi_csi_probe,
> +	.remove		= imx8mq_mipi_csi_remove,
> +	.driver		= {
> +		.of_match_table = imx8mq_mipi_csi_of_match,
> +		.name		= MIPI_CSI2_DRIVER_NAME,
> +		.pm		= &imx8mq_mipi_csi_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(imx8mq_mipi_csi_driver);
> +
> +MODULE_DESCRIPTION("i.MX8MQ MIPI CSI-2 receiver driver");
> +MODULE_AUTHOR("Martin Kepplinger <martin.kepplinger@puri.sm>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:imx8mq-mipi-csi2");

-- 
Regards,

Laurent Pinchart
