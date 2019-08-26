Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 259CE9D215
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 16:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732763AbfHZO5l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 10:57:41 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40056 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732718AbfHZO5j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 10:57:39 -0400
Received: by mail-wm1-f65.google.com with SMTP id c5so15986521wmb.5
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 07:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dory6iMos9l+mdyEwGPbTiqUtowdJaD3gd9QEEFvwxI=;
        b=m2Dhh3HuJShfKJ+CSaiYIChS8UGnuawoazbndF/CBXdeo2+PL9MBXpgmhSA40SIsz1
         ajNjVWaUKOAVxzmKlLB/rLXgxImiCO2WmJ74Kwq2rNoo5I2znpQt0EVEpTXBKfrnKO4k
         5oYhr8FJheeUyrNK67GJmnfytJn8WQ/UnraMMPRcSpnVXi06yDe1fIcLjoAHk9zCkO3v
         2LntgiS8MqF5852UKLT9wPNHRcW1jaAv77zu/iiHZfrMlQfOb71+uTaF/fHpRjyGK6kr
         1H6IFeMXlq0NKBSYGk9UEFWxe9BP00Y5jOyzcI5Cynu/SB/rUHNipTIp8o9bby9Gc7kJ
         /gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dory6iMos9l+mdyEwGPbTiqUtowdJaD3gd9QEEFvwxI=;
        b=kgZN2QAvh4h391WKWFT64sO/SL6bXEunwnw2LTKRG6+WD5+IoJFV10m7RZKJF7eL2f
         5PVb0PCD7pVEGKpx7BgFRc4ngxinIIk+mzvk0AKukq8B9kemeobwOU1W+oTL0AjfEHvs
         vYmbpZWfpPoEWPgVk24AUn3C0GfRpVxkdy3Fr6LMf6tMosrPNtWCoFbE7VTaySalJhxM
         VeXvIoF8i/qzghmEl7FqYym6/aTuaNATflRFYT/4j0nSmv/QefGDJep4I744si8JV3o/
         jhDAE7lLwyFKIhEMZ+hz7YXmPR3VersJwQ2fwVXpKoemdvI0wKvIlzHFe5tJ/rsnx9CF
         xobA==
X-Gm-Message-State: APjAAAVBZrg4RiQYieL18lMPICOjG7c7zzr/9tVj12X4fcY8LKZnfam3
        dY9ORCQmxCus3nJUP6uu1o0=
X-Google-Smtp-Source: APXvYqwhXrTJtyZKIS2GL7rEowiF10SZQSZs0Rr1NkojMwT7jKVx37M8QtLeMudXLnJlEvK3Ga8Seg==
X-Received: by 2002:a1c:8187:: with SMTP id c129mr21955469wmd.32.1566831457359;
        Mon, 26 Aug 2019 07:57:37 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
        by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 07:57:36 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 5/9] dma-buf: add dma_fence_array_for_each
Date:   Mon, 26 Aug 2019 16:57:27 +0200
Message-Id: <20190826145731.1725-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes it easier to extract the fences in a dma_fence_array.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 42 +++++++++++++++++++++++++++++++
 include/linux/dma-fence-array.h   | 24 ++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index ea7713b40514..3bc2663a3f30 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -276,3 +276,45 @@ bool dma_fence_match_context(struct dma_fence *fence, u64 context)
 	return true;
 }
 EXPORT_SYMBOL(dma_fence_match_context);
+
+/**
+ * dma_fence_array_first - return the first fence in an array
+ * @cursor: cursor for the current position
+ * @array: array with the fences
+ *
+ * Returns the first fence in the array or NULL if the array is empty.
+ * If the array parameter isn't a dma_fence_array return it unmodified.
+ */
+struct dma_fence *dma_fence_array_first(struct dma_fence_array_cursor *cursor,
+					struct dma_fence *array)
+{
+	cursor->array = to_dma_fence_array(array);
+	if (!cursor->array)
+		return array;
+
+	if (!cursor->array->num_fences)
+		return NULL;
+
+	cursor->index = 0;
+	return cursor->array->fences[cursor->index++];
+
+}
+EXPORT_SYMBOL(dma_fence_array_first);
+
+/**
+ * dma_fence_array_next - return the next fence in the array
+ * @cursor: cursor for the current position
+ *
+ * Returns the next fence from the array or NULL if we don't have any more
+ */
+struct dma_fence *dma_fence_array_next(struct dma_fence_array_cursor *cursor)
+{
+	if (!cursor->array)
+		return NULL;
+
+	if (cursor->index >= cursor->array->num_fences)
+		return NULL;
+
+	return cursor->array->fences[cursor->index++];
+}
+EXPORT_SYMBOL(dma_fence_array_next);
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 35d1d1e7c93b..2a71fd003dfa 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -124,4 +124,28 @@ dma_fence_array_create(int num_fences, struct dma_fence **fences, u64 context,
 
 bool dma_fence_match_context(struct dma_fence *fence, u64 context);
 
+/**
+ * struct dma_fence_array_cursor - cursor for the fences in an array
+ */
+struct dma_fence_array_cursor {
+	struct dma_fence_array *array;
+	unsigned int index;
+};
+
+struct dma_fence *dma_fence_array_first(struct dma_fence_array_cursor *cursor,
+					struct dma_fence *array);
+struct dma_fence *dma_fence_array_next(struct dma_fence_array_cursor *cursor);
+
+/**
+ * dma_fence_array_for_each - walk over all fences in a fence array
+ * @fence: the current fence
+ * @cursor: cursor for the walk
+ * @array: potentitally fence array
+ *
+ * Walk over all the fences in the array.
+ */
+#define dma_fence_array_for_each(fence, cursor, array)		\
+	for (fence = dma_fence_array_first(&(cursor), array);	\
+	     fence; fence = dma_fence_array_next(&(cursor)))
+
 #endif /* __LINUX_DMA_FENCE_ARRAY_H */
-- 
2.17.1

