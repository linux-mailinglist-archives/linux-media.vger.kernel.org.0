Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A74B933DD4D
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 20:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240344AbhCPTUn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 15:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236324AbhCPTUf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 15:20:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB42C06174A;
        Tue, 16 Mar 2021 12:20:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79E098C8;
        Tue, 16 Mar 2021 20:20:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615922433;
        bh=L15rHz38WnMN2fSaCg/WU5+5i+u3XJZM9eoEQQdFN9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NzNonfT7DDBo4AM22qOhTnN0QuH7jVnVkWozv8UdHyiedOTJaJWc3WrWvmw7KHwjc
         0I7w+fsQduQdQT4PalTMQ5FHxSlwSm5UyrYpXuQooxSyZB+uXe962ovYaUfJZgm6qU
         eVqkq/lk5la/OVw60cLPvfo1ZiqOqrvcryoyAXyQ=
Date:   Tue, 16 Mar 2021 21:19:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: RFC: MEDIA: Driver for ON Semi AR0521 camera sensor
Message-ID: <YFEE3WYdECCQRYxl@pendragon.ideasonboard.com>
References: <m3mtv3s01z.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3mtv3s01z.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

Thank you for the patch.

On Tue, Mar 16, 2021 at 02:25:12PM +0100, Krzysztof Hałasa wrote:
> Is there a reliable way to include national unicode characters in the
> kernel sources?

It depends where. In comments it shouldn't be a problem. In C code, I
don't think the compiler will be too happy.

> For review only. This will be signed off when (if) the driver is
> accepted.

Signed-off-by means that you have the right to submit the code for
upstreaming, so it should be included in patches under review too.
Otherwise it's a waste of time for reviewers to review something that
may never be resubmitted with an SoB line.

I've done a first review, please see a few comments below. It probably
doesn't catch all issues, I've focussed on the larger ones first.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index bfc1b86e3e73..20514c00909b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1294,6 +1294,12 @@ S:	Supported
>  W:	http://www.aquantia.com
>  F:	drivers/net/ethernet/aquantia/atlantic/aq_ptp*
>  
> +AR0521 ON SEMICONDUCTOR CAMERA SENSOR DRIVER
> +M:	Krzysztof Halasa <khalasa@piap.pl>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/i2c/ar0521.c
> +
>  ARASAN NAND CONTROLLER DRIVER
>  M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
>  L:	linux-mtd@lists.infradead.org
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 2b9d81e4794a..b212af488b17 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -725,6 +725,16 @@ config VIDEO_APTINA_PLL
>  config VIDEO_CCS_PLL
>  	tristate
>  
> +config VIDEO_AR0521
> +	tristate "ON Semiconductor AR0521 sensor support"
> +	depends on I2C && VIDEO_V4L2
> +	help
> +	  This is a Video4Linux2 sensor driver for the ON Semiconductor
> +	  AR0521 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ar0521.
> +
>  config VIDEO_HI556
>  	tristate "Hynix Hi-556 sensor support"
>  	depends on I2C && VIDEO_V4L2
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index a3149dce21bb..4b21beb95147 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_VIDEO_CX25840) += cx25840/
>  obj-$(CONFIG_VIDEO_M5MOLS)	+= m5mols/
>  
>  obj-$(CONFIG_VIDEO_APTINA_PLL) += aptina-pll.o
> +obj-$(CONFIG_VIDEO_AR0521) += ar0521.o
>  obj-$(CONFIG_VIDEO_TVAUDIO) += tvaudio.o
>  obj-$(CONFIG_VIDEO_TDA7432) += tda7432.o
>  obj-$(CONFIG_VIDEO_SAA6588) += saa6588.o
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> new file mode 100644
> index 000000000000..395264f1a558
> --- /dev/null
> +++ b/drivers/media/i2c/ar0521.c
> @@ -0,0 +1,1087 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Siec Badawcza Lukasiewicz
> + * - Przemyslowy Instytut Automatyki i Pomiarow PIAP
> + * Written by Krzysztof Halasa
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include <linux/ctype.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/gpio/consumer.h>
> +#include <asm/div64.h>

Do you need the asm header, isn't there an appropriate header in linux/
?

> +#include <media/v4l2-async.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* External clock (xclk) frequencies */
> +#define AR0521_XCLK_RATE	  (27 * 1000 * 1000)
> +#define AR0521_XCLK_MIN		  (10 * 1000 * 1000)
> +#define AR0521_XCLK_MAX		  (48 * 1000 * 1000)
> +
> +/* PLL and PLL2 */
> +#define AR0521_PLL_MIN		 (320 * 1000 * 1000)
> +#define AR0521_PLL_MAX		(1280 * 1000 * 1000)
> +
> +/* effective pixel clocks, the registers may be DDR */
> +#define AR0521_PIXEL_CLOCK_MIN	 (168 * 1000 * 1000)
> +#define AR0521_PIXEL_CLOCK_MAX	 (414 * 1000 * 1000)
> +
> +#define AR0521_WIDTH_MIN	       8u

We usually use an uppercase U suffix.

> +#define AR0521_WIDTH_MAX	    2608u
> +#define AR0521_HEIGHT_MIN	       8u
> +#define AR0521_HEIGHT_MAX	    1958u
> +
> +// FIXME check them
> +#define AR0521_WIDTH_BLANKING_MIN     572u
> +#define AR0521_HEIGHT_BLANKING_MIN     28u /* must be even */
> +#define AR0521_TOTAL_WIDTH_MIN	     2968u
> +
> +/* AR0521 registers */
> +#define AR0521_REG_VT_PIX_CLK_DIV		0x0300
> +#define AR0521_REG_FRAME_LENGTH_LINES		0x0340
> +
> +#define AR0521_REG_CHIP_ID			0x3000
> +#define AR0521_REG_COARSE_INTEGRATION_TIME	0x3012
> +#define AR0521_REG_ROW_SPEED			0x3016
> +#define AR0521_REG_EXTRA_DELAY			0x3018
> +#define AR0521_REG_RESET			0x301A

But lowercase hex values. I know, lots of tribal (and sometimes
arbitrary) knowledge :-S

