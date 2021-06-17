Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DA33AB233
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbhFQLST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbhFQLSS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:18 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF248C061760
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:10 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id nb6so9157052ejc.10
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=f1nM/lpdSyfhiokJoYKLwhEgbv1/4gmOk1Dy2ivEHic=;
        b=A/XrqU2+MWOuAkqSgZ6QRPi/OX8NnlSLG59pLX7MWTJdq/uJfCYBGgj1uNqm7KnshJ
         ONHeTwD04CBs29Zlu+QbB018Sjbj1EbD2PRqZl9cKBh9SMmhDZBsCQ46OxPgp1o8Qq3w
         pms9himFZh0TiGjmbDTagV+cT2IlGLWj033t58n/sVW92evl7E/bIIeKVakNk8213Kzl
         UTL+AemGi/lA9fyKp0bn74Khf/YY4mATHujl7EeUiZ+n3ts5rQ09gb7MWWAyOeljamEW
         VF9NakYitalSgDIqNGl7UvP+t0K2cS4irujtjxI07D3cwQaBxKs0atuYZ9O1iAdeGK0k
         9j6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f1nM/lpdSyfhiokJoYKLwhEgbv1/4gmOk1Dy2ivEHic=;
        b=LP+V1k4dxqosBAwvD2j/lELfzK0NBg2SXu15x+XJVTBuzmKwuO/ehOYSz8BKAlZKXb
         NyjEorUFwWk7KVUHHNGbdgP+n3J1ffciXAZvZwuJHuqBDCIbvd5z5/BzQwcZBHcjyzZK
         vsqFWWow44lax0uAt4ZkVqP30kF/cZn/rfr1zooy09QA0S6tZsQWhPHuMofSoiTQU1HE
         IzH7tP8hY4QzvX/AltyDJkRzTi5L2FVV5e27Of9kXKaqKS2f2eVKCXzTRTQ+SRT4Hpz3
         McR4O39eArizMNNwLcI3MwKPCX2i+d5+Cb8hOQRdg7Xx+eGQEElTIeKHudofU3QdfPtC
         Rmbw==
X-Gm-Message-State: AOAM533cfSasqbNzSON+FuVl7BAC8hkbea5nOOyzDXNpdu3Ws/iTM83i
        i0GVQDlNuGUQInABFSdolgg=
X-Google-Smtp-Source: ABdhPJwpl+Y35NzWtOSjv3T8c0k5bgUp2ObFD77ixFfDk+LP3QdJI72JcZJK2ppOJ0uA8hoXgx4CfQ==
X-Received: by 2002:a17:906:86cc:: with SMTP id j12mr4762643ejy.548.1623928569570;
        Thu, 17 Jun 2021 04:16:09 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:09 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 12/16] drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
Date:   Thu, 17 Jun 2021 13:15:54 +0200
Message-Id: <20210617111558.28486-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 80dff29f2bc7..d86b0cbff889 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1334,10 +1334,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
 	unsigned long num_pages = bo->resource->num_pages;
+	struct dma_resv_cursor resv_cursor;
 	struct amdgpu_res_cursor cursor;
-	struct dma_resv_list *flist;
 	struct dma_fence *f;
-	int i;
 
 	/* Swapout? */
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
@@ -1351,14 +1350,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * If true, then return false as any KFD process needs all its BOs to
 	 * be resident to run successfully
 	 */
-	flist = dma_resv_shared_list(bo->base.resv);
-	if (flist) {
-		for (i = 0; i < flist->shared_count; ++i) {
-			f = rcu_dereference_protected(flist->shared[i],
-				dma_resv_held(bo->base.resv));
-			if (amdkfd_fence_check_mm(f, current->mm))
-				return false;
-		}
+	dma_resv_for_each_fence(bo->base.resv, &resv_cursor, true, f) {
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 	}
 
 	switch (bo->resource->mem_type) {
-- 
2.25.1

