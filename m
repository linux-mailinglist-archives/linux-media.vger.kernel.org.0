Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48CB21D4FC
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729545AbgGMLa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:30:57 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39095 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727890AbgGMLa4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:30:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id uwfYj6z2lGLmCuwfbjB4tM; Mon, 13 Jul 2020 13:30:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594639854; bh=N3j2GzSmLbl6NCGSZ9HQsaaUJLTGBPxk+tjiPRkrRfE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=SQNpE6EC2lxOsUrn4O2MdQb6BWDFYLskFWpLNZXOfqnIsiYMyeuCxjFNjCVYY8rhp
         Y+hLSmmZcQMzmDvel30Xir4WMDnEK8EKy551XpR0L17hcJZEPC75uJR1h7dnFOEtKg
         Yv5WS6QZJZI9I55KAQSylOXpuvRU0FG6EK+Rtaq6tF+RIJAw+lWyo+qAHKJxfarb8M
         BMbIyh/H50jRChiSzEQF9NRNkkEH788KWipXOyPsvyWNzENp+PsDKEHsa32Cwk+Jxh
         7eDj1ulDDjWxDGy0cjDFLxCNjYOPXQcZKakInGPxR8cRrn/UxaW3I6A3mUpH3igSOK
         xvG6n+VMEUQAA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Robert Foss <robert.foss@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Helen Koike <helen.koike@collabora.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCHv3 1/7] videobuf2-v4l2.c: add vb2_video_unregister_device helper function
Date:   Mon, 13 Jul 2020 13:30:42 +0200
Message-Id: <20200713113048.1150542-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMGjLj2W68T9S41ABpylCO2HeD9mOSfSufutuAV/LqHukRMFxZAdQilW2K+j5cHuErszXK3Vy/rfl2vXtGS72ttOjv34Pepbs3sxOAYygQVpJTu9tLGf
 jbXRQ/ghbRewl/3X/fZt4glxj2MRh1yeDHe+jUdNWSBtFSGc6CQ9OCQNN7IEr7L3DeTi4IHBQtiAkWze3cPcBaCa7ZBittzzmy91z/Zw+7aa9qgnwuUuehf4
 TrqP5wcLU6CGGYLwKLopUKaKQ9YEw9UJBmVTSgUEQ8vei4VrNj7jSQmvsKD5ctikT2zixtf6hIDFwAICaZT/UFNsqNV3g1P0+aPAXOcg6FBemg7uc+sXOyn3
 lC3XCxbM1b8eKAy40vMTrwAODH5wm9YDH+L19kiOTUSt1hyqFD3BdsTGECikhAg0ZM7iXjJI7HwVUL4V8RTFypisAjBgKzsMY/63ZrywGkzeufpbihwzeNhi
 9AkNgSn4RXXnHaSIBaCvkRLFAvhuSB1Tnbl8P2Bif+PfWu2bPqHoiFzTIWpk1Q8x/wfHvNazrN3mZ7e1u4qXeN+NFj1pBqZzMWjnwkHArx6WX2soeMCX6tZC
 zLqSr949NzjHxw5JVieD9kxodgygh8ieYifXR9ErJjvGLvQtLN9D4mqxeGCKMksloJA6dZf2lw37sDU3b5Zx04go
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a driver calls (_)vb2_fop_release(), then such a driver should also
call vb2_video_unregister_device() instead of video_unregister_device().
This helper will all vb2_queue_release() if a filehandle is marked as
owner of the queue. This ensures that at unregister time any streaming
is cancelled and all buffers are returned to userspace.

This is very useful for complex drivers since this stops all streaming
in all subdevs in the pipeline controlled by this video device. Otherwise
this would happen until the owner filehandle is closed, which can be quite
some time later.

Bonus points for ordering the includes :-)

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Helen Koike <helen.koike@collabora.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 51 ++++++++++++++++---
 include/media/videobuf2-v4l2.h                | 17 +++++++
 2 files changed, 62 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 57aa183bd198..576057132d3e 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -14,21 +14,22 @@
  * the Free Software Foundation.
  */
 
+#include <linux/device.h>
 #include <linux/err.h>
+#include <linux/freezer.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/kthread.h>
 #include <linux/mm.h>
+#include <linux/module.h>
 #include <linux/poll.h>
-#include <linux/slab.h>
 #include <linux/sched.h>
-#include <linux/freezer.h>
-#include <linux/kthread.h>
+#include <linux/slab.h>
 
+#include <media/v4l2-common.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-fh.h>
 #include <media/v4l2-event.h>
-#include <media/v4l2-common.h>
+#include <media/v4l2-fh.h>
 
 #include <media/videobuf2-v4l2.h>
 
@@ -1234,6 +1235,44 @@ unsigned long vb2_fop_get_unmapped_area(struct file *file, unsigned long addr,
 EXPORT_SYMBOL_GPL(vb2_fop_get_unmapped_area);
 #endif
 
+void vb2_video_unregister_device(struct video_device *vdev)
+{
+	/* Check if vdev was ever registered at all */
+	if (!vdev || !video_is_registered(vdev))
+		return;
+
+	/*
+	 * Calling this function only makes sense if vdev->queue is set.
+	 * If it is NULL, then just call video_unregister_device() instead.
+	 */
+	WARN_ON(!vdev->queue);
+
+	/*
+	 * Take a reference to the device since video_unregister_device()
+	 * calls device_unregister(), but we don't want that to release
+	 * the device since we want to clean up the queue first.
+	 */
+	get_device(&vdev->dev);
+	video_unregister_device(vdev);
+	if (vdev->queue && vdev->queue->owner) {
+		struct mutex *lock = vdev->queue->lock ?
+			vdev->queue->lock : vdev->lock;
+
+		if (lock)
+			mutex_lock(lock);
+		vb2_queue_release(vdev->queue);
+		vdev->queue->owner = NULL;
+		if (lock)
+			mutex_unlock(lock);
+	}
+	/*
+	 * Now we put the device, and in most cases this will release
+	 * everything.
+	 */
+	put_device(&vdev->dev);
+}
+EXPORT_SYMBOL_GPL(vb2_video_unregister_device);
+
 /* vb2_ops helpers. Only use if vq->lock is non-NULL. */
 
 void vb2_ops_wait_prepare(struct vb2_queue *vq)
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index b7b5a9cb5a28..c203047eb834 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -23,6 +23,8 @@
 #error VB2_MAX_PLANES != VIDEO_MAX_PLANES
 #endif
 
+struct video_device;
+
 /**
  * struct vb2_v4l2_buffer - video buffer information for v4l2.
  *
@@ -319,6 +321,21 @@ unsigned long vb2_fop_get_unmapped_area(struct file *file, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags);
 #endif
 
+/**
+ * vb2_video_unregister_device - unregister the video device and release queue
+ *
+ * @vdev: pointer to &struct video_device
+ *
+ * If the driver uses vb2_fop_release()/_vb2_fop_release(), then it should use
+ * vb2_video_unregister_device() instead of video_unregister_device().
+ *
+ * This function will call video_unregister_device() and then release the
+ * vb2_queue if streaming is in progress. This will stop streaming and
+ * this will simplify the unbind sequence since after this call all subdevs
+ * will have stopped streaming as well.
+ */
+void vb2_video_unregister_device(struct video_device *vdev);
+
 /**
  * vb2_ops_wait_prepare - helper function to lock a struct &vb2_queue
  *
-- 
2.27.0

