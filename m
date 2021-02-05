Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFAF431065D
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbhBEIL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbhBEIHw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 03:07:52 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00908C06121E
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 00:06:39 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id x23so2318000pfn.6
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 00:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GOndOP8F+BfXNLjrSX9CtfpObuYsc9aU1JNxbRzKav4=;
        b=Nn+MlC5tKBHafRdbSa7S8DmObCjHIWlNYVXwMR2RRmFpY/1YFN/JejT9MseDX0khO/
         Piwh7OqAi92p946kQ+P8IdpWiNbpooftChpefls8Lmv9U8Q7rleVcIwXuOnqu/4BQzC+
         goprUTNEMoRlSmp6To1gKsxWw6vM72Yr5P7HEGj5Yi9M5drA9jSPHpz65qDMqWz+R6RX
         v/NGL7oFcwvXJOVn5S/LHz+ARYcnN5bywATDFLipVqQsms2hfi5V5SGE6jH3LGHk0hhg
         /aqgi5o6SNZzoeZBdlWnAv3EE3rtQ2IxAYedQIia3hiO+oABFCiB/SacNV9a2foTJouk
         GRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GOndOP8F+BfXNLjrSX9CtfpObuYsc9aU1JNxbRzKav4=;
        b=dspnbcHNC2dtZGPOzAXiljXwnJIuw1oxahl6Nkl9NYHuAmci4caXRZ1fys/HXX1yHE
         J+vwMGv5yERDwLP9NhSv0RoJajEnGlIeatkpFovHNklbSxHAgkP7Sa9LZWOdJ+z9EA9W
         H8gYWP+BsbXj4FkZTklB9Lyj5meCrJ0+dwPp0z4cmZkjLrzrOBq/zcKzqOrRTx9T8mp2
         0bKegRGT8vu2LP0esInJZMcCsQK4E74Mbz2WEUqM78rzowNWrbZJv4J4mWWZZQSjjSqN
         9Qki84ZF2eWyLMwAskQ1Kl2HhIF8UhTwJH4Em6Ud6Eoc/VNBAFty+IPKzFlouUhvLRnz
         dZ9A==
X-Gm-Message-State: AOAM532Vj1KUOgn93hFN0s2dAaEZ/PPfHJbCzyohFZz4hCfFsnKofhMd
        ciqghUnK3ok4xbwJDfeCTA9vLA==
X-Google-Smtp-Source: ABdhPJx+FpGulW/NuF4+mtl7ogJq0jqebiVtB3k4/SZDAmxf9F1Xx8HSTD5aCBfLoqE9Pbnctuk3TQ==
X-Received: by 2002:aa7:9538:0:b029:1d6:ccef:72ad with SMTP id c24-20020aa795380000b02901d6ccef72admr3319521pfp.64.1612512399559;
        Fri, 05 Feb 2021 00:06:39 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 32sm9520070pgq.80.2021.02.05.00.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:06:38 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian Koenig <christian.koenig@amd.com>,
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
Subject: [RFC][PATCH v6 7/7] dma-buf: system_heap: Add deferred freeing to the system heap
Date:   Fri,  5 Feb 2021 08:06:21 +0000
Message-Id: <20210205080621.3102035-8-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205080621.3102035-1-john.stultz@linaro.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
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
Cc: Christian Koenig <christian.koenig@amd.com>
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
 drivers/dma-buf/heaps/system_heap.c | 31 ++++++++++++++++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 7e28934e0def..10632ccfb4a5 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -5,6 +5,7 @@ config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
 	select DRM_PAGE_POOL
+	select DMABUF_HEAPS_DEFERRED_FREE
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 6d39e9f32e36..042244407db5 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -22,6 +22,7 @@
 #include <linux/vmalloc.h>
 
 #include <drm/page_pool.h>
+#include "deferred-free-helper.h"
 
 static struct dma_heap *sys_heap;
 
@@ -33,6 +34,7 @@ struct system_heap_buffer {
 	struct sg_table sg_table;
 	int vmap_cnt;
 	void *vaddr;
+	struct deferred_freelist_item deferred_free;
 };
 
 struct dma_heap_attachment {
@@ -308,30 +310,45 @@ static int system_heap_zero_buffer(struct system_heap_buffer *buffer)
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
+			drm_page_pool_add(pools[j], page);
 		}
-		drm_page_pool_add(pools[j], page);
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
2.25.1

