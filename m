Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA8342251E
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234395AbhJELjm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbhJELjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:40 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020C3C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:37:50 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t8so36888827wri.1
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U6RuQegBioz/4N3AaXbIj8kc2CNOG/D15/qkmZhLY1o=;
        b=evoUvuNbcUZSvrRFY6KbOxMbSeqts+aR73fUmoxZGmDf/TahK9F4e03OCWpR61hVlj
         bKRcDpqYlFwhm+6EIXEIWaeLTXa8ZRGs1y26MFGeoZMtfjcbMB5L6zqwJ6bmGDtvCfjH
         laPFKJTHutLZXmVvHzZA0wXehEiiKODGp6cqKZKVRBTOS4d8kfAYkrVzvfWnwiVENZcW
         +9CC9OWYMXWU1d+vv8dyeml7L30WSTCVSAXxCzkU3vd7Z1z72NkZa4KYAxc7Lh4fe8PL
         Q9qP70HPQQiaOsAh4JL7rlUuF0Cf/fQdu8HBXOHpIkEjQDGfjDOUJvNwoNvc4U1cjDKh
         autw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U6RuQegBioz/4N3AaXbIj8kc2CNOG/D15/qkmZhLY1o=;
        b=2s2gw1kNKK0tIkl1ul9Sp3m/05ZMW3aI0uHhiy4oJA1i8gj2FyNC5PdXM1zHCrY5w9
         vW+drcpRuU3JfGYl6P98wXfHXOP9a0lF8EjA+2xmsOnUSiHQBGz+K2vCj020RlOmeLvM
         AslF/sXV7L3vabtJSlJGDTKo/EkVhbsXYwzEEv45jbbVRcPRpyWkdMV1zViLFMWBJ1eJ
         +NlUWt2glpCTQld3uXzmpe3PR5QBtrwA8tgfjrWzJISzuDHd7Dpv2lVtDjDwrhS1aPkq
         ZHOjWJTv9SmCWoWSCAeuvKYdJH4DnT20fRMS6jupVz9dx+fUPppfyxrbJAZbTkF3saDT
         uEUA==
X-Gm-Message-State: AOAM533sKngQCyvVoSUCh8L0eWZu85rb/LPQCMt8wt4IyZe+/b/ugSUV
        LQerUycWPYQZGymn3MKn3Kk=
X-Google-Smtp-Source: ABdhPJwpw+q0kqLl9bdX7HVh0bMqCAshsNFaW5TeP8YCzbBp5tCIcYtg/84BZJYXm22Dlh8qa9tABA==
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr20721837wrs.270.1633433868683;
        Tue, 05 Oct 2021 04:37:48 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:48 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 04/28] dma-buf: use new iterator in dma_resv_copy_fences
Date:   Tue,  5 Oct 2021 13:37:18 +0200
Message-Id: <20211005113742.1101-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 84 +++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 52 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 231bae173ef1..e5ea42df0c6b 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -481,74 +481,54 @@ EXPORT_SYMBOL_GPL(dma_resv_iter_next);
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
+	dma_resv_iter_begin(&cursor, src, true);
+	dma_resv_for_each_fence_unlocked(&cursor, f) {
 
-		rcu_read_unlock();
+		if (dma_resv_iter_is_restarted(&cursor)) {
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
-
-		dst_list->shared_count = 0;
-		for (i = 0; i < src_list->shared_count; ++i) {
-			struct dma_fence __rcu **dst;
-			struct dma_fence *fence;
+				list = dma_resv_list_alloc(cnt);
+				if (!list) {
+					dma_resv_iter_end(&cursor);
+					return -ENOMEM;
+				}
 
-			fence = rcu_dereference(src_list->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &fence->flags))
-				continue;
+				list->shared_count = 0;
 
-			if (!dma_fence_get_rcu(fence)) {
-				dma_resv_list_free(dst_list);
-				src_list = dma_resv_shared_list(src);
-				goto retry;
+			} else {
+				list = NULL;
 			}
-
-			if (dma_fence_is_signaled(fence)) {
-				dma_fence_put(fence);
-				continue;
-			}
-
-			dst = &dst_list->shared[dst_list->shared_count++];
-			rcu_assign_pointer(*dst, fence);
+			excl = NULL;
 		}
-	} else {
-		dst_list = NULL;
-	}
 
-	new = dma_fence_get_rcu_safe(&src->fence_excl);
-	rcu_read_unlock();
-
-	src_list = dma_resv_shared_list(dst);
-	old = dma_resv_excl_fence(dst);
+		dma_fence_get(f);
+		if (dma_resv_iter_is_exclusive(&cursor))
+			excl = f;
+		else
+			RCU_INIT_POINTER(list->shared[list->shared_count++], f);
+	}
+	dma_resv_iter_end(&cursor);
 
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

