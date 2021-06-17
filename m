Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36A93AB224
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbhFQLSL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhFQLSL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:11 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBDAC061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:03 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id i13so3441380edb.9
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZR9DlJa3jlukpGNrraw8yl0uJdk87bmE6IiDxI/ezGM=;
        b=Rvqg5t1b2ghztUpefu+Xpb7xWdN1tRGvggXMLtfNyvzBRZPxTntXSwG+P+igS+o9bc
         MIZHnC7uLTBiAv2yYB8Hn/4AA2jqDoihqf9NDsQj5INmrXLc6dBlcRi+ElRDlqY6/nEQ
         JN5o7fuEqg7t12BvtAu/bBfp+7zAhELZOaPbxDIr7e/uaFT28oo6/HDyEm1WbPIX3+wx
         39tTdCejlNQ9x70j/t9uMMKMIPubNzLRFFw0D/0YlZFdOtzUEVUTsSHeuH7Tryhf9loq
         pkn5k2agWoQwGxTW3RMt2WkbNm+s4D0W70iOZiIksVPcXof7olY8+GzLRqCr8ou5EwJs
         VNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZR9DlJa3jlukpGNrraw8yl0uJdk87bmE6IiDxI/ezGM=;
        b=NYrO+GdKrjK3UtLAkbsJw6bYFOd82zqmL3PIGXg2HpwnRPeSWySgipfbiPnz2CqIqj
         0T5lJYF4DdJiC9660afmLqAOXVTimB7iHbvzQlXgeCHuzeLSfHUV/4FLUKEFCSpMrlJR
         bb0gDeR4byMBUhjBnMAaelKCFmFETWJxcBStIlD7MwV2xLErFQK5nN38qVy+5RbyqkRC
         S0pMFxL0Y/LHP9yzqFT8eWi+qAS4LOooTn51QfC4OgHtkPakng/QWHJ6jSyNib1druVp
         kgiP0NwFu8irz1wzVXppxKE/B6p2nCcPAfv1U1BE1/fZYOcv2BX4i8nJKxJAC4uXi+wu
         bvJg==
X-Gm-Message-State: AOAM53333e/mCnzZUMLlYMEml06lYbqbrRR6bKArGJzHE5aFBdoUDzAh
        0eN9nXK9W3Gr+is8uY8NlQs=
X-Google-Smtp-Source: ABdhPJwKPCwc0R12QImmoQJvrnKhDadPnsB2pyM5lsSXsdeqz0r1qYYgIq3dN7S8mvjIoEwCsL9eqA==
X-Received: by 2002:aa7:d818:: with SMTP id v24mr5717557edq.22.1623928562097;
        Thu, 17 Jun 2021 04:16:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:01 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 01/16] dma-buf: add dma_resv_for_each_fence_unlocked
Date:   Thu, 17 Jun 2021 13:15:43 +0200
Message-Id: <20210617111558.28486-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 18dd5a6ca06c..d8da8a914b07 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -316,6 +316,69 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_walk_unlocked - walk over fences in a dma_resv obj
+ * @obj: the dma_resv object
+ * @cursor: cursor to record the current position
+ * @all_fences: true returns also the shared fences
+ * @first: if we should start over
+ *
+ * Return all the fences in the dma_resv object which are not yet signaled.
+ * The returned fence has an extra local reference so will stay alive.
+ * If a concurrent modify is detected the whole iterator is started over again.
+ */
+struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
+					 struct dma_resv_cursor *cursor,
+					 bool all_fences, bool first)
+{
+	struct dma_fence *fence = NULL;
+
+	do {
+		/* Drop the reference from the previous round */
+		dma_fence_put(fence);
+
+		cursor->is_first = first;
+		if (first) {
+			cursor->seq = read_seqcount_begin(&obj->seq);
+			cursor->index = -1;
+			cursor->fences = dma_resv_shared_list(obj);
+			cursor->is_exclusive = true;
+
+			fence = dma_resv_excl_fence(obj);
+			if (fence && test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+					      &fence->flags))
+				fence = NULL;
+		} else {
+			fence = NULL;
+		}
+
+		if (fence) {
+			fence = dma_fence_get_rcu(fence);
+		} else if (all_fences && cursor->fences) {
+			struct dma_resv_list *fences = cursor->fences;
+
+			cursor->is_exclusive = false;
+			while (++cursor->index < fences->shared_count) {
+				fence = rcu_dereference(fences->shared[
+							cursor->index]);
+				if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+					      &fence->flags))
+					break;
+			}
+			if (cursor->index < fences->shared_count)
+				fence = dma_fence_get_rcu(fence);
+			else
+				fence = NULL;
+		}
+
+		/* For the eventually next round */
+		first = true;
+	} while (read_seqcount_retry(&obj->seq, cursor->seq));
+
+	return fence;
+}
+EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
+
 /**
  * dma_resv_copy_fences - Copy all fences from src to dst.
  * @dst: the destination reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 562b885cf9c3..74775f2cb679 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -75,6 +75,39 @@ struct dma_resv {
 	struct dma_resv_list __rcu *fence;
 };
 
+/**
+ * struct dma_resv_cursor - current position into the dma_resv fences
+ * @seq: sequence number to check
+ * @index: index into the shared fences
+ * @shared: the shared fences
+ * @is_first: true if this is the first returned fence
+ * @is_exclusive: if the current fence is the exclusive one
+ */
+struct dma_resv_cursor {
+	unsigned int seq;
+	unsigned int index;
+	struct dma_resv_list *fences;
+	bool is_first;
+	bool is_exclusive;
+};
+
+/**
+ * dma_resv_for_each_fence_unlocked - fence iterator
+ * @obj: a dma_resv object pointer
+ * @cursor: a struct dma_resv_cursor pointer
+ * @all_fences: true if all fences should be returned
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object without holding the
+ * dma_resv::lock. The RCU read side lock must be hold when using this, but can
+ * be dropped and re-taken as necessary inside the loop. @all_fences controls
+ * if the shared fences are returned as well.
+ */
+#define dma_resv_for_each_fence_unlocked(obj, cursor, all_fences, fence)    \
+	for (fence = dma_resv_walk_unlocked(obj, cursor, all_fences, true); \
+	     fence; dma_fence_put(fence),				    \
+	     fence = dma_resv_walk_unlocked(obj, cursor, all_fences, false))
+
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
@@ -272,6 +305,9 @@ void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
+struct dma_fence *dma_resv_walk_unlocked(struct dma_resv *obj,
+					 struct dma_resv_cursor *cursor,
+					 bool first, bool all_fences);
 int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
 			unsigned *pshared_count, struct dma_fence ***pshared);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
-- 
2.25.1

