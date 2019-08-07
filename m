Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 358CF84D86
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 15:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388379AbfHGNiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 09:38:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52884 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387982AbfHGNiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 09:38:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 2F64028C586
Subject: Re: [PATCH v8 04/14] media: rkisp1: add Rockchip MIPI Synopsys DPHY
 driver
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com,
        zyc@rock-chips.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        zhengsq@rock-chips.com
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-5-helen.koike@collabora.com>
 <20190807130558.GF822@valkosipuli.retiisi.org.uk>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <c61498b0-dd4c-53af-db82-169f8dfdc6bd@collabora.com>
Date:   Wed, 7 Aug 2019 10:37:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190807130558.GF822@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

thanks for your review,

On 8/7/19 10:05 AM, Sakari Ailus wrote:
> Hi Helen,
> 
> Thanks for the patchset.
> 
> On Tue, Jul 30, 2019 at 03:42:46PM -0300, Helen Koike wrote:
>> From: Jacob Chen <jacob2.chen@rock-chips.com>
>>
>> This commit adds a subdev driver for Rockchip MIPI Synopsys DPHY driver
>>
>> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
>> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
>> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
>> [migrate to phy framework]
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> [update for upstream]
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>
>> ---
>>
>> Changes in v8:
>> - Remove boiler plate license text
>>
>> Changes in v7:
>> - Migrate dphy specific code from
>> drivers/media/platform/rockchip/isp1/mipi_dphy_sy.c
>> to drivers/phy/rockchip/phy-rockchip-dphy.c
>> - Drop support for rk3288
>> - Drop support for dphy txrx
>> - code styling and checkpatch fixes
>>
>>  drivers/phy/rockchip/Kconfig             |   8 +
>>  drivers/phy/rockchip/Makefile            |   1 +
>>  drivers/phy/rockchip/phy-rockchip-dphy.c | 408 +++++++++++++++++++++++
>>  3 files changed, 417 insertions(+)
>>  create mode 100644 drivers/phy/rockchip/phy-rockchip-dphy.c
>>
>> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
>> index c454c90cd99e..afd072f135e6 100644
>> --- a/drivers/phy/rockchip/Kconfig
>> +++ b/drivers/phy/rockchip/Kconfig
>> @@ -9,6 +9,14 @@ config PHY_ROCKCHIP_DP
>>  	help
>>  	  Enable this to support the Rockchip Display Port PHY.
>>  
>> +config PHY_ROCKCHIP_DPHY
>> +	tristate "Rockchip MIPI Synopsys DPHY driver"
>> +	depends on ARCH_ROCKCHIP && OF
> 
> How about (...) || COMPILE_TEST ?
> 
>> +	select GENERIC_PHY_MIPI_DPHY
>> +	select GENERIC_PHY
>> +	help
>> +	  Enable this to support the Rockchip MIPI Synopsys DPHY.
>> +
>>  config PHY_ROCKCHIP_EMMC
>>  	tristate "Rockchip EMMC PHY Driver"
>>  	depends on ARCH_ROCKCHIP && OF
>> diff --git a/drivers/phy/rockchip/Makefile b/drivers/phy/rockchip/Makefile
>> index fd21cbaf40dd..f62e9010bcaf 100644
>> --- a/drivers/phy/rockchip/Makefile
>> +++ b/drivers/phy/rockchip/Makefile
>> @@ -1,5 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  obj-$(CONFIG_PHY_ROCKCHIP_DP)		+= phy-rockchip-dp.o
>> +obj-$(CONFIG_PHY_ROCKCHIP_DPHY)		+= phy-rockchip-dphy.o
>>  obj-$(CONFIG_PHY_ROCKCHIP_EMMC)		+= phy-rockchip-emmc.o
>>  obj-$(CONFIG_PHY_ROCKCHIP_INNO_HDMI)	+= phy-rockchip-inno-hdmi.o
>>  obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB2)	+= phy-rockchip-inno-usb2.o
>> diff --git a/drivers/phy/rockchip/phy-rockchip-dphy.c b/drivers/phy/rockchip/phy-rockchip-dphy.c
>> new file mode 100644
>> index 000000000000..3a29976c2dff
>> --- /dev/null
>> +++ b/drivers/phy/rockchip/phy-rockchip-dphy.c
>> @@ -0,0 +1,408 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Rockchip MIPI Synopsys DPHY driver
>> + *
>> + * Based on:
>> + *
>> + * Copyright (C) 2016 FuZhou Rockchip Co., Ltd.
>> + * Author: Yakir Yang <ykk@@rock-chips.com>
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/phy/phy-mipi-dphy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#define RK3399_GRF_SOC_CON9	0x6224
>> +#define RK3399_GRF_SOC_CON21	0x6254
>> +#define RK3399_GRF_SOC_CON22	0x6258
>> +#define RK3399_GRF_SOC_CON23	0x625c
>> +#define RK3399_GRF_SOC_CON24	0x6260
>> +#define RK3399_GRF_SOC_CON25	0x6264
>> +#define RK3399_GRF_SOC_STATUS1	0xe2a4
>> +
>> +#define CLOCK_LANE_HS_RX_CONTROL		0x34
>> +#define LANE0_HS_RX_CONTROL			0x44
>> +#define LANE1_HS_RX_CONTROL			0x54
>> +#define LANE2_HS_RX_CONTROL			0x84
>> +#define LANE3_HS_RX_CONTROL			0x94
>> +#define HS_RX_DATA_LANES_THS_SETTLE_CONTROL	0x75
>> +
>> +#define MAX_DPHY_CLK 8
>> +
>> +#define PHY_TESTEN_ADDR			(0x1 << 16)
>> +#define PHY_TESTEN_DATA			(0x0 << 16)
>> +#define PHY_TESTCLK			(0x1 << 1)
>> +#define PHY_TESTCLR			(0x1 << 0)
>> +#define THS_SETTLE_COUNTER_THRESHOLD	0x04
>> +
>> +#define HIWORD_UPDATE(val, mask, shift) \
>> +	((val) << (shift) | (mask) << ((shift) + 16))
>> +
>> +#define GRF_SOC_CON12                           0x0274
>> +
>> +#define GRF_EDP_REF_CLK_SEL_INTER_HIWORD_MASK   BIT(20)
>> +#define GRF_EDP_REF_CLK_SEL_INTER               BIT(4)
>> +
>> +#define GRF_EDP_PHY_SIDDQ_HIWORD_MASK           BIT(21)
>> +#define GRF_EDP_PHY_SIDDQ_ON                    0
>> +#define GRF_EDP_PHY_SIDDQ_OFF                   BIT(5)
>> +
>> +struct hsfreq_range {
>> +	u32 range_h;
>> +	u8 cfg_bit;
>> +};
>> +
>> +static const struct hsfreq_range rk3399_mipidphy_hsfreq_ranges[] = {
>> +	{  89, 0x00}, {  99, 0x10}, { 109, 0x20}, { 129, 0x01},
>> +	{ 139, 0x11}, { 149, 0x21}, { 169, 0x02}, { 179, 0x12},
>> +	{ 199, 0x22}, { 219, 0x03}, { 239, 0x13}, { 249, 0x23},
>> +	{ 269, 0x04}, { 299, 0x14}, { 329, 0x05}, { 359, 0x15},
>> +	{ 399, 0x25}, { 449, 0x06}, { 499, 0x16}, { 549, 0x07},
>> +	{ 599, 0x17}, { 649, 0x08}, { 699, 0x18}, { 749, 0x09},
>> +	{ 799, 0x19}, { 849, 0x29}, { 899, 0x39}, { 949, 0x0a},
>> +	{ 999, 0x1a}, {1049, 0x2a}, {1099, 0x3a}, {1149, 0x0b},
>> +	{1199, 0x1b}, {1249, 0x2b}, {1299, 0x3b}, {1349, 0x0c},
>> +	{1399, 0x1c}, {1449, 0x2c}, {1500, 0x3c}
>> +};
>> +
>> +static const char * const rk3399_mipidphy_clks[] = {
>> +	"dphy-ref",
>> +	"dphy-cfg",
>> +	"grf",
>> +};
>> +
>> +enum dphy_reg_id {
>> +	GRF_DPHY_RX0_TURNDISABLE = 0,
>> +	GRF_DPHY_RX0_FORCERXMODE,
>> +	GRF_DPHY_RX0_FORCETXSTOPMODE,
>> +	GRF_DPHY_RX0_ENABLE,
>> +	GRF_DPHY_RX0_TESTCLR,
>> +	GRF_DPHY_RX0_TESTCLK,
>> +	GRF_DPHY_RX0_TESTEN,
>> +	GRF_DPHY_RX0_TESTDIN,
>> +	GRF_DPHY_RX0_TURNREQUEST,
>> +	GRF_DPHY_RX0_TESTDOUT,
>> +	GRF_DPHY_TX0_TURNDISABLE,
>> +	GRF_DPHY_TX0_FORCERXMODE,
>> +	GRF_DPHY_TX0_FORCETXSTOPMODE,
>> +	GRF_DPHY_TX0_TURNREQUEST,
>> +	GRF_DPHY_TX1RX1_TURNDISABLE,
>> +	GRF_DPHY_TX1RX1_FORCERXMODE,
>> +	GRF_DPHY_TX1RX1_FORCETXSTOPMODE,
>> +	GRF_DPHY_TX1RX1_ENABLE,
>> +	GRF_DPHY_TX1RX1_MASTERSLAVEZ,
>> +	GRF_DPHY_TX1RX1_BASEDIR,
>> +	GRF_DPHY_TX1RX1_ENABLECLK,
>> +	GRF_DPHY_TX1RX1_TURNREQUEST,
>> +	GRF_DPHY_RX1_SRC_SEL,
>> +	/* rk3288 only */
>> +	GRF_CON_DISABLE_ISP,
>> +	GRF_CON_ISP_DPHY_SEL,
>> +	GRF_DSI_CSI_TESTBUS_SEL,
>> +	GRF_DVP_V18SEL,
>> +	/* below is for rk3399 only */
>> +	GRF_DPHY_RX0_CLK_INV_SEL,
>> +	GRF_DPHY_RX1_CLK_INV_SEL,
>> +};
>> +
>> +struct dphy_reg {
>> +	u32 offset;
>> +	u32 mask;
>> +	u32 shift;
>> +};
>> +
>> +#define PHY_REG(_offset, _width, _shift) \
>> +	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, }
>> +
>> +static const struct dphy_reg rk3399_grf_dphy_regs[] = {
>> +	[GRF_DPHY_RX0_TURNREQUEST] = PHY_REG(RK3399_GRF_SOC_CON9, 4, 0),
>> +	[GRF_DPHY_RX0_CLK_INV_SEL] = PHY_REG(RK3399_GRF_SOC_CON9, 1, 10),
>> +	[GRF_DPHY_RX1_CLK_INV_SEL] = PHY_REG(RK3399_GRF_SOC_CON9, 1, 11),
>> +	[GRF_DPHY_RX0_ENABLE] = PHY_REG(RK3399_GRF_SOC_CON21, 4, 0),
>> +	[GRF_DPHY_RX0_FORCERXMODE] = PHY_REG(RK3399_GRF_SOC_CON21, 4, 4),
>> +	[GRF_DPHY_RX0_FORCETXSTOPMODE] = PHY_REG(RK3399_GRF_SOC_CON21, 4, 8),
>> +	[GRF_DPHY_RX0_TURNDISABLE] = PHY_REG(RK3399_GRF_SOC_CON21, 4, 12),
>> +	[GRF_DPHY_TX0_FORCERXMODE] = PHY_REG(RK3399_GRF_SOC_CON22, 4, 0),
>> +	[GRF_DPHY_TX0_FORCETXSTOPMODE] = PHY_REG(RK3399_GRF_SOC_CON22, 4, 4),
>> +	[GRF_DPHY_TX0_TURNDISABLE] = PHY_REG(RK3399_GRF_SOC_CON22, 4, 8),
>> +	[GRF_DPHY_TX0_TURNREQUEST] = PHY_REG(RK3399_GRF_SOC_CON22, 4, 12),
>> +	[GRF_DPHY_TX1RX1_ENABLE] = PHY_REG(RK3399_GRF_SOC_CON23, 4, 0),
>> +	[GRF_DPHY_TX1RX1_FORCERXMODE] = PHY_REG(RK3399_GRF_SOC_CON23, 4, 4),
>> +	[GRF_DPHY_TX1RX1_FORCETXSTOPMODE] = PHY_REG(RK3399_GRF_SOC_CON23, 4, 8),
>> +	[GRF_DPHY_TX1RX1_TURNDISABLE] = PHY_REG(RK3399_GRF_SOC_CON23, 4, 12),
>> +	[GRF_DPHY_TX1RX1_TURNREQUEST] = PHY_REG(RK3399_GRF_SOC_CON24, 4, 0),
>> +	[GRF_DPHY_RX1_SRC_SEL] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 4),
>> +	[GRF_DPHY_TX1RX1_BASEDIR] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 5),
>> +	[GRF_DPHY_TX1RX1_ENABLECLK] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 6),
>> +	[GRF_DPHY_TX1RX1_MASTERSLAVEZ] = PHY_REG(RK3399_GRF_SOC_CON24, 1, 7),
>> +	[GRF_DPHY_RX0_TESTDIN] = PHY_REG(RK3399_GRF_SOC_CON25, 8, 0),
>> +	[GRF_DPHY_RX0_TESTEN] = PHY_REG(RK3399_GRF_SOC_CON25, 1, 8),
>> +	[GRF_DPHY_RX0_TESTCLK] = PHY_REG(RK3399_GRF_SOC_CON25, 1, 9),
>> +	[GRF_DPHY_RX0_TESTCLR] = PHY_REG(RK3399_GRF_SOC_CON25, 1, 10),
>> +	[GRF_DPHY_RX0_TESTDOUT] = PHY_REG(RK3399_GRF_SOC_STATUS1, 8, 0),
>> +};
>> +
>> +struct dphy_drv_data {
>> +	const char * const *clks;
>> +	int num_clks;
>> +	const struct hsfreq_range *hsfreq_ranges;
>> +	int num_hsfreq_ranges;
>> +	const struct dphy_reg *regs;
>> +};
>> +
>> +struct rockchip_dphy {
>> +	struct device *dev;
>> +	struct regmap *grf;
>> +	const struct dphy_reg *grf_regs;
>> +	struct clk_bulk_data clks[MAX_DPHY_CLK];
>> +
>> +	const struct dphy_drv_data *drv_data;
>> +	struct phy_configure_opts_mipi_dphy config;
>> +};
>> +
>> +static inline void write_grf_reg(struct rockchip_dphy *priv,
>> +				 int index, u8 value)
>> +{
>> +	const struct dphy_reg *reg = &priv->grf_regs[index];
>> +	unsigned int val = HIWORD_UPDATE(value, reg->mask, reg->shift);
>> +
>> +	WARN_ON(!reg->offset);
>> +	regmap_write(priv->grf, reg->offset, val);
>> +}
>> +
>> +static void mipidphy0_wr_reg(struct rockchip_dphy *priv,
>> +			     u8 test_code, u8 test_data)
>> +{
>> +	/*
>> +	 * With the falling edge on TESTCLK, the TESTDIN[7:0] signal content
>> +	 * is latched internally as the current test code. Test data is
>> +	 * programmed internally by rising edge on TESTCLK.
>> +	 */
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLK, 1);
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TESTDIN, test_code);
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TESTEN, 1);
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLK, 0);
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TESTEN, 0);
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TESTDIN, test_data);
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLK, 1);
>> +}
>> +
>> +/* should be move to power_on */
>> +static int mipidphy_rx_stream_on(struct rockchip_dphy *priv)
>> +{
>> +	const struct dphy_drv_data *drv_data = priv->drv_data;
>> +	const struct hsfreq_range *hsfreq_ranges = drv_data->hsfreq_ranges;
>> +	struct phy_configure_opts_mipi_dphy *config = &priv->config;
>> +	unsigned int i, hsfreq = 0, data_rate_mbps = config->hs_clk_rate;
>> +	int num_hsfreq_ranges = drv_data->num_hsfreq_ranges;
>> +
>> +	do_div(data_rate_mbps, 1000 * 1000);
>> +
>> +	dev_dbg(priv->dev, "%s: lanes %d - data_rate_mbps %u\n",
>> +		__func__, config->lanes, data_rate_mbps);
>> +
>> +	for (i = 0; i < num_hsfreq_ranges; i++) {
>> +		if (hsfreq_ranges[i].range_h >= data_rate_mbps) {
>> +			hsfreq = hsfreq_ranges[i].cfg_bit;
>> +			break;
>> +		}
>> +	}
>> +
>> +	write_grf_reg(priv, GRF_DPHY_RX0_FORCERXMODE, 0);
>> +	write_grf_reg(priv, GRF_DPHY_RX0_FORCETXSTOPMODE, 0);
>> +
>> +	/* Disable lan turn around, which is ignored in receive mode */
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TURNREQUEST, 0);
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TURNDISABLE, 0xf);
>> +
>> +	write_grf_reg(priv, GRF_DPHY_RX0_ENABLE, GENMASK(config->lanes - 1, 0));
>> +
>> +	/* dphy start */
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLK, 1);
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLR, 1);
>> +	usleep_range(100, 150);
>> +	write_grf_reg(priv, GRF_DPHY_RX0_TESTCLR, 0);
>> +	usleep_range(100, 150);
>> +
>> +	/* set clock lane */
>> +	/* HS hsfreq_range & lane 0  settle bypass */
>> +	mipidphy0_wr_reg(priv, CLOCK_LANE_HS_RX_CONTROL, 0);
>> +	/* HS RX Control of lane0 */
>> +	mipidphy0_wr_reg(priv, LANE0_HS_RX_CONTROL, hsfreq << 1);
>> +	/* HS RX Control of lane1 */
>> +	mipidphy0_wr_reg(priv, LANE1_HS_RX_CONTROL, 0);
>> +	/* HS RX Control of lane2 */
>> +	mipidphy0_wr_reg(priv, LANE2_HS_RX_CONTROL, 0);
>> +	/* HS RX Control of lane3 */
>> +	mipidphy0_wr_reg(priv, LANE3_HS_RX_CONTROL, 0);
>> +	/* HS RX Data Lanes Settle State Time Control */
>> +	mipidphy0_wr_reg(priv, HS_RX_DATA_LANES_THS_SETTLE_CONTROL,
>> +			 THS_SETTLE_COUNTER_THRESHOLD);
>> +
>> +	/* Normal operation */
>> +	mipidphy0_wr_reg(priv, 0x0, 0);
>> +
>> +	return 0;
>> +}
>> +
>> +static int rockchip_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
>> +{
>> +	struct rockchip_dphy *priv = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	/* pass with phy_mipi_dphy_get_default_config (with pixel rate?) */
>> +	ret = phy_mipi_dphy_config_validate(&opts->mipi_dphy);
>> +	if (ret)
>> +		return ret;
>> +
>> +	memcpy(&priv->config, opts, sizeof(priv->config));
> 
> You could to:
> 
> 	priv->config = *opts;
> 
> Up to you. Some people like memcpy(). :-)

