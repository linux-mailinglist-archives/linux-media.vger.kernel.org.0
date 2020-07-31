Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF82F2342B6
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 11:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732721AbgGaJZR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 05:25:17 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:59301 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732711AbgGaJZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 05:25:14 -0400
X-IronPort-AV: E=Sophos;i="5.75,417,1589209200"; 
   d="scan'208";a="53330059"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jul 2020 18:25:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D0B9E400C9E4;
        Fri, 31 Jul 2020 18:25:10 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] media: i2c: ov5640: Add support for BT656 mode
Date:   Fri, 31 Jul 2020 10:24:47 +0100
Message-Id: <1596187487-31403-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596187487-31403-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1596187487-31403-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable support for BT656 mode.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/i2c/ov5640.c | 48 +++++++++++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index ac305a5..2b23988 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -82,6 +82,7 @@
 #define OV5640_REG_VFIFO_HSIZE		0x4602
 #define OV5640_REG_VFIFO_VSIZE		0x4604
 #define OV5640_REG_JPG_MODE_SELECT	0x4713
+#define OV5640_REG_CCIR656_CTRL00	0x4730
 #define OV5640_REG_POLARITY_CTRL00	0x4740
 #define OV5640_REG_MIPI_CTRL00		0x4800
 #define OV5640_REG_DEBUG_MODE		0x4814
@@ -1213,6 +1214,17 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ? 0x2 : 0x42);
 }
 
+static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
+{
+	int ret;
+
+	ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00, on ? 0x1 : 0x00);
+	if (ret)
+		return ret;
+
+	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ? 0x2 : 0x42);
+}
+
 static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
 {
 	int ret;
@@ -1998,18 +2010,21 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 			 *		datasheet and hardware, 0 is active high
 			 *		and 1 is active low...)
 			 */
-			if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
-				pclk_pol = 1;
-			if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
-				hsync_pol = 1;
-			if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
-				vsync_pol = 1;
-
-			ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
-					       (pclk_pol << 5) | (hsync_pol << 1) | vsync_pol);
-
-			if (ret)
-				goto power_off;
+			if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL) {
+				if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+					pclk_pol = 1;
+				if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
+					hsync_pol = 1;
+				if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
+					vsync_pol = 1;
+
+				ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
+						       (pclk_pol << 5) | (hsync_pol << 1) |
+						       vsync_pol);
+
+				if (ret)
+					goto power_off;
+			}
 
 			/*
 			 * powerdown MIPI TX/RX PHY & disable MIPI
@@ -2033,7 +2048,9 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 			 * - 4:		PCLK output enable
 			 * - [3:0]:	D[9:6] output enable
 			 */
-			ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
+			ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
+					       sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
+					       0x7f : 0x1f);
 			if (ret)
 				goto power_off;
 
@@ -2047,7 +2064,6 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
 			if (ret)
 				goto power_off;
 		}
-
 	} else {
 		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
 			/* Reset MIPI bus settings to their default values. */
@@ -2875,8 +2891,10 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 
 		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
 			ret = ov5640_set_stream_mipi(sensor, enable);
-		else
+		else if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL)
 			ret = ov5640_set_stream_dvp(sensor, enable);
+		else
+			ret = ov5640_set_stream_bt656(sensor, enable);
 
 		if (!ret)
 			sensor->streaming = enable;
-- 
2.7.4

