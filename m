Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A849E297518
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 18:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752726AbgJWQuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 12:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752722AbgJWQuT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:19 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5395AC0613CE;
        Fri, 23 Oct 2020 09:50:19 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id x13so1689399pgp.7;
        Fri, 23 Oct 2020 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Wh4Tpb4E3T4aFd9Kh6fmewic7oU3pwniyHoMkAYkA8=;
        b=kVD8LMEMRzjn2qtF/+k1SrbXBzibfwnWhnxuYAP0ISYC00oaMpiy+A73inF3xAFxVq
         I0EDjCEGvW+pB+QmE6cNgPbgV4FoKOURVE3yzG/de6Qi3FVNN/3jzC/4MVPsJ3HlOSWO
         nZ/1l8vunxCYT0ajt9VadT69WxrLsXdw7hp7aJQBtv0aGDYvqH6eLjQumTJMTuI0l6kY
         yD80FP6L8a/c4mbeh2shxagBKD41yMHzP8+fgPH6eL/GCY+yp/BuLQPPVGy5Atf1tXYN
         9TRa/YrCpfb71cfMxPmVX0RkRfvjM0/N5qb13EVzOqhUbpJucO7zFSOhX9GtGg/B0fto
         NTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Wh4Tpb4E3T4aFd9Kh6fmewic7oU3pwniyHoMkAYkA8=;
        b=cTObOJVOn2vNvqu0BzbuEMSwwQrIU0uEeAww1sTBG6+pMZH1Y+BEwvXR3qNT58zFwl
         SpUcpfZBJ/XgoHf0sLPLaoL5fcVv5IBuGSk0cbIKLVvMWKOXUkschopgyqLuNKk5SScz
         Mc0k0Hi73kSKMXZnoSGBZLAge9AZqgI2qRhnq30dM7/7S9RWw3xMq2nGdDlGCvqEW03U
         0uifdbPqUKxSipZbptOTXO0dYp7wCB4IMGFwGjU5QYXvlgZY65ZjvYrYvF5rppkUigrx
         9LoihTGRPUJApwUwiwgwKwpbvNqc20ER1ZXkfSQSrilRRVIwbXTz2zWKDsdD6fctYnM6
         ohpQ==
X-Gm-Message-State: AOAM5323iVvvM7aNhk+Jg3cof5yzYmVr0dkgIzteTQLFrfjt1dmUayZn
        ZZVJ4cpPUzVLmQROOXMMyEw=
X-Google-Smtp-Source: ABdhPJzibyyG7lF0omhwXSlr32CTBFvl7nuhRfjcedbVNMzKEIboEkSoXaR/Aa6kDXoHI/5ArcaCPg==
X-Received: by 2002:a63:4d18:: with SMTP id a24mr2632363pgb.414.1603471818752;
        Fri, 23 Oct 2020 09:50:18 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id v186sm2622032pfv.135.2020.10.23.09.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Emil Velikov <emil.velikov@collabora.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <mripard@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Brian Masney <masneyb@onstation.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Harigovindan P <harigovi@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Subject: [PATCH v4 04/23] drm/msm/gem: Move prototypes to msm_gem.h
Date:   Fri, 23 Oct 2020 09:51:05 -0700
Message-Id: <20201023165136.561680-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c        |  1 +
 drivers/gpu/drm/msm/msm_drv.h             | 54 ----------------------
 drivers/gpu/drm/msm/msm_fbdev.c           |  1 +
 drivers/gpu/drm/msm/msm_gem.h             | 56 +++++++++++++++++++++++
 6 files changed, 60 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index a0253297bc76..b65b2329cc8d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -11,6 +11,7 @@
 #include <drm/drm_vblank.h>
 
 #include "mdp4_kms.h"
