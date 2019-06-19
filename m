Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B642E4BCC7
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 17:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbfFSP2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 11:28:51 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35573 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbfFSP2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 11:28:51 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hdcVs-0003oT-VG; Wed, 19 Jun 2019 17:28:40 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hdcVs-00081t-BY; Wed, 19 Jun 2019 17:28:40 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     sakari.ailus@linux.intel.com, mchehab@kernel.org,
        robh+dt@kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Cc:     devicetree@vger.kernel.org, graphics@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver
Date:   Wed, 19 Jun 2019 17:28:38 +0200
Message-Id: <20190619152838.25079-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619152838.25079-1-m.felsch@pengutronix.de>
References: <20190619152838.25079-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding support for the TC358746 bridge. The Bridge can receive images on
the parallel input port and send it to the host using the CSI-TX unit.
Furthermore the Bridge can receive images from the host using the CSI-RX
unit and send it to the parallel output port.

Currently the only the first case is implemented and tested. The bridge
driver needs two information from the connected sensor: hblank time and
pixel-rate. Both information are requested using the v4l2_ctrl interface.
The driver won't create a media-link if one or both information are
missing.

Missing feature:
- Provide mclk on GPIO[0]
- Sending pictures from the host to a parallel display
- v4l_event support

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changes
v2:
 - adapt Kconfig symbole description
 - reorder includes alphabetical
 - drop refclk input-clock is named 'refclk'
 - fix module license to GPL v2
 - use unsigned int for zero-based count vars
 - use unsigned int for width parameter in tc358746_adjust_fifo_size()
   tc358746_adjust_timings()
 - use unsgined int for state->link_freq local variables since that
   can't be negative
 - drop tc358746_g_mbus_config() since it will be removed soon
 - store the sensor_pclk_ctrl and sensor_hblank_ctrl references to
   request the ctrl's only once.
 - replace dev_*() by v4l2_*() macros
 - move to probe_new() and drop i2c_device_id table
 - improve error path during probe()
 - change i2c_wr16_and_or() logic so the user only have to specify the
   mask. This avoids build warnings due to '-Woverflow' compilations.
   The bug was found by the kbuild test robot.

 drivers/media/i2c/Kconfig         |   12 +
 drivers/media/i2c/Makefile        |    1 +
 drivers/media/i2c/tc358746.c      | 1807 +++++++++++++++++++++++++++++
 drivers/media/i2c/tc358746_regs.h |  208 ++++
 4 files changed, 2028 insertions(+)
 create mode 100644 drivers/media/i2c/tc358746.c
 create mode 100644 drivers/media/i2c/tc358746_regs.h

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index cb8db944aa41..454d8f682126 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -360,6 +360,18 @@ config VIDEO_TC358743_CEC
 	  When selected the tc358743 will support the optional
 	  HDMI CEC feature.
 
+config VIDEO_TC358746
+	tristate "Toshiba TC358746 parallel-CSI2 bridge"
+	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API && MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	help
+	  Support for the Toshiba TC358746 PARALLEL to MIPI CSI-2 bridge.
+	  The bridge can work in both directions but currenty only the
+	  parallel-in / csi-out path is supported.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called tc358746.
+
 config VIDEO_TVP514X
 	tristate "Texas Instruments TVP514x video decoder"
 	depends on VIDEO_V4L2 && I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d8ad9dad495d..3d5073cc26cf 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -108,6 +108,7 @@ obj-$(CONFIG_VIDEO_I2C)		+= video-i2c.o
 obj-$(CONFIG_VIDEO_ML86V7667)	+= ml86v7667.o
 obj-$(CONFIG_VIDEO_OV2659)	+= ov2659.o
 obj-$(CONFIG_VIDEO_TC358743)	+= tc358743.o
+obj-$(CONFIG_VIDEO_TC358746)	+= tc358746.o
 obj-$(CONFIG_VIDEO_IMX214)	+= imx214.o
 obj-$(CONFIG_VIDEO_IMX258)	+= imx258.o
 obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
