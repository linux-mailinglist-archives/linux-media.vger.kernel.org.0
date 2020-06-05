Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24C91EF72E
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 14:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgFEMVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 08:21:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:28034 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726416AbgFEMVI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jun 2020 08:21:08 -0400
IronPort-SDR: vKM9M4n+vnttiTSYM06mYTRmuzjL49fYJ1DNXRRq6Y7Zc17Aj+wF7WkFk/HlvMBOr9LjelgO9Z
 wBAVcKDUE7Yg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2020 05:15:05 -0700
IronPort-SDR: PYCybtNIwO//XYU45a8RSO6bixWRVfZdJJMznSZsDsR4y3rnFUS8UnWtu3ahPjuNZnjuG6Bn7f
 Rdp1ri3p2Qug==
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; 
   d="scan'208";a="259171411"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2020 05:15:01 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D1A81205D2; Fri,  5 Jun 2020 15:14:59 +0300 (EEST)
Date:   Fri, 5 Jun 2020 15:14:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200605121459.GS16711@paasikivi.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605105412.18813-3-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

Thank you for the update.

On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> control to set the desired focus via IIC serial interface.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/media/i2c/Kconfig  |  13 ++
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/dw9768.c | 566 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 581 insertions(+)
>  create mode 100644 drivers/media/i2c/dw9768.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d72c41..c92dc99 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5157,6 +5157,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> +F:	drivers/media/i2c/dw9768.c
>  
>  DONGWOON DW9807 LENS VOICE COIL DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 125d596..afdf994 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1040,6 +1040,19 @@ config VIDEO_DW9714
>  	  capability. This is designed for linear control of
>  	  voice coil motors, controlled via I2C serial interface.
>  
> +config VIDEO_DW9768
> +	tristate "DW9768 lens voice coil support"
> +	depends on I2C && VIDEO_V4L2
> +	depends on PM
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	help
> +	  This is a driver for the DW9768 camera lens voice coil.
> +	  DW9768 is a 10 bit DAC with 100mA output current sink
> +	  capability. This is designed for linear control of
> +	  voice coil motors, controlled via I2C serial interface.
> +
>  config VIDEO_DW9807_VCM
>  	tristate "DW9807 lens voice coil support"
>  	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 77bf7d0..4057476 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
>  obj-$(CONFIG_VIDEO_AD5820)  += ad5820.o
>  obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
>  obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
> +obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
>  obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
>  obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
>  obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> new file mode 100644
> index 0000000..f34a8ed
> --- /dev/null
> +++ b/drivers/media/i2c/dw9768.c
> @@ -0,0 +1,566 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 MediaTek Inc.
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define DW9768_NAME				"dw9768"
> +#define DW9768_MAX_FOCUS_POS			(1024 - 1)
> +/*
> + * This sets the minimum granularity for the focus positions.
> + * A value of 1 gives maximum accuracy for a desired focus position
> + */
> +#define DW9768_FOCUS_STEPS			1
> +
> +/*
> + * Ring control and Power control register
> + * Bit[1] RING_EN
> + * 0: Direct mode
> + * 1: AAC mode (ringing control mode)
> + * Bit[0] PD
> + * 0: Normal operation mode
> + * 1: Power down mode
> + * DW9768 requires waiting time of Topr after PD reset takes place.
> + */
> +#define DW9768_RING_PD_CONTROL_REG		0x02
> +#define DW9768_PD_MODE_OFF			0x00
> +#define DW9768_PD_MODE_EN			BIT(0)
> +#define DW9768_AAC_MODE_EN			BIT(1)
> +
> +/*
> + * DW9768 separates two registers to control the VCM position.
> + * One for MSB value, another is LSB value.
> + * DAC_MSB: D[9:8] (ADD: 0x03)
> + * DAC_LSB: D[7:0] (ADD: 0x04)
> + * D[9:0] DAC data input: positive output current = D[9:0] / 1023 * 100[mA]
> + */
> +#define DW9768_MSB_ADDR				0x03
> +#define DW9768_LSB_ADDR				0x04
> +#define DW9768_STATUS_ADDR			0x05
> +
> +/*
> + * AAC mode control & prescale register
> + * Bit[7:5] Namely AC[2:0], decide the VCM mode and operation time.
> + * 001 AAC2 0.48 x Tvib
> + * 010 AAC3 0.70 x Tvib
> + * 011 AAC4 0.75 x Tvib
> + * 101 AAC8 1.13 x Tvib
> + * Bit[2:0] Namely PRESC[2:0], set the internal clock dividing rate as follow.
> + * 000 2
> + * 001 1
> + * 010 1/2
> + * 011 1/4
> + * 100 8
> + * 101 4
> + */
> +#define DW9768_AAC_PRESC_REG			0x06
> +#define DW9768_AAC_MODE_SEL_MASK		GENMASK(7, 5)
> +#define DW9768_CLOCK_PRE_SCALE_SEL_MASK		GENMASK(2, 0)
> +
> +/*
> + * VCM period of vibration register
> + * Bit[5:0] Defined as VCM rising periodic time (Tvib) together with PRESC[2:0]
> + * Tvib = (6.3ms + AACT[5:0] * 0.1ms) * Dividing Rate
> + * Dividing Rate is the internal clock dividing rate that is defined at
> + * PRESCALE register (ADD: 0x06)
> + */
> +#define DW9768_AAC_TIME_REG			0x07
> +
> +/*
> + * DW9768 requires waiting time (delay time) of t_OPR after power-up,
> + * or in the case of PD reset taking place.
> + */
> +#define DW9768_T_OPR_US				1000
> +#define DW9768_Tvib_MS_BASE10			(64 - 1)
> +#define DW9768_AAC_MODE_DEFAULT			2
> +#define DW9768_AAC_TIME_DEFAULT			0x20
> +#define DW9768_CLOCK_PRE_SCALE_DEFAULT		1
> +
> +/*
> + * This acts as the minimum granularity of lens movement.
> + * Keep this value power of 2, so the control steps can be
> + * uniformly adjusted for gradual lens movement, with desired
> + * number of control steps.
> + */
> +#define DW9768_MOVE_STEPS			16
> +
> +static const char * const dw9768_supply_names[] = {
> +	"vin",	/* Digital I/O power */
> +	"vdd",	/* Digital core power */
> +};
> +
> +/* dw9768 device structure */
> +struct dw9768 {
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(dw9768_supply_names)];
> +	struct v4l2_ctrl_handler ctrls;
> +	struct v4l2_ctrl *focus;
> +	struct v4l2_subdev sd;
> +
> +	u32 aac_mode;
> +	u32 aac_timing;
> +	u32 clock_presc;
> +};
> +
> +static inline struct dw9768 *sd_to_dw9768(struct v4l2_subdev *subdev)
> +{
> +	return container_of(subdev, struct dw9768, sd);
> +}
> +
> +struct regval_list {
> +	u8 reg_num;
> +	u8 value;
> +};
> +
> +struct dw9768_aac_mode_ot_multi {
> +	u32 aac_mode_enum;
> +	u32 ot_multi_base100;
> +};
> +
> +struct dw9768_clk_presc_dividing_rate {
> +	u32 clk_presc_enum;
> +	u32 dividing_rate_base100;
> +};
> +
> +static const struct dw9768_aac_mode_ot_multi aac_mode_ot_multi[] = {
> +	{1,  48},
> +	{2,  70},
> +	{3,  75},
> +	{5, 113},
> +};
> +
> +static const struct dw9768_clk_presc_dividing_rate presc_dividing_rate[] = {
> +	{0, 200},
> +	{1, 100},
> +	{2,  50},
> +	{3,  25},
> +	{4, 800},
> +	{5, 400},
> +};
> +
> +static u32 dw9768_find_ot_multi(u32 aac_mode_param)
> +{
> +	u32 cur_ot_multi_base100 = 70;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(aac_mode_ot_multi); i++) {
> +		if (aac_mode_ot_multi[i].aac_mode_enum == aac_mode_param) {
> +			cur_ot_multi_base100 =
> +				aac_mode_ot_multi[i].ot_multi_base100;
> +		}
> +	}
> +
> +	return cur_ot_multi_base100;
> +}
> +
> +static u32 dw9768_find_dividing_rate(u32 presc_param)
> +{
> +	u32 cur_clk_dividing_rate_base100 = 100;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(presc_dividing_rate); i++) {
> +		if (presc_dividing_rate[i].clk_presc_enum == presc_param) {
> +			cur_clk_dividing_rate_base100 =
> +				presc_dividing_rate[i].dividing_rate_base100;
> +		}
> +	}
> +
> +	return cur_clk_dividing_rate_base100;
> +}
> +
> +/*
> + * DW9768_AAC_PRESC_REG & DW9768_AAC_TIME_REG determine VCM operation time.
> + * For current VCM mode: AAC3, Operation Time would be 0.70 x Tvib.
> + * Tvib = (6.3ms + AACT[5:0] * 0.1MS) * Dividing Rate.
> + * Below is calculation of the operation delay for each step.
> + */
> +static inline u32 dw9768_cal_move_delay(u32 aac_mode_param, u32 presc_param,
> +					u32 aac_timing_param)
> +{
> +	u32 Tvib_us;
> +	u32 ot_multi_base100;
> +	u32 clk_dividing_rate_base100;
> +
> +	ot_multi_base100 = dw9768_find_ot_multi(aac_mode_param);
> +
> +	clk_dividing_rate_base100 = dw9768_find_dividing_rate(presc_param);
> +
> +	Tvib_us = (DW9768_Tvib_MS_BASE10 + aac_timing_param) *
> +		  clk_dividing_rate_base100;
> +
> +	return Tvib_us * ot_multi_base100;
> +}
> +
> +static int dw9768_mod_reg(struct dw9768 *dw9768, u8 reg, u8 mask, u8 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(client, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = ((unsigned char)ret & ~mask) | (val & mask);
> +
> +	return i2c_smbus_write_byte_data(client, reg, val);
> +}
> +
> +static int dw9768_set_dac(struct dw9768 *dw9768, u16 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +
> +	/* Write VCM position to registers */
> +	return i2c_smbus_write_word_swapped(client, DW9768_MSB_ADDR, val);
> +}
> +
> +static int dw9768_init(struct dw9768 *dw9768)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +	u32 move_delay_us;
> +	int ret, val;
> +
> +	/* Reset DW9768_RING_PD_CONTROL_REG to default status 0x00 */
> +	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
> +					DW9768_PD_MODE_OFF);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * DW9769 requires waiting delay time of t_OPR
> +	 * after PD reset takes place.
> +	 */
> +	usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> +
> +	/* Set DW9768_RING_PD_CONTROL_REG to DW9768_AAC_MODE_EN(0x01) */
> +	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
> +					DW9768_AAC_MODE_EN);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set AAC mode */
> +	ret = dw9768_mod_reg(dw9768, DW9768_AAC_PRESC_REG,
> +			     DW9768_AAC_MODE_SEL_MASK,
> +			     dw9768->aac_mode << 5);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set clock presc */
> +	if (dw9768->clock_presc != DW9768_CLOCK_PRE_SCALE_DEFAULT) {
> +		ret = dw9768_mod_reg(dw9768, DW9768_AAC_PRESC_REG,
> +				     DW9768_CLOCK_PRE_SCALE_SEL_MASK,
> +				     dw9768->clock_presc);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Set AAC Timing */
> +	if (dw9768->aac_timing != DW9768_AAC_TIME_DEFAULT) {
> +		ret = i2c_smbus_write_byte_data(client, DW9768_AAC_TIME_REG,
> +						dw9768->aac_timing);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	move_delay_us = dw9768_cal_move_delay(dw9768->aac_mode,
> +					      dw9768->clock_presc,
> +					      dw9768->aac_timing) / 100;
> +
> +	for (val = dw9768->focus->val % DW9768_MOVE_STEPS;
> +	     val <= dw9768->focus->val;
> +	     val += DW9768_MOVE_STEPS) {
> +		ret = dw9768_set_dac(dw9768, val);
> +		if (ret) {
> +			dev_err(&client->dev, "%s I2C failure: %d",
> +				__func__, ret);
> +			return ret;
> +		}
> +		usleep_range(move_delay_us, move_delay_us + 1000);
> +	}
> +
> +	return 0;
> +}
> +
> +static int dw9768_release(struct dw9768 *dw9768)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +	u32 move_delay_us = dw9768_cal_move_delay(dw9768->aac_mode,
> +						  dw9768->clock_presc,
> +						  dw9768->aac_timing) / 100;
> +	int ret, val;
> +
> +	val = round_down(dw9768->focus->val, DW9768_MOVE_STEPS);
> +	for ( ; val >= 0; val -= DW9768_MOVE_STEPS) {
> +		ret = dw9768_set_dac(dw9768, val);
> +		if (ret) {
> +			dev_err(&client->dev, "I2C write fail: %d", ret);
> +			return ret;
> +		}
> +		usleep_range(move_delay_us, move_delay_us + 1000);
> +	}
> +
> +	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
> +					DW9768_PD_MODE_EN);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * DW9769 requires waiting delay time of t_OPR
> +	 * after PD reset takes place.
> +	 */
> +	usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> +
> +	return 0;
> +}
> +
> +static int dw9768_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> +
> +	dw9768_release(dw9768);
> +	regulator_bulk_disable(ARRAY_SIZE(dw9768_supply_names),
> +			       dw9768->supplies);
> +
> +	return 0;
> +}
> +
> +static int dw9768_runtime_resume(struct device *dev)

