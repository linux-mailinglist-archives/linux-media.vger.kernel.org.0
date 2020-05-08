Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581EC1CA7B5
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 11:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgEHJ7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 05:59:37 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:37115 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgEHJ7g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 May 2020 05:59:36 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BA373FF80B;
        Fri,  8 May 2020 09:59:33 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz
Subject: [PATCH v10 12/13] media: i2c: ov13858: Parse and register properties
Date:   Fri,  8 May 2020 12:01:57 +0200
Message-Id: <20200508100158.3437161-13-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200508100158.3437161-1-jacopo@jmondi.org>
References: <20200508100158.3437161-1-jacopo@jmondi.org>
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
 drivers/media/i2c/ov13858.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index aac6f77afa0f4..236ad2c816b70 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 
 #define OV13858_REG_VALUE_08BIT		1
 #define OV13858_REG_VALUE_16BIT		2
@@ -1589,6 +1590,7 @@ static const struct v4l2_subdev_internal_ops ov13858_internal_ops = {
 static int ov13858_init_controls(struct ov13858 *ov13858)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov13858->sd);
+	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
 	s64 vblank_def;
@@ -1600,7 +1602,7 @@ static int ov13858_init_controls(struct ov13858 *ov13858)
 	int ret;
 
 	ctrl_hdlr = &ov13858->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
 	if (ret)
 		return ret;
 
@@ -1666,6 +1668,15 @@ static int ov13858_init_controls(struct ov13858 *ov13858)
 		goto error;
 	}
 
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov13858_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
 	ov13858->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
-- 
2.26.1

