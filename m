Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC02D413871
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhIURif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbhIURib (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:31 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73C2C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:02 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id d21so41529702wra.12
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uf9+jpJeEgCFnOIPRcwH4Xus10PdccW5sZ8+5fRgjtI=;
        b=Hx6CmGIL3yNe3WSoedSEgQ5EPn07dSWNkriSXIoqUcit8q0uTucUwBc+mz+51bXr9w
         SVprnbu/mXoLd1o/vQKzVbDQSNQhIIV78cGQahRuitiyXx6Hkx5+TPpyohaqdiOQ4kw7
         Q1FWh5GaLgKSZ9NwBXzzSV8r3blpbWLScsd+uziOYzeZCvcaBap6tuuoytExP7Pxnsba
         FpY0PCfLlk5L27PJAbBKYOM9II1UDmEVa4uykUeu8bWpt681bu3fJkqQ1YjrwDwY5Xqx
         m2FhiAakai/B3bJZ0vScDYlR8wIsEDdWKZzYOa9lNj/vpHGQ8dr9Bparg3wF6zs93dXP
         XnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uf9+jpJeEgCFnOIPRcwH4Xus10PdccW5sZ8+5fRgjtI=;
        b=pb3KRLP/b6zIay69XjrbrDyeTC0mJla82sSF0T8OS7iQ7BrSVwAKw9qoBYo5NGKtYe
         nxy4R+hGM2tl5QXVFy3zkOirDmpgBCaFQTGnEyrkMTsCCpjlbHkXOiNpUMBEEZMnrsyK
         fOyWFdxcUnfkdwntK+As4id4TogAGgEkqZapYo2IFiM99M9g1c551anPnOzeErKWDP3+
         v6la9RWvIMefu9ZwEUvK54GzA4C7qqJ7a4Hguf8AJiupxjK9QShhp/WYTVD0ljlz1Jfs
         9NlvYxZ9Ljvzw/cSIkzMmsnN4a6EdN+ezTMPzQ325p0eDhqxaD7+gZYm3XUQwduIt0s7
         2zxw==
X-Gm-Message-State: AOAM530RvlDMtMTZu15ovdweUbW/mKj6uWs3Nua6DYyhOre8x2d9Nyga
        vyPgYHY8T5Zj9Rqtvay9zOM=
X-Google-Smtp-Source: ABdhPJzrUCurtyeGxjMbFgwgCWmKyQY6dPJ2HueooXFdqbs6snAaHkPoiDnHbg92FkEoyUsZ3ANj2Q==
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr36346897wrr.173.1632245821522;
        Tue, 21 Sep 2021 10:37:01 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:01 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 01/26] dma-buf: add dma_resv_for_each_fence_unlocked v3
Date:   Tue, 21 Sep 2021 19:36:34 +0200
Message-Id: <20210921173659.246165-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

v3: restructor the code, move rcu_read_lock()/unlock() into the
    iterator, add dma_resv_iter_is_restarted()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 98 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 95 ++++++++++++++++++++++++++++++++++++
 2 files changed, 193 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 84fbe60629e3..11b5399f4bd3 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -323,6 +323,104 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_iter_restart_unlocked - restart the unlocked iterator
