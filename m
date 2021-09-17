Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB1C40F7A7
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244190AbhIQMgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244178AbhIQMgm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:42 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB05C061766
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:20 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id w17so6770956wrv.10
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ipbb4pGWM/3XFhYqg0eQ7bjJFj3sOFyI7ZKdJRE6D0M=;
        b=mAa7/f9+tf2+hjbJCj8af3ffhew+9MkGBVjBYwijaUa2GndzOvfjywhRYuyHrgzEjh
         xtSBzSuvfsqpSQLs0bsZM8EdRSUWIRHyvPFPxN7aLX/LZQRTaHFK0Ew65YKvcdg70ZOV
         3fJiCCn6yUSLU7Tb/hsIfz9QRduJOhVYYuLE6xr5frmSIiC6o4mTkEyHIJDMjWTn0iM9
         jO4PhJsSje9OO+piF5aFjCSD0spX1xS48Fou+M/B7Qq97HbgkT9g2ZykhXqvJJcFamhL
         5goZox9ThDmWU4vzCiPi0JuhhvNh/NxH7mVzZdXmlCAV6zmcKl9kENOOQrowKq8iouU3
         L1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ipbb4pGWM/3XFhYqg0eQ7bjJFj3sOFyI7ZKdJRE6D0M=;
        b=gd2AQ0jZeqO5yZckcktttyUUyaAbQ1s7DnhTVdh6F/a69y/rE04C3LVcvK5ANPFdL5
         249xv3wsjnRpG1THM9IXgjA/bGYEHzje6deOtR4quy6h1S9PPdnbWPFPqXSiuha1bAOV
         TRrwr14vFrZr/s6FlknkPKBTSDFmw/VcwAK8ogEsfb6Kkq7ARoc65oaU1pusL+9JK+pP
         PRcE5V/BncxSrbx9hRrH2gsxpEsZ3W3h2Y52XkVUogtx5wEwBt9x6QjFb/EJmtV6xvIc
         Vt7dkivIapun2OMKmEK4svUEEDuSGGuTvw0zHz8CklRStDFyFux/JhBDAkfEuKTKPahP
         95Tw==
X-Gm-Message-State: AOAM532mUahhtqyjKVT9HtWy1teY/Cc7dx1Jstk3r0Lkvhs51iFwWx3o
        LoSnUF1jHuNX8gOe8x1DK1rDDZeTPUc=
X-Google-Smtp-Source: ABdhPJwTOXrXCvAxWacGW1AiWElE/T+9t49LBa469jBNob+iaJiqRYFm2UdS0ez+WxQeY7AjNFFc7w==
X-Received: by 2002:adf:f904:: with SMTP id b4mr11824300wrr.403.1631882118730;
        Fri, 17 Sep 2021 05:35:18 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:18 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 03/26] dma-buf: use new iterator in dma_resv_copy_fences
Date:   Fri, 17 Sep 2021 14:34:50 +0200
Message-Id: <20210917123513.1106-4-christian.koenig@amd.com>
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
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 86 ++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 51 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index a3c79a99fb44..406150dea5e4 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -426,74 +426,58 @@ EXPORT_SYMBOL_GPL(dma_resv_iter_walk);
  */
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
-	struct dma_resv_list *src_list, *dst_list;
-	struct dma_fence *old, *new;
-	unsigned int i;
+	struct dma_resv_iter cursor;
+	struct dma_resv_list *list;
+	struct dma_fence *f, *excl;
 
 	dma_resv_assert_held(dst);
 
-	rcu_read_lock();
-	src_list = dma_resv_shared_list(src);
-
-retry:
-	if (src_list) {
-		unsigned int shared_count = src_list->shared_count;
-
-		rcu_read_unlock();
+	list = NULL;
+	excl = NULL;
 
-		dst_list = dma_resv_list_alloc(shared_count);
-		if (!dst_list)
-			return -ENOMEM;
+	rcu_read_lock();
+	dma_resv_iter_begin(&cursor, src, true);
+	dma_resv_for_each_fence_unlocked(&cursor, f) {
 
-		rcu_read_lock();
-		src_list = dma_resv_shared_list(src);
-		if (!src_list || src_list->shared_count > shared_count) {
-			kfree(dst_list);
-			goto retry;
-		}
+		if (cursor.is_first) {
+			dma_resv_list_free(list);
+			dma_fence_put(excl);
 
-		dst_list->shared_count = 0;
-		for (i = 0; i < src_list->shared_count; ++i) {
-			struct dma_fence __rcu **dst;
-			struct dma_fence *fence;
+			if (cursor.fences) {
+				unsigned int cnt = cursor.fences->shared_count;
 
-			fence = rcu_dereference(src_list->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &fence->flags))
-				continue;
+				rcu_read_unlock();
+				list = dma_resv_list_alloc(cnt);
+				if (!list) {
+					dma_resv_iter_end(&cursor);
+					return -ENOMEM;
+				}
 
-			if (!dma_fence_get_rcu(fence)) {
-				dma_resv_list_free(dst_list);
-				src_list = dma_resv_shared_list(src);
-				goto retry;
-			}
+				list->shared_count = 0;
+				rcu_read_lock();
 
-			if (dma_fence_is_signaled(fence)) {
-				dma_fence_put(fence);
-				continue;
+			} else {
+				list = NULL;
 			}
-
-			dst = &dst_list->shared[dst_list->shared_count++];
-			rcu_assign_pointer(*dst, fence);
+			excl = NULL;
 		}
-	} else {
-		dst_list = NULL;
-	}
 
-	new = dma_fence_get_rcu_safe(&src->fence_excl);
+		dma_fence_get(f);
+		if (dma_resv_iter_is_exclusive(&cursor))
+			excl = f;
+		else
+			RCU_INIT_POINTER(list->shared[list->shared_count++], f);
+	}
+	dma_resv_iter_end(&cursor);
 	rcu_read_unlock();
 
-	src_list = dma_resv_shared_list(dst);
-	old = dma_resv_excl_fence(dst);
-
 	write_seqcount_begin(&dst->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(dst->fence_excl, new);
-	RCU_INIT_POINTER(dst->fence, dst_list);
+	excl = rcu_replace_pointer(dst->fence_excl, excl, dma_resv_held(dst));
+	list = rcu_replace_pointer(dst->fence, list, dma_resv_held(dst));
 	write_seqcount_end(&dst->seq);
 
-	dma_resv_list_free(src_list);
-	dma_fence_put(old);
+	dma_resv_list_free(list);
+	dma_fence_put(excl);
 
 	return 0;
 }
-- 
2.25.1

