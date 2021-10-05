Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA47D422520
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234403AbhJELjo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234396AbhJELjm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:42 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DD0C06174E
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:37:51 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id z184-20020a1c7ec1000000b003065f0bc631so2773704wmc.0
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7S4UZZ06lQFAt7cL4jRnJdIrOJP1lf3uq1O38fzKrOI=;
        b=klCt2ie1iQoJNVuAJjBjxzmsYVle3nBQs+NUswgWm1tq1bbIrTXguLW0YPmuGZerZ4
         Y04Hjirr6t9HEaqxlc0OrV4dBHt/1h1jPqUMjN+w7Ziy+hvoRpBj/buttX9ug0BXq8bd
         2B1Aoq6B1FO8E23fimNrICoLmWKjvMTuyFSq6FufCOvucdRklCVgx8lRyPeV3LRT7vBe
         c7UMoCtjxfNkLQqDAvg+3mV5XiNmDsQF+6DyjadkQmjkBbVktRVg20vy4YkQkzhb7qOe
         YUTRl11vSunqaG1SW+UIyNrF6O83xsR6U+oullpCn/Su16E/CEM5QApbIKdiN3zEPAKg
         e95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7S4UZZ06lQFAt7cL4jRnJdIrOJP1lf3uq1O38fzKrOI=;
        b=nbhflAQEdUbCNJRfYls73rI7ELegmSWrWy8l7F4m/8hh4O04N6iT6J93QcqqFH138U
         zF2a1yED7o6y9uTPanGhV1Pcdc7ztCuu6LjJamaKFYvmaVxsAHgQVsOfPNDuCe+aBP5d
         Kcj//mx0Tfpw1qro8M9+f5CivtgAeCHoAonbQtyYOkc/0cB0k6yb32GY4oafIUo1wph4
         NGJTx2UPXBqfoQ3qMGXvw3sm4EaiM8cAyBb6TcqPh86f8Kk/ZSMMHM2u1xsluBW2GaBy
         q/D3kooahYEUaGOWQnS9iAubw8ILnks5RlE+Hbp9rsYMLdjXXNp5qdswtqBsC9dqd/1c
         1/5Q==
X-Gm-Message-State: AOAM530izgYx6I0LNtSfwKg9dx+SgaeHTgbG6qaB0OGUQfM9x/SvO0Sx
        3ZbTJIAT4IP5xIG+hhjbKGA=
X-Google-Smtp-Source: ABdhPJxPfajocwVl7jmyxBmrImRcinblFXj7dZ49L53robce8asbmIjdgWRMcGcHAEEOmAOzYfXVLA==
X-Received: by 2002:a1c:c905:: with SMTP id f5mr2855109wmb.148.1633433870365;
        Tue, 05 Oct 2021 04:37:50 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:50 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 06/28] dma-buf: use new iterator in dma_resv_wait_timeout
Date:   Tue,  5 Oct 2021 13:37:20 +0200
Message-Id: <20211005113742.1101-7-christian.koenig@amd.com>
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
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 69 +++++---------------------------------
 1 file changed, 8 insertions(+), 61 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 1a43bef03af3..220c40dc5c11 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -614,74 +614,21 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
-
-retry:
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
-	rcu_read_lock();
-	i = -1;
-
-	fence = dma_resv_excl_fence(obj);
-	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		if (!dma_fence_get_rcu(fence))
-			goto unlock_retry;
-
-		if (dma_fence_is_signaled(fence)) {
-			dma_fence_put(fence);
-			fence = NULL;
-		}
-
-	} else {
-		fence = NULL;
-	}
-
-	if (wait_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-
-		if (fobj)
-			shared_count = fobj->shared_count;
-
-		for (i = 0; !fence && i < shared_count; ++i) {
-			struct dma_fence *lfence;
-
-			lfence = rcu_dereference(fobj->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &lfence->flags))
-				continue;
 
-			if (!dma_fence_get_rcu(lfence))
-				goto unlock_retry;
-
-			if (dma_fence_is_signaled(lfence)) {
-				dma_fence_put(lfence);
-				continue;
-			}
+	dma_resv_iter_begin(&cursor, obj, wait_all);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
-			fence = lfence;
-			break;
+		ret = dma_fence_wait_timeout(fence, intr, ret);
+		if (ret <= 0) {
+			dma_resv_iter_end(&cursor);
+			return ret;
 		}
 	}
+	dma_resv_iter_end(&cursor);
 
-	rcu_read_unlock();
-	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
-
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		dma_fence_put(fence);
-		if (ret > 0 && wait_all && (i + 1 < shared_count))
-			goto retry;
-	}
 	return ret;
-
-unlock_retry:
-	rcu_read_unlock();
-	goto retry;
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
-- 
2.25.1

