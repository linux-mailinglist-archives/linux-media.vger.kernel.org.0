Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB8D413876
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbhIURim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbhIURig (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:36 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A1EC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:07 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id w29so41596625wra.8
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SwDNgKjUSiYIEL26gGmtpWr9N6eJiYIUhyirBhMCihg=;
        b=JEwHcAATh1ZpVoSYXKBWXuAXv1bDr2J7b1IMtXHoKp7ruPrV27iGamsLCvXNTFzUph
         Ax+xnc41BDjb7Wxh7GLs+N2cLpi/bwC5HRrK8ZAxLL14aBe+do6D4SaahPyqLWVpI2n4
         PS+kbBoK9o1+h7GSltEEY+XOWEmLvqZulKRSyWH59COMP8ipIE5UebYjTOs/1uvXC0tx
         K74qTo+G8Siq0Y/Q2CBa49Kt7VgUCiJ7BmnCWyIhevGvNeah8viF6gaXjiJXxLLRbPQ8
         5geDWgaBA1ccACP4EBanSi9kms7y5yHqIg15A4kfuV03bmnXfYh1gXU2ydlVWJ/RavYR
         h8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SwDNgKjUSiYIEL26gGmtpWr9N6eJiYIUhyirBhMCihg=;
        b=kMcz6UpxhKQMdorAE3Wel8CUK6pgO+B98hv7dGBBuKk77SmUYfolixkd0bL7Hftf9p
         YBrb5ZrKwF/fW8OcSpJBsZPbx9EYfg9R+ACUOlyfmiiqjCtUKmjLvw0FQok5kK6S0NPD
         65+eiZUvczmjt0cydaqvGsWMV3Wpp3wDNxNEQLFo6b1+tdqPPuXkkOFWOC0GI+XJbo6a
         h85lSGDjS3tcN+QFoP0eSNpyYnnziGVLrnNh1sASTMm5hjVakw2XQ2/RKjYUA8SnOQWO
         84PEgJaJu/QykDHhGj/FtxAKYnqSgLuUad59ksImpcagTm8oWYBder+470XdK9QekPMz
         nijQ==
X-Gm-Message-State: AOAM533Et277Gmt6SDu5m0Sr2KilbO5wLqbPmA6xcL9KmlnUqK2yIbaS
        fewYkGyzF4tPkaR1fS6fl2s=
X-Google-Smtp-Source: ABdhPJyyOj/FTXHy67QtzwEuti9n5GDcIx4xSLf3NFAF5Pl2imrTWFT1+eKloNSlxJUiqK4LP4YdTA==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr36619835wrw.186.1632245826275;
        Tue, 21 Sep 2021 10:37:06 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:05 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 05/26] dma-buf: use new iterator in dma_resv_wait_timeout
Date:   Tue, 21 Sep 2021 19:36:38 +0200
Message-Id: <20210921173659.246165-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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
index 2b749cdcba02..8331e6e4f9fb 100644
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

