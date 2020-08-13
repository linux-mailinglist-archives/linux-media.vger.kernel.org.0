Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3235243E1D
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 19:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgHMROI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 13:14:08 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:10620 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726248AbgHMROG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 13:14:06 -0400
X-IronPort-AV: E=Sophos;i="5.76,309,1592838000"; 
   d="scan'208";a="54526448"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 14 Aug 2020 02:14:05 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2AFF84005E0F;
        Fri, 14 Aug 2020 02:14:02 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v3 2/3] media: i2c: ov5640: Add support for BT656 mode
Date:   Thu, 13 Aug 2020 18:13:36 +0100
Message-Id: <20200813171337.5540-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813171337.5540-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200813171337.5540-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable support for BT656 mode.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/i2c/ov5640.c | 46 ++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index e36bc08bc17f..160d2857352a 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -84,6 +84,7 @@
 #define OV5640_REG_VFIFO_HSIZE		0x4602
 #define OV5640_REG_VFIFO_VSIZE		0x4604
 #define OV5640_REG_JPG_MODE_SELECT	0x4713
+#define OV5640_REG_CCIR656_CTRL00	0x4730
 #define OV5640_REG_POLARITY_CTRL00	0x4740
 #define OV5640_REG_MIPI_CTRL00		0x4800
 #define OV5640_REG_DEBUG_MODE		0x4814
@@ -1215,6 +1216,20 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
 			      BIT(1), on ? 0 : BIT(1));
 }
 
+static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
+{
+	int ret;
+
+	ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
+			       on ? 0x1 : 0x00);
+	if (ret)
+		return ret;
+
+	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
+				OV5640_REG_SYS_CTRL0_SW_PWUP :
+				OV5640_REG_SYS_CTRL0_SW_PWDN);
+}
+
 static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 {
 	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
@@ -2022,18 +2037,21 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
 	 *		datasheet and hardware, 0 is active high
 	 *		and 1 is active low...)
 	 */
-	if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
-		pclk_pol = 1;
-	if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
-		hsync_pol = 1;
-	if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
-		vsync_pol = 1;
+	if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL) {
+		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+			pclk_pol = 1;
+		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
+			hsync_pol = 1;
+		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
+			vsync_pol = 1;
+
+		ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
+				       (pclk_pol << 5) | (hsync_pol << 1) |
+				       vsync_pol);
 
-	ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
-			       (pclk_pol << 5) | (hsync_pol << 1) | vsync_pol);
-
-	if (ret)
-		return ret;
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * powerdown MIPI TX/RX PHY & disable MIPI
@@ -2057,7 +2075,9 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
 	 * - 4:		PCLK output enable
 	 * - [3:0]:	D[9:6] output enable
 	 */
-	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
+	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
+			       sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
+			       0x7f : 0x1f);
 	if (ret)
 		return ret;
 
@@ -2911,6 +2931,8 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 
 		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
 			ret = ov5640_set_stream_mipi(sensor, enable);
+		else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
+			ret = ov5640_set_stream_bt656(sensor, enable);
 		else
 			ret = ov5640_set_stream_dvp(sensor, enable);
 
-- 
2.17.1

