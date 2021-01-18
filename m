Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CECC82FA851
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 19:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436623AbhARSGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 13:06:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46600 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407503AbhARSGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 13:06:00 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 2AD9A1F44834
Subject: Re: [PATCH RFC 04/11] phy/rockchip: add Innosilicon-based CSI dphy
To:     Heiko Stuebner <heiko@sntech.de>, ezequiel@collabora.com,
        dafna.hirschfeld@collabora.com, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210108193311.3423236-1-heiko@sntech.de>
 <20210108193311.3423236-5-heiko@sntech.de>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <3c2839a6-e22b-6a44-6e25-cac04bea6f90@collabora.com>
Date:   Mon, 18 Jan 2021 15:05:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210108193311.3423236-5-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Just some nit comments from a quick look, that you would probably
catch those when removing the RFC tag, but since I spotted them, here
they are:

On 1/8/21 4:33 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The CSI dphy found for example on the rk3326/px30 and rk3368 is based
> on an IP design from Innosilicon. Add a driver for it.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  drivers/phy/rockchip/Kconfig                  |   9 +
>  drivers/phy/rockchip/Makefile                 |   1 +
>  .../phy/rockchip/phy-rockchip-inno-csidphy.c  | 580 ++++++++++++++++++
>  3 files changed, 590 insertions(+)
>  create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> 
> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
> index 159285f42e5c..e812adad7242 100644
> --- a/drivers/phy/rockchip/Kconfig
> +++ b/drivers/phy/rockchip/Kconfig
> @@ -48,6 +48,15 @@ config PHY_ROCKCHIP_INNO_USB2
>  	help
>  	  Support for Rockchip USB2.0 PHY with Innosilicon IP block.
>  
> +config PHY_ROCKCHIP_INNO_CSIDPHY
> +	tristate "Rockchip Innosilicon MIPI CSI PHY driver"
> +	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> +	select GENERIC_PHY
> +	select GENERIC_PHY_MIPI_DPHY
> +	help
> +	  Enable this to support the Rockchip MIPI CSI PHY with
> +	  Innosilicon IP block.
> +
>  config PHY_ROCKCHIP_INNO_DSIDPHY
>  	tristate "Rockchip Innosilicon MIPI/LVDS/TTL PHY driver"
>  	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> diff --git a/drivers/phy/rockchip/Makefile b/drivers/phy/rockchip/Makefile
> index c3cfc7f0af5c..f0eec212b2aa 100644
> --- a/drivers/phy/rockchip/Makefile
> +++ b/drivers/phy/rockchip/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_PHY_ROCKCHIP_DP)		+= phy-rockchip-dp.o
>  obj-$(CONFIG_PHY_ROCKCHIP_DPHY_RX0)     += phy-rockchip-dphy-rx0.o
>  obj-$(CONFIG_PHY_ROCKCHIP_EMMC)		+= phy-rockchip-emmc.o
> +obj-$(CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY)	+= phy-rockchip-inno-csidphy.o
>  obj-$(CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY)	+= phy-rockchip-inno-dsidphy.o
>  obj-$(CONFIG_PHY_ROCKCHIP_INNO_HDMI)	+= phy-rockchip-inno-hdmi.o
>  obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB2)	+= phy-rockchip-inno-usb2.o
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> new file mode 100644
> index 000000000000..96a7fe137bb9
> --- /dev/null
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -0,0 +1,580 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip MIPI RX Innosilicon DPHY driver
> + *
> + * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/phy/phy.h>

Alphabetical order

> +#include <linux/phy/phy-mipi-dphy.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +
> +/* GRF */
> +#define RK1808_GRF_PD_VI_CON_OFFSET	0x0430
> +
> +#define RK3326_GRF_IO_VSEL_OFFSET	0x0180
> +#define RK3326_GRF_PD_VI_CON_OFFSET	0x0430
> +
> +#define RK3368_GRF_SOC_CON6_OFFSET	0x0418
> +#define RK3368_GRF_IO_VSEL_OFFSET	0x0900

Some of those are "used" in commented lines.

