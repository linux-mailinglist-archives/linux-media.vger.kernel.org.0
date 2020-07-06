Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33BAA215EC8
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbgGFSjA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730001AbgGFSjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:00 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 803102580;
        Mon,  6 Jul 2020 20:38:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060700;
        bh=ohgwXrXdEzyaw2tEITR8LQV4ScC/3Zg0Hjk1P/mq43k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X7JkkeOaP8ZhJF7yYSKhKem5inWC5gEOUI86Y6z8t6u5pfFsgx59O8Y1RHLRBPPOT
         7r5kQov3b5/b7dFBrYJAEWIRl8RezpgUeoxPhe7WhGph0wkUuFKGNPYHAxVaP8Pcd9
         6o9RQrJoKlN4ep9KDLyYOyGEfUx3pNfqG6lnrY9w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 084/108] media: ti-vpe: cal: Split CAMERARX handling to cal-camerarx.c
Date:   Mon,  6 Jul 2020 21:36:45 +0300
Message-Id: <20200706183709.12238-85-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implementation of media controller centric device configuration will add
code to the CAMERARX support section, which is already quite big. Move
it to a separate file to make the code more manageable. No functional
change is included.

The cal_camerarx_init_regmap() function is kept in cal.c and renamed to
cal_init_camerarx_regmap() as it's not specific to one CAMERARX
instance, but related to the whole CAL device.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/Makefile       |   2 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c | 649 ++++++++++++++++
 drivers/media/platform/ti-vpe/cal.c          | 739 ++-----------------
 drivers/media/platform/ti-vpe/cal.h          |   5 +
 4 files changed, 713 insertions(+), 682 deletions(-)
 create mode 100644 drivers/media/platform/ti-vpe/cal-camerarx.c

diff --git a/drivers/media/platform/ti-vpe/Makefile b/drivers/media/platform/ti-vpe/Makefile
index a7bf8f2a1386..ad624056e039 100644
--- a/drivers/media/platform/ti-vpe/Makefile
+++ b/drivers/media/platform/ti-vpe/Makefile
@@ -13,4 +13,4 @@ ccflags-$(CONFIG_VIDEO_TI_VPE_DEBUG) += -DDEBUG
 
 obj-$(CONFIG_VIDEO_TI_CAL) += ti-cal.o
 
