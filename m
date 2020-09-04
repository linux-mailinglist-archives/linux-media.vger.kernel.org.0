Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943F725E29D
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 22:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgIDUTF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 16:19:05 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:15105 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728157AbgIDUTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 16:19:01 -0400
X-IronPort-AV: E=Sophos;i="5.76,391,1592838000"; 
   d="scan'208";a="56193963"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Sep 2020 05:18:59 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1F18B400C4EC;
        Sat,  5 Sep 2020 05:18:56 +0900 (JST)
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
Subject: [PATCH v4 5/6] media: i2c: ov5640: Add support for BT656 mode
Date:   Fri,  4 Sep 2020 21:18:34 +0100
Message-Id: <20200904201835.5958-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable support for BT656 mode.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 46 ++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 6834ebc1995f..96daeb5d6a27 100644
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
@@ -2020,18 +2035,21 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
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
@@ -2055,7 +2073,9 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
 	 * - 4:		PCLK output enable
 	 * - [3:0]:	D[9:6] output enable
 	 */
-	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
+	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
+			       sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
+			       0x7f : 0x1f);
 	if (ret)
 		return ret;
 
@@ -2905,6 +2925,8 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 
 		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
 			ret = ov5640_set_stream_mipi(sensor, enable);
+		else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
+			ret = ov5640_set_stream_bt656(sensor, enable);
 		else
 			ret = ov5640_set_stream_dvp(sensor, enable);
 
-- 
2.17.1

