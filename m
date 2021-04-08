Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31ACE357F86
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 11:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhDHJnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 05:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhDHJnA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 05:43:00 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D5EC061761
        for <linux-media@vger.kernel.org>; Thu,  8 Apr 2021 02:42:50 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id d10so1006926pgf.12
        for <linux-media@vger.kernel.org>; Thu, 08 Apr 2021 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ALUujV6o8uZUngq4GI/5055uPf7G+D6LO8BfQLkVhv8=;
        b=GdvR0V0FiYIar4gyw7gyYI9kOGza4ogHCCNiZaajELJ+V5eJa5YWbVmzNvJqJ8oJ8v
         NWzJFxNR4tdSmsFasipzjdoWW08Ga++XtIp1aQAz+EzMWa5cMKlOtMD/4RGoCiHhx9YR
         K5zA8olmdgFv2/FO2icy4GMqLLZPIfxLp0/a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ALUujV6o8uZUngq4GI/5055uPf7G+D6LO8BfQLkVhv8=;
        b=YFUhYjsQ9hMAnUb90TQewcgmTcCNdR5uO1UlCWll0AvfV3yn05Y/IXT61Vr0p0YS1Y
         7bJHxvwFuld+GZh1xbxlhnsQdTQZhRqEQBHE8wUaSbW28whtBakkAIXCL+fjVbGxn+rV
         Z3vJMB95HomZNaXrW/kv3/MVnlDPYPDdXDx3mEZadNGRkuo9E+WCOVtfZbBIBPm7AyrV
         8ErYFhYYixDFVVHaU2epn0nbgR+q+3Vh+wLvcAWoTnP5Zh+s0meDF/2Zxy506Jj70Ldk
         /frMdxuDRui2s9AQ1L0G2vbN37nXNUo+BOH+2q9ywhwRlyg6HZ4UP9aNk94MvILO4x7y
         b5lg==
X-Gm-Message-State: AOAM532Zta39tpcIKH5prhZvHJ8lSqdW7L6ApXS26iIQ1jZSzHXK6r/P
        QH9DyZ8UTG/Zt9bpR05pZdhgCA==
X-Google-Smtp-Source: ABdhPJy0S66jOMuDB9s93i4bwlleUxkBNZU7/7/Oxrd1NkSSq8mHh6D4dsnigRZ/rQYKXWAcB8aWHA==
X-Received: by 2002:a05:6a00:1651:b029:241:afa4:92b1 with SMTP id m17-20020a056a001651b0290241afa492b1mr6756345pfc.12.1617874969534;
        Thu, 08 Apr 2021 02:42:49 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:25d8:8458:73e8:75ac])
        by smtp.gmail.com with UTF8SMTPSA id f14sm25010791pfk.92.2021.04.08.02.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 02:42:49 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        David Stevens <stevensd@chromium.org>
Subject: [PATCH v2] drm/syncobj: use newly allocated stub fences
Date:   Thu,  8 Apr 2021 18:42:43 +0900
Message-Id: <20210408094243.3902013-1-stevensd@google.com>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: David Stevens <stevensd@chromium.org>

Allocate a new private stub fence in drm_syncobj_assign_null_handle,
instead of using a static stub fence.

When userspace creates a fence with DRM_SYNCOBJ_CREATE_SIGNALED or when
userspace signals a fence via DRM_IOCTL_SYNCOBJ_SIGNAL, the timestamp
obtained when the fence is exported and queried with SYNC_IOC_FILE_INFO
should match when the fence's status was changed from the perspective of
userspace, which is during the respective ioctl.

When a static stub fence started being used in by these ioctls, this
behavior changed. Instead, the timestamp returned by SYNC_IOC_FILE_INFO
became the first time anything used the static stub fence, which has no
meaning to userspace.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
v1 -> v2:
 - checkpatch style fixes

 drivers/dma-buf/dma-fence.c   | 33 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/drm_syncobj.c | 25 +++++++++++++++++++------
 include/linux/dma-fence.h     |  1 +
 3 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index d64fc03929be..6081eb962490 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -26,6 +26,11 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
 
