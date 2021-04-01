Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E40350BE2
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 03:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhDABYF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 21:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbhDABX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 21:23:59 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA620C061574;
        Wed, 31 Mar 2021 18:23:58 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id t20so142072plr.13;
        Wed, 31 Mar 2021 18:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8cT+XlzU5zlDYGz9BluEu8eKHFv4/9nyqH51vh3hcvA=;
        b=oDeqRtbT/r3NSY5ShnKE7vGh0ec91lBkRPRKMPscSRXViFTwYhdHxexQGm+H2IthXF
         6xcw7FunpStTQ7mqUdan7ZpQ1yJhQNnRgPJ50ZukVRB5iDcDLjXNv1WC8qvypPRDDjbU
         CmNlltSsXtvxe5GRjJ4m63tFGfpOyeOqoFiuxF3JX/auhB+3DCLsyJKEsbHDTWwJcXF0
         Ymki3DzBZ7P/3mmdD87oTr0faqLeg1mVAndD+n1FJ8vRGd/3v8WrdFbEMngKOqE+s8e8
         atNzqbn0RyQoafDR6heCcoo185p6NQ6N1t37ZXnqtg9q0gXL3sjcsME/DfoVR+if5L89
         fj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8cT+XlzU5zlDYGz9BluEu8eKHFv4/9nyqH51vh3hcvA=;
        b=dtrr+6RYATegRESZ3zXho74UVu4XQ+Cd67DJeFR0KKSxnMuOTSAzmMpagLBfGaA6ps
         o09NDDRCv3lwuZPr7vKxG42fMR1urJGV2zIC7f2wbRXkav1Oz0y/QeaRxanXPGx5Hfr/
         GeDH++r/cpsxQ8cnOmaQadB8/Ua8eXgekfk8ppLeOTqZK4Uo385Ub7CbFUPAOHO1KUoj
         Kou/6MWOt9Mhtw73+UCyyrFLZoMyeAYsPeQAjwFhJfcMFfJpkLLv/edIpAimA/A4g0Lx
         Z9EnOe+nSg4P3wykUI8PRewWlgYNGqffEIBHl0+oKhzMcqFieWzZF5EHHs63qL4ssGRS
         yjuw==
X-Gm-Message-State: AOAM5322kp71AqyKrnOGabEvrD0pfhcU8qioMAVjVagXimCVgUYGvQOm
        Aa1VDdPhapmympXg2xQMdAk=
X-Google-Smtp-Source: ABdhPJx19SrCOXWa4tQngoMfeYPmtRrvqE4PBxLlbi9rJsA3eBjK/1tQsaOhr4pfPMu8XLWXnHhCaA==
X-Received: by 2002:a17:902:e80a:b029:e6:c4c4:1f05 with SMTP id u10-20020a170902e80ab02900e6c4c41f05mr5749363plg.33.1617240238504;
        Wed, 31 Mar 2021 18:23:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id x1sm3449485pfj.209.2021.03.31.18.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 18:23:57 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Subject: [PATCH v2 2/4] drm/msm: Avoid mutex in shrinker_count()
Date:   Wed, 31 Mar 2021 18:27:19 -0700
Message-Id: <20210401012722.527712-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401012722.527712-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

When the system is under heavy memory pressure, we can end up with lots
of concurrent calls into the shrinker.  Keeping a running tab on what we
can shrink avoids grabbing a lock in shrinker->count(), and avoids
shrinker->scan() getting called when not profitable.

Also, we can keep purged objects in their own list to avoid re-traversing
them to help cut down time in the critical section further.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c          |  1 +
 drivers/gpu/drm/msm/msm_drv.h          |  6 ++-
 drivers/gpu/drm/msm/msm_gem.c          | 20 ++++++++--
 drivers/gpu/drm/msm/msm_gem.h          | 53 ++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 28 ++++++--------
 5 files changed, 81 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4f9fa0189a07..3462b0ea14c6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -476,6 +476,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	INIT_LIST_HEAD(&priv->inactive_willneed);
 	INIT_LIST_HEAD(&priv->inactive_dontneed);
