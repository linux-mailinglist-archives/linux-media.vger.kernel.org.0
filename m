Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D43D2FC1CC
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 22:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389476AbhASVDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 16:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730302AbhASUpb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 15:45:31 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3DDC061574
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 12:45:16 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id u11so6932737plg.13
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 12:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=njrcSIJAkGY2OvZcMcUOB/aiSRsE8gSP15fU7c5jB6I=;
        b=D4Tiif4UHDgXE0lEl4K0r5he4Lv75bV6HrswkUdJtOBDALOY20/c4H2BSvtnyOb/TI
         lUvOJdmQt0XsbtCcgTlnkqqpAJQNX09TzBmy5RJFv/agoix5egESsaXy3Nveu5r9N10z
         fNuTeUbV3nBdadsnb+AbFgi8g+pyo8yGfsg6cOewdwkf78efJVxidklQClROooreN6BY
         4Awgdijgf5MJ1bxffI2A7/j/1T07ikg94dEgS8D0bY9No74cF+y6jibT4Ne9hGHwHwRa
         IX/mVVnT24EmSAISdSkb4YSF2D9+3eN6ND0QDmXLnQZmVdO6m6rILjT+jOvuB8NqiI1K
         uABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=njrcSIJAkGY2OvZcMcUOB/aiSRsE8gSP15fU7c5jB6I=;
        b=BuVccw39+uZCNzXuATeS+nPj9diGmbhAPBLgK0INK3zahTBmey1BfRj471W1K1dJ99
         7jSsp1JQQFchZHck3X0eany1EPHps81bQqWM7L3mjiT1PlLcqhKuRlzjqRJok0WB2GGK
         V9q8liDyNKKq7rs+cB3PpLYbEz6uQkkjyMdST0e5MQyDhehO079M/fiEcpSvxuEorcwp
         dbQsHwEkT/t7nvDUV0PlaU6I349F1Du1SM/I8g5JxacaTYvFIceK9EE1BiW/7zbeS0DS
         p+BY94Hq2n8J+HlHozEEoQV1yGl02nuI+nQ5ps2IZttvALRz8CdpCo3/fc43wWAsqcMq
         sZSQ==
X-Gm-Message-State: AOAM533I0uKaV+J5FcO+mAlJYKhxXCJG+gSqNB/cwMEWr2LVO/93jfGo
        S8/lhMihSyQMB78ocfHu5ldkRQ==
X-Google-Smtp-Source: ABdhPJxNNMADX9CbUQovzjYXc9TxCQoBpybpXFayDx9hPArekpnWGmkjCQtFXmhn9Lpe14eQ01u5eg==
X-Received: by 2002:a17:90a:7e18:: with SMTP id i24mr1669643pjl.72.1611089115609;
        Tue, 19 Jan 2021 12:45:15 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id md7sm4129838pjb.52.2021.01.19.12.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 12:45:14 -0800 (PST)
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
Subject: [RESEND][PATCH 3/3] dma-buf: heaps: Rework heep allocation hooks to return struct dma_buf instead of fd
Date:   Tue, 19 Jan 2021 20:45:08 +0000
Message-Id: <20210119204508.9256-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119204508.9256-1-john.stultz@linaro.org>
References: <20210119204508.9256-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Every heap needs to create a dmabuf and then export it to a fd
via dma_buf_fd(), so to consolidate things a bit, have the heaps
just return a struct dmabuf * and let the top level
dma_heap_buffer_alloc() call handle creating the fd via
dma_buf_fd().

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
 drivers/dma-buf/dma-heap.c          | 14 +++++++++++++-
 drivers/dma-buf/heaps/cma_heap.c    | 22 +++++++---------------
 drivers/dma-buf/heaps/system_heap.c | 21 +++++++--------------
 include/linux/dma-heap.h            | 12 ++++++------
 4 files changed, 33 insertions(+), 36 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index afd22c9dbdcf..6b5db954569f 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -52,6 +52,9 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 				 unsigned int fd_flags,
 				 unsigned int heap_flags)
 {
+	struct dma_buf *dmabuf;
+	int fd;
+
 	/*
 	 * Allocations from all heaps have to begin
 	 * and end on page boundaries.
@@ -60,7 +63,16 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 	if (!len)
 		return -EINVAL;
 
-	return heap->ops->allocate(heap, len, fd_flags, heap_flags);
+	dmabuf = heap->ops->allocate(heap, len, fd_flags, heap_flags);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	fd = dma_buf_fd(dmabuf, fd_flags);
+	if (fd < 0) {
+		dma_buf_put(dmabuf);
+		/* just return, as put will call release and that will free */
+	}
+	return fd;
 }
 
 static int dma_heap_open(struct inode *inode, struct file *file)
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0c76cbc3fb11..985c41ffd85b 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -272,10 +272,10 @@ static const struct dma_buf_ops cma_heap_buf_ops = {
 	.release = cma_heap_dma_buf_release,
 };
 
