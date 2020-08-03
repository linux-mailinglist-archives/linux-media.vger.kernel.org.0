Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903FB23A87A
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 16:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgHCOcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 10:32:18 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:12397 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726358AbgHCOcS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 10:32:18 -0400
X-IronPort-AV: E=Sophos;i="5.75,430,1589209200"; 
   d="scan'208";a="53750356"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Aug 2020 23:32:17 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DED6442ACBDC;
        Mon,  3 Aug 2020 23:32:13 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/4] media: i2c: ov5640: Enable data pins on poweron for DVP mode
Date:   Mon,  3 Aug 2020 15:31:45 +0100
Message-Id: <1596465107-14251-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

During testing this sensor on iW-RainboW-G21D-Qseven platform in 8-bit DVP
mode with rcar-vin bridge noticed the capture worked fine for the first run
(with yavta), but for subsequent runs the bridge driver waited for the
frame to be captured. Debugging further noticed the data lines were
enabled/disabled in stream on/off callback and dumping the register
contents 0x3017/0x3018 in ov5640_set_stream_dvp() reported the correct
values, but yet frame capturing failed.

To get around this issue the following actions are performed for
parallel mode (DVP):
1: Keeps the sensor in software power down mode and is woken up only in
   ov5640_set_stream_dvp() callback.
2: Enables data lines in s_power callback
3: Configures HVP lines in s_power callback instead of configuring
   everytime in ov5640_set_stream_dvp().
4: Disables MIPI interface.

Fixes: f22996db44e2d ("media: ov5640: add support of DVP parallel interface")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/i2c/ov5640.c | 321 ++++++++++++++++++++-----------------
 1 file changed, 172 insertions(+), 149 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 2fe4a7ac0592..ec444bee2ce9 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -94,6 +94,9 @@
 #define OV5640_REG_SDE_CTRL5		0x5585
 #define OV5640_REG_AVG_READOUT		0x56a1
 
