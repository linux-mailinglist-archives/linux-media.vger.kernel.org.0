Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9CBE69CB29
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 13:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbjBTMlB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 07:41:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjBTMk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 07:40:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E501E166D5
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 04:40:57 -0800 (PST)
Received: from uno.homenet.telecomitalia.it (host-95-252-227-22.retail.telecomitalia.it [95.252.227.22])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05D68A49;
        Mon, 20 Feb 2023 13:40:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676896855;
        bh=/kCfs/Pr2oFXj4liOan4pGUL+3WJnLULGz8/u1dP9Zk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C9OV0FblYbOqYhGsrIUQqEIt9CMT1Cvi+kHoAgM0qqiSkd0S2wOuUbeRal0/6Gbbq
         RcAn6DIvnxoTUz/k8zJWnI6QRgV4ggeAEESGLt+0KQBBBPsp1xObnRoxGQCDPq8vBM
         8z/jduwRlb4VXa8X9bWH2V+yaPLj6cIEoyUiskGk=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Valentine Barshak <valentine.barshak@cogentembedded.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 1/2] media: i2c: ov5647: Add test pattern control
Date:   Mon, 20 Feb 2023 13:40:41 +0100
Message-Id: <20230220124041.1010289-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com>
References: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Valentine Barshak <valentine.barshak@cogentembedded.com>

This adds V4L2_CID_TEST_PATTERN control support.

Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 847a7bbb69c5..0b88ac6dee41 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -58,6 +58,7 @@
 #define OV5647_REG_MIPI_CTRL00		0x4800
 #define OV5647_REG_MIPI_CTRL14		0x4814
 #define OV5647_REG_AWB			0x5001
+#define OV5647_REG_ISPCTRL3D		0x503d

 #define REG_TERM 0xfffe
 #define VAL_TERM 0xfe
@@ -116,6 +117,22 @@ static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
 	return container_of(sd, struct ov5647, sd);
 }

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
 static const struct regval_list sensor_oe_disable_regs[] = {
 	{0x3000, 0x00},
 	{0x3001, 0x00},
@@ -1242,6 +1259,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
 				     sensor->mode->format.height + ctrl->val);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
+				   ov5647_test_pattern_val[ctrl->val]);
+		break;

 	/* Read-only, but we adjust it based on mode. */
 	case V4L2_CID_PIXEL_RATE:
@@ -1270,7 +1291,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	int hblank, exposure_max, exposure_def;

-	v4l2_ctrl_handler_init(&sensor->ctrls, 8);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 9);

 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1314,6 +1335,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 					   sensor->mode->vts -
 					   sensor->mode->format.height);

+	v4l2_ctrl_new_std_menu_items(&sensor->ctrls, &ov5647_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
+				     0, 0, ov5647_test_pattern_menu);
+
 	if (sensor->ctrls.error)
 		goto handler_free;

--
2.39.0

