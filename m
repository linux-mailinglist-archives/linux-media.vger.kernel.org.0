Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1B240D8A9
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238147AbhIPLcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238041AbhIPLcK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:10 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B488C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:50 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d21so8889197wra.12
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y25SoRt71DSrY9l8OA7FG8UFi1OexT8w3ra7nEQ11Rk=;
        b=LtjaSpHLRrgL4YyOepQfsvAlki7JLb/UranEKRBD1+4VhcwdIGLWhNQ6STQfY+yZOO
         Gt0H+eCfjzEnIfJJwyCax1e1i2GtosTo5xfp69ztT9R2Gm5YAwSwfaDvTVJNPSaxE2ga
         99BrFqsFORPiVZ/QjsXjUSGK7j3+5x3LLD5iBKmTZzVnxSc+BpxdM3fIjqPpKK0XgmRH
         srjic9TTuBdxj0svLPzE7uyJwCkV5NUmnSeSrq8nwQ5rrO9QHaG89de3oskEgOR62yXY
         NDgpxzgus+Tj+4FtVTpIpwWEHog8SiQIumaLlpKLtnvDjdT0GXvAnxdBNaAIAN57W7tG
         Us2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y25SoRt71DSrY9l8OA7FG8UFi1OexT8w3ra7nEQ11Rk=;
        b=mzwyZ0wH0AS7j0vSdGrTBxWZm09PR0If22kj4tR265BdhCX6WG5If6CUt4nBc3KMcx
         6AbeEIxrea18rp8qlgeSzoXLm+kOu1reojIDmbmGNHl1Q/4DEsFFx3w30gBxxZ8U06R1
         WhOPPgLUEEbG0LSosTHrYmeIPu9VKYmdff2ucIP1R3jtCkLF4fJ+NssmVoizudWZhLHg
         WTjcxXVrvwFVOzsVwOG/SucQlGnCMQf3ugOMekl+c/Ji6s5B49JD0lgdyjdw2CsXyWXK
         bhmQyvKeZUuufpLmFsbnoBLJARgrfebyeO2undIrmBVZpB90/XSFqgnyUboqT8h139lA
         YTAA==
X-Gm-Message-State: AOAM533F9/TiH5Y+3iRAknm2E8FjkSjabtyr08mg1/+/a4pIanEtk3vA
        GSoVUDAHosYbFdBOApteuOw=
X-Google-Smtp-Source: ABdhPJwDyKTk3A7U5to4K+gKuCqH+kI3OVDkyX2dJen/HEpJxjzz5VmO3zU7pvsWfcWHGqEhWJHuZA==
X-Received: by 2002:adf:eb83:: with SMTP id t3mr5303613wrn.365.1631791848677;
        Thu, 16 Sep 2021 04:30:48 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:48 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 03/26] dma-buf: use new iterator in dma_resv_copy_fences
Date:   Thu, 16 Sep 2021 13:30:19 +0200
Message-Id: <20210916113042.3631-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 81 +++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 49 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index bbf36a08ced0..91c040cb7d63 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -431,74 +431,57 @@ EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
  */
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
-	struct dma_resv_list *src_list, *dst_list;
-	struct dma_fence *old, *new;
-	unsigned int i;
+	struct dma_resv_iter cursor;
+	struct dma_resv_list *list;
+	struct dma_fence *f, *excl;
 
 	dma_resv_assert_held(dst);
 
-	rcu_read_lock();
-	src_list = dma_resv_shared_list(src);
+	list = NULL;
+	excl = NULL;
 
-retry:
-	if (src_list) {
-		unsigned int shared_count = src_list->shared_count;
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(dst, &cursor, true, f) {
 
-		rcu_read_unlock();
+		if (cursor.is_first) {
+			dma_resv_list_free(list);
+			dma_fence_put(excl);
 
-		dst_list = dma_resv_list_alloc(shared_count);
-		if (!dst_list)
-			return -ENOMEM;
+			if (cursor.fences) {
+				unsigned int cnt = cursor.fences->shared_count;
 
-		rcu_read_lock();
-		src_list = dma_resv_shared_list(src);
-		if (!src_list || src_list->shared_count > shared_count) {
-			kfree(dst_list);
-			goto retry;
-		}
+				rcu_read_unlock();
+				list = dma_resv_list_alloc(cnt);
+				if (!list)
+					return -ENOMEM;
 
-		dst_list->shared_count = 0;
-		for (i = 0; i < src_list->shared_count; ++i) {
-			struct dma_fence __rcu **dst;
-			struct dma_fence *fence;
+				list->shared_count = 0;
+				rcu_read_lock();
 
-			fence = rcu_dereference(src_list->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &fence->flags))
-				continue;
-
-			if (!dma_fence_get_rcu(fence)) {
-				dma_resv_list_free(dst_list);
-				src_list = dma_resv_shared_list(src);
-				goto retry;
+			} else {
+				list = NULL;
 			}
+			excl = NULL;
+		}
 
-			if (dma_fence_is_signaled(fence)) {
-				dma_fence_put(fence);
-				continue;
-			}
+		if (dma_resv_iter_is_exclusive(&cursor))
+			excl = f;
+		else
+			RCU_INIT_POINTER(list->shared[list->shared_count++], f);
 
-			dst = &dst_list->shared[dst_list->shared_count++];
-			rcu_assign_pointer(*dst, fence);
-		}
-	} else {
-		dst_list = NULL;
+		/* Don't drop the reference */
+		f = NULL;
 	}
 
-	new = dma_fence_get_rcu_safe(&src->fence_excl);
 	rcu_read_unlock();
 
-	src_list = dma_resv_shared_list(dst);
-	old = dma_resv_excl_fence(dst);
-
 	write_seqcount_begin(&dst->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(dst->fence_excl, new);
-	RCU_INIT_POINTER(dst->fence, dst_list);
+	excl = rcu_replace_pointer(dst->fence_excl, excl, dma_resv_held(dst));
+	list = rcu_replace_pointer(dst->fence, list, dma_resv_held(dst));
 	write_seqcount_end(&dst->seq);
 
-	dma_resv_list_free(src_list);
-	dma_fence_put(old);
+	dma_resv_list_free(list);
+	dma_fence_put(excl);
 
 	return 0;
 }
-- 
2.25.1

