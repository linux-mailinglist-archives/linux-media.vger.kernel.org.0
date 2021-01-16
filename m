Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C912F8A01
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 01:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbhAPAkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 19:40:09 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:59526 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727772AbhAPAkI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 19:40:08 -0500
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jan 2021 16:31:51 -0800
X-QCInternal: smtphost
Received: from veeras-linux.qualcomm.com ([10.134.68.137])
  by ironmsg01-sd.qualcomm.com with ESMTP; 15 Jan 2021 16:31:50 -0800
Received: by veeras-linux.qualcomm.com (Postfix, from userid 330320)
        id D176221B72; Fri, 15 Jan 2021 16:31:50 -0800 (PST)
From:   Veera Sundaram Sankaran <veeras@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
        daniel@ffwll.ch, john.stultz@linaro.org
Cc:     Veera Sundaram Sankaran <veeras@codeaurora.org>,
        robdclark@gmail.com, sean@poorly.run, pdhaval@codeaurora.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org
Subject: [PATCH v4 2/2] drm/drm_vblank: set the dma-fence timestamp during send_vblank_event
Date:   Fri, 15 Jan 2021 16:31:47 -0800
Message-Id: <1610757107-11892-2-git-send-email-veeras@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610757107-11892-1-git-send-email-veeras@codeaurora.org>
References: <1610757107-11892-1-git-send-email-veeras@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The explicit out-fences in crtc are signaled as part of vblank event,
indicating all framebuffers present on the Atomic Commit request are
scanned out on the screen. Though the fence signal and the vblank event
notification happens at the same time, triggered by the same hardware
vsync event, the timestamp set in both are different. With drivers
supporting precise vblank timestamp the difference between the two
timestamps would be even higher. This might have an impact on use-mode
frameworks using these fence timestamps for purposes other than simple
buffer usage. For instance, the Android framework [1] uses the
retire-fences as an alternative to vblank when frame-updates are in
progress. Set the fence timestamp during send vblank event using a new
drm_send_event_timestamp_locked variant to avoid discrepancies.

[1] https://android.googlesource.com/platform/frameworks/native/+/master/
services/surfaceflinger/Scheduler/Scheduler.cpp#397

Changes in v2:
- Use drm_send_event_timestamp_locked to update fence timestamp
- add more information to commit text

Changes in v3:
- use same backend helper function for variants of drm_send_event to
avoid code duplications

Changes in v4:
- remove WARN_ON from drm_send_event_timestamp_locked

Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
---
 drivers/gpu/drm/drm_file.c   | 69 ++++++++++++++++++++++++++++++++++++--------
 drivers/gpu/drm/drm_vblank.c |  9 +++++-
 include/drm/drm_file.h       |  3 ++
 3 files changed, 68 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 0ac4566..0f77f71 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -775,20 +775,19 @@ void drm_event_cancel_free(struct drm_device *dev,
 EXPORT_SYMBOL(drm_event_cancel_free);
 
 /**
- * drm_send_event_locked - send DRM event to file descriptor
+ * drm_send_event_helper - send DRM event to file descriptor
  * @dev: DRM device
  * @e: DRM event to deliver
+ * @timestamp: timestamp to set for the fence event in kernel's CLOCK_MONOTONIC
+ * time domain
  *
- * This function sends the event @e, initialized with drm_event_reserve_init(),
- * to its associated userspace DRM file. Callers must already hold
- * &drm_device.event_lock, see drm_send_event() for the unlocked version.
- *
- * Note that the core will take care of unlinking and disarming events when the
- * corresponding DRM file is closed. Drivers need not worry about whether the
- * DRM file for this event still exists and can call this function upon
- * completion of the asynchronous work unconditionally.
+ * This helper function sends the event @e, initialized with
+ * drm_event_reserve_init(), to its associated userspace DRM file.
+ * The timestamp variant of dma_fence_signal is used when the caller
+ * sends a valid timestamp.
  */
-void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
+void drm_send_event_helper(struct drm_device *dev,
+			struct drm_pending_event *e, ktime_t timestamp)
 {
 	assert_spin_locked(&dev->event_lock);
 
@@ -799,7 +798,10 @@ void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
 	}
 
 	if (e->fence) {
-		dma_fence_signal(e->fence);
+		if (timestamp)
+			dma_fence_signal_timestamp(e->fence, timestamp);
+		else
+			dma_fence_signal(e->fence);
 		dma_fence_put(e->fence);
 	}
 
@@ -814,6 +816,49 @@ void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
 	wake_up_interruptible_poll(&e->file_priv->event_wait,
 		EPOLLIN | EPOLLRDNORM);
 }
