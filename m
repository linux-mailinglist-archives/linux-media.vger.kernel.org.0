Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7203215EC2
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730004AbgGFSix (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729995AbgGFSiw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:52 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0607D2157;
        Mon,  6 Jul 2020 20:38:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060700;
        bh=TSodsY+Sw+rZSbKuBX4lz0Z/XxfwmUvuPv6RWyCyOgY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ELLQCcOOMildq3SwEtNw1sFDqUZDFoD+u94eOv+wulMiMq+f/wkv0kr0IZkphm6HQ
         eTUl6c6R1Is5lzXNoMbP56OqSZNJar1ldE9u3JN7JjeLs+yryfuQgBypSJDQC0Bb0H
         DzGdkaLksuMS28sPWWNsoOl30udbW+bVCE8/OImE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 083/108] media: ti-vpe: cal: Move CAL I/O accessors to cal.h
Date:   Mon,  6 Jul 2020 21:36:44 +0300
Message-Id: <20200706183709.12238-84-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for the split of the camerarx code to a separate file, move
the CAL I/O accessors to cal.h. This requires renaming the accessors
with a cal_prefix, as the current names are too generic and prone to
namespace clashes.

The reg_read() and read_write() macros, that cover both CAL and CAMERARX
register access, are split in two groups of inline functions, one for
CAL access and one for CAMERARX access.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c |   1 -
 drivers/media/platform/ti-vpe/cal.c       | 280 ++++++++++------------
 drivers/media/platform/ti-vpe/cal.h       |  36 +++
 3 files changed, 168 insertions(+), 149 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 82b32a2f9db5..df472a175e83 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -9,7 +9,6 @@
  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
-#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/ioctl.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e81c8507893b..c2252ed36d68 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -9,11 +9,9 @@
  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
-#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -133,33 +131,6 @@ static const struct cal_data am654_cal_data = {
  * ------------------------------------------------------------------
  */
 
-#define reg_read(dev, offset) ioread32(dev->base + offset)
-#define reg_write(dev, offset, val) iowrite32(val, dev->base + offset)
-
-static inline u32 reg_read_field(struct cal_dev *cal, u32 offset, u32 mask)
-{
-	return FIELD_GET(mask, reg_read(cal, offset));
-}
-
-static inline void reg_write_field(struct cal_dev *cal, u32 offset, u32 value,
-				   u32 mask)
-{
-	u32 val = reg_read(cal, offset);
-
-	val &= ~mask;
-	val |= FIELD_PREP(mask, value);
-	reg_write(cal, offset, val);
-}
-
-static inline void set_field(u32 *valp, u32 field, u32 mask)
-{
-	u32 val = *valp;
-
-	val &= ~mask;
-	val |= (field << __ffs(mask)) & mask;
-	*valp = val;
-}
-
 void cal_quickdump_regs(struct cal_dev *cal)
 {
 	unsigned int i;
@@ -189,6 +160,16 @@ void cal_quickdump_regs(struct cal_dev *cal)
  * ------------------------------------------------------------------
  */
 
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
 static s64 cal_camerarx_get_external_rate(struct cal_camerarx *phy)
 {
 	struct v4l2_ctrl *ctrl;
@@ -209,15 +190,15 @@ static s64 cal_camerarx_get_external_rate(struct cal_camerarx *phy)
 
 static void cal_camerarx_lane_config(struct cal_camerarx *phy)
 {
-	u32 val = reg_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance));
+	u32 val = cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance));
 	u32 lane_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POSITION_MASK;
 	u32 polarity_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POL_MASK;
 	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
 		&phy->endpoint.bus.mipi_csi2;
 	int lane;
 
