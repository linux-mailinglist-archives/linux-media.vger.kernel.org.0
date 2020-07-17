Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6EDF223039
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 03:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgGQBKW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 21:10:22 -0400
Received: from mx.socionext.com ([202.248.49.38]:6309 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726394AbgGQBKV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 21:10:21 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 17 Jul 2020 10:10:19 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id 9C3A3180117;
        Fri, 17 Jul 2020 10:10:18 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 17 Jul 2020 10:10:18 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 3A0A61A0509;
        Fri, 17 Jul 2020 10:10:18 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH] dma-buf: heaps: Introduce dma_heap_add_cma() for non-default CMA heap
Date:   Fri, 17 Jul 2020 10:10:08 +0900
Message-Id: <1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current dma-buf heaps can handle only default CMA. This introduces
dma_heap_add_cma() function to attach CMA heaps that belongs to a device.

At first, the driver calls of_reserved_mem_device_init() to set
memory-region property associated with reserved-memory defined as CMA
to the device. And when the driver calls this dma_heap_add_cma(),
the CMA will be added to dma-buf heaps.

For example, prepare CMA node named "linux,cma@10000000" and
specify the node for memory-region property. After the above calls
in the driver, a device file "/dev/dma_heap/linux,cma@10000000"
associated with the CMA become available as dma-buf heaps.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 12 ++++++++++++
 include/linux/dma-heap.h         |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 626cf7f..5d2442e 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -162,6 +162,18 @@ static int __add_cma_heap(struct cma *cma, void *data)
 	return 0;
 }
 
+/* add device CMA heap to dmabuf heaps */
+int dma_heap_add_cma(struct device *dev)
+{
+	struct cma *cma = dev_get_cma_area(dev);
+
+	if (!cma)
+		return -ENOMEM;
+
+	return __add_cma_heap(cma, NULL);
+}
+EXPORT_SYMBOL_GPL(dma_heap_add_cma);
+
 static int add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 454e354..16bec7d 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -56,4 +56,13 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
  */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+#ifdef CONFIG_DMABUF_HEAPS_CMA
+/**
+ * dma_heap_add_cma - adds a device CMA heap to dmabuf heaps
+ * @dev:	device with a CMA heap to register
+ */
+int dma_heap_add_cma(struct device *dev);
+
+#endif /* CONFIG_DMABUF_HEAPS_CMA */
+
 #endif /* _DMA_HEAPS_H */
-- 
2.7.4