> +#define   AR0521_REG_RESET_DEFAULTS		  0x0238
> +#define   AR0521_REG_RESET_GROUP_PARAM_HOLD	  0x8000
> +#define   AR0521_REG_RESET_STREAM		  BIT(2)
> +#define   AR0521_REG_RESET_RESTART		  BIT(1)
> +#define   AR0521_REG_RESET_INIT			  BIT(0)
> +
> +#define AR0521_REG_GREEN1_GAIN			0x3056
> +#define AR0521_REG_BLUE_GAIN			0x3058
> +#define AR0521_REG_RED_GAIN			0x305A
> +#define AR0521_REG_GREEN2_GAIN			0x305C
> +#define AR0521_REG_GLOBAL_GAIN			0x305E
> +
> +#define AR0521_REG_HISPI_TEST_MODE		0x3066
> +#define AR0521_REG_HISPI_TEST_MODE_LP11		  0x0004
> +
> +#define AR0521_REG_TEST_PATTERN_MODE		0x3070
> +
> +#define AR0521_REG_SERIAL_FORMAT		0x31AE
> +#define AR0521_REG_SERIAL_FORMAT_MIPI		  0x0200
> +
> +#define AR0521_REG_HISPI_CONTROL_STATUS		0x31C6
> +#define AR0521_REG_HISPI_CONTROL_STATUS_FRAMER_TEST_MODE_ENABLE 0x80
> +
> +#define AR0521_NUM_SUPPLIES ARRAY_SIZE(ar0521_supply_name)

This macro isn't sued.