-	set_field(&val, mipi_csi2->clock_lane + 1, lane_mask);
-	set_field(&val, mipi_csi2->lane_polarities[0], polarity_mask);
+	cal_set_field(&val, mipi_csi2->clock_lane + 1, lane_mask);
+	cal_set_field(&val, mipi_csi2->lane_polarities[0], polarity_mask);
 	for (lane = 0; lane < mipi_csi2->num_data_lanes; lane++) {
 		/*
 		 * Every lane are one nibble apart starting with the
@@ -225,12 +206,12 @@ static void cal_camerarx_lane_config(struct cal_camerarx *phy)
 		 */
 		lane_mask <<= 4;
 		polarity_mask <<= 4;
-		set_field(&val, mipi_csi2->data_lanes[lane] + 1, lane_mask);
-		set_field(&val, mipi_csi2->lane_polarities[lane + 1],
-			  polarity_mask);
+		cal_set_field(&val, mipi_csi2->data_lanes[lane] + 1, lane_mask);
+		cal_set_field(&val, mipi_csi2->lane_polarities[lane + 1],
+			      polarity_mask);
 	}
 
-	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance), val);
+	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance), val);
 	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x\n",
 		phy->instance, val);
 }
@@ -291,23 +272,24 @@ static void cal_camerarx_config(struct cal_camerarx *phy, s64 external_rate,
 	ths_settle = (105 * csi2_ddrclk_khz / 1000000) + 4;
 	phy_dbg(1, phy, "ths_settle: %d (0x%02x)\n", ths_settle, ths_settle);
 
-	reg0 = reg_read(phy, CAL_CSI2_PHY_REG0);
-	set_field(&reg0, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
-		  CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_MASK);
-	set_field(&reg0, ths_term, CAL_CSI2_PHY_REG0_THS_TERM_MASK);
-	set_field(&reg0, ths_settle, CAL_CSI2_PHY_REG0_THS_SETTLE_MASK);
+	reg0 = camerarx_read(phy, CAL_CSI2_PHY_REG0);
+	cal_set_field(&reg0, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
+		      CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_MASK);
+	cal_set_field(&reg0, ths_term, CAL_CSI2_PHY_REG0_THS_TERM_MASK);
+	cal_set_field(&reg0, ths_settle, CAL_CSI2_PHY_REG0_THS_SETTLE_MASK);
 
 	phy_dbg(1, phy, "CSI2_%d_REG0 = 0x%08x\n", phy->instance, reg0);
-	reg_write(phy, CAL_CSI2_PHY_REG0, reg0);
+	camerarx_write(phy, CAL_CSI2_PHY_REG0, reg0);
 
-	reg1 = reg_read(phy, CAL_CSI2_PHY_REG1);
-	set_field(&reg1, TCLK_TERM, CAL_CSI2_PHY_REG1_TCLK_TERM_MASK);
-	set_field(&reg1, 0xb8, CAL_CSI2_PHY_REG1_DPHY_HS_SYNC_PATTERN_MASK);
-	set_field(&reg1, TCLK_MISS, CAL_CSI2_PHY_REG1_CTRLCLK_DIV_FACTOR_MASK);
-	set_field(&reg1, TCLK_SETTLE, CAL_CSI2_PHY_REG1_TCLK_SETTLE_MASK);
+	reg1 = camerarx_read(phy, CAL_CSI2_PHY_REG1);
+	cal_set_field(&reg1, TCLK_TERM, CAL_CSI2_PHY_REG1_TCLK_TERM_MASK);
+	cal_set_field(&reg1, 0xb8, CAL_CSI2_PHY_REG1_DPHY_HS_SYNC_PATTERN_MASK);
+	cal_set_field(&reg1, TCLK_MISS,
+		      CAL_CSI2_PHY_REG1_CTRLCLK_DIV_FACTOR_MASK);
+	cal_set_field(&reg1, TCLK_SETTLE, CAL_CSI2_PHY_REG1_TCLK_SETTLE_MASK);
 
 	phy_dbg(1, phy, "CSI2_%d_REG1 = 0x%08x\n", phy->instance, reg1);
-	reg_write(phy, CAL_CSI2_PHY_REG1, reg1);
+	camerarx_write(phy, CAL_CSI2_PHY_REG1, reg1);
 }
 
 static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
@@ -318,13 +300,13 @@ static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
 	target_state = enable ? CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON :
 		       CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF;
 
