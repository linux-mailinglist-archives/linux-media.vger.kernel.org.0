Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249EA30B8D4
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 08:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbhBBHnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 02:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbhBBHmz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 02:42:55 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7865EC0613ED
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 23:41:59 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id l18so1827380pji.3
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 23:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yF9oYLwsZ1KojzzdMIJNFHTIF6r0NLzbmizzA10msek=;
        b=i2KWwMMWbuGF2eiQySUtHobe5uTz4nG5XRV4S2XJ/mHh1GbIX54qDVTDwHLfIR7D2/
         qsr7I6lilB8DfLaglk+KKmLYDFcLfD8yf9sj2W2EGPfEvPUZ7cfa9eDsaXiP3KM4vDx+
         SeLls8iGFsCugRt525lMp5RI4ICOmGqH04gE2ZE2wyMS0jbFSpBel6/rRX4bXGsw/vCo
         TPivIwY7fxlczAzpjZCgP1t11aqp+XaYonFc9iv5hvqaG8vsMPQ9cmU+Xm/ArO6Dd0YQ
         kQEWFQmgKg65gixRyMtqqbzE0BUmJvCNNaoQfdsfgB4YXn19AWuw5/hw/iHwmvrSHBzh
         4JOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yF9oYLwsZ1KojzzdMIJNFHTIF6r0NLzbmizzA10msek=;
        b=nk2rbk9XBvM/c5i60HsUjzssoB2wk2NXPcHnUEAxjWh1ECfzdx6m7I4ILJDFQnE+TE
         kAwAJyA1Vgno2CtXKrIEWH9dHgdt/YrIC019azKziNh4Q4/WZTe+e+aRR485cvmJWSBx
         UVhxgtel0Jao5ZXoNtDIP0bgPMy7wcEzRKBPl1RWR1uwrXjlO4RfG6f0n6thHMkNFpJ8
         VdSL7/cJKT7fTtzZK8us8R0qSdoYlfpLEkdDyBEMo8mcGnkeztBIjOG48wAZ4h2tyx2Y
         a6gR/m1EcSkexcT6YzGS34IgN1FtzkDbFvptaiWNPNr6JkvXEfZxAxD2Lr50S4+iAvE8
         ID+Q==
X-Gm-Message-State: AOAM5324IlMZp+fkOoP24AtvAsoCh1EQJaOYuRtp/oXAXzQlfMMzZsr9
        f/629eQlpIDYHL4fZUOapz1tzw==
X-Google-Smtp-Source: ABdhPJxje564VpHOPV+rh4rYf4PQrgkJXTdm+hnKe+ctEVPFgfpIqQ9fOc4EUqeGuKE61UOFwfC2qA==
X-Received: by 2002:a17:90a:6549:: with SMTP id f9mr3026149pjs.17.1612251719077;
        Mon, 01 Feb 2021 23:41:59 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id k9sm9410666pgh.94.2021.02.01.23.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 23:41:58 -0800 (PST)
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
Subject: [PATCH v4 3/3] dma-buf: system_heap: Add deferred freeing to the system heap
Date:   Tue,  2 Feb 2021 07:41:51 +0000
Message-Id: <20210202074151.3146795-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210202074151.3146795-1-john.stultz@linaro.org>
References: <20210202074151.3146795-1-john.stultz@linaro.org>
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
index 45c7d277448b..2276420ae905 100644
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
index 2addb6d832e0..fe122b5eff10 100644
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
@@ -301,30 +304,45 @@ static int system_heap_zero_buffer(struct system_heap_buffer *buffer)
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
2.25.1

