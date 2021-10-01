Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE7541EA5B
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353396AbhJAKIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353386AbhJAKIE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:04 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92540C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:20 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id w29so14617303wra.8
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DLn0ZmdbAH2RzPW/tcdHG/ty+pcMQGDFLOQ2PJC46s4=;
        b=NnfkMsQhVQWp+VnHgA4QOViEoonm7dolqt+Q+FjQOGMRuaaz0cXgLDrRVRcRedMDup
         kRDPMlSFOdbZU7jwq0tjQhlPU3duqxg99UpWsUBnodzqWKWWpetIeH1ePZuGy+RHfHAG
         LQQ6i5PFFXlGnyVOVZx6CTAYV7LG16mvi7qbOB7gXt0gEblm226RcpYZ0wWFVuYMHRFU
         sMMCMdTEbZcdKZw0YI5mogh8BsIB9V6opYA9yM0XSz9JzYor0/Lud/GTsePfepSguJZu
         xxRNdcNKJ5DSg56p7fqG9tUs9oc0OvYzCyL4lmPTrCjyIGlwCJMn+MtrnUzlMaFCobb8
         YU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DLn0ZmdbAH2RzPW/tcdHG/ty+pcMQGDFLOQ2PJC46s4=;
        b=VzTE6vQwhAVK9nvCN6eEcUW66+z+w0dHlqszWnl3fV830bgjv9KHwlDxtoH1Cq1agH
         RjN3Q5duM27+wNtx77+BUXGFtIKgJ00vqWYf45cRx7V4jM/57OIkw/mw8TNOOR3hlgY4
         R9O+KrV8Av2WGJnmA2qNFeM6fCatVXydLqC5L2vwriV+Jjhlpqjuoc8TQVUxhJhDaCGc
         g1BzK0dCvyI8png/qStZd9eWR+04laD8zWVFtvU7TsCUEr1/0CK3+20vF1RJOsDvl3Iv
         CF6Ajfg89BNKR8/VIq12zKDhZIjGjLaHAZ1jmyT1QRD97uMG5Bd8iQZ3k5dTE+olOvtR
         0yoQ==
X-Gm-Message-State: AOAM533iG0q+xH49bV95fXYGhouzbZvqCmCoA+XLmzd4Z+bLOKnQIzi1
        IVx273dFNHLNvxHKRQtj2EiYPHuTPeI=
X-Google-Smtp-Source: ABdhPJz/aW5sUJgBDhsPc6PbxZWz95pBOKKVeJgdt0cjwyv9AG40FNPNmoDglQ/xHFW1pSioYbjPQg==
X-Received: by 2002:adf:a2c8:: with SMTP id t8mr8546800wra.215.1633082778942;
        Fri, 01 Oct 2021 03:06:18 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:18 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 06/28] dma-buf: use new iterator in dma_resv_wait_timeout
Date:   Fri,  1 Oct 2021 12:05:48 +0200
Message-Id: <20211001100610.2899-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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
index 9b494828e7ca..510e15f805bb 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -611,74 +611,21 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
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

