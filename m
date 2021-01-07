Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7EEC2EE787
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 22:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbhAGVQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 16:16:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbhAGVQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 16:16:52 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5FDC0612FB
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 13:15:33 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id s21so4717808pfu.13
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 13:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=njrcSIJAkGY2OvZcMcUOB/aiSRsE8gSP15fU7c5jB6I=;
        b=S3kadN9Nd3eJwxluh3P/NQ7i6yJ3iFEioWoVaqyB/bZBLo/xMbdx87OKNpbHiY7dGj
         4ZrHeVUJkAGpssYpJVVRC4eKet8jVvhjl3Vo/qRstu0C3FbSIBKdXSwkeKajIal9Cvnm
         QQJmu+t49heDmdwEa0QklfX2n0M28+01N4UWhtpEHSrelW7kz7zZQprMRaqi8QWMv+UP
         CdE+a77alvo9VGxRRgQhzamyWjHWnYeaaAEnCCyhcZ5CLgOAX8r8YBB+sF0mV41A7qur
         pZ4yug/6pl/Fx6PBjUbsH2K5hIrWQD0rHI1l0ELVDOOftJZjPcfFOnojtZI5MMeKRzPA
         IG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=njrcSIJAkGY2OvZcMcUOB/aiSRsE8gSP15fU7c5jB6I=;
        b=LUdQNQYC+9a5XvCtoHTUNethKnz7BfU55XcMVcp52dtX5Al3Fe7NVaXyd2txduYJcn
         cDmSgkGDvDeqiBSKvjfJuHwQ1vMWuJiDu2zG29jRXdrAkkmF7xY83eRUrd3V86DZo/Am
         K4kH8OkCn9y2efFGOZfIA9Tq9gR3cOxKnIHT7ms3Tw6E1VqvCMye7eP4kuh4St6wShmg
         wW66x5KNubtJKvWbgnD6OIGGtUWnktj84RA9h4cVwLEzN2gMHhgjxynYFwopQCoHUb3K
         W4LYIabHZnrLoGPlLhY2suxuFZEcutPIbk9FjgGgDqMVBFvnfViqYizXkoXC4OXnzr05
         ytjQ==
X-Gm-Message-State: AOAM531Srrym2OkDu+nIbERHpuVvdowOMUdH2J4xWF/Bw/zon43EgRtb
        EySIXVEfy4b2BN1pQwAP32rOvA==
X-Google-Smtp-Source: ABdhPJwQof8Twnqw2nby4Kyyai2XBfyKyBoMmx2rspsxPT2kGDpWq9k2NH3i2fJiY/P1cArkpcSccA==
X-Received: by 2002:a05:6a00:16c5:b029:19b:696:28a0 with SMTP id l5-20020a056a0016c5b029019b069628a0mr513757pfc.9.1610054132669;
        Thu, 07 Jan 2021 13:15:32 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id b6sm6574055pfd.43.2021.01.07.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 13:15:31 -0800 (PST)
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
Subject: [PATCH 3/3] dma-buf: heaps: Rework heep allocation hooks to return struct dma_buf instead of fd
Date:   Thu,  7 Jan 2021 21:15:25 +0000
Message-Id: <20210107211525.75951-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210107211525.75951-1-john.stultz@linaro.org>
References: <20210107211525.75951-1-john.stultz@linaro.org>
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

