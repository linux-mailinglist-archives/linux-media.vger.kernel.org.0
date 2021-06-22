Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39CA3B029F
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 13:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhFVLVP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 07:21:15 -0400
Received: from ni.piap.pl ([195.187.100.5]:52838 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229682AbhFVLVN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 07:21:13 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id D67E84A0043;
        Tue, 22 Jun 2021 13:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl D67E84A0043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1624360736; bh=5So+WtctBEnwMVql0L8so7qslWdNL1aK28JQ04YiuAQ=;
        h=From:To:Cc:Subject:Date:From;
        b=KdODFnPP6G2rh8EFAXahDgR6KN9iDrLNK38nyb1mQFRTaGo/t8Q34UwLT3wtrFS1L
         Ln6tq0Qw514rtnHLVZGsB3/E6mm1SxFscboXTv39zQ4ERA7WkZXOKpSaXRyh4Py18T
         TZcgmXyTA57gVTVS33IIfm10mdp3aRebgOKS8XzE=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
Sender: khalasa@piap.pl
Date:   Tue, 22 Jun 2021 13:18:55 +0200
Message-ID: <m3wnqm5eqo.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, whitelist
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes from v1:
- added power management (power supplies, no chip initialization in
  probe()).
- added [HV]BLANK v4l2 ctrl interface (the "interval" interface is
  still implemented for better timing control)
- many fixes, including ones requested by Laurent Pinchart.

The driver has been extensively tested in an i.MX6-based system.

Not yet signed off - this will change of course. Please do not merge
yet, however comments about being ready (or not) to be merged are
welcome.

Thanks.

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 462c0e059754..b9ed4dda6beb 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -725,6 +725,16 @@ config VIDEO_APTINA_PLL
 config VIDEO_CCS_PLL
 	tristate
=20
+config VIDEO_AR0521
+	tristate "ON Semiconductor AR0521 sensor support"
+	depends on I2C && VIDEO_V4L2
+	help
+	  This is a Video4Linux2 sensor driver for the ON Semiconductor
+	  AR0521 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ar0521.
+
 config VIDEO_HI556
 	tristate "Hynix Hi-556 sensor support"
 	depends on I2C && VIDEO_V4L2
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 0c067beca066..66c77848fe0f 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_VIDEO_CX25840) +=3D cx25840/
 obj-$(CONFIG_VIDEO_M5MOLS)	+=3D m5mols/
=20
 obj-$(CONFIG_VIDEO_APTINA_PLL) +=3D aptina-pll.o
+obj-$(CONFIG_VIDEO_AR0521) +=3D ar0521.o
 obj-$(CONFIG_VIDEO_TVAUDIO) +=3D tvaudio.o
 obj-$(CONFIG_VIDEO_TDA7432) +=3D tda7432.o
 obj-$(CONFIG_VIDEO_SAA6588) +=3D saa6588.o
diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
new file mode 100644
index 000000000000..b31d8556d3f2
--- /dev/null
+++ b/drivers/media/i2c/ar0521.c
@@ -0,0 +1,1060 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Sie=C4=87 Badawcza =C5=81ukasiewicz * - Przemys=C5=
=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
+ * Written by Krzysztof Ha=C5=82asa
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/ctype.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/gpio/consumer.h>
+#include <linux/math64.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+// External clock (xclk) frequencies
+#define AR0521_XCLK_RATE	  (27 * 1000 * 1000)
+#define AR0521_XCLK_MIN		  (10 * 1000 * 1000)
+#define AR0521_XCLK_MAX		  (48 * 1000 * 1000)
+
+// PLL and PLL2
+#define AR0521_PLL_MIN		 (320 * 1000 * 1000)
+#define AR0521_PLL_MAX		(1280 * 1000 * 1000)
+
+// effective pixel clocks, the registers may be DDR
+#define AR0521_PIXEL_CLOCK_MIN	 (168 * 1000 * 1000)
+#define AR0521_PIXEL_CLOCK_MAX	 (414 * 1000 * 1000)
+
+#define AR0521_WIDTH_MIN	       8u
+#define AR0521_WIDTH_MAX	    2608u
+#define AR0521_HEIGHT_MIN	       8u
+#define AR0521_HEIGHT_MAX	    1958u
+
+#define AR0521_WIDTH_BLANKING_MIN     572u
+#define AR0521_HEIGHT_BLANKING_MIN     28u // must be even
+#define AR0521_TOTAL_WIDTH_MIN	     2968u
+
+// AR0521 registers
+#define AR0521_REG_VT_PIX_CLK_DIV		0x0300
+#define AR0521_REG_FRAME_LENGTH_LINES		0x0340
+
+#define AR0521_REG_CHIP_ID			0x3000
+#define AR0521_REG_COARSE_INTEGRATION_TIME	0x3012
+#define AR0521_REG_ROW_SPEED			0x3016
+#define AR0521_REG_EXTRA_DELAY			0x3018
+#define AR0521_REG_RESET			0x301A
+#define   AR0521_REG_RESET_DEFAULTS		  0x0238
+#define   AR0521_REG_RESET_GROUP_PARAM_HOLD	  0x8000
+#define   AR0521_REG_RESET_STREAM		  BIT(2)
+#define   AR0521_REG_RESET_RESTART		  BIT(1)
+#define   AR0521_REG_RESET_INIT			  BIT(0)
+
+#define AR0521_REG_GREEN1_GAIN			0x3056
+#define AR0521_REG_BLUE_GAIN			0x3058
+#define AR0521_REG_RED_GAIN			0x305A
+#define AR0521_REG_GREEN2_GAIN			0x305C
+#define AR0521_REG_GLOBAL_GAIN			0x305E
+
+#define AR0521_REG_HISPI_TEST_MODE		0x3066
+#define AR0521_REG_HISPI_TEST_MODE_LP11		  0x0004
+
+#define AR0521_REG_TEST_PATTERN_MODE		0x3070
+
+#define AR0521_REG_SERIAL_FORMAT		0x31AE
+#define AR0521_REG_SERIAL_FORMAT_MIPI		  0x0200
+
+#define AR0521_REG_HISPI_CONTROL_STATUS		0x31C6
+#define AR0521_REG_HISPI_CONTROL_STATUS_FRAMER_TEST_MODE_ENABLE 0x80
+
+#define be		cpu_to_be16
+
+// regulator supplies
+static const char * const ar0521_supply_names[] =3D {
+	"vdd_io",	// I/O (1.8V) supply
+	"vdd_core",	// Core, PLL and MIPI (1.2V) supply
+	"vdd_analog",	// Analog (2.7V) supply
+};
+
+#define AR0521_NUM_SUPPLIES ARRAY_SIZE(ar0521_supply_names)
+
+struct ar0521_ctrls {
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *gain, *red_balance, *blue_balance;
+	struct v4l2_ctrl *test_pattern;
+	struct v4l2_ctrl *hblank, *vblank, *pixrate;
+};
+
+struct ar0521_dev {
+	struct i2c_client *i2c_client;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_fwnode_endpoint ep;
+	struct clk *xclk;
+	u32 xclk_freq;
+
+	struct regulator *supplies[AR0521_NUM_SUPPLIES];
+	struct gpio_desc *reset_gpio;
+
+	// lock to protect all members below
+	struct mutex lock;
+
+	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_fract frame_interval, current_frame_interval;
+	struct ar0521_ctrls ctrls;
+	u32 pix_clk;
+	unsigned int power_count;
+	u16 total_width, total_height, pll_pre, pll_mult, pll_pre2, pll_mult2, ex=
tra_delay;
+	bool streaming;
+};
+
+static int debug;
+module_param(debug, int, 0644);
+MODULE_PARM_DESC(debug, "Debug level 0-3");
+
+static inline struct ar0521_dev *to_ar0521_dev(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ar0521_dev, sd);
+}
+
+static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
+{
+	return &container_of(ctrl->handler, struct ar0521_dev, ctrls.handler)->sd;
+}
+
+static inline unsigned int lanes(struct ar0521_dev *sensor)
+{
+	return sensor->ep.bus.mipi_csi2.num_data_lanes;
+}
+
+static const char *mhz(u32 value)
+{
+	static char buff[32];
+
+	if (value % 1000)
+		sprintf(buff, "%u.%06u", value / (1000 * 1000), value % (1000 * 1000));
+	else if (value % (1000 * 1000))
+		sprintf(buff, "%u.%03u", value / (1000 * 1000), (value / 1000) % 1000);
+	else
+		sprintf(buff, "%u", value / (1000 * 1000));
+	return buff;
+}
+
+static u32 div64_round(u64 v, u32 d)
+{
+	return div_u64(v + (d >> 1), d);
+}
+
+static u32 div64_round_up(u64 v, u32 d)
+{
+	return div_u64(v + d - 1, d);
+}
+
+#define HEX_DUMP_WORDS 8
+static void dump_i2c(struct ar0521_dev *sensor, const __be16 *data, unsign=
ed int count)
+{
+	char buffer[5 /* " XXXX" */ * HEX_DUMP_WORDS + 1 /* NUL */];
+	u16 addr;
+	int i;
+
+	addr =3D be16_to_cpu(*data++);
+	count--;
+	while (count) {
+		for (i =3D 0; i < HEX_DUMP_WORDS; i++) {
+			sprintf(buffer + 5 * i, " %04X", be16_to_cpu(*data++));
+			addr +=3D 2;
+			if (!--count)
+				break;
+		}
+		v4l2_dbg(3, debug, &sensor->sd, "WR %04X:%s\n", addr, buffer);
+	}
+}
+
+// data must be BE16, the first value is the register address
+static int ar0521_write_regs(struct ar0521_dev *sensor, const __be16 *data=
, unsigned int count)
+{
+	struct i2c_client *client =3D sensor->i2c_client;
+	struct i2c_msg msg;
+	int ret;
+
+	if (!sensor->power_count)
+		return 0;
+
+	if (debug >=3D 3)
+		dump_i2c(sensor, data, count);
+
+	msg.addr =3D client->addr;
+	msg.flags =3D client->flags;
+	msg.buf =3D (u8 *)data;
+	msg.len =3D count * sizeof(*data);
+
+	ret =3D i2c_transfer(client->adapter, &msg, 1);
+	if (ret < 0) {
+		v4l2_err(&sensor->sd, "%s: I2C write error\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ar0521_write_reg(struct ar0521_dev *sensor, u16 reg, u16 val)
+{
+	__be16 buf[2] =3D {be(reg), be(val)};
+
+	return ar0521_write_regs(sensor, buf, 2);
+}
+
+static int ar0521_set_geometry(struct ar0521_dev *sensor)
+{
+	// all dimensions are unsigned 12-bit integers
+	u16 x =3D (AR0521_WIDTH_MAX - sensor->fmt.width) / 2;
+	u16 y =3D ((AR0521_HEIGHT_MAX - sensor->fmt.height) / 2) & ~1;
+	__be16 regs[] =3D {
+		be(AR0521_REG_FRAME_LENGTH_LINES),
+		be(sensor->total_height),
+		be(sensor->total_width),
+		be(x),
+		be(y),
+		be(x + sensor->fmt.width - 1),
+		be(y + sensor->fmt.height - 1),
+		be(sensor->fmt.width),
+		be(sensor->fmt.height)
+	};
+
+	v4l2_dbg(2, debug, &sensor->sd, "ar0521_set_geometry()\n");
+
+	return ar0521_write_regs(sensor, regs, ARRAY_SIZE(regs));
+}
+
+static int ar0521_set_gains(struct ar0521_dev *sensor)
+{
+	int green =3D sensor->ctrls.gain->val;
+	int red =3D max(green + sensor->ctrls.red_balance->val, 0);
+	int blue =3D max(green + sensor->ctrls.blue_balance->val, 0);
+	unsigned int gain =3D min(red, min(green, blue));
+	unsigned int analog =3D min(gain, 64u); // range is 0 - 127
+	__be16 regs[5];
+
+	v4l2_dbg(2, debug, &sensor->sd, "ar0521_set_gains()\n");
+
+	red   =3D min(red   - analog + 64, 511u);
+	green =3D min(green - analog + 64, 511u);
+	blue  =3D min(blue  - analog + 64, 511u);
+	regs[0] =3D be(AR0521_REG_GREEN1_GAIN);
+	regs[1] =3D be(green << 7 | analog);
+	regs[2] =3D be(blue  << 7 | analog);
+	regs[3] =3D be(red   << 7 | analog);
+	regs[4] =3D be(green << 7 | analog);
+
+	return ar0521_write_regs(sensor, regs, ARRAY_SIZE(regs));
+}
+
+static int ar0521_write_mode(struct ar0521_dev *sensor)
+{
+	__be16 pll_regs[] =3D {
+		be(AR0521_REG_VT_PIX_CLK_DIV),
+		/* 0x300 */ be(4), // vt_pix_clk_div =3D number of bits / 2
+		/* 0x302 */ be(1), // vt_sys_clk_div
+		/* 0x304 */ be((sensor->pll_pre2 << 8) | sensor->pll_pre),
+		/* 0x306 */ be((sensor->pll_mult2 << 8) | sensor->pll_mult),
+		/* 0x308 */ be(8), // op_pix_clk_div =3D 2 * vt_pix_clk_div
+		/* 0x30A */ be(1)  // op_sys_clk_div
+	};
+	u32 num =3D sensor->current_frame_interval.numerator;
+	u32 denom =3D sensor->current_frame_interval.denominator;
+	int ret;
+
+	v4l2_dbg(2, debug, &sensor->sd, "ar0521_write_mode()\n");
+
+	// stop streaming for just a moment
+	ret =3D ar0521_write_reg(sensor, AR0521_REG_RESET, AR0521_REG_RESET_DEFAU=
LTS);
+	if (ret)
+		return ret;
+
+	ret =3D ar0521_set_geometry(sensor);
+	if (ret)
+		return ret;
+
+	ret =3D ar0521_write_regs(sensor, pll_regs, ARRAY_SIZE(pll_regs));
+	if (ret)
+		return ret;
+
+	ret =3D ar0521_write_reg(sensor, AR0521_REG_COARSE_INTEGRATION_TIME, sens=
or->ctrls.exposure->val);
+	if (ret)
+		return ret;
+
+	ret =3D ar0521_write_reg(sensor, AR0521_REG_EXTRA_DELAY, sensor->extra_de=
lay);
+	if (ret)
+		return ret;
+
+	ret =3D ar0521_write_reg(sensor, AR0521_REG_RESET, AR0521_REG_RESET_DEFAU=
LTS | AR0521_REG_RESET_STREAM);
+	if (ret)
+		return ret;
+
+	ret =3D ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE, sensor->ct=
rls.test_pattern->val);
+	if (ret)
+		return ret;
+
+	dev_info(&sensor->i2c_client->dev,
+		 "AR0521: %ux%u, total %ux%u, pixel clock %s MHz, %u (%u/%u) FPS\n",
+		 sensor->fmt.width, sensor->fmt.height, sensor->total_width, sensor->tot=
al_height,
+		 mhz(sensor->pix_clk), (num + denom / 2) / denom, num, denom);
+	return 0;
+}
+
+static int ar0521_set_stream(struct ar0521_dev *sensor, bool on)
+{
+	int ret;
+
+	v4l2_dbg(2, debug, &sensor->sd, "ar0521_set_stream(%u)\n", on);
+
+	ret =3D ar0521_write_mode(sensor);
+	if (ret)
+		return ret;
+
+	if (on) {
+		ret =3D ar0521_set_gains(sensor);
+		if (ret)
+			return ret;
+
+		// normal output on clock and data lanes
+		ret =3D ar0521_write_reg(sensor, AR0521_REG_HISPI_CONTROL_STATUS, 0);
+		if (ret)
+			return ret;
+	} else {
+		// reset gain, the sensor may produce all white pixels without this
+		ret =3D ar0521_write_reg(sensor, AR0521_REG_GLOBAL_GAIN, 0x2000);
+		if (ret)
+			return ret;
+
+		// set LP-11 on clock and data lanes
+		ret =3D ar0521_write_reg(sensor, AR0521_REG_HISPI_CONTROL_STATUS,
+				       AR0521_REG_HISPI_CONTROL_STATUS_FRAMER_TEST_MODE_ENABLE);
+		if (ret)
+			return ret;
+	}
+
+	// start streaming (possibly with LP-11 on all lines)
+	return ar0521_write_reg(sensor, AR0521_REG_RESET,
+				AR0521_REG_RESET_DEFAULTS |
+				AR0521_REG_RESET_RESTART |
+				AR0521_REG_RESET_STREAM);
+}
+
+static u32 calc_pll(struct ar0521_dev *sensor, int num, u32 freq, u16 *pre=
_ptr, u16 *mult_ptr)
+{
+	u16 pre =3D 1, mult =3D 1, new_pre;
+	u32 pll =3D AR0521_PLL_MAX + 1;
+
+	for (new_pre =3D 1; new_pre < 64; new_pre++) {
+		u32 new_pll;
+		u32 new_mult =3D div64_round_up((u64)freq * new_pre, sensor->xclk_freq);
+
+		if (new_mult < 32)
+			continue; // minimum value
+		if (new_mult > 254)
+			break; // maximum, larger pre won't work either
+		if (sensor->xclk_freq * (u64)new_mult < AR0521_PLL_MIN * new_pre)
+			continue;
+		if (sensor->xclk_freq * (u64)new_mult > AR0521_PLL_MAX * new_pre)
+			break; // larger pre won't work either
+		new_pll =3D div64_round_up(sensor->xclk_freq * (u64)new_mult, new_pre);
+		if (new_pll < pll) {
+			pll =3D new_pll;
+			pre =3D new_pre;
+			mult =3D new_mult;
+		}
+	}
+
+	pll =3D div64_round(sensor->xclk_freq * (u64)mult, pre);
+	*pre_ptr =3D pre;
+	*mult_ptr =3D mult;
+	return pll;
+}
+
+static void ar0521_adj_fmt(struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width =3D clamp(ALIGN(fmt->width, 4), AR0521_WIDTH_MIN, AR0521_WIDTH=
_MAX);
+	fmt->height =3D clamp(ALIGN(fmt->height, 4), AR0521_HEIGHT_MIN, AR0521_HE=
IGHT_MAX);
+	fmt->code =3D MEDIA_BUS_FMT_SGRBG8_1X8;
+	fmt->field =3D V4L2_FIELD_NONE;
+	fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
+	fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
+}
+
+#define DIV 4
+static void ar0521_calc_mode(struct ar0521_dev *sensor)
+{
+	unsigned int speed_mod =3D 4 / lanes(sensor); // 1 with 4 DDR lanes
+	u64 pix_clk; // for calculations
+	u32 pixels, num, denom, new_total_height, new_pixels;
+	u16 total_width, total_height;
+
+	total_width =3D max(sensor->fmt.width + AR0521_WIDTH_BLANKING_MIN, AR0521=
_TOTAL_WIDTH_MIN);
+	total_height =3D sensor->fmt.height + AR0521_HEIGHT_BLANKING_MIN;
+
+	pixels =3D total_width * total_height;
+	num =3D sensor->frame_interval.numerator;
+	denom =3D sensor->frame_interval.denominator;
+
+	// calculate approximate pixel clock first
+	pix_clk =3D div64_round_up(pixels * (u64)num, denom);
+	if (pix_clk > AR0521_PIXEL_CLOCK_MAX) {
+		u32 cnt;
+		// have to recalculate FPS
+		num =3D pix_clk =3D AR0521_PIXEL_CLOCK_MAX;
+		denom =3D pixels;
+		// try to reduce the numbers a bit
+		for (cnt =3D 2; cnt * cnt < denom; cnt++)
+			while (num % cnt =3D=3D 0 && denom % cnt =3D=3D 0) {
+				num /=3D cnt;
+				denom /=3D cnt;
+			}
+	} else if (pix_clk < AR0521_PIXEL_CLOCK_MIN)
+		// we will compensate with total_height and extra_delay
+		pix_clk =3D AR0521_PIXEL_CLOCK_MIN;
+
+	sensor->current_frame_interval.numerator =3D num;
+	sensor->current_frame_interval.denominator =3D denom;
+
+	// PLL1 drives pixel clock - dual rate
+	pix_clk =3D calc_pll(sensor, 1, pix_clk * (DIV / 2), &sensor->pll_pre, &s=
ensor->pll_mult);
+	pix_clk =3D div64_round(pix_clk, (DIV / 2));
+	calc_pll(sensor, 2, pix_clk * (DIV / 2) * speed_mod, &sensor->pll_pre2, &=
sensor->pll_mult2);
+
+	// let's see if we can do better
+	new_total_height =3D (div64_round((u64)pix_clk * denom, num) / total_widt=
h) & ~1; // must be even
+	if (new_total_height > total_height) {
+		total_height =3D new_total_height;
+		pixels =3D total_width * total_height;
+	}
+
+	// maybe there is still room for improvement
+	new_pixels =3D div64_round(pix_clk * denom, num);
+	sensor->extra_delay =3D 0;
+	if (new_pixels > pixels)
+		sensor->extra_delay =3D new_pixels - pixels;
+
+	sensor->pix_clk =3D pix_clk;
+	sensor->total_width =3D total_width;
+	sensor->total_height =3D total_height;
+}
+
+static int ar0521_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_c=
onfig *cfg,
+			  struct v4l2_subdev_format *format)
+{
+	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (format->pad)
+		return -EINVAL;
+
+	v4l2_dbg(1, debug, &sensor->sd, "ar0521_get_fmt(%u)\n", format->which);
+
+	mutex_lock(&sensor->lock);
+
+	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
+		fmt =3D v4l2_subdev_get_try_format(&sensor->sd, cfg, 0 /* pad */);
+	else
+		fmt =3D &sensor->fmt;
+
+	format->format =3D *fmt;
+
+	mutex_unlock(&sensor->lock);
+	return 0;
+}
+
+static int ar0521_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_c=
onfig *cfg,
+			  struct v4l2_subdev_format *format)
+{
+	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
+	int ret =3D 0;
+
+	if (format->pad)
+		return -EINVAL;
+
+	v4l2_dbg(1, debug, &sensor->sd, "ar0521_set_fmt(%u)\n", format->which);
+
+	ar0521_adj_fmt(&format->format);
+
+	mutex_lock(&sensor->lock);
+
+	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		fmt =3D v4l2_subdev_get_try_format(sd, cfg, 0 /* pad */);
+		*fmt =3D format->format;
+	} else {
+		sensor->fmt =3D format->format;
+		ar0521_calc_mode(sensor);
+		ret =3D ar0521_write_mode(sensor);
+	}
+
+	mutex_unlock(&sensor->lock);
+	return ret;
+}
+
+static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct v4l2_subdev *sd =3D ctrl_to_sd(ctrl);
+	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
+	int ret;
+
+	// v4l2_ctrl_lock() locks our own mutex
+
+	v4l2_dbg(1, debug, &sensor->sd, "ar0521_s_ctrl(0x%X)\n", ctrl->id);
+
+	switch (ctrl->id) {
+	case V4L2_CID_HBLANK:
+	case V4L2_CID_VBLANK:
+		sensor->total_width =3D sensor->fmt.width + sensor->ctrls.hblank->val;
+		sensor->total_height =3D sensor->fmt.width + sensor->ctrls.vblank->val;
+		ret =3D ar0521_set_geometry(sensor);
+		break;
+	case V4L2_CID_GAIN:
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret =3D ar0521_set_gains(sensor);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret =3D ar0521_write_reg(sensor, AR0521_REG_COARSE_INTEGRATION_TIME, ctr=
l->val);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret =3D ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE, ctrl->val=
);
+		break;
+	default:
+		ret =3D -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ar0521_ctrl_ops =3D {
+	.s_ctrl =3D ar0521_s_ctrl,
+};
+
+static const char * const test_pattern_menu[] =3D {
+	"Disabled",
+	"Solid color",
+	"Color bars",
+	"Faded color bars"
+};
+
+static int ar0521_init_controls(struct ar0521_dev *sensor)
+{
+	const struct v4l2_ctrl_ops *ops =3D &ar0521_ctrl_ops;
+	struct ar0521_ctrls *ctrls =3D &sensor->ctrls;
+	struct v4l2_ctrl_handler *hdl =3D &ctrls->handler;
+	int ret;
+
+	v4l2_ctrl_handler_init(hdl, 32);
+
+	// we can use our own mutex for the ctrl lock
+	hdl->lock =3D &sensor->lock;
+
+	// manual gain
+	ctrls->gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 511, 1, 0);
+	ctrls->red_balance =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_RED_BALANCE, =
-512, 511, 1, 0);
+	ctrls->blue_balance =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BLUE_BALANCE=
, -512, 511, 1, 0);
+
+	// alternate for frame interval
+	ctrls->hblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, AR0521_WID=
TH_BLANKING_MIN, 4094, 1, AR0521_WIDTH_BLANKING_MIN);
+	ctrls->vblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, AR0521_HEI=
GHT_BLANKING_MIN, 4094, 2, AR0521_HEIGHT_BLANKING_MIN);
+	// Read-only
+	ctrls->pixrate =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE, AR052=
1_PIXEL_CLOCK_MIN, AR0521_PIXEL_CLOCK_MAX, 1, AR0521_PIXEL_CLOCK_MIN);
+
+	// manual exposure time
+	ctrls->exposure =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0, 655=
35, 1, 0);
+
+	ctrls->test_pattern =3D v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_T=
EST_PATTERN,
+							   ARRAY_SIZE(test_pattern_menu) - 1,
+							   0, 0, test_pattern_menu);
+
+	if (hdl->error) {
+		ret =3D hdl->error;
+		goto free_ctrls;
+	}
+
+	sensor->sd.ctrl_handler =3D hdl;
+	return 0;
+
+free_ctrls:
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
+}
+
+static const struct initial_reg {
+	u16 addr, value;
+} initial_regs[] =3D {
+	// corrections_recommended_bayer
+	{0x3042, 0x0004}, // RNC:enable b/w rnc mode
+	{0x3044, 0x4580}, // RNC:enable row noise correction
+	{0x30EE, 0x1136}, // RNC:rnc scaling factor-->initial recommended setting
+	{0x3120, 0x0001}, // recommended setting for dither
+	{0x3F2C, 0x442E}, // GTH_THRES_RTN: 7max,7min filtered out of every 46
+	{0x30D2, 0x0000}, // CRM/CC: enable crm on Visible and CC rows
+	{0x30D4, 0x0000}, // CC: CC enabled with 16 samples per column
+	{0x30D6, 0x2FFF}, // CC: bw mode enabled/12 bit data resolution/bw mode
+	{0x30DA, 0x0FFF}, // CC: column correction clip level 2 is 0
+	{0x30DC, 0x0FFF}, // CC: column correction clip level 3 is 0
+	{0x30DE, 0x0000}, // CC: Group FPN correction
+	{0x31E0, 0x0781}, // Fuse/2DDC: enable 2ddc
+	{0x3180, 0x9434}, // FDOC:fdoc settings with fdoc every frame turned of
+	{0x3172, 0x0206}, // txlo clk divider options
+	{0x3F00, 0x0017}, // BM_T0
+	{0x3F02, 0x02DD}, // BM_T1
+	{0x3F04, 0x0020}, // if Ana_gain less than 2, use noise_floor0, multipl
+	{0x3F06, 0x0040}, // if Ana_gain between 4 and 7, use noise_floor2 and
+	{0x3F08, 0x0070}, // if Ana_gain between 4 and 7, use noise_floor2 and
+	{0x3F0A, 0x0101}, // Define noise_floor0(low address) and noise_floor1
+	{0x3F0C, 0x0302}, // Define noise_floor2 and noise_floor3
+	{0x3F1E, 0x0022},
+	{0x3F1A, 0x01FF}, // cross factor 2
+	{0x3F14, 0x0505}, // single k factor 2
+	{0x3F44, 0x0707}, // couple k factor 2
+	{0x3F18, 0x01FF}, // cross factor 1
+	{0x3F12, 0x0505}, // single k factor 1
+	{0x3F42, 0x1511}, // couple k factor 1
+	{0x3F16, 0x01FF}, // cross factor 0
+	{0x3F10, 0x0505}, // single k factor 0
+	{0x3F40, 0x1511}, // couple k factor 0
+
+	// analog_setup_recommended_12bit
+	{0x3EB6, 0x004C}, // ECL
+	{0x3EBA, 0xAAAA},
+	{0x3EBC, 0x0086}, // Bias currents for FSC/ECL
+	{0x3EC0, 0x1E00}, // SFbin/SH mode settings
+	{0x3EC2, 0x100B}, // CLK divider for ramp for 12 bit 400MHz mode only
+	{0x3EC4, 0x3300}, // FSC clamps for HDR mode and adc comp power down co
+	{0x3EC6, 0xEA44}, // VLN and clk gating controls
+	{0x3EC8, 0x6F6F}, // Txl0 and Txlo1 settings for normal mode
+	{0x3ECA, 0x2F4A}, // CDAC/Txlo2/RSTGHI/RSTGLO settings
+	{0x3ECC, 0x0506}, // RSTDHI/RSTDLO/CDAC/TXHI settings
+	{0x3ECE, 0x203B}, // Ramp buffer settings and Booster enable (bits 0-5)
+	{0x3ED0, 0x13F0}, // TXLO from atest/sf bin settings
+	{0x3ED2, 0x9A3D}, // Booster settings for reference rows/columns
+	{0x3ED4, 0x862F}, // TXLO open loop/row driver settings
+	{0x3ED6, 0x4081}, // Txlatch fr cfpn rows/vln bias
+	{0x3ED8, 0x4003}, // Ramp step setting for 12 bit 400 Mhz mode
+	{0x3EDA, 0x9A80}, // ramp offset for T1/normal and rst under range
+	{0x3EDC, 0xC000}, // over range for rst and under range for sig
+	{0x3EDE, 0xC103}, // over range for sig and col dec clk settings
+	{0x3426, 0x1600}, // ADC offset distribution pulse
+	{0x342A, 0x0038}, // pulse_config
+	{0x3F3E, 0x0001}, // Switch ADC from 10 bit to 12 bit mode
+	{0x341A, 0x6051},
+	{0x3420, 0x6051},
+
+	// analog_setup_recommended_10bit
+	{0x3EC2, 0x100A}, // CLK divider for ramp for 10 bit 400MH
+	{0x3ED8, 0x8003}, // Ramp step setting for 10 bit 400 Mhz
+	{0x341A, 0x4735}, // Samp&Hold pulse in ADC
+	{0x3420, 0x4735}, // Samp&Hold pulse in ADC
+	{0x3426, 0x8A1A}, // ADC offset distribution pulse
+	{0x342A, 0x0018}, // pulse_config
+	{0x3ED2, 0xA53D}, // Ramp offset
+	{0x3EDA, 0xA580}, // Ramp Offset
+	{0x3EBA, 0xAAAD},
+	{0x3EB6, 0x004C},
+	{0x3F3E, 0x0000}, // Switch ADC from 12 bit to 10 bit mode
+
+	// new RNC 10bit
+	{0x30EE, 0x1136}, // RNC:rnc scaling factor=3D*54/64 (32/38*64=3D53.9)
+	{0x3F2C, 0x442E}, // GTH_THRES_RTN: 4max,4min filtered out of every 46 sa=
mples and
+	// for 10bit mode
+	{0x301E, 0x00AA}, // PEDESTAL+2 :+2 is a workaround for 10bit mode +0.5 R=
ounding
+	{0x3120, 0x0005}, // p1 dither enabled for 10bit mode
+
+	{0x0112, 0x0808}, // 8-bit/8-bit mode
+	{0x31BC, 0x068C}, // don't use continuous clock mode while shut down
+	{0x30FA, 0xFD00}, // GPIO0 =3D flash, GPIO1 =3D shutter
+	{0x31B0, 0x008B}, // frame_preamble - FIXME check WRT lanes#
+	{0x31B2, 0x0050}, // line_preamble - FIXME check WRT lanes#
+};
+
+static __be16 pixel_timing_recommended[] =3D {
+	be(0x3D00), // first register address
+	/* 3D00 */ be(0x043E), be(0x4760), be(0xFFFF), be(0xFFFF), be(0x8000), be=
(0x0510), be(0xAF08), be(0x0252),
+	/* 3D10 */ be(0x486F), be(0x5D5D), be(0x8056), be(0x8313), be(0x0087), be=
(0x6A48), be(0x6982), be(0x0280),
+	/* 3D20 */ be(0x8359), be(0x8D02), be(0x8020), be(0x4882), be(0x4269), be=
(0x6A95), be(0x5988), be(0x5A83),
+	/* 3D30 */ be(0x5885), be(0x6280), be(0x6289), be(0x6097), be(0x5782), be=
(0x605C), be(0xBF18), be(0x0961),
+	/* 3D40 */ be(0x5080), be(0x2090), be(0x4390), be(0x4382), be(0x5F8A), be=
(0x5D5D), be(0x9C63), be(0x8063),
+	/* 3D50 */ be(0xA960), be(0x9757), be(0x8260), be(0x5CFF), be(0xBF10), be=
(0x1681), be(0x0802), be(0x8000),
+	/* 3D60 */ be(0x141C), be(0x6000), be(0x6022), be(0x4D80), be(0x5C97), be=
(0x6A69), be(0xAC6F), be(0x4645),
+	/* 3D70 */ be(0x4400), be(0x0513), be(0x8069), be(0x6AC6), be(0x5F95), be=
(0x5F70), be(0x8040), be(0x4A81),
+	/* 3D80 */ be(0x0300), be(0xE703), be(0x0088), be(0x4A83), be(0x40FF), be=
(0xFFFF), be(0xFD70), be(0x8040),
+	/* 3D90 */ be(0x4A85), be(0x4FA8), be(0x4F8C), be(0x0070), be(0xBE47), be=
(0x8847), be(0xBC78), be(0x6B89),
+	/* 3DA0 */ be(0x6A80), be(0x6986), be(0x6B8E), be(0x6B80), be(0x6980), be=
(0x6A88), be(0x7C9F), be(0x866B),
+	/* 3DB0 */ be(0x8765), be(0x46FF), be(0xE365), be(0xA679), be(0x4A40), be=
(0x4580), be(0x44BC), be(0x7000),
+	/* 3DC0 */ be(0x8040), be(0x0802), be(0x10EF), be(0x0104), be(0x3860), be=
(0x5D5D), be(0x5682), be(0x1300),
+	/* 3DD0 */ be(0x8648), be(0x8202), be(0x8082), be(0x598A), be(0x0280), be=
(0x2048), be(0x3060), be(0x8042),
+	/* 3DE0 */ be(0x9259), be(0x865A), be(0x8258), be(0x8562), be(0x8062), be=
(0x8560), be(0x9257), be(0x8221),
+	/* 3DF0 */ be(0x10FF), be(0xB757), be(0x9361), be(0x1019), be(0x8020), be=
(0x9043), be(0x8E43), be(0x845F),
+	/* 3E00 */ be(0x835D), be(0x805D), be(0x8163), be(0x8063), be(0xA060), be=
(0x9157), be(0x8260), be(0x5CFF),
+	/* 3E10 */ be(0xFFFF), be(0xFFE5), be(0x1016), be(0x2048), be(0x0802), be=
(0x1C60), be(0x0014), be(0x0060),
+	/* 3E20 */ be(0x2205), be(0x8120), be(0x908F), be(0x6A80), be(0x6982), be=
(0x5F9F), be(0x6F46), be(0x4544),
+	/* 3E30 */ be(0x0005), be(0x8013), be(0x8069), be(0x6A80), be(0x7000), be=
(0x0000), be(0x0000), be(0x0000),
+	/* 3E40 */ be(0x0000), be(0x0000), be(0x0000), be(0x0000), be(0x0000), be=
(0x0000), be(0x0000), be(0x0000),
+	/* 3E50 */ be(0x0000), be(0x0000), be(0x0000), be(0x0000), be(0x0000), be=
(0x0000), be(0x0000), be(0x0000),
+	/* 3E60 */ be(0x0000), be(0x0000), be(0x0000), be(0x0000), be(0x0000), be=
(0x0000), be(0x0000), be(0x0000),
+	/* 3E70 */ be(0x0000), be(0x0000), be(0x0000), be(0x0000), be(0x0000), be=
(0x0000), be(0x0000), be(0x0000),
+	/* 3E80 */ be(0x0000), be(0x0000), be(0x0000), be(0x0000), be(0x0000), be=
(0x0000), be(0x0000), be(0x0000),
+	/* 3E90 */ be(0x0000), be(0x0000), be(0x0000), be(0x0000), be(0x0000), be=
(0x0000), be(0x0000), be(0x0000),
+	/* 3EA0 */ be(0x0000), be(0x0000), be(0x0000), be(0x0000), be(0x0000), be=
(0x0000), be(0x0000), be(0x0000),
+	/* 3EB0 */ be(0x0000), be(0x0000), be(0x0000)};
+
+static void ar0521_power_off(struct ar0521_dev *sensor)
+{
+	int i;
+
+	v4l2_dbg(1, debug, &sensor->sd, "ar0521_power_off()\n");
+	clk_disable_unprepare(sensor->xclk);
+
+	if (sensor->reset_gpio)
+		gpiod_set_value(sensor->reset_gpio, 1); // assert RESET signal
+
+	for (i =3D AR0521_NUM_SUPPLIES - 1; i >=3D 0; i--) {
+		if (sensor->supplies[i])
+			regulator_disable(sensor->supplies[i]);
+	}
+}
+
+static int ar0521_power_on(struct ar0521_dev *sensor)
+{
+	int i, ret;
+	unsigned int nlanes =3D lanes(sensor);
+
+	v4l2_dbg(1, debug, &sensor->sd, "ar0521_power_on()\n");
+	for (i =3D 0; i < AR0521_NUM_SUPPLIES; i++)
+		if (sensor->supplies[i]) {
+			ret =3D regulator_enable(sensor->supplies[i]);
+			if (ret < 0)
+				goto off;
+
+			usleep_range(1000, 1500); // min 1 ms
+		}
+
+	ret =3D clk_prepare_enable(sensor->xclk);
+	if (ret < 0) {
+		v4l2_err(&sensor->sd, "error enabling sensor clock\n");
+		goto off;
+	}
+	usleep_range(1000, 1500); // min 1 ms
+
+	if (sensor->reset_gpio)
+		gpiod_set_value(sensor->reset_gpio, 0); // deassert RESET signal
+	usleep_range(4500, 5000); // min 45000 clocks
+
+	for (i =3D 0; i < ARRAY_SIZE(initial_regs); i++)
+		if (ar0521_write_reg(sensor, initial_regs[i].addr, initial_regs[i].value=
))
+			goto off;
+
+	ret =3D ar0521_write_regs(sensor, pixel_timing_recommended, ARRAY_SIZE(pi=
xel_timing_recommended));
+	if (ret)
+		goto off;
+
+	ret =3D ar0521_write_reg(sensor, AR0521_REG_SERIAL_FORMAT, AR0521_REG_SER=
IAL_FORMAT_MIPI | nlanes);
+	if (ret)
+		goto off;
+
+	// set MIPI test mode - disabled for now
+	ret =3D ar0521_write_reg(sensor, AR0521_REG_HISPI_TEST_MODE,
+			       ((0x40 << nlanes) - 0x40) | AR0521_REG_HISPI_TEST_MODE_LP11);
+	if (ret)
+		goto off;
+
+	ret =3D ar0521_write_reg(sensor, AR0521_REG_ROW_SPEED, 0x110 | 4 / nlanes=
);
+	if (ret)
+		goto off;
+
+	ar0521_calc_mode(sensor);
+
+	ret =3D ar0521_set_stream(sensor, 0);
+	if (ret)
+		goto off;
+
+	return 0;
+off:
+	ar0521_power_off(sensor);
+	return ret;
+}
+
+static int ar0521_s_power(struct v4l2_subdev *sd, int on)
+{
+	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
+
+	v4l2_dbg(1, debug, &sensor->sd, "ar0521_s_power(%u, %s)\n", sensor->power=
_count, on ? "on" : "off");
+
+	if (on) {
+		if (!sensor->power_count++) {
+			int ret =3D ar0521_power_on(sensor);
+			if (ret) {
+				sensor->power_count =3D 0; // undo
+				return ret;
+			}
+		}
+	} else if (!--sensor->power_count)
+		ar0521_power_off(sensor);
+
+	return 0;
+}
+
+static int ar0521_enum_mbus_code(struct v4l2_subdev *sd, struct v4l2_subde=
v_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
+
+	if (code->pad || code->index)
+		return -EINVAL;
+
+	code->code =3D sensor->fmt.code;
+	v4l2_dbg(1, debug, &sensor->sd, "ar0521_enum_mbus_code() =3D %X\n", code-=
>code);
+	return 0;
+}
+
+static int ar0521_g_frame_interval(struct v4l2_subdev *sd, struct v4l2_sub=
dev_frame_interval *fi)
+{
+	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
+
+	mutex_lock(&sensor->lock);
+	fi->interval =3D sensor->current_frame_interval;
+	mutex_unlock(&sensor->lock);
+	v4l2_dbg(1, debug, &sensor->sd, "ar0521_g_frame_interval() =3D %u/%u\n",
+		 fi->interval.numerator, fi->interval.denominator);
+	return 0;
+}
+
+static int ar0521_s_frame_interval(struct v4l2_subdev *sd, struct v4l2_sub=
dev_frame_interval *fi)
+{
+	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
+	int ret;
+
+	if (fi->pad)
+		return -EINVAL;
+
+	v4l2_dbg(1, debug, &sensor->sd, "ar0521_s_frame_interval(%u/%u)\n",
+		 fi->interval.numerator, fi->interval.denominator);
+	mutex_lock(&sensor->lock);
+
+	if (sensor->streaming) {
+		ret =3D -EBUSY;
+		goto out;
+	}
+
+	sensor->frame_interval =3D fi->interval;
+	ar0521_calc_mode(sensor);
+	ret =3D ar0521_write_mode(sensor);
+out:
+	mutex_unlock(&sensor->lock);
+	return ret;
+}
+
+static int ar0521_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
+	int ret;
+
+	v4l2_dbg(1, debug, &sensor->sd, "ar0521_s_stream(%i)\n", enable);
+	mutex_lock(&sensor->lock);
+
+	ret =3D ar0521_set_stream(sensor, enable);
+	sensor->streaming =3D enable;
+
+	mutex_unlock(&sensor->lock);
+	return ret;
+}
+
+static const struct v4l2_subdev_core_ops ar0521_core_ops =3D {
+	.log_status =3D v4l2_ctrl_subdev_log_status,
+	.s_power =3D ar0521_s_power,
+	.subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_video_ops ar0521_video_ops =3D {
+	.g_frame_interval =3D ar0521_g_frame_interval,
+	.s_frame_interval =3D ar0521_s_frame_interval,
+	.s_stream =3D ar0521_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops ar0521_pad_ops =3D {
+	.enum_mbus_code =3D ar0521_enum_mbus_code,
+	.get_fmt =3D ar0521_get_fmt,
+	.set_fmt =3D ar0521_set_fmt,
+};
+
+static const struct v4l2_subdev_ops ar0521_subdev_ops =3D {
+	.core =3D &ar0521_core_ops,
+	.video =3D &ar0521_video_ops,
+	.pad =3D &ar0521_pad_ops,
+};
+
+static int ar0521_probe(struct i2c_client *client, const struct i2c_device=
_id *id)
+{
+	struct device *dev =3D &client->dev;
+	struct fwnode_handle *endpoint;
+	struct ar0521_dev *sensor;
+	unsigned int cnt, nlanes;
+	int ret;
+
+	v4l2_dbg(1, debug, client, "ar0521_probe()\n");
+	sensor =3D devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
+	if (!sensor)
+		return -ENOMEM;
+
+	sensor->i2c_client =3D client;
+	sensor->fmt.code =3D MEDIA_BUS_FMT_SGRBG8_1X8;
+	sensor->fmt.width =3D AR0521_WIDTH_MAX;
+	sensor->fmt.height =3D AR0521_HEIGHT_MAX;
+	sensor->fmt.field =3D V4L2_FIELD_NONE;
+	sensor->frame_interval.numerator =3D 30;
+	sensor->frame_interval.denominator =3D 1;
+
+	endpoint =3D fwnode_graph_get_next_endpoint(of_fwnode_handle(dev->of_node=
), NULL);
+	if (!endpoint) {
+		dev_err(dev, "endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	ret =3D v4l2_fwnode_endpoint_parse(endpoint, &sensor->ep);
+	fwnode_handle_put(endpoint);
+	if (ret) {
+		dev_err(dev, "could not parse endpoint\n");
+		return ret;
+	}
+
+	if (sensor->ep.bus_type !=3D V4L2_MBUS_CSI2_DPHY) {
+		dev_err(dev, "invalid bus type, must be MIPI CSI2\n");
+		return -EINVAL;
+	}
+
+	nlanes =3D lanes(sensor);
+	switch (nlanes) {
+	case 1:
+	case 2:
+	case 4:
+		break;
+	default:
+		dev_err(dev, "invalid number of MIPI data lane%s\n", nlanes > 1 ? "s" : =
"");
+		return -EINVAL;
+	}
+
+	// get master clock (xclk)
+	sensor->xclk =3D devm_clk_get(dev, "xclk");
+	if (IS_ERR(sensor->xclk)) {
+		dev_err(dev, "failed to get xclk\n");
+		return PTR_ERR(sensor->xclk);
+	}
+
+	ret =3D clk_set_rate(sensor->xclk, AR0521_XCLK_RATE);
+	if (ret < 0) {
+		dev_err(dev, "error setting clock rate\n");
+		return ret;
+	}
+
+	sensor->xclk_freq =3D clk_get_rate(sensor->xclk);
+
+	if (sensor->xclk_freq < AR0521_XCLK_MIN ||
+	    sensor->xclk_freq > AR0521_XCLK_MAX) {
+		dev_err(dev, "xclk frequency out of range: %u Hz\n", sensor->xclk_freq);
+		return -EINVAL;
+	}
+
+	// request optional reset pin (usually active low) and assert it
+	sensor->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HI=
GH);
+
+	v4l2_i2c_subdev_init(&sensor->sd, client, &ar0521_subdev_ops);
+
+	sensor->sd.flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVEN=
TS;
+	sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
+	sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
+	ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
+	if (ret)
+		return ret;
+
+	for (cnt =3D 0; cnt < AR0521_NUM_SUPPLIES; cnt++) {
+		struct regulator *supply =3D devm_regulator_get_optional(dev, ar0521_sup=
ply_names[cnt]);
+		if (!IS_ERR(supply))
+			sensor->supplies[cnt] =3D supply;
+	}
+
+	mutex_init(&sensor->lock);
+
+	ret =3D ar0521_init_controls(sensor);
+	if (ret)
+		goto entity_cleanup;
+
+	ret =3D v4l2_async_register_subdev(&sensor->sd);
+	if (ret)
+		goto free_ctrls;
+
+	ar0521_adj_fmt(&sensor->fmt);
+
+	dev_info(dev, "AR0521 driver initialized, master clock frequency: %s MHz,=
 %u MIPI data lanes\n",
+		 mhz(sensor->xclk_freq), nlanes);
+	return 0;
+
+free_ctrls:
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+entity_cleanup:
+	media_entity_cleanup(&sensor->sd.entity);
+	mutex_destroy(&sensor->lock);
+	return ret;
+}
+
+static int ar0521_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
+	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
+
+	v4l2_async_unregister_subdev(&sensor->sd);
+	media_entity_cleanup(&sensor->sd.entity);
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+	mutex_destroy(&sensor->lock);
+	return 0;
+}
+
+static const struct i2c_device_id ar0521_id[] =3D {
+	{"ar0521", 0},
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, ar0521_id);
+
+static const struct of_device_id ar0521_dt_ids[] =3D {
+	{.compatible =3D "onnn,ar0521"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, ar0521_dt_ids);
+
+static struct i2c_driver ar0521_i2c_driver =3D {
+	.driver =3D {
+		.name  =3D "ar0521",
+		.of_match_table	=3D ar0521_dt_ids,
+	},
+	.id_table =3D ar0521_id,
+	.probe    =3D ar0521_probe,
+	.remove   =3D ar0521_remove,
+};
+
+module_i2c_driver(ar0521_i2c_driver);
+
+MODULE_DESCRIPTION("AR0521 MIPI Camera subdev driver");
+MODULE_AUTHOR("Krzysztof Ha=C5=82asa <khalasa@piap.pl>");
+MODULE_LICENSE("GPL");

--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