> +
> +/* PHY */
> +#define CLOCK_LANE_HS_RX_CONTROL		0x34
> +#define LANE0_HS_RX_CONTROL			0x44
> +#define LANE1_HS_RX_CONTROL			0x54
> +#define LANE2_HS_RX_CONTROL			0x84
> +#define LANE3_HS_RX_CONTROL			0x94
> +#define HS_RX_DATA_LANES_THS_SETTLE_CONTROL	0x75

These defines are not used, should them be removed?

> +
> +#define CSIDPHY_CTRL_LANE_ENABLE		0x00
> +#define CSIDPHY_CTRL_LANE_ENABLE_CK		BIT(6)
> +#define CSIDPHY_CTRL_LANE_ENABLE_LANE3		BIT(5)
> +#define CSIDPHY_CTRL_LANE_ENABLE_LANE2		BIT(4)
> +#define CSIDPHY_CTRL_LANE_ENABLE_LANE1		BIT(3)> +#define CSIDPHY_CTRL_LANE_ENABLE_LANE0		BIT(2)

same for *_LANEx macros.

> +#define CSIDPHY_CTRL_LANE_ENABLE_UNDEFINED	BIT(0)
> +
> +#define CSIDPHY_CTRL_LANE_ENABLE_SHIFT		2
> +
> +/* not present on all variants */
> +#define CSIDPHY_CTRL_PWRCTL		0x04
> +#define CSIDPHY_CTRL_PWRCTL_UNDEFINED	GENMASK(7, 5)
> +#define CSIDPHY_CTRL_PWRCTL_SYNCRST	BIT(2)
> +#define CSIDPHY_CTRL_PWRCTL_LDO_PD	BIT(1)
> +#define CSIDPHY_CTRL_PWRCTL_PLL_PD	BIT(0)
> +
> +#define CSIDPHY_CTRL_DIG_RST			0x80
> +#define CSIDPHY_CTRL_DIG_RST_UNDEFINED		0x1e
> +#define CSIDPHY_CTRL_DIG_RST_RESET		BIT(0)
> +
> +
> +
> +

Too many new lines.

