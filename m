Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9CFB1537
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfILUKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 16:10:04 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:50833 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfILUKE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:10:04 -0400
X-Originating-IP: 85.243.204.24
Received: from uno.lan (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 82F6B20006;
        Thu, 12 Sep 2019 20:10:00 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v3 10/11] media: i2c: ov5670: Parse and register properties
Date:   Thu, 12 Sep 2019 22:10:54 +0200
Message-Id: <20190912201055.13964-11-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912201055.13964-1-jacopo@jmondi.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Parse device properties and register controls for them using the newly
introduced helpers.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 041fcbb4eebd..3d14f16644ff 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 
 #define OV5670_REG_CHIP_ID		0x300a
 #define OV5670_CHIP_ID			0x005670
@@ -2059,6 +2060,8 @@ static const struct v4l2_ctrl_ops ov5670_ctrl_ops = {
 /* Initialize control handlers */
 static int ov5670_init_controls(struct ov5670 *ov5670)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
+	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 vblank_max;
 	s64 vblank_def;
@@ -2129,6 +2132,15 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
 		goto error;
 	}
 
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		return ret;
+
+	ret = v4l2_ctrl_register_properties(ctrl_hdlr, &ov5670_ctrl_ops,
+					    &props);
+	if (ret)
+		return ret;
+
 	ov5670->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
-- 
2.23.0