-ti-cal-y := cal.o cal-video.o
+ti-cal-y := cal.o cal-camerarx.o cal-video.o
diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
new file mode 100644
index 000000000000..806cbf175d39
--- /dev/null
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -0,0 +1,649 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TI Camera Access Layer (CAL) - CAMERARX
+ *
+ * Copyright (c) 2015-2020 Texas Instruments Inc.
+ *
+ * Authors:
+ *	Benoit Parrot <bparrot@ti.com>
+ *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#include "cal.h"
+#include "cal_regs.h"
+
+/* ------------------------------------------------------------------
+ *	I/O Register Accessors
+ * ------------------------------------------------------------------
+ */
+
+static inline u32 camerarx_read(struct cal_camerarx *phy, u32 offset)
+{
+	return ioread32(phy->base + offset);
+}
+
+static inline void camerarx_write(struct cal_camerarx *phy, u32 offset, u32 val)
+{
+	iowrite32(val, phy->base + offset);
+}
+
+/* ------------------------------------------------------------------
+ *	CAMERARX Management
+ * ------------------------------------------------------------------
+ */
+
+static s64 cal_camerarx_get_external_rate(struct cal_camerarx *phy)
+{
+	struct v4l2_ctrl *ctrl;
+	s64 rate;
+
+	ctrl = v4l2_ctrl_find(phy->sensor->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (!ctrl) {
+		phy_err(phy, "no pixel rate control in subdev: %s\n",
+			phy->sensor->name);
+		return -EPIPE;
+	}
+
+	rate = v4l2_ctrl_g_ctrl_int64(ctrl);
+	phy_dbg(3, phy, "sensor Pixel Rate: %llu\n", rate);
+
+	return rate;
+}
+
+static void cal_camerarx_lane_config(struct cal_camerarx *phy)
+{
+	u32 val = cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance));
+	u32 lane_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POSITION_MASK;
+	u32 polarity_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POL_MASK;
+	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
+		&phy->endpoint.bus.mipi_csi2;
+	int lane;
+
+	cal_set_field(&val, mipi_csi2->clock_lane + 1, lane_mask);
+	cal_set_field(&val, mipi_csi2->lane_polarities[0], polarity_mask);
+	for (lane = 0; lane < mipi_csi2->num_data_lanes; lane++) {
+		/*
+		 * Every lane are one nibble apart starting with the
+		 * clock followed by the data lanes so shift masks by 4.
+		 */
+		lane_mask <<= 4;
+		polarity_mask <<= 4;
+		cal_set_field(&val, mipi_csi2->data_lanes[lane] + 1, lane_mask);
+		cal_set_field(&val, mipi_csi2->lane_polarities[lane + 1],
+			      polarity_mask);
+	}
+
+	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance), val);
+	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x\n",
+		phy->instance, val);
+}
+
+static void cal_camerarx_enable(struct cal_camerarx *phy)
+{
+	u32 num_lanes = phy->cal->data->camerarx[phy->instance].num_lanes;
+
+	regmap_field_write(phy->fields[F_CAMMODE], 0);
+	/* Always enable all lanes at the phy control level */
+	regmap_field_write(phy->fields[F_LANEENABLE], (1 << num_lanes) - 1);
+	/* F_CSI_MODE is not present on every architecture */
+	if (phy->fields[F_CSI_MODE])
+		regmap_field_write(phy->fields[F_CSI_MODE], 1);
+	regmap_field_write(phy->fields[F_CTRLCLKEN], 1);
+}
+
+void cal_camerarx_disable(struct cal_camerarx *phy)
+{
+	regmap_field_write(phy->fields[F_CTRLCLKEN], 0);
+}
+
+/*
+ * TCLK values are OK at their reset values
+ */
+#define TCLK_TERM	0
+#define TCLK_MISS	1
+#define TCLK_SETTLE	14
+
+static void cal_camerarx_config(struct cal_camerarx *phy, s64 external_rate,
+				const struct cal_fmt *fmt)
+{
+	unsigned int reg0, reg1;
+	unsigned int ths_term, ths_settle;
+	unsigned int csi2_ddrclk_khz;
+	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
+			&phy->endpoint.bus.mipi_csi2;
+	u32 num_lanes = mipi_csi2->num_data_lanes;
+
+	/* DPHY timing configuration */
+
+	/*
+	 * CSI-2 is DDR and we only count used lanes.
+	 *
+	 * csi2_ddrclk_khz = external_rate / 1000
+	 *		   / (2 * num_lanes) * fmt->bpp;
+	 */
+	csi2_ddrclk_khz = div_s64(external_rate * fmt->bpp,
+				  2 * num_lanes * 1000);
+
+	phy_dbg(1, phy, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
+
+	/* THS_TERM: Programmed value = floor(20 ns/DDRClk period) */
+	ths_term = 20 * csi2_ddrclk_khz / 1000000;
+	phy_dbg(1, phy, "ths_term: %d (0x%02x)\n", ths_term, ths_term);
+
+	/* THS_SETTLE: Programmed value = floor(105 ns/DDRClk period) + 4 */
+	ths_settle = (105 * csi2_ddrclk_khz / 1000000) + 4;
+	phy_dbg(1, phy, "ths_settle: %d (0x%02x)\n", ths_settle, ths_settle);
+
+	reg0 = camerarx_read(phy, CAL_CSI2_PHY_REG0);
+	cal_set_field(&reg0, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
+		      CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_MASK);
+	cal_set_field(&reg0, ths_term, CAL_CSI2_PHY_REG0_THS_TERM_MASK);
+	cal_set_field(&reg0, ths_settle, CAL_CSI2_PHY_REG0_THS_SETTLE_MASK);
+
+	phy_dbg(1, phy, "CSI2_%d_REG0 = 0x%08x\n", phy->instance, reg0);
+	camerarx_write(phy, CAL_CSI2_PHY_REG0, reg0);
+
+	reg1 = camerarx_read(phy, CAL_CSI2_PHY_REG1);
+	cal_set_field(&reg1, TCLK_TERM, CAL_CSI2_PHY_REG1_TCLK_TERM_MASK);
+	cal_set_field(&reg1, 0xb8, CAL_CSI2_PHY_REG1_DPHY_HS_SYNC_PATTERN_MASK);
+	cal_set_field(&reg1, TCLK_MISS,
+		      CAL_CSI2_PHY_REG1_CTRLCLK_DIV_FACTOR_MASK);
+	cal_set_field(&reg1, TCLK_SETTLE, CAL_CSI2_PHY_REG1_TCLK_SETTLE_MASK);
+
+	phy_dbg(1, phy, "CSI2_%d_REG1 = 0x%08x\n", phy->instance, reg1);
+	camerarx_write(phy, CAL_CSI2_PHY_REG1, reg1);
+}
+
+static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
+{
+	u32 target_state;
+	unsigned int i;
+
+	target_state = enable ? CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON :
+		       CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF;
+
+	cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+			target_state, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
+
+	for (i = 0; i < 10; i++) {
+		u32 current_state;
+
+		current_state = cal_read_field(phy->cal,
+					       CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+					       CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK);
+
+		if (current_state == target_state)
+			break;
+
+		usleep_range(1000, 1100);
+	}
+
+	if (i == 10)
+		phy_err(phy, "Failed to power %s complexio\n",
+			enable ? "up" : "down");
+}
+
+static void cal_camerarx_wait_reset(struct cal_camerarx *phy)
+{
+	unsigned long timeout;
+
+	timeout = jiffies + msecs_to_jiffies(750);
+	while (time_before(jiffies, timeout)) {
+		if (cal_read_field(phy->cal,
+				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
+		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
+			break;
+		usleep_range(500, 5000);
+	}
+
+	if (cal_read_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
+			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
+		phy_err(phy, "Timeout waiting for Complex IO reset done\n");
+}
+
+static void cal_camerarx_wait_stop_state(struct cal_camerarx *phy)
+{
+	unsigned long timeout;
+
+	timeout = jiffies + msecs_to_jiffies(750);
+	while (time_before(jiffies, timeout)) {
+		if (cal_read_field(phy->cal,
+				   CAL_CSI2_TIMING(phy->instance),
+				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
+			break;
+		usleep_range(500, 5000);
+	}
+
+	if (cal_read_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
+			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
+		phy_err(phy, "Timeout waiting for stop state\n");
+}
+
+int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt)
+{
+	s64 external_rate;
+	u32 sscounter;
+	u32 val;
+	int ret;
+
+	external_rate = cal_camerarx_get_external_rate(phy);
+	if (external_rate < 0)
+		return external_rate;
+
+	ret = v4l2_subdev_call(phy->sensor, core, s_power, 1);
+	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
+		phy_err(phy, "power on failed in subdev\n");
+		return ret;
+	}
+
+	/*
+	 * CSI-2 PHY Link Initialization Sequence, according to the DRA74xP /
+	 * DRA75xP / DRA76xP / DRA77xP TRM. The DRA71x / DRA72x and the AM65x /
+	 * DRA80xM TRMs have a a slightly simplified sequence.
+	 */
+
+	/*
+	 * 1. Configure all CSI-2 low level protocol registers to be ready to
+	 *    receive signals/data from the CSI-2 PHY.
+	 *
+	 *    i.-v. Configure the lanes position and polarity.
+	 */
+	cal_camerarx_lane_config(phy);
+
+	/*
+	 *    vi.-vii. Configure D-PHY mode, enable the required lanes and
+	 *             enable the CAMERARX clock.
+	 */
+	cal_camerarx_enable(phy);
+
+	/*
+	 * 2. CSI PHY and link initialization sequence.
+	 *
+	 *    a. Deassert the CSI-2 PHY reset. Do not wait for reset completion
+	 *       at this point, as it requires the external sensor to send the
+	 *       CSI-2 HS clock.
+	 */
+	cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
+			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
+	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x De-assert Complex IO Reset\n",
+		phy->instance,
+		cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)));
+
+	/* Dummy read to allow SCP reset to complete. */
+	camerarx_read(phy, CAL_CSI2_PHY_REG0);
+
+	/* Program the PHY timing parameters. */
+	cal_camerarx_config(phy, external_rate, fmt);
+
+	/*
+	 *    b. Assert the FORCERXMODE signal.
+	 *
+	 * The stop-state-counter is based on fclk cycles, and we always use
+	 * the x16 and x4 settings, so stop-state-timeout =
+	 * fclk-cycle * 16 * 4 * counter.
+	 *
+	 * Stop-state-timeout must be more than 100us as per CSI-2 spec, so we
+	 * calculate a timeout that's 100us (rounding up).
+	 */
+	sscounter = DIV_ROUND_UP(clk_get_rate(phy->cal->fclk), 10000 *  16 * 4);
+
+	val = cal_read(phy->cal, CAL_CSI2_TIMING(phy->instance));
+	cal_set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
+	cal_set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
+	cal_set_field(&val, sscounter,
+		      CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
+	cal_write(phy->cal, CAL_CSI2_TIMING(phy->instance), val);
+	phy_dbg(3, phy, "CAL_CSI2_TIMING(%d) = 0x%08x Stop States\n",
+		phy->instance,
+		cal_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
+
+	/* Assert the FORCERXMODE signal. */
+	cal_write_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
+			1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
+	phy_dbg(3, phy, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
+		phy->instance,
+		cal_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
+
+	/*
+	 * c. Connect pull-down on CSI-2 PHY link (using pad control).
+	 *
+	 * This is not required on DRA71x, DRA72x, AM65x and DRA80xM. Not
+	 * implemented.
+	 */
+
+	/*
+	 * d. Power up the CSI-2 PHY.
+	 * e. Check whether the state status reaches the ON state.
+	 */
+	cal_camerarx_power(phy, true);
+
+	/*
+	 * Start the sensor to enable the CSI-2 HS clock. We can now wait for
+	 * CSI-2 PHY reset to complete.
+	 */
+	ret = v4l2_subdev_call(phy->sensor, video, s_stream, 1);
+	if (ret) {
+		v4l2_subdev_call(phy->sensor, core, s_power, 0);
+		phy_err(phy, "stream on failed in subdev\n");
+		return ret;
+	}
+
+	cal_camerarx_wait_reset(phy);
+
+	/* f. Wait for STOPSTATE=1 for all enabled lane modules. */
+	cal_camerarx_wait_stop_state(phy);
+
+	phy_dbg(1, phy, "CSI2_%u_REG1 = 0x%08x (bits 31-28 should be set)\n",
+		phy->instance, camerarx_read(phy, CAL_CSI2_PHY_REG1));
+
+	/*
+	 * g. Disable pull-down on CSI-2 PHY link (using pad control).
+	 *
+	 * This is not required on DRA71x, DRA72x, AM65x and DRA80xM. Not
+	 * implemented.
+	 */
+
+	return 0;
+}
+
+void cal_camerarx_stop(struct cal_camerarx *phy)
+{
+	unsigned int i;
+	int ret;
+
+	cal_camerarx_power(phy, false);
+
+	/* Assert Complex IO Reset */
+	cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
+			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
+
+	/* Wait for power down completion */
+	for (i = 0; i < 10; i++) {
+		if (cal_read_field(phy->cal,
+				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
+		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)
+			break;
+		usleep_range(1000, 1100);
+	}
+	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO in Reset (%d) %s\n",
+		phy->instance,
+		cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)), i,
+		(i >= 10) ? "(timeout)" : "");
+
+	/* Disable the phy */
+	cal_camerarx_disable(phy);
+
+	if (v4l2_subdev_call(phy->sensor, video, s_stream, 0))
+		phy_err(phy, "stream off failed in subdev\n");
+
+	ret = v4l2_subdev_call(phy->sensor, core, s_power, 0);
+	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
+		phy_err(phy, "power off failed in subdev\n");
+}
+
+/*
+ *   Errata i913: CSI2 LDO Needs to be disabled when module is powered on
+ *
+ *   Enabling CSI2 LDO shorts it to core supply. It is crucial the 2 CSI2
+ *   LDOs on the device are disabled if CSI-2 module is powered on
+ *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x1) or in ULPS (0x4845 B304
+ *   | 0x4845 B384 [28:27] = 0x2) mode. Common concerns include: high
+ *   current draw on the module supply in active mode.
+ *
+ *   Errata does not apply when CSI-2 module is powered off
+ *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x0).
+ *
+ * SW Workaround:
+ *	Set the following register bits to disable the LDO,
+ *	which is essentially CSI2 REG10 bit 6:
+ *
+ *		Core 0:  0x4845 B828 = 0x0000 0040
+ *		Core 1:  0x4845 B928 = 0x0000 0040
+ */
+void cal_camerarx_i913_errata(struct cal_camerarx *phy)
+{
+	u32 reg10 = camerarx_read(phy, CAL_CSI2_PHY_REG10);
+
+	cal_set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
+
+	phy_dbg(1, phy, "CSI2_%d_REG10 = 0x%08x\n", phy->instance, reg10);
+	camerarx_write(phy, CAL_CSI2_PHY_REG10, reg10);
+}
+
+/*
+ * Enable the expected IRQ sources
+ */
+void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
+{
+	u32 val;
+
+	const u32 cio_err_mask =
+		CAL_CSI2_COMPLEXIO_IRQ_LANE_ERRORS_MASK |
+		CAL_CSI2_COMPLEXIO_IRQ_FIFO_OVR_MASK |
+		CAL_CSI2_COMPLEXIO_IRQ_SHORT_PACKET_MASK |
+		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
+
+	/* Enable CIO error irqs */
+	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
+		  CAL_HL_IRQ_CIO_MASK(phy->instance));
+	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
+		  cio_err_mask);
+
+	/* Always enable OCPO error */
+	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
+
+	/* Enable IRQ_WDMA_END 0/1 */
+	val = 0;
+	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(1), val);
+	/* Enable IRQ_WDMA_START 0/1 */
+	val = 0;
+	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(2), val);
+	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
+	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
+}
+
+void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
+{
+	u32 val;
+
+	/* Disable CIO error irqs */
+	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(0),
+		  CAL_HL_IRQ_CIO_MASK(phy->instance));
+	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance), 0);
+
+	/* Disable IRQ_WDMA_END 0/1 */
+	val = 0;
+	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(1), val);
+	/* Disable IRQ_WDMA_START 0/1 */
+	val = 0;
+	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(2), val);
+	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
+	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0);
+}
+
+void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
+{
+	cal_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance), BIT(3));
+	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
+			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
+}
+
+void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
+{
+	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
+			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
+}
+
+static int cal_camerarx_regmap_init(struct cal_dev *cal,
+				    struct cal_camerarx *phy)
+{
+	const struct cal_camerarx_data *phy_data;
+	unsigned int i;
+
+	if (!cal->data)
+		return -EINVAL;
+
+	phy_data = &cal->data->camerarx[phy->instance];
+
+	for (i = 0; i < F_MAX_FIELDS; i++) {
+		struct reg_field field = {
+			.reg = cal->syscon_camerrx_offset,
+			.lsb = phy_data->fields[i].lsb,
+			.msb = phy_data->fields[i].msb,
+		};
+
+		/*
+		 * Here we update the reg offset with the
+		 * value found in DT
+		 */
+		phy->fields[i] = devm_regmap_field_alloc(cal->dev,
+							 cal->syscon_camerrx,
+							 field);
+		if (IS_ERR(phy->fields[i])) {
+			cal_err(cal, "Unable to allocate regmap fields\n");
+			return PTR_ERR(phy->fields[i]);
+		}
+	}
+
+	return 0;
+}
+
+static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
+{
+	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
+	struct device_node *ep_node;
+	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Find the endpoint node for the port corresponding to the PHY
+	 * instance, and parse its CSI-2-related properties.
+	 */
+	ep_node = of_graph_get_endpoint_by_regs(phy->cal->dev->of_node,
+						phy->instance, 0);
+	if (!ep_node) {
+		/*
+		 * The endpoint is not mandatory, not all PHY instances need to
+		 * be connected in DT.
+		 */
+		phy_dbg(3, phy, "Port has no endpoint\n");
+		return 0;
+	}
+
+	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), endpoint);
+	if (ret < 0) {
+		phy_err(phy, "Failed to parse endpoint\n");
+		goto done;
+	}
+
+	for (i = 0; i < endpoint->bus.mipi_csi2.num_data_lanes; i++) {
+		unsigned int lane = endpoint->bus.mipi_csi2.data_lanes[i];
+
+		if (lane > 4) {
+			phy_err(phy, "Invalid position %u for data lane %u\n",
+				lane, i);
+			ret = -EINVAL;
+			goto done;
+		}
+
+		data_lanes[i*2] = '0' + lane;
+		data_lanes[i*2+1] = ' ';
+	}
+
+	data_lanes[i*2-1] = '\0';
+
+	phy_dbg(3, phy,
+		"CSI-2 bus: clock lane <%u>, data lanes <%s>, flags 0x%08x\n",
+		endpoint->bus.mipi_csi2.clock_lane, data_lanes,
+		endpoint->bus.mipi_csi2.flags);
+
+	/* Retrieve the connected device and store it for later use. */
+	phy->sensor_node = of_graph_get_remote_port_parent(ep_node);
+	if (!phy->sensor_node) {
+		phy_dbg(3, phy, "Can't get remote parent\n");
+		ret = -EINVAL;
+		goto done;
+	}
+
+	phy_dbg(1, phy, "Found connected device %pOFn\n", phy->sensor_node);
+
+done:
+	of_node_put(ep_node);
+	return ret;
+}
+
+struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
+					 unsigned int instance)
+{
+	struct platform_device *pdev = to_platform_device(cal->dev);
+	struct cal_camerarx *phy;
+	int ret;
+
+	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return ERR_PTR(-ENOMEM);
+
+	phy->cal = cal;
+	phy->instance = instance;
+
+	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						(instance == 0) ?
+						"cal_rx_core0" :
+						"cal_rx_core1");
+	phy->base = devm_ioremap_resource(cal->dev, phy->res);
+	if (IS_ERR(phy->base)) {
+		cal_err(cal, "failed to ioremap\n");
+		ret = PTR_ERR(phy->base);
+		goto error;
+	}
+
+	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
+		phy->res->name, &phy->res->start, &phy->res->end);
+
+	ret = cal_camerarx_regmap_init(cal, phy);
+	if (ret)
+		goto error;
+
+	ret = cal_camerarx_parse_dt(phy);
+	if (ret)
+		goto error;
+
+	return phy;
+
+error:
+	kfree(phy);
+	return ERR_PTR(ret);
+}
+
+void cal_camerarx_destroy(struct cal_camerarx *phy)
+{
+	if (!phy)
+		return;
+
+	of_node_put(phy->sensor_node);
+	kfree(phy);
+}
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index c2252ed36d68..59a0266b1f39 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -10,12 +10,10 @@
  */
 
 #include <linux/clk.h>
