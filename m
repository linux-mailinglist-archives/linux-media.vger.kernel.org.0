Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1B7406857
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhIJI2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhIJI2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:14 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51C4C061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:03 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id q26so1446896wrc.7
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qW+9yeXWdgQdV+++wShEfX/2r8PdvtzgR8RKF6D1Slo=;
        b=VzzUsjk0AEIRSeBRpV5cyDCOrSGL9w5QUkSlFheWQB/c9xHxQsZAqclnL/JGB+y3f3
         zNlWhIVVhqLTN9AavwmJJX6ADnNHQSgb7fRU7qce20FAYUwXFWg0UAU9jTWQY+Cl4CYO
         2YLJ1N16KKzW9x3EX/jZdoz7MuR6qttw2RAIuhNpqu6AbZYJUxJaE95SsgrG33RETAGY
         50fLxqhx462/l/nQ1eTKo9DdOkrYojZQ6Omp67DNoMlrD5WYtdLwypEiewKYWCoHRkp9
         BL5mr0+r4s1KMlm9PN5WAeBPWk8+Pg4lURDG/3QSNbTXDmHeiqct6Y5bU4BGVhYEQCNF
         XOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qW+9yeXWdgQdV+++wShEfX/2r8PdvtzgR8RKF6D1Slo=;
        b=J/DfRm6UPX1gqavEjTjru7joql8CwIC29M+41lZP4tFVs0Sm5rDCUFwb5xfthOkrm6
         LtzIkbHLlCNTFdni5R/mEY8H2wO8sCYrr+OY0ncOA7Msw5cH9POlA+GP2qO53g6v15ay
         GqgjQrac/TfQ6jKrDdCO4wy5PfWt+fQMycSUIsysPomH0fgOYmT32ZN0xI2Dq0olrgPB
         9bk0Zg++LmUXsO1dv5U6k3hYrf6zVBCZCyS4cz6oRJ8h2B5Y/YVgqkVMBpvfTC/fLrOh
         WlExllBrx/6w3liBQcV/uzx7cRFtjBzwjsz+mx/ZSP9Kp9nSNLQ0KBrNLghD/kylzzfT
         6SuA==
X-Gm-Message-State: AOAM531UePBNJ5K+qiDXnWr6JAXUx0YgQ7xQUv+dhjCFgGMz6iEjlOc8
        z4gFKws8pul9GfeV0FodFC8=
X-Google-Smtp-Source: ABdhPJzEW++4UtO+2/WEXjNR4ZrvyQisPxmWGmjCsRmLMya0Yo65UWWhGodkfXL8zjWWriaK+QFhFw==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr8111801wrr.93.1631262422437;
        Fri, 10 Sep 2021 01:27:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:27:02 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 06/14] dma-buf: use new iterator in dma_resv_test_signaled
Date:   Fri, 10 Sep 2021 10:26:47 +0200
Message-Id: <20210910082655.82168-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
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
index 645cf52a6a6c..cde5d448d029 100644
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
@@ -625,43 +609,19 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
+	struct dma_resv_cursor cursor;
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