> +/* offset after CLK_THS_SETTLE */
> +#define CSIDPHY_CLK_THS_SETTLE			0
> +#define CSIDPHY_LANE_THS_SETTLE(n)		((n + 1) * 0x80)
> +#define CSIDPHY_THS_SETTLE_MASK			0x7f
> +
> +/* Configure the count time of the THS-SETTLE by protocol. */
> +#define RK1808_CSIDPHY_CLK_WR_THS_SETTLE	0x160
> +#define RK3326_CSIDPHY_CLK_WR_THS_SETTLE	0x100
> +#define RK3368_CSIDPHY_CLK_WR_THS_SETTLE	0x100
> +
> +
> +#define RK1808_CSI_DPHY_LANE0_WR_THS_SETTLE	\
> +		(RK1808_CSI_DPHY_CLK_WR_THS_SETTLE + 0x80)
> +#define RK1808_CSI_DPHY_LANE1_WR_THS_SETTLE	\
> +		(RK1808_CSI_DPHY_LANE0_WR_THS_SETTLE + 0x80)
> +#define RK1808_CSI_DPHY_LANE2_WR_THS_SETTLE	\
> +		(RK1808_CSI_DPHY_LANE1_WR_THS_SETTLE + 0x80)
> +#define RK1808_CSI_DPHY_LANE3_WR_THS_SETTLE	\
> +		(RK1808_CSI_DPHY_LANE2_WR_THS_SETTLE + 0x80)
> +
> +#define RK3326_CSI_DPHY_LANE0_WR_THS_SETTLE	\
> +		(RK3326_CSI_DPHY_CLK_WR_THS_SETTLE + 0x80)
> +#define RK3326_CSI_DPHY_LANE1_WR_THS_SETTLE	\
> +		(RK3326_CSI_DPHY_LANE0_WR_THS_SETTLE + 0x80)
> +#define RK3326_CSI_DPHY_LANE2_WR_THS_SETTLE	\
> +		(RK3326_CSI_DPHY_LANE1_WR_THS_SETTLE + 0x80)
> +#define RK3326_CSI_DPHY_LANE3_WR_THS_SETTLE	\
> +		(RK3326_CSI_DPHY_LANE2_WR_THS_SETTLE + 0x80)
> +
> +#define RK3368_CSI_DPHY_LANE0_WR_THS_SETTLE	\
> +		(RK3368_CSI_DPHY_CLK_WR_THS_SETTLE + 0x80)
> +#define RK3368_CSI_DPHY_LANE1_WR_THS_SETTLE	\
> +		(RK3368_CSI_DPHY_LANE0_WR_THS_SETTLE + 0x80)
> +#define RK3368_CSI_DPHY_LANE2_WR_THS_SETTLE	\
> +		(RK3368_CSI_DPHY_LANE1_WR_THS_SETTLE + 0x80)
> +#define RK3368_CSI_DPHY_LANE3_WR_THS_SETTLE	\
> +		(RK3368_CSI_DPHY_LANE2_WR_THS_SETTLE + 0x80)
> +
> +/* Calibration reception enable */
> +#define RK1808_CSIDPHY_CLK_CALIB_EN		0x168
> +
> +#define RK1808_CSI_DPHY_LANE0_CALIB_EN		0x1e8
> +#define RK1808_CSI_DPHY_LANE1_CALIB_EN		0x268
> +#define RK1808_CSI_DPHY_LANE2_CALIB_EN		0x2e8
> +#define RK1808_CSI_DPHY_LANE3_CALIB_EN		0x368
> +
> +#define RK3326_CSI_DPHY_CLK_CALIB_EN		\
> +		MIPI_CSI_DPHY_CTRL_INVALID_OFFSET
> +#define RK3326_CSI_DPHY_LANE0_CALIB_EN		\
> +		MIPI_CSI_DPHY_CTRL_INVALID_OFFSET
> +#define RK3326_CSI_DPHY_LANE1_CALIB_EN		\
> +		MIPI_CSI_DPHY_CTRL_INVALID_OFFSET
> +#define RK3326_CSI_DPHY_LANE2_CALIB_EN		\
> +		MIPI_CSI_DPHY_CTRL_INVALID_OFFSET
> +#define RK3326_CSI_DPHY_LANE3_CALIB_EN		\
> +		MIPI_CSI_DPHY_CTRL_INVALID_OFFSET
> +
> +#define RK3368_CSI_DPHY_CLK_CALIB_EN		\
> +		MIPI_CSI_DPHY_CTRL_INVALID_OFFSET
> +#define RK3368_CSI_DPHY_LANE0_CALIB_EN		\
> +		MIPI_CSI_DPHY_CTRL_INVALID_OFFSET
> +#define RK3368_CSI_DPHY_LANE1_CALIB_EN		\
> +		MIPI_CSI_DPHY_CTRL_INVALID_OFFSET
> +#define RK3368_CSI_DPHY_LANE2_CALIB_EN		\
> +		MIPI_CSI_DPHY_CTRL_INVALID_OFFSET
> +#define RK3368_CSI_DPHY_LANE3_CALIB_EN		\
> +		MIPI_CSI_DPHY_CTRL_INVALID_OFFSET
> +
> +#define HIWORD_UPDATE(val, mask, shift) \
> +	((val) << (shift) | (mask) << ((shift) + 16))
> +
> +enum dphy_reg_id {
> +	GRF_DPHY_RX0_TURNDISABLE = 0,
> +	GRF_DPHY_RX0_FORCERXMODE,
> +	GRF_DPHY_RX0_FORCETXSTOPMODE,
> +	GRF_DPHY_RX0_ENABLE,
> +	GRF_DPHY_RX0_TURNREQUEST,
> +	GRF_DPHY_TX0_TURNDISABLE,
> +	GRF_DPHY_TX0_FORCERXMODE,
> +	GRF_DPHY_TX0_FORCETXSTOPMODE,
> +	GRF_DPHY_TX0_TURNREQUEST,
> +	GRF_DPHY_RX1_SRC_SEL,
> +//	GRF_DVP_V18SEL,
> +	/* rk1808 & rk3326 */
> +	GRF_DPHY_CSIPHY_FORCERXMODE,
> +	GRF_DPHY_CSIPHY_CLKLANE_EN,
> +	GRF_DPHY_CSIPHY_DATALANE_EN,
> +	/* rk3368 only */
> +	GRF_ISP_MIPI_CSI_HOST_SEL,
> +};
> +
> +struct dphy_reg {
> +	u32 offset;
> +	u32 mask;
> +	u32 shift;
> +};
> +
> +#define PHY_REG(_offset, _width, _shift) \
> +	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, }
> +
> +static const struct dphy_reg rk1808_grf_dphy_regs[] = {
> +	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK1808_GRF_PD_VI_CON_OFFSET, 4, 0),
> +	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK1808_GRF_PD_VI_CON_OFFSET, 1, 8),
> +	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK1808_GRF_PD_VI_CON_OFFSET, 4, 4),
> +};
> +
> +static const struct dphy_reg rk3326_grf_dphy_regs[] = {
> +//	[GRF_DVP_V18SEL] = PHY_REG(RK3326_GRF_IO_VSEL_OFFSET, 1, 4),

Should this commented line be removed?

> +	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3326_GRF_PD_VI_CON_OFFSET, 4, 0),
> +	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3326_GRF_PD_VI_CON_OFFSET, 1, 8),
> +	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3326_GRF_PD_VI_CON_OFFSET, 4, 4),
> +};
> +
> +static const struct dphy_reg rk3368_grf_dphy_regs[] = {
> +//	[GRF_DVP_V18SEL] = PHY_REG(RK3368_GRF_IO_VSEL_OFFSET, 1, 1),

Ditto.

> +	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3368_GRF_SOC_CON6_OFFSET, 4, 8),
> +	[GRF_ISP_MIPI_CSI_HOST_SEL] = PHY_REG(RK3368_GRF_SOC_CON6_OFFSET, 1, 1),
> +//	[GRF_CON_DISABLE_ISP] = PHY_REG(RK3368_GRF_SOC_CON6_OFFSET, 1, 0),

