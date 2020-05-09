Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3C31CBF81
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 11:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgEIJCX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 05:02:23 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:54849 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgEIJCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 05:02:23 -0400
X-Originating-IP: 212.216.150.148
Received: from uno.homenet.telecomitalia.it (a-ur1-85.tin.it [212.216.150.148])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B063E1C0004;
        Sat,  9 May 2020 09:02:19 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz
Subject: [PATCH v11 10/13] media: i2c: ov5670: Parse and register properties
Date:   Sat,  9 May 2020 11:04:53 +0200
Message-Id: <20200509090456.3496481-11-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200509090456.3496481-1-jacopo@jmondi.org>
References: <20200509090456.3496481-1-jacopo@jmondi.org>
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
 drivers/media/i2c/ov5670.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 041fcbb4eebdf..f26252e35e08d 100644
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
@@ -2067,7 +2070,7 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
 	int ret;
 
 	ctrl_hdlr = &ov5670->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
 	if (ret)
 		return ret;
 
@@ -2129,6 +2132,15 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
 		goto error;
 	}
 
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov5670_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
 	ov5670->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
-- 
2.26.1

