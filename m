Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D67169E5A2
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 18:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbjBURL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 12:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjBURL0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 12:11:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A462E830
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 09:11:12 -0800 (PST)
Received: from uno.homenet.telecomitalia.it (host-87-16-53-160.retail.telecomitalia.it [87.16.53.160])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FAAB59D;
        Tue, 21 Feb 2023 18:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676999470;
        bh=DyNZql4OALpKg5jc6m9Scf26OaoxxARoZNmUmZVUB3Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JM4H62e5Ny0DayTZuEGPdo+gNEjY01qWi6vQqolEMJeOd0ixRD/6/HJxqEPXGQcjJ
         5JqGVm1ZFspKgzDFiVFq/fegcgDoaHUJZPMjQaxA3EyKWC2lMNzwvaUC+oToY9pMol
         BzLkuit/Nw09r6NqXIr0eLk4KYO2gdkRta4J6Cmk=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v2 1/2] media: i2c: ov5647: Add test pattern control
Date:   Tue, 21 Feb 2023 18:10:47 +0100
Message-Id: <20230221171048.203042-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221171048.203042-1-jacopo.mondi@ideasonboard.com>
References: <20230221171048.203042-1-jacopo.mondi@ideasonboard.com>
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
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov5647.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 847a7bbb69c5..bde287e00c87 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -58,6 +58,7 @@
 #define OV5647_REG_MIPI_CTRL00		0x4800
 #define OV5647_REG_MIPI_CTRL14		0x4814
 #define OV5647_REG_AWB			0x5001
+#define OV5647_REG_ISPCTRL3D		0x503d
 
 #define REG_TERM 0xfffe
 #define VAL_TERM 0xfe
@@ -116,6 +117,20 @@ static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
 	return container_of(sd, struct ov5647, sd);
 }
 
+static const char * const ov5647_test_pattern_menu[] = {
+	"Disabled",
+	"Color Bars",
+	"Color Squares",
+	"Random Data",
+};
+
+static u8 ov5647_test_pattern_val[] = {
+	0x00,	/* Disabled */
+	0x80,	/* Color Bars */
+	0x82,	/* Color Squares */
+	0x81,	/* Random Data */
+};
+
 static const struct regval_list sensor_oe_disable_regs[] = {
 	{0x3000, 0x00},
 	{0x3001, 0x00},
@@ -1242,6 +1257,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
 				     sensor->mode->format.height + ctrl->val);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
+				   ov5647_test_pattern_val[ctrl->val]);
+		break;
 
 	/* Read-only, but we adjust it based on mode. */
 	case V4L2_CID_PIXEL_RATE:
@@ -1270,7 +1289,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	int hblank, exposure_max, exposure_def;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 8);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1314,6 +1333,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
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