-	reg_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+	cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 			target_state, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
 
 	for (i = 0; i < 10; i++) {
 		u32 current_state;
 
-		current_state = reg_read_field(phy->cal,
+		current_state = cal_read_field(phy->cal,
 					       CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 					       CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK);
 
@@ -345,7 +327,7 @@ static void cal_camerarx_wait_reset(struct cal_camerarx *phy)
 
 	timeout = jiffies + msecs_to_jiffies(750);
 	while (time_before(jiffies, timeout)) {
-		if (reg_read_field(phy->cal,
+		if (cal_read_field(phy->cal,
 				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
 		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
@@ -353,7 +335,7 @@ static void cal_camerarx_wait_reset(struct cal_camerarx *phy)
 		usleep_range(500, 5000);
 	}
 
-	if (reg_read_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+	if (cal_read_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
 			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
 		phy_err(phy, "Timeout waiting for Complex IO reset done\n");
@@ -365,14 +347,14 @@ static void cal_camerarx_wait_stop_state(struct cal_camerarx *phy)
 
 	timeout = jiffies + msecs_to_jiffies(750);
 	while (time_before(jiffies, timeout)) {
-		if (reg_read_field(phy->cal,
+		if (cal_read_field(phy->cal,
 				   CAL_CSI2_TIMING(phy->instance),
 				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
 			break;
 		usleep_range(500, 5000);
 	}
 
-	if (reg_read_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
+	if (cal_read_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
 			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
 		phy_err(phy, "Timeout waiting for stop state\n");
 }
@@ -421,15 +403,15 @@ int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt)
 	 *       at this point, as it requires the external sensor to send the
 	 *       CSI-2 HS clock.
 	 */
-	reg_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+	cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
 	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x De-assert Complex IO Reset\n",
 		phy->instance,
-		reg_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)));
+		cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)));
 
 	/* Dummy read to allow SCP reset to complete. */
-	reg_read(phy, CAL_CSI2_PHY_REG0);
+	camerarx_read(phy, CAL_CSI2_PHY_REG0);
 
 	/* Program the PHY timing parameters. */
 	cal_camerarx_config(phy, external_rate, fmt);
@@ -446,21 +428,22 @@ int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt)
 	 */
 	sscounter = DIV_ROUND_UP(clk_get_rate(phy->cal->fclk), 10000 *  16 * 4);
 
-	val = reg_read(phy->cal, CAL_CSI2_TIMING(phy->instance));
-	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
-	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
-	set_field(&val, sscounter, CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
-	reg_write(phy->cal, CAL_CSI2_TIMING(phy->instance), val);
+	val = cal_read(phy->cal, CAL_CSI2_TIMING(phy->instance));
+	cal_set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
+	cal_set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
+	cal_set_field(&val, sscounter,
+		      CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
+	cal_write(phy->cal, CAL_CSI2_TIMING(phy->instance), val);
 	phy_dbg(3, phy, "CAL_CSI2_TIMING(%d) = 0x%08x Stop States\n",
 		phy->instance,
-		reg_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
+		cal_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
 
 	/* Assert the FORCERXMODE signal. */
-	reg_write_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
+	cal_write_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
 			1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
 	phy_dbg(3, phy, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
 		phy->instance,
-		reg_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
+		cal_read(phy->cal, CAL_CSI2_TIMING(phy->instance)));
 
 	/*
 	 * c. Connect pull-down on CSI-2 PHY link (using pad control).
@@ -492,7 +475,7 @@ int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt)
 	cal_camerarx_wait_stop_state(phy);
 
 	phy_dbg(1, phy, "CSI2_%u_REG1 = 0x%08x (bits 31-28 should be set)\n",
-		phy->instance, reg_read(phy, CAL_CSI2_PHY_REG1));
+		phy->instance, camerarx_read(phy, CAL_CSI2_PHY_REG1));
 
 	/*
 	 * g. Disable pull-down on CSI-2 PHY link (using pad control).
@@ -512,13 +495,13 @@ void cal_camerarx_stop(struct cal_camerarx *phy)
 	cal_camerarx_power(phy, false);
 
 	/* Assert Complex IO Reset */
-	reg_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+	cal_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
 
 	/* Wait for power down completion */
 	for (i = 0; i < 10; i++) {
-		if (reg_read_field(phy->cal,
+		if (cal_read_field(phy->cal,
 				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
 				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
 		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)
@@ -527,7 +510,7 @@ void cal_camerarx_stop(struct cal_camerarx *phy)
 	}
 	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO in Reset (%d) %s\n",
 		phy->instance,
-		reg_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)), i,
+		cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance)), i,
 		(i >= 10) ? "(timeout)" : "");
 
 	/* Disable the phy */
@@ -562,12 +545,12 @@ void cal_camerarx_stop(struct cal_camerarx *phy)
  */
 static void cal_camerarx_i913_errata(struct cal_camerarx *phy)
 {
-	u32 reg10 = reg_read(phy, CAL_CSI2_PHY_REG10);
+	u32 reg10 = camerarx_read(phy, CAL_CSI2_PHY_REG10);
 
-	set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
+	cal_set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
 
 	phy_dbg(1, phy, "CSI2_%d_REG10 = 0x%08x\n", phy->instance, reg10);
-	reg_write(phy, CAL_CSI2_PHY_REG10, reg10);
+	camerarx_write(phy, CAL_CSI2_PHY_REG10, reg10);
 }
 
 /*
@@ -584,24 +567,24 @@ void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
 		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
 
 	/* Enable CIO error irqs */
-	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
+	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
 		  CAL_HL_IRQ_CIO_MASK(phy->instance));
-	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
+	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
 		  cio_err_mask);
 
 	/* Always enable OCPO error */
-	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
+	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
 
 	/* Enable IRQ_WDMA_END 0/1 */
 	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(1), val);
+	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(1), val);
 	/* Enable IRQ_WDMA_START 0/1 */
 	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(2), val);
+	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(2), val);
 	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	reg_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
