Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957822796DC
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 06:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730056AbgIZEZO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 00:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730041AbgIZEZM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 00:25:12 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5BFFC0613D8
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:25:06 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 5so4155944pgf.5
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vw5JB3RRsbohaer3Y56R1IPsXZfXmp2s3xn/82rJ0CY=;
        b=D1xoiKNDyt3hh17/hK6uqP4SAJ0L1P3/8IXEZSgrQKf9rBZXqkaliK02LneXiMkHGc
         hxYhfBZgNzpCVtoUOBPYp/QXx5X4/02K3L9IlZyEnsTLPVYvwP/uqLK4KsdUC+CbktyT
         8DNFlax8CYkd9Trrqr9xoxsbV9QIMOilaXcPWav2ATUes6LDMvL85b+AkLVf6tvVHYom
         +Id89kS5caa8WGXDDtF5fDnl4RarlgFQyvitdpowCBq68FauqBrCZSuZArik8Bp9lmvK
         Fh0WjZM6QEhINjtqmgHLGVqCcIl0sx1uE4RQxjHaCKgOy70fCPRfjDyzqBwVCDnyFq3g
         I5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vw5JB3RRsbohaer3Y56R1IPsXZfXmp2s3xn/82rJ0CY=;
        b=W6/StzpCMwxR2M2sBIx54Mm7qnXmk408QKUC5IGOxUyBJUi+6sjHR4cD2lGod5wZ6q
         3o2bHOqjNNnyNxe739aUHZwr6KrFZ285j/XAzR4CoDWBlpTH8B6Z3NtN8x99G+0VtsgA
         NPwa4IQGrO/UdkgYO62y/VBVIH1vdbXOD1o2nQ0CycC1Cm67LxXiuthczHhhdJLY1O6C
         SOevSElbflQ43g6n0yOMEpcZLZcGRt/5ZbJIgMDYhfoLYO7+AVcfqYhIaNg+AaN9qlvQ
         XOGx7ZFvGxCGYk2PKvVDC3/K9RVmDEtAGGMYZfJ39WqbsKsouytt8I1SnbxYcM+wxvfp
         2clQ==
X-Gm-Message-State: AOAM531byRUED82CYfm9Ho/xYxIYGzdgYdGxrtX+4dK87SAmzVGWtDCR
        pNSC6aRmDI/hAcaJxEHlGh6BZg==
X-Google-Smtp-Source: ABdhPJyvQ50xfxJX8TpnL1MvlzaJmF3SWzncH/tqsov+stEHycC5jsIv3tQvdZov8P+AXKPfVqQiWA==
X-Received: by 2002:a62:cd49:0:b029:150:7742:c6c8 with SMTP id o70-20020a62cd490000b02901507742c6c8mr2126731pfg.61.1601094306220;
        Fri, 25 Sep 2020 21:25:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id a5sm3585886pgk.13.2020.09.25.21.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 21:25:05 -0700 (PDT)
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
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 6/6] dma-buf: heaps: Skip sync if not mapped
Date:   Sat, 26 Sep 2020 04:24:53 +0000
Message-Id: <20200926042453.67517-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926042453.67517-1-john.stultz@linaro.org>
References: <20200926042453.67517-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is basically a port of Ørjan Eide's similar patch for ION
 https://lore.kernel.org/lkml/20200414134629.54567-1-orjan.eide@arm.com/

Only sync the sg-list of dma-buf heap attachment when the attachment
is actually mapped on the device.

dma-bufs may be synced at any time. It can be reached from user space
via DMA_BUF_IOCTL_SYNC, so there are no guarantees from callers on when
syncs may be attempted, and dma_buf_end_cpu_access() and
dma_buf_begin_cpu_access() may not be paired.

Since the sg_list's dma_address isn't set up until the buffer is used
on the device, and dma_map_sg() is called on it, the dma_address will be
NULL if sync is attempted on the dma-buf before it's mapped on a device.