-static int cma_heap_allocate(struct dma_heap *heap,
-				  unsigned long len,
-				  unsigned long fd_flags,
-				  unsigned long heap_flags)
+static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
+					 unsigned long len,
+					 unsigned long fd_flags,
+					 unsigned long heap_flags)
 {
 	struct cma_heap *cma_heap = dma_heap_get_drvdata(heap);
 	struct cma_heap_buffer *buffer;
@@ -290,7 +290,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
 
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&buffer->attachments);
 	mutex_init(&buffer->lock);
@@ -349,15 +349,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
 		ret = PTR_ERR(dmabuf);
 		goto free_pages;
 	}
-
-	ret = dma_buf_fd(dmabuf, fd_flags);
-	if (ret < 0) {
-		dma_buf_put(dmabuf);
-		/* just return, as put will call release and that will free */
-		return ret;
-	}
-
-	return ret;
+	return dmabuf;
 
 free_pages:
 	kfree(buffer->pages);
@@ -366,7 +358,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
 free_buffer:
 	kfree(buffer);
 
-	return ret;
+	return ERR_PTR(ret);
 }
 
 static const struct dma_heap_ops cma_heap_ops = {
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 2321c91891f6..7b154424aeb3 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -332,10 +332,10 @@ static struct page *alloc_largest_available(unsigned long size,
 	return NULL;
 }
 
-static int system_heap_allocate(struct dma_heap *heap,
-				unsigned long len,
-				unsigned long fd_flags,
-				unsigned long heap_flags)
+static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
+					    unsigned long len,
+					    unsigned long fd_flags,
+					    unsigned long heap_flags)
 {
 	struct system_heap_buffer *buffer;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
@@ -350,7 +350,7 @@ static int system_heap_allocate(struct dma_heap *heap,
 
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&buffer->attachments);
 	mutex_init(&buffer->lock);
@@ -400,14 +400,7 @@ static int system_heap_allocate(struct dma_heap *heap,
 		ret = PTR_ERR(dmabuf);
 		goto free_pages;
 	}
-
-	ret = dma_buf_fd(dmabuf, fd_flags);
-	if (ret < 0) {
-		dma_buf_put(dmabuf);
-		/* just return, as put will call release and that will free */
-		return ret;
-	}
-	return ret;
+	return dmabuf;
 
 free_pages:
 	for_each_sgtable_sg(table, sg, i) {
@@ -421,7 +414,7 @@ static int system_heap_allocate(struct dma_heap *heap,
 		__free_pages(page, compound_order(page));
 	kfree(buffer);
 
-	return ret;
+	return ERR_PTR(ret);
 }
 
 static const struct dma_heap_ops system_heap_ops = {
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 454e354d1ffb..5bc5c946af58 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -16,15 +16,15 @@ struct dma_heap;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
- * @allocate:		allocate dmabuf and return fd
+ * @allocate:		allocate dmabuf and return struct dma_buf ptr
  *
- * allocate returns dmabuf fd  on success, -errno on error.
+ * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
  */
 struct dma_heap_ops {
-	int (*allocate)(struct dma_heap *heap,
-			unsigned long len,
-			unsigned long fd_flags,
-			unsigned long heap_flags);
+	struct dma_buf *(*allocate)(struct dma_heap *heap,
+				    unsigned long len,
+				    unsigned long fd_flags,
+				    unsigned long heap_flags);
 };
 
 /**
-- 
2.17.1

