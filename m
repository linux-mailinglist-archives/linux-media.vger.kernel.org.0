Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8FB41EA55
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353344AbhJAKIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbhJAKIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:02 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD00EC061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:17 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id t16-20020a1c7710000000b003049690d882so10759047wmi.5
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v4LbHzasULQayC+y/hjohCjdtn1xDHygzW8kntq697M=;
        b=AJluI3DqUgVPqr2pdUTmoNMEUOTbYCvC8CrWSUQPgcw2ADm8tZ7DUd9U/V3nPpVd7I
         1j8ecLCjZ9xw2DnehZPJeDMFvjfDvcceEk7847Y/MDe/72+qJ9mBQVw0JKb/EIsizNaP
         q+Aej35RF8NTB6HuxnggjeJUp5zFsBYxHuO5UqUe/8INWnkpDZ9+18+WPFg7S4apY6JR
         eOVwDsB83C+AxTpoAyqaya/1zgdURnMjBg1IIvp86MaFFzubR74Qqx7xLG6N73ZvO4r/
         KflvDuzTRdgbDJCqaFBcQ6cSnYXFhJM/AtysbDa6a36uqs8VED/D6/YfW0ys9nwNdLLu
         ueGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v4LbHzasULQayC+y/hjohCjdtn1xDHygzW8kntq697M=;
        b=BKpgs6slVJatL23gHGhJ565JJusNii+/9BtpO2uSA872bomEvTxcAoB5Q+g6VdQ4Sg
         aEp3ikrD7YP/MDtXOOmeEVzImf0yK/huHnqOzykOnySKCwrPWIW2f6Lj/Da0URejTkH/
         R5neG9RKgTuO7EzPs7WWBb5RMEOuRpZ7kYQX91zfSg4bFA8z4J70dNteCnN8J2v4MKB9
         9nD7fpY2OM8Lgx0QkYtDK3V/ypbeWlCsbzsW3aoRh2tlVYWWj5vl8vfo59zNqistGThL
         X4LeSOtHh+lpeIaZCbzes55o0sZcBUMUUy7YLfV1NHtBPIvRT1/g2oXmKMX/X7bT4mpi
         XIrw==
X-Gm-Message-State: AOAM531+bY5f/0R5MIER3UetEYBf+dNzbIKPyx3WC15QU5wMpX1udHso
        RDzyNzwtyUL7V2JSttwPseA=
X-Google-Smtp-Source: ABdhPJxvq+HAvChoc1/EnB92mPvCRlpuvwfmJ9QzOfN9qS0JkdMuVk0zMD6p034f/W2/8PDdj7lN+g==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr3792282wmc.126.1633082775419;
        Fri, 01 Oct 2021 03:06:15 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:15 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 02/28] dma-buf: add dma_resv_for_each_fence
Date:   Fri,  1 Oct 2021 12:05:44 +0200
Message-Id: <20211001100610.2899-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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
index 3cbcf66a137e..a104197d12b5 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -423,6 +423,52 @@ struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
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

