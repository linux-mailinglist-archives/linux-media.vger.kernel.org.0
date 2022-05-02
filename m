Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAEC951749E
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386333AbiEBQlc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381117AbiEBQlU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:20 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2281DF9D
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:50 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id m2-20020a1ca302000000b003943bc63f98so1641701wme.4
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JaejlDfj0uy9dkJeeagJEWX0/Sis0ZiAGo/I1Cyla8w=;
        b=WJ14jFIJZIdqObfgPXjsBsWmhqzPN5JNkavdyclcrjJvsiZMlKFrcxW82UKBOKg1Kt
         +FyDEMWQJLDovDeCeOC7uNufANhJwlQ3HGaAmUM8PD8QWue6I5FD2dl2byPzAYnQlbZT
         1cFPbuBXiU+xID11jsSFtSTxaemQaed+J9VZrU7HrUImIBhc0ZWXbAwlimB4YDWbYXAZ
         BIqdUTzQvGbtjWRv1nOZTP8ZrA2jOBZt2ADK+xok8RzzOzmtHyvCAsgiYiOLK9IAOuex
         G6KX9NjweCQ+WmEDsvJ3zeqmrC5ueLUwluvFRCmkoAhT411SV3lUfs3KI3mu03Opg0B4
         du0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JaejlDfj0uy9dkJeeagJEWX0/Sis0ZiAGo/I1Cyla8w=;
        b=chZNj8D96bX1pZhZMdI/JqpsTL9iBH0/TiIlQQGCRKJiLTaufhBde8SRZOzBSb8i1i
         p29LCa5/5sVRxNI+wq53C4RZVtwHXFWBzBv9bFhZFojDmEHNn/SQY5uEtSMJ249LN2Ss
         5fOZc1/skcPjD/QL3S1pjRvJUyahI9/mD/YB+a49Z1ImQkdCYQE5OJ8XDaT6yjmY7V4q
         sXnN23OkMojO7WsVbGhE2tIxzADhtO1J5yqDQ4ZrfHeZKX5Fe2Wq3ptmID9mg7IszBiZ
         jadDk8hdVIBPi9t/rnpCTuN+6thxqnrqvASk0jnLofPUiY69U3tcuF05fVBcj+griNum
         wn5w==
X-Gm-Message-State: AOAM530ToOFjANFvRF0UBzhvJFVbQNce71Ari/TCmZvO4UbfxzJrQctV
        E6JWMvJ+LAOotxtIctSPz/g=
X-Google-Smtp-Source: ABdhPJynMfTwX3SfWHMTUt/qZtPV8EjvjXV8D1iGxBM93doCrtHO7arJvRfSWJC8eKAagR1WU/LPWA==
X-Received: by 2002:a05:600c:25d2:b0:394:2db5:bc32 with SMTP id 18-20020a05600c25d200b003942db5bc32mr10549461wml.39.1651509469475;
        Mon, 02 May 2022 09:37:49 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:48 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 15/15] drm/amdgpu: user fence proof of concept
Date:   Mon,  2 May 2022 18:37:22 +0200
Message-Id: <20220502163722.3957-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just some hack to test the functionality, not a real implementation of
the interface.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                    |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 28 ++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  9 ++++--
 5 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index da667c21ad55..e18efb21c452 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -286,7 +286,8 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 	/* Drivers should not add containers here, instead add each fence
 	 * individually.
 	 */
-	WARN_ON(dma_fence_is_container(fence));
+	//WARN_ON(dma_fence_is_container(fence));
+
 
 	/* User fences must be added using DMA_RESV_USAGE_USER */
 	WARN_ON(test_bit(DMA_FENCE_FLAG_USER, &fence->flags) !=
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 95eeab527ca9..299ab8e50c42 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -453,6 +453,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
 	struct drm_gem_object *obj;
+	long timeout = HZ / 10;
 	struct amdgpu_bo *gds;
 	struct amdgpu_bo *gws;
 	struct amdgpu_bo *oa;
@@ -476,6 +477,17 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			return r;
 	}
 
