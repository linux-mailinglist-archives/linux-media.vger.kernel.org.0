Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0712D41778B
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347120AbhIXPcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbhIXPcw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:32:52 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D54C061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:18 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t28so15272773wra.7
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8GcZUte1eKAW3KEA8b90CyEUqRj3RuvP1QuX3wuqstY=;
        b=C63CTnmyjqVSqMcN0rJ4kkZvs5ecdEU/Yj1kMn4gBkfFJRyHz25EhxsslTa14fnHN/
         Q+PBZAk6po5Tmtqv0gLEVwWW6UyZErLCM4Q7Xz+zis+vJi8upvO69e7R65BlytEIcPhH
         Pgu7CHhjW/XWlX2y6DZWlrF6tA/4Lc3fwPFzcr8kBEfFmqyfN0lEmHzAkHlay4/HzO30
         mOlqZSdd4A7eOJuR+tNJ8pITyaLP53VaLBkD570xULpylMyjoTnTha0oFgqb3hkoR07x
         PVP9MBtZgrfvQaPCWxNnzhj8d/wYjNiNynFAyjZHEAxsA/WRxuZe+DWsfyGBIrQrNyXV
         QGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8GcZUte1eKAW3KEA8b90CyEUqRj3RuvP1QuX3wuqstY=;
        b=EPs98kJprTrhYj2tEu9G5YDPO9rb3afT71BSceRvOz032Hg3WhI5gKxaazMyih2Jro
         FhJ2lpLhvVa6jySxReVlrf5Nk3kaDhgmbXaSoj0KALprpcKWuEzDfVwjeqcBTRvDsVsJ
         MzRtf4F5HB/+1yDb5LGOMIfsB/TwNY9UpqsF7rAiggLwplUYfEEVs5jTOnOQq0yXWjpI
         Heh4yh7MV15enghFWMk8UG8QhCDhAPZIxj37kRkbtQUNUZcryp37FA4fpv9d3jCkCdEA
         MwPbgwv45/+zkC2yWFjNIyAxBpljgKMHIDMyU4Uf9Bt5SDxT0/3G7Z6mzbT/3nMwRsgO
         K2Xw==
X-Gm-Message-State: AOAM5303w91fSjeyfvC+V81riJKX3WwSJjG8DbWcTm7W8vVSWFIn/GKw
        vIIClBDDFGiB96RMbjFLTavNTAMSa1Q=
X-Google-Smtp-Source: ABdhPJz1VjL0gM2i5SpTpbnaY6wOWsW4rXQoKeFakTmbWY5/IYFUxV5lMreHayByU4QS8Oae/L38OA==
X-Received: by 2002:a05:600c:4e86:: with SMTP id f6mr2898221wmq.52.1632497477404;
        Fri, 24 Sep 2021 08:31:17 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:17 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 02/27] dma-buf: add dma_resv_for_each_fence
Date:   Fri, 24 Sep 2021 17:30:48 +0200
Message-Id: <20210924153113.2159-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 46 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 19 ++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 97af397304f3..98cb0050c615 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -421,6 +421,52 @@ struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
 }
 EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
 
+/**
+ * dma_resv_iter_first - first fence from a locked dma_resv object
+ * @cursor: cursor to record the current position
+ *
+ * Return all the fences in the dma_resv object while holding the
+ * &dma_resv.lock.
+ */
+struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor)
+{
+	struct dma_fence *fence;
+
+	dma_resv_assert_held(cursor->obj);
+
+	cursor->index = -1;
+	cursor->fences = dma_resv_shared_list(cursor->obj);
+
+	fence = dma_resv_excl_fence(cursor->obj);
+	if (!fence)
+		fence = dma_resv_iter_next(cursor);
+
+	cursor->is_restarted = true;
+	return fence;
+}
+EXPORT_SYMBOL_GPL(dma_resv_iter_first);
+
+/**
+ * dma_resv_iter_next - next fence from a locked dma_resv object
+ * @cursor: cursor to record the current position
+ *
+ * Return all the fences in the dma_resv object while holding the
+ * &dma_resv.lock.
+ */
+struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
+{
+	dma_resv_assert_held(cursor->obj);
+
+	cursor->is_restarted = false;
+	if (!cursor->all_fences || !cursor->fences ||
+	    ++cursor->index >= cursor->fences->shared_count)
+		return NULL;
+
+	return rcu_dereference_protected(cursor->fences->shared[cursor->index],
+					 dma_resv_held(cursor->obj));
+}
+EXPORT_SYMBOL_GPL(dma_resv_iter_next);
+
 /**
  * dma_resv_copy_fences - Copy all fences from src to dst.
  * @dst: the destination reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 5d7d28cb9008..d4b4cd43f0f1 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -179,6 +179,8 @@ struct dma_resv_iter {
 
 struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor);
 struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor);
+struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor);
+struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor);
 
 /**
  * dma_resv_iter_begin - initialize a dma_resv_iter object
@@ -244,6 +246,23 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
 	for (fence = dma_resv_iter_first_unlocked(cursor);		\
 	     fence; fence = dma_resv_iter_next_unlocked(cursor))
 
+/**
+ * dma_resv_for_each_fence - fence iterator
+ * @cursor: a struct dma_resv_iter pointer
+ * @obj: a dma_resv object pointer
+ * @all_fences: true if all fences should be returned
+ * @fence: the current fence
+ *
+ * Iterate over the fences in a struct dma_resv object while holding the
+ * &dma_resv.lock. @all_fences controls if the shared fences are returned as
+ * well. The cursor initialisation is part of the iterator and the fence stays
+ * valid as long as the lock is held.
+ */
+#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)	\
+	for (dma_resv_iter_begin(cursor, obj, all_fences),	\
+	     fence = dma_resv_iter_first(cursor); fence;	\
+	     fence = dma_resv_iter_next(cursor))
+
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
-- 
2.25.1

