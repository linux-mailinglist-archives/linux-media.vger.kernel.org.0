Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87F21423DCB
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 14:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238328AbhJFMiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 08:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbhJFMiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 08:38:05 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA6AC061749
        for <linux-media@vger.kernel.org>; Wed,  6 Oct 2021 05:36:12 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u18so8410844wrg.5
        for <linux-media@vger.kernel.org>; Wed, 06 Oct 2021 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BC8JYdK1Qu0/aQcZikfhJVKjP/atFAZpc20Z0L0BuCA=;
        b=abKRjK7veYtiBHtIGNTmHlg0nL2qqVYcjboGWEWZ/NNgRilFnZgevTmqEpM7Wi9sHi
         f/ROK0TD31VEY2vWDIT8j9yiFFJ/ZKtGCuMqI8xV7dUgYcqYcC6L52Q/Us8XksdQR9qG
         arEL0T4xpsgheI2llrN3+Dir/E3JfV+UHtl3tOUsPfTO3wOidjdIy9vD4AHNJEI344bB
         L/x2Er0EDxAfmYFT6VSldsbQIR09EFAdtBIyDT20RKFcYWBuYbHAbePAitCY3aomJ8bg
         j0GE9A4+gEZ4HYaEMYVupceMd1tGUiVIjhbg3YubuaIYjndZsREgRHAUbghLH42u8UBr
         vhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BC8JYdK1Qu0/aQcZikfhJVKjP/atFAZpc20Z0L0BuCA=;
        b=cPNqFs9fnFWGcmYIYh56IYSR+Xer1VnZp+cOgXpJcNsTevyUJ8me6ziM3t3ZOR22kR
         3xJ09rst87pMCu1486vzAt+M8xqSLroIMfuK9yYdK/v6sOWNIN8jnMcp1CwPflLaOFbw
         uAgaN280PMme3P0bsLaD8TfyF/3xv0Mp6mXPAV7q6VDCjesYEw5liydslBdHe49hLb9J
         Nmw496BAAapAqKN9CZ9rJQzGB1Wym3uvwESSNopijjZg+k/SFGLKZ37Y0CaCcJ5/vX6H
         v/tISvL+FwOo46Hm3oHMrCJj21UImEDHI821Oj5QV/YL7tq1m5TV9tYJoClOyY6JYPaX
         TDBg==
X-Gm-Message-State: AOAM5311XWrz4ixhfAH3LJ/iyEP1dhfL4thCCvDkUKinJGLP3JXrHJHH
        2IGSpZFt0yY3TQ1yp5GMKLIBhV2tHTo=
X-Google-Smtp-Source: ABdhPJwVwv3VWEYd7jtzwhszVYTIIG0IDAE548fEEOyXsiE+H0dJetJEqy1Pew5FbBmXaLP1Wz1J4A==
X-Received: by 2002:a05:600c:4f16:: with SMTP id l22mr5838560wmq.152.1633523771376;
        Wed, 06 Oct 2021 05:36:11 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l124sm5194770wml.8.2021.10.06.05.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 05:36:10 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Cc:     tvrtko.ursulin@linux.intel.com
Subject: [PATCH 1/2] dma-buf: add dma_resv_for_each_fence v3
Date:   Wed,  6 Oct 2021 14:36:08 +0200
Message-Id: <20211006123609.2026-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A simpler version of the iterator to be used when the dma_resv object is
locked.

v2: fix index check here as well
v3: minor coding improvement, some documentation cleanup

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 51 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 20 +++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index a480af9581bd..2f98caa68ae5 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -423,6 +423,57 @@ struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
 }
 EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
 
+/**
+ * dma_resv_iter_first - first fence from a locked dma_resv object
+ * @cursor: cursor to record the current position
+ *
+ * Return the first fence in the dma_resv object while holding the
+ * &dma_resv.lock.
+ */
+struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor)
+{
+	struct dma_fence *fence;
+
+	dma_resv_assert_held(cursor->obj);
+
+	cursor->index = 0;
+	if (cursor->all_fences)
+		cursor->fences = dma_resv_shared_list(cursor->obj);
+	else
+		cursor->fences = NULL;
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
+ * Return the next fences from the dma_resv object while holding the
+ * &dma_resv.lock.
+ */
+struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
+{
+	unsigned int idx;
+
+	dma_resv_assert_held(cursor->obj);
+
+	cursor->is_restarted = false;
+	if (!cursor->fences || cursor->index >= cursor->fences->shared_count)
+		return NULL;
+
+	idx = cursor->index++;
+	return rcu_dereference_protected(cursor->fences->shared[idx],
+					 dma_resv_held(cursor->obj));
+}
+EXPORT_SYMBOL_GPL(dma_resv_iter_next);
+
 /**
  * dma_resv_copy_fences - Copy all fences from src to dst.
  * @dst: the destination reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 764138ad8583..491359cea54c 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -179,6 +179,8 @@ struct dma_resv_iter {
 
 struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor);
 struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor);
+struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor);
+struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor);
 
 /**
  * dma_resv_iter_begin - initialize a dma_resv_iter object
@@ -244,6 +246,24 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
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
+ * valid as long as the lock is held and so no extra reference to the fence is
+ * taken.
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