+	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
 }
 
 void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
@@ -609,33 +592,33 @@ void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
 	u32 val;
 
 	/* Disable CIO error irqs */
-	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(0),
+	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(0),
 		  CAL_HL_IRQ_CIO_MASK(phy->instance));
-	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
+	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
 		  0);
 
 	/* Disable IRQ_WDMA_END 0/1 */
 	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(1), val);
+	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(1), val);
 	/* Disable IRQ_WDMA_START 0/1 */
 	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(2), val);
+	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(2), val);
 	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	reg_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0);
+	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0);
 }
 
 void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
 {
-	reg_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance), BIT(3));
-	reg_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
+	cal_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance), BIT(3));
+	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
 			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
 void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
 {
-	reg_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
+	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
 			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
@@ -857,8 +840,8 @@ void cal_ctx_csi2_config(struct cal_ctx *ctx)
 {
 	u32 val;
 
-	val = reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->index));
-	set_field(&val, ctx->cport, CAL_CSI2_CTX_CPORT_MASK);
+	val = cal_read(ctx->cal, CAL_CSI2_CTX0(ctx->index));
+	cal_set_field(&val, ctx->cport, CAL_CSI2_CTX_CPORT_MASK);
 	/*
 	 * DT type: MIPI CSI-2 Specs
 	 *   0x1: All - DT filter is disabled
@@ -867,15 +850,15 @@ void cal_ctx_csi2_config(struct cal_ctx *ctx)
 	 *  0x2A: RAW8   1 pixel  = 1 byte
 	 *  0x1E: YUV422 2 pixels = 4 bytes
 	 */
