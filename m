Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A183215EBD
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729994AbgGFSip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729990AbgGFSio (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:44 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B11B218A;
        Mon,  6 Jul 2020 20:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060697;
        bh=++eCg/6/sdCLH0csGZJVygcMKyPDFeyOhgC5BD5jN5A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nVxbI0pHWvZXc/MtQu3Ac4JFRmej7WjxBDZcE5HsyVd7SKJq7K/paeC5TfCHYXPzC
         Xo8qurFYWVt1U70sy2eaSTyNVTGFpe1EAbl+xEJUZTqRG07VJ8rLw5IVStjOz4Wne+
         dQ4z/czSXX2EFPQjQTVp+a8rWlGej4Gz3eDYK6Ac=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 077/108] media: ti-vpe: cal: Reorder camerarx functions to prepare refactoring
Date:   Mon,  6 Jul 2020 21:36:38 +0300
Message-Id: <20200706183709.12238-78-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for the camerarx refactoring, reorder functions without any
functional change to ease review of the refactoring itself.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 436 ++++++++++++++--------------
 1 file changed, 218 insertions(+), 218 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 4be1fa7e8197..6b0ed2946eba 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -481,6 +481,54 @@ static void cal_quickdump_regs(struct cal_dev *cal)
  * ------------------------------------------------------------------
  */
 
