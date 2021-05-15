Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A889C381B93
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 00:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhEOW5A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 18:57:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34216 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhEOW4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 18:56:50 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4A8E2BA;
        Sun, 16 May 2021 00:55:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621119334;
        bh=hdPLavT4LzjUuMfSBTpwDhW+sF2lJ+f4EWHn/riyxNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c6wOWBXj5LgJrqt3BsluXGTtGAvN75yBuOaAFcAq9WEE5Rl0WTBim8lbzDBkgzGUq
         +8+Og717ret5Esj8rWyxlGJcg/RZuhDtG5HqiBzDpnUwTWz1Cri2eNesTH4rA/RE2W
         HY3AbMZMjsm7HVLMj8qPYlAyw9LUDeaog9DaPtIE=
Date:   Sun, 16 May 2021 01:55:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, marex@denx.de, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, robh@kernel.org, slongerbeam@gmail.com
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support /
 imx8mq support
Message-ID: <YKBRXesDsXk9K15J@pendragon.ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <20210504155939.1194369-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210504155939.1194369-1-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

Sorry for the late reply.

On Tue, May 04, 2021 at 05:59:39PM +0200, Martin Kepplinger wrote:
> hi Laurent, again thanks a lot for posting this series! I can't fully test
> it, but base my work for imx8mq on it now. imx8mq includes
> yet another mipi phy version than this and below is some very rough testing
> code. it's not at all something I sign-off on but my following problem is based on it.

Unless I'm mistaken, the CSI-2 receiver in the i.MX8MQ is a completely
different device. I wouldn't try to support it in the imx7-mipi-csis
driver, but in a separate driver.

>  * configured to use both staging csi drivers
>  * the csi bridge driver at least streams frames together with the nxp "yav" mipi driver
> 
> media-ctl -p now says the output below, so one link from mipi to csi is missing.
> 
> Note that
> 
> media-ctl --set-v4l2 "'csi':0 [fmt:SBGGR10/640x480]"
> works in that it changes the configured format below, but
> 
> media-ctl -l "'imx7-mipi-csis.0':1" -> "'csi':0[1]"
> doesn't create said missing link.

media-ctl can't create links, it can only enable or disable them. Link
creation is the prerogative of drivers.

> Do I maybe use that wrongly? If now, does anything come to mind that would
> be missing specifically?

The link should be created by the call to media_create_pad_link() in
imx_media_capture_device_register(). You'll need to figure out if the
function is called and returns an error early, or if it doesn't get
called at all, and why.

> When trying to stream anyway (if that makes sense), I get the following:
> 
> [ 2008.377470] capture_start_streaming: starting
> [ 2008.381883] capture_find_format: calling imx_media_find_mbus_format with code 0x2006
> [ 2008.389671] imx7-csi 30a90000.csi1_bridge: capture_validate_fmt: capture_find_format err
> [ 2008.397794] imx7-csi 30a90000.csi1_bridge: capture_validate_fmt: capture_find_format found colorspace 0x1 != 0x0
> [ 2008.407999] imx7-csi 30a90000.csi1_bridge: capture format not valid: -32
> 
> and if I ignore that (because I'm not yet sure whether that is specific to
> platforms including an IPU), I get a WARN_ON from vb2_start_streaming()

That I have a fix for, I'll post it as part of an imx7-media-csi series.

