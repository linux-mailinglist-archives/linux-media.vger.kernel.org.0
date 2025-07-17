Return-Path: <linux-media+bounces-37974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBF5B08B11
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E54A169E6B
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D021F2BD587;
	Thu, 17 Jul 2025 10:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qhwKVawd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F92BCF51;
	Thu, 17 Jul 2025 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749160; cv=none; b=roWeFLzOVVWsd/bFFzQwIn8ftOr71JHiFlRjqBbx94M3g8aMvINhVXjo/2pB4oo+WT/2Ga5r36XlWOC3/JMSL2UjxHUAyV/mBTgkUWDRdUSQwoVAkF+mCM2p0kAMCOxQ9nqpTje2oNyQuRRNtj0iDnLv60yS1CXeCSJG/lQ33LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749160; c=relaxed/simple;
	bh=EonmGcn1CUXqn+CIokljWT6wYvOQxvsBhcP+HctWnYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dRUVfcjs4QbyHsM7SlCCzvvW6qgwn8fN8T/ShyXou6lOf0f5CkcvfV2AVp4NsxN0vDyvQjQ0vt9TFzA6rg1oIg7KAE4JKIcpG/lOQq3bBTA8ryRQqmCZrNeOJPuE9m5+GiJl/UKTS+HcNTLjLr5bHKk5PLLizDQhQ4oNLMiEx1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qhwKVawd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBBE61FA4;
	Thu, 17 Jul 2025 12:45:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749118;
	bh=EonmGcn1CUXqn+CIokljWT6wYvOQxvsBhcP+HctWnYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qhwKVawdjRs89dZMeIMZ9874dTZKV8VYv2Qpkd4StVdxc5TCzqnfEXETURqSSTk78
	 K3pyKkexxunKZAvdRvgGuT2S2M4giLXyotrm+IuAAO2wMv9lcEKw7cm6inc2Te2a5X
	 aCFSo42/fcppnGDoFM7ip9skMFZnzbRYEZEuBCVk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:34 +0200
