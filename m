Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3D3406850
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbhIJI2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhIJI2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:09 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C00C061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:26:58 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id z9-20020a7bc149000000b002e8861aff59so855654wmi.0
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qg7l/EFf9rR8AshzqDpvjOG0up4Bpj2cOJ4DPctGlsg=;
        b=hYO0/QJu51bK9PIC7tiV1/qT5E7pqxEhAMyFhTjajOMeAp5BV6wFpmpNanNfoAaT1i
         ryloc9aWQdHyMvzcBh2C/v5qQSV4OPVUQQBkhxNiXROJRTgT7YjJMFopK1+/73HgYCm/
         4BirXEKTsHk/iST/yzgyCagZPytlnvADiEELvSqKk4lxJk1GkExVa7NRcNo9JUvY8zKL
         gXi9cBGqGU6XRIW02kDuaxAeUBHrDd44Az/AwFmPs99Qiznj/K9eXesRP8/FYh4j71FX
         1wTIDFEtHgZa0OHrGKN4S+kMzO3Re+APPHn3MqQVpFrVz/hdsxhKAXijO6UUy5x1jOSE
         uQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qg7l/EFf9rR8AshzqDpvjOG0up4Bpj2cOJ4DPctGlsg=;
        b=PRCXYMvrJd7jaRegMAhB+miL5tZ6mVnB66dpbiP1cTzsC2LWBNNHrWWLAoniRLjC4t
         dc1L+aPFc4uIv8cMc0csAZeqDDQexdKiNLOT5MLJsa1mYQKqctwOTasCA+H0uyUhW1xa
         0KfQQMNZEJNHIos+IicJns/eT39jN2Mkgk54GhRTrUP9bZuCriHhvtPFGEVFk0Us5hEE
         jtNVL68WtBsGAbd8usdEsEcT+L+yGykGDMdNn0+73vW0c8AVwvQVRlwNFaA2g8sK5rLP
         bj4oU03Nn/38LT8064tiX5O0Wc5eBPwxXREl6nsHMuSYg/QppLxLq1DXtwM4CUKOLzeG
         qy2A==
X-Gm-Message-State: AOAM531Ad4m9Lb2hZZR5axo1a2+aTmCd3p41zu/2tU+8FwqTYxednQNP
        B3N4veC0sbRVj4VxcL+OIt0=
X-Google-Smtp-Source: ABdhPJxY8uiFmE1WR/yWgIv+FQO7at7p+ltamy2XMb+pMdNS7j34icDOhYn2bnvmsAmeZ9nekC359A==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr6966890wmq.154.1631262417454;
        Fri, 10 Sep 2021 01:26:57 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:26:57 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 01/14] dma-buf: add dma_resv_for_each_fence_unlocked
Date:   Fri, 10 Sep 2021 10:26:42 +0200
Message-Id: <20210910082655.82168-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 63 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 36 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 84fbe60629e3..213a9b7251ca 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -323,6 +323,69 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
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
index 9100dd3dc21f..f5b91c292ee0 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -149,6 +149,39 @@ struct dma_resv {
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
 
@@ -366,6 +399,9 @@ void dma_resv_fini(struct dma_resv *obj);
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

