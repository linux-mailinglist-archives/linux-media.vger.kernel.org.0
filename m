Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7CB413870
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbhIURif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbhIURic (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:32 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21D8C061575
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:03 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id w29so41596029wra.8
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jW0CZKhinxPGfzjKvZaoGAAQIdszIW4EWOO8ehQLYZI=;
        b=MJ4X53AX9uRBpu/Jc5jdXygrqf/sGNOkrUeNXt4JXW9Y1xATiW+3Qh6GjOI9cZYhww
         1tPWTrMJOoYgichkuU165EPe+fkjxUAJdfaUDfqXf+69Bmiaz+WmXy4ZS6KLCUN/BIBO
         U2p6Sop6SFrI3+RmkNvRl3ApesuULePFnm/eI32ea7v2oJvBz7KdFaV3dDL62A87pybP
         nVNcbFnMU/raqHwquaYbkT+3TZLdNyzUJdYCJRVeChf15UMOWd9yObkUuw/kcRjT5hkg
         czJ4mcDhRqyhRTcELWZ+3ShR7yAL+MqBS7V3LJUvIY8PB2V1vim9JAlClFlAboxaiZ+v
         K6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jW0CZKhinxPGfzjKvZaoGAAQIdszIW4EWOO8ehQLYZI=;
        b=fj9NfLwG//ovWhbSYQz06uWNgwNNKL92lgX1Be4HB15uNfCcM8hYRJqU9RILtV60Si
         mW1ZJ7pLaTgMvhzCfacVoaZJzSZemkqpG2rb3kesKvLsR8ADBFCyVyRDU8Ksmmr/dOOF
         Qo41GM7NVqm8zSOFfYT1KittYEhhDL4vf2v8ipSk13MiAjtzXNgC7sTLy5LDq8zTz++l
         MfW9/w5lqi1ZDhGG+y7f51u3jxlP8NP4thkRklIQKcL6p/+m3o+qAPpKWIj8tUytGYCX
         yWRLNPZetIG+NnqgpFG+LfMqszucy74Ozz+JKmrSokWvKiy+4R60v9ckeSw8Z3gre1f3
         eWsw==
X-Gm-Message-State: AOAM532bWMfu4sRoZSrhpr/ktt3N36gs9e8e+5bExjR1wq+it2b8Stsr
        aY2jBvhv2reO4Gg5VF9KYL4=
X-Google-Smtp-Source: ABdhPJxmNADm6OUXVWFFIsBVj9Gl3zy6BKQ/nRYBCw754qNDKg4F5Z3HVu5DgwqGKngK+WQNOwhs7Q==
X-Received: by 2002:a5d:54cf:: with SMTP id x15mr37435320wrv.27.1632245822495;
        Tue, 21 Sep 2021 10:37:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:02 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 02/26] dma-buf: add dma_resv_for_each_fence
Date:   Tue, 21 Sep 2021 19:36:35 +0200
Message-Id: <20210921173659.246165-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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
index 11b5399f4bd3..e6819cbbcd23 100644
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