Subject: [PATCH 08/26] media: v4l2-dev: Introduce default contexts
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-8-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6550;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=EonmGcn1CUXqn+CIokljWT6wYvOQxvsBhcP+HctWnYE=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRPhWQgMR/YWcKAffqyCaN5tFPhmYw9o3CJD
 wRQLkVuNd2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUTwAKCRByNAaPFqFW
 PEycD/47kDMLqGLWmoTXR4z/+6Xe7Kf4IxN8CNBGoao1QvXSk4UlQ0ZXq9RKqX/WT7l9jecuICL
 0Y/IEf8y0ekf7HMdgs4ewv1znQ/6xFMWoA4oyqF80bZ9dNtO9k0p5JqMLcyRAJeHkXWogWZD6lD
 pbHbbtRLWpZX+V8Ku7jdp3ByLSl2syCmRC9j0r0dAFo0As59ZLQwER8fpwBH3qk2NWwPR/E8x/j
 JlDD4VI6S9UtZSuIq0qfV2yhtI8TQ+Dz8LL81Kq5EYPxprzI6IkvajE4qBrdSDg3Qr6AAydfVJi
 jgKFK/sK+HJJBC8MmBFiX5STEdxEu0McOkru3CQSUasKYWmNgbsL5kdgOLMtH0Ldcfbi1XiQPYS
 UR72PL19sZEVQ+ni6EDcRHqOXfpwAXjQQoGZoA31u1SxXRjsZQCnFQD1GPCPKB6n5yPvjoUlENW
 1xQjVeS8pDjqn3oBf55pQs1frrF9+6/tVKrPgeLF7tw2brib/+iZz1f4COgxiogRwb+JwDZXsWo
 AvdaO7xCrQL1JVCx/Q6WOhS4cjpa3/wF3w+JoCmBTWOgOwW1KFOyOTjNXm+k7quV5ECH/VUv4bb
 Z2hXNXqXn9ZnA+CC7I0ehsIGQTzNL62YmVRbODzCFACKZVmDYZosUugxzKYbCeRM9hS2MjFdkFw
 ue4Nr8q5pDFRj8w==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

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
 drivers/media/mc/mc-device.c       | 11 +++++++++
 drivers/media/v4l2-core/v4l2-dev.c | 46 +++++++++++++++++++++++++++++++++++---
 include/media/media-device.h       |  5 +++++
 include/media/v4l2-dev.h           |  3 +++
 4 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index d8f12db933d22ae7466051698d853f4bdc599400..e1f34f884fee2e8c3750f9c1e85142ff2f6b7bf0 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -746,12 +746,23 @@ void media_device_init(struct media_device *mdev)
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
 
 void media_device_cleanup(struct media_device *mdev)
 {
+	media_device_context_put(mdev->default_context);
 	ida_destroy(&mdev->entity_internal_idx);
 	mdev->entity_internal_idx_max = 0;
 	media_graph_walk_cleanup(&mdev->pm_count_walk);
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index bc6502b4ce21cc0ad53136e1637d1c926e31dd89..2d78096931efd88215bc847b105e198a54035546 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -31,6 +31,8 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
 
+#include <media/media-device.h>
+
 #define VIDEO_NUM_DEVICES	256
 #define VIDEO_NAME              "video4linux"
 
@@ -220,8 +222,13 @@ static void v4l2_device_release(struct device *cd)
 	if (v4l2_dev->release == NULL)
 		v4l2_dev = NULL;
 
-	/* Release video_device and perform other
-	   cleanups as needed. */
+	/* Release default context. */
+#ifdef CONFIG_MEDIA_CONTROLLER
+	video_device_context_put(vdev->default_context);
+#endif
+	vdev->default_context = NULL;
+
+	/* Release video_device and perform other cleanups as needed. */
 	vdev->release(vdev);
 
 	/* Decrease v4l2_device refcount */
@@ -1086,7 +1093,36 @@ int __video_register_device(struct video_device *vdev,
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
 
@@ -1094,6 +1130,10 @@ int __video_register_device(struct video_device *vdev,
 
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
index 2ea8fce9ba75700286961f1622584372a954cb8a..b3cc6793a8b5eff4c26e57b01e1a62ab71e8195b 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -184,6 +184,9 @@ struct media_device_ops {
  * @fh_list:	List of file handles in the media device
  *		(struct media_device_fh.mdev_list).
  * @fh_list_lock: Serialise access to fh_list list.
+ * @default_context: The default video device context. Used by drivers that
+ *		     support multi-context operation when operated by a
+ *		     non-context aware userspace.
  *
  * This structure represents an abstract high-level media device. It allows easy
  * access to entities and provides basic media device-level support. The
@@ -260,6 +263,8 @@ struct media_device {
 
 	struct list_head fh_list;
 	spinlock_t fh_list_lock;
+
+	struct media_device_context *default_context;
 };
 
 /* We don't need to include usb.h here */
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 9276e095fb17414a9eb7845db0aa81572c42ca45..9e1cf58623acc4ab5f503a9663fd999b38130226 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -237,6 +237,8 @@ struct v4l2_file_operations {
  * @ctrl_handler: Control handler associated with this device node.
  *	 May be NULL.
  * @queue: &struct vb2_queue associated with this device node. May be NULL.
+ * @default_context: &struct video_device_context associated with this device
+ *		     node
  * @prio: pointer to &struct v4l2_prio_state with device's Priority state.
  *	 If NULL, then v4l2_dev->prio will be used.
  * @name: video device name
@@ -283,6 +285,7 @@ struct video_device {
 
 	struct vb2_queue *queue;
 
+	struct video_device_context *default_context;
 	struct v4l2_prio_state *prio;
 
 	/* device info */

-- 
2.49.0


