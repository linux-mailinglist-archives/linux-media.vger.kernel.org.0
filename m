Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0054F40D8A8
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237989AbhIPLcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238088AbhIPLcL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:11 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6BF7C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:50 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id q26so8904910wrc.7
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qtmlO413yj3/X7KD0lHveLpvVJwGO76Kiide216asC4=;
        b=pBH9OW9RXHjAXv6756IYEn28oYG9StlbNwM4l8uaixqrDE8n2tTBfuMXTw6P0KZMvQ
         eOw0F4dUF2zZAKmn2aYLLH0CYMxzQGYed2pTA0kMkeo3FM8beKwukv7TjLbet9J1CdAw
         2HXke1Wx2fJmsv+fDics2PRLJogFhjzLbLzuO6LZttwFmb8zrti5Tl2Oeul/5RpeLksM
         FwEaLm3vxzHtSP/SFp0q6Xz3cNhcpfcr8psgkCvp4bgQSYE2yiQ+2lKyzwjjKr4hGHMT
         dRFbHMhvoLgBzVi581snZwmQyp2uKIZZhOK3uLqPqNTI/uw0G19L/C2+fWFYTPAI/V3Y
         ofCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qtmlO413yj3/X7KD0lHveLpvVJwGO76Kiide216asC4=;
        b=ChW1b8pI+oYr1Nb+4QYpNwY43puRnVRwZ2wWOmE2YoEdKBpjcpDupVoYi7P9BqS3rv
         jM3sgewwrG6f/+maJToouITw14UIoRrDG2qVmzrYFGRpw3xpRI9k0mqCi/DVTfnnpoS9
         TmoURuGab+CJMmRJ7t3htWcNCye/9mvhL3gVlMmL9a3Vye0geTUbV/aoBUKk1JT8GGFe
         YLuf5Rbkn20EUp3xesTRwuf5WzoPNA6WxcU4HxSDnog6JNAIJb8sBF3LGJODLLmfGnPX
         JXexx3sqGg3sj7Pel+g3SZau9vrpcARFu7LFJPPLxUE8ZzTivWzsG+TD1pVvpvxK6/sl
         0gaw==
X-Gm-Message-State: AOAM531rtkU+aikM4K2j8RnOUldJp1zPhDC4Ekrm2jt06DGh44gy2a1y
        PdDR2qYkweouNlM4+IhgcD4=
X-Google-Smtp-Source: ABdhPJwU8W3gDpAkB3c368BsKqC/kHLjObVUyyjtU7xQoZmk2Om8w1eCgx0uwrMipzh+WwdrHD/ESg==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr5581411wrm.430.1631791849534;
        Thu, 16 Sep 2021 04:30:49 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:49 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 04/26] dma-buf: use new iterator in dma_resv_get_fences v2
Date:   Thu, 16 Sep 2021 13:30:20 +0200
Message-Id: <20210916113042.3631-5-christian.koenig@amd.com>
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

v2: use sizeof(void*) instead

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 110 +++++++++++++------------------------
 1 file changed, 37 insertions(+), 73 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 91c040cb7d63..bba328475304 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -491,99 +491,63 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
  * dma_resv_get_fences - Get an object's shared and exclusive
  * fences without update side lock held
  * @obj: the reservation object
- * @pfence_excl: the returned exclusive fence (or NULL)
- * @pshared_count: the number of shared fences returned
- * @pshared: the array of shared fence ptrs returned (array is krealloc'd to
+ * @fence_excl: the returned exclusive fence (or NULL)
+ * @shared_count: the number of shared fences returned
+ * @shared: the array of shared fence ptrs returned (array is krealloc'd to
  * the required size, and must be freed by caller)
  *
  * Retrieve all fences from the reservation object. If the pointer for the
  * exclusive fence is not specified the fence is put into the array of the
  * shared fences as well. Returns either zero or -ENOMEM.
  */
-int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
-			unsigned int *pshared_count,
-			struct dma_fence ***pshared)
+int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **fence_excl,
+			unsigned int *shared_count, struct dma_fence ***shared)
 {
-	struct dma_fence **shared = NULL;
-	struct dma_fence *fence_excl;
-	unsigned int shared_count;
-	int ret = 1;
-
-	do {
-		struct dma_resv_list *fobj;
-		unsigned int i, seq;
-		size_t sz = 0;
-
-		shared_count = i = 0;
-
-		rcu_read_lock();
-		seq = read_seqcount_begin(&obj->seq);
-
-		fence_excl = dma_resv_excl_fence(obj);
-		if (fence_excl && !dma_fence_get_rcu(fence_excl))
-			goto unlock;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
-		fobj = dma_resv_shared_list(obj);
-		if (fobj)
-			sz += sizeof(*shared) * fobj->shared_max;
+	*shared_count = 0;
+	*shared = NULL;
 
-		if (!pfence_excl && fence_excl)
-			sz += sizeof(*shared);
+	if (fence_excl)
+		*fence_excl = NULL;
 
-		if (sz) {
-			struct dma_fence **nshared;
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(obj, &cursor, true, fence) {
 
-			nshared = krealloc(shared, sz,
-					   GFP_NOWAIT | __GFP_NOWARN);
-			if (!nshared) {
-				rcu_read_unlock();
+		if (cursor.is_first) {
+			unsigned int count;
 
-				dma_fence_put(fence_excl);
-				fence_excl = NULL;
+			while (*shared_count)
+				dma_fence_put((*shared)[--(*shared_count)]);
 
-				nshared = krealloc(shared, sz, GFP_KERNEL);
-				if (nshared) {
-					shared = nshared;
-					continue;
-				}
+			if (fence_excl)
+				dma_fence_put(*fence_excl);
 
-				ret = -ENOMEM;
-				break;
-			}
-			shared = nshared;
-			shared_count = fobj ? fobj->shared_count : 0;
-			for (i = 0; i < shared_count; ++i) {
-				shared[i] = rcu_dereference(fobj->shared[i]);
-				if (!dma_fence_get_rcu(shared[i]))
-					break;
-			}
-		}
+			count = cursor.fences ? cursor.fences->shared_count : 0;
+			count += fence_excl ? 0 : 1;
+			rcu_read_unlock();
 
-		if (i != shared_count || read_seqcount_retry(&obj->seq, seq)) {
-			while (i--)
-				dma_fence_put(shared[i]);
-			dma_fence_put(fence_excl);
-			goto unlock;
+			/* Eventually re-allocate the array */
+			*shared = krealloc_array(*shared, count,
+						 sizeof(void *),
+						 GFP_KERNEL);
+			if (count && !*shared)
+				return -ENOMEM;
+			rcu_read_lock();
 		}
 
-		ret = 0;
-unlock:
-		rcu_read_unlock();
-	} while (ret);
-
-	if (pfence_excl)
-		*pfence_excl = fence_excl;
-	else if (fence_excl)
-		shared[shared_count++] = fence_excl;
+		if (dma_resv_iter_is_exclusive(&cursor) && fence_excl)
+			*fence_excl = fence;
+		else
+			(*shared)[(*shared_count)++] = fence;
 
-	if (!shared_count) {
-		kfree(shared);
-		shared = NULL;
+		/* Don't drop the reference */
+		fence = NULL;
 	}
+	rcu_read_unlock();
 
-	*pshared_count = shared_count;
-	*pshared = shared;
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 
-- 
2.25.1