> +
> +struct ar0521_ctrls {
> +	struct v4l2_ctrl_handler handler;
> +	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *gain, *red_balance, *blue_balance;
> +	struct v4l2_ctrl *test_pattern;
> +};
> +
> +struct ar0521_dev {
> +	struct i2c_client *i2c_client;
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +	struct v4l2_fwnode_endpoint ep;
> +	struct clk *xclk;
> +	u32 xclk_freq;
> +
> +	struct gpio_desc *reset_gpio;
> +
> +	/* lock to protect all members below */
> +	struct mutex lock;
> +
> +	struct v4l2_mbus_framefmt fmt;
> +	struct v4l2_fract frame_interval, current_frame_interval;
> +	struct ar0521_ctrls ctrls;
> +	bool streaming;
> +};
> +
> +static inline struct ar0521_dev *to_ar0521_dev(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct ar0521_dev, sd);
> +}
> +
> +static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
> +{
> +	return &container_of(ctrl->handler, struct ar0521_dev,
> +			     ctrls.handler)->sd;
> +}
> +
> +static inline unsigned int lanes(struct ar0521_dev *sensor)
> +{
> +	return sensor->ep.bus.mipi_csi2.num_data_lanes;
> +}
> +
> +/* swaps data, the first value is the register address */
> +static int ar0521_write_regs(struct ar0521_dev *sensor, u16 *data, unsigned int count)
> +{
> +	struct i2c_client *client = sensor->i2c_client;
> +	struct i2c_msg msg;
> +	unsigned int cnt;
> +	int ret;
> +
> +	for (cnt = 0; cnt < count; cnt++)
> +		data[cnt] = cpu_to_be16(data[cnt]);
> +
> +	msg.addr = client->addr;
> +	msg.flags = client->flags;
> +	msg.buf = (u8 *)data;
> +	msg.len = count * sizeof(*data);
> +
> +	ret = i2c_transfer(client->adapter, &msg, 1);
> +	if (ret < 0) {
> +		v4l2_err(&sensor->sd, "%s: I2C write error\n", __func__);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ar0521_write_reg(struct ar0521_dev *sensor, u16 reg, u16 val)
> +{
> +	u16 buf[2] = {reg, val};
> +
> +	return ar0521_write_regs(sensor, buf, 2);
> +}
> +
> +static int ar0521_set_gains(struct ar0521_dev *sensor)
> +{
> +	int green = sensor->ctrls.gain->val;
> +	int red = max(green + sensor->ctrls.red_balance->val, 0);
> +	int blue = max(green + sensor->ctrls.blue_balance->val, 0);
> +	unsigned int gain = min(red, min(green, blue));
> +	unsigned int analog = min(gain, 64u); /* range is 0 - 127 */
> +	u16 regs[5];
> +
> +	red   = min(red   - analog + 64, 511u);
> +	green = min(green - analog + 64, 511u);
> +	blue  = min(blue  - analog + 64, 511u);
> +	regs[0] = AR0521_REG_GREEN1_GAIN;
> +	regs[1] = green << 7 | analog;
> +	regs[2] = blue  << 7 | analog;
> +	regs[3] = red   << 7 | analog;
> +	regs[4] = green << 7 | analog;
> +
> +	return ar0521_write_regs(sensor, regs, ARRAY_SIZE(regs));

Passing the values in an array, with the first entry being a register
address, is a really weird API. I'd recommend either using regmap (may
be overkill here), or use a write function that takes the register
address and value as separate arguments. If we want to avoid sending the
register address for each write as a performance improvement, we'll have
to figure out what a good API would be to do so, but more importantly,
it would be good to have numbers to justify why this would be needed.

> +}
> +
> +static int ar0521_set_stream(struct ar0521_dev *sensor, bool on)
> +{
> +	int ret;
> +
> +	if (on) {
> +		/* set the gains */
> +		ret = ar0521_set_gains(sensor);
> +		if (ret)
> +			return ret;
> +
> +		ret = ar0521_write_reg(sensor, AR0521_REG_HISPI_CONTROL_STATUS, 0);
> +		if (ret)
> +			return ret;
> +	} else {
> +		/* reset gain, the sensor may produce all white pixels without this */
> +		ret = ar0521_write_reg(sensor, AR0521_REG_GLOBAL_GAIN, 0x2000);
> +		if (ret)
> +			return ret;
> +
> +		/* set LP-11 on clock and data lanes */
> +		ret = ar0521_write_reg(sensor, AR0521_REG_HISPI_CONTROL_STATUS,
> +				       AR0521_REG_HISPI_CONTROL_STATUS_FRAMER_TEST_MODE_ENABLE);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* start streaming */
> +	return ar0521_write_reg(sensor, AR0521_REG_RESET,
> +				AR0521_REG_RESET_DEFAULTS |
> +				AR0521_REG_RESET_RESTART |
> +				AR0521_REG_RESET_STREAM);
> +}
> +
> +static void ar0521_reset(struct ar0521_dev *sensor)
> +{
> +	if (!sensor->reset_gpio)
> +		return;
> +
> +	gpiod_set_value(sensor->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +
> +	gpiod_set_value(sensor->reset_gpio, 0);
> +	usleep_range(5000, 10000);
> +}
> +
> +const char *mhz(u32 value)
> +{
> +	static char buff[32];
> +
> +	if (value % 1000)
> +		sprintf(buff, "%u.%06u", value / (1000 * 1000), value % (1000 * 1000));
> +	else if (value % (1000 * 1000))
> +		sprintf(buff, "%u.%03u", value / (1000 * 1000), (value / 1000) % 1000);
> +	else
> +		sprintf(buff, "%u", value / (1000 * 1000));
> +	return buff;
> +}
> +
> +u32 div64_round(u64 v, u32 d)
> +{
> +	return div_u64(v + (d >> 1), d);
> +}
> +
> +u32 div64_round_up(u64 v, u32 d)
> +{
> +	return div_u64(v + d - 1, d);
> +}
> +
> +u32 setup_pll(struct ar0521_dev *sensor, int num, u32 freq, u16 *pre_ptr, u16 *mult_ptr)
> +{
> +	u16 pre = 1, mult = 1, new_pre;
> +	u32 pll = AR0521_PLL_MAX + 1;
> +
> +	for (new_pre = 1; new_pre < 64; new_pre++) {
> +		u32 new_pll;
> +		u32 new_mult = div64_round_up((u64)freq * new_pre, sensor->xclk_freq);
> +
> +		if (new_mult < 32)
> +			continue; /* minimum value */
> +		if (new_mult > 254)
> +			break; /* maximum, larger pre won't work either */
> +		if (sensor->xclk_freq * (u64)new_mult < AR0521_PLL_MIN * new_pre)
> +			continue;
> +		if (sensor->xclk_freq * (u64)new_mult > AR0521_PLL_MAX * new_pre)
> +			break; /* larger pre won't work either */
> +		new_pll = div64_round_up(sensor->xclk_freq * (u64)new_mult, new_pre);
> +		if (new_pll < pll) {
> +			pll = new_pll;
> +			pre = new_pre;
> +			mult = new_mult;
> +		}
> +	}
> +
> +	pll = div64_round(sensor->xclk_freq * (u64)mult, pre);
> +	*pre_ptr = pre;
> +	*mult_ptr = mult;
> +	return pll;
> +}
> +
> +#define DIV 4
> +static int ar0521_set_mode(struct ar0521_dev *sensor)
> +{
> +	unsigned int speed_mod = 4 / lanes(sensor); /* 1 with 4 DDR lanes */
> +	u64 pix_clk;
> +	u32 pixels, pll2, num, denom, new_total_height, new_pixels;
> +	u16 total_width, total_height, x, y, pre, mult, pre2, mult2, extra_delay;
> +	u16 regs[9];
> +	int ret;
> +
> +	/* stop streaming first */
> +	ret = ar0521_write_reg(sensor, AR0521_REG_RESET, AR0521_REG_RESET_DEFAULTS);

set_format isn't supposed to stop streaming implicitly. It should
instead return -EBUSY if the stream if running.

> +	if (ret)
> +		return ret;
> +
> +	/* the sensor may cause problems without these */
> +	sensor->fmt.width = clamp(ALIGN(sensor->fmt.width, 4),
> +				  AR0521_WIDTH_MIN, AR0521_WIDTH_MAX);
> +	sensor->fmt.height = clamp(ALIGN(sensor->fmt.height, 4),
> +				   AR0521_HEIGHT_MIN, AR0521_HEIGHT_MAX);
> +	total_width = max(sensor->fmt.width + AR0521_WIDTH_BLANKING_MIN,
> +			  AR0521_TOTAL_WIDTH_MIN);
> +	total_height = sensor->fmt.height + AR0521_HEIGHT_BLANKING_MIN;
> +	x = (AR0521_WIDTH_MAX - sensor->fmt.width) / 2;
> +	y = ((AR0521_HEIGHT_MAX - sensor->fmt.height) / 2) & ~1;
> +
> +	pixels = total_width * total_height;
> +	num = sensor->frame_interval.numerator;
> +	denom = sensor->frame_interval.denominator;
> +	pll2 = AR0521_PLL_MAX + 1;
> +
> +	/* calculate approximate pixel clock first */
> +	pix_clk = div64_round_up(pixels * (u64)num, denom);
> +	if (pix_clk > AR0521_PIXEL_CLOCK_MAX) {
> +		u32 cnt;
> +		/* have to recalculate FPS */
> +		num = pix_clk = AR0521_PIXEL_CLOCK_MAX;
> +		denom = pixels;
> +		/* try to reduce the numbers a bit */
> +		for (cnt = 2; cnt * cnt < denom; cnt++)
> +			while (num % cnt == 0 && denom % cnt == 0) {
> +				num /= cnt;
> +				denom /= cnt;
> +			}
> +	} else if (pix_clk < AR0521_PIXEL_CLOCK_MIN)
> +		/* we will compensate with total_height and extra_delay */
> +		pix_clk = AR0521_PIXEL_CLOCK_MIN;
> +
> +	sensor->current_frame_interval.numerator = num;
> +	sensor->current_frame_interval.denominator = denom;
> +
> +	/* PLL1 drives pixel clock - dual rate */
> +	pix_clk = setup_pll(sensor, 1, pix_clk * (DIV / 2), &pre, &mult);
> +	pix_clk = div64_round(pix_clk, (DIV / 2));
> +	setup_pll(sensor, 2, pix_clk * (DIV / 2) * speed_mod, &pre2, &mult2);
> +
> +	/* let's see if we can do better */
> +	new_total_height = (div64_round((u64)pix_clk * denom, num) /
> +			    total_width) & ~1; /* must be even */
> +	if (new_total_height > total_height) {
> +		total_height = new_total_height;
> +		pixels = total_width * total_height;
> +	}
> +
> +	/* maybe there is still room for improvement */
> +	new_pixels = div64_round(pix_clk * denom, num);
> +	extra_delay = 0;
> +	if (new_pixels > pixels)
> +		extra_delay = new_pixels - pixels;
> +
> +	/* all dimensions are unsigned 12-bit integers */
> +	regs[0] = AR0521_REG_FRAME_LENGTH_LINES;
> +	regs[1] = total_height;
> +	regs[2] = total_width;
> +	regs[3] = x;
> +	regs[4] = y;
> +	regs[5] = x + sensor->fmt.width - 1;
> +	regs[6] = y + sensor->fmt.height - 1;
> +	regs[7] = sensor->fmt.width;
> +	regs[8] = sensor->fmt.height;
> +	ret = ar0521_write_regs(sensor, regs, 9);
> +	if (ret)
> +		return ret;
> +
> +	regs[0] = AR0521_REG_VT_PIX_CLK_DIV;
> +	regs[1] = 4; /* vt_pix_clk_div - 0x300 = number of bits / 2 */
> +	regs[2] = 1; /* vt_sys_clk_div - 0x302 */
> +	regs[3] = (pre2 << 8) | pre; /* 0x304 */
> +	regs[4] = (mult2 << 8) | mult; /* 0x306 */
> +	regs[5] = 8; /* op_pix_clk_div - 0x308 = 2 * vt_pix_clk_div */
> +	regs[6] = 1; /* op_sys_clk_div - 0x30A */
> +	ret = ar0521_write_regs(sensor, regs, ARRAY_SIZE(regs));
> +	if (ret)
> +		return ret;
> +
> +	ret = ar0521_write_reg(sensor, AR0521_REG_COARSE_INTEGRATION_TIME,
> +			       sensor->ctrls.exposure->val);
> +	if (ret)
> +		return ret;
> +
> +	ret = ar0521_write_reg(sensor, AR0521_REG_EXTRA_DELAY, extra_delay);
> +	if (ret)
> +		return ret;
> +
> +	ret = ar0521_write_reg(sensor, AR0521_REG_RESET,
> +			       AR0521_REG_RESET_DEFAULTS | AR0521_REG_RESET_STREAM);
> +	if (ret)
> +		return ret;
> +
> +	pr_info("AR0521: %ux%u, total %ux%u, pixel clock %s MHz, %u (%u/%u) FPS\n",

Please use dev_* instead of pr_*.

> +		sensor->fmt.width, sensor->fmt.height, total_width, total_height,
> +		mhz(pix_clk), (num + denom / 2) / denom, num, denom);
> +	return 0;
> +}
> +
> +static int ar0521_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *format)
> +{
> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	if (format->pad != 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&sensor->lock);
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> +		fmt = v4l2_subdev_get_try_format(&sensor->sd, cfg, format->pad);
> +	else
> +		fmt = &sensor->fmt;
> +
> +	format->format = *fmt;
> +
> +	mutex_unlock(&sensor->lock);
> +	return 0;
> +}
> +
> +static int ar0521_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *format)
> +{
> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> +
> +	if (format->pad)
> +		return -EINVAL;
> +
> +	mutex_lock(&sensor->lock);
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
> +
> +		*fmt = format->format;

You need to validate the try format the same way you validate the active
format in ar0521_set_mode(). I'd recommend splitting the code in two,
one part that handles the validation, and then one part that program the
device with a validate format.

> +		goto out;
> +	}
> +
> +	sensor->fmt = format->format;
> +	ar0521_set_mode(sensor);
> +out:
> +	mutex_unlock(&sensor->lock);
> +	return 0;
> +}
> +
> +static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> +	int ret;
> +
> +	/* v4l2_ctrl_lock() locks our own mutex */
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_GAIN:
> +	case V4L2_CID_RED_BALANCE:
> +	case V4L2_CID_BLUE_BALANCE:
> +		ret = ar0521_set_gains(sensor);
> +		break;
> +	case V4L2_CID_EXPOSURE:
> +		ret = ar0521_write_reg(sensor, AR0521_REG_COARSE_INTEGRATION_TIME, ctrl->val);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE, ctrl->val);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ar0521_ctrl_ops = {
> +	.s_ctrl = ar0521_s_ctrl,
> +};
> +
> +static const char * const test_pattern_menu[] = {
> +	"Disabled",
> +	"Solid color",
> +	"Color bars",
> +	"Faded color bars"
> +};
> +
> +static int ar0521_init_controls(struct ar0521_dev *sensor)
> +{
> +	const struct v4l2_ctrl_ops *ops = &ar0521_ctrl_ops;
> +	struct ar0521_ctrls *ctrls = &sensor->ctrls;
> +	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> +	int ret;
> +
> +	v4l2_ctrl_handler_init(hdl, 32);
> +
> +	/* we can use our own mutex for the ctrl lock */
> +	hdl->lock = &sensor->lock;
> +
> +	/* manual gain */
> +	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 511, 1, 0);
> +	ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_RED_BALANCE, -512, 511, 1, 0);
> +	ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BLUE_BALANCE, -512, 511, 1, 0);
> +
> +	/* manual exposure time */
> +	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0, 65535, 1, 0);
> +
> +	ctrls->test_pattern =
> +		v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_TEST_PATTERN,
> +					     ARRAY_SIZE(test_pattern_menu) - 1,
> +					     0, 0, test_pattern_menu);
> +
> +	if (hdl->error) {
> +		ret = hdl->error;
> +		goto free_ctrls;
> +	}
> +
> +	sensor->sd.ctrl_handler = hdl;
> +	return 0;
> +
> +free_ctrls:
> +	v4l2_ctrl_handler_free(hdl);
> +	return ret;
> +}
> +
> +static int ar0521_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> +
> +	if (code->pad || code->index)
> +		return -EINVAL;
> +
> +	code->code = sensor->fmt.code;
> +	return 0;
> +}
> +
> +static int ar0521_g_frame_interval(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_frame_interval *fi)
> +{
> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> +
> +	mutex_lock(&sensor->lock);
> +	fi->interval = sensor->current_frame_interval;
> +	mutex_unlock(&sensor->lock);
> +	return 0;
> +}
> +
> +static int ar0521_s_frame_interval(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_frame_interval *fi)
> +{
> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> +	int ret = 0;
> +
> +	if (fi->pad)
> +		return -EINVAL;
> +
> +	mutex_lock(&sensor->lock);
> +
> +	if (sensor->streaming) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	sensor->frame_interval = fi->interval;
> +	ar0521_set_mode(sensor);
> +out:
> +	mutex_unlock(&sensor->lock);
> +	return ret;
> +}
> +
> +static int ar0521_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> +	int ret;
> +
> +	mutex_lock(&sensor->lock);

