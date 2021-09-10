Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3EA6406854
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbhIJI2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhIJI2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:12 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9D3C061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:01 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id u16so1449521wrn.5
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nRgKzPY716uBcqzlD486ZNP7MTz75iQyYL0S/ztJuik=;
        b=FS4E88FNOuhDufIsC6QEy21VBZNvlW9xy/w3nbJHqGYzUPLTeReXi5mBTchosSHG5f
         ZWwidH0HyDKLtyouZqwPcSvZ53D7SkOhh0wpZHDDaoy7HASls0oUCmGSq8Ms4Ohx0HqP
         1+3fBCQbYzUs+lj5oV2NC1uf6QuIRBSLRB4tcFrkAZnLVhdvAOH/qT7q4cKHjh6HAEZO
         ywS+PgEMK9uSdXh7JLSkJk8dZWqGgs5sPvbVFhfBRwj825HG0B4f3Z9JGaucv5OcXKzB
         ZNlKRjf5HkTn5jKothqucLGgwIuIjIUbpNmd7YLhr0CZcPuEL4L9NEQVU7Dk2BBSdJUO
         h58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nRgKzPY716uBcqzlD486ZNP7MTz75iQyYL0S/ztJuik=;
        b=lDRcYWNFpvPa+u4acMJmigvDNjZs7iu8TDTM734u6gKckP+Xrc0Y47JmX7FSH8Lc5t
         vUCeJC/5Onq6+hZdEQk6owdHBHZRzDwsPFegVIf5+Y+18SFMSJruxwoodafr8ZxKsWj2
         EVJuu+/Wt+sHkPEoJtO5IaCq9Iq7EOgiQdF6c98Hx/gIuR68hkLLWdN7Q0rLu5yjozGO
         pWqFluf/hPJHV6CrcxefQqYDHe+t0Pu8/0SQOsRq83cUEy5Mh2dNEVAr0cIFEQooE1j5
         Ay2rRmwUuq3Df8RpIHzzuM/t69ZdshVi+LtDx8zsNzne3GJFpzVeuY4dOhFgEaLbZnAZ
         ZFyA==
X-Gm-Message-State: AOAM531SbqDOVVyU5vLsJ0/0vCcRI5LfsTKXPg25wTWX+Yvfl31OA6sm
        BUVUzPoda/gUrigaeOA6zB4=
X-Google-Smtp-Source: ABdhPJz61M3U+vGt3QVPLv7BGmosqiUuJUUtGZ7ovO7uFD3uT3WFpi4JJCO2cPrmuymJNsMmoSamPg==
X-Received: by 2002:adf:d185:: with SMTP id v5mr8294151wrc.378.1631262420440;
        Fri, 10 Sep 2021 01:27:00 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:26:59 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 04/14] dma-buf: use new iterator in dma_resv_get_fences
Date:   Fri, 10 Sep 2021 10:26:45 +0200
Message-Id: <20210910082655.82168-4-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 110 +++++++++++++------------------------
 1 file changed, 37 insertions(+), 73 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 9a9c0bba772b..2dfb04e6a62f 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -493,99 +493,63 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
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
+	struct dma_resv_cursor cursor;
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
+						 sizeof(*shared),
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
+		if (cursor.is_exclusive && fence_excl)
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