+
+/**
+ * drm_send_event_timestamp_locked - send DRM event to file descriptor
+ * @dev: DRM device
+ * @e: DRM event to deliver
+ * @timestamp: timestamp to set for the fence event in kernel's CLOCK_MONOTONIC
+ * time domain
+ *
+ * This function sends the event @e, initialized with drm_event_reserve_init(),
+ * to its associated userspace DRM file. Callers must already hold
+ * &drm_device.event_lock.
+ *
+ * Note that the core will take care of unlinking and disarming events when the
+ * corresponding DRM file is closed. Drivers need not worry about whether the
+ * DRM file for this event still exists and can call this function upon
+ * completion of the asynchronous work unconditionally.
+ */
+void drm_send_event_timestamp_locked(struct drm_device *dev,
+			struct drm_pending_event *e, ktime_t timestamp)
+{
+	drm_send_event_helper(dev, e, timestamp);
+
+}
+EXPORT_SYMBOL(drm_send_event_timestamp_locked);
+
+/**
+ * drm_send_event_locked - send DRM event to file descriptor
+ * @dev: DRM device
+ * @e: DRM event to deliver
+ *
+ * This function sends the event @e, initialized with drm_event_reserve_init(),
+ * to its associated userspace DRM file. Callers must already hold
+ * &drm_device.event_lock, see drm_send_event() for the unlocked version.
+ *
+ * Note that the core will take care of unlinking and disarming events when the
+ * corresponding DRM file is closed. Drivers need not worry about whether the
+ * DRM file for this event still exists and can call this function upon
+ * completion of the asynchronous work unconditionally.
+ */
+void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
+{
+	drm_send_event_helper(dev, e, 0);
+}
 EXPORT_SYMBOL(drm_send_event_locked);
 
 /**
@@ -836,7 +881,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 	unsigned long irqflags;
 
 	spin_lock_irqsave(&dev->event_lock, irqflags);
-	drm_send_event_locked(dev, e);
+	drm_send_event_helper(dev, e, 0);
 	spin_unlock_irqrestore(&dev->event_lock, irqflags);
 }
 EXPORT_SYMBOL(drm_send_event);
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index f135b79..286edbe 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1000,7 +1000,14 @@ static void send_vblank_event(struct drm_device *dev,
 		break;
 	}
 	trace_drm_vblank_event_delivered(e->base.file_priv, e->pipe, seq);
-	drm_send_event_locked(dev, &e->base);
+	/*
+	 * Use the same timestamp for any associated fence signal to avoid
+	 * mismatch in timestamps for vsync & fence events triggered by the
+	 * same HW event. Frameworks like SurfaceFlinger in Android expects the
+	 * retire-fence timestamp to match exactly with HW vsync as it uses it
+	 * for its software vsync modeling.
+	 */
+	drm_send_event_timestamp_locked(dev, &e->base, now);
 }
 
 /**
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 716990b..b81b3bf 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -399,6 +399,9 @@ void drm_event_cancel_free(struct drm_device *dev,
 			   struct drm_pending_event *p);
 void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e);
 void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
+void drm_send_event_timestamp_locked(struct drm_device *dev,
+				     struct drm_pending_event *e,
+				     ktime_t timestamp);
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 
-- 
2.7.4

