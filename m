Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 788764EE2DD
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 22:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241516AbiCaUsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 16:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbiCaUsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 16:48:46 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5F71EC995
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 13:46:58 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id d7so1384794wrb.7
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 13:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=73gZfDQCpt0fGibx8D9nibrJ22anLyD9WN0vPioCp4E=;
        b=DeCbI3OH9ybm6WxJDbG8bQTyh5D+c4ZsbKHkZH8MsgiPBzMnwykeckin0GiRi99hB0
         RIF7qMNosyn5vmUsTEQKeU1KwPnG9JoNsX/fA/pT9qiwzMN2CEjauEIozPKLdYbQwjnx
         hji+pqGLIsUxkIEudt0ibfnERd95vJhcrSROE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=73gZfDQCpt0fGibx8D9nibrJ22anLyD9WN0vPioCp4E=;
        b=Jf0wp/W4/pnr7H35kGUQJipcjJkk6GUHoQTmpEm4wzyP/pHsk8wUz57+4b0k2+GUlj
         ti8ZqQQKcIZdjOdD9z1rBkV1w3oTfsxh/gZGYOahwqclEExXuCPJg/FJ5Urafhyticpg
         mOQSdAbUY+j/Lx4ql136y5EuVcWoQCBbBu9a8uXzH4UAgxqtbCEOJzAaggeoqxD21eIj
         XWHjqqS8TWqQpwbF2x5FKV1j41HCWpq7FZfC6ugkIEFHv/JWzzpo3HWgKPwRa7xCEpoQ
         1lsS43ZPBahIesHhVK3ZDT6Wxv/apfEGQ4gtZDpIb3aSSiPUXCyHmibJJ819zULpXMci
         1Dpw==
X-Gm-Message-State: AOAM5314aIn6TcVqxc+6YWbVGeYFEewjZM3Zk8iajwUQmPT5Zh2IgeHf
        DGL4rY4znVzQyVIpgE8uOZvC2w==
X-Google-Smtp-Source: ABdhPJw1JV5Bt9fNkfp9+VZBfvscGth4m22To84I6sYPoVisrLeUWTzWFoizVcX4ctk+HLSKby7Oiw==
X-Received: by 2002:adf:e642:0:b0:203:d992:b8a3 with SMTP id b2-20020adfe642000000b00203d992b8a3mr5261866wrn.17.1648759617204;
        Thu, 31 Mar 2022 13:46:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b15-20020a05600018af00b002057c72d45fsm480319wri.77.2022.03.31.13.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 13:46:56 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/4] drm/gem: Delete gem array fencing helpers
Date:   Thu, 31 Mar 2022 22:46:49 +0200
Message-Id: <20220331204651.2699107-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
References: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Integrated into the scheduler now and all users converted over.

v2: Rebased over changes from König.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/drm_gem.c | 80 ---------------------------------------
 include/drm/drm_gem.h     |  5 ---
 2 files changed, 85 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 56fb87885146..133dfae06fab 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1273,83 +1273,3 @@ drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 	ww_acquire_fini(acquire_ctx);
 }
 EXPORT_SYMBOL(drm_gem_unlock_reservations);
-
-/**
- * drm_gem_fence_array_add - Adds the fence to an array of fences to be
- * waited on, deduplicating fences from the same context.
- *
- * @fence_array: array of dma_fence * for the job to block on.
- * @fence: the dma_fence to add to the list of dependencies.
- *
- * This functions consumes the reference for @fence both on success and error
- * cases.
- *
- * Returns:
- * 0 on success, or an error on failing to expand the array.
- */
-int drm_gem_fence_array_add(struct xarray *fence_array,
-			    struct dma_fence *fence)
-{
-	struct dma_fence *entry;
-	unsigned long index;
-	u32 id = 0;
-	int ret;
-
-	if (!fence)
-		return 0;
-
-	/* Deduplicate if we already depend on a fence from the same context.
-	 * This lets the size of the array of deps scale with the number of
-	 * engines involved, rather than the number of BOs.
-	 */
-	xa_for_each(fence_array, index, entry) {
-		if (entry->context != fence->context)
-			continue;
-
-		if (dma_fence_is_later(fence, entry)) {
-			dma_fence_put(entry);
-			xa_store(fence_array, index, fence, GFP_KERNEL);
-		} else {
-			dma_fence_put(fence);
-		}
-		return 0;
-	}
-
-	ret = xa_alloc(fence_array, &id, fence, xa_limit_32b, GFP_KERNEL);
-	if (ret != 0)
-		dma_fence_put(fence);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_fence_array_add);
-
-/**
- * drm_gem_fence_array_add_implicit - Adds the implicit dependencies tracked
- * in the GEM object's reservation object to an array of dma_fences for use in
- * scheduling a rendering job.
- *
- * This should be called after drm_gem_lock_reservations() on your array of
- * GEM objects used in the job but before updating the reservations with your
- * own fences.
- *
- * @fence_array: array of dma_fence * for the job to block on.
- * @obj: the gem object to add new dependencies from.
- * @write: whether the job might write the object (so we need to depend on
- * shared fences in the reservation object).
- */
-int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
-				     struct drm_gem_object *obj,
-				     bool write)
-{
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
-	int ret = 0;
-
-	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
-		ret = drm_gem_fence_array_add(fence_array, fence);
-		if (ret)
-			break;
-	}
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index e2941cee14b6..9d7c61a122dc 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -407,11 +407,6 @@ int drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
 			      struct ww_acquire_ctx *acquire_ctx);
 void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 				 struct ww_acquire_ctx *acquire_ctx);
-int drm_gem_fence_array_add(struct xarray *fence_array,
-			    struct dma_fence *fence);
-int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
-				     struct drm_gem_object *obj,
-				     bool write);
 int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 			    u32 handle, u64 *offset);
 
-- 
2.34.1

