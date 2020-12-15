Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26392DB648
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 23:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730061AbgLOWGt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 17:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729887AbgLOWGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 17:06:36 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BDDC0617B0
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 14:05:29 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id b5so394514pjl.0
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 14:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kl8PmZ90JFms2rGnBVhby1dPAjXSFRIkuqNGt+DZeDI=;
        b=gtbakvDS5+hfUPYPisnKHKkpzI2vWtDWjMabBbr36nuJ4SnxstOs4PQOYUvf1rubas
         UVc6Zd9/Ftn/AKJedeTpl1JX9Mp7tQoHFxWL23lR9Nu+v0DciCOGdKgzjdW8OPgxDWq0
         xU+zTjyuHUFkUFK7I3bWOz3PS1qYYCD3N5Zr3007xPpjcCgfSPvN67Wqp/5b6Ba19o0f
         L/NefZfbRy72TRZVYW/8uTjFQlc6ZnwEviOb5C3p0YeTjceCA8NGB6Ub3pMtd+S3Zr8G
         UmeZkBEWCcQRxb1om3207cWH5j2y88+4Mvy5bgKq5ARNmW3yFFAW265HlZSGKGP+868t
         jAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kl8PmZ90JFms2rGnBVhby1dPAjXSFRIkuqNGt+DZeDI=;
        b=dURoAVjxTwPV7JkeM6X3UqHEoBXo+ftFw/dDa9s+rPbHbmCKGjqx0BmSFOTDRucpDl
         OUcm+vUTdD+EzMtjRR++oAflDVLXXLqCaFlVndp447HBKwxjnb5HlDIKjFVY4FewkMwI
         5TR70gQV7w73Tr9wBkAmo3oXQwTERGla4GKpB6jWggsrCDTQ2Hs54njdKMjF/it7Y3Y7
         +qfelJp91MGXpJJfdUXk9RK+qrnokmEkPYNdwIGUuYFEBwz/OW1SxV1n4EYfaiONavVY
         BWkjVKbZTTuguhy/PbTBw5b5PuEQ4b+TevNnq+dFIGzBWp9gJa0iLNlnPm911Bpx8K0x
         DDJQ==
X-Gm-Message-State: AOAM532ipIv/Qj3ONwF9E9fKlImKgPDXZCc118aTJJHD9x+prX/D4dBb
        2ny+j5zRUtPYvhgLhOTM3yFEvQ==
X-Google-Smtp-Source: ABdhPJz5+eYpmQKEiyL/MUZSD6KzHvL6MBIgXZn3boaKbi6B/hgxQFMNg76pr/UYudpPO0p2PS22oQ==
X-Received: by 2002:a17:90a:1b82:: with SMTP id w2mr653081pjc.127.1608069928998;
        Tue, 15 Dec 2020 14:05:28 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id x15sm84146pfa.80.2020.12.15.14.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 14:05:28 -0800 (PST)
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
Subject: [RFC][PATCH 3/3] dma-buf: heaps: Rework heep allocation hooks to return struct dma_buf instead of fd
Date:   Tue, 15 Dec 2020 22:05:21 +0000
Message-Id: <20201215220521.118318-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215220521.118318-1-john.stultz@linaro.org>
References: <20201215220521.118318-1-john.stultz@linaro.org>
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
index 877353e8014f..0c7d6430605f 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -268,10 +268,10 @@ static const struct dma_buf_ops cma_heap_buf_ops = {
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
@@ -286,7 +286,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
 
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&buffer->attachments);
 	mutex_init(&buffer->lock);
@@ -345,15 +345,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
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
@@ -362,7 +354,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
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

