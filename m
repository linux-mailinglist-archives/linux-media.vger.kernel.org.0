Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2429B6A0F
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 19:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfIRRza (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 13:55:30 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39460 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfIRRza (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 13:55:30 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so348897wrj.6
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2019 10:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rsp933T4bclNOh5WQSR/JAsXxgUbsieI1rwAApL1kOY=;
        b=q4REcxlThKfapbc0wRjfc1rbbya5nTk5rLcnYRk/a8IgmOTE0zzK1MuQiQOheEXZHs
         rAs6nIYBgql0QbfgDhw1lw2BMS/znJ6feLVuctSnOGAp5XUKASFShJrw/sf9kvRWrRM/
         gagndFh9TuX2PB3OHBlEaf1gGGroWKljMDRK+xaFADpAk3wV34HXbIbr/wAjf/0nWRvL
         5mqswFitafI4T2atxsnZUmWUEWxukwPDHbleN9mggEKEZmaHIeZhLwiW18dtXn9Bq0GR
         0guUOqF2q/QECvKK5atvO8oFnMUUbQeT9yAMqON+xC0WZ/vZlcGBjz4eNbMoNm0NK6CD
         2ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rsp933T4bclNOh5WQSR/JAsXxgUbsieI1rwAApL1kOY=;
        b=BXUpOnYeLrE093mfGhpSeFk82EwThwZLgY5qdkNw6Uv9CdglNhPHBosAUplHC+RL8y
         zCPLdv4P7EZuy9/yTXlvCspL0OcFkcwJPtrdTzv3PEe84undJVx82wdPmhiuvtTNGJig
         FIFEy/pZcKIMdhHMLd0X2ms1C1fMtqjwOvRiIpDDVJAGMLWYulVL0cNm3RU2Ijrkhx2V
         q71VZOjLUSPbzV+GpIZh9Z/czP9zdXctpTTcUEFw6gCQG/rU+20d6epXXKsRJjsXBGn+
         UHH60TskkXaaR06azlyHXEn7FcH7mLQ0bK9BvBer/krQUUAFo8dqRgqfsNQEcVQziJst
         LmhQ==
X-Gm-Message-State: APjAAAUCjbcltAdKJIH5v8HYjJIVN1vvpyiPVqt6OsSoRqSXNk8TekIF
        05J6xtiF7cSLfcTyHx0/J7AykwxB
X-Google-Smtp-Source: APXvYqzvsBJyXCxevf8+N4gWZ6qAdG50HFdz2f+4KNTDRfDSgqjHuZ35F+Pgc1L+cTaDY2BVzD5IZQ==
X-Received: by 2002:adf:e546:: with SMTP id z6mr3966449wrm.113.1568829327811;
        Wed, 18 Sep 2019 10:55:27 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f002:ffad:c852:eff6])
        by smtp.gmail.com with ESMTPSA id q3sm4074027wru.33.2019.09.18.10.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 10:55:27 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, daniel@ffwll.ch, sumit.semwal@linaro.org
Subject: [PATCH 3/3] drm/gem: use new dma_resv_ctx
Date:   Wed, 18 Sep 2019 19:55:25 +0200
Message-Id: <20190918175525.49441-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918175525.49441-1-christian.koenig@amd.com>
References: <20190918175525.49441-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new dma_resv_ctx object instead of implementing
deadlock handling on our own.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c               | 62 +++++++------------------
 drivers/gpu/drm/panfrost/panfrost_job.c |  2 +-
 drivers/gpu/drm/v3d/v3d_gem.c           | 10 ++--
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 +-
 include/drm/drm_gem.h                   |  5 +-
 5 files changed, 27 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 6854f5867d51..b3b684cf1e1b 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1280,66 +1280,38 @@ void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr)
  */
 int
 drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
-			  struct ww_acquire_ctx *acquire_ctx)
+			  struct dma_resv_ctx *acquire_ctx)
 {
-	int contended = -1;
 	int i, ret;
 
-	ww_acquire_init(acquire_ctx, &reservation_ww_class);
+	dma_resv_ctx_init(acquire_ctx);
 
 retry:
-	if (contended != -1) {
-		struct drm_gem_object *obj = objs[contended];
-
-		ret = dma_resv_lock_slow_interruptible(obj->resv,
-								 acquire_ctx);
-		if (ret) {
-			ww_acquire_done(acquire_ctx);
-			return ret;
-		}
-	}
-
 	for (i = 0; i < count; i++) {
-		if (i == contended)
-			continue;
-
-		ret = dma_resv_lock_interruptible(objs[i]->resv,
-							    acquire_ctx);
-		if (ret) {
-			int j;
-
-			for (j = 0; j < i; j++)
-				dma_resv_unlock(objs[j]->resv);
-
-			if (contended != -1 && contended >= i)
-				dma_resv_unlock(objs[contended]->resv);
-
-			if (ret == -EDEADLK) {
-				contended = i;
-				goto retry;
-			}
-
-			ww_acquire_done(acquire_ctx);
-			return ret;
-		}
+		ret = dma_resv_ctx_lock(acquire_ctx, objs[i]->resv, true);
+		if (ret)
+			goto error;
 	}
 
-	ww_acquire_done(acquire_ctx);
-
+	dma_resv_ctx_done(acquire_ctx);
 	return 0;
+
+error:
+	if (ret == -EDEADLK)
+		goto retry;
+
+	dma_resv_ctx_unlock_all(acquire_ctx);
+	dma_resv_ctx_done(acquire_ctx);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_lock_reservations);
 
 void
 drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