-#include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -25,9 +23,7 @@
 #include <media/media-device.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-common.h>
-#include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-fwnode.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
@@ -155,682 +151,6 @@ void cal_quickdump_regs(struct cal_dev *cal)
 	}
 }
 
-/* ------------------------------------------------------------------
- *	CAMERARX Management
- * ------------------------------------------------------------------
- */
-
-static inline u32 camerarx_read(struct cal_camerarx *phy, u32 offset)
-{
-	return ioread32(phy->base + offset);
-}
-
-static inline void camerarx_write(struct cal_camerarx *phy, u32 offset, u32 val)
-{
-	iowrite32(val, phy->base + offset);
-}
-
-static s64 cal_camerarx_get_external_rate(struct cal_camerarx *phy)
-{
-	struct v4l2_ctrl *ctrl;
-	s64 rate;
-
-	ctrl = v4l2_ctrl_find(phy->sensor->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		phy_err(phy, "no pixel rate control in subdev: %s\n",
-			phy->sensor->name);
-		return -EPIPE;
-	}
-
-	rate = v4l2_ctrl_g_ctrl_int64(ctrl);
-	phy_dbg(3, phy, "sensor Pixel Rate: %llu\n", rate);
-
-	return rate;
-}
-
-static void cal_camerarx_lane_config(struct cal_camerarx *phy)
-{
-	u32 val = cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance));
-	u32 lane_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POSITION_MASK;
-	u32 polarity_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POL_MASK;
-	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
-		&phy->endpoint.bus.mipi_csi2;
-	int lane;
-
-	cal_set_field(&val, mipi_csi2->clock_lane + 1, lane_mask);
-	cal_set_field(&val, mipi_csi2->lane_polarities[0], polarity_mask);
-	for (lane = 0; lane < mipi_csi2->num_data_lanes; lane++) {
-		/*
-		 * Every lane are one nibble apart starting with the
-		 * clock followed by the data lanes so shift masks by 4.
-		 */
-		lane_mask <<= 4;
-		polarity_mask <<= 4;
-		cal_set_field(&val, mipi_csi2->data_lanes[lane] + 1, lane_mask);
-		cal_set_field(&val, mipi_csi2->lane_polarities[lane + 1],
-			      polarity_mask);
-	}
-
-	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance), val);
-	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x\n",
-		phy->instance, val);
-}
-
-static void cal_camerarx_enable(struct cal_camerarx *phy)
-{
-	u32 num_lanes = phy->cal->data->camerarx[phy->instance].num_lanes;
-
-	regmap_field_write(phy->fields[F_CAMMODE], 0);
-	/* Always enable all lanes at the phy control level */
-	regmap_field_write(phy->fields[F_LANEENABLE], (1 << num_lanes) - 1);
-	/* F_CSI_MODE is not present on every architecture */
-	if (phy->fields[F_CSI_MODE])
-		regmap_field_write(phy->fields[F_CSI_MODE], 1);
-	regmap_field_write(phy->fields[F_CTRLCLKEN], 1);
-}
-
-static void cal_camerarx_disable(struct cal_camerarx *phy)
-{
-	regmap_field_write(phy->fields[F_CTRLCLKEN], 0);
-}
-
-/*
- * TCLK values are OK at their reset values
- */
-#define TCLK_TERM	0
-#define TCLK_MISS	1
-#define TCLK_SETTLE	14
-
-static void cal_camerarx_config(struct cal_camerarx *phy, s64 external_rate,
-				const struct cal_fmt *fmt)
-{
-	unsigned int reg0, reg1;
-	unsigned int ths_term, ths_settle;
-	unsigned int csi2_ddrclk_khz;
-	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
-			&phy->endpoint.bus.mipi_csi2;
-	u32 num_lanes = mipi_csi2->num_data_lanes;
-
-	/* DPHY timing configuration */
-
-	/*
-	 * CSI-2 is DDR and we only count used lanes.
-	 *
-	 * csi2_ddrclk_khz = external_rate / 1000
-	 *		   / (2 * num_lanes) * fmt->bpp;
-	 */
-	csi2_ddrclk_khz = div_s64(external_rate * fmt->bpp,
-				  2 * num_lanes * 1000);
-
-	phy_dbg(1, phy, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
-
-	/* THS_TERM: Programmed value = floor(20 ns/DDRClk period) */
-	ths_term = 20 * csi2_ddrclk_khz / 1000000;
-	phy_dbg(1, phy, "ths_term: %d (0x%02x)\n", ths_term, ths_term);
-
-	/* THS_SETTLE: Programmed value = floor(105 ns/DDRClk period) + 4 */
-	ths_settle = (105 * csi2_ddrclk_khz / 1000000) + 4;
-	phy_dbg(1, phy, "ths_settle: %d (0x%02x)\n", ths_settle, ths_settle);
-
-	reg0 = camerarx_read(phy, CAL_CSI2_PHY_REG0);
-	cal_set_field(&reg0, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
-		      CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_MASK);
-	cal_set_field(&reg0, ths_term, CAL_CSI2_PHY_REG0_THS_TERM_MASK);
-	cal_set_field(&reg0, ths_settle, CAL_CSI2_PHY_REG0_THS_SETTLE_MASK);
-
-	phy_dbg(1, phy, "CSI2_%d_REG0 = 0x%08x\n", phy->instance, reg0);
-	camerarx_write(phy, CAL_CSI2_PHY_REG0, reg0);
-
-	reg1 = camerarx_read(phy, CAL_CSI2_PHY_REG1);
-	cal_set_field(&reg1, TCLK_TERM, CAL_CSI2_PHY_REG1_TCLK_TERM_MASK);
-	cal_set_field(&reg1, 0xb8, CAL_CSI2_PHY_REG1_DPHY_HS_SYNC_PATTERN_MASK);
-	cal_set_field(&reg1, TCLK_MISS,
-		      CAL_CSI2_PHY_REG1_CTRLCLK_DIV_FACTOR_MASK);
-	cal_set_field(&reg1, TCLK_SETTLE, CAL_CSI2_PHY_REG1_TCLK_SETTLE_MASK);
-
-	phy_dbg(1, phy, "CSI2_%d_REG1 = 0x%08x\n", phy->instance, reg1);
-	camerarx_write(phy, CAL_CSI2_PHY_REG1, reg1);
-}
-
-static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
-{
-	u32 target_state;
-	unsigned int i;
-
-	target_state = enable ? CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON :
-		       CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF;
-
-	cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
-			target_state, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
-
-	for (i = 0; i < 10; i++) {
-		u32 current_state;
-
-		current_state = cal_read_field(phy->cal,
-					       CAL_CSI2_COMPLEXIO_CFG(phy->instance),
-					       CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK);
-
-		if (current_state == target_state)
-			break;
-
-		usleep_range(1000, 1100);
-	}
-
-	if (i == 10)
-		phy_err(phy, "Failed to power %s complexio\n",
-			enable ? "up" : "down");
-}
-
-static void cal_camerarx_wait_reset(struct cal_camerarx *phy)
-{
-	unsigned long timeout;
-
-	timeout = jiffies + msecs_to_jiffies(750);
-	while (time_before(jiffies, timeout)) {
-		if (cal_read_field(phy->cal,
-				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
-				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
-		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
-			break;
-		usleep_range(500, 5000);
-	}
-
-	if (cal_read_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
-			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
-			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
-		phy_err(phy, "Timeout waiting for Complex IO reset done\n");
-}
-
-static void cal_camerarx_wait_stop_state(struct cal_camerarx *phy)
-{
-	unsigned long timeout;
-
-	timeout = jiffies + msecs_to_jiffies(750);
-	while (time_before(jiffies, timeout)) {
-		if (cal_read_field(phy->cal,
-				   CAL_CSI2_TIMING(phy->instance),
-				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
-			break;
-		usleep_range(500, 5000);
-	}
-
-	if (cal_read_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
-			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
-		phy_err(phy, "Timeout waiting for stop state\n");
-}
-
-int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt)
-{
-	s64 external_rate;
-	u32 sscounter;
-	u32 val;
-	int ret;
-
-	external_rate = cal_camerarx_get_external_rate(phy);
-	if (external_rate < 0)
-		return external_rate;
-
-	ret = v4l2_subdev_call(phy->sensor, core, s_power, 1);
-	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
-		phy_err(phy, "power on failed in subdev\n");
-		return ret;
-	}
-
-	/*
-	 * CSI-2 PHY Link Initialization Sequence, according to the DRA74xP /
-	 * DRA75xP / DRA76xP / DRA77xP TRM. The DRA71x / DRA72x and the AM65x /
-	 * DRA80xM TRMs have a a slightly simplified sequence.
-	 */
-
-	/*
-	 * 1. Configure all CSI-2 low level protocol registers to be ready to
-	 *    receive signals/data from the CSI-2 PHY.
-	 *
-	 *    i.-v. Configure the lanes position and polarity.
-	 */
-	cal_camerarx_lane_config(phy);
-
-	/*
-	 *    vi.-vii. Configure D-PHY mode, enable the required lanes and
-	 *             enable the CAMERARX clock.
-	 */
-	cal_camerarx_enable(phy);
-
-	/*
-	 * 2. CSI PHY and link initialization sequence.
-	 *
-	 *    a. Deassert the CSI-2 PHY reset. Do not wait for reset completion
-	 *       at this point, as it requires the external sensor to send the
-	 *       CSI-2 HS clock.
-	 */
-	cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
-			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
-			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
-	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x De-assert Complex IO Reset\n",
-		phy->instance,
-		cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)));
-
-	/* Dummy read to allow SCP reset to complete. */
-	camerarx_read(phy, CAL_CSI2_PHY_REG0);
-
-	/* Program the PHY timing parameters. */
-	cal_camerarx_config(phy, external_rate, fmt);
-
-	/*
-	 *    b. Assert the FORCERXMODE signal.
-	 *
-	 * The stop-state-counter is based on fclk cycles, and we always use
-	 * the x16 and x4 settings, so stop-state-timeout =
-	 * fclk-cycle * 16 * 4 * counter.
-	 *
-	 * Stop-state-timeout must be more than 100us as per CSI-2 spec, so we
-	 * calculate a timeout that's 100us (rounding up).
-	 */
-	sscounter = DIV_ROUND_UP(clk_get_rate(phy->cal->fclk), 10000 *  16 * 4);
-
-	val = cal_read(phy->cal, CAL_CSI2_TIMING(phy->instance));
-	cal_set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
-	cal_set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
-	cal_set_field(&val, sscounter,
-		      CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
-	cal_write(phy->cal, CAL_CSI2_TIMING(phy->instance), val);
-	phy_dbg(3, phy, "CAL_CSI2_TIMING(%d) = 0x%08x Stop States\n",
-		phy->instance,
-		cal_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
-
-	/* Assert the FORCERXMODE signal. */
-	cal_write_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
-			1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
-	phy_dbg(3, phy, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
-		phy->instance,
-		cal_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
-
-	/*
-	 * c. Connect pull-down on CSI-2 PHY link (using pad control).
-	 *
-	 * This is not required on DRA71x, DRA72x, AM65x and DRA80xM. Not
-	 * implemented.
-	 */
-
-	/*
-	 * d. Power up the CSI-2 PHY.
-	 * e. Check whether the state status reaches the ON state.
-	 */
-	cal_camerarx_power(phy, true);
-
-	/*
-	 * Start the sensor to enable the CSI-2 HS clock. We can now wait for
-	 * CSI-2 PHY reset to complete.
-	 */
-	ret = v4l2_subdev_call(phy->sensor, video, s_stream, 1);
-	if (ret) {
-		v4l2_subdev_call(phy->sensor, core, s_power, 0);
-		phy_err(phy, "stream on failed in subdev\n");
-		return ret;
-	}
-
-	cal_camerarx_wait_reset(phy);
-
-	/* f. Wait for STOPSTATE=1 for all enabled lane modules. */
-	cal_camerarx_wait_stop_state(phy);
-
-	phy_dbg(1, phy, "CSI2_%u_REG1 = 0x%08x (bits 31-28 should be set)\n",
-		phy->instance, camerarx_read(phy, CAL_CSI2_PHY_REG1));
-
-	/*
-	 * g. Disable pull-down on CSI-2 PHY link (using pad control).
-	 *
-	 * This is not required on DRA71x, DRA72x, AM65x and DRA80xM. Not
-	 * implemented.
-	 */
-
-	return 0;
-}
-
-void cal_camerarx_stop(struct cal_camerarx *phy)
-{
-	unsigned int i;
-	int ret;
-
-	cal_camerarx_power(phy, false);
-
-	/* Assert Complex IO Reset */
-	cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
-			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
-			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
-
-	/* Wait for power down completion */
-	for (i = 0; i < 10; i++) {
-		if (cal_read_field(phy->cal,
-				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
-				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
-		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)
-			break;
-		usleep_range(1000, 1100);
-	}
-	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO in Reset (%d) %s\n",
-		phy->instance,
-		cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)), i,
-		(i >= 10) ? "(timeout)" : "");
-
-	/* Disable the phy */
-	cal_camerarx_disable(phy);
-
-	if (v4l2_subdev_call(phy->sensor, video, s_stream, 0))
-		phy_err(phy, "stream off failed in subdev\n");
-
-	ret = v4l2_subdev_call(phy->sensor, core, s_power, 0);
-	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
-		phy_err(phy, "power off failed in subdev\n");
-}
-
-/*
- *   Errata i913: CSI2 LDO Needs to be disabled when module is powered on
- *
- *   Enabling CSI2 LDO shorts it to core supply. It is crucial the 2 CSI2
- *   LDOs on the device are disabled if CSI-2 module is powered on
- *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x1) or in ULPS (0x4845 B304
- *   | 0x4845 B384 [28:27] = 0x2) mode. Common concerns include: high
- *   current draw on the module supply in active mode.
- *
- *   Errata does not apply when CSI-2 module is powered off
- *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x0).
- *
- * SW Workaround:
- *	Set the following register bits to disable the LDO,
- *	which is essentially CSI2 REG10 bit 6:
- *
- *		Core 0:  0x4845 B828 = 0x0000 0040
- *		Core 1:  0x4845 B928 = 0x0000 0040
- */
-static void cal_camerarx_i913_errata(struct cal_camerarx *phy)
-{
-	u32 reg10 = camerarx_read(phy, CAL_CSI2_PHY_REG10);
-
-	cal_set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
-
-	phy_dbg(1, phy, "CSI2_%d_REG10 = 0x%08x\n", phy->instance, reg10);
-	camerarx_write(phy, CAL_CSI2_PHY_REG10, reg10);
-}
-
-/*
- * Enable the expected IRQ sources
- */
-void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
-{
-	u32 val;
-
-	const u32 cio_err_mask =
-		CAL_CSI2_COMPLEXIO_IRQ_LANE_ERRORS_MASK |
-		CAL_CSI2_COMPLEXIO_IRQ_FIFO_OVR_MASK |
-		CAL_CSI2_COMPLEXIO_IRQ_SHORT_PACKET_MASK |
-		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
-
-	/* Enable CIO error irqs */
-	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
-		  CAL_HL_IRQ_CIO_MASK(phy->instance));
-	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
-		  cio_err_mask);
-
-	/* Always enable OCPO error */
-	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
-
-	/* Enable IRQ_WDMA_END 0/1 */
-	val = 0;
-	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(1), val);
-	/* Enable IRQ_WDMA_START 0/1 */
-	val = 0;
-	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(2), val);
-	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
-}
-
-void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
-{
-	u32 val;
-
-	/* Disable CIO error irqs */
-	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(0),
-		  CAL_HL_IRQ_CIO_MASK(phy->instance));
-	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
-		  0);
-
-	/* Disable IRQ_WDMA_END 0/1 */
-	val = 0;
-	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(1), val);
-	/* Disable IRQ_WDMA_START 0/1 */
-	val = 0;
-	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(2), val);
-	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0);
-}
-
-void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
-{
-	cal_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance), BIT(3));
-	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
-			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
-}
-
-void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
-{
-	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
-			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
-}
-
-static int cal_camerarx_regmap_init(struct cal_dev *cal,
-				    struct cal_camerarx *phy)
-{
-	const struct cal_camerarx_data *phy_data;
-	unsigned int i;
-
-	if (!cal->data)
-		return -EINVAL;
-
-	phy_data = &cal->data->camerarx[phy->instance];
-
-	for (i = 0; i < F_MAX_FIELDS; i++) {
-		struct reg_field field = {
-			.reg = cal->syscon_camerrx_offset,
-			.lsb = phy_data->fields[i].lsb,
-			.msb = phy_data->fields[i].msb,
-		};
-
-		/*
-		 * Here we update the reg offset with the
-		 * value found in DT
-		 */
-		phy->fields[i] = devm_regmap_field_alloc(cal->dev,
-							 cal->syscon_camerrx,
-							 field);
-		if (IS_ERR(phy->fields[i])) {
-			cal_err(cal, "Unable to allocate regmap fields\n");
-			return PTR_ERR(phy->fields[i]);
-		}
-	}
-
-	return 0;
-}
-
-static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
-{
-	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
-	struct device_node *ep_node;
-	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
-	unsigned int i;
-	int ret;
-
-	/*
-	 * Find the endpoint node for the port corresponding to the PHY
-	 * instance, and parse its CSI-2-related properties.
-	 */
-	ep_node = of_graph_get_endpoint_by_regs(phy->cal->dev->of_node,
-						phy->instance, 0);
-	if (!ep_node) {
-		/*
-		 * The endpoint is not mandatory, not all PHY instances need to
-		 * be connected in DT.
-		 */
-		phy_dbg(3, phy, "Port has no endpoint\n");
-		return 0;
-	}
-
-	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), endpoint);
-	if (ret < 0) {
-		phy_err(phy, "Failed to parse endpoint\n");
-		goto done;
-	}
-
-	for (i = 0; i < endpoint->bus.mipi_csi2.num_data_lanes; i++) {
-		unsigned int lane = endpoint->bus.mipi_csi2.data_lanes[i];
-
-		if (lane > 4) {
-			phy_err(phy, "Invalid position %u for data lane %u\n",
-				lane, i);
-			ret = -EINVAL;
-			goto done;
-		}
-
-		data_lanes[i*2] = '0' + lane;
-		data_lanes[i*2+1] = ' ';
-	}
-
-	data_lanes[i*2-1] = '\0';
-
-	phy_dbg(3, phy,
-		"CSI-2 bus: clock lane <%u>, data lanes <%s>, flags 0x%08x\n",
-		endpoint->bus.mipi_csi2.clock_lane, data_lanes,
-		endpoint->bus.mipi_csi2.flags);
-
-	/* Retrieve the connected device and store it for later use. */
-	phy->sensor_node = of_graph_get_remote_port_parent(ep_node);
-	if (!phy->sensor_node) {
-		phy_dbg(3, phy, "Can't get remote parent\n");
-		ret = -EINVAL;
-		goto done;
-	}
-
-	phy_dbg(1, phy, "Found connected device %pOFn\n", phy->sensor_node);
-
-done:
-	of_node_put(ep_node);
-	return ret;
-}
-
-static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
-						unsigned int instance)
-{
-	struct platform_device *pdev = to_platform_device(cal->dev);
-	struct cal_camerarx *phy;
-	int ret;
-
-	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
-	if (!phy)
-		return ERR_PTR(-ENOMEM);
-
-	phy->cal = cal;
-	phy->instance = instance;
-
-	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						(instance == 0) ?
-						"cal_rx_core0" :
-						"cal_rx_core1");
-	phy->base = devm_ioremap_resource(cal->dev, phy->res);
-	if (IS_ERR(phy->base)) {
-		cal_err(cal, "failed to ioremap\n");
-		ret = PTR_ERR(phy->base);
-		goto error;
-	}
-
-	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
-		phy->res->name, &phy->res->start, &phy->res->end);
-
-	ret = cal_camerarx_regmap_init(cal, phy);
-	if (ret)
-		goto error;
-
-	ret = cal_camerarx_parse_dt(phy);
-	if (ret)
-		goto error;
-
-	return phy;
-
-error:
-	kfree(phy);
-	return ERR_PTR(ret);
-}
-
-static void cal_camerarx_destroy(struct cal_camerarx *phy)
-{
-	if (!phy)
-		return;
-
-	of_node_put(phy->sensor_node);
-	kfree(phy);
-}
-
-static int cal_camerarx_init_regmap(struct cal_dev *cal)
-{
-	struct platform_device *pdev = to_platform_device(cal->dev);
-	struct device_node *np = cal->dev->of_node;
-	struct regmap_config config = { };
-	struct regmap *syscon;
-	struct resource *res;
-	unsigned int offset;
-	void __iomem *base;
-
-	syscon = syscon_regmap_lookup_by_phandle_args(np, "ti,camerrx-control",
-						      1, &offset);
-	if (!IS_ERR(syscon)) {
-		cal->syscon_camerrx = syscon;
-		cal->syscon_camerrx_offset = offset;
-		return 0;
-	}
-
-	dev_warn(cal->dev, "failed to get ti,camerrx-control: %ld\n",
-		 PTR_ERR(syscon));
-
-	/*
-	 * Backward DTS compatibility. If syscon entry is not present then
-	 * check if the camerrx_control resource is present.
-	 */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-					   "camerrx_control");
-	base = devm_ioremap_resource(cal->dev, res);
-	if (IS_ERR(base)) {
-		cal_err(cal, "failed to ioremap camerrx_control\n");
-		return PTR_ERR(base);
-	}
-
-	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
-		res->name, &res->start, &res->end);
-
-	config.reg_bits = 32;
-	config.reg_stride = 4;
-	config.val_bits = 32;
-	config.max_register = resource_size(res) - 4;
-
-	syscon = regmap_init_mmio(NULL, base, &config);
-	if (IS_ERR(syscon)) {
-		pr_err("regmap init failed\n");
-		return PTR_ERR(syscon);
-	}
-
-	/*
-	 * In this case the base already point to the direct CM register so no
-	 * need for an offset.
-	 */
-	cal->syscon_camerrx = syscon;
-	cal->syscon_camerrx_offset = 0;
-
-	return 0;
-}
-
 /* ------------------------------------------------------------------
  *	Context Management
  * ------------------------------------------------------------------
@@ -1362,6 +682,63 @@ static void cal_get_hwinfo(struct cal_dev *cal)
 			 hwinfo, CAL_HL_HWINFO_VALUE);
 }
 
+static int cal_init_camerarx_regmap(struct cal_dev *cal)
+{
+	struct platform_device *pdev = to_platform_device(cal->dev);
+	struct device_node *np = cal->dev->of_node;
+	struct regmap_config config = { };
+	struct regmap *syscon;
+	struct resource *res;
+	unsigned int offset;
+	void __iomem *base;
+
+	syscon = syscon_regmap_lookup_by_phandle_args(np, "ti,camerrx-control",
+						      1, &offset);
+	if (!IS_ERR(syscon)) {
+		cal->syscon_camerrx = syscon;
+		cal->syscon_camerrx_offset = offset;
+		return 0;
+	}
+
+	dev_warn(cal->dev, "failed to get ti,camerrx-control: %ld\n",
+		 PTR_ERR(syscon));
+
+	/*
+	 * Backward DTS compatibility. If syscon entry is not present then
+	 * check if the camerrx_control resource is present.
+	 */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					   "camerrx_control");
+	base = devm_ioremap_resource(cal->dev, res);
+	if (IS_ERR(base)) {
+		cal_err(cal, "failed to ioremap camerrx_control\n");
+		return PTR_ERR(base);
+	}
+
+	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
+		res->name, &res->start, &res->end);
+
+	config.reg_bits = 32;
+	config.reg_stride = 4;
+	config.val_bits = 32;
+	config.max_register = resource_size(res) - 4;
+
+	syscon = regmap_init_mmio(NULL, base, &config);
+	if (IS_ERR(syscon)) {
+		pr_err("regmap init failed\n");
+		return PTR_ERR(syscon);
+	}
+
+	/*
+	 * In this case the base already point to the direct CM register so no
+	 * need for an offset.
+	 */
+	cal->syscon_camerrx = syscon;
+	cal->syscon_camerrx_offset = 0;
+
+	return 0;
+}
+
 static int cal_probe(struct platform_device *pdev)
 {
 	struct cal_dev *cal;
@@ -1391,7 +768,7 @@ static int cal_probe(struct platform_device *pdev)
 		return PTR_ERR(cal->fclk);
 	}
 
-	ret = cal_camerarx_init_regmap(cal);
+	ret = cal_init_camerarx_regmap(cal);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 44f2836b6543..e496083715d2 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -241,12 +241,17 @@ static inline void cal_set_field(u32 *valp, u32 field, u32 mask)
 
 void cal_quickdump_regs(struct cal_dev *cal);
 
+void cal_camerarx_disable(struct cal_camerarx *phy);
 int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt);
 void cal_camerarx_stop(struct cal_camerarx *phy);
 void cal_camerarx_enable_irqs(struct cal_camerarx *phy);
 void cal_camerarx_disable_irqs(struct cal_camerarx *phy);
 void cal_camerarx_ppi_enable(struct cal_camerarx *phy);
 void cal_camerarx_ppi_disable(struct cal_camerarx *phy);
+void cal_camerarx_i913_errata(struct cal_camerarx *phy);
+struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
+					 unsigned int instance);
+void cal_camerarx_destroy(struct cal_camerarx *phy);
 
 void cal_ctx_csi2_config(struct cal_ctx *ctx);
 void cal_ctx_pix_proc_config(struct cal_ctx *ctx);
-- 
Regards,

Laurent Pinchart

