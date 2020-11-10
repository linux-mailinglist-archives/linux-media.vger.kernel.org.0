Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8702ACC1B
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 04:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731829AbgKJDuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 22:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731497AbgKJDtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 22:49:47 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222B2C0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 19:49:47 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id e7so10142145pfn.12
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 19:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P68wKVWfyCPNBm8l+XiI7Y585elPVzN5iuk0IO/H+/E=;
        b=ufp302/IxJQeNPSAn/oG0B7slHsqXLhIaqrxmacDetxK4DKaSaXiaobRRXokmFt6qm
         qVBiUCq58nepS2WX6lx6AMUPPLdPRlE2cNrSjCWFYvv2bj+5PPwPdcJh4X2ARgdmdmtS
         uB+tiGJJjTHY0lghPGMJNNEQx61kN+m4u8NAcC56BhD8qV3KJGIHmuMhMwY+mXT/A5eD
         zZy41bECU/98xAKE8mzxpQGAqcK3y6nn7i55dYt12X38Jd4KsuckJ5VDvGHYGiwqp+vb
         TbPk9/DtMWP8D/E5FIwOvq9LyZX+SG/oVSVIwNtOV9bOTQrK7X4jY7Htq/DpEjxjCKPh
         TYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P68wKVWfyCPNBm8l+XiI7Y585elPVzN5iuk0IO/H+/E=;
        b=i5Sw7rCO7zRA8MOBdsXK3Xnrk5gc6PPs/bXGXYEGC9O83NiQBWbAn5S015Jq1lAFAL
         vPP9S7v95ULFxrcg7BIAgEGksbK94jfvlIHavI7G2g+SNCMV8RIGjNKm69NsXl2mHvud
         igBS0+Zbql4gsIQSrFOo52mtfiSEHsUMdzWkzPKsqzy6NDGaoTbxT5s1ebfJ39MVTQRf
         iDZFf+/H9F+sEp8ULb9OPfhzrFyl4fcMR7Ol7+A45b9GW7ZWKe4sjHDFRwXS+IUjTvYU
         LIkDcY+bR7GKyXqOmys8Ll+CNEw9ro3W1PDzDqBdZlU/O+lmSUvYCeD/R8lb3OjUdBt6
         NFxw==
X-Gm-Message-State: AOAM530IAEDFlBE3bp8QvaQxpHH09drwpp7H2JuonNfgZo3R0rx6IjFQ
        TFCTcxJ93PB/feJ4Aj7zZ0ZNDA==
X-Google-Smtp-Source: ABdhPJy3C6z8WgvKfa3+iIExPXU/G5Au0PlnF8H64NrwiW6423OfMKUtvdYTjtKk3kZruKsUbgxHxw==
X-Received: by 2002:a17:90a:fe07:: with SMTP id ck7mr2868620pjb.212.1604980186664;
        Mon, 09 Nov 2020 19:49:46 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id b4sm12380693pfi.208.2020.11.09.19.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 19:49:45 -0800 (PST)
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
Subject: [PATCH v5 6/7] dma-buf: dma-heap: Keep track of the heap device struct
Date:   Tue, 10 Nov 2020 03:49:33 +0000
Message-Id: <20201110034934.70898-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201110034934.70898-1-john.stultz@linaro.org>
References: <20201110034934.70898-1-john.stultz@linaro.org>
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