__maybe_unused for this and the suspend callback.

> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(dw9768_supply_names),
> +				    dw9768->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * The datasheet refers to t_OPR that needs to be waited before sending
> +	 * I2C commands after power-up.
> +	 */
> +	usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> +
> +	ret = dw9768_init(dw9768);
> +	if (ret < 0)
> +		goto disable_regulator;
> +
> +	return 0;
> +
> +disable_regulator:
> +	regulator_bulk_disable(ARRAY_SIZE(dw9768_supply_names),
> +			       dw9768->supplies);
> +
> +	return ret;
> +}
> +
> +static int dw9768_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct dw9768 *dw9768 = container_of(ctrl->handler,
> +					     struct dw9768, ctrls);
> +
> +	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
> +		return dw9768_set_dac(dw9768, ctrl->val);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops dw9768_ctrl_ops = {
> +	.s_ctrl = dw9768_set_ctrl,
> +};
> +
> +static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(sd->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(sd->dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	pm_runtime_put(sd->dev);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops dw9768_int_ops = {
> +	.open = dw9768_open,
> +	.close = dw9768_close,
> +};
> +
> +static const struct v4l2_subdev_ops dw9768_ops = { };
> +
> +static int dw9768_init_controls(struct dw9768 *dw9768)
> +{
> +	struct v4l2_ctrl_handler *hdl = &dw9768->ctrls;
> +	const struct v4l2_ctrl_ops *ops = &dw9768_ctrl_ops;
> +
> +	v4l2_ctrl_handler_init(hdl, 1);
> +
> +	dw9768->focus = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE, 0,
> +					  DW9768_MAX_FOCUS_POS,
> +					  DW9768_FOCUS_STEPS, 0);
> +
> +	if (hdl->error)
> +		return hdl->error;
> +
> +	dw9768->sd.ctrl_handler = hdl;
> +
> +	return 0;
> +}
> +
> +static int dw9768_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct dw9768 *dw9768;
> +	u32 aac_mode_select;
> +	u32 aac_timing_select;
> +	u32 clock_presc_select;
> +	unsigned int i;
> +	int ret;
> +
> +	dw9768 = devm_kzalloc(dev, sizeof(*dw9768), GFP_KERNEL);
> +	if (!dw9768)
> +		return -ENOMEM;
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&dw9768->sd, client, &dw9768_ops);
> +
> +	dw9768->aac_mode = DW9768_AAC_MODE_DEFAULT;
> +	dw9768->aac_timing = DW9768_AAC_TIME_DEFAULT;
> +	dw9768->clock_presc = DW9768_CLOCK_PRE_SCALE_DEFAULT;
> +
> +	/* Optional indication of AAC mode select */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "dongwoon,aac-mode",
> +				       &aac_mode_select);
> +
> +	if (!ret)
> +		dw9768->aac_mode = aac_mode_select;
> +
> +	/* Optional indication of clock pre-scale select */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "dongwoon,clock-presc",
> +				       &clock_presc_select);
> +
> +	if (!ret)
> +		dw9768->clock_presc = clock_presc_select;
> +
> +	/* Optional indication of AAC Timing */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "dongwoon,aac-timing",
> +				       &aac_timing_select);
> +
> +	if (!ret)
> +		dw9768->aac_timing = aac_timing_select;

