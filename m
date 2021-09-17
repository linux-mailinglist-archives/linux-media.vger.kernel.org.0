Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F03840F7AB
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244194AbhIQMgq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244189AbhIQMgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:44 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963FFC061766
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:22 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id q26so14925433wrc.7
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RfHqvcyiEJW+8Dv+evs+CpAicHAPfkZinp9Xu/Tw2t0=;
        b=G+urs6mPARXC3SO9XXPNshssXO2BZh8WmFOl5MT5iJsXIosexKxo9uUcPiDxc7Kv5F
         BGAQkNlQam50WpDy+MshUUpJXDnL1hz8tbvPjAmFzFTi1rFDuLh36jCcMM6I2fiukfbD
         7MLfH4IZSg4W8HX0l0Sv6wKVm9bxkQcSVkIo0pthgQgdIzxvqeKdhm3qwyGSGT++Xuz6
         leDyZ0/k0v7czH4H3Av2UNU2LMO45W0dExZQRovMrm5InsyI740pVD2CE8bqDdeUaH4/
         E+zZKqDY1hkYiRgnqorvXl4fnJfnqpEIQWCCeaNACIVDp81PEFGSJM204n4VXsUCK0Gm
         xNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RfHqvcyiEJW+8Dv+evs+CpAicHAPfkZinp9Xu/Tw2t0=;
        b=W6/Q9VgeW5p6o9mL5bcgFyhYEBkkDB/RQBKHXJ/lFh8ooGsj5MB0Vv7DVh6qRTc208
         wEAuGsZs/OnBWpqH0jW1erXlPxl59FAPTsP+fltWSHUbrrtaRiybio1FkD7cnSqbpPTp
         C3Jg+SX/bkn/k0ZAUzVtaKJMkQE/FQlpW1NdcvhxYdyB2i6jORzoSYfXnritgusYqWjI
         qGFMZr3QywDrHflT6q+vZ3bw5aKvmzmLdoML0K0MXMJa1a0Ruvrg5sTN3cttkWZWnF9Q
         hZ4tRImXcY8Pbj2YzYADgjJt1PGU54B/qOnObSW6ZkD8WNBlme545WDIuOA5x9pn1/uE
         6KuA==
X-Gm-Message-State: AOAM5331mRavxCw+ORHAJh+ykKnZIqZz8YeGLv+REUDxhQb5nLnLGySN
        h7FCAVLTyKCQ/lyWJf/wMyY=
X-Google-Smtp-Source: ABdhPJwP6PF7du9OAVJXVkoGkr0OBbNqSGCyO09T5wU1+fJSM9j6cy3vh+oonWYU/jK7vx2nVaGXDA==
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr12126933wrb.237.1631882121293;
        Fri, 17 Sep 2021 05:35:21 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:20 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 06/26] dma-buf: use new iterator in dma_resv_test_signaled
Date:   Fri, 17 Sep 2021 14:34:53 +0200
Message-Id: <20210917123513.1106-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 56 ++++++--------------------------------
 1 file changed, 9 insertions(+), 47 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index c7db553ab115..d8f428ddaedd 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -593,22 +593,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
 
-static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
-{
-	struct dma_fence *fence, *lfence = passed_fence;
-	int ret = 1;
-
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &lfence->flags)) {
-		fence = dma_fence_get_rcu(lfence);
-		if (!fence)
-			return -1;
-
-		ret = !!dma_fence_is_signaled(fence);
-		dma_fence_put(fence);
-	}
-	return ret;
-}
-
 /**
  * dma_resv_test_signaled - Test if a reservation object's fences have been
  * signaled.
@@ -625,43 +609,21 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	unsigned int seq;
-	int ret;
 
 	rcu_read_lock();
-retry:
-	ret = true;
-	seq = read_seqcount_begin(&obj->seq);
-
-	if (test_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-		unsigned int i, shared_count;
-
-		shared_count = fobj ? fobj->shared_count : 0;
-		for (i = 0; i < shared_count; ++i) {
-			fence = rcu_dereference(fobj->shared[i]);
-			ret = dma_resv_test_signaled_single(fence);
-			if (ret < 0)
-				goto retry;
-			else if (!ret)
-				break;
+	dma_resv_iter_begin(&cursor, obj, test_all);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (!dma_fence_is_signaled(fence)) {
+			dma_resv_iter_end(&cursor);
+			rcu_read_unlock();
+			return false;
 		}
 	}
-
-	fence = dma_resv_excl_fence(obj);
-	if (ret && fence) {
-		ret = dma_resv_test_signaled_single(fence);
-		if (ret < 0)
-			goto retry;
-
-	}
-
-	if (read_seqcount_retry(&obj->seq, seq))
-		goto retry;
-
+	dma_resv_iter_end(&cursor);
 	rcu_read_unlock();
-	return ret;
+	return true;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
-- 
2.25.1