your way is better thanks!

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int rockchip_dphy_power_on(struct phy *phy)
>> +{
>> +	struct rockchip_dphy *priv = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	ret = clk_bulk_enable(priv->drv_data->num_clks, priv->clks);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return mipidphy_rx_stream_on(priv);
>> +}
>> +
>> +static int rockchip_dphy_power_off(struct phy *phy)
>> +{
>> +	struct rockchip_dphy *priv = phy_get_drvdata(phy);
>> +
>> +	clk_bulk_disable(priv->drv_data->num_clks, priv->clks);
>> +	return 0;
>> +}
>> +
>> +static int rockchip_dphy_init(struct phy *phy)
>> +{
>> +	struct rockchip_dphy *priv = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	ret = clk_bulk_prepare(priv->drv_data->num_clks, priv->clks);
> 
> return ...;
> 
>> +	if (ret)
>> +		return ret;
>> +	return 0;
>> +}
>> +
>> +static int rockchip_dphy_exit(struct phy *phy)
>> +{
>> +	struct rockchip_dphy *priv = phy_get_drvdata(phy);
>> +
>> +	clk_bulk_unprepare(priv->drv_data->num_clks, priv->clks);
>> +	return 0;
>> +}
>> +
>> +static const struct phy_ops rockchip_dphy_ops = {
>> +	.power_on	= rockchip_dphy_power_on,
>> +	.power_off	= rockchip_dphy_power_off,
>> +	.init		= rockchip_dphy_init,
>> +	.exit		= rockchip_dphy_exit,
>> +	.configure	= rockchip_dphy_configure,
>> +	.owner		= THIS_MODULE,
>> +};
>> +
>> +static const struct dphy_drv_data rk3399_mipidphy_drv_data = {
>> +	.clks = rk3399_mipidphy_clks,
>> +	.num_clks = ARRAY_SIZE(rk3399_mipidphy_clks),
>> +	.hsfreq_ranges = rk3399_mipidphy_hsfreq_ranges,
>> +	.num_hsfreq_ranges = ARRAY_SIZE(rk3399_mipidphy_hsfreq_ranges),
>> +	.regs = rk3399_grf_dphy_regs,
> 
> Do you expect to support more of the similar PHY(s) --- are there such? If
> not, you could put these in the code that uses them.

Yes, for rk3288 in the future.

Regards,
Helen

> 
>> +};
>> +
>> +static const struct of_device_id rockchip_dphy_dt_ids[] = {
>> +	{
>> +		.compatible = "rockchip,rk3399-mipi-dphy",
>> +		.data = &rk3399_mipidphy_drv_data,
>> +	},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, rockchip_dphy_dt_ids);
>> +
>> +static int rockchip_dphy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = dev->of_node;
>> +	const struct dphy_drv_data *drv_data;
>> +	struct phy_provider *phy_provider;
>> +	const struct of_device_id *of_id;
>> +	struct rockchip_dphy *priv;
>> +	struct regmap *grf;
>> +	struct phy *phy;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	if (!dev->parent || !dev->parent->of_node)
>> +		return -ENODEV;
>> +
>> +	if (platform_get_resource(pdev, IORESOURCE_MEM, 0)) {
>> +		dev_err(&pdev->dev, "Rockchip DPHY driver only suports rx\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +	priv->dev = dev;
>> +
>> +	grf = syscon_node_to_regmap(dev->parent->of_node);
>> +	if (IS_ERR(grf)) {
>> +		grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>> +						      "rockchip,grf");
>> +		if (IS_ERR(grf)) {
>> +			dev_err(dev, "Can't find GRF syscon\n");
>> +			return -ENODEV;
>> +		}
>> +	}
>> +	priv->grf = grf;
>> +
>> +	of_id = of_match_device(rockchip_dphy_dt_ids, dev);
>> +	if (!of_id)
>> +		return -EINVAL;
>> +
>> +	drv_data = of_id->data;
>> +	priv->grf_regs = drv_data->regs;
>> +	priv->drv_data = drv_data;
>> +	for (i = 0; i < drv_data->num_clks; i++)
>> +		priv->clks[i].id = drv_data->clks[i];
>> +	ret = devm_clk_bulk_get(&pdev->dev, drv_data->num_clks, priv->clks);
>> +	if (ret)
>> +		return ret;
>> +
>> +	phy = devm_phy_create(dev, np, &rockchip_dphy_ops);
>> +	if (IS_ERR(phy)) {
>> +		dev_err(dev, "failed to create phy\n");
>> +		return PTR_ERR(phy);
>> +	}
>> +	phy_set_drvdata(phy, priv);
>> +
>> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +
>> +	return PTR_ERR_OR_ZERO(phy_provider);
>> +}
>> +
>> +static struct platform_driver rockchip_dphy_driver = {
>> +	.probe = rockchip_dphy_probe,
>> +	.driver = {
>> +		.name	= "rockchip-mipi-dphy",
>> +		.of_match_table = rockchip_dphy_dt_ids,
>> +	},
>> +};
>> +module_platform_driver(rockchip_dphy_driver);
>> +
>> +MODULE_AUTHOR("Ezequiel Garcia <ezequiel@collabora.com>");
>> +MODULE_DESCRIPTION("Rockchip MIPI Synopsys DPHY driver");
>> +MODULE_LICENSE("Dual MIT/GPL");
> 