+	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+		struct dma_resv *resv = e->bo->tbo.base.resv;
+
+		timeout = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_USER,
+						true, timeout);
+		if (unlikely(timeout < 0))
+			return timeout;
+		if (unlikely(timeout == 0))
+			return -ETIME;
+	}
+
 	/* Get userptr backing pages. If pages are updated after registered
 	 * in amdgpu_gem_userptr_ioctl(), amdgpu_cs_list_validate() will do
 	 * amdgpu_ttm_backend_bind() to flush and invalidate new pages
@@ -516,7 +528,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			return r;
 
 		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base, 2);
+			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base, 3);
 			drm_exec_break_on_contention(&p->exec);
 			if (unlikely(r))
 				return r;
@@ -527,7 +539,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 
 		if (p->uf_bo) {
 			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
-						 2);
+						 3);
 			drm_exec_continue_on_contention(&p->exec);
 			if (unlikely(r))
 				return r;
@@ -1160,6 +1172,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	struct drm_sched_entity *entity = p->entity;
 	struct amdgpu_bo_list_entry *e;
 	struct drm_gem_object *gobj;
+	struct dma_fence *dummy;
 	struct amdgpu_job *job;
 	unsigned long index;
 	uint64_t seq;
@@ -1191,6 +1204,11 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	}
 
 	p->fence = dma_fence_get(&job->base.s_fence->finished);
+	dummy = dma_fence_merge(p->fence, dma_fence_get_stub(true));
+	if (!dummy) {
+		r = -ENOMEM;
+		goto error_abort;
+	}
 
 	amdgpu_ctx_add_fence(p->ctx, entity, p->fence, &seq);
 	amdgpu_cs_post_dependencies(p);
@@ -1214,11 +1232,13 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
 	drm_exec_for_each_duplicate_object(&p->exec, index, gobj) {
 		ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
-		dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_WRITE);
+		dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_KERNEL);
+		dma_resv_add_fence(gobj->resv, dummy, DMA_RESV_USAGE_USER);
 	}
 	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
 		ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
-		dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_WRITE);
+		dma_resv_add_fence(gobj->resv, p->fence, DMA_RESV_USAGE_KERNEL);
+		dma_resv_add_fence(gobj->resv, dummy, DMA_RESV_USAGE_USER);
 	}
 
 	mutex_unlock(&p->adev->notifier_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b03663f42cc9..bd334f5fd64f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2655,7 +2655,7 @@ static const struct drm_driver amdgpu_kms_driver = {
 	    DRIVER_ATOMIC |
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_SYNCOBJ |
-	    DRIVER_SYNCOBJ_TIMELINE,
+	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_USER_FENCE,
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
 	.lastclose = amdgpu_driver_lastclose_kms,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index e5c8e72a9485..6705287887e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -628,7 +628,7 @@ static void amdgpu_vm_pt_next_dfs(struct amdgpu_device *adev,
  */
 int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec)
 {
-	return drm_exec_prepare_obj(exec, &vm->root.bo->tbo.base, 4);
+	return drm_exec_prepare_obj(exec, &vm->root.bo->tbo.base, 5);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c5b2417adcc6..2e0f059b9d12 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7627,12 +7627,11 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 		DRM_ERROR("%p bind failed\n", rbo);
 		goto error_unpin;
 	}
+	amdgpu_bo_unreserve(rbo);
 
 	r = drm_gem_plane_helper_prepare_fb(plane, new_state);
 	if (unlikely(r != 0))
-		goto error_unpin;
-
-	amdgpu_bo_unreserve(rbo);
+		goto error_reserve;
 
 	afb->address = amdgpu_bo_gpu_offset(rbo);
 
@@ -7665,6 +7664,10 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 
 	return 0;
 
+error_reserve:
+	if (WARN_ON(amdgpu_bo_reserve(rbo, true)))
+		return r;
+
 error_unpin:
 	amdgpu_bo_unpin(rbo);
 
-- 
2.25.1

