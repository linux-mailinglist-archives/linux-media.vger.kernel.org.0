Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA333AB225
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbhFQLSM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhFQLSL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:11 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F218C06175F
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id i13so3441417edb.9
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QwbcxXanDdJ2d4Tkh7MSwWgLm8MXgHEgQcVtF2+fnXw=;
        b=VYiAdSUpabrYQxf/5Q9T9pzoosNfxKvvcYCOU4N8CAnT20jv3liLa6tXKxAWjn+3mf
         R3B6EhnU3ZmJuBekc3jgyDFtLzhTToIALdmCxhSGuElsXa6UMaG+WmnDbW97yHjCAHvy
         vXKWiJAH2r8MMubZsa1j2raBZwiq3NaGcGHgYD3TPYZ+CJI63DkgRziX2d5SnWg1XCUC
         RpolG01ErVrQyhLwONH6/nHD+v4mpjaTfbhq9g1rnN1QZYITrBz/J2SY/IQ/S3n+gJm/
         PPnMVi/UrpOFoV6bMwkSej5QEouZS5Wjc/4FKOiuW6oH9Dr/8IXuNdasW5C3/j3ng9tu
         WHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QwbcxXanDdJ2d4Tkh7MSwWgLm8MXgHEgQcVtF2+fnXw=;
        b=qf4x0mUygM2WiwFCYcpdIIu9PWHwpZRD+B9BFYN88No0Vohzv7vqlmakThDIeJL7rT
         xhwz29+I0A9UKED/cdy0hd75y2+Aza0bSYg9g/cEtqp7Fk2TVEZodDW+M95ATL93Wi7N
         M+UClpSRfW9OHocI4MI0xdHCZbI02N+lTVmFyZtwh01nvf5pKL4fwEjT3NSyMeeDphhD
         4fHv8+iflppMrPfzuSaBckBnmmmHxblXvUv47QDmdMQGoja/5JbsrTBOpXqquKBCf3Yb
         7YHemUtpYDcJ64czX0tDZO4XVvP0IB9iF1VikawEe11FuQT60ZCOcXvE7VF+eLfq0jGs
         pNTg==
X-Gm-Message-State: AOAM532soFskb7yQp//GV54j2g143CJbIJuMK2DWv8z1j0zAgApa0GKV
        j5NdH79CBLf+gkdLW+FyhRc=
X-Google-Smtp-Source: ABdhPJxsAeGOMGrsWEzYAP//DCSm6c2fQOCh4HCYpn8G3v0EwED6DXWAj+I/4zQHTmQdWvI14JPyOA==
X-Received: by 2002:a05:6402:11d3:: with SMTP id j19mr5782846edw.247.1623928562743;
        Thu, 17 Jun 2021 04:16:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:02 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 02/16] dma-buf: add dma_resv_for_each_fence
Date:   Thu, 17 Jun 2021 13:15:44 +0200
Message-Id: <20210617111558.28486-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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
index d8da8a914b07..a0386cf5824c 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -316,6 +316,44 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
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
index 74775f2cb679..84de4dff4ecc 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -91,6 +91,21 @@ struct dma_resv_cursor {
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
@@ -305,6 +320,9 @@ void dma_resv_fini(struct dma_resv *obj);
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

