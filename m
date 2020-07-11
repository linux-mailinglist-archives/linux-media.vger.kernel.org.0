Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C61CD21C39D
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 12:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgGKKOr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 06:14:47 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50635 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726220AbgGKKOr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 06:14:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uCWnjqdGmJcNHuCWrjt5Dq; Sat, 11 Jul 2020 12:14:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594462485; bh=wCzjJ53MeD8bHAbkP8RDFtodbr9Swfc8LjRYTlQbFWo=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HeJ9X3Cg5RrNuXF2f/N7FtaWuQ3yDULcKH8JUNSG17TAGC17zfdXi1VT2+4hQ2DE+
         S//UmLzWT+r7FsRvgL2shJOVQzJqdX4VpvTBB5A7GkjTuMdTTGDzwHIoGQghIiBQFn
         /gSXMEP2hYmnj1p6Wch4BpmPAP2TQErMBPU1FSVeRq9yiNehqhLSM10tI2yUQ+lVTx
         A2F2Dr56BBM97TZcI6S0/MN7Ynkx8guKYRdoQxss7vLTjfUAM0qV5tRJcTPnHF6a9V
         +PGnQ0hdZYUrxQCWTFPmuzNg77ADeQDovELSpVavVSg6pEKMRBbIhG/VUsNFBIPwP2
         kdiij8svhGxGg==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] videobuf2-v4l2.c: add vb2_video_unregister_device helper
 function
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <7e7e9841-7f3a-468b-01c8-5921e5c14df8@xs4all.nl>
Date:   Sat, 11 Jul 2020 12:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCRBpbNgU46JPG2cUMVEqnoCGOFaaLRdoZVfPyRXzRL3Nedue72vTZCFRF60Nq0lbvHEaUm7Wi031DpHm+PLl8jyEKlX/pAYwi+hcueUhQAm3R5MK1qv
 yGEFlri2s4V0k6NWVkqPVXs+McXOnWQGBgLLUDHVT+BaydEH09vDni1/ig+GLyzreb9OCZHj42YsVzxqv0ascsmw3xVsvuJxS54=
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
---
Changes since v1:

The first version called vb2 from video_unregister_device, but that causes
all sorts of dependency problems. It's much better to do this from vb2.
---
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 57aa183bd198..a2722fa7580b 100644
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

@@ -1234,6 +1235,38 @@ unsigned long vb2_fop_get_unmapped_area(struct file *file, unsigned long addr,
 EXPORT_SYMBOL_GPL(vb2_fop_get_unmapped_area);
 #endif

+void vb2_video_unregister_device(struct video_device *vdev)
+{
+	/* Check if vdev was ever registered at all */
+	if (!vdev || !video_is_registered(vdev))
+		return;
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