Ditto.

> +};
> +
> +struct hsfreq_range {
> +	u32 range_h;
> +	u8 cfg_bit;
> +};
> +
> +struct rockchip_inno_csidphy;
> +
> +struct dphy_drv_data {
> +	int pwrctl_offset;
> +	int ths_settle_offset;
> +	int calib_offset;
> +	const struct hsfreq_range *hsfreq_ranges;
> +	int num_hsfreq_ranges;
> +	const struct dphy_reg *grf_regs;
> +	void (*individual_init)(struct rockchip_inno_csidphy *priv);
> +};
> +
> +struct rockchip_inno_csidphy {
> +	struct device *dev;
> +	void __iomem *phy_base;
> +	struct clk *pclk;
> +	struct regmap *grf;
> +	struct reset_control *rst;
> +	const struct dphy_drv_data *drv_data;
> +	struct phy_configure_opts_mipi_dphy config;
> +	u8 hsfreq;
> +};
> +
> +static inline void write_grf_reg(struct rockchip_inno_csidphy *priv,

It seems it would be better to receive struct dphy_drv_data instead.

> +				 int index, u8 value)
> +{
> +	struct dphy_drv_data *drv_data = priv->drv_data;
> +	const struct dphy_reg *reg = &drv_data->grf_regs[index];
> +	unsigned int val = HIWORD_UPDATE(value, reg->mask, reg->shift);
> +
> +	if (reg->offset)

Is this check required?

> +		regmap_write(priv->grf, reg->offset, val);
> +}
> +
> +static inline u32 read_grf_reg(struct rockchip_inno_csidphy *priv, int index)

This function seems to be unused.

