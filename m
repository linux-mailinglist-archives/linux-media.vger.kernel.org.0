Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16EA1CE934
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 18:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbfJGQ1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 12:27:55 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:55017 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728930AbfJGQ1z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 12:27:55 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4C3FC240011;
        Mon,  7 Oct 2019 16:27:52 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v4 09/11] media: v4l2-ctrls: Add helper to register properties
Date:   Mon,  7 Oct 2019 18:29:11 +0200
Message-Id: <20191007162913.250743-10-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007162913.250743-1-jacopo@jmondi.org>
References: <20191007162913.250743-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an helper function to v4l2-ctrls to register controls associated
with a device property.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 40 ++++++++++++++++++++++++++++
 include/media/v4l2-ctrls.h           | 26 ++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 6fb94968a98d..50e9daa7a75a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -16,6 +16,7 @@
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-ioctl.h>
 
 #define dprintk(vdev, fmt, arg...) do {					\
@@ -4417,3 +4418,42 @@ __poll_t v4l2_ctrl_poll(struct file *file, struct poll_table_struct *wait)
 	return 0;
 }
 EXPORT_SYMBOL(v4l2_ctrl_poll);
+
+int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
+				    const struct v4l2_ctrl_ops *ctrl_ops,
+				    const struct v4l2_fwnode_device_properties *p)
+{
+	if (p->location != V4L2_FWNODE_PROPERTY_UNSET) {
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
+	if (p->rotation != V4L2_FWNODE_PROPERTY_UNSET) {
+		if (!v4l2_ctrl_new_std(hdl, ctrl_ops,
+				       V4L2_CID_CAMERA_SENSOR_ROTATION,
+				       p->rotation, p->rotation, 1,
+				       p->rotation))
+			return hdl->error;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(v4l2_ctrl_new_fwnode_properties);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 95b4fa6243d1..6bf8c304c431 100644
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
@@ -1330,4 +1331,29 @@ int v4l2_ctrl_subdev_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
  */
 int v4l2_ctrl_subdev_log_status(struct v4l2_subdev *sd);
 
+/**
+ * v4l2_ctrl_new_fwnode_properties() - Register controls for the device
+ *				       properties
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
+ * Return: 0 on success, a negative error code on failure.
+ */
+int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
+				    const struct v4l2_ctrl_ops *ctrl_ops,
+				    const struct v4l2_fwnode_device_properties *p);
 #endif
-- 
2.23.0

