Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903EE40F7A5
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244183AbhIQMgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244172AbhIQMgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:41 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660E1C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:18 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id i23so14966368wrb.2
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5+u8qc2R4BG24i/iDhv9Dl7RY3z3hrt5qBrjleD7a4M=;
        b=DO+agg2OEDNAzmgjtfIQLf3/3wD5w1pe/WD3Cpyqz0W68aOLG05Std+bRdufeVNLOh
         YV5BHaNcq44k9EwUCXm3hoONsWD9mIM0HbLXYf5WLcvxDP/cj1Or0BKiSbr5PO7at+pf
         CybzRBhAwoYAKlQ/VTXD2BHEo3R0Vu4gu/mVIMCkGr+fQzGUgQY+i8RqyqGwKoEGRVl5
         Z52AK1fZGnHYlJENlBQyx+hQU+Ku6oz6ZtUpHoPcQNglhbzJm3+tfoZZARF9FftS12Km
         g0GlN6xu34ZCQWPdAR/t6Sn77CRRbcCD+yX+PW9ZYTK1ZYoYHvzcjAmGIAHHpGgw0rEz
         BmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5+u8qc2R4BG24i/iDhv9Dl7RY3z3hrt5qBrjleD7a4M=;
        b=ca1rjSQpGhIKxYngT52RO787t2k++/XoQSg+GoCd1pL6wvo00Q04gSNm+44k0wG26R
         4NAJ90qDIWrlo5SE/UOebzLbg199kh+80lLmHWqXYrUZzk34hK1ULCY9MEMDM46IHZj3
         H2Lz8s/2Y2uA3DsXIjSEcI+PJIK9ErNl/00GFhn5mscIcS/0biy5njatjTFEKKVIGhzp
         IIVItgIIL1y4zXQPW/foYXw3fAxkarqnL6cFyCUOMNM3MZRhgp1A8XuXDnf1LXxlcNVt
         6TLproiM0jTP8RiSc/j9CC097asJWfLiWi3mYOmN+BuTP2JCV9zzxjmElAo2NnRpBVbA
         B4Lg==
X-Gm-Message-State: AOAM531R/6Xj/gDOtHOf3hG9aveHocfjcogb5bPISoJyVyEy/rCoWXyF
        m3m89HSgBzFe3lVhPadQNWM=
X-Google-Smtp-Source: ABdhPJx2rLT7WcIhsex2Jd1FsoSV3RqyWPtA/hnLC3xhDpUuvFYmlmwp19mPoQfF5dhm0JkNo1Yhzg==
X-Received: by 2002:adf:f543:: with SMTP id j3mr11911860wrp.287.1631882116985;
        Fri, 17 Sep 2021 05:35:16 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:16 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 01/26] dma-buf: add dma_resv_for_each_fence_unlocked v2
Date:   Fri, 17 Sep 2021 14:34:48 +0200
Message-Id: <20210917123513.1106-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Abstract the complexity of iterating over all the fences
in a dma_resv object.

The new loop handles the whole RCU and retry dance and
returns only fences where we can be sure we grabbed the
right one.

