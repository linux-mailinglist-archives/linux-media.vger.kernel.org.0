Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E91A46BB40
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236464AbhLGMiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:38:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236437AbhLGMiO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:38:14 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550F0C061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:44 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id u1so29097943wru.13
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7XV1ycL0JA6uJA4j325yZigiICpFpwzKb7YQrY4jauM=;
        b=pj9t0p0A4Wo19ZnH1VKW/t1vFVi96WKTE9qa5LmJo+Nw6R6l+9eRup+wt1lvvR9gKG
         N7bI+djt8RnrbrvobLfG3ONZj//2YtyVxWIA/Yk7bJBbDWqQGchtN2q+vLX80bc158xJ
         G+vrnK7qsmCzb88x7gEWyhv4YfkSLoJTQ3N0yYxqTiDRQdjlUcVRQ4Pk9usVOucBZ3LZ
         h0dSXU8xpHL2QcbhxglmI4mzvkqBjmnCRgj547ZXulaD/iqJCJ/WP+533l2k5FXUnRvY
         JdBw2keqyEat8gSy2ppqLstOyTD3/ZYAO8Gy3eNlV7sB9d7gm2qzY94E2mB99OWNSDVV
         yTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7XV1ycL0JA6uJA4j325yZigiICpFpwzKb7YQrY4jauM=;
        b=VcezOmwxmLrcxg2f28VjM1uKIJSngeoy14kLUdfPJFokPAmNMS8FghbQSgjTQuVDod
         0smHAyaQLu/M0wdu97J3FUtkQ3TPUTyg63OYHznx4EKKWas7zZgzyRSM8pIyw2EIoqSi
         WqOO87xPpZliU0jlSxtoaUywXPwXraB/WccFklEBowKukAs4Xivlq/V/DKSrh7krgaCa
         GilygMbsZtEUglKzg8NbYTMI2b2aJofuqJ1AnzE64GnKFMnqrfn4Y7QVk/B0Mp21119B
         qSs8siH9vx/DjlS987+rkHIIfyaYI+r+Wxsorr5bFa7cdVDkbXGWF/7RFekUVLhD4XRb
         ZZTA==
X-Gm-Message-State: AOAM530eweN7euG5A8nw1HWhy6BZEvFAP7b8ElFgtDZTO/z6b5j1Uq8q
        0x/88hZXbdDLFeoDpBOC5n4=
X-Google-Smtp-Source: ABdhPJwVIawAb44+Y6nZ7ksLr6chagYlk3TqUMwD0PEgxdO7LwORlA8yABy4FWK+h61tgsfFCqe30Q==
X-Received: by 2002:a5d:584e:: with SMTP id i14mr51733949wrf.386.1638880483013;
        Tue, 07 Dec 2021 04:34:43 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:42 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 23/24] amdgpu: remove DMA-buf fence workaround
Date:   Tue,  7 Dec 2021 13:34:10 +0100
Message-Id: <20211207123411.167006-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Not needed any more now we have that inside the framework.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 52 +++------------------
 2 files changed, 6 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index 044b41f0bfd9..529d52a204cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -34,7 +34,6 @@ struct amdgpu_fpriv;
 struct amdgpu_bo_list_entry {
 	struct ttm_validate_buffer	tv;
 	struct amdgpu_bo_va		*bo_va;
-	struct dma_fence_chain		*chain;
 	uint32_t			priority;
 	struct page			**user_pages;
 	bool				user_invalidated;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 92091e800022..413606d10080 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -576,14 +576,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
 
 		e->bo_va = amdgpu_vm_bo_find(vm, bo);
-
-		if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
-			e->chain = dma_fence_chain_alloc();
-			if (!e->chain) {
-				r = -ENOMEM;
-				goto error_validate;
-			}
-		}
 	}
 
 	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
@@ -634,13 +626,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	}
 
 error_validate:
-	if (r) {
-		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			dma_fence_chain_free(e->chain);
-			e->chain = NULL;
-		}
+	if (r)
 		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
-	}
 out:
 	return r;
 }
@@ -680,17 +667,9 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
 {
 	unsigned i;
 
-	if (error && backoff) {
-		struct amdgpu_bo_list_entry *e;
-
-		amdgpu_bo_list_for_each_entry(e, parser->bo_list) {
-			dma_fence_chain_free(e->chain);
-			e->chain = NULL;
-		}
-
+	if (error && backoff)
 		ttm_eu_backoff_reservation(&parser->ticket,
 					   &parser->validated);
-	}
 
 	for (i = 0; i < parser->num_post_deps; i++) {
 		drm_syncobj_put(parser->post_deps[i].syncobj);
@@ -1265,29 +1244,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
-	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		struct dma_resv *resv = e->tv.bo->base.resv;
-		struct dma_fence_chain *chain = e->chain;
-		struct dma_resv_iter cursor;
-		struct dma_fence *fence;
-
-		if (!chain)
-			continue;
-
-		/*
-		 * Work around dma_resv shortcommings by wrapping up the
-		 * submission in a dma_fence_chain and add it as exclusive
-		 * fence.
-		 */
-		dma_resv_for_each_fence(&cursor, resv,
-					DMA_RESV_USAGE_WRITE,
-					fence) {
-			break;
-		}
-		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
-		dma_resv_add_fence(resv, &chain->base, DMA_RESV_USAGE_WRITE);
-		e->chain = NULL;
-	}
+	/* For now manually add the resulting fence as writer as well */
+	amdgpu_bo_list_for_each_entry(e, p->bo_list)
+		dma_resv_add_fence(e->tv.bo->base.resv, p->fence,
+				   DMA_RESV_USAGE_WRITE);
 
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
 	mutex_unlock(&p->adev->notifier_lock);
-- 
2.25.1