+#include "msm_gem.h"
 
 struct mdp4_crtc {
 	struct drm_crtc base;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index c39dad151bb6..81fbd52ad7e7 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -15,6 +15,7 @@
 #include <drm/drm_vblank.h>
 
 #include "mdp5_kms.h"
+#include "msm_gem.h"
 
 #define CURSOR_WIDTH	64
 #define CURSOR_HEIGHT	64
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b17ac6c27554..5e7cdc11c764 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -26,6 +26,7 @@
 #include "sfpb.xml.h"
 #include "dsi_cfg.h"
 #include "msm_kms.h"
+#include "msm_gem.h"
 
 #define DSI_RESET_TOGGLE_DELAY_MS 20
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b9dd8f8f4887..79ee7d05b363 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -273,28 +273,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 void msm_gem_shrinker_init(struct drm_device *dev);
 void msm_gem_shrinker_cleanup(struct drm_device *dev);
 
-int msm_gem_mmap_obj(struct drm_gem_object *obj,
-			struct vm_area_struct *vma);
-int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
-vm_fault_t msm_gem_fault(struct vm_fault *vmf);
-uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
-int msm_gem_get_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova);
-int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova,
-		u64 range_start, u64 range_end);
-int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova);
-uint64_t msm_gem_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace);
-void msm_gem_unpin_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace);
-struct page **msm_gem_get_pages(struct drm_gem_object *obj);
-void msm_gem_put_pages(struct drm_gem_object *obj);
-int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
-		struct drm_mode_create_dumb *args);
-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset);
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 void *msm_gem_prime_vmap(struct drm_gem_object *obj);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
@@ -303,38 +281,8 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
-void *msm_gem_get_vaddr(struct drm_gem_object *obj);
-void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
-void msm_gem_put_vaddr(struct drm_gem_object *obj);
-int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
-int msm_gem_sync_object(struct drm_gem_object *obj,
-		struct msm_fence_context *fctx, bool exclusive);
-void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
-void msm_gem_active_put(struct drm_gem_object *obj);
-int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
-int msm_gem_cpu_fini(struct drm_gem_object *obj);
-void msm_gem_free_object(struct drm_gem_object *obj);
-int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
-		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
-struct drm_gem_object *msm_gem_new(struct drm_device *dev,
-		uint32_t size, uint32_t flags);
-struct drm_gem_object *msm_gem_new_locked(struct drm_device *dev,
-		uint32_t size, uint32_t flags);
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_address_space *aspace,
-		struct drm_gem_object **bo, uint64_t *iova);
-void *msm_gem_kernel_new_locked(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_address_space *aspace,
-		struct drm_gem_object **bo, uint64_t *iova);
-void msm_gem_kernel_put(struct drm_gem_object *bo,
-		struct msm_gem_address_space *aspace, bool locked);
-struct drm_gem_object *msm_gem_import(struct drm_device *dev,
-		struct dma_buf *dmabuf, struct sg_table *sgt);
 void msm_gem_free_work(struct work_struct *work);
 
-__printf(2, 3)
-void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...);
-
 int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 		struct msm_gem_address_space *aspace);
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
@@ -447,8 +395,6 @@ void __init msm_dpu_register(void);
 void __exit msm_dpu_unregister(void);
 
 #ifdef CONFIG_DEBUG_FS
-void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m);
-void msm_gem_describe_objects(struct list_head *list, struct seq_file *m);
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
 int msm_debugfs_late_init(struct drm_device *dev);
 int msm_rd_debugfs_init(struct drm_minor *minor);
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 47235f8c5922..678dba1725a6 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -9,6 +9,7 @@
 #include <drm/drm_fourcc.h>
 
 #include "msm_drv.h"
+#include "msm_gem.h"
 #include "msm_kms.h"
 
 extern int msm_gem_mmap_obj(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f6482154e8bb..fbad08badf43 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -93,6 +93,62 @@ struct msm_gem_object {
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
+int msm_gem_mmap_obj(struct drm_gem_object *obj,
+			struct vm_area_struct *vma);
+int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
+vm_fault_t msm_gem_fault(struct vm_fault *vmf);
+uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_get_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova);
+int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova,
+		u64 range_start, u64 range_end);
+int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova);
+uint64_t msm_gem_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace);
+void msm_gem_unpin_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace);
+struct page **msm_gem_get_pages(struct drm_gem_object *obj);
+void msm_gem_put_pages(struct drm_gem_object *obj);
+int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
+		struct drm_mode_create_dumb *args);
+int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
+		uint32_t handle, uint64_t *offset);
+void *msm_gem_get_vaddr(struct drm_gem_object *obj);
+void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
+void msm_gem_put_vaddr(struct drm_gem_object *obj);
+int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
+int msm_gem_sync_object(struct drm_gem_object *obj,
+		struct msm_fence_context *fctx, bool exclusive);
+void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
+void msm_gem_active_put(struct drm_gem_object *obj);
+int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
+int msm_gem_cpu_fini(struct drm_gem_object *obj);
+void msm_gem_free_object(struct drm_gem_object *obj);
+int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
+		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
+struct drm_gem_object *msm_gem_new(struct drm_device *dev,
+		uint32_t size, uint32_t flags);
+struct drm_gem_object *msm_gem_new_locked(struct drm_device *dev,
+		uint32_t size, uint32_t flags);
+void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
+		uint32_t flags, struct msm_gem_address_space *aspace,
+		struct drm_gem_object **bo, uint64_t *iova);
+void *msm_gem_kernel_new_locked(struct drm_device *dev, uint32_t size,
+		uint32_t flags, struct msm_gem_address_space *aspace,
+		struct drm_gem_object **bo, uint64_t *iova);
+void msm_gem_kernel_put(struct drm_gem_object *bo,
+		struct msm_gem_address_space *aspace, bool locked);
+struct drm_gem_object *msm_gem_import(struct drm_device *dev,
+		struct dma_buf *dmabuf, struct sg_table *sgt);
+__printf(2, 3)
+void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...);
+#ifdef CONFIG_DEBUG_FS
+void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m);
+void msm_gem_describe_objects(struct list_head *list, struct seq_file *m);
+#endif
+
 static inline void
 msm_gem_lock(struct drm_gem_object *obj)
 {
-- 
2.26.2