Could you please use runtime PM for power management, enabling the clock
and regulators when starting streaming ?

I forgot to mention in the review of the DT bindings that regulators
should be specified in DT.

> +
> +	ret = ar0521_set_stream(sensor, enable);
> +	sensor->streaming = enable;
> +
> +	mutex_unlock(&sensor->lock);
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_core_ops ar0521_core_ops = {
> +	.log_status = v4l2_ctrl_subdev_log_status,
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops ar0521_video_ops = {
> +	.g_frame_interval = ar0521_g_frame_interval,
> +	.s_frame_interval = ar0521_s_frame_interval,

For raw sensors, frame intervals should be configured using
V4L2_CID_HBLANK and V4L2_CID_VBLANK instead. These two operations should
be dropped.

> +	.s_stream = ar0521_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ar0521_pad_ops = {
> +	.enum_mbus_code = ar0521_enum_mbus_code,
> +	.get_fmt = ar0521_get_fmt,
> +	.set_fmt = ar0521_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops ar0521_subdev_ops = {
> +	.core = &ar0521_core_ops,
> +	.video = &ar0521_video_ops,
> +	.pad = &ar0521_pad_ops,
> +};
> +
> +static const struct initial_reg {
> +	u16 addr, value;
> +} initial_regs[] = {
> +	/* corrections_recommended_bayer */
> +	{0x3042, 0x0004}, /* RNC:enable b/w rnc mode */
> +	{0x3044, 0x4580}, /* RNC:enable row noise correction */
> +	{0x30EE, 0x1136}, /* RNC:rnc scaling factor-->initial recommended setting */
> +	{0x3120, 0x0001}, /* recommended setting for dither */
> +	{0x3F2C, 0x442E}, /* GTH_THRES_RTN: 7max,7min filtered out of every 46 */
> +	{0x30D2, 0x0000}, /* CRM/CC: enable crm on Visible and CC rows */
> +	{0x30D4, 0x0000}, /* CC: CC enabled with 16 samples per column */
> +	{0x30D6, 0x2FFF}, /* CC: bw mode enabled/12 bit data resolution/bw mode */
> +	{0x30DA, 0x0FFF}, /* CC: column correction clip level 2 is 0 */
> +	{0x30DC, 0x0FFF}, /* CC: column correction clip level 3 is 0 */
> +	{0x30DE, 0x0000}, /* CC: Group FPN correction */
> +	{0x31E0, 0x0781}, /* Fuse/2DDC: enable 2ddc */
> +	{0x3180, 0x9434}, /* FDOC:fdoc settings with fdoc every frame turned of */
> +	{0x3172, 0x0206}, /* txlo clk divider options */
> +	{0x3F00, 0x0017}, /* BM_T0 */
> +	{0x3F02, 0x02DD}, /* BM_T1 */
> +	{0x3F04, 0x0020}, /* if Ana_gain less than 2, use noise_floor0, multipl */
> +	{0x3F06, 0x0040}, /* if Ana_gain between 4 and 7, use noise_floor2 and */
> +	{0x3F08, 0x0070}, /* if Ana_gain between 4 and 7, use noise_floor2 and */
> +	{0x3F0A, 0x0101}, /* Define noise_floor0(low address) and noise_floor1 */
> +	{0x3F0C, 0x0302}, /* Define noise_floor2 and noise_floor3 */
> +	{0x3F1E, 0x0022},
> +	{0x3F1A, 0x01FF}, /* cross factor 2 */
> +	{0x3F14, 0x0505}, /* single k factor 2 */
> +	{0x3F44, 0x0707}, /* couple k factor 2 */
> +	{0x3F18, 0x01FF}, /* cross factor 1 */
> +	{0x3F12, 0x0505}, /* single k factor 1 */
> +	{0x3F42, 0x1511}, /* couple k factor 1 */
> +	{0x3F16, 0x01FF}, /* cross factor 0 */
> +	{0x3F10, 0x0505}, /* single k factor 0 */
> +	{0x3F40, 0x1511}, /* couple k factor 0 */
> +
> +	/* pixel_timing_recommended */
> +	{0x3D00, 0x043E},
> +	{0x3D02, 0x4760},
> +	{0x3D04, 0xFFFF},
> +	{0x3D06, 0xFFFF},
> +	{0x3D08, 0x8000},
> +	{0x3D0A, 0x0510},
> +	{0x3D0C, 0xAF08},
> +	{0x3D0E, 0x0252},
> +	{0x3D10, 0x486F},
> +	{0x3D12, 0x5D5D},
> +	{0x3D14, 0x8056},
> +	{0x3D16, 0x8313},
> +	{0x3D18, 0x0087},
> +	{0x3D1A, 0x6A48},
> +	{0x3D1C, 0x6982},
> +	{0x3D1E, 0x0280},
> +	{0x3D20, 0x8359},
> +	{0x3D22, 0x8D02},
> +	{0x3D24, 0x8020},
> +	{0x3D26, 0x4882},
> +	{0x3D28, 0x4269},
> +	{0x3D2A, 0x6A95},
> +	{0x3D2C, 0x5988},
> +	{0x3D2E, 0x5A83},
> +	{0x3D30, 0x5885},
> +	{0x3D32, 0x6280},
> +	{0x3D34, 0x6289},
> +	{0x3D36, 0x6097},
> +	{0x3D38, 0x5782},
> +	{0x3D3A, 0x605C},
> +	{0x3D3C, 0xBF18},
> +	{0x3D3E, 0x0961},
> +	{0x3D40, 0x5080},
> +	{0x3D42, 0x2090},
> +	{0x3D44, 0x4390},
> +	{0x3D46, 0x4382},
> +	{0x3D48, 0x5F8A},
> +	{0x3D4A, 0x5D5D},
> +	{0x3D4C, 0x9C63},
> +	{0x3D4E, 0x8063},
> +	{0x3D50, 0xA960},
> +	{0x3D52, 0x9757},
> +	{0x3D54, 0x8260},
> +	{0x3D56, 0x5CFF},
> +	{0x3D58, 0xBF10},
> +	{0x3D5A, 0x1681},
> +	{0x3D5C, 0x0802},
> +	{0x3D5E, 0x8000},
> +	{0x3D60, 0x141C},
> +	{0x3D62, 0x6000},
> +	{0x3D64, 0x6022},
> +	{0x3D66, 0x4D80},
> +	{0x3D68, 0x5C97},
> +	{0x3D6A, 0x6A69},
> +	{0x3D6C, 0xAC6F},
> +	{0x3D6E, 0x4645},
> +	{0x3D70, 0x4400},
> +	{0x3D72, 0x0513},
> +	{0x3D74, 0x8069},
> +	{0x3D76, 0x6AC6},
> +	{0x3D78, 0x5F95},
> +	{0x3D7A, 0x5F70},
> +	{0x3D7C, 0x8040},
> +	{0x3D7E, 0x4A81},
> +	{0x3D80, 0x0300},
> +	{0x3D82, 0xE703},
> +	{0x3D84, 0x0088},
> +	{0x3D86, 0x4A83},
> +	{0x3D88, 0x40FF},
> +	{0x3D8A, 0xFFFF},
> +	{0x3D8C, 0xFD70},
> +	{0x3D8E, 0x8040},
> +	{0x3D90, 0x4A85},
> +	{0x3D92, 0x4FA8},
> +	{0x3D94, 0x4F8C},
> +	{0x3D96, 0x0070},
> +	{0x3D98, 0xBE47},
> +	{0x3D9A, 0x8847},
> +	{0x3D9C, 0xBC78},
> +	{0x3D9E, 0x6B89},
> +	{0x3DA0, 0x6A80},
> +	{0x3DA2, 0x6986},
> +	{0x3DA4, 0x6B8E},
> +	{0x3DA6, 0x6B80},
> +	{0x3DA8, 0x6980},
> +	{0x3DAA, 0x6A88},
> +	{0x3DAC, 0x7C9F},
> +	{0x3DAE, 0x866B},
> +	{0x3DB0, 0x8765},
> +	{0x3DB2, 0x46FF},
> +	{0x3DB4, 0xE365},
> +	{0x3DB6, 0xA679},
> +	{0x3DB8, 0x4A40},
> +	{0x3DBA, 0x4580},
> +	{0x3DBC, 0x44BC},
> +	{0x3DBE, 0x7000},
> +	{0x3DC0, 0x8040},
> +	{0x3DC2, 0x0802},
> +	{0x3DC4, 0x10EF},
> +	{0x3DC6, 0x0104},
> +	{0x3DC8, 0x3860},
> +	{0x3DCA, 0x5D5D},
> +	{0x3DCC, 0x5682},
> +	{0x3DCE, 0x1300},
> +	{0x3DD0, 0x8648},
> +	{0x3DD2, 0x8202},
> +	{0x3DD4, 0x8082},
> +	{0x3DD6, 0x598A},
> +	{0x3DD8, 0x0280},
> +	{0x3DDA, 0x2048},
> +	{0x3DDC, 0x3060},
> +	{0x3DDE, 0x8042},
> +	{0x3DE0, 0x9259},
> +	{0x3DE2, 0x865A},
> +	{0x3DE4, 0x8258},
> +	{0x3DE6, 0x8562},
> +	{0x3DE8, 0x8062},
> +	{0x3DEA, 0x8560},
> +	{0x3DEC, 0x9257},
> +	{0x3DEE, 0x8221},
> +	{0x3DF0, 0x10FF},
> +	{0x3DF2, 0xB757},
> +	{0x3DF4, 0x9361},
> +	{0x3DF6, 0x1019},
> +	{0x3DF8, 0x8020},
> +	{0x3DFA, 0x9043},
> +	{0x3DFC, 0x8E43},
> +	{0x3DFE, 0x845F},
> +	{0x3E00, 0x835D},
> +	{0x3E02, 0x805D},
> +	{0x3E04, 0x8163},
> +	{0x3E06, 0x8063},
> +	{0x3E08, 0xA060},
> +	{0x3E0A, 0x9157},
> +	{0x3E0C, 0x8260},
> +	{0x3E0E, 0x5CFF},
> +	{0x3E10, 0xFFFF},
> +	{0x3E12, 0xFFE5},
> +	{0x3E14, 0x1016},
> +	{0x3E16, 0x2048},
> +	{0x3E18, 0x0802},
> +	{0x3E1A, 0x1C60},
> +	{0x3E1C, 0x0014},
> +	{0x3E1E, 0x0060},
> +	{0x3E20, 0x2205},
> +	{0x3E22, 0x8120},
> +	{0x3E24, 0x908F},
> +	{0x3E26, 0x6A80},
> +	{0x3E28, 0x6982},
> +	{0x3E2A, 0x5F9F},
> +	{0x3E2C, 0x6F46},
> +	{0x3E2E, 0x4544},
> +	{0x3E30, 0x0005},
> +	{0x3E32, 0x8013},
> +	{0x3E34, 0x8069},
> +	{0x3E36, 0x6A80},
> +	{0x3E38, 0x7000},
> +	{0x3E3A, 0x0000},
> +	{0x3E3C, 0x0000},
> +	{0x3E3E, 0x0000},
> +	{0x3E40, 0x0000},
> +	{0x3E42, 0x0000},
> +	{0x3E44, 0x0000},
> +	{0x3E46, 0x0000},
> +	{0x3E48, 0x0000},
> +	{0x3E4A, 0x0000},
> +	{0x3E4C, 0x0000},
> +	{0x3E4E, 0x0000},
> +	{0x3E50, 0x0000},
> +	{0x3E52, 0x0000},
> +	{0x3E54, 0x0000},
> +	{0x3E56, 0x0000},
> +	{0x3E58, 0x0000},
> +	{0x3E5A, 0x0000},
> +	{0x3E5C, 0x0000},
> +	{0x3E5E, 0x0000},
> +	{0x3E60, 0x0000},
> +	{0x3E62, 0x0000},
> +	{0x3E64, 0x0000},
> +	{0x3E66, 0x0000},
> +	{0x3E68, 0x0000},
> +	{0x3E6A, 0x0000},
> +	{0x3E6C, 0x0000},
> +	{0x3E6E, 0x0000},
> +	{0x3E70, 0x0000},
> +	{0x3E72, 0x0000},
> +	{0x3E74, 0x0000},
> +	{0x3E76, 0x0000},
> +	{0x3E78, 0x0000},
> +	{0x3E7A, 0x0000},
> +	{0x3E7C, 0x0000},
> +	{0x3E7E, 0x0000},
> +	{0x3E80, 0x0000},
> +	{0x3E82, 0x0000},
> +	{0x3E84, 0x0000},
> +	{0x3E86, 0x0000},
> +	{0x3E88, 0x0000},
> +	{0x3E8A, 0x0000},
> +	{0x3E8C, 0x0000},
> +	{0x3E8E, 0x0000},
> +	{0x3E90, 0x0000},
> +	{0x3E92, 0x0000},
> +	{0x3E94, 0x0000},
> +	{0x3E96, 0x0000},
> +	{0x3E98, 0x0000},
> +	{0x3E9A, 0x0000},
> +	{0x3E9C, 0x0000},
> +	{0x3E9E, 0x0000},
> +	{0x3EA0, 0x0000},
> +	{0x3EA2, 0x0000},
> +	{0x3EA4, 0x0000},
> +	{0x3EA6, 0x0000},
> +	{0x3EA8, 0x0000},
> +	{0x3EAA, 0x0000},
> +	{0x3EAC, 0x0000},
> +	{0x3EAE, 0x0000},
> +	{0x3EB0, 0x0000},
> +	{0x3EB2, 0x0000},
> +	{0x3EB4, 0x0000},
> +
> +	/* analog_setup_recommended_12bit */
> +	{0x3EB6, 0x004C}, /* ECL */
> +	{0x3EBA, 0xAAAA},
> +	{0x3EBC, 0x0086}, /* Bias currents for FSC/ECL */
> +	{0x3EC0, 0x1E00}, /* SFbin/SH mode settings */
> +	{0x3EC2, 0x100B}, /* CLK divider for ramp for 12 bit 400MHz mode only */
> +	{0x3EC4, 0x3300}, /* FSC clamps for HDR mode and adc comp power down co */
> +	{0x3EC6, 0xEA44}, /* VLN and clk gating controls */
> +	{0x3EC8, 0x6F6F}, /* Txl0 and Txlo1 settings for normal mode */
> +	{0x3ECA, 0x2F4A}, /* CDAC/Txlo2/RSTGHI/RSTGLO settings */
> +	{0x3ECC, 0x0506}, /* RSTDHI/RSTDLO/CDAC/TXHI settings */
> +	{0x3ECE, 0x203B}, /* Ramp buffer settings and Booster enable (bits 0-5) */
> +	{0x3ED0, 0x13F0}, /* TXLO from atest/sf bin settings */
> +	{0x3ED2, 0x9A3D}, /* Booster settings for reference rows/columns */
> +	{0x3ED4, 0x862F}, /* TXLO open loop/row driver settings */
> +	{0x3ED6, 0x4081}, /* Txlatch fr cfpn rows/vln bias */
> +	{0x3ED8, 0x4003}, /* Ramp step setting for 12 bit 400 Mhz mode */
> +	{0x3EDA, 0x9A80}, /* ramp offset for T1/normal and rst under range */
> +	{0x3EDC, 0xC000}, /* over range for rst and under range for sig */
> +	{0x3EDE, 0xC103}, /* over range for sig and col dec clk settings */
> +	{0x3426, 0x1600}, /* ADC offset distribution pulse */
> +	{0x342A, 0x0038}, /* pulse_config */
> +	{0x3F3E, 0x0001}, /* Switch ADC from 10 bit to 12 bit mode */
> +	{0x341A, 0x6051},
> +	{0x3420, 0x6051},
> +
> +	/* analog_setup_recommended_10bit */
> +	{0x3EC2, 0x100A}, /* CLK divider for ramp for 10 bit 400MH */
> +	{0x3ED8, 0x8003}, /* Ramp step setting for 10 bit 400 Mhz */
> +	{0x341A, 0x4735}, /* Samp&Hold pulse in ADC */
> +	{0x3420, 0x4735}, /* Samp&Hold pulse in ADC */
> +	{0x3426, 0x8A1A}, /* ADC offset distribution pulse */
> +	{0x342A, 0x0018}, /* pulse_config */
> +	{0x3ED2, 0xA53D}, /* Ramp offset */
> +	{0x3EDA, 0xA580}, /* Ramp Offset */
> +	{0x3EBA, 0xAAAD},
> +	{0x3EB6, 0x004C},
> +	{0x3F3E, 0x0000}, /* Switch ADC from 12 bit to 10 bit mode */
> +
> +	/* new RNC 10bit */
> +	{0x30EE, 0x1136}, /* RNC:rnc scaling factor=*54/64 (32/38*64=53.9) */
> +	{0x3F2C, 0x442E}, /* GTH_THRES_RTN: 4max,4min filtered out of every 46 samples and */
> +	/* for 10bit mode */
> +	{0x301E, 0x00AA}, /* PEDESTAL+2 :+2 is a workaround for 10bit mode +0.5 Rounding */
> +	{0x3120, 0x0005}, /* p1 dither enabled for 10bit mode */
> +
> +	{0x0112, 0x0808}, /* 8-bit/8-bit mode */
> +	{0x31BC, 0x068C}, /* don't use continuous clock mode while shut down */
> +	{0x30FA, 0xFD00}, /* GPIO0 = flash, GPIO1 = shutter */
> +	{0x31B0, 0x008B}, /* frame_preamble - FIXME check WRT lanes# */
> +	{0x31B2, 0x0050}, /* line_preamble - FIXME check WRT lanes# */
> +};
> +
> +static int ar0521_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct fwnode_handle *endpoint;
> +	struct ar0521_dev *sensor;
> +	unsigned int cnt, nlanes;
> +	int ret;
> +
> +	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
> +		return -ENOMEM;
> +
> +	sensor->i2c_client = client;
> +	sensor->fmt.code = MEDIA_BUS_FMT_SGRBG8_1X8;
> +	sensor->fmt.width = AR0521_WIDTH_MAX;
> +	sensor->fmt.height = AR0521_HEIGHT_MAX;
> +	sensor->fmt.field = V4L2_FIELD_NONE;
> +	sensor->frame_interval.numerator = 30;
> +	sensor->frame_interval.denominator = 1;
> +
> +	endpoint = fwnode_graph_get_next_endpoint(of_fwnode_handle(dev->of_node), NULL);
> +	if (!endpoint) {
> +		dev_err(dev, "endpoint node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_parse(endpoint, &sensor->ep);
> +	fwnode_handle_put(endpoint);
> +	if (ret) {
> +		dev_err(dev, "Could not parse endpoint\n");
> +		return ret;
> +	}
> +
> +	if (sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(dev, "invalid bus type, must be MIPI CSI2\n");
> +		return -EINVAL;
> +	}
> +
> +	nlanes = lanes(sensor);
> +	switch (nlanes) {
> +	case 1:
> +	case 2:
> +	case 4:
> +		break;
> +	default:
> +		dev_err(dev, "invalid number of MIPI data lane%s\n", nlanes > 1 ? "s" : "");
> +		return -EINVAL;
> +	}
> +
> +	/* get master clock (xclk) */
> +	sensor->xclk = devm_clk_get(dev, "xclk");
> +	if (IS_ERR(sensor->xclk)) {
> +		dev_err(dev, "failed to get xclk\n");
> +		return PTR_ERR(sensor->xclk);
> +	}
> +
> +	ret = clk_set_rate(sensor->xclk, AR0521_XCLK_RATE);
> +	if (ret < 0)
> +		return ret;
> +
> +	sensor->xclk_freq = clk_get_rate(sensor->xclk);
> +
> +	if (sensor->xclk_freq < AR0521_XCLK_MIN ||
> +	    sensor->xclk_freq > AR0521_XCLK_MAX) {
> +		dev_err(dev, "xclk frequency out of range: %u Hz\n", sensor->xclk_freq);
> +		return -EINVAL;
> +	}
> +
> +	clk_prepare_enable(sensor->xclk);
> +
> +	/* request optional reset pin */
> +	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +
> +	v4l2_i2c_subdev_init(&sensor->sd, client, &ar0521_subdev_ops);
> +
> +	sensor->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&sensor->lock);
> +
> +	ret = ar0521_init_controls(sensor);
> +	if (ret)
> +		goto entity_cleanup;
> +
> +	ret = v4l2_async_register_subdev(&sensor->sd);
> +	if (ret)
> +		goto free_ctrls;
> +
> +	ar0521_reset(sensor);
> +	for (cnt = 0; cnt < ARRAY_SIZE(initial_regs); cnt++)
> +		if (ar0521_write_reg(sensor, initial_regs[cnt].addr, initial_regs[cnt].value))
> +			goto unreg_subdev;
> +
> +	ret = ar0521_write_reg(sensor, AR0521_REG_SERIAL_FORMAT,
> +			       AR0521_REG_SERIAL_FORMAT_MIPI | nlanes);
> +	if (ret)
> +		goto unreg_subdev;
> +
> +	// set MIPI test mode - disabled for now
> +	ret = ar0521_write_reg(sensor, AR0521_REG_HISPI_TEST_MODE,
> +			       ((0x40 << nlanes) - 0x40) |
> +			       AR0521_REG_HISPI_TEST_MODE_LP11);
> +	if (ret)
> +		goto unreg_subdev;
> +
> +	ret = ar0521_write_reg(sensor, AR0521_REG_ROW_SPEED, 0x110 | 4 / nlanes);
> +	if (ret)
> +		goto unreg_subdev;
> +
> +	ret = ar0521_set_stream(sensor, 0);
> +	if (ret)
> +		goto unreg_subdev;
> +
> +	ar0521_set_mode(sensor);
> +
> +	dev_info(dev, "AR0521 initialized, master clock frequency: %s MHz, %u MIPI data lanes\n",
> +		 mhz(sensor->xclk_freq), nlanes);
> +	return 0;
> +
> +unreg_subdev:
> +	v4l2_async_unregister_subdev(&sensor->sd);
> +free_ctrls:
> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> +entity_cleanup:
> +	mutex_destroy(&sensor->lock);
> +	media_entity_cleanup(&sensor->sd.entity);
> +	return ret;
> +}
> +
> +static int ar0521_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> +
> +	v4l2_async_unregister_subdev(&sensor->sd);
> +	mutex_destroy(&sensor->lock);
> +	media_entity_cleanup(&sensor->sd.entity);
> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> +	return 0;
> +}
> +
> +static const struct i2c_device_id ar0521_id[] = {
> +	{"ar0521", 0},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, ar0521_id);
> +
> +static const struct of_device_id ar0521_dt_ids[] = {
> +	{.compatible = "onnn,ar0521"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ar0521_dt_ids);
> +
> +static struct i2c_driver ar0521_i2c_driver = {
> +	.driver = {
> +		.name  = "ar0521",
> +		.of_match_table	= ar0521_dt_ids,
> +	},
> +	.id_table = ar0521_id,
> +	.probe    = ar0521_probe,
> +	.remove   = ar0521_remove,
> +};
> +
> +module_i2c_driver(ar0521_i2c_driver);
> +
> +MODULE_DESCRIPTION("AR0521 MIPI Camera subdev driver");
> +MODULE_AUTHOR("Krzysztof Halasa <khalasa@piap.pl>");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart
