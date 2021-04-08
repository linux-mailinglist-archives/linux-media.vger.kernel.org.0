Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D2F357FFC
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 11:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbhDHJyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 05:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbhDHJyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 05:54:52 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310B4C061761
        for <linux-media@vger.kernel.org>; Thu,  8 Apr 2021 02:54:40 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id c17so1421450pfn.6
        for <linux-media@vger.kernel.org>; Thu, 08 Apr 2021 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F06Z1RXUI5OZQHllx6yIelYubQ59fvVFVd2c1q8aYFo=;
        b=lFey3WOVaEoUGK+gffnBEpyZ85Q8vR72KNL7iQWslR0Dsuw+Qfd9pWdCFEMJN0S2Lf
         lDfiSrMZ0bvyr9HpQ1mdr0wOzq6x7HAf4Ltx7i6kZuMn22oHwfvSly1Sw5P23rSLVzCc
         Eiij/wKY6lESQsif5OiYrqsXIGqyONMMct5mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F06Z1RXUI5OZQHllx6yIelYubQ59fvVFVd2c1q8aYFo=;
        b=qH6FTw3O5/RLNbuJe9qwEJCp3Role2yaPGWlSsqazwYlH4M0kMs84pzDcAHYX1G4RT
         QLWyDZ/BSxbQBco89nAoZRuUa+Cg00pK0r8WKSvDI1RfyGIAA3q6EcAMAhZxzR2J3WSS
         cM6IPF3f7lxsE33YIRXMe34fZuciEX4lITa3GPs2Hv0Q6AsmiKuHhmM6Lg0lYmQrgyQG
         QtfVcCtNavOm1YsQerAoE72/KFVG8SoMlvXnBLzb4Uv4EKBXhY3mnhA0RsybTNdD2H3d
         UDSgkFeKa9fvhX4CN9LvegpiSutm5Gj/YtEC6rZPlGkukCvQQz3hTzTy8nte4h5A7to7
         8+Jg==
X-Gm-Message-State: AOAM5303DqtpvXKTkwj7ahyw4JyrBcoiOb5AikakRs2VlvZ2rkt3tKyq
        oJ2BwzWZEeP/lP0jbQyvUqfBzg==
X-Google-Smtp-Source: ABdhPJxqkTB+8ooQy09dyBF9z9TbQVzPFo13ucXTs4ZmBx6F2XZyy5mEcW4yJMjsd5Y9vdSh3MDdMA==
X-Received: by 2002:a63:f056:: with SMTP id s22mr7279239pgj.369.1617875679652;
        Thu, 08 Apr 2021 02:54:39 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:25d8:8458:73e8:75ac])
        by smtp.gmail.com with UTF8SMTPSA id js16sm7528068pjb.21.2021.04.08.02.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 02:54:39 -0700 (PDT)
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
Subject: [PATCH v3] drm/syncobj: use newly allocated stub fences
Date:   Thu,  8 Apr 2021 18:54:28 +0900
Message-Id: <20210408095428.3983055-1-stevensd@google.com>
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
v2 -> v3:
 - reuse the static stub spinlock
v1 -> v2:
 - checkpatch style fixes

 drivers/dma-buf/dma-fence.c   | 27 ++++++++++++++++++++++++++-
 drivers/gpu/drm/drm_syncobj.c | 25 +++++++++++++++++++------
 include/linux/dma-fence.h     |  1 +
 3 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index d64fc03929be..ce0f5eff575d 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -123,7 +123,9 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
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
@@ -141,6 +143,29 @@ struct dma_fence *dma_fence_get_stub(void)
 }
 EXPORT_SYMBOL(dma_fence_get_stub);
 
+/**
+ * dma_fence_allocate_private_stub - return a private, signaled fence
+ *
+ * Return a newly allocated and signaled stub fence.
+ */
+struct dma_fence *dma_fence_allocate_private_stub(void)
+{
+	struct dma_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (fence == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	dma_fence_init(fence,
+		       &dma_fence_stub_ops,
+		       &dma_fence_stub_lock,
+		       0, 0);
+	dma_fence_signal(fence);
+
+	return fence;
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

