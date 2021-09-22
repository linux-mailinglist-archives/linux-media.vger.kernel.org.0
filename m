Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2964B41449E
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234240AbhIVJMW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234253AbhIVJMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:20 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E939C061757
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:50 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t18so4878290wrb.0
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cbt4P9gF9W0fkHi5rUKFhUh5DaRgrifjBuZCKmAII3U=;
        b=o59NEE1uaCmdbdlM+n9TMgn5gCx201LsTgkWo9klBlcW46enctPyi8A3P9MvAqJrkG
         f//sirrk6jruIVR3FMNxKdGq+vqc3DzCfdROvjiamGukAt0htA/kTacQx2uyv4pwKYSs
         uzh58e+BTlWCTGxyE4WEMZpLkPh4hG3bxabFEd8oyliTIgo7GpM7s1dlFhYV0Ziy/PEm
         Z047pb+TKX1d6CdiCrSZGO7hAj2WZigJTY9OU8HN2b5Oj/gel4S0qsXRA+JALZ/xXMoW
         B7yckZs3k82FMDICRNvDR2XHFk9URpnSYkKPqJwcaKZRjUUZo7AuaafkzltbinuPTJzx
         hQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cbt4P9gF9W0fkHi5rUKFhUh5DaRgrifjBuZCKmAII3U=;
        b=oApq9dXKeWEKMbRo7NvyRBqyEk+oeMu8UO1epUh1ZHr+gK7xSp6j4YR0iV8vM+QRjr
         3L9I06uyXb5bKJ0SIN4yc0e5FmAtrxnzc472V+2Hz44wCUDwc6HuSw1U1EF/sE3URmi4
         btc/lGhaLZ29uq6pyEGDvCQ/AaM7MRe1b45uyy12gU2mccZi8yckW8feqqRLMoBclL1g
         na2ZDpVWBxbXERsypQaz1eIeKzGEt7v7fSY7xgP5HwXElviY2RCfFNoHhpPUN4zNTp8b
         bmEwl7OhDcP5ilTGo/MRxYKiLz/VoNgEX51CQede057YIIBNoD4KxqBLW19+NM7lAiA/
         Mrhw==
X-Gm-Message-State: AOAM531jbxcFU0sxlz/nule/+ABamqlpVU17+XgLE542QpuMuSZyQSbV
        8ktD4ArjQ8UEJ+sHrTJJvBLrmWUndOs=
X-Google-Smtp-Source: ABdhPJzvRoRddtsbQzRagMBqFMYJs9mcGfNty9NHddJXaaQI8xE5nUgV+SuaAiJcRLbsXMWk3fe3UA==
X-Received: by 2002:adf:f183:: with SMTP id h3mr39764222wro.32.1632301848687;
        Wed, 22 Sep 2021 02:10:48 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:10:48 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 02/26] dma-buf: add dma_resv_for_each_fence
Date:   Wed, 22 Sep 2021 11:10:20 +0200
Message-Id: <20210922091044.2612-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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
index 7768140ab36d..c6f1f6837b55 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -418,6 +418,52 @@ struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
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
index baf77a542392..72e7ebaa675f 100644
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

