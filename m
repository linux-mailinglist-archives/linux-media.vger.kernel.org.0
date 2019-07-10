Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7636564C4D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 20:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfGJSkL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 14:40:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56344 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbfGJSkL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 14:40:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D43D528AD89
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     kernel@collabora.com, Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2] media: i2c: ov5645: Fix power sequence
Date:   Wed, 10 Jul 2019 15:40:00 -0300
Message-Id: <20190710184000.8995-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is mostly a port of Jacopo's fix:

  commit aa4bb8b8838ffcc776a79f49a4d7476b82405349
  Author: Jacopo Mondi <jacopo@jmondi.org>
  Date:   Fri Jul 6 05:51:52 2018 -0400

  media: ov5640: Re-work MIPI startup sequence

In the OV5645 case, the changes are:

- Move OV5645_IO_MIPI_CTRL00 (0x300e) out of the initial setting blob.
- At set_power(1) time power up MIPI Tx/Rx and set data and clock lanes in
  LP11 during 'sleep' and 'idle' with MIPI clock in non-continuous mode.
- At set_power(0) time power down MIPI Tx/Rx (in addition to the current
  power down of regulators and clock gating).
- At s_stream time enable/disable the MIPI interface output.

With this commit the sensor is able to enter LP-11 mode during power up,
as expected by some CSI-2 controllers.

Many thanks to Fabio Estevam for his help debugging this issue.

Tested-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes in v2:
* As suggested by Philipp, move the initial configuration
  to the ov5645_global_init_setting array.
---
 drivers/media/i2c/ov5645.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 124c8df04633..58972c884705 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -45,6 +45,8 @@
 #define		OV5645_CHIP_ID_HIGH_BYTE	0x56
 #define OV5645_CHIP_ID_LOW		0x300b
 #define		OV5645_CHIP_ID_LOW_BYTE		0x45
+#define OV5645_IO_MIPI_CTRL00		0x300e
+#define OV5645_PAD_OUTPUT00		0x3019
 #define OV5645_AWB_MANUAL_CONTROL	0x3406
 #define		OV5645_AWB_MANUAL_ENABLE	BIT(0)
 #define OV5645_AEC_PK_MANUAL		0x3503
@@ -55,6 +57,7 @@
 #define		OV5645_ISP_VFLIP		BIT(2)
 #define OV5645_TIMING_TC_REG21		0x3821
 #define		OV5645_SENSOR_MIRROR		BIT(1)
+#define OV5645_MIPI_CTRL00		0x4800
 #define OV5645_PRE_ISP_TEST_SETTING_1	0x503d
 #define		OV5645_TEST_PATTERN_MASK	0x3
 #define		OV5645_SET_TEST_PATTERN(x)	((x) & OV5645_TEST_PATTERN_MASK)
@@ -121,7 +124,6 @@ static const struct reg_value ov5645_global_init_setting[] = {
 	{ 0x3503, 0x07 },
 	{ 0x3002, 0x1c },
 	{ 0x3006, 0xc3 },
-	{ 0x300e, 0x45 },
 	{ 0x3017, 0x00 },
 	{ 0x3018, 0x00 },
 	{ 0x302e, 0x0b },
@@ -350,7 +352,10 @@ static const struct reg_value ov5645_global_init_setting[] = {
 	{ 0x3a1f, 0x14 },
 	{ 0x0601, 0x02 },
 	{ 0x3008, 0x42 },
-	{ 0x3008, 0x02 }
+	{ 0x3008, 0x02 },
+	{ OV5645_IO_MIPI_CTRL00, 0x40 },
+	{ OV5645_MIPI_CTRL00, 0x24 },
+	{ OV5645_PAD_OUTPUT00, 0x70 }
 };
 
 static const struct reg_value ov5645_setting_sxga[] = {
@@ -737,13 +742,9 @@ static int ov5645_s_power(struct v4l2_subdev *sd, int on)
 				goto exit;
 			}
 
-			ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
-					       OV5645_SYSTEM_CTRL0_STOP);
-			if (ret < 0) {
-				ov5645_set_power_off(ov5645);
-				goto exit;
-			}
+			usleep_range(500, 1000);
 		} else {
+			ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x58);
 			ov5645_set_power_off(ov5645);
 		}
 	}
@@ -1049,11 +1050,20 @@ static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
 			dev_err(ov5645->dev, "could not sync v4l2 controls\n");
 			return ret;
 		}
+
+		ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x45);
+		if (ret < 0)
+			return ret;
+
 		ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
 				       OV5645_SYSTEM_CTRL0_START);
 		if (ret < 0)
 			return ret;
 	} else {
+		ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x40);
+		if (ret < 0)
+			return ret;
+
 		ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
 				       OV5645_SYSTEM_CTRL0_STOP);
 		if (ret < 0)
-- 
2.20.1

