Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBD3461661
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245394AbhK2NbP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:31:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237248AbhK2N3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:29:13 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5DEC0048F4
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:40 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id t9so19294628wrx.7
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7XV1ycL0JA6uJA4j325yZigiICpFpwzKb7YQrY4jauM=;
        b=J93YbxkV05CyzOrqZnPyY9RPlTNwpOMn0CTltuoOc52qyjVsgduG6svGu8lEnfedHV
         L+KgXF6Rk3MELB22mZD1OkZNPNgP1wzECGoHUYB6BqCdn2NM3lJ+kobly6ztg8lTNl/n
         HjlEciQPkwskBlWuLlUd4t4bPeCr8DCdKoaN4NF0ywo9DEfEgML430Sv/PYpsVDGZmrr
         /A8kswNFxKL59a2GPWWtLdzTkA+p2C5v45R2F7IEDzpHt829PoTwV1/F1V9XgvugbePo
         56LNP9B52mhjlMdZvG+lZWm/Ov2se2cizAY+Q8VWQbX/268kY1zTION9M1RgyexXZz5z
         MbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7XV1ycL0JA6uJA4j325yZigiICpFpwzKb7YQrY4jauM=;
        b=K2X2bouxPtMncLebPQ+PjGnq6YSTIp82gg8xO/ocRuBkqjN58RaPXUw6m9Qr9Bn98s
         PROW12R51gNlWrYYlt5ylrsMs3R5CUBFm8z/tfGvDaWmInwZgu7P8Acc4bIqlgyQIZMF
         usr4tI/h5LtFBuTd63gj935RlcE+IHn/c5l+wfj2phGLAn/Sbc1EzbOH1Rk8i+lSyy8K
         L/zci/X3nrDHoN2AYk4sIIXwewrCkARPvIR5/uGcPRftwEI0Cj7jfebYZlSWuGyxfoaL
         0SYp1aGGLF/UiAYRh6j61E3fMnypbGgsIKCf+XM/eQs6KonVVBvmYXkRtWBTNTyiaK/V
         h60Q==
X-Gm-Message-State: AOAM5320g41oM6AE6QUHCrf7ptT3hbOd5IMQhWDEZ2eMSc+zlObljQJF
        7A4mQjPGyThZkiOJT6bplpw=
X-Google-Smtp-Source: ABdhPJyuJ4V4ZXxgFSMUzbJwqSD1s4ySd+xqVfzTeQqWSwWtXqUXccWmst5gy64arFvckh13+soRbQ==
X-Received: by 2002:a5d:452b:: with SMTP id j11mr33443531wra.432.1638187658893;
        Mon, 29 Nov 2021 04:07:38 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:38 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 27/28] amdgpu: remove DMA-buf fence workaround
Date:   Mon, 29 Nov 2021 13:06:58 +0100
Message-Id: <20211129120659.1815-28-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