-	set_field(&val, 0x1, CAL_CSI2_CTX_DT_MASK);
-	set_field(&val, 0, CAL_CSI2_CTX_VC_MASK);
-	set_field(&val, ctx->v_fmt.fmt.pix.height, CAL_CSI2_CTX_LINES_MASK);
-	set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
-	set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
-		  CAL_CSI2_CTX_PACK_MODE_MASK);
-	reg_write(ctx->cal, CAL_CSI2_CTX0(ctx->index), val);
+	cal_set_field(&val, 0x1, CAL_CSI2_CTX_DT_MASK);
+	cal_set_field(&val, 0, CAL_CSI2_CTX_VC_MASK);
+	cal_set_field(&val, ctx->v_fmt.fmt.pix.height, CAL_CSI2_CTX_LINES_MASK);
+	cal_set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
+	cal_set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
+		      CAL_CSI2_CTX_PACK_MODE_MASK);
+	cal_write(ctx->cal, CAL_CSI2_CTX0(ctx->index), val);
 	ctx_dbg(3, ctx, "CAL_CSI2_CTX0(%d) = 0x%08x\n", ctx->index,
-		reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->index)));
+		cal_read(ctx->cal, CAL_CSI2_CTX0(ctx->index)));
 }
 
 void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
@@ -917,16 +900,16 @@ void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 		break;
 	}
 
-	val = reg_read(ctx->cal, CAL_PIX_PROC(ctx->index));
-	set_field(&val, extract, CAL_PIX_PROC_EXTRACT_MASK);
-	set_field(&val, CAL_PIX_PROC_DPCMD_BYPASS, CAL_PIX_PROC_DPCMD_MASK);
-	set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
-	set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
-	set_field(&val, ctx->cport, CAL_PIX_PROC_CPORT_MASK);
-	set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
-	reg_write(ctx->cal, CAL_PIX_PROC(ctx->index), val);
+	val = cal_read(ctx->cal, CAL_PIX_PROC(ctx->index));
+	cal_set_field(&val, extract, CAL_PIX_PROC_EXTRACT_MASK);
+	cal_set_field(&val, CAL_PIX_PROC_DPCMD_BYPASS, CAL_PIX_PROC_DPCMD_MASK);
+	cal_set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
+	cal_set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
+	cal_set_field(&val, ctx->cport, CAL_PIX_PROC_CPORT_MASK);
+	cal_set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
+	cal_write(ctx->cal, CAL_PIX_PROC(ctx->index), val);
 	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->index,
-		reg_read(ctx->cal, CAL_PIX_PROC(ctx->index)));
+		cal_read(ctx->cal, CAL_PIX_PROC(ctx->index)));
 }
 
 void cal_ctx_wr_dma_config(struct cal_ctx *ctx, unsigned int width,
@@ -934,58 +917,59 @@ void cal_ctx_wr_dma_config(struct cal_ctx *ctx, unsigned int width,
 {
 	u32 val;
 
-	val = reg_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index));
-	set_field(&val, ctx->cport, CAL_WR_DMA_CTRL_CPORT_MASK);
-	set_field(&val, height, CAL_WR_DMA_CTRL_YSIZE_MASK);
-	set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
-		  CAL_WR_DMA_CTRL_DTAG_MASK);
-	set_field(&val, CAL_WR_DMA_CTRL_MODE_CONST,
-		  CAL_WR_DMA_CTRL_MODE_MASK);
-	set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
-		  CAL_WR_DMA_CTRL_PATTERN_MASK);
-	set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
-	reg_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->index), val);
+	val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index));
+	cal_set_field(&val, ctx->cport, CAL_WR_DMA_CTRL_CPORT_MASK);
+	cal_set_field(&val, height, CAL_WR_DMA_CTRL_YSIZE_MASK);
+	cal_set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
+		      CAL_WR_DMA_CTRL_DTAG_MASK);
+	cal_set_field(&val, CAL_WR_DMA_CTRL_MODE_CONST,
+		      CAL_WR_DMA_CTRL_MODE_MASK);
+	cal_set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
+		      CAL_WR_DMA_CTRL_PATTERN_MASK);
+	cal_set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
+	cal_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->index), val);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_CTRL(%d) = 0x%08x\n", ctx->index,
-		reg_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index)));
+		cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->index)));
 
 	/*
 	 * width/16 not sure but giving it a whirl.
 	 * zero does not work right
 	 */
