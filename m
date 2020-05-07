Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2961C8F8F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 16:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbgEGOc5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 10:32:57 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:56421 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728968AbgEGOc4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 10:32:56 -0400
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0B29D200007;
        Thu,  7 May 2020 14:32:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH v6 4/6] media: v4l2-subdev: Guard whole fops and ioctl hdlr
Date:   Thu,  7 May 2020 16:35:35 +0200
Message-Id: <20200507143537.2945672-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200507143537.2945672-1-jacopo@jmondi.org>
References: <20200507143537.2945672-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A sub-device device node can be registered in user space only if the
CONFIG_V4L2_SUBDEV_API Kconfig option is selected. Currently the
open/close file operations and the ioctl handler have some parts of their
implementations guarded by #if defined(CONFIG_V4L2_SUBDEV_API), while
they are actually not accessible without a video device node registered
to user space.

Guard the whole open, close and ioctl handler and provide stubs if the
V4L2_SUBDEV_API Kconfig option is not selected.

This slightly reduces the kernel size when the option is not selected
and simplifies the file ops and ioctl implementations.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 39 +++++++++++++++++++++------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 1dc263c2ca0aa..174778f9c0bc4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -22,24 +22,22 @@
 #include <media/v4l2-fh.h>
 #include <media/v4l2-event.h>

+#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 {
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	if (sd->entity.num_pads) {
 		fh->pad = v4l2_subdev_alloc_pad_config(sd);
 		if (fh->pad == NULL)
 			return -ENOMEM;
 	}
-#endif
+
 	return 0;
 }

 static void subdev_fh_free(struct v4l2_subdev_fh *fh)
 {
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	v4l2_subdev_free_pad_config(fh->pad);
 	fh->pad = NULL;
-#endif
 }

 static int subdev_open(struct file *file)
@@ -111,6 +109,17 @@ static int subdev_close(struct file *file)

 	return 0;
 }
+#else /* CONFIG_VIDEO_V4L2_SUBDEV_API */
+static int subdev_open(struct file *file)
+{
+	return -ENODEV;
+}
+
+static int subdev_close(struct file *file)
+{
+	return -ENODEV;
+}
+#endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */

 static inline int check_which(u32 which)
 {
@@ -324,15 +333,14 @@ const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
 };
 EXPORT_SYMBOL(v4l2_subdev_call_wrappers);

+#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
 	struct v4l2_fh *vfh = file->private_data;
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
 	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
-#endif
 	int rval;

 	switch (cmd) {
@@ -466,7 +474,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		return ret;
 	}

-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	case VIDIOC_SUBDEV_G_FMT: {
 		struct v4l2_subdev_format *format = arg;

@@ -646,7 +653,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)

 	case VIDIOC_SUBDEV_QUERYSTD:
 		return v4l2_subdev_call(sd, video, querystd, arg);
-#endif
+
 	default:
 		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
 	}
@@ -686,6 +693,22 @@ static long subdev_compat_ioctl32(struct file *file, unsigned int cmd,
 }
 #endif

+#else /* CONFIG_VIDEO_V4L2_SUBDEV_API */
+static long subdev_ioctl(struct file *file, unsigned int cmd,
+			 unsigned long arg)
+{
+	return -ENODEV;
+}
+
+#ifdef CONFIG_COMPAT
+static long subdev_compat_ioctl32(struct file *file, unsigned int cmd,
+				  unsigned long arg)
+{
+	return -ENODEV;
+}
+#endif
+#endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
+
 static __poll_t subdev_poll(struct file *file, poll_table *wait)
 {
 	struct video_device *vdev = video_devdata(file);
--
2.26.1

