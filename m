Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDEE2EC42E
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 20:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbhAFTuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 14:50:21 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:1663 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726558AbhAFTuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Jan 2021 14:50:21 -0500
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Jan 2021 11:49:30 -0800
X-QCInternal: smtphost
Received: from veeras-linux.qualcomm.com ([10.134.68.137])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 06 Jan 2021 11:49:30 -0800
Received: by veeras-linux.qualcomm.com (Postfix, from userid 330320)
        id 2A9E621B46; Wed,  6 Jan 2021 11:49:30 -0800 (PST)
From:   Veera Sundaram Sankaran <veeras@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Veera Sundaram Sankaran <veeras@codeaurora.org>,
        robdclark@gmail.com, sean@poorly.run, pdhaval@codeaurora.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org
Subject: [PATCH RESEND v2 2/2] drm/drm_vblank: set the dma-fence timestamp during send_vblank_event
Date:   Wed,  6 Jan 2021 11:49:14 -0800
Message-Id: <1609962554-13872-2-git-send-email-veeras@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609962554-13872-1-git-send-email-veeras@codeaurora.org>
References: <1609962554-13872-1-git-send-email-veeras@codeaurora.org>
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

Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
---
 drivers/gpu/drm/drm_file.c   | 43 +++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_vblank.c |  9 ++++++++-
 include/drm/drm_file.h       |  3 +++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 0ac4566..5944bb9 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -775,6 +775,49 @@ void drm_event_cancel_free(struct drm_device *dev,
 EXPORT_SYMBOL(drm_event_cancel_free);
 
 /**
+ * drm_send_event_timestamp_locked - send DRM event to file descriptor
+ * @dev: DRM device
+ * @e: DRM event to deliver
+ * @timestamp: timestamp to set for the fence event
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
+void drm_send_event_timestamp_locked(struct drm_device *dev,
+			struct drm_pending_event *e, ktime_t timestamp)
+{
+	assert_spin_locked(&dev->event_lock);
+
+	if (e->completion) {
+		complete_all(e->completion);
+		e->completion_release(e->completion);
+		e->completion = NULL;
+	}
+
+	if (e->fence) {
+		dma_fence_signal_timestamp(e->fence, timestamp);
+		dma_fence_put(e->fence);
+	}
+
+	if (!e->file_priv) {
+		kfree(e);
+		return;
+	}
+
+	list_del(&e->pending_link);
+	list_add_tail(&e->link,
+		      &e->file_priv->event_list);
+	wake_up_interruptible(&e->file_priv->event_wait);
+}
+EXPORT_SYMBOL(drm_send_event_timestamp_locked);
+
+/**
  * drm_send_event_locked - send DRM event to file descriptor
  * @dev: DRM device
  * @e: DRM event to deliver
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