+#define OV5640_SOFTWARE_PWDN		0x42
+#define OV5640_SOFTWARE_WAKEUP		0x02
+
 enum ov5640_mode_id {
 	OV5640_MODE_QCIF_176_144 = 0,
 	OV5640_MODE_QVGA_320_240,
@@ -274,7 +277,7 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 /* YUV422 UYVY VGA@30fps */
 static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
 	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
-	{0x3103, 0x03, 0, 0}, {0x3017, 0x00, 0, 0}, {0x3018, 0x00, 0, 0},
+	{0x3103, 0x03, 0, 0},
 	{0x3630, 0x36, 0, 0},
 	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
 	{0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
@@ -1120,6 +1123,11 @@ static int ov5640_load_regs(struct ov5640_dev *sensor,
 		val = regs->val;
 		mask = regs->mask;
 
+		/* remain in power down mode for DVP */
+		if (regs->reg_addr == OV5640_REG_SYS_CTRL0 && val == OV5640_SOFTWARE_WAKEUP &&
+		    sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
+			continue;
+
 		if (mask)
 			ret = ov5640_mod_reg(sensor, reg_addr, mask, val);
 		else
@@ -1210,96 +1218,8 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
 
 static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 {
-	int ret;
-	unsigned int flags = sensor->ep.bus.parallel.flags;
-	u8 pclk_pol = 0;
-	u8 hsync_pol = 0;
-	u8 vsync_pol = 0;
-
-	/*
-	 * Note about parallel port configuration.
-	 *
-	 * When configured in parallel mode, the OV5640 will
-	 * output 10 bits data on DVP data lines [9:0].
-	 * If only 8 bits data are wanted, the 8 bits data lines
-	 * of the camera interface must be physically connected
-	 * on the DVP data lines [9:2].
-	 *
-	 * Control lines polarity can be configured through
-	 * devicetree endpoint control lines properties.
-	 * If no endpoint control lines properties are set,
-	 * polarity will be as below:
-	 * - VSYNC:	active high
-	 * - HREF:	active low
-	 * - PCLK:	active low
-	 */
-
-	if (on) {
-		/*
-		 * configure parallel port control lines polarity
-		 *
-		 * POLARITY CTRL0
-		 * - [5]:	PCLK polarity (0: active low, 1: active high)
-		 * - [1]:	HREF polarity (0: active low, 1: active high)
-		 * - [0]:	VSYNC polarity (mismatch here between
-		 *		datasheet and hardware, 0 is active high
-		 *		and 1 is active low...)
-		 */
-		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
-			pclk_pol = 1;
-		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
-			hsync_pol = 1;
-		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
-			vsync_pol = 1;
-
-		ret = ov5640_write_reg(sensor,
-				       OV5640_REG_POLARITY_CTRL00,
-				       (pclk_pol << 5) |
-				       (hsync_pol << 1) |
-				       vsync_pol);
-
-		if (ret)
-			return ret;
-	}
-
-	/*
-	 * powerdown MIPI TX/RX PHY & disable MIPI
-	 *
-	 * MIPI CONTROL 00
-	 * 4:	 PWDN PHY TX
-	 * 3:	 PWDN PHY RX
-	 * 2:	 MIPI enable
-	 */
-	ret = ov5640_write_reg(sensor,
-			       OV5640_REG_IO_MIPI_CTRL00, on ? 0x18 : 0);
-	if (ret)
-		return ret;
-
-	/*
-	 * enable VSYNC/HREF/PCLK DVP control lines
-	 * & D[9:6] DVP data lines
-	 *
-	 * PAD OUTPUT ENABLE 01
-	 * - 6:		VSYNC output enable
-	 * - 5:		HREF output enable
-	 * - 4:		PCLK output enable
-	 * - [3:0]:	D[9:6] output enable
-	 */
-	ret = ov5640_write_reg(sensor,
-			       OV5640_REG_PAD_OUTPUT_ENABLE01,
-			       on ? 0x7f : 0);
-	if (ret)
-		return ret;
-
-	/*
-	 * enable D[5:0] DVP data lines
-	 *
-	 * PAD OUTPUT ENABLE 02
-	 * - [7:2]:	D[5:0] output enable
-	 */
-	return ov5640_write_reg(sensor,
-				OV5640_REG_PAD_OUTPUT_ENABLE02,
-				on ? 0xfc : 0);
+	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
+				OV5640_SOFTWARE_WAKEUP : OV5640_SOFTWARE_PWDN);
 }
 
 static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
@@ -2001,6 +1921,159 @@ static void ov5640_set_power_off(struct ov5640_dev *sensor)
 	clk_disable_unprepare(sensor->xclk);
 }
 
+static int ov5640_set_mipi(struct ov5640_dev *sensor, bool on)
+{
+	int ret = 0;
+
+	if (!on) {
+		/* Reset MIPI bus settings to their default values. */
+		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
+		ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x04);
+		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x00);
+
+		return ret;
+	}
+
+	/*
+	 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
+	 *
+	 * 0x300e = 0x40
+	 * [7:5] = 010	: 2 data lanes mode (see FIXME note in
+	 *		  "ov5640_set_stream_mipi()")
+	 * [4] = 0	: Power up MIPI HS Tx
+	 * [3] = 0	: Power up MIPI LS Rx
+	 * [2] = 0	: MIPI interface disabled
+	 */
+	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
+	if (ret)
+		return ret;
+
+	/*
+	 * Gate clock and set LP11 in 'no packets mode' (idle)
+	 *
+	 * 0x4800 = 0x24
+	 * [5] = 1	: Gate clock when 'no packets'
+	 * [2] = 1	: MIPI bus in LP11 when 'no packets'
+	 */
+	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x24);
+	if (ret)
+		return ret;
+
+	/*
+	 * Set data lanes and clock in LP11 when 'sleeping'
+	 *
+	 * 0x3019 = 0x70
+	 * [6] = 1	: MIPI data lane 2 in LP11 when 'sleeping'
+	 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
+	 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
+	 */
+	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x70);
+	if (ret)
+		return ret;
+
+	/* Give lanes some time to coax into LP11 state. */
+	usleep_range(500, 1000);
+
+	return 0;
+}
+
+static int ov5640_set_dvp(struct ov5640_dev *sensor, bool on)
+{
+	unsigned int flags = sensor->ep.bus.parallel.flags;
+	u8 pclk_pol = 0;
+	u8 hsync_pol = 0;
+	u8 vsync_pol = 0;
+	int ret = 0;
+
+	if (!on) {
+		/* Reset settings to their default values. */
+		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
+		ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, 0x20);
+		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x00);
+		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0x00);
+
+		return ret;
+	}
+
+	/*
+	 * Note about parallel port configuration.
+	 *
+	 * When configured in parallel mode, the OV5640 will
+	 * output 10 bits data on DVP data lines [9:0].
+	 * If only 8 bits data are wanted, the 8 bits data lines
+	 * of the camera interface must be physically connected
+	 * on the DVP data lines [9:2].
+	 *
+	 * Control lines polarity can be configured through
+	 * devicetree endpoint control lines properties.
+	 * If no endpoint control lines properties are set,
+	 * polarity will be as below:
+	 * - VSYNC:	active high
+	 * - HREF:	active low
+	 * - PCLK:	active low
+	 */
+	/*
+	 * configure parallel port control lines polarity
+	 *
+	 * POLARITY CTRL0
+	 * - [5]:	PCLK polarity (0: active low, 1: active high)
+	 * - [1]:	HREF polarity (0: active low, 1: active high)
+	 * - [0]:	VSYNC polarity (mismatch here between
+	 *		datasheet and hardware, 0 is active high
+	 *		and 1 is active low...)
+	 */
+	if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+		pclk_pol = 1;
+	if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
+		hsync_pol = 1;
+	if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
+		vsync_pol = 1;
+
+	ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
+			       (pclk_pol << 5) | (hsync_pol << 1) | vsync_pol);
+
+	if (ret)
+		return ret;
+
+	/*
+	 * powerdown MIPI TX/RX PHY & disable MIPI
+	 *
+	 * MIPI CONTROL 00
+	 * 4:	 PWDN PHY TX
+	 * 3:	 PWDN PHY RX
+	 * 2:	 MIPI enable
+	 */
+	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x18);
+	if (ret)
+		return ret;
+
+	/*
+	 * enable VSYNC/HREF/PCLK DVP control lines
+	 * & D[9:6] DVP data lines
+	 *
+	 * PAD OUTPUT ENABLE 01
+	 * - 6:		VSYNC output enable
+	 * - 5:		HREF output enable
+	 * - 4:		PCLK output enable
+	 * - [3:0]:	D[9:6] output enable
+	 */
+	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
+	if (ret)
+		return ret;
+
+	/*
+	 * enable D[5:0] DVP data lines
+	 *
+	 * PAD OUTPUT ENABLE 02
+	 * - [7:2]:	D[5:0] output enable
+	 */
+	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 {
 	int ret = 0;
@@ -2013,67 +2086,17 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 		ret = ov5640_restore_mode(sensor);
 		if (ret)
 			goto power_off;
+	}
 
