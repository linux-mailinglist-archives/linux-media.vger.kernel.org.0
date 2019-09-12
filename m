Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7452B1536
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbfILUKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 16:10:02 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:59355 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfILUKC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:10:02 -0400
X-Originating-IP: 85.243.204.24
Received: from uno.lan (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CE27820002;
        Thu, 12 Sep 2019 20:09:57 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v3 09/11] media: v4l2-ctrls: Add helper to register properties
Date:   Thu, 12 Sep 2019 22:10:53 +0200
Message-Id: <20190912201055.13964-10-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912201055.13964-1-jacopo@jmondi.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an helper function to v4l2-ctrls to register controls associated
with a device property. Add an UNSET flag to the device properties to
distinguish uninitialized properties from properties with an actual
value at control registration time.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c  | 42 +++++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-fwnode.c |  2 ++
 include/media/v4l2-ctrls.h            | 28 ++++++++++++++++++
 include/media/v4l2-fwnode.h           |  2 ++
 4 files changed, 74 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 6fb94968a98d..46e170f04aed 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -16,6 +16,7 @@
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-ioctl.h>
 
 #define dprintk(vdev, fmt, arg...) do {					\
@@ -4417,3 +4418,44 @@ __poll_t v4l2_ctrl_poll(struct file *file, struct poll_table_struct *wait)
 	return 0;
 }
 EXPORT_SYMBOL(v4l2_ctrl_poll);
+
+int v4l2_ctrl_register_properties(struct v4l2_ctrl_handler *hdl,
+				  const struct v4l2_ctrl_ops *ctrl_ops,
+				  const struct v4l2_fwnode_device_properties *p)
+{
+	if (p->location != V4L2_FWNODE_PROPERTY_UNSET &&
+	    !v4l2_ctrl_find(hdl, V4L2_CID_CAMERA_SENSOR_LOCATION)) {
+		u32 location_ctrl;
+
+		switch (p->location) {
+		case V4L2_FWNODE_LOCATION_FRONT:
+			location_ctrl = V4L2_LOCATION_FRONT;
+			break;
+		case V4L2_FWNODE_LOCATION_BACK:
+			location_ctrl = V4L2_LOCATION_BACK;
+			break;
+		case V4L2_FWNODE_LOCATION_EXTERNAL:
+			location_ctrl = V4L2_LOCATION_EXTERNAL;
+			break;
+		default:
+			return -EINVAL;
+		}
+		if (!v4l2_ctrl_new_std(hdl, ctrl_ops,
+				       V4L2_CID_CAMERA_SENSOR_LOCATION,
+				       location_ctrl, location_ctrl, 1,
+				       location_ctrl))
+			return hdl->error;
+	}
+
+	if (p->rotation != V4L2_FWNODE_PROPERTY_UNSET &&
+	    !v4l2_ctrl_find(hdl, V4L2_CID_CAMERA_SENSOR_ROTATION)) {
+		if (!v4l2_ctrl_new_std(hdl, ctrl_ops,
+				       V4L2_CID_CAMERA_SENSOR_ROTATION,
+				       p->rotation, p->rotation, 1,
+				       p->rotation))
+			return hdl->error;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(v4l2_ctrl_register_properties);
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index d325a2d5c088..e4fed288e498 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -605,6 +605,7 @@ int v4l2_fwnode_device_parse(struct device *dev,
 	memset(props, 0, sizeof(*props));
 
 	dev_dbg(dev, "===== begin V4L2 device properties parsing\n");
+	props->location = V4L2_FWNODE_PROPERTY_UNSET;
 	ret = fwnode_property_read_u32(fwnode, "location", &val);
 	if (!ret) {
 		switch (val) {
@@ -621,6 +622,7 @@ int v4l2_fwnode_device_parse(struct device *dev,
 		dev_dbg(dev, "device location: %u\n", val);
 	}
 
+	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
 	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
 	if (!ret) {
 		if (val >= 360 || val % 90) {
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 95b4fa6243d1..ce73911f180b 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -29,6 +29,7 @@ struct v4l2_ctrl;
 struct v4l2_ctrl_handler;
 struct v4l2_ctrl_helper;
 struct v4l2_fh;
+struct v4l2_fwnode_device_properties;
 struct v4l2_subdev;
 struct v4l2_subscribed_event;
 struct video_device;
@@ -1330,4 +1331,31 @@ int v4l2_ctrl_subdev_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
  */
 int v4l2_ctrl_subdev_log_status(struct v4l2_subdev *sd);
 
+/**
+ * v4l2_ctrl_register_properties() - Register controls for the device properties
+ *
+ * @hdl: pointer to &struct v4l2_ctrl_handler to register controls on
+ * @ctrl_ops: pointer to &struct v4l2_ctrl_ops to register controls with
+ * @p: pointer to &struct v4l2_fwnode_device_properties
+ *
+ * This function registers controls associated to device properties, using the
+ * property values contained in @p parameter, if the property has been set to
+ * a value.
+ *
+ * Currently the following v4l2 controls are parsed and registered:
+ * - V4L2_CID_CAMERA_SENSOR_LOCATION;
+ * - V4L2_CID_CAMERA_SENSOR_ROTATION;
+ *
+ * Controls already registered by the caller with the @hdl control handler are
+ * not overwritten. Callers should register the controls they want to handle
+ * themselves before calling this function.
+ *
+ * NOTE: This function locks the @hdl control handler mutex, the caller shall
+ * not hold the lock when calling this function.
+ *
+ * Return: 0 on success, a negative error code on failure.
+ */
+int v4l2_ctrl_register_properties(struct v4l2_ctrl_handler *hdl,
+				  const struct v4l2_ctrl_ops *ctrl_ops,
+				  const struct v4l2_fwnode_device_properties *p);
 #endif
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 86af6d9d11fe..ae02db22c70e 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -109,6 +109,8 @@ struct v4l2_fwnode_endpoint {
 	unsigned int nr_of_link_frequencies;
 };
 
+#define V4L2_FWNODE_PROPERTY_UNSET	(-1U)
+
 /**
  * enum v4l2_fwnode_location - possible device locations
  * @V4L2_FWNODE_LOCATION_FRONT: device installed on the front side
-- 
2.23.0