new file mode 100644
index 000000000000..58612824b267
--- /dev/null
+++ b/drivers/media/i2c/tc358746.c
@@ -0,0 +1,1807 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tc358746 - Parallel to CSI-2 bridge
+ *
+ * Copyright 2018 Marco Felsch <kernel@pengutronix.de>
+ *
+ * References:
+ * REF_01:
+ * - TC358746AXBG/TC358748XBG/TC358748IXBG Functional Specification Rev 1.2
+ * REF_02:
+ * - TC358746(A)748XBG_Parallel-CSI2_Tv23p.xlsx, Rev Tv23
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#include "tc358746_regs.h"
+
+static int debug;
+module_param(debug, int, 0644);
+MODULE_PARM_DESC(debug, "debug level (0-3)");
+
+MODULE_DESCRIPTION("Toshiba TC358746 Parallel to CSI-2 bridge driver");
+MODULE_AUTHOR("Marco Felsch <kernel@pengutronix.de>");
+MODULE_LICENSE("GPL v2");
+
+#define I2C_MAX_XFER_SIZE	(512 + 2)
+#define TC358746_MAX_FIFO_SIZE	512
+#define TC358746_DEF_LINK_FREQ	0
+
+#define TC358746_LINEINIT_MIN_US	110
+#define TC358746_TWAKEUP_MIN_US		1200
+#define TC358746_LPTXTIME_MIN_NS	55
+#define TC358746_TCLKZERO_MIN_NS	305
+#define TC358746_TCLKTRAIL_MIN_NS	65
+#define TC358746_TCLKPOST_MIN_NS	65
+#define TC358746_THSZERO_MIN_NS		150
+#define TC358746_THSTRAIL_MIN_NS	65
+#define TC358746_THSPREPARE_MIN_NS	45
+
+static const struct v4l2_mbus_framefmt tc358746_def_fmt = {
+	.width		= 640,
+	.height		= 480,
+	.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+	.field		= V4L2_FIELD_NONE,
+	.colorspace	= V4L2_COLORSPACE_DEFAULT,
+	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
+	.quantization	= V4L2_QUANTIZATION_DEFAULT,
+	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
+};
+
+struct tc358746_csi_param {
+	unsigned char speed_range;
+	unsigned int  unit_clk_hz;
+	unsigned char unit_clk_mul;
+	unsigned int speed_per_lane; /* bps / lane */
+	unsigned short lane_num;
+	bool is_continuous_clk;
+
+	/* CSI2-TX Parameters */
+	u32 lineinitcnt;
+	u32 lptxtimecnt;
+	u32 twakeupcnt;
+	u32 tclk_preparecnt;
+	u32 tclk_zerocnt;
+	u32 tclk_trailcnt;
+	u32 tclk_postcnt;
+	u32 ths_preparecnt;
+	u32 ths_zerocnt;
+	u32 ths_trailcnt;
+
+	unsigned int csi_hs_lp_hs_ps;
+};
+
+enum tc358746_csi_direction {
+	TC358746_CSI_RX, /* CSI-in -> Parallel-out */
+	TC358746_CSI_TX  /* Parallel-in -> CSI-out */
+};
+
+struct tc358746_state {
+	struct v4l2_subdev sd;
+	struct i2c_client *i2c_client;
+	struct gpio_desc *reset_gpio;
+
+	/*
+	 * Generic
+	 */
+	struct media_pad pads[2];
+	struct mutex confctl_mutex;
+	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_ctrl_handler hdl;
+	bool fmt_changed;
+	bool test;
+
+	/*
+	 * Chip Clocks
+	 */
+	struct clk  *refclk;
+	/* internal pll */
+	unsigned int pllinclk_hz;
+	u16 pll_prd;
+	u16 pll_fbd;
+
+	/*
+	 * Video Buffer
+	 */
+	u16 vb_fifo; /* The FIFO size is 511x32 */
+
+	/* currently only TC358746_CSI_TX supported */
+	enum tc358746_csi_direction csi_dir;
+
+	/*
+	 * CSI TX
+	 */
+	struct v4l2_ctrl	  *link_freq;
+	struct tc358746_csi_param *link_freq_settings;
+	u64			  *link_frequencies;
+	unsigned int		   link_frequencies_num;
+
+	/*
+	 * Parallel input
+	 */
+	struct v4l2_ctrl *sensor_pclk_ctrl;
+	struct v4l2_ctrl *sensor_hblank_ctrl;
+	unsigned int pclk;
+	unsigned int hblank;
+};
+
+struct tc358746_mbus_fmt {
+	u32 code;
+	u8 bus_width;
+	u8 bpp;		 /* total bpp */
+	u8 pdformat;	 /* peripheral data format */
+	u8 pdataf;	 /* parallel data format option */
+	u8 ppp;		 /* pclk per pixel */
+	bool csitx_only; /* format only in csi-tx mode supported */
+};
+
+/* TODO: Add other formats as required */
+static const struct tc358746_mbus_fmt tc358746_formats[] = {
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.bus_width = 8,
+		.bpp = 16,
+		.pdformat = DATAFMT_PDFMT_YCBCRFMT_422_8_BIT,
+		.pdataf = CONFCTL_PDATAF_MODE0,
+		.ppp = 2,
+	}, {
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.bus_width = 16,
+		.bpp = 16,
+		.pdformat = DATAFMT_PDFMT_YCBCRFMT_422_8_BIT,
+		.pdataf = CONFCTL_PDATAF_MODE1,
+		.ppp = 1,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.bus_width = 16,
+		.bpp = 16,
+		.pdformat = DATAFMT_PDFMT_YCBCRFMT_422_8_BIT,
+		.pdataf = CONFCTL_PDATAF_MODE2,
+		.ppp = 1,
+	}, {
+		.code = MEDIA_BUS_FMT_UYVY10_2X10,
+		.bus_width = 10,
+		.bpp = 20,
+		.pdformat = DATAFMT_PDFMT_YCBCRFMT_422_10_BIT,
+		.pdataf = CONFCTL_PDATAF_MODE0, /* don't care */
+		.ppp = 2,
+	}, {
+		/* in datasheet listed as YUV444 */
+		.code = MEDIA_BUS_FMT_GBR888_1X24,
+		.bus_width = 24,
+		.bpp = 24,
+		.pdformat = DATAFMT_PDFMT_YCBCRFMT_444,
+		.pdataf = CONFCTL_PDATAF_MODE0, /* don't care */
+		.ppp = 2,
+		.csitx_only = true,
+	},
+};
+
+/* --------------- HELPERS ------------ */
+static void
+tc358746_dump_csi(struct v4l2_subdev *sd,
+		  struct tc358746_csi_param *csi_setting)
+{
+	v4l2_dbg(2, debug, sd, "Speed-Range value %u\n",
+		 csi_setting->speed_range);
+	v4l2_dbg(2, debug, sd, "Unit Clock %u Hz\n", csi_setting->unit_clk_hz);
+	v4l2_dbg(2, debug, sd, "Unit Clock Mul %u\n",
+		 csi_setting->unit_clk_mul);
+	v4l2_dbg(2, debug, sd, "CSI speed/lane %u bps/lane\n",
+		 csi_setting->speed_per_lane);
+	v4l2_dbg(2, debug, sd, "CSI lanes %u\n", csi_setting->lane_num);
+	v4l2_dbg(2, debug, sd, "CSI clock during LP %sabled\n",
+		 csi_setting->is_continuous_clk ? "en" : "dis");
+
+	v4l2_dbg(2, debug, sd, "lineinitcnt %u\n", csi_setting->lineinitcnt);
+	v4l2_dbg(2, debug, sd, "lptxtimecnt %u\n", csi_setting->lptxtimecnt);
+	v4l2_dbg(2, debug, sd, "tclk_preparecnt %u\n",
+		 csi_setting->tclk_preparecnt);
+	v4l2_dbg(2, debug, sd, "tclk_zerocnt %u\n", csi_setting->tclk_zerocnt);
+	v4l2_dbg(2, debug, sd, "tclk_trailcnt %u\n",
+		 csi_setting->tclk_trailcnt);
+	v4l2_dbg(2, debug, sd, "ths_preparecnt %u\n",
+		 csi_setting->ths_preparecnt);
+	v4l2_dbg(2, debug, sd, "ths_zerocnt %u\n", csi_setting->ths_zerocnt);
+	v4l2_dbg(2, debug, sd, "twakeupcnt %u\n", csi_setting->twakeupcnt);
+	v4l2_dbg(2, debug, sd, "tclk_postcnt %u\n", csi_setting->tclk_postcnt);
+	v4l2_dbg(2, debug, sd, "ths_trailcnt %u\n", csi_setting->ths_trailcnt);
+	v4l2_dbg(2, debug, sd, "csi_hs_lp_hs_ps %u (%u us)\n",
+		csi_setting->csi_hs_lp_hs_ps,
+		csi_setting->csi_hs_lp_hs_ps / 1000);
+}
+
+static void
+tc358746_dump_pll(struct v4l2_subdev *sd, struct tc358746_state *state)
+{
+	v4l2_dbg(2, debug, sd, "refclk %lu Hz\n", clk_get_rate(state->refclk));
+	v4l2_dbg(2, debug, sd, "pll input clock %u Hz\n", state->pllinclk_hz);
+	v4l2_dbg(2, debug, sd, "PLL_PRD %u\n", state->pll_prd - 1);
+	v4l2_dbg(2, debug, sd, "PLL_FBD %u\n", state->pll_fbd - 1);
+}
+
+static inline struct tc358746_state *to_state(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct tc358746_state, sd);
+}
+
+/* Find a data format by a pixel code */
+static int tc358746_format_supported(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(tc358746_formats); i++)
+		if (tc358746_formats[i].code == code)
+			return 0;
+
+	return -EINVAL;
+}
+
+static struct tc358746_csi_param *
+tc358746_g_cur_csi_settings(struct tc358746_state *state)
+{
+	unsigned int cur_freq = v4l2_ctrl_g_ctrl(state->link_freq);
+
+	return &state->link_freq_settings[cur_freq];
+}
+
+static const struct tc358746_mbus_fmt *tc358746_get_format(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(tc358746_formats); i++)
+		if (tc358746_formats[i].code == code)
+			return &tc358746_formats[i];
+
+	return NULL;
+}
+
+static int
+tc358746_adjust_fifo_size(struct tc358746_state *state,
+			  const struct tc358746_mbus_fmt *format,
+			  struct tc358746_csi_param *csi_settings,
+			  unsigned int width, u16 *fifo_size)
+{
+	int c_hactive_ps_diff, c_lp_active_ps_diff, c_fifo_delay_ps_diff;
+	unsigned int p_hactive_ps, p_hblank_ps, p_htotal_ps;
+	unsigned int c_hactive_ps, c_lp_active_ps, c_fifo_delay_ps;
+	unsigned int csi_bps, csi_bps_period_ps;
+	unsigned int csi_hsclk, csi_hsclk_period_ps;
+	unsigned int pclk_period_ps;
+	unsigned int _fifo_size;
+
+	pclk_period_ps = 1000000000 / (state->pclk / 1000);
+	csi_bps = csi_settings->speed_per_lane * csi_settings->lane_num;
+	csi_bps_period_ps = 1000000000 / (csi_bps / 1000);
+	csi_hsclk = csi_settings->speed_per_lane >> 3;
+	csi_hsclk_period_ps = 1000000000 / (csi_hsclk / 1000);
+
+	/*
+	 * Calculation:
+	 * p_hactive_ps = pclk_period_ps * pclk_per_pixel * h_active_pixel
+	 */
+	p_hactive_ps = pclk_period_ps * format->ppp * width;
+
+	/*
+	 * Calculation:
+	 * p_hblank_ps = pclk_period_ps * h_blank_pixel
+	 */
+	p_hblank_ps = pclk_period_ps * state->hblank;
+	p_htotal_ps = p_hblank_ps + p_hactive_ps;
+
+	/*
+	 * Adjust the fifo size to adjust the csi timing. Hopefully we can find
+	 * a fifo size where the parallel input timings and the csi tx timings
+	 * fit together.
+	 */
+	for (_fifo_size = 1; _fifo_size < TC358746_MAX_FIFO_SIZE;
+	     _fifo_size++) {
+		/*
+		 * Calculation:
+		 * c_fifo_delay_ps = (fifo_size * 32) / parallel_bus_width *
+		 *		     pclk_period_ps + 4 * csi_hsclk_period_ps
+		 */
+		c_fifo_delay_ps = _fifo_size * 32 * pclk_period_ps;
+		c_fifo_delay_ps /= format->bus_width;
+		c_fifo_delay_ps += 4 * csi_hsclk_period_ps;
+
+		/*
+		 * Calculation:
+		 * c_hactive_ps = csi_bps_period_ps * image_bpp * h_active_pixel
+		 *		  + c_fifo_delay
+		 */
+		c_hactive_ps = csi_bps_period_ps * format->bpp * width;
+		c_hactive_ps += c_fifo_delay_ps;
+
+		/*
+		 * Calculation:
+		 * c_lp_active_ps = p_htotal_ps - c_hactive_ps
+		 */
+		c_lp_active_ps = p_htotal_ps - c_hactive_ps;
+
+		c_hactive_ps_diff = c_hactive_ps - p_hactive_ps;
+		c_fifo_delay_ps_diff = p_htotal_ps - c_hactive_ps;
+		c_lp_active_ps_diff =
+			c_lp_active_ps - csi_settings->csi_hs_lp_hs_ps;
+
+		if (c_hactive_ps_diff > 0 &&
+		    c_fifo_delay_ps_diff > 0 &&
+		    c_lp_active_ps_diff > 0)
+			break;
+	}
+
+	/*
+	 * If we can't transfer the image using this csi link frequency try to
+	 * use another link freq.
+	 */
+	v4l2_dbg(1, debug, &state->sd, "found fifo-size %d\n",
+		 _fifo_size == TC358746_MAX_FIFO_SIZE ? -1 : _fifo_size);
+	*fifo_size = _fifo_size;
+	return _fifo_size == TC358746_MAX_FIFO_SIZE ? -EINVAL : 0;
+}
+
+static int
+tc358746_adjust_timings(struct tc358746_state *state,
+			const struct tc358746_mbus_fmt *format,
+			unsigned int *width, u16 *fifo_size)
+{
+
+	unsigned int cur_freq = v4l2_ctrl_g_ctrl(state->link_freq);
+	unsigned int freq = cur_freq;
+	struct tc358746_csi_param *csi_lane_setting;
+	int err;
+	int _width;
+
+	/*
+	 * Adjust timing:
+	 * 1) Try to use the desired width and the current csi-link-frequency
+	 * 2) If this doesn't fit try other csi-link-frequencies
+	 * 3) If this doesn't fit too, reducing the desired width and test
+	 *    it again width the current csi-link-frequency
+	 * 4) Goto step 2 if it doesn't fit at all
+	 */
+	for (_width = *width; _width > 0; _width -= 10) {
+		csi_lane_setting = &state->link_freq_settings[cur_freq];
+		err = tc358746_adjust_fifo_size(state, format, csi_lane_setting,
+						_width, fifo_size);
+		if (!err)
+			goto out;
+
+		for (freq = 0; freq < state->link_frequencies_num; freq++) {
+			if (freq == cur_freq)
+				continue;
+
+			csi_lane_setting = &state->link_freq_settings[freq];
+			err = tc358746_adjust_fifo_size(state, format,
+							csi_lane_setting,
+							_width, fifo_size);
+			if (!err)
+				goto out;
+		}
+	}
+
+out:
+	*width = _width;
+	return freq;
+}
+
+static int
+tc358746_calculate_csi_txtimings(struct tc358746_state *state,
+				 struct tc358746_csi_param *csi_setting)
+{
+	unsigned int spl;
+	unsigned int spl_p_ps, hsclk_p_ps, hfclk_p_ns;
+	unsigned int hfclk, hsclk; /* SYSCLK */
+	unsigned int tmp;
+	unsigned int lptxtime_ps, tclk_post_ps, tclk_trail_ps, tclk_zero_ps,
+		     ths_trail_ps, ths_zero_ps;
+
+	spl = csi_setting->speed_per_lane;
+	hsclk = spl >> 3; /* spl in bit-per-second, hsclk in byte-per-sercond */
+	hfclk = hsclk >> 1; /* HFCLK = SYSCLK / 2 */
+
+	if (hsclk > 125000000U) {
+		v4l2_err(&state->sd, "unsupported HS byte clock %d, must <= 125 MHz\n",
+			hsclk);
+		return -EINVAL;
+	}
+
+	hfclk_p_ns = DIV_ROUND_CLOSEST(1000000000, hfclk);
+	hsclk_p_ps = 1000000000 / (hsclk / 1000);
+	spl_p_ps   = 1000000000 / (spl / 1000);
+
+	/*
+	 * Calculation:
+	 * hfclk_p_ns * lineinitcnt > 100us
+	 * lineinitcnt > 100 * 10^-6s / hfclk_p_ns * 10^-9
+	 *
+	 */
+	csi_setting->lineinitcnt = DIV_ROUND_UP(TC358746_LINEINIT_MIN_US * 1000,
+					  hfclk_p_ns);
+
+	/*
+	 * Calculation:
+	 * (lptxtimecnt + 1) * hsclk_p_ps > 50ns
+	 * 38ns < (tclk_preparecnt + 1) * hsclk_p_ps < 95ns
+	 */
+	csi_setting->lptxtimecnt = csi_setting->tclk_preparecnt =
+		DIV_ROUND_UP(TC358746_LPTXTIME_MIN_NS * 1000, hsclk_p_ps) - 1;
+
+	/*
+	 * Limit:
+	 * (tclk_zero + tclk_prepar) period > 300ns.
+	 * Since we have no upper limit and for simplicity:
+	 * tclk_zero > 300ns.
+	 *
+	 * Calculation:
+	 * tclk_zero = ([2,3] + tclk_zerocnt) * hsclk_p_ps + ([2,3] * spl_p_ps)
+	 *
+	 * Note: REF_02 uses
+	 * tclk_zero = (2.5 + tclk_zerocnt) * hsclk_p_ps + (3.5 * spl_p_ps)
+	 */
+	tmp = TC358746_TCLKZERO_MIN_NS * 1000 - 3 * spl_p_ps;
+	tmp = DIV_ROUND_UP(tmp, hsclk_p_ps);
+	csi_setting->tclk_zerocnt = tmp - 2;
+
+	/*
+	 * Limit:
+	 * 40ns + 4 * spl_p_ps < (ths_preparecnt + 1) * hsclk_p_ps
+	 *		       < 85ns + 6 * spl_p_ps
+	 */
+	tmp = TC358746_THSPREPARE_MIN_NS * 1000 + 4 * spl_p_ps;
+	tmp = DIV_ROUND_UP(tmp, hsclk_p_ps);
+	csi_setting->ths_preparecnt = tmp - 1;
+
+	/*
+	 * Limit:
+	 * (ths_zero + ths_prepare) period > 145ns + 10 * spl_p_ps.
+	 * Since we have no upper limit and for simplicity:
+	 * ths_zero period > 145ns + 10 * spl_p_ps.
+	 *
+	 * Calculation:
+	 * ths_zero = ([6,8] + ths_zerocnt) * hsclk_p_ps + [3,4] * hsclk_p_ps +
+	 *	      [13,14] * spl_p_ps
+	 *
+	 * Note: REF_02 uses
+	 * ths_zero = (7 + ths_zerocnt) * hsclk_p_ps + 4 * hsclk_p_ps +
+	 *	      11 * spl_p_ps
+	 */
+	tmp = TC358746_THSZERO_MIN_NS * 1000 - spl_p_ps;
+	tmp = DIV_ROUND_UP(tmp, hsclk_p_ps);
+	csi_setting->ths_zerocnt = tmp < 11 ? 0 : tmp - 11;
+
+	/*
+	 * Limit:
+	 * hsclk_p_ps * (lptxtimecnt + 1) * (twakeupcnt + 1) > 1ms
+	 *
+	 * Since we have no upper limit use 1.2ms as lower limit to
+	 * surley meet the spec limit.
+	 */
+	tmp = hsclk_p_ps / 1000; /* tmp = hsclk_p_ns */
+	csi_setting->twakeupcnt =
+		DIV_ROUND_UP(TC358746_TWAKEUP_MIN_US * 1000,
+			     tmp * (csi_setting->lptxtimecnt + 1)) - 1;
+
+	/*
+	 * Limit:
+	 * 60ns + 4 * spl_p_ps < thstrail < 105ns + 12 * spl_p_ps
+	 *
+	 * Calculation:
+	 * thstrail = (1 + ths_trailcnt) * hsclk_p_ps + [3,4] * hsclk_p_ps -
+	 *	      [13,14] * spl_p_ps
+	 *
+	 * [2] set formula to:
+	 * thstrail = (1 + ths_trailcnt) * hsclk_p_ps + 4 * hsclk_p_ps -
+	 *	      11 * spl_p_ps
+	 */
+	tmp = TC358746_THSTRAIL_MIN_NS * 1000 + 15 * spl_p_ps;
+	tmp = DIV_ROUND_UP(tmp, hsclk_p_ps);
+	csi_setting->ths_trailcnt = tmp - 5;
+
+	/*
+	 * Limit:
+	 * 60ns < tclk_trail < 105ns + 12 * spl_p_ps
+	 *
+	 * Limit used by REF_02:
+	 * 60ns < tclk_trail < 105ns + 12 * spl_p_ps - 30
+	 *
+	 * Calculation:
+	 * tclk_trail = ([1,2] + tclk_trailcnt) * hsclk_p_ps +
+	 *		(2 + [1,2]) * hsclk_p_ps - [2,3] * spl_p_ps
+	 *
+	 * Calculation used by REF_02:
+	 * tclk_trail = (1 + tclk_trailcnt) * hsclk_p_ps +
+	 *		4 * hsclk_p_ps - 3 * spl_p_ps
+	 */
+	tmp = TC358746_TCLKTRAIL_MIN_NS * 1000 + 3 * spl_p_ps;
+	tmp = DIV_ROUND_UP(tmp, hsclk_p_ps);
+	csi_setting->tclk_trailcnt = tmp < 5 ? 0 : tmp - 5;
+
+	/*
+	 * Limit:
+	 * tclk_post > 60ns + 52 * spl_p_ps
+	 *
+	 * Limit used by REF_02:
+	 * tclk_post > 60ns + 52 * spl_p_ps
+	 *
+	 * Calculation:
+	 * tclk_post = ([1,2] + (tclk_postcnt + 1)) * hsclk_p_ps + hsclk_p_ps
+	 *
+	 * Note REF_02 uses:
+	 * tclk_post = (2.5 + tclk_postcnt) * hsclk_p_ps + hsclk_p_ps +
+	 *		2.5 * spl_p_ps
+	 * To meet the REF_02 validation limits following equation is used:
+	 * tclk_post = (2 + tclk_postcnt) * hsclk_p_ps + hsclk_p_ps +
+	 *		3 * spl_p_ps
+	 */
+	tmp = TC358746_TCLKPOST_MIN_NS * 1000 + 49 * spl_p_ps;
+	tmp = DIV_ROUND_UP(tmp, hsclk_p_ps);
+	csi_setting->tclk_postcnt = tmp - 3;
+
+	/*
+	 * Last calculate the csi hs->lp->hs transistion time in ns. Note REF_02
+	 * mixed units in the equation for the continuous case. I don't know if
+	 * this was the intention. The driver drops the last 'multiply all by
+	 * two' to get nearly the same results.
+	 */
+	lptxtime_ps = (csi_setting->lptxtimecnt + 1) * hsclk_p_ps;
+	tclk_post_ps =
+		(4 + csi_setting->tclk_postcnt) * hsclk_p_ps + 3 * spl_p_ps;
+	tclk_trail_ps =
+		(5 + csi_setting->tclk_trailcnt) * hsclk_p_ps - 3 * spl_p_ps;
+	tclk_zero_ps =
+		(2 + csi_setting->tclk_zerocnt) * hsclk_p_ps + 3 * spl_p_ps;
+	ths_trail_ps =
+		(5 + csi_setting->ths_trailcnt) * hsclk_p_ps - 11 * spl_p_ps;
+	ths_zero_ps =
+		(7 + csi_setting->ths_zerocnt) * hsclk_p_ps + 4 * hsclk_p_ps +
+		11 * spl_p_ps;
+
+	if (csi_setting->is_continuous_clk) {
+		tmp = 2 * lptxtime_ps;
+		tmp += 25 * hsclk_p_ps;
+		tmp += ths_trail_ps;
+		tmp += ths_zero_ps;
+	} else {
+		tmp = 4 * lptxtime_ps;
+		tmp += ths_trail_ps + tclk_post_ps + tclk_trail_ps +
+			tclk_zero_ps + ths_zero_ps;
+		tmp += (13 + csi_setting->lptxtimecnt * 8) * hsclk_p_ps;
+		tmp += 22 * hsclk_p_ps;
+		tmp *= 3;
+		tmp = DIV_ROUND_CLOSEST(tmp, 2);
+	}
+	csi_setting->csi_hs_lp_hs_ps = tmp;
+
+	return 0;
+}
+
+/* --------------- i2c helper ------------ */
+
+static void i2c_rd(struct v4l2_subdev *sd, u16 reg, u8 *values, u32 n)
+{
+	struct tc358746_state *state = to_state(sd);
+	struct i2c_client *client = state->i2c_client;
+	int err;
+	u8 buf[2] = { reg >> 8, reg & 0xff };
+	u8 data[I2C_MAX_XFER_SIZE];
+
+	struct i2c_msg msgs[] = {
+		{
+			.addr = client->addr,
+			.flags = 0,
+			.len = 2,
+			.buf = buf,
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = n,
+			.buf = data,
+		},
+	};
+
+	err = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (err != ARRAY_SIZE(msgs)) {
+		v4l2_err(sd, "%s: reading register 0x%x from 0x%x failed\n",
+			 __func__, reg, client->addr);
+	}
+
+	switch (n) {
+	case 1:
+		values[0] = data[0];
+		break;
+	case 2:
+		values[0] = data[1];
+		values[1] = data[0];
+		break;
+	case 4:
+		values[0] = data[1];
+		values[1] = data[0];
+		values[2] = data[3];
+		values[3] = data[2];
+		break;
+	default:
+		v4l2_info(sd, "unsupported I2C read %d bytes from address 0x%04x\n",
+			  n, reg);
+	}
+
+	if (debug < 3)
+		return;
+
+	switch (n) {
+	case 1:
+		v4l2_info(sd, "I2C read 0x%04x = 0x%02x",
+			  reg, data[0]);
+		break;
+	case 2:
+		v4l2_info(sd, "I2C read 0x%04x = 0x%02x%02x",
+			  reg, data[0], data[1]);
+		break;
+	case 4:
+		v4l2_info(sd, "I2C read 0x%04x = 0x%02x%02x%02x%02x",
+			  reg, data[2], data[3], data[0], data[1]);
+		break;
+	default:
+		v4l2_info(sd, "I2C unsupported read %d bytes from address 0x%04x\n",
+			  n, reg);
+	}
+}
+
+static void i2c_wr(struct v4l2_subdev *sd, u16 reg, u8 *values, u32 n)
+{
+	struct tc358746_state *state = to_state(sd);
+	struct i2c_client *client = state->i2c_client;
+	int err;
+	struct i2c_msg msg;
+	u8 data[I2C_MAX_XFER_SIZE];
+
+	if ((2 + n) > I2C_MAX_XFER_SIZE) {
+		n = I2C_MAX_XFER_SIZE - 2;
+		v4l2_warn(sd, "i2c wr reg=%04x: len=%d is too big!\n",
+			  reg, 2 + n);
+	}
+
+	msg.addr = client->addr;
+	msg.buf = data;
+	msg.len = 2 + n;
+	msg.flags = 0;
+
+	data[0] = reg >> 8;
+	data[1] = reg & 0xff;
+
+	switch (n) {
+	case 1:
+		data[2 + 0] = values[0];
+		break;
+	case 2:
+		data[2 + 0] = values[1];
+		data[2 + 1] = values[0];
+		break;
+	case 4:
+		data[2 + 0] = values[1];
+		data[2 + 1] = values[0];
+		data[2 + 2] = values[3];
+		data[2 + 3] = values[2];
+		break;
+	default:
+		v4l2_info(sd, "unsupported I2C write %d bytes from address 0x%04x\n",
+			  n, reg);
+	}
+
+	err = i2c_transfer(client->adapter, &msg, 1);
+	if (err != 1) {
+		v4l2_err(sd, "%s: writing register 0x%x from 0x%x failed\n",
+			 __func__, reg, client->addr);
+		return;
+	}
+
+	if (debug < 3)
+		return;
+
+	switch (n) {
+	case 1:
+		v4l2_info(sd, "I2C write 0x%04x = 0x%02x", reg, data[2 + 0]);
+		break;
+	case 2:
+		v4l2_info(sd, "I2C write 0x%04x = 0x%02x%02x", reg, data[2 + 0],
+			  data[2 + 1]);
+		break;
+	case 4:
+		v4l2_info(sd, "I2C write 0x%04x = 0x%02x%02x%02x%02x", reg,
+			  data[2 + 2], data[2 + 3], data[2 + 0], data[2 + 1]);
+		break;
+	default:
+		v4l2_info(sd, "I2C unsupported write %d bytes from address 0x%04x\n",
+			  n, reg);
+	}
+}
+
+static noinline u32 i2c_rdreg(struct v4l2_subdev *sd, u16 reg, u32 n)
+{
+	__le32 val = 0;
+
+	i2c_rd(sd, reg, (u8 __force *)&val, n);
+
+	return le32_to_cpu(val);
+}
+
+static noinline void i2c_wrreg(struct v4l2_subdev *sd, u16 reg, u32 val, u32 n)
+{
+	__le32 raw = cpu_to_le32(val);
+
+	i2c_wr(sd, reg, (u8 __force *)&raw, n);
+}
+
+static u16 __maybe_unused i2c_rd8(struct v4l2_subdev *sd, u16 reg)
+{
+	return i2c_rdreg(sd, reg, 1);
+}
+
+static u16 __maybe_unused i2c_rd16(struct v4l2_subdev *sd, u16 reg)
+{
+	return i2c_rdreg(sd, reg, 2);
+}
+
+static u32 __maybe_unused i2c_rd32(struct v4l2_subdev *sd, u16 reg)
+{
+	return i2c_rdreg(sd, reg, 4);
+}
+
+static void __maybe_unused i2c_wr8(struct v4l2_subdev *sd, u16 reg, u16 val)
+{
+	i2c_wrreg(sd, reg, val, 1);
+}
+
+static void i2c_wr16(struct v4l2_subdev *sd, u16 reg, u16 val)
+{
+	i2c_wrreg(sd, reg, val, 2);
+}
+
+static void i2c_wr16_and_or(struct v4l2_subdev *sd, u16 reg, u32 mask, u16 val)
+{
+	u16 m = (u16) ~mask;
+
+	i2c_wrreg(sd, reg, (i2c_rd16(sd, reg) & m) | val, 2);
+}
+
+static void i2c_wr32(struct v4l2_subdev *sd, u16 reg, u32 val)
+{
+	i2c_wrreg(sd, reg, val, 4);
+}
+
+/* --------------- init --------------- */
+
+static void
+tc358746_wr_csi_control(struct v4l2_subdev *sd, int val)
+{
+	u32 _val;
+
+	val &= CSI_CONFW_DATA_MASK;
+	_val = CSI_CONFW_MODE_SET_MASK | CSI_CONFW_ADDRESS_CSI_CONTROL_MASK |
+		val;
+
+	v4l2_dbg(2, debug, sd, "CSI_CONFW 0x%04x\n", _val);
+	i2c_wr32(sd, CSI_CONFW, _val);
+}
+
+static inline void tc358746_sleep_mode(struct v4l2_subdev *sd, int enable)
+{
+	i2c_wr16_and_or(sd, SYSCTL, SYSCTL_SLEEP_MASK,
+			enable ? SYSCTL_SLEEP_MASK : 0);
+}
+
+static inline void tc358746_sreset(struct v4l2_subdev *sd)
+{
+	i2c_wr16(sd, SYSCTL, SYSCTL_SRESET_MASK);
+	udelay(10);
+	i2c_wr16(sd, SYSCTL, 0);
+}
+
+static inline void tc358746_enable_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct tc358746_state *state = to_state(sd);
+
+	v4l2_dbg(1, debug, sd, "%sable\n", enable ? "en" : "dis");
+
+	mutex_lock(&state->confctl_mutex);
+	if (!enable) {
+		i2c_wr16_and_or(sd, PP_MISC, PP_MISC_FRMSTOP_MASK,
+				PP_MISC_FRMSTOP_MASK);
+		i2c_wr16_and_or(sd, CONFCTL, CONFCTL_PPEN_MASK, 0);
+		i2c_wr16_and_or(sd, PP_MISC, PP_MISC_RSTPTR_MASK,
+				PP_MISC_RSTPTR_MASK);
+
+		i2c_wr32(sd, CSIRESET, (CSIRESET_RESET_CNF_MASK |
+					CSIRESET_RESET_MODULE_MASK));
+		i2c_wr16(sd, DBG_ACT_LINE_CNT, 0);
+	} else {
+		i2c_wr16(sd, PP_MISC, 0);
+		i2c_wr16_and_or(sd, CONFCTL, CONFCTL_PPEN_MASK,
+				CONFCTL_PPEN_MASK);
+	}
+	mutex_unlock(&state->confctl_mutex);
+}
+
+static void tc358746_set_pll(struct v4l2_subdev *sd)
+{
+	struct tc358746_state *state = to_state(sd);
+	struct tc358746_csi_param *csi_setting =
+		tc358746_g_cur_csi_settings(state);
+	u16 pllctl0 = i2c_rd16(sd, PLLCTL0);
+	u16 pllctl1 = i2c_rd16(sd, PLLCTL1);
+	u16 pll_frs = csi_setting->speed_range;
+	u16 pllctl0_new;
+
+	/*
+	 * Calculation:
+	 * speed_per_lane = (pllinclk_hz * (fbd + 1)) / 2^frs
+	 *
+	 * Calculation used by REF_02:
+	 * speed_per_lane = (pllinclk_hz * fbd) / 2^frs
+	 */
+	state->pll_fbd = csi_setting->speed_per_lane / state->pllinclk_hz;
+	state->pll_fbd <<= pll_frs;
+
+	pllctl0_new = PLLCTL0_PLL_PRD_SET(state->pll_prd) |
+		      PLLCTL0_PLL_FBD_SET(state->pll_fbd);
+
+	/*
+	 * Only rewrite when needed (new value or disabled), since rewriting
+	 * triggers another format change event.
+	 */
+	if ((pllctl0 != pllctl0_new) ||
+	    ((pllctl1 & PLLCTL1_PLL_EN_MASK) == 0)) {
+		u16 pllctl1_mask = PLLCTL1_PLL_FRS_MASK | PLLCTL1_RESETB_MASK |
+				   PLLCTL1_PLL_EN_MASK;
+		u16 pllctl1_val = PLLCTL1_PLL_FRS_SET(pll_frs) |
+				  PLLCTL1_RESETB_MASK | PLLCTL1_PLL_EN_MASK;
+
+		v4l2_dbg(1, debug, sd, "Updating PLL clock\n");
+		i2c_wr16(sd, PLLCTL0, pllctl0_new);
+		i2c_wr16_and_or(sd, PLLCTL1, pllctl1_mask, pllctl1_val);
+		udelay(1000);
+		i2c_wr16_and_or(sd, PLLCTL1, PLLCTL1_CKEN_MASK,
+				PLLCTL1_CKEN_MASK);
+	}
+
+	tc358746_dump_pll(sd, state);
+}
+
+static void tc358746_set_csi_color_space(struct v4l2_subdev *sd)
+{
+	struct tc358746_state *state = to_state(sd);
+	const struct tc358746_mbus_fmt *tc358746_fmt =
+		tc358746_get_format(state->fmt.code);
+
+	/* currently no self defined csi user data type id's are supported */
+	mutex_lock(&state->confctl_mutex);
+	i2c_wr16_and_or(sd, DATAFMT,
+			(DATAFMT_PDFMT_MASK | DATAFMT_UDT_EN_MASK),
+			DATAFMT_PDFMT_SET(tc358746_fmt->pdformat));
+	i2c_wr16_and_or(sd, CONFCTL, CONFCTL_PDATAF_MASK,
+			CONFCTL_PDATAF_SET(tc358746_fmt->pdataf));
+	mutex_unlock(&state->confctl_mutex);
+}
+
+static void tc38764_debug_pattern_80(struct v4l2_subdev *sd)
+{
+	unsigned int i;
+
+	i2c_wr16(sd, DBG_ACT_LINE_CNT, 0x8000);
+	i2c_wr16(sd, DBG_LINE_WIDTH, 0x0396);
+	i2c_wr16(sd, DBG_VERT_BLANK_LINE_CNT, 0x0000);
+
+	for (i = 0; i < 80; i++)
+		i2c_wr16(sd, DBG_VIDEO_DATA, 0xff7f);
+	i2c_wr16(sd, DBG_VIDEO_DATA, 0xff00);
+	for (i = 0; i < 40; i++)
+		i2c_wr16(sd, DBG_VIDEO_DATA, 0xffff);
+	i2c_wr16(sd, DBG_VIDEO_DATA, 0xc0ff);
+	for (i = 0; i < 40; i++)
+		i2c_wr16(sd, DBG_VIDEO_DATA, 0xc000);
+	for (i = 0; i < 80; i++)
+		i2c_wr16(sd, DBG_VIDEO_DATA, 0x7f00);
+	for (i = 0; i < 80; i++)
+		i2c_wr16(sd, DBG_VIDEO_DATA, 0x7fff);
+	i2c_wr16(sd, DBG_VIDEO_DATA, 0x0000);
+	for (i = 0; i < 40; i++)
+		i2c_wr16(sd, DBG_VIDEO_DATA, 0x00ff);
+	i2c_wr16(sd, DBG_VIDEO_DATA, 0x00ff);
+	for (i = 0; i < 40; i++)
+		i2c_wr16(sd, DBG_VIDEO_DATA, 0x0000);
+	i2c_wr16(sd, DBG_VIDEO_DATA, 0x007f);
+
+	i2c_wr16(sd, DBG_ACT_LINE_CNT, 0xC1DF);
+}
+
+static void tc358746_enable_csi_lanes(struct v4l2_subdev *sd, int enable)
+{
+	struct tc358746_state *state = to_state(sd);
+	struct tc358746_csi_param *csi_setting =
+		tc358746_g_cur_csi_settings(state);
+	unsigned int lanes = csi_setting->lane_num;
+	u32 val = 0;
+
+	if (lanes < 1 || !enable)
+		i2c_wr32(sd, CLW_CNTRL, CLW_CNTRL_CLW_LANEDISABLE_MASK);
+	if (lanes < 1 || !enable)
+		i2c_wr32(sd, D0W_CNTRL, D0W_CNTRL_D0W_LANEDISABLE_MASK);
+	if (lanes < 2 || !enable)
+		i2c_wr32(sd, D1W_CNTRL, D1W_CNTRL_D1W_LANEDISABLE_MASK);
+	if (lanes < 3 || !enable)
+		i2c_wr32(sd, D2W_CNTRL, D2W_CNTRL_D2W_LANEDISABLE_MASK);
+	if (lanes < 4 || !enable)
+		i2c_wr32(sd, D3W_CNTRL, D2W_CNTRL_D3W_LANEDISABLE_MASK);
+
+	if (lanes > 0 && enable)
+		val |= HSTXVREGEN_CLM_HSTXVREGEN_MASK |
+			HSTXVREGEN_D0M_HSTXVREGEN_MASK;
+	if (lanes > 1 && enable)
+		val |= HSTXVREGEN_D1M_HSTXVREGEN_MASK;
+	if (lanes > 2 && enable)
+		val |= HSTXVREGEN_D2M_HSTXVREGEN_MASK;
+	if (lanes > 3 && enable)
+		val |= HSTXVREGEN_D3M_HSTXVREGEN_MASK;
+
+	i2c_wr32(sd, HSTXVREGEN, val);
+}
+
+static void tc358746_set_csi(struct v4l2_subdev *sd)
+{
+	struct tc358746_state *state = to_state(sd);
+	struct tc358746_csi_param *csi_setting =
+		tc358746_g_cur_csi_settings(state);
+	bool en_continuous_clk = csi_setting->is_continuous_clk;
+	u32 val;
+
+	val = TCLK_HEADERCNT_TCLK_ZEROCNT_SET(csi_setting->tclk_zerocnt) |
+	      TCLK_HEADERCNT_TCLK_PREPARECNT_SET(csi_setting->tclk_preparecnt);
+	i2c_wr32(sd, TCLK_HEADERCNT, val);
+	val = THS_HEADERCNT_THS_ZEROCNT_SET(csi_setting->ths_zerocnt) |
+	      THS_HEADERCNT_THS_PREPARECNT_SET(csi_setting->ths_preparecnt);
+	i2c_wr32(sd, THS_HEADERCNT, val);
+	i2c_wr32(sd, TWAKEUP, csi_setting->twakeupcnt);
+	i2c_wr32(sd, TCLK_POSTCNT, csi_setting->tclk_postcnt);
+	i2c_wr32(sd, THS_TRAILCNT, csi_setting->ths_trailcnt);
+	i2c_wr32(sd, LINEINITCNT, csi_setting->lineinitcnt);
+	i2c_wr32(sd, LPTXTIMECNT, csi_setting->lptxtimecnt);
+	i2c_wr32(sd, TCLK_TRAILCNT, csi_setting->tclk_trailcnt);
+	i2c_wr32(sd, TXOPTIONCNTRL,
+		 en_continuous_clk ? TXOPTIONCNTRL_CONTCLKMODE_MASK : 0);
+
+	if (state->test)
+		tc38764_debug_pattern_80(sd);
+
+	tc358746_dump_csi(sd, csi_setting);
+}
+
+static void tc358746_enable_csi_module(struct v4l2_subdev *sd, int enable)
+{
+	struct tc358746_state *state = to_state(sd);
+	struct tc358746_csi_param *csi_setting =
+		tc358746_g_cur_csi_settings(state);
+	unsigned int lanes = csi_setting->lane_num;
+	u32 val;
+
+	if (!enable)
+		return;
+
+	i2c_wr32(sd, STARTCNTRL, STARTCNTRL_START_MASK);
+	i2c_wr32(sd, CSI_START, CSI_START_STRT_MASK);
+
+	val = CSI_CONTROL_NOL_1_MASK;
+	if (lanes == 2)
+		val = CSI_CONTROL_NOL_2_MASK;
+	else if (lanes == 3)
+		val = CSI_CONTROL_NOL_3_MASK;
+	else if (lanes == 4)
+		val = CSI_CONTROL_NOL_4_MASK;
+
+	val |= CSI_CONTROL_CSI_MODE_MASK | CSI_CONTROL_TXHSMD_MASK;
+	tc358746_wr_csi_control(sd, val);
+}
+
+static void tc358746_set_buffers(struct v4l2_subdev *sd)
+{
+	struct tc358746_state *state = to_state(sd);
+	const struct tc358746_mbus_fmt *tc358746_mbusfmt =
+		tc358746_get_format(state->fmt.code);
+	unsigned int byte_per_line =
+		(state->fmt.width * tc358746_mbusfmt->bpp) / 8;
+
+	i2c_wr16(sd, FIFOCTL, state->vb_fifo);
+	i2c_wr16(sd, WORDCNT, byte_per_line);
+	v4l2_dbg(1, debug, sd, "FIFOCTL 0x%02x: WORDCNT 0x%02x\n",
+		state->vb_fifo, byte_per_line);
+}
+
+/* --------------- CORE OPS --------------- */
+
+static int tc358746_log_status(struct v4l2_subdev *sd)
+{
+	struct tc358746_state *state = to_state(sd);
+	uint16_t sysctl = i2c_rd16(sd, SYSCTL);
+
+	v4l2_info(sd, "-----Chip status-----\n");
+	v4l2_info(sd, "Chip ID: 0x%02lx\n",
+		  (i2c_rd16(sd, CHIPID) & CHIPID_CHIPID_MASK) >> 8);
+	v4l2_info(sd, "Chip revision: 0x%02lx\n",
+		  i2c_rd16(sd, CHIPID) & CHIPID_REVID_MASK);
+	v4l2_info(sd, "Sleep mode: %s\n", sysctl & SYSCTL_SLEEP_MASK ?
+		  "on" : "off");
+
+	v4l2_info(sd, "-----CSI-TX status-----\n");
+	v4l2_info(sd, "Waiting for particular sync signal: %s\n",
+			(i2c_rd16(sd, CSI_STATUS) & CSI_STATUS_S_WSYNC_MASK) ?
+			"yes" : "no");
+	v4l2_info(sd, "Transmit mode: %s\n",
+			(i2c_rd16(sd, CSI_STATUS) & CSI_STATUS_S_TXACT_MASK) ?
+			"yes" : "no");
+	v4l2_info(sd, "Stopped: %s\n",
+			(i2c_rd16(sd, CSI_STATUS) & CSI_STATUS_S_HLT_MASK) ?
+			"yes" : "no");
+	v4l2_info(sd, "Color space: %s\n",
+			state->fmt.code == MEDIA_BUS_FMT_UYVY8_2X8 ?
+			"YCbCr 422 8-bit" : "Unsupported");
+
+	return 0;
+}
+
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+static void tc358746_print_register_map(struct v4l2_subdev *sd)
+{
+	v4l2_info(sd, "0x0000-0x0050: Global Register\n");
+	v4l2_info(sd, "0x0056-0x0070: Rx Control Registers\n");
+	v4l2_info(sd, "0x0080-0x00F8: Rx Status Registers\n");
+	v4l2_info(sd, "0x0100-0x0150: Tx D-PHY Register\n");
+	v4l2_info(sd, "0x0204-0x0238: Tx PPI Register\n");
+	v4l2_info(sd, "0x040c-0x0518: Tx Control Register\n");
+}
+
+static int tc358746_get_reg_size(u16 address)
+{
+	if (address <= 0x00ff)
+		return 2;
+	else if ((address >= 0x0100) && (address <= 0x05FF))
+		return 4;
+	else
+		return 1;
+}
+
+static int tc358746_g_register(struct v4l2_subdev *sd,
+			       struct v4l2_dbg_register *reg)
+{
+	if (reg->reg > 0xffff) {
+		tc358746_print_register_map(sd);
+		return -EINVAL;
+	}
+
+	reg->size = tc358746_get_reg_size(reg->reg);
+
+	reg->val = i2c_rdreg(sd, reg->reg, reg->size);
+
+	return 0;
+}
+
+static int tc358746_s_register(struct v4l2_subdev *sd,
+			       const struct v4l2_dbg_register *reg)
+{
+	if (reg->reg > 0xffff) {
+		tc358746_print_register_map(sd);
+		return -EINVAL;
+	}
+
+	i2c_wrreg(sd, (u16)reg->reg, reg->val,
+			tc358746_get_reg_size(reg->reg));
+
+	return 0;
+}
+#endif
+
+/* --------------- video ops --------------- */
+
+static int tc358746_s_power(struct v4l2_subdev *sd, int on)
+{
+	struct tc358746_state *state = to_state(sd);
+
+	/*
+	 * REF_01:
+	 * Softreset don't reset configuration registers content but is needed
+	 * during power-on to trigger a csi LP-11 state change and during
+	 * power-off to disable the csi-module.
+	 */
+	tc358746_sreset(sd);
+
+	if (state->fmt_changed) {
+		tc358746_set_buffers(sd);
+		tc358746_set_csi(sd);
+		tc358746_set_csi_color_space(sd);
+
+		/* as recommend in REF_01 */
+		tc358746_sleep_mode(sd, 1);
+		tc358746_set_pll(sd);
+		tc358746_sleep_mode(sd, 0);
+
+		state->fmt_changed = false;
+	}
+
+	tc358746_enable_csi_lanes(sd, on);
+	tc358746_enable_csi_module(sd, on);
+	tc358746_sleep_mode(sd, !on);
+
+	return 0;
+}
+
+static int tc358746_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	tc358746_enable_stream(sd, enable);
+
+	return 0;
+}
+
+/* --------------- pad ops --------------- */
+
+static int tc358746_enum_mbus_code(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(tc358746_formats))
+		return -EINVAL;
+
+	code->code = tc358746_formats[code->index].code;
+
+	return 0;
+}
+
+static struct v4l2_mbus_framefmt *
+__tc358746_get_pad_format(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  unsigned int pad, u32 which)
+{
+	struct tc358746_state *state = to_state(sd);
+
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_format(sd, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &state->fmt;
+	default:
+		return NULL;
+	}
+}
+
+static int tc358746_get_fmt(struct v4l2_subdev *sd,
+		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_format *format)
+{
+	struct tc358746_state *state = to_state(sd);
+
+	if (format->pad != 0 && format->pad != 1)
+		return -EINVAL;
+
+	format->format.code = state->fmt.code;
+	format->format.width = state->fmt.width;
+	format->format.height = state->fmt.height;
+	format->format.field = state->fmt.field;
+
+	return 0;
+}
+
+static int tc358746_set_fmt(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_format *format)
+{
+	struct tc358746_state *state = to_state(sd);
+	struct media_pad *pad = &state->pads[format->pad];
+	struct v4l2_mbus_framefmt *mbusformat;
+	const struct tc358746_mbus_fmt *tc358746_mbusformat;
+	unsigned int pclk, hblank;
+	unsigned int new_freq, cur_freq = v4l2_ctrl_g_ctrl(state->link_freq);
+	u16 vb_fifo;
+
+	if (pad->flags == MEDIA_PAD_FL_SOURCE)
+		return tc358746_get_fmt(sd, cfg, format);
+
+	mbusformat = __tc358746_get_pad_format(sd, cfg, format->pad,
+					       format->which);
+	if (!mbusformat)
+		return -EINVAL;
+
+	tc358746_mbusformat = tc358746_get_format(format->format.code);
+	if (!tc358746_mbusformat) {
+		format->format.code = tc358746_def_fmt.code;
+		tc358746_mbusformat = tc358746_get_format(format->format.code);
+	}
+
+	/*
+	 * Some sensors change their hblank and pclk value on different formats,
+	 * so we need to request it again.
+	 */
+	pclk = v4l2_ctrl_g_ctrl_int64(state->sensor_pclk_ctrl);
+	if (pclk != state->pclk) {
+		v4l2_dbg(1, debug, sd, "Update pclk %u -> %u\n",
+			 state->pclk, pclk);
+		state->pclk = pclk;
+	}
+
+	hblank = v4l2_ctrl_g_ctrl(state->sensor_hblank_ctrl);
+	if (hblank != state->hblank) {
+		v4l2_dbg(1, debug, sd, "Update hblank %u -> %u\n",
+			 state->hblank, hblank);
+		state->hblank = hblank;
+	}
+
+	/*
+	 * Normaly the HW has no size limitations but we have to check if the
+	 * csi timings are valid for this size. The timings can be adjust by the
+	 * fifo size. If this doesn't work we have to do this check again with a
+	 * other csi link frequency if it is possible.
+	 */
+	new_freq = tc358746_adjust_timings(state, tc358746_mbusformat,
+					   &format->format.width, &vb_fifo);
+
+	/* Currently only a few YUV based formats are supported */
+	if (tc358746_format_supported(format->format.code))
+		format->format.code = MEDIA_BUS_FMT_UYVY8_2X8;
+
+	/* Currently only non interleaved images are supported */
+	format->format.field = V4L2_FIELD_NONE;
+
+	*mbusformat = format->format;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		state->fmt_changed = true;
+		state->vb_fifo = vb_fifo;
+		if (new_freq != cur_freq)
+			v4l2_ctrl_s_ctrl(state->link_freq, new_freq);
+	}
+
+	return 0;
+}
+
+static int
+tc358746_link_validate(struct v4l2_subdev *sd, struct media_link *link,
+		       struct v4l2_subdev_format *source_fmt,
+		       struct v4l2_subdev_format *sink_fmt)
+{
+	struct tc358746_state *state = to_state(sd);
+	const struct tc358746_mbus_fmt *tc358746_mbusformat;
+	unsigned int pclk, pclk_old = state->pclk;
+	unsigned int hblank, hblank_old = state->hblank;
+	int new_freq;
+	u16 vb_fifo;
+
+	/*
+	 * Only validate if the timings are changed, after the link was already
+	 * initialized. This can be happen if the parallel sensor frame interval
+	 * is changed. Format checks are perfomed by the common code.
+	 */
+
+	tc358746_mbusformat = tc358746_get_format(sink_fmt->format.code);
+	if (!tc358746_mbusformat)
+		return -EINVAL; /* Format was changed too and is invalid */
+
+	pclk = v4l2_ctrl_g_ctrl_int64(state->sensor_pclk_ctrl);
+	if (pclk != state->pclk)
+		state->pclk = pclk;
+
+	hblank = v4l2_ctrl_g_ctrl(state->sensor_hblank_ctrl);
+	if (hblank != state->hblank)
+		state->hblank = hblank;
+
+	new_freq = tc358746_adjust_timings(state, tc358746_mbusformat,
+					   &source_fmt->format.width, &vb_fifo);
+
+	if (new_freq != v4l2_ctrl_g_ctrl(state->link_freq)) {
+		/*
+		 * This can lead into undefined behaviour, so we don't support
+		 * dynamic changes due to a to late re-configuration.
+		 */
+		state->pclk = pclk_old;
+		state->hblank = hblank_old;
+
+		return -EINVAL;
+	}
+
+	state->fmt_changed = true;
+	state->vb_fifo = vb_fifo;
+
+	return 0;
+}
+
+static int tc358764_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct tc358746_state *state = container_of(ctrl->handler,
+					       struct tc358746_state, hdl);
+	struct v4l2_subdev *sd = &state->sd;
+
+	switch (ctrl->id) {
+	case V4L2_CID_LINK_FREQ:
+		v4l2_info(sd, "Update link-frequency %llu -> %llu\n",
+			 state->link_frequencies[ctrl->cur.val],
+			 state->link_frequencies[ctrl->val]);
+
+		return 0;
+	case V4L2_CID_TEST_PATTERN:
+		state->test = ctrl->val;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int tc358746_link_setup(struct media_entity *entity,
+			       const struct media_pad *local,
+			       const struct media_pad *remote, u32 flags)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct v4l2_subdev *ps_sd = media_entity_to_v4l2_subdev(remote->entity);
+	struct tc358746_state *state = to_state(sd);
+	struct v4l2_ctrl *ctrl;
+
+	/* no special requirements on source pads */
+	if (local->flags & MEDIA_PAD_FL_SOURCE)
+		return 0;
+
+	v4l2_dbg(1, debug, sd, "link setup '%s':%d->'%s':%d[%d]",
+		remote->entity->name, remote->index, local->entity->name,
+		local->index, flags & MEDIA_LNK_FL_ENABLED);
+
+	/*
+	 * The remote parallel sensor must support pixel rate and hblank query
+	 */
+	ctrl = v4l2_ctrl_find(ps_sd->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (!ctrl) {
+		v4l2_err(sd, "Subdev %s must support V4L2_CID_PIXEL_RATE\n",
+			ps_sd->name);
+		return -EINVAL;
+	}
+	state->pclk = v4l2_ctrl_g_ctrl_int64(ctrl);
+	state->sensor_pclk_ctrl = ctrl;
+
+	ctrl = v4l2_ctrl_find(ps_sd->ctrl_handler, V4L2_CID_HBLANK);
+	if (!ctrl) {
+		v4l2_err(sd, "Subdev %s must support V4L2_CID_HBLANK\n",
+			ps_sd->name);
+		return -EINVAL;
+	}
+	state->hblank = v4l2_ctrl_g_ctrl(ctrl);
+	state->sensor_hblank_ctrl = ctrl;
+
+	return 0;
+}
+
+/* -------------------------------------------------------------------------- */
+
+static const struct v4l2_ctrl_ops tc358764_ctrl_ops = {
+	.s_ctrl = tc358764_s_ctrl,
+};
+
+static const struct v4l2_subdev_core_ops tc358746_core_ops = {
+	.log_status = tc358746_log_status,
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+	.g_register = tc358746_g_register,
+	.s_register = tc358746_s_register,
+#endif
+	.s_power = tc358746_s_power,
+};
+
+static const struct v4l2_subdev_video_ops tc358746_video_ops = {
+	.s_stream = tc358746_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops tc358746_pad_ops = {
+	.enum_mbus_code = tc358746_enum_mbus_code,
+	.set_fmt = tc358746_set_fmt,
+	.get_fmt = tc358746_get_fmt,
+	.link_validate = tc358746_link_validate,
+};
+
+static const struct v4l2_subdev_ops tc358746_ops = {
+	.core = &tc358746_core_ops,
+	.video = &tc358746_video_ops,
+	.pad = &tc358746_pad_ops,
+};
+
+static const struct media_entity_operations tc358746_entity_ops = {
+	.link_setup = &tc358746_link_setup,
+	.link_validate = &v4l2_subdev_link_validate,
+};
+
+/* --------------- PROBE / REMOVE --------------- */
+
+static int tc358746_set_lane_settings(struct tc358746_state *state,
+				      struct v4l2_fwnode_endpoint *fw)
+{
+	struct v4l2_subdev *sd = &state->sd;
+	int i;
+
+	for (i = 0; i < fw->nr_of_link_frequencies; i++) {
+		struct tc358746_csi_param *s =
+			&state->link_freq_settings[i];
+		u32 bps_pr_lane;
+
+		state->link_frequencies[i] = fw->link_frequencies[i];
+
+		/*
+		 * The CSI bps per lane must be between 62.5 Mbps and 1 Gbps.
+		 * bps_pr_lane = 2 * link_freq, because MIPI data lane is double
+		 * data rate.
+		 */
+		bps_pr_lane = 2 * fw->link_frequencies[i];
+		if (bps_pr_lane < 62500000U || bps_pr_lane > 1000000000U) {
+			v4l2_err(sd, "unsupported bps per lane: %u bps\n",
+				bps_pr_lane);
+			return -EINVAL;
+		}
+
+		if (bps_pr_lane > 500000000)
+			s->speed_range = 0;
+		else if (bps_pr_lane > 250000000)
+			s->speed_range = 1;
+		else if (bps_pr_lane > 125000000)
+			s->speed_range = 2;
+		else
+			s->speed_range = 3;
+
+		s->unit_clk_hz = state->pllinclk_hz >> s->speed_range;
+		s->unit_clk_mul = bps_pr_lane / s->unit_clk_hz;
+		s->speed_per_lane = bps_pr_lane;
+		s->lane_num = fw->bus.mipi_csi2.num_data_lanes;
+		s->is_continuous_clk = fw->bus.mipi_csi2.flags &
+			V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
+
+		if (s->speed_per_lane != 432000000U)
+			v4l2_warn(sd, "untested bps per lane: %u bps\n",
+				 s->speed_per_lane);
+
+		v4l2_dbg(2, debug, sd, "lane setting %d\n", i);
+		v4l2_dbg(2, debug, sd,
+			 "unit_clk %uHz: unit_clk_mul %u: speed_range %u: speed_per_lane(bps/lane) %u: csi_lange_numbers %u\n",
+			 s->unit_clk_hz, s->unit_clk_mul, s->speed_range,
+			 s->speed_per_lane, s->lane_num);
+	}
+
+	state->link_frequencies_num = fw->nr_of_link_frequencies;
+
+	return 0;
+}
+
+static void tc358746_gpio_reset(struct tc358746_state *state)
+{
+	usleep_range(5000, 10000);
+	gpiod_set_value(state->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value(state->reset_gpio, 0);
+	msleep(20);
+}
+
+static int tc358746_apply_fw(struct tc358746_state *state)
+{
+	struct v4l2_subdev *sd = &state->sd;
+	struct tc358746_csi_param *csi_setting;
+	int err, i;
+
+	for (i = 0; i < state->link_frequencies_num; i++) {
+		csi_setting = &state->link_freq_settings[i];
+
+		err = tc358746_calculate_csi_txtimings(state, csi_setting);
+		if (err) {
+			v4l2_err(sd, "Failed to calc csi-tx tminings\n");
+			return err;
+		}
+	}
+
+	/*
+	 * Set it to the hw default value. The correct value will be set during
+	 * set_fmt(), since it depends on the pclk and and the resulution.
+	 */
+	state->vb_fifo = 1;
+
+	err = clk_prepare_enable(state->refclk);
+	if (err) {
+		v4l2_err(sd, "Failed to enable clock\n");
+		return err;
+	}
+
+	if (state->reset_gpio)
+		tc358746_gpio_reset(state);
+
+	return 0;
+}
+
+static int tc358746_probe_fw(struct tc358746_state *state)
+{
+	struct device *dev = &state->i2c_client->dev;
+	struct v4l2_subdev *sd = &state->sd;
+	struct v4l2_fwnode_endpoint endpoint = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct fwnode_handle *fw_node;
+	unsigned int refclk, pllinclk;
+	unsigned char pll_prediv;
+	int ret = -EINVAL;
+
+	/* Parse all clocks */
+	state->refclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(state->refclk)) {
+		if (PTR_ERR(state->refclk) != -EPROBE_DEFER)
+			v4l2_err(sd, "failed to get refclk: %ld\n",
+				PTR_ERR(state->refclk));
+		return PTR_ERR(state->refclk);
+	}
+
+	refclk = clk_get_rate(state->refclk);
+	if (refclk < 6000000 || refclk > 40000000) {
+		v4l2_err(sd, "Invalid refclk %u, valid range: 6-40 MHz\n",
+			 refclk);
+		return -EINVAL;
+	}
+
+	/*
+	 * The PLL input clock is obtained by dividing refclk by pll_prd.
+	 * It must be between 4 MHz and 40 MHz, lower frequency is better.
+	 */
+	pll_prediv = DIV_ROUND_CLOSEST(refclk, 4000000);
+	if (pll_prediv < 1 || pll_prediv > 16) {
+		v4l2_err(sd, "Invalid pll pre-divider value: %d\n", pll_prediv);
+		return -EINVAL;
+	}
+	state->pll_prd = pll_prediv;
+
+	pllinclk = DIV_ROUND_CLOSEST(refclk, pll_prediv);
+	if (pllinclk < 4000000 || pllinclk > 40000000) {
+		v4l2_err(sd, "Invalid pll input clock: %d Hz\n", pllinclk);
+		return -EINVAL;
+	}
+	state->pllinclk_hz = pllinclk;
+
+	/* Now parse the fw-node */
+	fwnode_graph_for_each_endpoint(dev_fwnode(dev), fw_node) {
+		struct fwnode_endpoint fw_ep;
+
+		ret = fwnode_graph_parse_endpoint(fw_node, &fw_ep);
+		if (ret)
+			return -EINVAL;
+
+		/* Get downstream endpoint */
+		if (fw_ep.port == 1)
+			break;
+	}
+
+	if (!fw_node) {
+		v4l2_err(sd, "Missing endpoint node\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(fw_node, &endpoint);
+	if (ret) {
+		v4l2_err(sd, "Failed to parse endpoint %d\n", ret);
+		return ret;
+	}
+
+	state->csi_dir = TC358746_CSI_TX;
+
+	if (endpoint.bus.mipi_csi2.num_data_lanes == 0 ||
+	    endpoint.nr_of_link_frequencies == 0) {
+		v4l2_err(sd, "Missing CSI-2 properties in endpoint\n");
+		ret = -EINVAL;
+		goto free_ep;
+	}
+
+	if (endpoint.bus.mipi_csi2.num_data_lanes > 4) {
+		v4l2_err(sd, "Invalid number of lanes\n");
+		ret = -EINVAL;
+		goto free_ep;
+	}
+
+	state->link_freq_settings =
+		devm_kcalloc(dev, endpoint.nr_of_link_frequencies,
+			     sizeof(*state->link_freq_settings), GFP_KERNEL);
+	if (!state->link_freq_settings) {
+		ret = -ENOMEM;
+		goto free_ep;
+	}
+
+	state->link_frequencies =
+		devm_kcalloc(dev, endpoint.nr_of_link_frequencies,
+			     sizeof(*state->link_frequencies), GFP_KERNEL);
+	if (!state->link_frequencies) {
+		ret = -ENOMEM;
+		goto free_ep;
+	}
+
+	ret = tc358746_set_lane_settings(state, &endpoint);
+	if (ret)
+		goto free_ep;
+
+	state->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(state->reset_gpio)) {
+		v4l2_err(sd, "failed to get reset gpio\n");
+		ret =  PTR_ERR(state->reset_gpio);
+		goto free_ep;
+	}
+
+	ret = 0;
+
+free_ep:
+	v4l2_fwnode_endpoint_free(&endpoint);
+	return ret;
+}
+
+static int tc358746_parse_endpoint(struct device *dev,
+				   struct v4l2_fwnode_endpoint *vep,
+				   struct v4l2_async_subdev *asd)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct tc358746_state *state = to_state(sd);
+
+	if (!fwnode_device_is_available(asd->match.fwnode)) {
+		v4l2_err(sd, "remote is not available\n");
+		return -ENOTCONN;
+	}
+
+	if (state->csi_dir == TC358746_CSI_TX &&
+	    vep->bus_type != V4L2_MBUS_PARALLEL) {
+		v4l2_err(sd, "invalid bus type, must be PARALLEL\n");
+		return -ENOTCONN;
+	}
+
+	return 0;
+};
+
+static int tc358746_async_register(struct v4l2_subdev *sd)
+{
+	unsigned int port = 0;
+
+	return v4l2_async_register_fwnode_subdev(
+		sd, sizeof(struct v4l2_async_subdev), &port, 1,
+		tc358746_parse_endpoint);
+
+}
+
+static const char * const tc358764_test_pattern_menu[] = {
+	"Disabled",
+	"80 Pixel Color Bars",
+};
+
+static int tc358746_probe(struct i2c_client *client)
+{
+	struct tc358746_state *state;
+	struct v4l2_subdev *sd;
+	int err;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return -EIO;
+
+	state = devm_kzalloc(&client->dev, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	state->i2c_client = client;
+	sd = &state->sd;
+	v4l2_i2c_subdev_init(sd, client, &tc358746_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+
+	err = tc358746_probe_fw(state);
+	if (err)
+		return err;
+
+	err = tc358746_apply_fw(state);
+	if (err)
+		return err;
+
+	if (((i2c_rd16(sd, CHIPID) & CHIPID_CHIPID_MASK) >> 8) != 0x44) {
+		v4l2_info(sd, "not a TC358746 on address 0x%x\n",
+			  client->addr << 1);
+		err = -ENODEV;
+		goto err_clk;
+	}
+
+	v4l2_ctrl_handler_init(&state->hdl, 2);
+
+	v4l2_ctrl_new_std_menu_items(&state->hdl,
+			&tc358764_ctrl_ops, V4L2_CID_TEST_PATTERN,
+			ARRAY_SIZE(tc358764_test_pattern_menu) - 1, 0, 0,
+			tc358764_test_pattern_menu);
+
+	state->link_freq =
+		v4l2_ctrl_new_int_menu(&state->hdl, &tc358764_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       state->link_frequencies_num - 1,
+				       TC358746_DEF_LINK_FREQ,
+				       state->link_frequencies);
+
+
+	sd->ctrl_handler = &state->hdl;
+	if (state->hdl.error) {
+		err = state->hdl.error;
+		goto err_hdl;
+	}
+
+	state->pads[0].flags = MEDIA_PAD_FL_SINK;
+	state->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &tc358746_entity_ops;
+	err = media_entity_pads_init(&sd->entity, 2, state->pads);
+	if (err < 0)
+		goto err_hdl;
+
+	mutex_init(&state->confctl_mutex);
+
+	state->fmt = tc358746_def_fmt;
+
+	/* Apply default settings */
+	tc358746_sreset(sd);
+	tc358746_set_buffers(sd);
+	tc358746_set_csi(sd);
+	tc358746_set_csi_color_space(sd);
+	tc358746_sleep_mode(sd, 1);
+	tc358746_set_pll(sd);
+	tc358746_enable_stream(sd, 0);
+
+	err = tc358746_async_register(sd);
+	if (err < 0)
+		goto err_mutex;
+
+	v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
+		  client->addr << 1, client->adapter->name);
+
+	return 0;
+
+err_mutex:
+	mutex_destroy(&state->confctl_mutex);
+err_hdl:
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(&state->hdl);
+err_clk:
+	clk_disable_unprepare(state->refclk);
+
+	return err;
+}
+
+static int tc358746_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct tc358746_state *state = to_state(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_device_unregister_subdev(sd);
+	mutex_destroy(&state->confctl_mutex);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(&state->hdl);
+
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused tc358746_of_match[] = {
+	{ .compatible = "toshiba,tc358746" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tc358746_of_match);
+
+static struct i2c_driver tc358746_driver = {
+	.driver = {
+		.name = "tc358746",
+		.of_match_table = of_match_ptr(tc358746_of_match),
+	},
+	.probe_new = tc358746_probe,
+	.remove = tc358746_remove,
+};
+
+module_i2c_driver(tc358746_driver);
diff --git a/drivers/media/i2c/tc358746_regs.h b/drivers/media/i2c/tc358746_regs.h
new file mode 100644
index 000000000000..9232d00d0e92
--- /dev/null
+++ b/drivers/media/i2c/tc358746_regs.h
@@ -0,0 +1,208 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tc358746 - Toshiba Parallel to CSI-2 bridge - register names and bit masks
+ *
+ * Convention:
+ * <REGISTER>
+ * <REGISTER>_<BITFIELD>_MASK
+ * <REGISTER>_<BITFIELD>_<VALUE>
+ * <REGISTER>_<BITFIELD>_SET(val = <REGISTER>_<BITFIELD>_<VALUE>)
+ *
+ * References:
+ * REF_01:
+ * - TC358746AXBG/TC358748XBG/TC358748IXBG Functional Specification Rev 1.2
+ */
+
+#ifndef __TC358746_REGS_H
+#define __TC358746_REGS_H
+
+#define CHIPID			0x0000
+#define CHIPID_CHIPID_MASK		GENMASK(15, 8)
+#define CHIPID_REVID_MASK		GENMASK(7, 0)
+
+#define SYSCTL			0x0002
+#define SYSCTL_SLEEP_MASK		BIT(1)
+#define SYSCTL_SRESET_MASK		BIT(0)
+
+#define CONFCTL                 0x0004
+#define CONFCTL_TRIEN_MASK		BIT(15)
+#define CONFCTL_INTE2N_MASK		BIT(13)
+#define CONFCTL_BT656EN_MASK		BIT(12)
+#define CONFCTL_PDATAF_MASK		GENMASK(9, 8)
+#define CONFCTL_PDATAF_SET(val)		(((val << 8) & CONFCTL_PDATAF_MASK))
+#define CONFCTL_PDATAF_MODE0		0
+#define CONFCTL_PDATAF_MODE1		1
+#define CONFCTL_PDATAF_MODE2		2
+#define CONFCTL_PPEN_MASK		BIT(6)
+#define CONFCTL_VVALIDP_MASK		BIT(5)
+#define CONFCTL_HVALIDP_MASK		BIT(4)
+#define CONFCTL_PCLKP_MASK		BIT(3)
+#define CONFCTL_AUTO_MASK		BIT(2)
+#define CONFCTL_DATALANE_MASK		GENMASK(1, 0)
+#define CONFCTL_DATALANE_1		0
+#define CONFCTL_DATALANE_2		1
+#define CONFCTL_DATALANE_3		2
+#define CONFCTL_DATALANE_4		3
+
+#define FIFOCTL			0x0006
+#define DATAFMT			0x0008
+#define DATAFMT_PDFMT_RAW8		0
+#define DATAFMT_PDFMT_RAW10		1
+#define DATAFMT_PDFMT_RAW12		2
+#define DATAFMT_PDFMT_RGB888		3
+#define DATAFMT_PDFMT_RGB666		4
+#define DATAFMT_PDFMT_RGB565		5
+#define DATAFMT_PDFMT_YCBCRFMT_422_8_BIT 6
+#define DATAFMT_PDFMT_RAW14		8
+#define DATAFMT_PDFMT_YCBCRFMT_422_10_BIT 9
+#define DATAFMT_PDFMT_YCBCRFMT_444	10
+#define DATAFMT_PDFMT_MASK		GENMASK(7, 4)
+#define DATAFMT_PDFMT_SET(val)		(((val) << 4) & DATAFMT_PDFMT_MASK)
+#define DATAFMT_UDT_EN_MASK		BIT(0)
+
+#define MCLKCTL			0x000c
+#define MCLKCTL_MCLK_HIGH_MASK		GENMASK(15, 8)
+#define MCLKCTL_MCLK_HIGH_SET(val)	((((val) - 1) << 8) & MCLKCTL_MCLK_HIGH_MASK)
+#define MCLKCTL_MCLK_LOW_MASK		GENMASK(7, 0)
+#define MCLKCTL_MCLK_LOW_SET(val)	(((val) - 1) & MCLKCTL_MCLK_LOW_MASK)
+
+#define PLLCTL0			0x0016
+#define PLLCTL0_PLL_PRD_MASK		GENMASK(15, 12)
+#define PLLCTL0_PLL_PRD_SET(prd)	((((prd) - 1) << 12) & PLLCTL0_PLL_PRD_MASK)
+#define PLLCTL0_PLL_FBD_MASK		GENMASK(8, 0)
+#define PLLCTL0_PLL_FBD_SET(fbd)        (((fbd) - 1) & PLLCTL0_PLL_FBD_MASK)
+
+#define PLLCTL1                 0x0018
+#define PLLCTL1_PLL_FRS_MASK            GENMASK(11, 10)
+#define PLLCTL1_PLL_FRS_SET(frs)        (((frs) << 10) & PLLCTL1_PLL_FRS_MASK)
+#define PLLCTL1_PLL_LBWS_MASK		GENMASK(9, 8)
+#define PLLCTL1_LFBREN_MASK		BIT(6)
+#define PLLCTL1_BYPCKEN_MASK		BIT(5)
+#define PLLCTL1_CKEN_MASK		BIT(4)
+#define PLLCTL1_RESETB_MASK		BIT(1)
+#define PLLCTL1_PLL_EN_MASK		BIT(0)
+
+#define CLKCTL			0x0020
+#define CLKCTL_MCLKDIV_MASK		GENMASK(3, 2)
+#define CLKCTL_MCLKDIV_SET(val)		((val << 2) & CLKCTL_MCLKDIV_MASK)
+#define CLKCTL_MCLKDIV_8		0
+#define CLKCTL_MCLKDIV_4		1
+#define CLKCTL_MCLKDIV_2		2
+
+#define WORDCNT			0x0022
+#define PP_MISC                 0x0032
+#define PP_MISC_FRMSTOP_MASK		BIT(15)
+#define PP_MISC_RSTPTR_MASK		BIT(14)
+
+#define CSI2TX_DATA_TYPE	0x0050
+#define MIPI_PHY_STATUS		0x0062
+#define CSI2_ERROR_STATUS       0x0064
+#define CSI2_ERR_EN             0x0066
+#define CSI2_IDID_ERROR         0x006c
+#define DBG_ACT_LINE_CNT        0x00e0
+#define DBG_LINE_WIDTH		0x00e2
+#define DBG_VERT_BLANK_LINE_CNT	0x00e4
+#define DBG_VIDEO_DATA          0x00e8
+#define FIFOSTATUS              0x00F8
+
+#define CLW_CNTRL               0x0140
+#define CLW_CNTRL_CLW_LANEDISABLE_MASK	BIT(0)
+
+#define D0W_CNTRL               0x0144
+#define D0W_CNTRL_D0W_LANEDISABLE_MASK	BIT(0)
+
+#define D1W_CNTRL		0x0148
+#define D1W_CNTRL_D1W_LANEDISABLE_MASK	BIT(0)
+
+#define D2W_CNTRL		0x014C
+#define D2W_CNTRL_D2W_LANEDISABLE_MASK	BIT(0)
+
+#define D3W_CNTRL		0x0150
+#define D2W_CNTRL_D3W_LANEDISABLE_MASK	BIT(0)
+
+#define STARTCNTRL              0x0204
+#define STARTCNTRL_START_MASK		BIT(0)
+
+#define LINEINITCNT		0x0210
+#define LPTXTIMECNT		0x0214
+#define TCLK_HEADERCNT		0x0218
+#define	TCLK_HEADERCNT_TCLK_ZEROCNT_MASK	GENMASK(15, 8)
+#define TCLK_HEADERCNT_TCLK_PREPARECNT_MASK	GENMASK(6, 0)
+#define	TCLK_HEADERCNT_TCLK_ZEROCNT_SET(val)	((val << 8) & TCLK_HEADERCNT_TCLK_ZEROCNT_MASK)
+#define	TCLK_HEADERCNT_TCLK_PREPARECNT_SET(val)	(val & TCLK_HEADERCNT_TCLK_PREPARECNT_MASK)
+
+#define TCLK_TRAILCNT		0x021C
+#define THS_HEADERCNT		0x0220
+#define	THS_HEADERCNT_THS_ZEROCNT_MASK		GENMASK(14, 8)
+#define	THS_HEADERCNT_THS_PREPARECNT_MASK	GENMASK(6, 0)
+#define	THS_HEADERCNT_THS_ZEROCNT_SET(val)	((val << 8) & THS_HEADERCNT_THS_ZEROCNT_MASK)
+#define	THS_HEADERCNT_THS_PREPARECNT_SET(val)	(val & THS_HEADERCNT_THS_PREPARECNT_MASK)
+
+#define TWAKEUP			0x0224
+#define TCLK_POSTCNT		0x0228
+#define THS_TRAILCNT		0x022C
+#define HSTXVREGCNT		0x0230
+#define HSTXVREGEN              0x0234
+#define HSTXVREGEN_D3M_HSTXVREGEN_MASK	BIT(4)
+#define HSTXVREGEN_D2M_HSTXVREGEN_MASK  BIT(3)
+#define HSTXVREGEN_D1M_HSTXVREGEN_MASK  BIT(2)
+#define HSTXVREGEN_D0M_HSTXVREGEN_MASK  BIT(1)
+#define HSTXVREGEN_CLM_HSTXVREGEN_MASK  BIT(0)
+
+#define TXOPTIONCNTRL           0x0238
+#define TXOPTIONCNTRL_CONTCLKMODE_MASK	BIT(0)
+
+#define CSI_CONTROL             0x040C
+#define CSI_CONTROL_CSI_MODE_MASK       BIT(15)
+#define CSI_CONTROL_HTXTOEN_MASK        BIT(10)
+#define CSI_CONTROL_TXHSMD_MASK         BIT(7)
+#define CSI_CONTROL_NOL_MASK            GENMASK(2, 1)
+#define CSI_CONTROL_NOL_1_MASK          0
+#define CSI_CONTROL_NOL_2_MASK          BIT(1)
+#define CSI_CONTROL_NOL_3_MASK          BIT(2)
+#define CSI_CONTROL_NOL_4_MASK          (BIT(1) | BIT(2))
+#define CSI_CONTROL_EOTDIS_MASK         BIT(0)
+
+#define CSI_STATUS              0x0410
+#define CSI_STATUS_S_WSYNC_MASK		BIT(10)
+#define CSI_STATUS_S_TXACT_MASK		BIT(9)
+#define CSI_STATUS_S_HLT_MASK		BIT(0)
+
+#define CSI_INT			0x0414
+#define CSI_INT_INTHLT_MASK		BIT(3)
+#define CSI_INT_INTER_MASK		BIT(2)
+
+#define CSI_INT_ENA             0x0418
+#define CSI_INT_ENA_IENHLT_MASK		BIT(3)
+#define CSI_INT_ENA_IENER_MASK		BIT(2)
+
+#define CSI_ERR                 0x044C
+#define CSI_ERR_INER_MASK               BIT(9)
+#define CSI_ERR_WCER_MASK		BIT(8)
+#define CSI_ERR_QUNK_MASK		BIT(4)
+#define CSI_ERR_TXBRK_MASK		BIT(1)
+
+#define CSI_ERR_INTENA          0x0450
+#define CSI_ERR_HALT            0x0454
+#define CSI_CONFW               0x0500
+#define CSI_CONFW_MODE_MASK			GENMASK(31, 29)
+#define CSI_CONFW_MODE_SET_MASK			(BIT(31) | BIT(29))
+#define CSI_CONFW_MODE_CLEAR_MASK		(BIT(31) | BIT(30))
+#define CSI_CONFW_ADDRESS_MASK			GENMASK(28, 24)
+#define CSI_CONFW_ADDRESS_CSI_CONTROL_MASK	(BIT(24) | BIT(25))
+#define CSI_CONFW_ADDRESS_CSI_INT_ENA_MASK	(BIT(25) | BIT(26))
+#define CSI_CONFW_ADDRESS_CSI_ERR_INTENA_MASK	(BIT(28) | BIT(26))
+#define CSI_CONFW_ADDRESS_CSI_ERR_HALT_MASK	(BIT(28) | BIT(26) | BIT(24))
+#define CSI_CONFW_DATA_MASK			GENMASK(15, 0)
+
+#define CSIRESET                0x0504
+#define CSIRESET_RESET_CNF_MASK		BIT(1)
+#define CSIRESET_RESET_MODULE_MASK	BIT(0)
+
+#define CSI_INT_CLR             0x050C
+#define CSI_INT_CLR_ICRER_MASK		BIT(2)
+
+#define CSI_START               0x0518
+#define CSI_START_STRT_MASK		BIT(0)
+
+#endif
-- 
2.20.1