> +{
> +	struct dphy_drv_data *drv_data = priv->drv_data;
> +	const struct dphy_reg *reg = &drv_data->grf_regs[index];
> +	unsigned int val = 0;
> +
> +	if (reg->offset) {

Is this check required?

> +		regmap_read(priv->grf, reg->offset, &val);
> +		val = (val >> reg->shift) & reg->mask;
> +	}
> +	return val;
> +}
> +
> +/* These tables must be sorted by .range_h ascending. */
> +static const struct hsfreq_range rk1808_mipidphy_hsfreq_ranges[] = {
> +	{ 109, 0x02}, { 149, 0x03}, { 199, 0x06}, { 249, 0x06},
> +	{ 299, 0x06}, { 399, 0x08}, { 499, 0x0b}, { 599, 0x0e},
> +	{ 699, 0x10}, { 799, 0x12}, { 999, 0x16}, {1199, 0x1e},
> +	{1399, 0x23}, {1599, 0x2d}, {1799, 0x32}, {1999, 0x37},
> +	{2199, 0x3c}, {2399, 0x41}, {2499, 0x46}
> +};
> +
> +static const struct hsfreq_range rk3326_mipidphy_hsfreq_ranges[] = {
> +	{ 109, 0x00}, { 149, 0x01}, { 199, 0x02}, { 249, 0x03},
> +	{ 299, 0x04}, { 399, 0x05}, { 499, 0x06}, { 599, 0x07},
> +	{ 699, 0x08}, { 799, 0x09}, { 899, 0x0a}, {1099, 0x0b},
> +	{1249, 0x0c}, {1349, 0x0d}, {1500, 0x0e}
> +};
> +
> +static const struct hsfreq_range rk3368_mipidphy_hsfreq_ranges[] = {
> +	{ 109, 0x00}, { 149, 0x01}, { 199, 0x02}, { 249, 0x03},
> +	{ 299, 0x04}, { 399, 0x05}, { 499, 0x06}, { 599, 0x07},
> +	{ 699, 0x08}, { 799, 0x09}, { 899, 0x0a}, {1099, 0x0b},
> +	{1249, 0x0c}, {1349, 0x0d}, {1500, 0x0e}
> +};
> +
> +static void default_mipidphy_individual_init(struct rockchip_inno_csidphy *priv)
> +{
> +}
> +
> +static void rk3368_mipidphy_individual_init(struct rockchip_inno_csidphy *priv)
> +{
> +	/* isp select */
> +	write_grf_reg(priv, GRF_ISP_MIPI_CSI_HOST_SEL, 1);
> +}
> +
> +static void rockchip_inno_csidphy_ths_settle(struct rockchip_inno_csidphy *priv,
> +					     int hsfreq, int offset)
> +{
> +	struct dphy_drv_data *drv_data = priv->drv_data;
> +	u32 val;
> +
> +	val = readl(priv->phy_base + drv_data->ths_settle_offset + offset);
> +	val &= ~CSIDPHY_THS_SETTLE_MASK;
> +	val |= hsfreq;
> +	writel(val, priv->phy_base + drv_data->ths_settle_offset + offset);
> +}
> +
> +static int rockchip_inno_csidphy_configure(struct phy *phy,
> +					   union phy_configure_opts *opts)
> +{
> +	struct rockchip_inno_csidphy *priv = phy_get_drvdata(phy);
> +	struct dphy_drv_data *drv_data = priv->drv_data;
> +	struct phy_configure_opts_mipi_dphy *config = &opts->mipi_dphy;
> +	unsigned int hsfreq = 0;
> +	unsigned int i;
> +	u64 data_rate_mbps;
> +	int ret;
> +
> +	/* pass with phy_mipi_dphy_get_default_config (with pixel rate?) */
> +	ret = phy_mipi_dphy_config_validate(config);
> +	if (ret)
> +		return ret;
> +
> +	data_rate_mbps = div_u64(config->hs_clk_rate, 1000 * 1000);
> +
> +	dev_dbg(priv->dev, "lanes %d - data_rate_mbps %llu\n",
> +		config->lanes, data_rate_mbps);
> +	for (i = 0; i < drv_data->num_hsfreq_ranges; i++) {
> +		if (drv_data->hsfreq_ranges[i].range_h >= data_rate_mbps) {
> +			hsfreq = drv_data->hsfreq_ranges[i].cfg_bit;
> +			break;
> +		}
> +	}
> +	if (!hsfreq)
> +		return -EINVAL;
> +
> +	priv->hsfreq = hsfreq;
> +	priv->config = *config;
> +	return 0;
> +}
> +
> +static int rockchip_inno_csidphy_power_on(struct phy *phy)
> +{
> +	struct rockchip_inno_csidphy *priv = phy_get_drvdata(phy);
> +	struct dphy_drv_data *drv_data = priv->drv_data;
> +	u32 val = 0;
> +	int ret, i;
> +
> +	u64 data_rate_mbps;
> +
> +	data_rate_mbps = div_u64(priv->config.hs_clk_rate, 1000 * 1000);
> +
> +	ret = clk_enable(priv->pclk);
> +	if (ret < 0)
> +		return ret;
> +
> +//	write_grf_reg(priv, GRF_DVP_V18SEL, 0x1);
> +
> +	/* phy start */
> +	if (drv_data->pwrctl_offset >= 0)
> +		writel(CSIDPHY_CTRL_PWRCTL_UNDEFINED |
> +		       CSIDPHY_CTRL_PWRCTL_SYNCRST,
> +		       priv->phy_base + drv_data->pwrctl_offset);
> +
> +	/* set data lane num and enable clock lane */
> +	val = GENMASK(priv->config.lanes - 1, 0) << CSIDPHY_CTRL_LANE_ENABLE_SHIFT;
> +	writel(val | CSIDPHY_CTRL_LANE_ENABLE_CK |
> +	       CSIDPHY_CTRL_LANE_ENABLE_UNDEFINED,
> +	       priv->phy_base + CSIDPHY_CTRL_LANE_ENABLE);
> +
> +	/* Reset dphy analog part */
> +	if (drv_data->pwrctl_offset >= 0)
> +		writel(CSIDPHY_CTRL_PWRCTL_UNDEFINED,
> +		       priv->phy_base + drv_data->pwrctl_offset);
> +	usleep_range(500, 1000);
> +
> +

double new line.

> +	/* Reset dphy digital part */
> +	writel(CSIDPHY_CTRL_DIG_RST_UNDEFINED,
> +	       priv->phy_base + CSIDPHY_CTRL_DIG_RST);
> +	writel(CSIDPHY_CTRL_DIG_RST_UNDEFINED + CSIDPHY_CTRL_DIG_RST_RESET,
> +	       priv->phy_base + CSIDPHY_CTRL_DIG_RST);
> +
> +	/* not into receive mode/wait stopstate */
> +	write_grf_reg(priv, GRF_DPHY_CSIPHY_FORCERXMODE, 0x0);
> +
> +	/* enable calibration */
> +/* FIXME: reenable
> +	if (data_rate_mbps > 1500) {
> +		write_csiphy_reg(priv, CSIPHY_CLK_CALIB_ENABLE, 0x80);
> +		if (priv->config.lanes > 0)
> +			write_csiphy_reg(priv, CSIPHY_LANE0_CALIB_ENABLE, 0x80);
> +		if (priv->config.lanes > 1)
> +			write_csiphy_reg(priv, CSIPHY_LANE1_CALIB_ENABLE, 0x80);
> +		if (priv->config.lanes > 2)
> +			write_csiphy_reg(priv, CSIPHY_LANE2_CALIB_ENABLE, 0x80);
> +		if (priv->config.lanes > 3)
> +			write_csiphy_reg(priv, CSIPHY_LANE3_CALIB_ENABLE, 0x80);
> +	} */

maybe fix identation and add an explanation explaning why this is commented?
#if 0 ?

> +
> +	rockchip_inno_csidphy_ths_settle(priv, priv->hsfreq,
> +					 CSIDPHY_CLK_THS_SETTLE);
> +	for (i = 0; i < priv->config.lanes; i++)
> +		rockchip_inno_csidphy_ths_settle(priv, priv->hsfreq,
> +						 CSIDPHY_LANE_THS_SETTLE(i));
> +
> +//	write_grf_reg(priv, GRF_DPHY_CLK_INV_SEL, 0x1);

commented code line.

> +	write_grf_reg(priv, GRF_DPHY_CSIPHY_CLKLANE_EN, 0x1);
> +	write_grf_reg(priv, GRF_DPHY_CSIPHY_DATALANE_EN,
> +		      GENMASK(priv->config.lanes - 1, 0));
> +
> +	return 0;
> +}
> +
> +static int rockchip_inno_csidphy_power_off(struct phy *phy)
> +{
> +	struct rockchip_inno_csidphy *priv = phy_get_drvdata(phy);
> +	struct dphy_drv_data *drv_data = priv->drv_data;
> +
> +	/* disable all lanes */
> +	writel(CSIDPHY_CTRL_LANE_ENABLE_UNDEFINED,
> +	       priv->phy_base + CSIDPHY_CTRL_LANE_ENABLE);
> +
> +	/* disable pll and ldo */
> +	if (drv_data->pwrctl_offset >= 0)
> +		writel(CSIDPHY_CTRL_PWRCTL_UNDEFINED |
> +		       CSIDPHY_CTRL_PWRCTL_LDO_PD |
> +		       CSIDPHY_CTRL_PWRCTL_PLL_PD,
> +		       priv->phy_base + drv_data->pwrctl_offset);
> +	usleep_range(500, 1000);
> +
> +	clk_disable(priv->pclk);
> +
> +	return 0;
> +}
> +
> +static int rockchip_inno_csidphy_init(struct phy *phy)
> +{
> +	struct rockchip_inno_csidphy *priv = phy_get_drvdata(phy);
> +
> +	return clk_prepare(priv->pclk);
> +}
> +
> +static int rockchip_inno_csidphy_exit(struct phy *phy)
> +{
> +	struct rockchip_inno_csidphy *priv = phy_get_drvdata(phy);
> +
> +	clk_unprepare(priv->pclk);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops rockchip_inno_csidphy_ops = {
> +	.power_on	= rockchip_inno_csidphy_power_on,
> +	.power_off	= rockchip_inno_csidphy_power_off,
> +	.init		= rockchip_inno_csidphy_init,
> +	.exit		= rockchip_inno_csidphy_exit,
> +	.configure	= rockchip_inno_csidphy_configure,
> +	.owner		= THIS_MODULE,
> +};
> +
> +
> +static const struct dphy_drv_data rk1808_mipidphy_drv_data = {
> +	.pwrctl_offset = -1,
> +	.ths_settle_offset = RK1808_CSIDPHY_CLK_WR_THS_SETTLE,
> +	.calib_offset = RK1808_CSIDPHY_CLK_CALIB_EN,
> +	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
> +	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
> +	.grf_regs = rk1808_grf_dphy_regs,
> +
> +	.individual_init = default_mipidphy_individual_init,
> +};
> +
> +static const struct dphy_drv_data rk3326_mipidphy_drv_data = {
> +	.pwrctl_offset = CSIDPHY_CTRL_PWRCTL,
> +	.ths_settle_offset = RK3326_CSIDPHY_CLK_WR_THS_SETTLE,
> +	.calib_offset = -1,
> +	.hsfreq_ranges = rk3326_mipidphy_hsfreq_ranges,
> +	.num_hsfreq_ranges = ARRAY_SIZE(rk3326_mipidphy_hsfreq_ranges),
> +	.grf_regs = rk3326_grf_dphy_regs,
> +
> +	.individual_init = default_mipidphy_individual_init,
> +};
> +
> +static const struct dphy_drv_data rk3368_mipidphy_drv_data = {
> +	.pwrctl_offset = CSIDPHY_CTRL_PWRCTL,
> +	.ths_settle_offset = RK3368_CSIDPHY_CLK_WR_THS_SETTLE,
> +	.calib_offset = -1,
> +	.hsfreq_ranges = rk3368_mipidphy_hsfreq_ranges,
> +	.num_hsfreq_ranges = ARRAY_SIZE(rk3368_mipidphy_hsfreq_ranges),
> +	.grf_regs = rk3368_grf_dphy_regs,
> +
> +	.individual_init = rk3368_mipidphy_individual_init,
> +};
> +
> +static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
> +	{
> +		.compatible = "rockchip,px30-mipi-dphy",
> +		.data = &rk3326_mipidphy_drv_data,
> +	},
> +	{
> +		.compatible = "rockchip,rk1808-mipi-dphy-rx",
> +		.data = &rk1808_mipidphy_drv_data,
> +	},
> +	{
> +		.compatible = "rockchip,rk3326-mipi-dphy",
> +		.data = &rk3326_mipidphy_drv_data,
> +	},
> +	{
> +		.compatible = "rockchip,rk3368-mipi-dphy",
> +		.data = &rk3368_mipidphy_drv_data,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, rockchip_inno_csidphy_match_id);
> +
> +
> +static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
> +{
> +	struct rockchip_inno_csidphy *priv;
> +	struct device *dev = &pdev->dev;
> +	struct regmap *grf;
> +	struct phy_provider *phy_provider;
> +	struct phy *phy;
> +	int i, ret;

unused i.

> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->phy_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->phy_base))
> +		return PTR_ERR(priv->phy_base);
> +
> +	priv->pclk = devm_clk_get(dev, "pclk");
> +	if (IS_ERR(priv->pclk)) {
> +		ret = PTR_ERR(priv->pclk);
> +		dev_err(dev, "failed to get pclk: %d\n", ret);
> +		return ret;

Maybe just:

dev_err(dev, "failed to get pclk: %d\n", ret);
return PTR_ERR(priv->pclk);

> +	}
> +
> +	priv->rst = devm_reset_control_get(dev, "apb");
> +	if (IS_ERR(priv->rst)) {
> +		ret = PTR_ERR(priv->rst);
> +		dev_err(dev, "failed to get system reset control: %d\n", ret);
> +		return ret;

Ditto.

> +	}
> +
> +	priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						    "rockchip,grf");
> +	if (IS_ERR(priv->grf)) {
> +		dev_err(dev, "Can't find GRF syscon\n");
> +		return PTR_ERR(priv->grf);
> +	}
> +
> +	priv->drv_data = of_device_get_match_data(dev);
> +	if (!priv->drv_data) {
> +		dev_err(dev, "Can't find device data\n");
> +		return -ENODEV;
> +	}
> +
> +	phy = devm_phy_create(dev, NULL, &rockchip_inno_csidphy_ops);
> +	if (IS_ERR(phy)) {
> +		ret = PTR_ERR(phy);
> +		dev_err(dev, "failed to create phy: %d\n", ret);
> +		return ret;

Ditto.

> +	}
> +
> +	phy_set_drvdata(phy, priv);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(phy_provider)) {
> +		ret = PTR_ERR(phy_provider);
> +		dev_err(dev, "failed to register phy provider: %d\n", ret);
> +		return ret;

Ditto.

> +	}
> +
> +	pm_runtime_enable(dev);
> +
> +	priv->drv_data->individual_init(priv);
> +	return 0;
> +}
> +
> +static int rockchip_inno_csidphy_remove(struct platform_device *pdev)
> +{
> +	struct rockchip_inno_csidphy *priv = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(priv->dev);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver rockchip_inno_csidphy_driver = {
> +	.driver = {
> +			.name = "rockchip-inno-csidphy",
> +			.of_match_table = rockchip_inno_csidphy_match_id,
> +	},
> +	.probe = rockchip_inno_csidphy_probe,
> +	.remove = rockchip_inno_csidphy_remove,
> +};
> +
> +module_platform_driver(rockchip_inno_csidphy_driver);
> +MODULE_AUTHOR("Rockchip Camera/ISP team");
> +MODULE_DESCRIPTION("Rockchip MIPI RX DPHY driver");

Just to follow the model of phy-rockchip-dphy-rx0.c, maybe
"Rockchip MIPI Innosilicon RX DPHY driver"

Regards,
Helen

> +MODULE_LICENSE("Dual BSD/GPL");
> 
