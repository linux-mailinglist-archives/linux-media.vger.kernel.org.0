Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BAB408CA7
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240575AbhIMNVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240225AbhIMNUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:20:21 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AE4C0617A8
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:44 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id k5-20020a05600c1c8500b002f76c42214bso6946138wms.3
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y/imVMS+E7ZynWw7iSiIjDs1SxBWXyWjuW715+Mfo5c=;
        b=GBU21soDZeX9Q0JI33LLV4oWf0MjVKn6RiAxRYhJ8wUhpQUX9YGPqIsqVGX/2LZ/UX
         UcT/MOIAQ+RVizElzcVAKkgKY/0HANAiUOnjE9QtXxWVjOwG6niuoKQVP+M9qrYBr8u5
         2Ctzb+HUIXF25yIgJR4etOUapUz2wH0m56qM8qPm6rnjCNvjGHTEqseXquMSLGnu5cmw
         AHSFC1ANuh8J5ba8jFq3fyWKRAYi6fBxopE1svXT4Jt/QzPOuoiZzZ1KZhY/zPtlwrTd
         UY8KLonqI/fxlcusZkTe2Xc6yu08DXMJU0SgBUvEYyaaoBH1DNb/4lv1s9lYGb/+UwaG
         SGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y/imVMS+E7ZynWw7iSiIjDs1SxBWXyWjuW715+Mfo5c=;
        b=k72dUJu6JFHIS7oOVe6r2LHkspUrKXokesRzTRO1DeIhZKzbQ5zipjbtBPBqwKgO6C
         38g7Ls9QwBe/tRk5Tnr22kPt2EzgSjk7rHHPoqFjr+ZFOPHH0k/kBMV1FZ7FD101FGfe
         u3/SKoNx/qxV7Bfl63Y3pGoLpUHmMpkBYo+1Xt1kBLMSijMK2gQnQjac2zXMTCB8eV/W
         kk/lfvgTnGoaFTUh/1sU/8Km7s9nJQVZ9HtrquRWCaRFLHopHuMVVFdoNF29MlxBZQDW
         ZkHk8fE7pn/VtJWo+6t6brcWmbj3gb4uTaEpiWSloAiHOzkZSl8lJzfZDBiZttQjBjWx
         LQBw==
X-Gm-Message-State: AOAM533I1q9aaLcmFCrLB0sINm54IXYCSkcAuf31jPAussMECnHLip5r
        SXXgKYHuKFk7tFg/siL/frMLBMLnh0suqXKD
X-Google-Smtp-Source: ABdhPJzPOBw9wFbcsxPQomuaL1kkRsP/z4UMlhWhu5zy3IvXjpysXjtU3LpY/CU8j9RDf5Hi6OD0aQ==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr10752303wmi.163.1631539062774;
        Mon, 13 Sep 2021 06:17:42 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:42 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 24/26] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date:   Mon, 13 Sep 2021 15:17:05 +0200
Message-Id: <20210913131707.45639-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of hand rolling the logic.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b8fa6ed3dd73..6808dbef5c79 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -437,19 +437,17 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 static void etnaviv_gem_describe_fence(struct dma_fence *fence,
 	const char *type, struct seq_file *m)
 {
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		seq_printf(m, "\t%9s: %s %s seq %llu\n",
-			   type,
-			   fence->ops->get_driver_name(fence),
-			   fence->ops->get_timeline_name(fence),
-			   fence->seqno);
+	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
+		   fence->ops->get_driver_name(fence),
+		   fence->ops->get_timeline_name(fence),
+		   fence->seqno);
 }
 
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
 
@@ -459,19 +457,12 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			off, etnaviv_obj->vaddr, obj->size);
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence_unlocked(robj, &cursor, true, fence) {
+		if (cursor.is_exclusive)
+			etnaviv_gem_describe_fence(fence, "Exclusive", m);
+		else
 			etnaviv_gem_describe_fence(fence, "Shared", m);
-		}
 	}
-
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		etnaviv_gem_describe_fence(fence, "Exclusive", m);
 	rcu_read_unlock();
 }
 
-- 
2.25.1