-		/* We're done here for DVP bus, while CSI-2 needs setup. */
-		if (sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
-			return 0;
-
-		/*
-		 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
-		 *
-		 * 0x300e = 0x40
-		 * [7:5] = 010	: 2 data lanes mode (see FIXME note in
-		 *		  "ov5640_set_stream_mipi()")
-		 * [4] = 0	: Power up MIPI HS Tx
-		 * [3] = 0	: Power up MIPI LS Rx
-		 * [2] = 0	: MIPI interface disabled
-		 */
-		ret = ov5640_write_reg(sensor,
-				       OV5640_REG_IO_MIPI_CTRL00, 0x40);
-		if (ret)
-			goto power_off;
-
-		/*
-		 * Gate clock and set LP11 in 'no packets mode' (idle)
-		 *
-		 * 0x4800 = 0x24
-		 * [5] = 1	: Gate clock when 'no packets'
-		 * [2] = 1	: MIPI bus in LP11 when 'no packets'
-		 */
-		ret = ov5640_write_reg(sensor,
-				       OV5640_REG_MIPI_CTRL00, 0x24);
-		if (ret)
-			goto power_off;
-
-		/*
-		 * Set data lanes and clock in LP11 when 'sleeping'
-		 *
-		 * 0x3019 = 0x70
-		 * [6] = 1	: MIPI data lane 2 in LP11 when 'sleeping'
-		 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
-		 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
-		 */
-		ret = ov5640_write_reg(sensor,
-				       OV5640_REG_PAD_OUTPUT00, 0x70);
-		if (ret)
-			goto power_off;
-
-		/* Give lanes some time to coax into LP11 state. */
-		usleep_range(500, 1000);
-
-	} else {
-		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
-			/* Reset MIPI bus settings to their default values. */
-			ov5640_write_reg(sensor,
-					 OV5640_REG_IO_MIPI_CTRL00, 0x58);
-			ov5640_write_reg(sensor,
-					 OV5640_REG_MIPI_CTRL00, 0x04);
-			ov5640_write_reg(sensor,
-					 OV5640_REG_PAD_OUTPUT00, 0x00);
-		}
+	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
+		ret = ov5640_set_mipi(sensor, on);
+	else
+		ret = ov5640_set_dvp(sensor, on);
+	if (ret)
+		goto power_off;
 
+	if (!on)
 		ov5640_set_power_off(sensor);
-	}
 
 	return 0;
 
-- 
2.17.1

