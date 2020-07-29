Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5C3E2318FA
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 07:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgG2FQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 01:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgG2FQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 01:16:36 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AA4C061794
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 22:16:36 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id j20so12335939pfe.5
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 22:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=My6wF6wOxqWj2vALiGYVdW12dpuklXn0QP6e45LDC3s=;
        b=GOVvyPJrrzTENjpKfVrZdIbthAOLEx6ZdUkeA8AsNXmYcZSCezeV/a7NZph8KJg9lV
         KLp/96aECmBQWbGb8QkDg5Dgs8G3J5GU1aMyKkD6lsebcCL60fVBIt5k1jsv0jKfwY6x
         pGJc1byXU2528vl1cc8a6Xdwh1vfkSlqrrrH7Nv4IOFITe1mqLQZJsatxv+rDG5ql2gH
         lWRZiydsRYcB8xIFbxcGKrYL3Wjckwzhy3G5myt0C5oPNJ78lOHLUR3t0o4yK9s02NLG
         huThtxkDGcCHQVDat0vPT5xmLzEqFaZwU/qbCfgdlFg9JgXL4h3bDHHJnza+jypHRzCm
         IySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=My6wF6wOxqWj2vALiGYVdW12dpuklXn0QP6e45LDC3s=;
        b=FKgGDKb56JXwna2mKOEHEN3KW6mPK9rhJky3iQHOBUjr1Rw4wnd3Ijz8dDcG2MYxKA
         1z7UrAvlo3JDAU75Ujzc+Lrq9sgOZVa3k6MoyJlFaPlLVaXj8nttBtbinById9vxk+rz
         hu8FnyS4OZ/92WC74+Yr9Che9qBpVtTytruttydbrR9RX3ELWkaPdCREixT1opNyR5Us
         SnXDiVscvyu/CSzve4rQ/XGB+Zuo/fmBKdkAA5EkbyY7SupJv6rOhL5faY2lJTKowfsU
         6nDjUUNtUTTugu575VKUtpUJOoMfn5JmnZLwnO5hWhXQLOuAK3oVg72kfjD6DPuaUSqd
         z/4A==
X-Gm-Message-State: AOAM533elgNN8F5TgUGObScQ8h+b3qtaCJvXW63slY42JmzOInJgzA+T
        nPxIl1Z5AlQLCYMFgMPL30mPfA==
X-Google-Smtp-Source: ABdhPJzjtXLQSVD/yUHzhnR26tU6d+mXoVKd/tt4jhYhnke8xXlPicXlGuSoe1HGuATXGGRwJwcK4A==
X-Received: by 2002:a62:7c87:: with SMTP id x129mr9289795pfc.165.1595999795532;
        Tue, 28 Jul 2020 22:16:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id q5sm762750pgv.1.2020.07.28.22.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 22:16:35 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 1/2] dma-heap: Keep track of the heap device struct
Date:   Wed, 29 Jul 2020 05:16:31 +0000
Message-Id: <20200729051632.66040-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Keep track of the heap device struct.

This will be useful for special DMA allocations
and actions.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Andrew F. Davis <afd@ti.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/dma-heap.c | 33 +++++++++++++++++++++++++--------
 include/linux/dma-heap.h   |  9 +++++++++
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index afd22c9dbdcf..72c746755d89 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -30,6 +30,7 @@
  * @heap_devt		heap device node
  * @list		list head connecting to list of heaps
  * @heap_cdev		heap char device
+ * @heap_dev		heap device struct
  *
  * Represents a heap of memory from which buffers can be made.
  */
@@ -40,6 +41,7 @@ struct dma_heap {
 	dev_t heap_devt;
 	struct list_head list;
 	struct cdev heap_cdev;
+	struct device *heap_dev;
 };
 
 static LIST_HEAD(heap_list);
@@ -190,10 +192,21 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 	return heap->priv;
 }
 
+/**
+ * dma_heap_get_dev() - get device struct for the heap
+ * @heap: DMA-Heap to retrieve device struct from
+ *
+ * Returns:
+ * The device struct for the heap.
+ */
+struct device *dma_heap_get_dev(struct dma_heap *heap)
+{
+	return heap->heap_dev;
+}
+
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
-	struct device *dev_ret;
 	unsigned int minor;
 	int ret;
 
@@ -247,16 +260,20 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 		goto err1;
 	}
 
-	dev_ret = device_create(dma_heap_class,
-				NULL,
-				heap->heap_devt,
-				NULL,
-				heap->name);
-	if (IS_ERR(dev_ret)) {
+	heap->heap_dev = device_create(dma_heap_class,
+				       NULL,
+				       heap->heap_devt,
+				       NULL,
+				       heap->name);
+	if (IS_ERR(heap->heap_dev)) {
 		pr_err("dma_heap: Unable to create device\n");
-		err_ret = ERR_CAST(dev_ret);
+		err_ret = ERR_CAST(heap->heap_dev);
 		goto err2;
 	}
+
+	/* Make sure it doesn't disappear on us */
+	heap->heap_dev = get_device(heap->heap_dev);
+
 	/* Add heap to the list */
 	mutex_lock(&heap_list_lock);
 	list_add(&heap->list, &heap_list);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 454e354d1ffb..82857e096910 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -50,6 +50,15 @@ struct dma_heap_export_info {
  */
 void *dma_heap_get_drvdata(struct dma_heap *heap);
 
+/**
+ * dma_heap_get_dev() - get device struct for the heap
+ * @heap: DMA-Heap to retrieve device struct from
+ *
+ * Returns:
+ * The device struct for the heap.
+ */
+struct device *dma_heap_get_dev(struct dma_heap *heap);
+
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
  * @exp_info:		information needed to register this heap
-- 
2.17.1

