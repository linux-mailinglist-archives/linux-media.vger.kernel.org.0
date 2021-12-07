Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288A346BB1F
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbhLGMhu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236377AbhLGMht (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:49 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6ABCC061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:19 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id a18so29203536wrn.6
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6AcIBFyYiDz9TRlGiyxrwcI9ljYqwbYG6/Pwbh2ETwE=;
        b=nLMhJRylYFQ1o+vqghbs9XYIOLuR7516NFBkx3whKf7eyeIlEFShoniqsfvNeCbfkU
         i8aIPhkHAfqX89Pufuwj2rAZn+PVs9WwlZAGfaikf8Hv2RhRgzaa/3Uvu04VIETLrLQc
         t/mSY8xt4aeuPrN5eEKAjigOrv6pZriLTKqHIGUgXq/HganmpRxnhhRA9QRCB093fwoU
         gpO+Wypzy6yfD6T+pDkReq6WJFqVIkn7kkHlIyA+bwtdZlrPQuJuTFfyai4aWkjYGcSp
         bG2e5PYC+3GG7F1sJL0sStLk/cIzOs66zPWF4LVj88sh58QjoWhwHFpKSr0pFU0GWgtL
         KFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6AcIBFyYiDz9TRlGiyxrwcI9ljYqwbYG6/Pwbh2ETwE=;
        b=Lf6zYIFq+R1/QeLUF0MuJaeSKlc/TWwhBjWglNW+tqFdcIduJCFSkpcLW6onB1vM/v
         dlx9pvWF5k3EZ5dSmigR609GA/hBTBAKYOlqy0X2xzbLX12J+hp2Hu/rGAQpcmuTw3dj
         vAkTonDnYWgYVBaNqAbhYyPwI40iXXCCGEU56IZsUxQLjvWL1gRXwHs3+7FDeT4g6eD9
         UMVMXoFnXZYp+RdN64y3zLp/tTDKTiMTgMh4MD7bXhCWXPYLQaOzs5gEXbxu/jygCQ5Y
         FyGulOZqRXrKiCaKwplTosJ0pq1GHPG2eywlN3GYx/NlNIUXXmF1Huw35+cUb5RWXi/3
         uKaQ==
X-Gm-Message-State: AOAM530QvJereMKxIwZBoOLNghJtC/HYiqY38eAdIKdk4YxA6aybqCzq
        ax+jiz8tDM9ounq7D+0OnnmR3MrKFeCaJw==
X-Google-Smtp-Source: ABdhPJxvH6SQRpwHRdkvErlx/XUWNc4bPOW0BP1aMMbSKlSQmbcqjwoCe+/IisCzVw/4d/H9C1sxdQ==
X-Received: by 2002:a05:6000:1564:: with SMTP id 4mr51437456wrz.9.1638880458279;
        Tue, 07 Dec 2021 04:34:18 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:17 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 04/24] dma-buf: add dma_resv_get_singleton v2
Date:   Tue,  7 Dec 2021 13:33:51 +0100
Message-Id: <20211207123411.167006-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

