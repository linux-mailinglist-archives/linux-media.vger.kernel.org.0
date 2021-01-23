Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA023012DA
	for <lists+linux-media@lfdr.de>; Sat, 23 Jan 2021 04:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbhAWDsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 22:48:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbhAWDrn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 22:47:43 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09438C06178B
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 19:47:03 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id u11so4360584plg.13
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 19:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NeU+sbXmljaYFeP3l6UlIJg8urIJG4eKqAQWq4YMm7Q=;
        b=WnxuHG+58B7ObL97OX1lcKW9Hk6NeIHCjNLj+Ln4wJsoDeIQbBP+2ByXlvfZxdp6xM
         ZHm3dS++P7X/juDRpoRnVOs0+6P0DE/MLFMnFT+oG23Y2K+iDsKR1IqSXz50WqwNLXrW
         kc8oy2ktygL6toj6sEVnLbt/YzPbduFQAvMvfJWGL9Y19Os79LYUZkD+vum4PHTIZ9f9
         LawLrkgE7NuSJ9/Pmb2fkpeWzn3k2SIDnK1MsF3/sHRAvqXGygs4L1hd7DocUguZpid5
         cnYdR20sbtKRuHIyD3eTOjXgWNMHabLZkKYmh20fZBkdsFl6m0tC8YWSw9nyfLchkhQu
         S8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NeU+sbXmljaYFeP3l6UlIJg8urIJG4eKqAQWq4YMm7Q=;
        b=CKVfQkQ6VH7KXcINsIFSRcb4j0AYXjjzommf4+GwC5kmiDuywnlHB1U7490ypBnfVZ
         R2PL5p1vx4kzAjtWKoI0+5D971iP7PaUywPr7oQniU19sD1BFoCia12NPpO84qv+XJwT
         1DCr2ppGFGlT1++kqTDh+//FhRBRmtkfl+ltG/7sJDg79FJy39BdbPRUCN2f90G6x6aS
         92I7UmedcQr2jgUT0drq3kZGwTKzI6vwxas6+kC8P7j77GYMHclBN18tyMHVY+A58LwF
         xWKkvE+4KwYKFjrPxJZY0UbXFu88QNufNyvcowrAIv4OHLayRVygFHhNMxtkzc79VE60
         DMiw==
X-Gm-Message-State: AOAM531f+W7NedMCC2Vq5z99WkiDUmE7eARUM+SzaXCDK9N3mulw3cN8
        NYuF9JJ3huXdWDWw65w8+cD8dA==
X-Google-Smtp-Source: ABdhPJxIYWGLWs4iE8DbmMqeyBbwTuBXL43v1z7ZqgX+FHaaaJjZZAx1y0u7UHKgbJEkz+l0gMljOA==
X-Received: by 2002:a17:90b:4c0b:: with SMTP id na11mr2604106pjb.45.1611373622594;
        Fri, 22 Jan 2021 19:47:02 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id q24sm10316702pfs.72.2021.01.22.19.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 19:47:01 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] dma-buf: system_heap: Add deferred freeing to the system heap
Date:   Sat, 23 Jan 2021 03:46:55 +0000
Message-Id: <20210123034655.102813-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210123034655.102813-1-john.stultz@linaro.org>
References: <20210123034655.102813-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Utilize the deferred free helper library in the system heap.

This provides a nice performance bump and puts the
system heap performance on par with ION.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
* Rework deferred-free api to use reason enum as suggested by
  Suren Baghdasaryan
---
 drivers/dma-buf/heaps/Kconfig       |  1 +
 drivers/dma-buf/heaps/system_heap.c | 32 ++++++++++++++++++++++-------
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 748e840e6edd..3f4d7b949301 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -6,6 +6,7 @@ config DMABUF_HEAPS_SYSTEM
 	depends on DMABUF_HEAPS
 	select NET
 	select PAGE_POOL
+	select DMABUF_HEAPS_DEFERRED_FREE
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 885e30894b77..747fa2250e84 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -22,6 +22,8 @@
 #include <linux/vmalloc.h>
 #include <net/page_pool.h>
 
+#include "deferred-free-helper.h"
+
 static struct dma_heap *sys_heap;
 
 struct system_heap_buffer {
@@ -32,6 +34,7 @@ struct system_heap_buffer {
 	struct sg_table sg_table;
 	int vmap_cnt;
 	void *vaddr;
+	struct deferred_freelist_item deferred_free;
 };
 
 struct dma_heap_attachment {
@@ -317,30 +320,45 @@ static int system_heap_zero_buffer(struct system_heap_buffer *buffer)
 	return ret;
 }
 
-static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
+static void system_heap_buf_free(struct deferred_freelist_item *item,
+				 enum df_reason reason)
 {
-	struct system_heap_buffer *buffer = dmabuf->priv;
+	struct system_heap_buffer *buffer;
 	struct sg_table *table;
 	struct scatterlist *sg;
 	int i, j;
 
+	buffer = container_of(item, struct system_heap_buffer, deferred_free);
 	/* Zero the buffer pages before adding back to the pool */
-	system_heap_zero_buffer(buffer);
+	if (reason == DF_NORMAL)
+		if (system_heap_zero_buffer(buffer))
+			reason = DF_UNDER_PRESSURE; // On failure, just free
 
 	table = &buffer->sg_table;
 	for_each_sg(table->sgl, sg, table->nents, i) {
 		struct page *page = sg_page(sg);
 
-		for (j = 0; j < NUM_ORDERS; j++) {
-			if (compound_order(page) == orders[j])
-				break;
+		if (reason == DF_UNDER_PRESSURE) {
+			__free_pages(page, compound_order(page));
+		} else {
+			for (j = 0; j < NUM_ORDERS; j++) {
+				if (compound_order(page) == orders[j])
+					break;
+			}
+			page_pool_put_full_page(pools[j], page, false);
 		}
-		page_pool_put_full_page(pools[j], page, false);
 	}
 	sg_free_table(table);
 	kfree(buffer);
 }
 
+static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+
+	deferred_free(&buffer->deferred_free, system_heap_buf_free, buffer->len);
+}
+
 static const struct dma_buf_ops system_heap_buf_ops = {
 	.attach = system_heap_attach,
 	.detach = system_heap_detach,
-- 
2.17.1

