Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C95290FEA
	for <lists+linux-media@lfdr.de>; Sat, 17 Oct 2020 08:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437011AbgJQGCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Oct 2020 02:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436582AbgJQGBi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Oct 2020 02:01:38 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C71FC0613BB
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 18:33:15 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a17so2289054pju.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 18:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P68wKVWfyCPNBm8l+XiI7Y585elPVzN5iuk0IO/H+/E=;
        b=bdWzJhf+Kt74SwdjGClZiLTK6Liqdc61K8jTehvBvcFdqmcILzkkCu6ynV2hBRrVEu
         1pRQZehRxNgqVrBa+pMecr5Dr5+lqyMsuF9ucnzNvuTHw6CYBI5fUrMj2ZPC1UISlEk3
         vLSJokv2OQC/BD4QC9wF367LFkQRvq06c0vFklyVkA+BJQHi0RBeH04qnblM6/0wWzzG
         6ZR1WV9D+zUofDWUzH14k1P3gCaQQA2uWDojbYTMR6x+otkXIYbKyvhQxxUm0gOS/xbS
         cRYRiVFLPRMQtjWVoUAm9wKpGrsUL/6T1fVEeBTIzDsoNW/by0HXALYNmTPMIN3ewHq/
         Q38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P68wKVWfyCPNBm8l+XiI7Y585elPVzN5iuk0IO/H+/E=;
        b=ThvwgUPhesmFX8hNJ8n9eQDKjg+Gg4vjY7hfgQSctz+/zuQSARnzZzvVCtfAjxfYpi
         qz4SxzNLmhyuqwvLwRxV0wdb5+rJXtKl/3hSu+FnIPJ6xgcznDMFbOa93txs/88xIff2
         cKoR/TnO8omd9fpxhdqJbuu/7hp2xwlmWz80cw9Pxohfxqa00oE7wuEIHKRYb9ZTE5Zn
         ivmHn1HKG1dKaAKXN7nmFuitzjRg6Hv6RbWgBb54zbFUZOE/ZwMYnAzLorRVgnm/4kWa
         ErbRtUAj5oB2bl/vrJexKpiYaKhc/OTMa2FM2T19K87OjFEenXabkIhEAiREcaalJ9Cr
         se+Q==
X-Gm-Message-State: AOAM531Xd7E1MOZj9OBe1AStBoJNRKgn9ssVG3m7tjPkC02dvD1VfebW
        Hf2/wyn3RjL7XMhORwYLi8qdVg==
X-Google-Smtp-Source: ABdhPJxXdKj7nSAtkG+Eczc0+aZcCvZHERtkfZGx5ovLSOefr82WKn91iVR+sj6Dnq0bOj3NmoOHFw==
X-Received: by 2002:a17:90a:8c87:: with SMTP id b7mr6918045pjo.66.1602898394682;
        Fri, 16 Oct 2020 18:33:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id e186sm4222122pfh.60.2020.10.16.18.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 18:33:14 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v4 6/7] dma-buf: dma-heap: Keep track of the heap device struct
Date:   Sat, 17 Oct 2020 01:32:54 +0000
Message-Id: <20201017013255.43568-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201017013255.43568-1-john.stultz@linaro.org>
References: <20201017013255.43568-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Keep track of the heap device struct.

This will be useful for special DMA allocations
and actions.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
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

