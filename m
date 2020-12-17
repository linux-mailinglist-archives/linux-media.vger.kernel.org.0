Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8063E2DDBC5
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 00:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732310AbgLQXHC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 18:07:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732289AbgLQXHC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 18:07:02 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB35C061282
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 15:06:21 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id m5so255063pjv.5
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 15:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZzUxY+R92iIXyCaBsOADIATzq/kMO3WIktPOvJAEK0M=;
        b=y1i+MP6nxpUZku2pqBjU6nVReMMru3TqzVPCs9Wr2kawDgT3Rbl6Z27FslcSz46Swe
         xoVAHosAGhjI7aOnPsLsxEeZ7xNxfB46hHlFFGpTJRIPhP1Np8JzTR82OcbK/gEjpSJS
         cowRVeZibs33LWNdWONpxXfhSrlzipytxorMjEG484XY0t/NKnT3vgmrxMO5bzs6bzQE
         7YZiocAFGQ2ffjZuuW6Bip4QglPBceU2BnKI11qLp0EDtQMiJsfKq2v2ku0CzTTA+rky
         rGyzmZKB0g5JCTB2WXhE94V1kA53PIShCIbmffIEiIj1LCnDYFb8baE8V4CcmGvT4ii7
         K+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZzUxY+R92iIXyCaBsOADIATzq/kMO3WIktPOvJAEK0M=;
        b=R04lkqI6k6t2Ijvf0j8+NggjRh+02X+WA4F6il6hGUglJiWgWgZB09VTSSFI83GOfD
         x+4H4p+pjoNOriRQ/EGcxPd76owQe1/4ozXQ97xsi+L3qOJu9XHYhhDdXorqpbicbUOO
         lr+KARTxKYYO0nO00pmj/BJmTq/qo4RBNxjNICP+TDJezi3jyrkV2jb3XafKkXcCJxPk
         Yi6HjdK+vFdD++1jGBInW6qSIY2+EqXdCAs1Fx3DPL4eEOhpH7p81N5aYL3fDhVGQyPp
         dD/FSkA4ocetyGxjMFSpjLaakSnsGYc/fgblKBJcxJ6kQezPiULA3rthbLN3eKqTvJe5
         FaYg==
X-Gm-Message-State: AOAM532ecNBm/ELa3Mii8TZiPTgU1PHyeDmlU0klnCYLTh0y/LEYeTBa
        gEZsionM9NmZHnjKXPwOtU/5Iw==
X-Google-Smtp-Source: ABdhPJyufMB2jhDDOlwI5gRTX4PSbfLBi7TX5g878WswkcmJTvgN17xmcUy7n1BL1TSRvOIBCDRBSw==
X-Received: by 2002:a17:902:b94a:b029:dc:18f2:8063 with SMTP id h10-20020a170902b94ab02900dc18f28063mr1410930pls.8.1608246381337;
        Thu, 17 Dec 2020 15:06:21 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id q9sm7074036pgb.82.2020.12.17.15.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 15:06:20 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
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
Subject: [RFC][PATCH 3/3] dma-buf: system_heap: Add deferred freeing to the system heap
Date:   Thu, 17 Dec 2020 23:06:12 +0000
Message-Id: <20201217230612.32397-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201217230612.32397-1-john.stultz@linaro.org>
References: <20201217230612.32397-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Utilize the deferred free helper library in the system heap.

This provides a nice performance bump and puts the
system heap performance on par with ION.

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
 drivers/dma-buf/heaps/Kconfig       |  1 +
 drivers/dma-buf/heaps/system_heap.c | 30 ++++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index fa5e1c330cce..3c1cdecca9e2 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -5,6 +5,7 @@ config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
 	select PAGE_POOL
+	select DMABUF_HEAPS_DEFERRED_FREE
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 885e30894b77..905b304ea24b 100644
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
@@ -317,30 +320,43 @@ static int system_heap_zero_buffer(struct system_heap_buffer *buffer)
 	return ret;
 }
 
-static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
+static void system_heap_buf_free(struct deferred_freelist_item *item, bool skip_pool)
 {
-	struct system_heap_buffer *buffer = dmabuf->priv;
+	struct system_heap_buffer *buffer = container_of(item, struct system_heap_buffer, deferred_free);
 	struct sg_table *table;
 	struct scatterlist *sg;
 	int i, j;
 
 	/* Zero the buffer pages before adding back to the pool */
-	system_heap_zero_buffer(buffer);
+	if (!skip_pool)
+		if (system_heap_zero_buffer(buffer))
+			skip_pool = true; // On zeroing failure, just free
 
 	table = &buffer->sg_table;
 	for_each_sg(table->sgl, sg, table->nents, i) {
 		struct page *page = sg_page(sg);
 
-		for (j = 0; j < NUM_ORDERS; j++) {
-			if (compound_order(page) == orders[j])
-				break;
+		if (skip_pool) {
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

