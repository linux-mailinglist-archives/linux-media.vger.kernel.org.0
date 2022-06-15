Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 093F054CC6E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346997AbiFOPPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347422AbiFOPPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:15:43 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CEFD3E0C1;
        Wed, 15 Jun 2022 08:15:40 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 717F7240017;
        Wed, 15 Jun 2022 15:15:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     dave.stevenson@raspberrypi.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, david.plowman@raspberrypi.com,
        laurent.pinchart@ideasonboard.com,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 5/5] media: ov5647: Add support for test patterns
Date:   Wed, 15 Jun 2022 17:14:57 +0200
Message-Id: <20220615151457.415038-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615151457.415038-1-jacopo@jmondi.org>
References: <20220615151457.415038-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for V4L2_CID_TEST_PATTERN.

Based on a patch from Renesas R-Car BSP 4.1.0 from
Valentine Barshak <valentine.barshak@cogentembedded.com>

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 0a3e4acec036..68e56b0d8153 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -60,6 +60,7 @@
 #define OV5647_REG_MIPI_CTRL00		0x4800
 #define OV5647_REG_MIPI_CTRL14		0x4814
 #define OV5647_REG_AWB			0x5001
+#define OV5647_REG_ISP_CTRL3D		0x503d
 
 #define REG_TERM 0xfffe
 #define VAL_TERM 0xfe
@@ -812,6 +813,22 @@ static const struct ov5647_mode ov5647_8_bpp_modes[] = {
 #define OV5647_DEFAULT_MODE	(&ov5647_10_bpp_modes[3])
 #define OV5647_DEFAULT_FORMAT	(ov5647_10_bpp_modes[3].format)
 
+static const char * const ov5647_test_pattern_menu[] = {
+	"Disabled",
+	"Color Bars",
+	"Color Squares",
+	"Random Data",
+	"Input Data"
+};
+
+static u8 ov5647_test_pattern_val[] = {
+	0x00,	/* Disabled */
+	0x80,	/* Color Bars */
+	0x82,	/* Color Squares */
+	0x81,	/* Random Data */
+	0x83,	/* Input Data */
+};
+
 static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
 {
 	unsigned char data[4] = { reg >> 8, reg & 0xff, val >> 8, val & 0xff};
@@ -1582,6 +1599,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		ov5647_s_flip(sd, OV5647_REG_VFLIP, ctrl->val);
 		break;
 
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov5647_write(sd, OV5647_REG_ISP_CTRL3D,
+				   ov5647_test_pattern_val[ctrl->val]);
+		break;
 	default:
 		dev_info(&client->dev,
 			 "Control (id:0x%x, val:0x%x) not supported\n",
@@ -1604,7 +1625,7 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
 	int hblank, exposure_max, exposure_def;
 	struct v4l2_fwnode_device_properties props;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 10);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 11);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1658,6 +1679,11 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
 	if (sensor->vflip)
 		sensor->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
+	v4l2_ctrl_new_std_menu_items(&sensor->ctrls, &ov5647_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
+				     0, 0, ov5647_test_pattern_menu);
+
 	v4l2_fwnode_device_parse(dev, &props);
 
 	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
-- 
2.35.1

