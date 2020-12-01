Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0EB02CA303
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 13:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730126AbgLAMpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 07:45:34 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:45353 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728570AbgLAMpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 07:45:34 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id k51SkssSADuFjk51Xk2RYn; Tue, 01 Dec 2020 13:44:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606826691; bh=U8mWCSYP2Eq4lCnjfIsVMvB2loExRhRj4TBhggJVWEY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=aRuEK3Cg2nyhQ7GYGxcjbNkbErQ+PS24SXLY97C0iH8JED9RJCUKZoqUguXXKdiNt
         g9MRZl43HKj5v6Rv71/KkKc1o/VAIcLJTBnia3hBj4UXlBG+CNoaHaiKDOwTLs8IsR
         s3E/4dsPsZc3uiJ6ecoIT0tE1n2vCjJ5gUFUOGfp6ZibRjYHkFMzut7TCkwhr0bBXA
         74R46y7+tF+4qIEbuoMJmYGwi8P5SIF+q2PVLQtk5uCsIe3YEEs5JytNFm2ILfi7AI
         JE3bRZJXwGcxSiCM1c1e2zD/gvUvVaHteUKgvSpESeLeVRaA7p4yfMsMMMvVgM74sc
         EY8Zdf722ZF/w==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Alexandre Courbot <gnurou@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 4/7] v4l2-dev/event: add v4l2_event_wake_all()
Date:   Tue,  1 Dec 2020 13:44:43 +0100
Message-Id: <20201201124446.448595-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
References: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEbbHtBtxZMg25ky9HguRnroC3luigL0X3xjmVl4YcEzAC4cF8zkGuoLHem70fyJetudArdmqSFaOjSG3F1c3boTMJIp10+2Z3Tv1K3d+QorJtFvji5A
 3rvHhZZTNh/UB8vbRgFoIZyK1Nc/yLr8zJ2dwr3J9h6I8+v2a79tvM19hHNzjGNo3BrVsTClsc0i9OSYI1MBsFLVZMEjXqNxG6XhiMiZGuQytTPQWa/o9NrM
 edPmE+vGANYx6lv8z1TLuVoKsOZIsJKGRlOlpxtQrSMD6eAze0uVrOrcvVREwdcOpyDQ6KDjZ8RoD6G+b1jEQEO/czQX1ts1ltowKUFp7TA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When unregistering a V4L2 device node, make sure any filehandles
that are waiting for an event are woken up.

Add v4l2_event_wake_all() to v4l2-event.c and call it from
video_unregister_device().

Otherwise userspace might never know that a device node was removed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c   |  3 +++
 drivers/media/v4l2-core/v4l2-event.c | 17 +++++++++++++++++
 include/media/v4l2-event.h           | 13 +++++++++++--
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index a593ea0598b5..0ddc3554f1a4 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -28,6 +28,7 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
 
 #define VIDEO_NUM_DEVICES	256
 #define VIDEO_NAME              "video4linux"
@@ -1086,6 +1087,8 @@ void video_unregister_device(struct video_device *vdev)
 	 */
 	clear_bit(V4L2_FL_REGISTERED, &vdev->flags);
 	mutex_unlock(&videodev_lock);
+	if (test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags))
+		v4l2_event_wake_all(vdev);
 	device_unregister(&vdev->dev);
 }
 EXPORT_SYMBOL(video_unregister_device);
diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
index 290c6b213179..207a9ad80ea2 100644
--- a/drivers/media/v4l2-core/v4l2-event.c
+++ b/drivers/media/v4l2-core/v4l2-event.c
@@ -187,6 +187,23 @@ int v4l2_event_pending(struct v4l2_fh *fh)
 }
 EXPORT_SYMBOL_GPL(v4l2_event_pending);
 
+void v4l2_event_wake_all(struct video_device *vdev)
+{
+	struct v4l2_fh *fh;
+	unsigned long flags;
+
+	if (vdev == NULL)
+		return;
+
+	spin_lock_irqsave(&vdev->fh_lock, flags);
+
+	list_for_each_entry(fh, &vdev->fh_list, list)
+		wake_up_all(&fh->wait);
+
+	spin_unlock_irqrestore(&vdev->fh_lock, flags);
+}
+EXPORT_SYMBOL_GPL(v4l2_event_wake_all);
+
 static void __v4l2_event_unsubscribe(struct v4l2_subscribed_event *sev)
 {
 	struct v4l2_fh *fh = sev->fh;
diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
index 3f0281d06ec7..4ffa914ade3a 100644
--- a/include/media/v4l2-event.h
+++ b/include/media/v4l2-event.h
@@ -101,7 +101,7 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event,
  *
  * .. note::
  *    The driver's only responsibility is to fill in the type and the data
- *    fields.The other fields will be filled in by  V4L2.
+ *    fields. The other fields will be filled in by V4L2.
  */
 void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
 
@@ -116,10 +116,19 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
  *
  * .. note::
  *    The driver's only responsibility is to fill in the type and the data
- *    fields.The other fields will be filled in by  V4L2.
+ *    fields. The other fields will be filled in by V4L2.
  */
 void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev);
 
+/**
+ * v4l2_event_wake_all - Wake all filehandles.
+ *
+ * Used when unregistering a video device.
+ *
+ * @vdev: pointer to &struct video_device
+ */
+void v4l2_event_wake_all(struct video_device *vdev);
+
 /**
  * v4l2_event_pending - Check if an event is available
  *
-- 
2.29.2