-	reg_write_field(ctx->cal,
+	cal_write_field(ctx->cal,
 			CAL_WR_DMA_OFST(ctx->index),
 			(width / 16),
 			CAL_WR_DMA_OFST_MASK);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_OFST(%d) = 0x%08x\n", ctx->index,
-		reg_read(ctx->cal, CAL_WR_DMA_OFST(ctx->index)));
+		cal_read(ctx->cal, CAL_WR_DMA_OFST(ctx->index)));
 
-	val = reg_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index));
+	val = cal_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index));
 	/* 64 bit word means no skipping */
-	set_field(&val, 0, CAL_WR_DMA_XSIZE_XSKIP_MASK);
+	cal_set_field(&val, 0, CAL_WR_DMA_XSIZE_XSKIP_MASK);
 	/*
 	 * (width*8)/64 this should be size of an entire line
 	 * in 64bit word but 0 means all data until the end
 	 * is detected automagically
 	 */
-	set_field(&val, (width / 8), CAL_WR_DMA_XSIZE_MASK);
-	reg_write(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index), val);
+	cal_set_field(&val, (width / 8), CAL_WR_DMA_XSIZE_MASK);
+	cal_write(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index), val);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_XSIZE(%d) = 0x%08x\n", ctx->index,
-		reg_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index)));
+		cal_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index)));
 
-	val = reg_read(ctx->cal, CAL_CTRL);
-	set_field(&val, CAL_CTRL_BURSTSIZE_BURST128, CAL_CTRL_BURSTSIZE_MASK);
-	set_field(&val, 0xF, CAL_CTRL_TAGCNT_MASK);
-	set_field(&val, CAL_CTRL_POSTED_WRITES_NONPOSTED,
-		  CAL_CTRL_POSTED_WRITES_MASK);
-	set_field(&val, 0xFF, CAL_CTRL_MFLAGL_MASK);
-	set_field(&val, 0xFF, CAL_CTRL_MFLAGH_MASK);
-	reg_write(ctx->cal, CAL_CTRL, val);
-	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", reg_read(ctx->cal, CAL_CTRL));
+	val = cal_read(ctx->cal, CAL_CTRL);
+	cal_set_field(&val, CAL_CTRL_BURSTSIZE_BURST128,
+		      CAL_CTRL_BURSTSIZE_MASK);
+	cal_set_field(&val, 0xF, CAL_CTRL_TAGCNT_MASK);
+	cal_set_field(&val, CAL_CTRL_POSTED_WRITES_NONPOSTED,
+		      CAL_CTRL_POSTED_WRITES_MASK);
+	cal_set_field(&val, 0xFF, CAL_CTRL_MFLAGL_MASK);
+	cal_set_field(&val, 0xFF, CAL_CTRL_MFLAGH_MASK);
+	cal_write(ctx->cal, CAL_CTRL, val);
+	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", cal_read(ctx->cal, CAL_CTRL));
 }
 
 void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 {
-	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->index), dmaaddr);
+	cal_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->index), dmaaddr);
 }
 
 /* ------------------------------------------------------------------
@@ -1024,36 +1008,36 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	struct cal_dmaqueue *dma_q;
 	u32 status;
 
-	status = reg_read(cal, CAL_HL_IRQSTATUS(0));
+	status = cal_read(cal, CAL_HL_IRQSTATUS(0));
 	if (status) {
 		unsigned int i;
 
-		reg_write(cal, CAL_HL_IRQSTATUS(0), status);
+		cal_write(cal, CAL_HL_IRQSTATUS(0), status);
 
 		if (status & CAL_HL_IRQ_OCPO_ERR_MASK)
 			dev_err_ratelimited(cal->dev, "OCPO ERROR\n");
 
 		for (i = 0; i < CAL_NUM_CSI2_PORTS; ++i) {
 			if (status & CAL_HL_IRQ_CIO_MASK(i)) {
-				u32 cio_stat = reg_read(cal,
+				u32 cio_stat = cal_read(cal,
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
 
 				dev_err_ratelimited(cal->dev,
 						    "CIO%u error: %#08x\n", i, cio_stat);
 
-				reg_write(cal, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
+				cal_write(cal, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
 					  cio_stat);
 			}
 		}
 	}
 
 	/* Check which DMA just finished */