v2: fix accessing the shared fences while they might be freed,
    improve kerneldoc, rename _cursor to _iter, add
    dma_resv_iter_is_exclusive, add dma_resv_iter_begin/end

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 61 +++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 84 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 145 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 84fbe60629e3..3e77cad2c9d4 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -323,6 +323,67 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
+ * @cursor: cursor to record the current position
+ * @first: if we should start over
+ *
+ * Return all the fences in the dma_resv object which are not yet signaled.
+ * The returned fence has an extra local reference so will stay alive.
+ * If a concurrent modify is detected the whole iterration is started over again.
+ */
+struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
+					      bool first)
+{
+	struct dma_resv *obj = cursor->obj;
+
+	first |= read_seqcount_retry(&obj->seq, cursor->seq);
+	do {
+		/* Drop the reference from the previous round */
+		dma_fence_put(cursor->fence);
+
+		cursor->is_first = first;
+		if (first) {
+			cursor->seq = read_seqcount_begin(&obj->seq);
+			cursor->index = -1;
+			cursor->fences = dma_resv_shared_list(obj);
+
+			cursor->fence = dma_resv_excl_fence(obj);
+			if (cursor->fence &&
+			    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+				     &cursor->fence->flags))
+				cursor->fence = NULL;
+		} else {
+			cursor->fence = NULL;
+		}
+
+		if (cursor->fence) {
+			cursor->fence = dma_fence_get_rcu(cursor->fence);
+		} else if (cursor->all_fences && cursor->fences) {
+			struct dma_resv_list *fences = cursor->fences;
+
+			while (++cursor->index < fences->shared_count) {
+				cursor->fence = rcu_dereference(
+					fences->shared[cursor->index]);
+				if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+					      &cursor->fence->flags))
+					break;
+			}
+			if (cursor->index < fences->shared_count)
+				cursor->fence =
+					dma_fence_get_rcu(cursor->fence);
+			else
+				cursor->fence = NULL;
+		}
+
+		/* For the eventually next round */
+		first = true;
+	} while (read_seqcount_retry(&obj->seq, cursor->seq));
+
+	return cursor->fence;
+}
+EXPORT_SYMBOL_GPL(dma_resv_iter_walk_unlocked);
+
 /**
  * dma_resv_copy_fences - Copy all fences from src to dst.
  * @dst: the destination reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 9100dd3dc21f..693d16117153 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -149,6 +149,90 @@ struct dma_resv {
 	struct dma_resv_list __rcu *fence;
 };
 
+/**
+ * struct dma_resv_iter - current position into the dma_resv fences
+ *
+ * Don't touch this directly in the driver, use the accessor function instead.
+ */
+struct dma_resv_iter {
+	/** @obj: The dma_resv object we iterate over */
+	struct dma_resv *obj;
+
+	/** @all_fences: If all fences should be returned */
+	bool all_fences;
+
+	/** @fence: the currently handled fence */
+	struct dma_fence *fence;
+
+	/** @seq: sequence number to check for modifications */
+	unsigned int seq;
+
+	/** @index: index into the shared fences */
+	unsigned int index;
+
+	/** @fences: the shared fences */
+	struct dma_resv_list *fences;
+
+	/** @is_first: true if this is the first returned fence */
+	bool is_first;
+};
+
+struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
+					      bool first);
+
+/**
+ * dma_resv_iter_begin - initialize a dma_resv_iter object
+ * @cursor: The dma_resv_iter object to initialize
+ * @obj: The dma_resv object which we want to iterator over
+ * @all_fences: If all fences should be returned or just the exclusive one
+ */
+static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
+					struct dma_resv *obj,
+					bool all_fences)
+{
+	cursor->obj = obj;
+	cursor->all_fences = all_fences;
+	cursor->fence = NULL;
+}
+
+/**
+ * dma_resv_iter_end - cleanup a dma_resv_iter object
+ * @cursor: the dma_resv_iter object which should be cleaned up
+ *
+ * Make sure that the reference to the fence in the cursor is properly
+ * dropped.
+ */
+static inline void dma_resv_iter_end(struct dma_resv_iter *cursor)
+{
+	dma_fence_put(cursor->fence);
+}
+
+/**
+ * dma_resv_iter_is_exclusive - test if the current fence is the exclusive one
+ * @cursor: the cursor of the current position
+ *
+ * Returns true if the currently returned fence is the exclusive one.
+ */
+static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
+{
+	return cursor->index == -1;
+}
+
+/**
+ * dma_resv_for_each_fence_unlocked - unlocked fence iterator
+ * @cursor: a struct dma_resv_iter pointer
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object without holding the
+ * dma_resv::lock. The RCU read side lock must be hold when using this, but can
+ * be dropped and re-taken as necessary inside the loop. The cursor needs to be
+ * initialized with dma_resv_iter_begin_unlocked() and cleaned up with
+ * dma_resv_iter_end_unlocked().
+ */
+#define dma_resv_for_each_fence_unlocked(cursor, fence)			\
+	for (fence = dma_resv_iter_walk_unlocked(cursor, true);		\
+	     fence; fence = dma_resv_iter_walk_unlocked(cursor, false))
+
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-- 
2.25.1

