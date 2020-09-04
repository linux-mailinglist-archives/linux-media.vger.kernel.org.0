Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFD025E29A
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 22:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgIDUSz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 16:18:55 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6054 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728116AbgIDUSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 16:18:54 -0400
X-IronPort-AV: E=Sophos;i="5.76,391,1592838000"; 
   d="scan'208";a="56410443"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Sep 2020 05:18:53 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 28D4A400C441;
        Sat,  5 Sep 2020 05:18:50 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v4 3/6] media: i2c: ov5640: Enable data pins on poweron for DVP mode
Date:   Fri,  4 Sep 2020 21:18:32 +0100
Message-Id: <20200904201835.5958-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

To get around this issue data lines are enabled in s_power callback.
(Also the sensor remains in power down mode if not streaming so power
consumption shouldn't be affected)

Fixes: f22996db44e2d ("media: ov5640: add support of DVP parallel interface")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 73 +++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 8af11d532699..8288728d8704 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -276,8 +276,7 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 /* YUV422 UYVY VGA@30fps */
 static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
 	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
-	{0x3103, 0x03, 0, 0}, {0x3017, 0x00, 0, 0}, {0x3018, 0x00, 0, 0},
-	{0x3630, 0x36, 0, 0},
+	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
 	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
 	{0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
 	{0x3715, 0x78, 0, 0}, {0x3717, 0x01, 0, 0}, {0x370b, 0x60, 0, 0},
@@ -1283,33 +1282,6 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 	if (ret)
 		return ret;
 
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
-	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02,
-			       on ? 0xfc : 0);
-	if (ret)
-		return ret;
-
 	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
 				OV5640_REG_SYS_CTRL0_SW_PWUP :
 				OV5640_REG_SYS_CTRL0_SW_PWDN);
@@ -2069,6 +2041,40 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
 	return 0;
 }
 
+static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
+{
+	int ret;
+
+	if (!on) {
+		/* Reset settings to their default values. */
+		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x00);
+		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0x00);
+		return 0;
+	}
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
+	return ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
+}
+
 static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 {
 	int ret = 0;
@@ -2083,11 +2089,12 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 			goto power_off;
 	}
 
-	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
+	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
 		ret = ov5640_set_power_mipi(sensor, on);
-		if (ret)
-			goto power_off;
-	}
+	else
+		ret = ov5640_set_power_dvp(sensor, on);
+	if (ret)
+		goto power_off;
 
 	if (!on)
 		ov5640_set_power_off(sensor);
-- 
2.17.1

