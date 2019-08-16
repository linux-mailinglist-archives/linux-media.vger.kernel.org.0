Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 663B3903CF
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 16:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbfHPORZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 10:17:25 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:45161 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbfHPORL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 10:17:11 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.homenet.telecomitalia.it (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7B039FF80E;
        Fri, 16 Aug 2019 14:17:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/6] media: v4l2-fwnode: Add helper to register controls from fw
Date:   Fri, 16 Aug 2019 16:18:20 +0200
Message-Id: <20190816141822.7582-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190816141822.7582-1-jacopo@jmondi.org>
References: <20190816141822.7582-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the 'v4l2_fwnode_register_controls()' helper to v4l2-fwnode. The
function parses the device node and endpoint firmware properties to
which a v4l2 control is associated to and register the control with the
provided handler.

Currently, only V4L2_CID_CAMERA_LOCATION is supported.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 40 +++++++++++++++++++++++++++
 include/media/v4l2-fwnode.h           | 29 +++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 3bd1888787eb..8ad7f70aa2f1 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -25,6 +25,7 @@
 #include <linux/types.h>
 
 #include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -595,6 +596,45 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
 
+int v4l2_fwnode_register_controls(struct fwnode_handle *fwnode,
+				  struct v4l2_ctrl_handler *hdl,
+				  const struct v4l2_ctrl_ops *ctrl_ops)
+{
+	u32 val;
+	int ret;
+
+	ret = fwnode_property_read_u32(fwnode, "location", &val);
+	if (ret)
+		return 0;
+
+	switch (val) {
+	case V4L2_LOCATION_FRONT:
+	case V4L2_LOCATION_BACK:
+	case V4L2_LOCATION_EXTERNAL:
+		break;
+	default:
+		pr_warn("Unsupported location: %u\n", val);
+		return -EINVAL;
+	}
+
+	if (v4l2_ctrl_find(hdl, V4L2_CID_CAMERA_SENSOR_LOCATION))
+		pr_debug("Skip control '%s': already registered",
+			 v4l2_ctrl_get_name(V4L2_CID_CAMERA_SENSOR_LOCATION));
+	else
+		v4l2_ctrl_new_std(hdl, ctrl_ops,
+				  V4L2_CID_CAMERA_SENSOR_LOCATION,
+				  val, val, 1, val);
+
+	if (hdl->error) {
+		pr_warn("Failed to register controls from firmware: %d\n",
+			hdl->error);
+		return hdl->error;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_fwnode_register_controls);
+
 static int
 v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
 					  struct v4l2_async_notifier *notifier,
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index f6a7bcd13197..942c4c21080b 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -25,6 +25,8 @@
 struct fwnode_handle;
 struct v4l2_async_notifier;
 struct v4l2_async_subdev;
+struct v4l2_ctrl_handler;
+struct v4l2_ctrl_ops;
 
 #define V4L2_FWNODE_CSI2_MAX_DATA_LANES	4
 
@@ -233,6 +235,33 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
  */
 void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
 
+/**
+ * v4l2_fwnode_register_controls() - parse device and endpoint fwnode
+ *				     properties and register a v4l2 control
+ *				     for each of them
+ * @fwnode: pointer to the device fwnode handle
+ * @hdl: pointer to the v4l2 control handler to register controls with
+ * @ctrl_ops: pointer to the v4l2 control operations to register with the handler
+ *
+ * Parse the @fwnode device and endpoint properties to which a v4l2 control
+ * is associated and register them with the provided handler @hdl.
+ * Currently the following v4l2 controls are parsed and registered:
+ * - V4L2_CID_CAMERA_SENSOR_LOCATION;
+ *
+ * Controls already registered by the caller with the @hdl control handler
+ * are not overwritten by this function. Callers should register the controls
+ * they want to handle themeselves before calling this function.
+ *
+ * NOTE: This function locks the @hdl control handler mutex, the caller shall
+ * not hold the lock when calling this function.
+ *
+ * Return: 0 on success, -EINVAL if the fwnode properties are not well
+ * specified.
+ */
+int v4l2_fwnode_register_controls(struct fwnode_handle *fwnode,
+				  struct v4l2_ctrl_handler *hdl,
+				  const struct v4l2_ctrl_ops *ctrl_ops);
+
 /**
  * typedef parse_endpoint_func - Driver's callback function to be called on
  *	each V4L2 fwnode endpoint.
-- 
2.22.0

