Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBEF45A53C
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237907AbhKWOYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237868AbhKWOYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:38 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62945C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:30 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 137so15356761wma.1
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6H/ngFKC9poxGUW/buF3Z6IUXcBgboVM+XR0Uqd9ot8=;
        b=M4/xhPjOBKzleBS57cpHfNRoq3nzkZDtU3rcnNA5M7yoqTW/GkLN3Go0GFKYwFwe8V
         pWfW1D9Qq2Uiy8eVugNtps+xEdeYlycLSKNtEPPtjWNxEUIIYLuQZW0+4YAYfONPLeZE
         UrTkTO9uGFHcyNU3a56i6EETimPyNUoHvmNKAy3dg9gWr6keZw/8gCTNo7QSwB9ddfZJ
         qQnEgmFZxZxOtin+uZxgd1Y8WIWINAxRobeiiFVibIpNN1WoZPPxp3rqS9WEzzveNPae
         ITBBAf+RRaR2xVVkR7S4jbF0fE8VnRJYaOLUnVGrXFjjSIbZNHg/HAXDxZte9CzyNG6r
         H/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6H/ngFKC9poxGUW/buF3Z6IUXcBgboVM+XR0Uqd9ot8=;
        b=6xwU1FHU5DC/MwwLeJKxeADt744AKUBcz9jggkiCW89FjSFnPKqWJpUO8T+X6hXABt
         zH/DFWi8fk0lqIZoib55g5lUCZ3lOGiAFAt5YqG0CeDQzwzWajGnmtoPG4LYaPK7mcl3
         2f/KT40WJO8P6C1YsR1SSblabCsCepPrWHK47yQZjSSebd2PBVH3sadMAxPiNShE28Jt
         Zd3QwXGPEqMbfTp2aD94wTyALzKTBsYpIw7fQbbT7lrFhp+mJMvdnFb3/2sff5SaNheV
         mvHHnClumaQO8AkAousA1mQYTHLo51bgXp/0g9RLeb+f81SoYT/WuOOVd38veWCAap8b
         SRaA==
X-Gm-Message-State: AOAM530GUwcB0bbm8PlnigsgGe9sLtZ4x34FTpD6C33VTKQNSgAOfVss
        6PSMeyK0+9iT/jf33Gu8hteDuq2kxFA=
X-Google-Smtp-Source: ABdhPJxXb7SYBCRj2Ub2g+4sXnWVWktbYjdK81QMPFY4KhRBrf8naWsp1xWADtOextjGaVzR61Wo8A==
X-Received: by 2002:a1c:2685:: with SMTP id m127mr3661518wmm.42.1637677289034;
        Tue, 23 Nov 2021 06:21:29 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:28 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 08/26] dma-buf: add dma_resv_get_singleton
Date:   Tue, 23 Nov 2021 15:20:53 +0100
Message-Id: <20211123142111.3885-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a function to simplify getting a single fence for all the fences in
the dma_resv object.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 50 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-resv.h   |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 0a69f4b7e6b5..f91ca023b550 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -34,6 +34,7 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-array.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
@@ -721,6 +722,55 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
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
index 09b676b87c35..082f77b7bc63 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -440,6 +440,8 @@ void dma_resv_prune(struct dma_resv *obj);
 void dma_resv_prune_unlocked(struct dma_resv *obj);
 int dma_resv_get_fences(struct dma_resv *obj, bool write,
 			unsigned int *num_fences, struct dma_fence ***fences);
+int dma_resv_get_singleton(struct dma_resv *obj, bool write,
+			   struct dma_fence **fence);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
-- 
2.25.1

