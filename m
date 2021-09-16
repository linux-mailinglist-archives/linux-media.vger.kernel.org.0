Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68AA40D8AA
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238160AbhIPLcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238105AbhIPLcN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:13 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92097C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:52 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id b21-20020a1c8015000000b003049690d882so7100603wmd.5
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ebd8laWfrRXRVYC2x90kb6hWWHZBsznwPVLfAGFP3Cg=;
        b=eXHYHYmPtSpM3wfumd8tg58thGlqQfZQDAWbOQcyO100fMpp4sjMK0RlXDf27FzX6f
         nqUUUvuNNY9yo9zLzJeEAUQNjH0fo0SBqMizA4YawN+O46psezyRLQGtnQRil339mWEZ
         XwAdv1jaK39fOgrM4bFU6i5NVPK8IthQ93tkVuWZ1MH5kTvEHPaWRCKWcwwBmNoaAcxm
         brlpqWTfTOaU0cZCzS0M6GAexCyjMwtZuM8TdX1Zp59LyUNuckw0YSLTfQ1llw3MHVbS
         Lwj1S6a383VxqvlkAewie08hSWZVRYHpXORWI828smxzrnxpbcWLglxoqpuSKjbtUzbD
         +hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ebd8laWfrRXRVYC2x90kb6hWWHZBsznwPVLfAGFP3Cg=;
        b=bq/kY9DLUpjIgallJqegGbyPYRoqz2a9zBavTQGfkswAXCQwomdPrUfL3ksvnNq/ds
         xMnLNK890WuLpMWnLztkZHXDkgJDzxcRyEeP0/Fb38B+xRzmT5NqYE4zHx1argqdkBdO
         EUKnfLgZcSNS2XYvU048KkCPEWNcsfKdx4WqtNAwKrG3u8wWnaqKD17ZyyVyFizmVclK
         CLgDA4ycWY97LzRlZG6me8I735W0zj/EZh2NmAKXokieeOhqUssMAXdklu3533byjY6U
         AmWPylmycwD3yVACQth1QCKE+RBRsLczCi/6z4hm45a/oqbDQLxEVpwmFtsR7m/2qDNd
         EmPg==
X-Gm-Message-State: AOAM530J06tPhrNvC3XPx30/8+ebK28slqy2kHHqIyWYXQQUfzkD0qpA
        6Y0rjejc5qNRdGe4IUliH9DIG0b7j8Y/Kvbv
X-Google-Smtp-Source: ABdhPJyorbxNxa60K9WQkm/2GEcheiaw3NO/7p7meOad00zcBgn/nggLJXXlWan4M4ZyizaIe9t0Ig==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr9621602wmd.55.1631791851256;
        Thu, 16 Sep 2021 04:30:51 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:50 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 06/26] dma-buf: use new iterator in dma_resv_test_signaled
Date:   Thu, 16 Sep 2021 13:30:22 +0200
Message-Id: <20210916113042.3631-7-christian.koenig@amd.com>
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
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 54 +++++---------------------------------
 1 file changed, 7 insertions(+), 47 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 764a71ec2347..fae881a5d336 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -591,22 +591,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
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
@@ -623,43 +607,19 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
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
+	dma_resv_for_each_fence_unlocked(obj, &cursor, test_all, fence) {
+		if (!dma_fence_is_signaled(fence)) {
+			rcu_read_unlock();
+			dma_fence_put(fence);
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
 	rcu_read_unlock();
-	return ret;
+	return true;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
-- 
2.25.1

