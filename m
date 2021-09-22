Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403564144A1
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234265AbhIVJMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234256AbhIVJMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:22 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53EFC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:52 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t8so4780127wri.1
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nO/bLBLjrktM/NZVu33qHZQ0BS1aAWyaIwRmpqxTaNI=;
        b=k9E3WRQYA35tAgZUwEWvswKhhFbqftPIbtY+l3JqtbySP1GbiL2j19/lfYxLTI522g
         bnfoWCm2s+zcUhfNOtrnJoh2xarwp0MLicFh+D+XlmXiU3SIRWWYSp4zGnz64Sadc5cX
         Eq8BGB5cZvU6fG3QJUg8vtk8acscg9ErTGHRXsjodJ5y7HpV0pVhIbUXWDfqy8CsbPdr
         m1LbCxJMpQa5ZD/cGyuuw+2tp16qRgTs/m4pV+PdChzUZQRUGFvJOmKLKyZaWP1dxx9S
         asf7MPUXeMzRyYL4a1X+8EFouR1/+ewspwI65LEeSKBQP1lbQ7atr7g7ZLiWFBqhkOjC
         pY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nO/bLBLjrktM/NZVu33qHZQ0BS1aAWyaIwRmpqxTaNI=;
        b=6MR0AV7fP/2LFE3zn1CbEJUvpmY7hgBTC4MWBo9FT4nr62ogsj0CJwpMcnCvVtZYRv
         zOLN/B2jwqcB49sZx5IsE+e1Tb6Rj4BE/Vd8zqCKHQFS/i6wkryfkaZAnvdWQREPKDhD
         ZTMbKPcAswSteYSSSob4uYjrTwMdrlbVU7no55FL6hJj/LrLtgqI2LSQGxJojg99x56B
         KxY7J/H73pztxPElvUgDeGCa8J36wT34uFLm1Qvdb6ptEPiXoX73GkyTDUuH/tJQ0oie
         9IVmQP7VPIJ0VzZvZUPvyfyXgJf9c7ivSDj1aFGGwRKvaVcjQOoDwZSju6f5v/PIwt5c
         NkrQ==
X-Gm-Message-State: AOAM532I6N3ATOR7eqRg6pag1CZb0G+d09KAU472ncJ0sfG22obwgLM8
        Rh7mX0rzmpdTW6Iz4UBGG6E=
X-Google-Smtp-Source: ABdhPJx8GPnPIEzmIo9ZINoy4ih4ncReRvH/RsgvmHgcZmtH9PeFnU63kn5toKEZqc+Jz/B9lXxMFQ==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr40571586wro.418.1632301851597;
        Wed, 22 Sep 2021 02:10:51 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:10:51 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 05/26] dma-buf: use new iterator in dma_resv_wait_timeout
Date:   Wed, 22 Sep 2021 11:10:23 +0200
Message-Id: <20210922091044.2612-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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
index cde97e4e547f..d0e26cd13ecd 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -608,74 +608,21 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
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
 
-			lfence = rcu_dereference(fobj->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &lfence->flags))
-				continue;
-
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

