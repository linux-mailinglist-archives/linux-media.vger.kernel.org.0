Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B710C461646
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbhK2N3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:29:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240084AbhK2N1N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:27:13 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9080CC09B05B
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:11 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id l16so36249112wrp.11
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6AcIBFyYiDz9TRlGiyxrwcI9ljYqwbYG6/Pwbh2ETwE=;
        b=TdRsP8iCJo2IHFSFvo7K9yfGR4NULK1xGumbieOyuHPWp69FprJgXUjY8wec3jLrFH
         eJuLHGvb5pF1u7S4EXZAdgT8c1lsKTzc80OaZV3yNsUHg/PeGYHb5Uv23E4epMNxX0bC
         bXWR/iWOLWMg/SpnmOmk+kmu1E+VddY7tVjHk4jrUDwy2Xd9fm1zYyMLjspXti4Y32fj
         8drNBqdR16igm/emGDwMEaZS6YRmc/tKT7qwBUeQmGSkRekpTkGVZI0KunhydOjZzw4M
         tTqSaeir+pIOQfdbDQFNJhpanZQuH84ZECu/HUI0UCtjE/1vrLC3xS704krJYD9ar2TD
         kBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6AcIBFyYiDz9TRlGiyxrwcI9ljYqwbYG6/Pwbh2ETwE=;
        b=6j/J+VVu+lc+FkYfNTR51yL8IjGgrk3ozD9AHGu+Ckyvs0GW7Pec9OHPGHz+zYJsNK
         QJ+PVnnIzZSATCRJKOjuP7cm2CsFnTzjHNzpaA7NS0CY9cJKd4aKrLK4ASNNPqkKOeEo
         nVuf2sng1dbbNvKc6KLFL9xzW4LKZogXJ91ecBNpHa8w/WpeJGLcDusR8Yk34T06Fc6R
         wYx0xtD3Lw1nZVdkHwID1IGCzUhDRtDoDAoIHxEfOjxti8PGYZDFqxeZxQNR/KIqF7ly
         aqVGi9QiX6k974cnZuW1Qukw80aPAoZ9zdVaK8P71qIYn3VQnpf6kLmoJoJLF00UDqxM
         1qxA==
X-Gm-Message-State: AOAM530czr6/Nv6Kx+l/nUHMvkiqezAtL6RCCfbkXLm9k/aCj3uFVYgx
        ArePF4FOQNWclfHGtnNHx9w=
X-Google-Smtp-Source: ABdhPJybnk67gP2iTmueOltDIky3wv5MJpDuaPFOAyThlF5UK7AISycgT9cnZepuObF2CKwjX2vHKg==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr34901850wrv.310.1638187630147;
        Mon, 29 Nov 2021 04:07:10 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:09 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 08/28] dma-buf: add dma_resv_get_singleton v2
Date:   Mon, 29 Nov 2021 13:06:39 +0100
Message-Id: <20211129120659.1815-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a function to simplify getting a single fence for all the fences in
the dma_resv object.

v2: fix ref leak in error handling

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 52 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |  2 ++
 2 files changed, 54 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 480c305554a1..694716a3d66d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -34,6 +34,7 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-array.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
@@ -657,6 +658,57 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 
+/**
+ * dma_resv_get_singleton - Get a single fence for all the fences
+ * @obj: the reservation object
+ * @write: true if we should return all fences
+ * @fence: the resulting fence
+ *
+ * Get a single fence representing all the fences inside the resv object.
+ * Returns either 0 for success or -ENOMEM.
+ *
+ * Warning: This can't be used like this when adding the fence back to the resv
+ * object since that can lead to stack corruption when finalizing the
+ * dma_fence_array.
+ */
+int dma_resv_get_singleton(struct dma_resv *obj, bool write,
+			   struct dma_fence **fence)
+{
+	struct dma_fence_array *array;
+	struct dma_fence **fences;
+	unsigned count;
+	int r;
+
+	r = dma_resv_get_fences(obj, write, &count, &fences);
+        if (r)
+		return r;
+
+	if (count == 0) {
+		*fence = NULL;
+		return 0;
+	}
+
+	if (count == 1) {
+		*fence = fences[0];
+		kfree(fences);
+		return 0;
+	}
+
+	array = dma_fence_array_create(count, fences,
+				       dma_fence_context_alloc(1),
+				       1, false);
+	if (!array) {
+		while (count--)
+			dma_fence_put(fences[count]);
+		kfree(fences);
+		return -ENOMEM;
+	}
+
+	*fence = &array->base;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
+
 /**
  * dma_resv_wait_timeout - Wait on reservation's objects
  * shared and/or exclusive fences.
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index fa2002939b19..cdfbbda6f600 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -438,6 +438,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 int dma_resv_get_fences(struct dma_resv *obj, bool write,
 			unsigned int *num_fences, struct dma_fence ***fences);
+int dma_resv_get_singleton(struct dma_resv *obj, bool write,
+			   struct dma_fence **fence);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
-- 
2.25.1