Before v5.0 (commit 55897af63091 ("dma-direct: merge swiotlb_dma_ops
into the dma_direct code")) this was a problem as the dma-api (at least
the swiotlb_dma_ops on arm64) would use the potentially invalid
dma_address. How that failed depended on how the device handled physical
address 0. If 0 was a valid address to physical ram, that page would get
flushed a lot, while the actual pages in the buffer would not get synced
correctly. While if 0 is an invalid physical address it may cause a
fault and trigger a crash.

In v5.0 this was incidentally fixed by commit 55897af63091 ("dma-direct:
merge swiotlb_dma_ops into the dma_direct code"), as this moved the
dma-api to use the page pointer in the sg_list, and (for Ion buffers at
least) this will always be valid if the sg_list exists at all.

But, this issue is re-introduced in v5.3 with
commit 449fa54d6815 ("dma-direct: correct the physical addr in
dma_direct_sync_sg_for_cpu/device") moves the dma-api back to the old
behaviour and picks the dma_address that may be invalid.

dma-buf core doesn't ensure that the buffer is mapped on the device, and
thus have a valid sg_list, before calling the exporter's
begin_cpu_access.

Logic and commit message originally by: Ørjan Eide <orjan.eide@arm.com>

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c    | 10 ++++++++++
 drivers/dma-buf/heaps/system_heap.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 3adfdbed0829..b6ab0392ad9a 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -44,6 +44,7 @@ struct dma_heap_attachment {
 	struct device *dev;
 	struct sg_table table;
 	struct list_head list;
+	bool mapped;
 };
 
 static int cma_heap_attach(struct dma_buf *dmabuf,
@@ -68,6 +69,7 @@ static int cma_heap_attach(struct dma_buf *dmabuf,
 
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
+	a->mapped = false;
 
 	attachment->priv = a;
 
@@ -101,6 +103,7 @@ static struct sg_table *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
 	if (!dma_map_sg(attachment->dev, table->sgl, table->nents,
 			direction))
 		table = ERR_PTR(-ENOMEM);
+	a->mapped = true;
 	return table;
 }
 
@@ -108,6 +111,9 @@ static void cma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				   struct sg_table *table,
 				   enum dma_data_direction direction)
 {
+	struct dma_heap_attachment *a = attachment->priv;
+
+	a->mapped = false;
 	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
 }
 
@@ -123,6 +129,8 @@ static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 
 	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sg_for_cpu(a->dev, a->table.sgl, a->table.nents,
 				    direction);
 	}
@@ -142,6 +150,8 @@ static int cma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 
 	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sg_for_device(a->dev, a->table.sgl, a->table.nents,
 				       direction);
 	}
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 9f57b4c8ae69..8a523b6fd51a 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -38,6 +38,7 @@ struct dma_heap_attachment {
 	struct device *dev;
 	struct sg_table *table;
 	struct list_head list;
+	bool mapped;
 };
 
 #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
@@ -94,6 +95,7 @@ static int system_heap_attach(struct dma_buf *dmabuf,
 	a->table = table;
 	a->dev = attachment->dev;
 	INIT_LIST_HEAD(&a->list);
+	a->mapped = false;
 
 	attachment->priv = a;
 
@@ -128,6 +130,7 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
 	if (!dma_map_sg(attachment->dev, table->sgl, table->nents, direction))
 		return ERR_PTR(-ENOMEM);
 
+	a->mapped = true;
 	return table;
 }
 
@@ -135,6 +138,9 @@ static void system_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				      struct sg_table *table,
 				      enum dma_data_direction direction)
 {
+	struct dma_heap_attachment *a = attachment->priv;
+
+	a->mapped = false;
 	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
 }
 
@@ -151,6 +157,8 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
 
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sg_for_cpu(a->dev, a->table->sgl, a->table->nents,
 				    direction);
 	}
@@ -171,6 +179,8 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
 
 	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
 		dma_sync_sg_for_device(a->dev, a->table->sgl, a->table->nents,
 				       direction);
 	}
-- 
2.17.1

