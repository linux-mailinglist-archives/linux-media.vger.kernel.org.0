Return-Path: <linux-media+bounces-18274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E5D978AD5
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABD73B21713
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AED15B96E;
	Fri, 13 Sep 2024 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dHmNoi3d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4183B1494DC
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 21:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264044; cv=none; b=kjhnVz/Wo7bEJlQ5aSQzjsWM5J1OoI+6nOpjfKWfLMeE0eynlMYijuRsE0x4orA2UWYXMhgX1IjKLeckT1tyfhWWWact00UC2En8JKY/0KYAej5Ux99TJr4U3Jn5W3KdI1+4GIl6Hfz+qF+AKJPkKnQE/u4vMi2bz+HqmLK4suE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264044; c=relaxed/simple;
	bh=Mnk9/vCsnWJmWkDF7clpn0Msnwh3eeWCj3x+YSeI8Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1j9ml8le7hJC5e5REscQ7elTLnUdJml6MyVFvm8Usrz1mA36MB9oKTNB9KodDjKlZwhn3Ob5pHBCBuP4eNJBUUa8vujq2cHls/AR+nOCAbcp88zdWMVpIl2Q2X0ku/GOctrc9H3cXn43DKnSLLAjNMqRjjnWHHQ81ptWsx6oPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dHmNoi3d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF11A19BC;
	Fri, 13 Sep 2024 23:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726263950;
	bh=Mnk9/vCsnWJmWkDF7clpn0Msnwh3eeWCj3x+YSeI8Io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dHmNoi3dkn5wnWfSXyeQSK8csm/6SLjG0UZ+VboxYWYF0BWMxIacVFDGCfIIQN5we
	 8K7XWXI0pPYFp4pbDnDZF8p1R1ezZwXvxezbFPj+FRsNgZE6bG7faR8Q3YYLHVeK19
	 GRDmTuV6ID8g4b/kxwvEu9tr4ekpuUXZq+wBZ9No=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 05/10] media: Introduce default contexts
Date: Fri, 13 Sep 2024 23:46:50 +0200
Message-ID: <20240913214657.1502838-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
References: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the media device and video device default contexts.

Drivers ported to use multi-context support that used to work with a
non-context aware userspace (which doesn't call VIDIOC_BIND_CONTEXT)
shall continue to work even if they are context aware.

Provide a default context in the media device and in the video device
structures and let drivers allocate and release them with the newly
introduced operations.

Bind the video device default context to the default context of the
media device associated with the v4l2_dev.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-device.c       | 11 ++++++++
 drivers/media/v4l2-core/v4l2-dev.c | 43 +++++++++++++++++++++++++++++-
 include/media/media-device.h       |  5 ++++
 include/media/v4l2-dev.h           |  1 +
 4 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 1b24d5e74ffb..b4ebe30c21aa 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -828,6 +828,16 @@ void media_device_init(struct media_device *mdev)
 		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
 				   mdev->dev);
 
+	mdev->default_context = NULL;
+	if (mdev->ops &&
+	    mdev->ops->alloc_context && mdev->ops->destroy_context) {
+		if (mdev->ops->alloc_context(mdev, &mdev->default_context)) {
+			dev_err(mdev->dev,
+				"Failed to initialize media device default context\n");
+			return;
+		}
+	}
+
 	dev_dbg(mdev->dev, "Media device initialized\n");
 }
 EXPORT_SYMBOL_GPL(media_device_init);
@@ -836,6 +846,7 @@ void media_device_cleanup(struct media_device *mdev)
 {
 	WARN_ON(mdev->ops && mdev->ops->release);
 	__media_device_release(mdev);
+	media_device_context_put(mdev->default_context);
 	media_device_put(mdev);
 }
 EXPORT_SYMBOL_GPL(media_device_cleanup);
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 41719b009c1e..73462191fd17 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -31,6 +31,8 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
 
+#include <media/media-device.h>
+
 #define VIDEO_NUM_DEVICES	256
 #define VIDEO_NAME              "video4linux"
 
@@ -221,6 +223,12 @@ static void v4l2_device_release(struct device *cd)
 		media_device_put(mdev);
 #endif
 
+	/* Release default context. */
+#ifdef CONFIG_MEDIA_CONTROLLER
+	video_device_context_put(vdev->default_context);
+#endif
+	vdev->default_context = NULL;
+
 	/* Release video_device and perform other cleanups as needed. */
 	vdev->release(vdev);
 
@@ -1096,7 +1104,36 @@ int __video_register_device(struct video_device *vdev,
 	/* Part 5: Register the entity. */
 	ret = video_register_media_controller(vdev);
 
-	/* Part 6: Activate this minor. The char device can now be used. */
+	/*
+	 * Part 6: Complete the video device registration by initializing the
+	 * default context. The defaul context serves for context-aware driver
+	 * to operate with a non-context-aware userspace that never creates
+	 * new contexts. If the video device driver is not context aware, it
+	 * will never implement 'context_ops' and will never use the default
+	 * context.
+	 */
+	vdev->default_context = NULL;
+#ifdef CONFIG_MEDIA_CONTROLLER
+	if (vdev->entity.ops && vdev->entity.ops->alloc_context &&
+	    vdev->entity.ops->destroy_context) {
+		ret = vdev->entity.ops->alloc_context(&vdev->entity,
+					(struct media_entity_context **)
+					&vdev->default_context);
+		if (ret) {
+			pr_err("%s: default context alloc failed\n", __func__);
+			goto cleanup;
+		}
+
+		ret = media_device_bind_context(vdev->v4l2_dev->mdev->default_context,
+						&vdev->default_context->base);
+		if (ret) {
+			pr_err("%s: default context bind failed\n", __func__);
+			goto cleanup;
+		}
+	}
+#endif
+
+	/* Part 7: Activate this minor. The char device can now be used. */
 	set_bit(V4L2_FL_REGISTERED, &vdev->flags);
 	mutex_unlock(&videodev_lock);
 
@@ -1104,6 +1141,10 @@ int __video_register_device(struct video_device *vdev,
 
 cleanup:
 	mutex_lock(&videodev_lock);
+#ifdef CONFIG_MEDIA_CONTROLLER
+	video_device_context_put(vdev->default_context);
+#endif
+	vdev->default_context = NULL;
 	if (vdev->cdev)
 		cdev_del(vdev->cdev);
 	video_devices[vdev->minor] = NULL;
diff --git a/include/media/media-device.h b/include/media/media-device.h
index a73f650f122f..74c0a2e1f003 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -185,6 +185,9 @@ struct media_device_ops {
  * @fh_list:	List of file handles in the media device
  *		(struct media_device_fh.mdev_list).
  * @fh_list_lock: Serialise access to fh_list list.
+ * @default_context: The default video device context. Used by drivers that
+ *		     support multi-context operation when operated by a
+ *		     non-context aware userspace.
  *
  * This structure represents an abstract high-level media device. It allows easy
  * access to entities and provides basic media device-level support. The
@@ -261,6 +264,8 @@ struct media_device {
 
 	struct list_head fh_list;
 	spinlock_t fh_list_lock;
+
+	struct media_device_context *default_context;
 };
 
 /* We don't need to include usb.h here */
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index d538f0f32d6d..b79b14e36a2a 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -282,6 +282,7 @@ struct video_device {
 
 	struct vb2_queue *queue;
 
+	struct video_device_context *default_context;
 	struct v4l2_prio_state *prio;
 
 	/* device info */
-- 
2.46.0