+struct drm_fence_private_stub {
+	struct dma_fence base;
+	spinlock_t lock;
+};
+
 /*
  * fence context counter: each execution context should have its own
  * fence context, this allows checking if fences belong to the same
@@ -123,7 +128,9 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
 /**
  * dma_fence_get_stub - return a signaled fence
  *
- * Return a stub fence which is already signaled.
+ * Return a stub fence which is already signaled. The fence's
+ * timestamp corresponds to the first time after boot this
+ * function is called.
  */
 struct dma_fence *dma_fence_get_stub(void)
 {
@@ -141,6 +148,30 @@ struct dma_fence *dma_fence_get_stub(void)
 }
 EXPORT_SYMBOL(dma_fence_get_stub);
 
+/**
+ * dma_fence_allocate_private_stub - return a private, signaled fence
+ *
+ * Return a newly allocated and signaled stub fence.
+ */
+struct dma_fence *dma_fence_allocate_private_stub(void)
+{
+	struct drm_fence_private_stub *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (fence == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	spin_lock_init(&fence->lock);
+	dma_fence_init(&fence->base,
+		       &dma_fence_stub_ops,
+		       &fence->lock,
+		       0, 0);
+	dma_fence_signal(&fence->base);
+
+	return &fence->base;
+}
+EXPORT_SYMBOL(dma_fence_allocate_private_stub);
+
 /**
  * dma_fence_context_alloc - allocate an array of fence contexts
  * @num: amount of contexts to allocate
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 349146049849..a54aa850d143 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -350,12 +350,16 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
  *
  * Assign a already signaled stub fence to the sync object.
  */
-static void drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
+static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
 {
-	struct dma_fence *fence = dma_fence_get_stub();
+	struct dma_fence *fence = dma_fence_allocate_private_stub();
+
+	if (IS_ERR(fence))
+		return PTR_ERR(fence);
 
 	drm_syncobj_replace_fence(syncobj, fence);
 	dma_fence_put(fence);
+	return 0;
 }
 
 /* 5s default for wait submission */
@@ -469,6 +473,7 @@ EXPORT_SYMBOL(drm_syncobj_free);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence)
 {
+	int ret;
 	struct drm_syncobj *syncobj;
 
 	syncobj = kzalloc(sizeof(struct drm_syncobj), GFP_KERNEL);
@@ -479,8 +484,13 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 	INIT_LIST_HEAD(&syncobj->cb_list);
 	spin_lock_init(&syncobj->lock);
 
-	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED)
-		drm_syncobj_assign_null_handle(syncobj);
+	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
+		ret = drm_syncobj_assign_null_handle(syncobj);
+		if (ret < 0) {
+			drm_syncobj_put(syncobj);
+			return ret;
+		}
+	}
 
 	if (fence)
 		drm_syncobj_replace_fence(syncobj, fence);
@@ -1322,8 +1332,11 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 	if (ret < 0)
 		return ret;
 
-	for (i = 0; i < args->count_handles; i++)
-		drm_syncobj_assign_null_handle(syncobjs[i]);
+	for (i = 0; i < args->count_handles; i++) {
+		ret = drm_syncobj_assign_null_handle(syncobjs[i]);
+		if (ret < 0)
+			break;
+	}
 
 	drm_syncobj_array_free(syncobjs, args->count_handles);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 9f12efaaa93a..6ffb4b2c6371 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -587,6 +587,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 }
 
 struct dma_fence *dma_fence_get_stub(void);
+struct dma_fence *dma_fence_allocate_private_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
 
 #define DMA_FENCE_TRACE(f, fmt, args...) \
-- 
2.31.0.208.g409f899ff0-goog

