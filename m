Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F21F6191AE3
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 21:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbgCXUZ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 16:25:58 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:46009 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgCXUZ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 16:25:58 -0400
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 60155100010;
        Tue, 24 Mar 2020 20:25:55 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com
Subject: [PATCH 2/4] media: v4l2-dev: Add v4l2_device_register_ro_subdev_node()
Date:   Tue, 24 Mar 2020 21:28:42 +0100
Message-Id: <20200324202844.1518292-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324202844.1518292-1-jacopo@jmondi.org>
References: <20200324202844.1518292-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add to the V4L2 code a function to register device nodes for video
subdevices in read-only mode.

Registering a device node in read-only mode is useful to expose to
userspace the current sub-device configuration, without allowing
application to change it by using the V4L2 subdevice ioctls.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-device.c | 16 +++++++++++++++-
 drivers/media/v4l2-core/v4l2-subdev.c | 19 +++++++++++++++++++
 include/media/v4l2-dev.h              |  7 +++++++
 include/media/v4l2-device.h           | 10 ++++++++++
 4 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 63d6b147b21e..6f9dba36eda1 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -188,7 +188,8 @@ static void v4l2_device_release_subdev_node(struct video_device *vdev)
 	kfree(vdev);
 }
 
-int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
+int __v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev,
+					bool read_only)
 {
 	struct video_device *vdev;
 	struct v4l2_subdev *sd;
@@ -217,6 +218,8 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
 		vdev->fops = &v4l2_subdev_fops;
 		vdev->release = v4l2_device_release_subdev_node;
 		vdev->ctrl_handler = sd->ctrl_handler;
+		if (read_only)
+			vdev->flags |= V4L2_FL_RO_DEVNODE;
 		err = __video_register_device(vdev, VFL_TYPE_SUBDEV, -1, 1,
 					      sd->owner);
 		if (err < 0) {
@@ -254,8 +257,19 @@ int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
 
 	return err;
 }
+
+int v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev)
+{
+	return __v4l2_device_register_subdev_nodes(v4l2_dev, false);
+}
 EXPORT_SYMBOL_GPL(v4l2_device_register_subdev_nodes);
 
+int v4l2_device_register_ro_subdev_nodes(struct v4l2_device *v4l2_dev)
+{
+	return __v4l2_device_register_subdev_nodes(v4l2_dev, true);
+}
+EXPORT_SYMBOL_GPL(v4l2_device_register_ro_subdev_nodes);
+
 void v4l2_device_unregister_subdev(struct v4l2_subdev *sd)
 {
 	struct v4l2_device *v4l2_dev;
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f725cd9b66b9..9247ee6c293f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -331,6 +331,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	struct v4l2_fh *vfh = file->private_data;
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
+	bool ro_devnode = !!(vdev->flags & V4L2_FL_RO_DEVNODE);
 	int rval;
 #endif
 
@@ -453,6 +454,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
+		if (format->which != V4L2_SUBDEV_FORMAT_TRY && ro_devnode)
+			return -EPERM;
+
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
 		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
@@ -480,6 +484,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_crop *crop = arg;
 		struct v4l2_subdev_selection sel;
 
+		if (crop->which != V4L2_SUBDEV_FORMAT_TRY && ro_devnode)
+			return -EPERM;
+
 		memset(crop->reserved, 0, sizeof(crop->reserved));
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
@@ -521,6 +528,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
+		if (ro_devnode)
+			return -EPERM;
+
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
 	}
@@ -544,6 +554,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_SELECTION: {
 		struct v4l2_subdev_selection *sel = arg;
 
+		if (sel->which != V4L2_SUBDEV_FORMAT_TRY && ro_devnode)
+			return -EPERM;
+
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
 			sd, pad, set_selection, subdev_fh->pad, sel);
@@ -580,6 +593,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		return v4l2_subdev_call(sd, video, g_dv_timings, arg);
 
 	case VIDIOC_SUBDEV_S_DV_TIMINGS:
+		if (ro_devnode)
+			return -EPERM;
+
 		return v4l2_subdev_call(sd, video, s_dv_timings, arg);
 
 	case VIDIOC_SUBDEV_G_STD:
@@ -588,6 +604,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_S_STD: {
 		v4l2_std_id *std = arg;
 
+		if (ro_devnode)
+			return -EPERM;
+
 		return v4l2_subdev_call(sd, video, s_std, *std);
 	}
 
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 48531e57cc5a..029873a338f2 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -82,11 +82,18 @@ struct v4l2_ctrl_handler;
  *	but the old crop API will still work as expected in order to preserve
  *	backwards compatibility.
  *	Never set this flag for new drivers.
+ * @V4L2_FL_RO_DEVNODE:
+ *	indicates that the video device node is registered in read-only mode.
+ *	The flag only applies to device nodes registered for sub-devices, it is
+ *	set by the core when the sub-devices device nodes are registered with
+ *	v4l2_device_register_ro_subdev_nodes() and used by the sub-device ioctl
+ *	handler to restrict access to some ioctl calls.
  */
 enum v4l2_video_device_flags {
 	V4L2_FL_REGISTERED		= 0,
 	V4L2_FL_USES_V4L2_FH		= 1,
 	V4L2_FL_QUIRK_INVERTED_CROP	= 2,
+	V4L2_FL_RO_DEVNODE		= 3,
 };
 
 /* Priority helper functions */
diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index e0b8f2602670..0df667ba9938 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -183,6 +183,16 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd);
 int __must_check
 v4l2_device_register_subdev_nodes(struct v4l2_device *v4l2_dev);
 
+/**
+ * v4l2_device_register_ro_subdev_nodes - Registers read-only device nodes for
+ *      all subdevs of the v4l2 device that are marked with the
+ *      %V4L2_SUBDEV_FL_HAS_DEVNODE flag.
+ *
+ * @v4l2_dev: pointer to struct v4l2_device
+ */
+int __must_check
+v4l2_device_register_ro_subdev_nodes(struct v4l2_device *v4l2_dev);
+
 /**
  * v4l2_subdev_notify - Sends a notification to v4l2_device.
  *
-- 
2.25.1

