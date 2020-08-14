Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2462444FC
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 08:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbgHNGZD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 02:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgHNGZC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 02:25:02 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78E1C061757
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 23:25:02 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y10so2158795plr.11
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 23:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=pwDOHGKYvCi61mHFneVF0EduuTKfnrQsk03HbkNHX20=;
        b=dOPsv7f/wEuHeXmKjjFDeLAv02B1ounW5ulazhQV8hHqRYaoJ6XQBCnvtser32aA0E
         lgWuqqXH8kA0synMTCgHcFY7N2wuxSKoFOHOV6kqBkcKr5CSJ0fDOOolLuankz4PSiHm
         g+oRPe6gRdVqcAEnDUy6PIBRaTLR1LZZEGpxq4/ei7DQd0f9nkuuUli4Irvpx6e132Ev
         KKUCcTypG0YxXTabLVsyduvK5KJXFsR2GNAFoPL+SZGzbV9iiCoUhTMcAOa0EfqUFfJT
         LfhJ8/iUXz/Nfy9Wl7PPWVm2+2qUjp++JKg7RGAM5d8BbrjLDB9TujIrQQZgqMVHr1gt
         0Mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pwDOHGKYvCi61mHFneVF0EduuTKfnrQsk03HbkNHX20=;
        b=NJcW+Spu1ylrjMuzj+ftpAMvJxTVJ6z6PAhHpzyd2tVxoO1uFOj+n1pfL3dp2V62cs
         Ea64Bn7+qy7xwk3AvF9n4w9XAlsF+i1i8pzmOltJ63o5prM6Ig7d9/hWtGTI5WD7D1MG
         hdcgNv7i9mshGzJ5Ftx18oik/PH7e/QXEfn8KEr8Q3g8HWLt+eCxeTbMk+MdFQh+oXk8
         7wvu1Xu8KqBdamlRdcduIZFQjc4VNPekbRHyo5y031WzoliDMKNTse5lNjS3VgLPf4kx
         E1bbmggDNCXYqi/Doj5gRUXojICcwIyJEHO3uIhKjmZHwXj2NFswyFUqS6W9229I2COr
         VkGQ==
X-Gm-Message-State: AOAM531CTvs3WV3fc6zjPQTb5mvEeVBR0uD+YuIWWnlgNc2hrA+JkrkF
        mh0V2O6CWrYpJkVYHgrhjCTTYA==
X-Google-Smtp-Source: ABdhPJxnGWB4G0BauuF1CXzPhUUlFpGdCXVBwviMTN5qRwfvr9KZRSe4Mu5Ey8K87w5P6jwDUx+ihA==
X-Received: by 2002:a17:90b:1254:: with SMTP id gx20mr1133241pjb.117.1597386302081;
        Thu, 13 Aug 2020 23:25:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id z4sm7651496pfb.55.2020.08.13.23.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 23:25:01 -0700 (PDT)
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
        Robin Murphy <robin.murphy@arm.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH v2 1/2] dma-heap: Keep track of the heap device struct
Date:   Fri, 14 Aug 2020 06:24:57 +0000
Message-Id: <20200814062458.53049-1-john.stultz@linaro.org>
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
Cc: Robin Murphy <robin.murphy@arm.com>
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

