Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E023AB229
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbhFQLSO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhFQLSN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:13 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B185C061760
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:06 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z12so3500997edc.1
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=f39rGZT5veqFjxPrNuWB2TiXiQPmiaT54Z6hZqWOR7o=;
        b=RNe0rSmGaU+5s+VrIHUQqg4naOJSdYobgxmh7WvqRqImdOpANraMgE5pu/oy4P8pYT
         M9zK4r41DUTtvR0QXRj0RanQYmkhu22PvsweGK4dPehIuBZ3ns+fzANw46807M+d7SpY
         GTtclYSaKX1Sp7dcLITRI2MvZVdQ2/cOo1M32uYF13zwvEv9XBjPycR0nUIzvE+wRMo+
         IishIVHeVMElBcs3PrPppAxpaoClrphTrgInFhNwL+cFAdOce3ddFuE/ROgqzY+dT2W9
         JWDY6fvVKR/JgWStdtSQrdYXTw4doKPqXEOrGzZ/SwYCNReYAEFlhTg+8GuEZcWF9UOo
         dXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f39rGZT5veqFjxPrNuWB2TiXiQPmiaT54Z6hZqWOR7o=;
        b=RPM34uKI3xa70aLKkWdYf035BB2OUZvRf7F5iqO0WxOBEdBXsa1N4+r2kQSImJTpEb
         iixfB+1Ju8a8/e2g6NBu+cYlFPyVVWKnF90RslH5YxTeAZhhRdDxvS61m4ObdZDZL14O
         CCPOou1P8E3Xdjqu7cCrFPfpbpyxOtmLrwOZtDNbEe5Qw7SnBgaZ8aP9kF7F/Q2HfbL2
         x44yboBfVRFyvp8l5+yQhHOEnT2ZWt+xvB3ssgCtUnLM1siOI0kjJBan+sogmZ4bQfLn
         9KBCTd2ZxxBPHbGBPSgu1YU7yDarWzPLWfjZpQFWILhSAkW7oyLQWq3LzlkW/Pe9cAGr
         PjJw==
X-Gm-Message-State: AOAM532bpWDGOKpUVjUT8txmLZr7YvxYjAGEQLMSnDhP3t3TProMIZny
        M/hMWamHUAHWgqlzdZBGxek=
X-Google-Smtp-Source: ABdhPJzAxNQq7o0c8Az9z4kWtTT6sk40psjeZ0p7jq+xVfK4Wgh4poK36RFnx2T6ZmZk0Jy7KIbgzw==
X-Received: by 2002:a05:6402:190a:: with SMTP id e10mr5759983edz.160.1623928564796;
        Thu, 17 Jun 2021 04:16:04 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:04 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 05/16] dma-buf: use new iterator in dma_resv_wait_timeout
Date:   Thu, 17 Jun 2021 13:15:47 +0200
Message-Id: <20210617111558.28486-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 64 +++++---------------------------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index b77bf46c0f48..5192cf4271ac 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -564,74 +564,24 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	int i;
 
-retry:
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
 	rcu_read_lock();
-	i = -1;
-
-	fence = dma_resv_excl_fence(obj);
-	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		if (!dma_fence_get_rcu(fence))
-			goto unlock_retry;
+	dma_resv_for_each_fence_unlocked(obj, &cursor, wait_all, fence) {
+		rcu_read_unlock();
 
-		if (dma_fence_is_signaled(fence)) {
+		ret = dma_fence_wait_timeout(fence, intr, ret);
+		if (ret <= 0) {
 			dma_fence_put(fence);
-			fence = NULL;
+			return ret;
 		}
 
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
-
-			if (!dma_fence_get_rcu(lfence))
-				goto unlock_retry;
-
-			if (dma_fence_is_signaled(lfence)) {
-				dma_fence_put(lfence);
-				continue;
-			}
-
-			fence = lfence;
-			break;
-		}
+		rcu_read_lock();
 	}
-
 	rcu_read_unlock();
-	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
 
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