-	status = reg_read(cal, CAL_HL_IRQSTATUS(1));
+	status = cal_read(cal, CAL_HL_IRQSTATUS(1));
 	if (status) {
 		unsigned int i;
 
 		/* Clear Interrupt status */
-		reg_write(cal, CAL_HL_IRQSTATUS(1), status);
+		cal_write(cal, CAL_HL_IRQSTATUS(1), status);
 
 		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
 			if (status & CAL_HL_IRQ_MASK(i)) {
@@ -1071,12 +1055,12 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	}
 
 	/* Check which DMA just started */
-	status = reg_read(cal, CAL_HL_IRQSTATUS(2));
+	status = cal_read(cal, CAL_HL_IRQSTATUS(2));
 	if (status) {
 		unsigned int i;
 
 		/* Clear Interrupt status */
-		reg_write(cal, CAL_HL_IRQSTATUS(2), status);
+		cal_write(cal, CAL_HL_IRQSTATUS(2), status);
 
 		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
 			if (status & CAL_HL_IRQ_MASK(i)) {
@@ -1355,7 +1339,7 @@ static void cal_get_hwinfo(struct cal_dev *cal)
 {
 	u32 hwinfo;
 
-	cal->revision = reg_read(cal, CAL_HL_REVISION);
+	cal->revision = cal_read(cal, CAL_HL_REVISION);
 	switch (FIELD_GET(CAL_HL_REVISION_SCHEME_MASK, cal->revision)) {
 	case CAL_HL_REVISION_SCHEME_H08:
 		cal_dbg(3, cal, "CAL HW revision %lu.%lu.%lu (0x%08x)\n",
@@ -1372,7 +1356,7 @@ static void cal_get_hwinfo(struct cal_dev *cal)
 		break;
 	}
 
-	hwinfo = reg_read(cal, CAL_HL_HWINFO);
+	hwinfo = cal_read(cal, CAL_HL_HWINFO);
 	if (hwinfo != CAL_HL_HWINFO_VALUE)
 		cal_info(cal, "CAL_HL_HWINFO = 0x%08x, expected 0x%08x\n",
 			 hwinfo, CAL_HL_HWINFO_VALUE);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 383fa9295048..44f2836b6543 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -11,6 +11,8 @@
 #ifndef __TI_CAL_H__
 #define __TI_CAL_H__
 
+#include <linux/bitfield.h>
+#include <linux/io.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
@@ -203,6 +205,40 @@ extern int cal_video_nr;
 #define phy_err(phy, fmt, arg...)					\
 	cal_err((phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
 
+static inline u32 cal_read(struct cal_dev *cal, u32 offset)
+{
+	return ioread32(cal->base + offset);
+}
+
+static inline void cal_write(struct cal_dev *cal, u32 offset, u32 val)
+{
+	iowrite32(val, cal->base + offset);
+}
+
+static inline u32 cal_read_field(struct cal_dev *cal, u32 offset, u32 mask)
+{
+	return FIELD_GET(mask, cal_read(cal, offset));
+}
+
+static inline void cal_write_field(struct cal_dev *cal, u32 offset, u32 value,
+				   u32 mask)
+{
+	u32 val = cal_read(cal, offset);
+
+	val &= ~mask;
+	val |= FIELD_PREP(mask, value);
+	cal_write(cal, offset, val);
+}
+
+static inline void cal_set_field(u32 *valp, u32 field, u32 mask)
+{
+	u32 val = *valp;
+
+	val &= ~mask;
+	val |= (field << __ffs(mask)) & mask;
+	*valp = val;
+}
+
 void cal_quickdump_regs(struct cal_dev *cal);
 
 int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt);
-- 
Regards,

Laurent Pinchart

