Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECFE1CA7B1
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 11:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgEHJ7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 05:59:31 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:36137 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgEHJ7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 May 2020 05:59:30 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0EB70FF806;
        Fri,  8 May 2020 09:59:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz
Subject: [PATCH v10 10/13] media: v4l2-ctrls: Add helper to register properties
Date:   Fri,  8 May 2020 12:01:55 +0200
Message-Id: <20200508100158.3437161-11-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200508100158.3437161-1-jacopo@jmondi.org>
References: <20200508100158.3437161-1-jacopo@jmondi.org>
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
index 265452dae43bb..e4a679db55f09 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -16,6 +16,7 @@
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-ioctl.h>
 
 #define dprintk(vdev, fmt, arg...) do {					\
@@ -4623,3 +4624,42 @@ __poll_t v4l2_ctrl_poll(struct file *file, struct poll_table_struct *wait)
 	return 0;
 }
 EXPORT_SYMBOL(v4l2_ctrl_poll);
+
+int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
+				    const struct v4l2_ctrl_ops *ctrl_ops,
+				    const struct v4l2_fwnode_device_properties *p)
+{
+	if (p->orientation != V4L2_FWNODE_PROPERTY_UNSET) {
+		u32 orientation_ctrl;
+
+		switch (p->orientation) {
+		case V4L2_FWNODE_ORIENTATION_FRONT:
+			orientation_ctrl = V4L2_ORIENTATION_FRONT;
+			break;
+		case V4L2_FWNODE_ORIENTATION_BACK:
+			orientation_ctrl = V4L2_ORIENTATION_BACK;
+			break;
+		case V4L2_FWNODE_ORIENTATION_EXTERNAL:
+			orientation_ctrl = V4L2_ORIENTATION_EXTERNAL;
+			break;
+		default:
+			return -EINVAL;
+		}
+		if (!v4l2_ctrl_new_std_menu(hdl, ctrl_ops,
+					    V4L2_CID_CAMERA_ORIENTATION,
+					    V4L2_ORIENTATION_EXTERNAL, 0,
+					    orientation_ctrl))
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
+	return hdl->error;
+}
+EXPORT_SYMBOL(v4l2_ctrl_new_fwnode_properties);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 224c10823bbff..f40e2cbb21d34 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -30,6 +30,7 @@ struct v4l2_ctrl;
 struct v4l2_ctrl_handler;
 struct v4l2_ctrl_helper;
 struct v4l2_fh;
+struct v4l2_fwnode_device_properties;
 struct v4l2_subdev;
 struct v4l2_subscribed_event;
 struct video_device;
@@ -1428,4 +1429,29 @@ int v4l2_ctrl_subdev_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
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
+ * - V4L2_CID_CAMERA_ORIENTATION
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
2.26.1