You can assign the defaults to the dw9768 struct and use the fwnode
property API to read the properties into the same fields. No return values
need to be checked.

> +
> +	for (i = 0; i < ARRAY_SIZE(dw9768_supply_names); i++)
> +		dw9768->supplies[i].supply = dw9768_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dw9768_supply_names),
> +				      dw9768->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to get regulators\n");
> +		return ret;
> +	}
> +
> +	/* Initialize controls */
> +	ret = dw9768_init_controls(dw9768);
> +	if (ret)
> +		goto err_free_handler;
> +
> +	/* Initialize subdev */
> +	dw9768->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	dw9768->sd.internal_ops = &dw9768_int_ops;
> +
> +	ret = media_entity_pads_init(&dw9768->sd.entity, 0, NULL);
> +	if (ret < 0)
> +		goto err_free_handler;
> +
> +	dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	pm_runtime_enable(dev);
> +	if (!pm_runtime_enabled(dev)) {
> +		ret = dw9768_runtime_resume(dev);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to power on: %d\n", ret);
> +			goto err_clean_entity;
> +		}
> +	}
> +
> +	ret = v4l2_async_register_subdev(&dw9768->sd);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> +		goto error_async_register;
> +	}
> +
> +	return 0;
> +
> +error_async_register:
> +	if (!pm_runtime_enabled(dev))
> +		dw9768_runtime_suspend(dev);
> +err_clean_entity:
> +	media_entity_cleanup(&dw9768->sd.entity);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&dw9768->ctrls);
> +
> +	return ret;
> +}
> +
> +static int dw9768_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> +
> +	v4l2_async_unregister_subdev(&dw9768->sd);
> +	v4l2_ctrl_handler_free(&dw9768->ctrls);
> +	media_entity_cleanup(&dw9768->sd.entity);
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		dw9768_runtime_suspend(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id dw9768_of_table[] = {
> +	{ .compatible = "dongwoon,dw9768" },
> +	{ .compatible = "giantec,gt9769" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dw9768_of_table);
> +
> +static const struct dev_pm_ops dw9768_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(dw9768_runtime_suspend, dw9768_runtime_resume, NULL)
> +};
> +
> +static struct i2c_driver dw9768_i2c_driver = {
> +	.driver = {
> +		.name = DW9768_NAME,
> +		.pm = &dw9768_pm_ops,
> +		.of_match_table = dw9768_of_table,
> +	},
> +	.probe_new  = dw9768_probe,
> +	.remove = dw9768_remove,
> +};
> +module_i2c_driver(dw9768_i2c_driver);
> +
> +MODULE_AUTHOR("Dongchun Zhu <dongchun.zhu@mediatek.com>");
> +MODULE_DESCRIPTION("DW9768 VCM driver");
> +MODULE_LICENSE("GPL v2");

-- 
Kind regards,

Sakari Ailus