> again, it's great to see your updates!
> 
> 
> 
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial          
> bus info        
> hw revision     0x0
> driver version  5.12.1
> 
> Device topology
> - entity 1: csi (2 pads, 1 link)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
> 	pad0: Sink
> 		[fmt:UYVY8_2X8/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> 	pad1: Source
> 		[fmt:UYVY8_2X8/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> 		-> "csi capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video1
> 	pad0: Sink
> 		<- "csi":1 [ENABLED,IMMUTABLE]
> 
> - entity 10: imx7-mipi-csis.0 (2 pads, 1 link)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev1
> 	pad0: Sink
> 		[fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> 		<- "hi846 2-0020":0 []
> 	pad1: Source
> 		[fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> 
> - entity 13: hi846 2-0020 (1 pad, 1 link)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev2
> 	pad0: Source
> 		[fmt:SGBRG10_1X10/640x480@1/120 field:none colorspace:unknown]
> 		-> "imx7-mipi-csis.0":0 []
> 
> 
> 
> 
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 265 ++++++++++++++++++++-
>  1 file changed, 252 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 0444b784c1ec..18e777d5a696 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -1,8 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Freescale i.MX7 SoC series MIPI-CSI V3.3 receiver driver
> + * Freescale i.MX SoC series MIPI-CSI V3.3 and V3.6 receiver driver
>   *
> + * Copyright (C) 2021 Purism SPC
> + * Copyright (C) 2021 Laurent Pinchard
>   * Copyright (C) 2019 Linaro Ltd
> + * Copyright (C) 2017 NXP
>   * Copyright (C) 2015-2016 Freescale Semiconductor, Inc. All Rights Reserved.
>   * Copyright (C) 2011 - 2013 Samsung Electronics Co., Ltd.
>   *
> @@ -21,6 +24,8 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
> @@ -237,12 +242,51 @@
>  #define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
>  #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
>  
> +/* i.MX8MQ CSI-2 controller CSR */
> +/* TODO 0x100, to dts? */
> +#define CSI2RX_CFG_NUM_LANES			0x100
> +#define CSI2RX_CFG_DISABLE_DATA_LANES		0x104
> +#define CSI2RX_BIT_ERR				0x108
> +#define CSI2RX_IRQ_STATUS			0x10C
> +#define CSI2RX_IRQ_MASK				0x110
> +#define CSI2RX_ULPS_STATUS			0x114
> +#define CSI2RX_PPI_ERRSOT_HS			0x118
> +#define CSI2RX_PPI_ERRSOTSYNC_HS		0x11C
> +#define CSI2RX_PPI_ERRESC	 		0x120
> +#define CSI2RX_PPI_ERRSYNCESC			0x124
> +#define CSI2RX_PPI_ERRCONTROL			0x128
> +#define CSI2RX_CFG_DISABLE_PAYLOAD_0		0x12C
> +#define CSI2RX_CFG_DISABLE_PAYLOAD_1		0x130
> +
> +#if 0
> +/* TODO leftover from yav. not used */
> +struct mxc_mipi_csi2_dev {
> +	struct v4l2_device		v4l2_dev;
> +
> +	struct v4l2_ctrl_handler ctrl_handler;
> +
> +	struct v4l2_async_subdev	asd;
> +	struct v4l2_async_subdev	*async_subdevs[2];
> +
> +
> +};
> +#endif
> +
>  enum {
>  	ST_POWERED	= 1,
>  	ST_STREAMING	= 2,
>  	ST_SUSPENDED	= 4,
>  };
>  
> +#if 0
> +imx8mq yav enum names:
> +enum mxc_mipi_csi2_pm_state {
> +	MXC_MIPI_CSI2_PM_POWERED	= 0x1,
> +	MXC_MIPI_CSI2_PM_SUSPENDED	= 0x2,
> +	MXC_MIPI_CSI2_RUNTIME_SUSPENDED	= 0x4,
> +};
> +#endif
> +
>  struct mipi_csis_event {
>  	bool debug;
>  	u32 mask;
> @@ -297,15 +341,42 @@ static const char * const mipi_csis_clk_id[] = {
>  enum mipi_csis_version {
>  	MIPI_CSIS_V3_3,
>  	MIPI_CSIS_V3_6_3,
> +	MIPI_CSIS_V3_6_6, /* NXPs' "yet another version" */
>  };
>  
>  struct mipi_csis_info {
>  	enum mipi_csis_version version;
>  };
>  
> +/* start imx8mq only */
> +struct csis_imx8mq_hw_reset {
> +	struct regmap *src;
> +	u8 req_src;
> +	u8 rst_val;
> +};
> +
> +struct csis_imx8mq_phy_gpr {
> +	struct regmap *gpr;
> +	u8 req_src;
> +};
> +
> +#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
> +#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
> +#define	GPR_CSI2_1_HSEL			BIT(10)
> +#define	GPR_CSI2_1_CONT_CLK_MODE 	BIT(8)
> +#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3F) << 2)
> +/*
> + * rxhs_settle[0] ... <720x480
> + * rxhs_settle[1] ... >720*480
> + *
> + * https://community.nxp.com/t5/i-MX-Processors/Explenation-for-HS-SETTLE-parameter-in-MIPI-CSI-D-PHY-registers/m-p/764275/highlight/true#M118744
> + */
> +static u8 rxhs_settle[2] = { 0x14, 0x9 };
> +/* end imx8mq only */
> +
>  struct csi_state {
>  	struct device *dev;
> -	void __iomem *regs;
> +	void __iomem *regs; /* TODO yav name: base_regs */
>  	unsigned int num_clks;
>  	struct clk_bulk_data *clks;
>  	struct reset_control *mrst;
> @@ -315,23 +386,27 @@ struct csi_state {
>  
>  	struct v4l2_subdev sd;
>  	struct media_pad pads[CSIS_PADS_NUM];
> -	struct v4l2_async_notifier notifier;
> -	struct v4l2_subdev *src_sd;
> +	struct v4l2_async_notifier notifier; /* TODO yav name: subdev_notifier */
> +	struct v4l2_subdev *src_sd; /* TODO yav name: sensor_sd */
>  
> -	struct v4l2_fwnode_bus_mipi_csi2 bus;
> +	struct v4l2_fwnode_bus_mipi_csi2 bus; /* TODO yav name: int num_lanes */
>  	u32 clk_frequency;
>  	u32 hs_settle;
>  	u32 clk_settle;
>  
>  	struct mutex lock;	/* Protect csis_fmt, format_mbus and state */
>  	const struct csis_pix_format *csis_fmt;
> -	struct v4l2_mbus_framefmt format_mbus;
> +	struct v4l2_mbus_framefmt format_mbus; /* TODO imx8mq yav name: format */
>  	u32 state;
>  
>  	spinlock_t slock;	/* Protect events */
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
>  	struct dentry *debugfs_root;
>  	bool debug;
> +
> +	struct csis_imx8mq_hw_reset hw_reset;
> +	struct csis_imx8mq_phy_gpr phy_gpr;
> +	u32 send_level;
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -457,13 +532,21 @@ static inline void mipi_csis_write(struct csi_state *state, u32 reg, u32 val)
>  
>  static void mipi_csis_enable_interrupts(struct csi_state *state, bool on)
>  {
> +	if (state->info->version == MIPI_CSIS_V3_6_6)
> +		return;
> +
>  	mipi_csis_write(state, MIPI_CSIS_INT_MSK, on ? 0xffffffff : 0);
>  	mipi_csis_write(state, MIPI_CSIS_DBG_INTR_MSK, on ? 0xffffffff : 0);
>  }
>  
>  static void mipi_csis_sw_reset(struct csi_state *state)
>  {
> -	u32 val = mipi_csis_read(state, MIPI_CSIS_CMN_CTRL);
> +	u32 val;
> +
> +	if (state->info->version == MIPI_CSIS_V3_6_6)
> +		return;
> +
> +	val = mipi_csis_read(state, MIPI_CSIS_CMN_CTRL);
>  
>  	mipi_csis_write(state, MIPI_CSIS_CMN_CTRL,
>  			val | MIPI_CSIS_CMN_CTRL_RESET);
> @@ -485,17 +568,116 @@ static int mipi_csis_phy_init(struct csi_state *state)
>  
>  static void mipi_csis_phy_reset(struct csi_state *state)
>  {
> +	struct device *dev = state->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *node;
> +	phandle phandle;
> +	u32 out_val[3];
> +	int ret;
> +
>  	if (state->info->version == MIPI_CSIS_V3_3) {
>  		reset_control_assert(state->mrst);
>  		msleep(20);
>  		reset_control_deassert(state->mrst);
>  	}
> +
> +	if (state->info->version != MIPI_CSIS_V3_6_6)
> +		return;
> +
> +	ret = of_property_read_u32_array(np, "csis-phy-reset", out_val, 3);
> +	if (ret) {
> +		dev_info(dev, "no csis-hw-reset property found: %d\n", ret);
> +		return;
> +	}
> +
> +	phandle = *out_val;
> +
> +	node = of_find_node_by_phandle(phandle);
> +	if (!node) {
> +		ret = PTR_ERR(node);
> +		dev_dbg(dev, "not find src node by phandle: %d\n", ret);
> +	}
> +	state->hw_reset.src = syscon_node_to_regmap(node);
> +	if (IS_ERR(state->hw_reset.src)) {
> +		ret = PTR_ERR(state->hw_reset.src);
> +		dev_err(dev, "failed to get src regmap: %d\n", ret);
> +	}
> +	of_node_put(node);
> +	if (ret < 0)
> +		return;
> +
> +	state->hw_reset.req_src = out_val[1];
> +	state->hw_reset.rst_val = out_val[2];
> +
> +	/* reset imx8mq mipi phy */
> +	regmap_update_bits(state->hw_reset.src,
> +			   state->hw_reset.req_src,
> +			   state->hw_reset.rst_val,
> +			   state->hw_reset.rst_val);
> +	msleep(20);
> +}
> +
> +static int mipi_csis_phy_gpr(struct csi_state *state)
> +{
> +	struct device *dev = state->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *node;
> +	phandle phandle;
> +	u32 out_val[2];
> +	int ret;
> +
> +	ret = of_property_read_u32_array(np, "phy-gpr", out_val, 2);
> +	if (ret) {
> +		dev_dbg(dev, "no phy-gpr property found\n");
> +	} else {
> +		phandle = *out_val;
> +
> +		node = of_find_node_by_phandle(phandle);
> +		if (!node) {
> +			dev_dbg(dev, "not find gpr node by phandle\n");
> +			ret = PTR_ERR(node);
> +		}
> +		state->phy_gpr.gpr = syscon_node_to_regmap(node);
> +		if (IS_ERR(state->phy_gpr.gpr)) {
> +			dev_err(dev, "failed to get gpr regmap\n");
> +			ret = PTR_ERR(state->phy_gpr.gpr);
> +		}
> +		of_node_put(node);
> +		if (ret < 0)
> +			return ret;
> +
> +		state->phy_gpr.req_src = out_val[1];
> +
> +		regmap_update_bits(state->phy_gpr.gpr,
> +				   state->phy_gpr.req_src,
> +				   0x3FFF,
> +				   GPR_CSI2_1_RX_ENABLE |
> +				   GPR_CSI2_1_VID_INTFC_ENB |
> +				   GPR_CSI2_1_HSEL |
> +				   GPR_CSI2_1_CONT_CLK_MODE |
> +				   GPR_CSI2_1_S_PRG_RXHS_SETTLE(state->
> +								hs_settle));
> +	}
> +
> +	dev_dbg(dev, "%s: hs_settle: 0x%X\n", __func__, state->hs_settle);
> +
> +	return ret;
>  }
>  
>  static void mipi_csis_system_enable(struct csi_state *state, int on)
>  {
>  	u32 val, mask;
>  
> +	if (state->info->version == MIPI_CSIS_V3_6_6) {
> +		if (on) {
> +			mipi_csis_phy_gpr(state);
> +		} else {
> +			mipi_csis_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, 0xf);
> +		}
> +
> +		return;
> +	}
> +
>  	val = mipi_csis_read(state, MIPI_CSIS_CMN_CTRL);
>  	if (on)
>  		val |= MIPI_CSIS_CMN_CTRL_ENABLE;
> @@ -534,6 +716,12 @@ static int mipi_csis_calculate_params(struct csi_state *state)
>  	s64 link_freq;
>  	u32 lane_rate;
>  
> +	if (state->info->version == MIPI_CSIS_V3_6_6) {
> +		state->hs_settle = rxhs_settle[0];
> +
> +		return 0;
> +	}
> +
>  	/* Calculate the line rate from the pixel rate. */
>  	link_freq = v4l2_get_link_freq(state->src_sd->ctrl_handler,
>  				       state->csis_fmt->width,
> @@ -570,6 +758,31 @@ static void mipi_csis_set_params(struct csi_state *state)
>  {
>  	int lanes = state->bus.num_data_lanes;
>  	u32 val;
> +	int i;
> +
> +	if (state->info->version == MIPI_CSIS_V3_6_6) {
> +		/* Lanes */
> +		mipi_csis_write(state, CSI2RX_CFG_NUM_LANES, lanes - 1);
> +		dev_err(state->dev, "imx8mq: %d lanes\n", lanes);
> +
> +		for (i = 0; i < lanes; i++)
> +			val |= (1 << i);
> +
> +		val = 0xF & ~val;
> +		mipi_csis_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, val);
> +		dev_err(state->dev, "imx8mq: CSI2RX_CFG_DISABLE_DATA_LANES: 0x%X\n", val);
> +
> +		/* Mask interrupt */
> +		// Don't let ULPS (ultra-low power status) interrupts flood
> +		mipi_csis_write(state, CSI2RX_IRQ_MASK, 0x1ff);
> +
> +		mipi_csis_write(state, 0x180, 1);
> +		/* vid_vc */
> +		mipi_csis_write(state, 0x184, 1);
> +		mipi_csis_write(state, 0x188, state->send_level);
> +
> +		return;
> +	}
>  
>  	val = mipi_csis_read(state, MIPI_CSIS_CMN_CTRL);
>  	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
> @@ -799,6 +1012,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct csi_state *state = mipi_sd_to_csis_state(sd);
>  	int ret;
>  
> +	if (state->info->version == MIPI_CSIS_V3_6_6)
> +		mipi_csis_write(state, CSI2RX_IRQ_MASK, 0x008);
> +
>  	if (enable) {
>  		ret = mipi_csis_calculate_params(state);
>  		if (ret < 0)
> @@ -814,6 +1030,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
>  		if (ret < 0 && ret != -ENOIOCTLCMD)
>  			goto done;
> +
> +		if (state->info->version == MIPI_CSIS_V3_6_6)
> +			mipi_csis_phy_reset(state);
>  	}
>  
>  	mutex_lock(&state->lock);
> @@ -1014,6 +1233,19 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  
>  	sdformat->format = *fmt;
>  
> +	if (state->info->version == MIPI_CSIS_V3_6_6) {
> +		if (sdformat->format.width * sdformat->format.height > 720 * 480) {
> +			state->hs_settle = rxhs_settle[1];
> +		} else {
> +			state->hs_settle = rxhs_settle[0];
> +		}
> +		state->send_level = 64;
> +
> +		dev_dbg(state->dev,
> +			"%s: set send_level %d hs_settle 0x%X\n", __func__,
> +			state->send_level, state->hs_settle);
> +	}
> +
>  	/* Propagate the format from sink to source. */
>  	fmt = mipi_csis_get_format(state, cfg, sdformat->which,
>  				   CSIS_PAD_SOURCE);
> @@ -1371,12 +1603,14 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	/* Now that the hardware is initialized, request the interrupt. */
> -	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
> -			       dev_name(dev), state);
> -	if (ret) {
> -		dev_err(dev, "Interrupt request failed\n");
> -		goto disable_clock;
> +	if (state->info->version != MIPI_CSIS_V3_6_6) {
> +		/* Now that the hardware is initialized, request the interrupt. */
> +		ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
> +				       dev_name(dev), state);
> +		if (ret) {
> +			dev_err(dev, "Interrupt request failed\n");
> +			goto disable_clock;
> +		}
>  	}
>  
>  	/* Initialize and register the subdev. */
> @@ -1453,6 +1687,11 @@ static const struct of_device_id mipi_csis_of_match[] = {
>  		.data = &(const struct mipi_csis_info){
>  			.version = MIPI_CSIS_V3_6_3,
>  		},
> +	}, {
> +		.compatible = "fsl,imx8mq-mipi-csi2",
> +		.data = &(const struct mipi_csis_info){
> +			.version = MIPI_CSIS_V3_6_6,
> +		},
>  	},
>  	{ /* sentinel */ },
>  };

-- 
Regards,

Laurent Pinchart