+ * @cursor: The dma_resv_iter object to restart
+ *
+ * Restart the unlocked iteration by initializing the cursor object.
+ */
+static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
+{
+	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
+	cursor->index = -1;
+	if (cursor->all_fences) {
+		rcu_read_lock();
+		cursor->fences = dma_resv_shared_list(cursor->obj);
+		rcu_read_unlock();
+	} else {
+		cursor->fences = NULL;
+	}
+	cursor->is_restarted = true;
+}
+
+/**
+ * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
+ * @cursor: cursor to record the current position
+ *
+ * Return all the fences in the dma_resv object which are not yet signaled.
+ * The returned fence has an extra local reference so will stay alive.
+ * If a concurrent modify is detected the whole iterration is started over again.
+ */
+static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
+{
+	struct dma_resv *obj = cursor->obj;
+
+	do {
+		/* Drop the reference from the previous round */
+		dma_fence_put(cursor->fence);
+
+		if (cursor->index++ == -1) {
+			cursor->fence = dma_resv_excl_fence(obj);
+			cursor->fence = dma_fence_get_rcu(cursor->fence);
+
+		} else if (!cursor->fences ||
+			   cursor->index >= cursor->fences->shared_count) {
+			cursor->fence = NULL;
+
+		} else {
+			struct dma_resv_list *fences = cursor->fences;
+			unsigned int idx = cursor->index;
+
+			cursor->fence = rcu_dereference(fences->shared[idx]);
+			cursor->fence = dma_fence_get_rcu(cursor->fence);
+		}
+	} while (cursor->fence && dma_fence_is_signaled(cursor->fence));
+}
+
+/**
+ * dma_resv_iter_first_unlocked - first fence in an unlocked dma_resv obj.
+ * @cursor: the cursor with the current position
+ *
+ * Returns the first fence from an unlocked dma_resv obj.
+ */
+struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor)
+{
+	rcu_read_lock();
+	do {
+		dma_resv_iter_restart_unlocked(cursor);
+		dma_resv_iter_walk_unlocked(cursor);
+	} while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
+	rcu_read_unlock();
+
+	return cursor->fence;
+}
+EXPORT_SYMBOL(dma_resv_iter_first_unlocked);
+
+/**
+ * dma_resv_iter_next_unlocked - next fence in an unlocked dma_resv obj.
+ * @cursor: the cursor with the current position
+ *
+ * Returns the next fence from an unlocked dma_resv obj.
+ */
+struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
+{
+	bool restart;
+
+	rcu_read_lock();
+	cursor->is_restarted = false;
+	restart = read_seqcount_retry(&cursor->obj->seq, cursor->seq);
+	do {
+		if (restart)
+			dma_resv_iter_restart_unlocked(cursor);
+		dma_resv_iter_walk_unlocked(cursor);
+		restart = true;
+	} while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
+	rcu_read_unlock();
+
+	return cursor->fence;
+}
+EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
+
 /**
  * dma_resv_copy_fences - Copy all fences from src to dst.
  * @dst: the destination reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 9100dd3dc21f..baf77a542392 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -149,6 +149,101 @@ struct dma_resv {
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
+	/** @is_restarted: true if this is the first returned fence */
+	bool is_restarted;
+};
+
+struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor);
+struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor);
+
+/**
+ * dma_resv_iter_begin - initialize a dma_resv_iter object
+ * @cursor: The dma_resv_iter object to initialize
+ * @obj: The dma_resv object which we want to iterator over
+ * @all_fences: If all fences should be returned or just the exclusive one
+ */
+static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
+				       struct dma_resv *obj,
+				       bool all_fences)
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
+ * dma_resv_iter_is_restarted - test if this is the first fence after a restart
+ * @cursor: the cursor with the current position
+ *
+ * Return true if this is the first fence in an interation after a restart.
+ */
+static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
+{
+	return cursor->is_restarted;
+}
+
+/**
+ * dma_resv_for_each_fence_unlocked - unlocked fence iterator
+ * @cursor: a struct dma_resv_iter pointer
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object without holding the
+ * &dma_resv.lock and using RCU instead. The cursor needs to be initialized
+ * with dma_resv_iter_begin() and cleaned up with dma_resv_iter_end(). Inside
+ * the iterator a reference to the dma_fence is hold and the RCU lock dropped.
+ * When the dma_resv is modified the iteration starts over again.
+ */
+#define dma_resv_for_each_fence_unlocked(cursor, fence)			\
+	for (fence = dma_resv_iter_first_unlocked(cursor);		\
+	     fence; fence = dma_resv_iter_next_unlocked(cursor))
+
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-- 
2.25.1

