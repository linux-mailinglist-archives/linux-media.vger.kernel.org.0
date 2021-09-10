Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67E9406851
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbhIJI2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhIJI2K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:10 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D94C061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:26:59 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id u15-20020a05600c19cf00b002f6445b8f55so797187wmq.0
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YErPkwK3P1MRDtjuzNu0YD+XcPHeEcSK9BW/6kjgcgQ=;
        b=qA/lui572R0JwDCPqnhU7qt9TvJbbM5H91fOEu8BCQu0Q7yQOy1wwMumBD0JiGRoUg
         O/zGB8kL3WqFpJa3249cNJ5/W63M3kkvF7lV7Nvcnemx3Q+2fH1fZdBrMjijr0c3+oyR
         jQ4sKocFtEmwuWdPseoEuhMZXfhyyaXwgYB593uZflsMqclnRfBJSw36Hup5VznB0ayz
         63gpI7+twv2v7fQC1ZXYeioDxoWVGXXxjypmbjqtT7BNWH17MwOXxtQDO1IYmNhXpV6C
         iwY4EUMPtBWXPgc08en4w8K7nx+z7fn8e3SxJL6F+Kz48JcEi2uu6bX0Fh21na0s3PV2
         BB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YErPkwK3P1MRDtjuzNu0YD+XcPHeEcSK9BW/6kjgcgQ=;
        b=E2FNI7Ykq8sgZWw/xNy3Uclcnrqmf/HdZ1z6UJ7HeTa5iUeY21l2Ii3tpToLRcmz+x
         qmgE8nbDN9DHSWn4Qn8/PneN/RoxBP9n0reKtG+XVZG9cPVKe0jkjjJqNuj8WUEwbpSJ
         CYGLfZ+5t+eCrBgm0aRvHp1JsSC7eeCJk1jB9s0S76SxeCdDarB9krPfjPUANDw3cDRj
         ke+OLnjrxnSeZ5C+0Vm00bwwcmvSMgFZzCOh4fng2Laxr2dkfErkPY+dPC/fe0H6LNdi
         oMihuG1cGSfW+dhB9NmrogflnbZt6ralAddwcax7mMXPH6jnXGN+LB4m6u7JAcwqQswI
         GvJQ==
X-Gm-Message-State: AOAM5334l6J6ScSPnQ9/2dAQVWmiwT3jO65V1GACJjtW4tzpeIW/X/LX
        k1/D+kX/AC9owwQtpCQjMCRKGrdNTpwLUPz2
X-Google-Smtp-Source: ABdhPJyFWwMk0FJo1jkyoNh9TWkolVVZj0em99m4EzBxrCK7B1f0XNxpgbLiEvGjXPviAm64aqOIHQ==
X-Received: by 2002:a7b:cf21:: with SMTP id m1mr766929wmg.95.1631262418476;
        Fri, 10 Sep 2021 01:26:58 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:26:58 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 02/14] dma-buf: add dma_resv_for_each_fence
Date:   Fri, 10 Sep 2021 10:26:43 +0200
Message-Id: <20210910082655.82168-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A simpler version of the iterator to be used when the dma_resv object is
locked.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 18 ++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 213a9b7251ca..8cbccaae169d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -323,6 +323,44 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_walk - walk over fences in a dma_resv obj
+ * @obj: the dma_resv object
+ * @cursor: cursor to record the current position
+ * @all_fences: true returns also the shared fences
+ * @first: if we should start over
+ *
+ * Return all the fences in the dma_resv object while holding the
+ * dma_resv::lock.
+ */
+struct dma_fence *dma_resv_walk(struct dma_resv *obj,
+				struct dma_resv_cursor *cursor,
+				bool all_fences, bool first)
+{
+	dma_resv_assert_held(obj);
+
+	cursor->is_first = first;
+	if (first) {
+		struct dma_fence *fence;
+
+		cursor->index = -1;
+		cursor->fences = dma_resv_shared_list(obj);
+		cursor->is_exclusive = true;
+
+		fence = dma_resv_excl_fence(obj);
+		if (fence)
+			return fence;
+	}
+
+	if (!all_fences || !cursor->fences ||
+	    ++cursor->index >= cursor->fences->shared_count)
+		return NULL;
+
+	return rcu_dereference_protected(cursor->fences->shared[cursor->index],
+					 dma_resv_held(obj));
+}
+EXPORT_SYMBOL_GPL(dma_resv_walk);
+
 /**
  * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
  * @obj: the dma_resv object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index f5b91c292ee0..6f9bb7e4c538 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -165,6 +165,21 @@ struct dma_resv_cursor {
 	bool is_exclusive;
 };
 
+/**
+ * dma_resv_for_each_fence - fence iterator
+ * @obj: a dma_resv object pointer
+ * @cursor: a struct dma_resv_cursor pointer
+ * @all_fences: true if all fences should be returned
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object while holding the
+ * dma_resv::lock. @all_fences controls if the shared fences are returned as
+ * well.
+ */
+#define dma_resv_for_each_fence(obj, cursor, all_fences, fence)		  \
+	for (fence = dma_resv_walk(obj, cursor, all_fences, true); fence; \
+	     fence = dma_resv_walk(obj, cursor, all_fences, false))
+
 /**
  * dma_resv_for_each_fence_unlocked - fence iterator
  * @obj: a dma_resv object pointer
@@ -399,6 +414,9 @@ void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
+struct dma_fence *dma_resv_walk(struct dma_resv *obj,
+				struct dma_resv_cursor *cursor,
+				bool first, bool all_fences);
 struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
 					 struct dma_resv_cursor *cursor,
 					 bool first, bool all_fences);
-- 
2.25.1