-			    struct ww_acquire_ctx *acquire_ctx)
+			    struct dma_resv_ctx *acquire_ctx)
 {
-	int i;
-
-	for (i = 0; i < count; i++)
-		dma_resv_unlock(objs[i]->resv);
-
-	ww_acquire_fini(acquire_ctx);
+	dma_resv_ctx_unlock_all(acquire_ctx);
+	dma_resv_ctx_fini(acquire_ctx);
 }
 EXPORT_SYMBOL(drm_gem_unlock_reservations);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 05c85f45a0de..b73079173c57 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -218,7 +218,7 @@ int panfrost_job_push(struct panfrost_job *job)
 	struct panfrost_device *pfdev = job->pfdev;
 	int slot = panfrost_job_get_slot(job);
 	struct drm_sched_entity *entity = &job->file_priv->sched_entity[slot];
-	struct ww_acquire_ctx acquire_ctx;
+	struct dma_resv_ctx acquire_ctx;
 	int ret = 0;
 
 	mutex_lock(&pfdev->sched_lock);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 5d80507b539b..745570fccad9 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -248,7 +248,7 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
  */
 static int
 v3d_lock_bo_reservations(struct v3d_job *job,
-			 struct ww_acquire_ctx *acquire_ctx)
+			 struct dma_resv_ctx *acquire_ctx)
 {
 	int i, ret;
 
@@ -486,7 +486,7 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
 static void
 v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
 					 struct v3d_job *job,
-					 struct ww_acquire_ctx *acquire_ctx,
+					 struct dma_resv_ctx *acquire_ctx,
 					 u32 out_sync,
 					 struct dma_fence *done_fence)
 {
@@ -530,7 +530,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	struct drm_v3d_submit_cl *args = data;
 	struct v3d_bin_job *bin = NULL;
 	struct v3d_render_job *render;
-	struct ww_acquire_ctx acquire_ctx;
+	struct dma_resv_ctx acquire_ctx;
 	int ret = 0;
 
 	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args->rcl_end);
@@ -642,7 +642,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_submit_tfu *args = data;
 	struct v3d_tfu_job *job;
-	struct ww_acquire_ctx acquire_ctx;
+	struct dma_resv_ctx acquire_ctx;
 	int ret = 0;
 
 	trace_v3d_submit_tfu_ioctl(&v3d->drm, args->iia);
@@ -738,7 +738,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	struct drm_v3d_submit_csd *args = data;
 	struct v3d_csd_job *job;
 	struct v3d_job *clean_job;
-	struct ww_acquire_ctx acquire_ctx;
+	struct dma_resv_ctx acquire_ctx;
 	int ret;
 
 	trace_v3d_submit_csd_ioctl(&v3d->drm, args->cfg[5], args->cfg[6]);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 314e02f94d9c..02b4ee1deeb4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -77,7 +77,7 @@ struct virtio_gpu_object {
 	container_of((gobj), struct virtio_gpu_object, base.base)
 
 struct virtio_gpu_object_array {
-	struct ww_acquire_ctx ticket;
+	struct dma_resv_ctx ticket;
 	struct list_head next;
 	u32 nents, total;
 	struct drm_gem_object *objs[];
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 6aaba14f5972..dff4d45a2c41 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -36,6 +36,7 @@
 
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
+#include <linux/dma-resv-ctx.h>
 
 #include <drm/drm_vma_manager.h>
 
@@ -393,9 +394,9 @@ struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
 long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 				    bool wait_all, unsigned long timeout);
 int drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
-			      struct ww_acquire_ctx *acquire_ctx);
+			      struct dma_resv_ctx *acquire_ctx);
 void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
-				 struct ww_acquire_ctx *acquire_ctx);
+				 struct dma_resv_ctx *acquire_ctx);
 int drm_gem_fence_array_add(struct xarray *fence_array,
 			    struct dma_fence *fence);
 int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
-- 
2.17.1

