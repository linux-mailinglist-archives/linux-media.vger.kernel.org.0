Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD5DF40685D
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbhIJI2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbhIJI2T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:19 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC2CC061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:08 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id g16so1461383wrb.3
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E+vlHAHze2GbFEMjJ18FaF4XzFbDHKUq0E4VCOiUNuo=;
        b=HybftAd+7uKdOV5zg2ea0y+qhWvQofD19fVH44gZl20wjwRGG1zpzzasvlB1cJjN7u
         5OLeGUdVvhXnrz93ObRQjFXGpoTmn+f5IfUQp9X0ClvsDVJuq2POC9dWspHGv9C7qf5Y
         SUM4Mqk1mXxACItxPdU7gFcsg7TOuFo1V122TOkOE1AZXMNKvE/zDlAn2RnUrm3PnAoJ
         jZaaCERt4hzU7yqGy1IjJtQ76pMLGTiJSQxOCVxQo3jh3dADc3PldDEe1lVymKyfSco9
         uU/jPvx5MQ4XME91lEapNwjnxXvCqTm+34SAC4ZoYb2SshqdbWAsG0vEiPBPVDra8Iu/
         1GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E+vlHAHze2GbFEMjJ18FaF4XzFbDHKUq0E4VCOiUNuo=;
        b=jc6JOX39O92lj6pgrMBNzX9bvnJuagx8w3aQY8+tCxcVaYaTZjyWDQb4WRwBOiObWd
         JjVBLP4tRgIFznq8xO9aOFxuwS4/nqbQx2EVZ7K6pQ7z99t+sYrswDvJKDn9SCaT9L+g
         1qfzxCzTtu11hzFglQfr4jUou48oBj5pU6InC4gro0L4m4Dm1x9oz4czTW9Ppn7w3xJu
         /hnzRJbTRclHhb04JChXtl0qzgqmgdq45U0KTqNcxlxR1ddq5Rf84/5eZlmCc9akj8iD
         YMbW1w1Q9fg6nasBpu3E+7yyFotWix4LBuTsTpTVB6f57fkhb6zAx65aqCAelPd5KQZR
         F7og==
X-Gm-Message-State: AOAM533E+CVDsQxNWkJOGKdOeDA/dYG6yEZge32Myga6IfrmgNP4J1hc
        551DQ1zX+oo8Q/Z3TnE9LXM=
X-Google-Smtp-Source: ABdhPJzfd/Udc2aUZ+b/NYD27ztPjCkExkaZPwjk+zgrhKyeNASlXYGYiyLGf6eAhsuRtI8c+BhUKQ==
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr320170wrp.95.1631262427136;
        Fri, 10 Sep 2021 01:27:07 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:27:06 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 11/14] drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
Date:   Fri, 10 Sep 2021 10:26:52 +0200
Message-Id: <20210910082655.82168-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
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
index 489e22190e29..0a927006ba9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1332,10 +1332,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
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
@@ -1349,14 +1348,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
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

