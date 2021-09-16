Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFEA40D8A6
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238112AbhIPLcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238044AbhIPLcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:12 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6425C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:51 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 70so1630526wme.5
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SmEE9pL8NZn6FzdcJqJ3nDbf8dXgLtIIV4G2gTnqXrs=;
        b=ndnioQiTNb95g0bmf0LnVfe7cvd/GKqG8htbq8FD19RSEoG6dUcQOczYq5L4Gi6AO2
         7rybT1CGnM9GKJu8Xov1kyXcQMc1Mdcc+V77WIWf4nr852Fp+cEvvr42SwQNoEmWKxQK
         fAsP9f9/KuUCPkwRzlW+8FZmo6U6BuBTF/twNGUYb4sI9CGAPu8tqFd0ciziB0CP2j+Y
         d1EOsAlJ+G0us743yW2IE/t3PwLLM/WBF7WUa2R4nHR10Cj9BRgI53GAhoSRXlrsyFgw
         l+RbLuo3bRM0rsWzcLyIJ7t9zQC7NdQ3xOjZKsUizOeCVd+8QtwWNKnpmpA8U6gIsCW3
         GNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SmEE9pL8NZn6FzdcJqJ3nDbf8dXgLtIIV4G2gTnqXrs=;
        b=UNvryTvEmYKM60YYDyC4ATxA0fc10yBTpHhDmdm3Bpe7v2O3v47XaeBnT/lZsmlL+U
         oCKtvG7M8ySEOV/HR/vJY++KJv17svSGuDoz18eHWX0vlwmMINcoTzmv1nWf9rQ9n6cA
         2Jx1VK0aoqFB3hkgPx3C9Twek76YDh5shDGmC4uZKr5lldZW0v8gZRRxc0X7WN83Uq60
         3F9smUmJNDgxL5KbZPX8v2DuHt9C57qtmOhrfjCZ9I3qXMqRcqCrypVVghrHiMn79ODh
         fwgFWr/cUbKjSXvDSxr+1f0KA5NZ2zOjTK/ukYhKjI+LqX9OQx/soFPIBLzg4oLY4VFd
         uL1g==
X-Gm-Message-State: AOAM533vlAxk5BuFKXdXYI7MfAwR+wrCJOKvOYUVL+B9agPFigak1qym
        7V61Xy/7vDl5XqVEgstv1Wo=
X-Google-Smtp-Source: ABdhPJyBB6aVm1n24PyHbnPPn7Zag9iCtAur84htqEF2IEp5JGTLISYfSiG6K85sGdDj8c9eN4XNxQ==
X-Received: by 2002:a1c:8096:: with SMTP id b144mr4491668wmd.189.1631791850422;
        Thu, 16 Sep 2021 04:30:50 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:50 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 05/26] dma-buf: use new iterator in dma_resv_wait_timeout
Date:   Thu, 16 Sep 2021 13:30:21 +0200
Message-Id: <20210916113042.3631-6-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 64 +++++---------------------------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index bba328475304..764a71ec2347 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -569,74 +569,24 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_iter cursor;
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