+	INIT_LIST_HEAD(&priv->inactive_purged);
 	mutex_init(&priv->mm_lock);
 
 	/* Teach lockdep about lock ordering wrt. shrinker: */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a1264cfcac5e..503168817e24 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -179,8 +179,8 @@ struct msm_drm_private {
 	 * inactive lists (depending on whether or not it is shrinkable) or
 	 * gpu->active_list (for the gpu it is active on[1])
 	 *
-	 * These lists are protected by mm_lock.  If struct_mutex is involved, it
-	 * should be aquired prior to mm_lock.  One should *not* hold mm_lock in
+	 * These lists are protected by mm_lock (which should be acquired
+	 * before per GEM object lock).  One should *not* hold mm_lock in
 	 * get_pages()/vmap()/etc paths, as they can trigger the shrinker.
 	 *
 	 * [1] if someone ever added support for the old 2d cores, there could be
@@ -188,6 +188,8 @@ struct msm_drm_private {
 	 */
 	struct list_head inactive_willneed;  /* inactive + !shrinkable */
 	struct list_head inactive_dontneed;  /* inactive +  shrinkable */
+	struct list_head inactive_purged;    /* inactive +  purged */
+	long shrinkable_count;               /* write access under mm_lock */
 	struct mutex mm_lock;
 
 	struct workqueue_struct *wq;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9d10739c4eb2..bec01bb48fce 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -719,6 +719,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	put_iova_vmas(obj);
 
 	msm_obj->madv = __MSM_MADV_PURGED;
+	mark_unpurgable(msm_obj);
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 	drm_gem_free_mmap_offset(obj);
@@ -790,10 +791,11 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	might_sleep();
 	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
+	WARN_ON(msm_obj->dontneed);
 
 	if (msm_obj->active_count++ == 0) {
 		mutex_lock(&priv->mm_lock);
-		list_del_init(&msm_obj->mm_list);
+		list_del(&msm_obj->mm_list);
 		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
 		mutex_unlock(&priv->mm_lock);
 	}
@@ -818,11 +820,19 @@ static void update_inactive(struct msm_gem_object *msm_obj)
 	mutex_lock(&priv->mm_lock);
 	WARN_ON(msm_obj->active_count != 0);
 
-	list_del_init(&msm_obj->mm_list);
-	if (msm_obj->madv == MSM_MADV_WILLNEED)
+	if (msm_obj->dontneed)
+		mark_unpurgable(msm_obj);
+
+	list_del(&msm_obj->mm_list);
+	if (msm_obj->madv == MSM_MADV_WILLNEED) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
-	else
+	} else if (msm_obj->madv == MSM_MADV_DONTNEED) {
 		list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
+		mark_purgable(msm_obj);
+	} else {
+		WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
+		list_add_tail(&msm_obj->mm_list, &priv->inactive_purged);
+	}
 
 	mutex_unlock(&priv->mm_lock);
 }
@@ -971,6 +981,8 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	struct msm_drm_private *priv = dev->dev_private;
 
 	mutex_lock(&priv->mm_lock);