+static int cal_camerarx_get_external_info(struct cal_camerarx *phy)
+{
+	struct v4l2_ctrl *ctrl;
+
+	if (!phy->sensor)
+		return -ENODEV;
+
+	ctrl = v4l2_ctrl_find(phy->sensor->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (!ctrl) {
+		phy_err(phy, "no pixel rate control in subdev: %s\n",
+			phy->sensor->name);
+		return -EPIPE;
+	}
+
+	phy->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
+	phy_dbg(3, phy, "sensor Pixel Rate: %u\n", phy->external_rate);
+
+	return 0;
+}
+
+static void cal_camerarx_lane_config(struct cal_camerarx *phy)
+{
+	u32 val = reg_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance));
+	u32 lane_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POSITION_MASK;
+	u32 polarity_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POL_MASK;
+	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
+		&phy->endpoint.bus.mipi_csi2;
+	int lane;
+
+	set_field(&val, mipi_csi2->clock_lane + 1, lane_mask);
+	set_field(&val, mipi_csi2->lane_polarities[0], polarity_mask);
+	for (lane = 0; lane < mipi_csi2->num_data_lanes; lane++) {
+		/*
+		 * Every lane are one nibble apart starting with the
+		 * clock followed by the data lanes so shift masks by 4.
+		 */
+		lane_mask <<= 4;
+		polarity_mask <<= 4;
+		set_field(&val, mipi_csi2->data_lanes[lane] + 1, lane_mask);
+		set_field(&val, mipi_csi2->lane_polarities[lane + 1],
+			  polarity_mask);
+	}
+
+	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance), val);
+	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x\n",
+		phy->instance, val);
+}
+
 static void cal_camerarx_enable(struct cal_camerarx *phy)
 {
 	u32 num_lanes = phy->cal->data->camerarx[phy->instance].num_lanes;
@@ -499,120 +547,6 @@ static void cal_camerarx_disable(struct cal_camerarx *phy)
 	regmap_field_write(phy->fields[F_CTRLCLKEN], 0);
 }
 
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
-	u32 reg10 = reg_read(phy, CAL_CSI2_PHY_REG10);
-
-	set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
-
-	phy_dbg(1, phy, "CSI2_%d_REG10 = 0x%08x\n", phy->instance, reg10);
-	reg_write(phy, CAL_CSI2_PHY_REG10, reg10);
-}
-
-/*
- * Enable the expected IRQ sources
- */
-static void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
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
-	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
-		  CAL_HL_IRQ_CIO_MASK(phy->instance));
-	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
-		  cio_err_mask);
-
-	/* Always enable OCPO error */
-	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
-
-	/* Enable IRQ_WDMA_END 0/1 */
-	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(1), val);
-	/* Enable IRQ_WDMA_START 0/1 */
-	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(2), val);
-	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	reg_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
-}
-
-static void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
-{
-	u32 val;
-
-	/* Disable CIO error irqs */
-	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(0),
-		  CAL_HL_IRQ_CIO_MASK(phy->instance));
-	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
-		  0);
-
-	/* Disable IRQ_WDMA_END 0/1 */
-	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(1), val);
-	/* Disable IRQ_WDMA_START 0/1 */
-	val = 0;
-	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(2), val);
-	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	reg_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0);
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
-	reg_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
-			target_state, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
-
-	for (i = 0; i < 10; i++) {
-		u32 current_state;
-
-		current_state = reg_read_field(phy->cal,
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
 /*
  * TCLK values are OK at their reset values
  */
@@ -663,6 +597,94 @@ static void cal_camerarx_config(struct cal_camerarx *phy,
 	reg_write(phy, CAL_CSI2_PHY_REG1, reg1);
 }
 
+static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
+{
+	u32 target_state;
+	unsigned int i;
+
+	target_state = enable ? CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON :
+		       CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF;
+
+	reg_write_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+			target_state, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
+
+	for (i = 0; i < 10; i++) {
+		u32 current_state;
+
+		current_state = reg_read_field(phy->cal,
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
+		if (reg_read_field(phy->cal,
+				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
+				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
+		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
+			break;
+		usleep_range(500, 5000);
+	}
+
+	if (reg_read_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
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
+		if (reg_read_field(phy->cal,
+				   CAL_CSI2_TIMING(phy->instance),
+				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
+			break;
+		usleep_range(500, 5000);
+	}
+
+	if (reg_read_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
+			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
+		phy_err(phy, "Timeout waiting for stop state\n");
+}
+
+static void cal_camerarx_wait_ready(struct cal_camerarx *phy)
+{
+	/* Steps
+	 *  2. Wait for completion of reset
+	 *          Note if the external sensor is not sending byte clock,
+	 *          the reset will timeout
+	 *  4.Force FORCERXMODE
+	 *      G. Wait for all enabled lane to reach stop state
+	 *      H. Disable pull down using pad control
+	 */
+
+	/* 2. Wait for reset completion */
+	cal_camerarx_wait_reset(phy);
+
+	/* 4. G. Wait for all enabled lane to reach stop state */
+	cal_camerarx_wait_stop_state(phy);
+
+	phy_dbg(1, phy, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
+		phy->instance, reg_read(phy, CAL_CSI2_PHY_REG1));
+}
+
 static void cal_camerarx_init(struct cal_camerarx *phy,
 			      const struct cal_fmt *fmt)
 {
@@ -734,65 +756,6 @@ static void cal_camerarx_init(struct cal_camerarx *phy,
 	cal_camerarx_power(phy, true);
 }
 
-static void cal_camerarx_wait_reset(struct cal_camerarx *phy)
-{
-	unsigned long timeout;
-
-	timeout = jiffies + msecs_to_jiffies(750);
-	while (time_before(jiffies, timeout)) {
-		if (reg_read_field(phy->cal,
-				   CAL_CSI2_COMPLEXIO_CFG(phy->instance),
-				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
-		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
-			break;
-		usleep_range(500, 5000);
-	}
-
-	if (reg_read_field(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance),
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
-		if (reg_read_field(phy->cal,
-				   CAL_CSI2_TIMING(phy->instance),
-				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
-			break;
-		usleep_range(500, 5000);
-	}
-
-	if (reg_read_field(phy->cal, CAL_CSI2_TIMING(phy->instance),
-			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
-		phy_err(phy, "Timeout waiting for stop state\n");
-}
-
-static void cal_camerarx_wait_ready(struct cal_camerarx *phy)
-{
-	/* Steps
-	 *  2. Wait for completion of reset
-	 *          Note if the external sensor is not sending byte clock,
-	 *          the reset will timeout
-	 *  4.Force FORCERXMODE
-	 *      G. Wait for all enabled lane to reach stop state
-	 *      H. Disable pull down using pad control
-	 */
-
-	/* 2. Wait for reset completion */
-	cal_camerarx_wait_reset(phy);
-
-	/* 4. G. Wait for all enabled lane to reach stop state */
-	cal_camerarx_wait_stop_state(phy);
-
-	phy_dbg(1, phy, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
-		phy->instance, reg_read(phy, CAL_CSI2_PHY_REG1));
-}
-
 static void cal_camerarx_deinit(struct cal_camerarx *phy)
 {
 	unsigned int i;
@@ -822,32 +785,89 @@ static void cal_camerarx_deinit(struct cal_camerarx *phy)
 	cal_camerarx_disable(phy);
 }
 
-static void cal_camerarx_lane_config(struct cal_camerarx *phy)
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
+static void cal_camerarx_i913_errata(struct cal_camerarx *phy)
 {
-	u32 val = reg_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance));
-	u32 lane_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POSITION_MASK;
-	u32 polarity_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POL_MASK;
-	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
-		&phy->endpoint.bus.mipi_csi2;
-	int lane;
-
-	set_field(&val, mipi_csi2->clock_lane + 1, lane_mask);
-	set_field(&val, mipi_csi2->lane_polarities[0], polarity_mask);
-	for (lane = 0; lane < mipi_csi2->num_data_lanes; lane++) {
-		/*
-		 * Every lane are one nibble apart starting with the
-		 * clock followed by the data lanes so shift masks by 4.
-		 */
-		lane_mask <<= 4;
-		polarity_mask <<= 4;
-		set_field(&val, mipi_csi2->data_lanes[lane] + 1, lane_mask);
-		set_field(&val, mipi_csi2->lane_polarities[lane + 1],
-			  polarity_mask);
-	}
-
-	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance), val);
-	phy_dbg(3, phy, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x\n",
-		phy->instance, val);
+	u32 reg10 = reg_read(phy, CAL_CSI2_PHY_REG10);
+
+	set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
+
+	phy_dbg(1, phy, "CSI2_%d_REG10 = 0x%08x\n", phy->instance, reg10);
+	reg_write(phy, CAL_CSI2_PHY_REG10, reg10);
+}
+
+/*
+ * Enable the expected IRQ sources
+ */
+static void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
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
+	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
+		  CAL_HL_IRQ_CIO_MASK(phy->instance));
+	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
+		  cio_err_mask);
+
+	/* Always enable OCPO error */
+	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
+
+	/* Enable IRQ_WDMA_END 0/1 */
+	val = 0;
+	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(1), val);
+	/* Enable IRQ_WDMA_START 0/1 */
+	val = 0;
+	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	reg_write(phy->cal, CAL_HL_IRQENABLE_SET(2), val);
+	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
+	reg_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
+}
+
+static void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
+{
+	u32 val;
+
+	/* Disable CIO error irqs */
+	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(0),
+		  CAL_HL_IRQ_CIO_MASK(phy->instance));
+	reg_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
+		  0);
+
+	/* Disable IRQ_WDMA_END 0/1 */
+	val = 0;
+	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(1), val);
+	/* Disable IRQ_WDMA_START 0/1 */
+	val = 0;
+	set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
+	reg_write(phy->cal, CAL_HL_IRQENABLE_CLR(2), val);
+	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
+	reg_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0);
 }
 
 static void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
@@ -863,26 +883,6 @@ static void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
 			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
-static int cal_camerarx_get_external_info(struct cal_camerarx *phy)
-{
-	struct v4l2_ctrl *ctrl;
-
-	if (!phy->sensor)
-		return -ENODEV;
-
-	ctrl = v4l2_ctrl_find(phy->sensor->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		phy_err(phy, "no pixel rate control in subdev: %s\n",
-			phy->sensor->name);
-		return -EPIPE;
-	}
-
-	phy->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
-	phy_dbg(3, phy, "sensor Pixel Rate: %u\n", phy->external_rate);
-
-	return 0;
-}
-
 static int cal_camerarx_regmap_init(struct cal_dev *cal,
 				    struct cal_camerarx *phy)
 {
-- 
Regards,

Laurent Pinchart