+	if (msm_obj->dontneed)
+		mark_unpurgable(msm_obj);
 	list_del(&msm_obj->mm_list);
 	mutex_unlock(&priv->mm_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7a9107cf1818..13aabfe92dac 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -50,18 +50,24 @@ struct msm_gem_object {
 	 */
 	uint8_t madv;
 
+	/**
+	 * Is object on inactive_dontneed list (ie. counted in priv->shrinkable_count)?
+	 */
+	bool dontneed : 1;
+
 	/**
 	 * count of active vmap'ing
 	 */
 	uint8_t vmap_count;
 
-	/* And object is either:
-	 *  inactive - on priv->inactive_list
+	/**
+	 * An object is either:
+	 *  inactive - on priv->inactive_dontneed/willneed/purged depending
+	 *     on status
 	 *  active   - on one one of the gpu's active_list..  well, at
 	 *     least for now we don't have (I don't think) hw sync between
 	 *     2d and 3d one devices which have both, meaning we need to
 	 *     block on submit if a bo is already on other ring
-	 *
 	 */
 	struct list_head mm_list;
 
@@ -186,10 +192,16 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
 	return msm_obj->active_count;
 }
 
+/* imported/exported objects are not purgable: */
+static inline bool is_unpurgable(struct msm_gem_object *msm_obj)
+{
+	return msm_obj->base.dma_buf && msm_obj->base.import_attach;
+}
+
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
 {
 	return (msm_obj->madv == MSM_MADV_DONTNEED) && msm_obj->sgt &&
-			!msm_obj->base.dma_buf && !msm_obj->base.import_attach;
+			!is_unpurgable(msm_obj);
 }
 
 static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
@@ -198,6 +210,39 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
 }
 
+static inline void mark_purgable(struct msm_gem_object *msm_obj)
+{
+	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
+
+	WARN_ON(!mutex_is_locked(&priv->mm_lock));
+
+	if (is_unpurgable(msm_obj))
+		return;
+
+	if (WARN_ON(msm_obj->dontneed))
+		return;
+
+	priv->shrinkable_count += msm_obj->base.size >> PAGE_SHIFT;
+	msm_obj->dontneed = true;
+}
+
+static inline void mark_unpurgable(struct msm_gem_object *msm_obj)
+{
+	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
+
+	WARN_ON(!mutex_is_locked(&priv->mm_lock));
+
+	if (is_unpurgable(msm_obj))
+		return;
+
+	if (WARN_ON(!msm_obj->dontneed))
+		return;
+
+	priv->shrinkable_count -= msm_obj->base.size >> PAGE_SHIFT;
+	WARN_ON(priv->shrinkable_count < 0);
+	msm_obj->dontneed = false;
+}
+
 void msm_gem_purge(struct drm_gem_object *obj);
 void msm_gem_vunmap(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 9d5248be746f..f3e948af01c5 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -14,22 +14,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv =
 		container_of(shrinker, struct msm_drm_private, shrinker);
-	struct msm_gem_object *msm_obj;
-	unsigned long count = 0;
-
-	mutex_lock(&priv->mm_lock);
-
-	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
-		if (!msm_gem_trylock(&msm_obj->base))
-			continue;
-		if (is_purgeable(msm_obj))
-			count += msm_obj->base.size >> PAGE_SHIFT;
-		msm_gem_unlock(&msm_obj->base);
-	}
-
-	mutex_unlock(&priv->mm_lock);
-
-	return count;
+	return priv->shrinkable_count;
 }
 
 static unsigned long
@@ -45,6 +30,9 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
 		if (freed >= sc->nr_to_scan)
 			break;
+		/* Use trylock, because we cannot block on a obj that
+		 * might be trying to acquire mm_lock
+		 */
 		if (!msm_gem_trylock(&msm_obj->base))
 			continue;
 		if (is_purgeable(msm_obj)) {
@@ -56,8 +44,11 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 
 	mutex_unlock(&priv->mm_lock);
 
-	if (freed > 0)
+	if (freed > 0) {
 		trace_msm_gem_purge(freed << PAGE_SHIFT);
+	} else {
+		return SHRINK_STOP;
+	}
 
 	return freed;
 }
@@ -75,6 +66,9 @@ vmap_shrink(struct list_head *mm_list)
 	unsigned unmapped = 0;
 
 	list_for_each_entry(msm_obj, mm_list, mm_list) {
+		/* Use trylock, because we cannot block on a obj that
+		 * might be trying to acquire mm_lock
+		 */
 		if (!msm_gem_trylock(&msm_obj->base))
 			continue;
 		if (is_vunmapable(msm_obj)) {
-- 
2.30.2

