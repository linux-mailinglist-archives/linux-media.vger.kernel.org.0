Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40264506D8
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 15:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235145AbhKOO3m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 09:29:42 -0500
Received: from aposti.net ([89.234.176.197]:51512 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236491AbhKOO3D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 09:29:03 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Alexandru Ardelean <ardeleanalex@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 11/15] iio: buffer-dma: Boost performance using write-combine cache setting
Date:   Mon, 15 Nov 2021 14:19:21 +0000
Message-Id: <20211115141925.60164-12-paul@crapouillou.net>
In-Reply-To: <20211115141925.60164-1-paul@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We can be certain that the input buffers will only be accessed by
userspace for reading, and output buffers will mostly be accessed by
userspace for writing.

Therefore, it makes more sense to use only fully cached input buffers,
and to use the write-combine cache coherency setting for output buffers.

This boosts performance, as the data written to the output buffers does
not have to be sync'd for coherency. It will halve performance if the
userspace application tries to read from the output buffer, but this
should never happen.

Since we don't need to sync the cache when disabling CPU access either
for input buffers or output buffers, the .end_cpu_access() callback can
be dropped completely.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/iio/buffer/industrialio-buffer-dma.c | 82 +++++++++++++-------
 1 file changed, 54 insertions(+), 28 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index 92356ee02f30..fb39054d8c15 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -229,8 +229,33 @@ static int iio_buffer_dma_buf_mmap(struct dma_buf *dbuf,
 	if (vma->vm_ops->open)
 		vma->vm_ops->open(vma);
 
-	return dma_mmap_pages(dev, vma, vma->vm_end - vma->vm_start,
-			      virt_to_page(block->vaddr));
+	if (block->queue->buffer.direction == IIO_BUFFER_DIRECTION_IN) {
+		/*
+		 * With an input buffer, userspace will only read the data and
+		 * never write. We can mmap the buffer fully cached.
+		 */
+		return dma_mmap_pages(dev, vma, vma->vm_end - vma->vm_start,
+				      virt_to_page(block->vaddr));
+	} else {
+		/*
+		 * With an output buffer, userspace will only write the data
+		 * and should rarely (if never) read from it. It is better to
+		 * use write-combine in this case.
+		 */
+		return dma_mmap_wc(dev, vma, block->vaddr, block->phys_addr,
+				   vma->vm_end - vma->vm_start);
+	}
+}
+
+static void iio_dma_buffer_free_dmamem(struct iio_dma_buffer_block *block)
+{
+	struct device *dev = block->queue->dev;
+	size_t size = PAGE_ALIGN(block->size);
+
+	if (block->queue->buffer.direction == IIO_BUFFER_DIRECTION_IN)
+		dma_free_coherent(dev, size, block->vaddr, block->phys_addr);
+	else
+		dma_free_wc(dev, size, block->vaddr, block->phys_addr);
 }
 
 static void iio_buffer_dma_buf_release(struct dma_buf *dbuf)
@@ -243,9 +268,7 @@ static void iio_buffer_dma_buf_release(struct dma_buf *dbuf)
 
 	mutex_lock(&queue->lock);
 
-	dma_free_coherent(queue->dev, PAGE_ALIGN(block->size),
-			  block->vaddr, block->phys_addr);
-
+	iio_dma_buffer_free_dmamem(block);
 	kfree(block);
 
 	queue->num_blocks--;
@@ -268,19 +291,6 @@ static int iio_buffer_dma_buf_begin_cpu_access(struct dma_buf *dbuf,
 	return 0;
 }
 
-static int iio_buffer_dma_buf_end_cpu_access(struct dma_buf *dbuf,
-					     enum dma_data_direction dma_dir)
-{
-	struct iio_dma_buffer_block *block = dbuf->priv;
-	struct device *dev = block->queue->dev;
-
-	/* We only need to sync the cache for output buffers */
-	if (block->queue->buffer.direction == IIO_BUFFER_DIRECTION_OUT)
-		dma_sync_single_for_device(dev, block->phys_addr, block->size, dma_dir);
-
-	return 0;
-}
-
 static const struct dma_buf_ops iio_dma_buffer_dmabuf_ops = {
 	.attach			= iio_buffer_dma_buf_attach,
 	.map_dma_buf		= iio_buffer_dma_buf_map,
@@ -288,9 +298,28 @@ static const struct dma_buf_ops iio_dma_buffer_dmabuf_ops = {
 	.mmap			= iio_buffer_dma_buf_mmap,
 	.release		= iio_buffer_dma_buf_release,
 	.begin_cpu_access	= iio_buffer_dma_buf_begin_cpu_access,
-	.end_cpu_access		= iio_buffer_dma_buf_end_cpu_access,
 };
 
+static int iio_dma_buffer_alloc_dmamem(struct iio_dma_buffer_block *block)
+{
+	struct device *dev = block->queue->dev;
+	size_t size = PAGE_ALIGN(block->size);
+
+	if (block->queue->buffer.direction == IIO_BUFFER_DIRECTION_IN) {
+		block->vaddr = dma_alloc_coherent(dev, size,
+						  &block->phys_addr,
+						  GFP_KERNEL);
+	} else {
+		block->vaddr = dma_alloc_wc(dev, size,
+					    &block->phys_addr,
+					    GFP_KERNEL);
+	}
+	if (!block->vaddr)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 	struct iio_dma_buffer_queue *queue, size_t size, bool fileio)
 {
@@ -303,12 +332,12 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 	if (!block)
 		return ERR_PTR(-ENOMEM);
 
-	block->vaddr = dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
-		&block->phys_addr, GFP_KERNEL);
-	if (!block->vaddr) {
-		err = -ENOMEM;
+	block->size = size;
+	block->queue = queue;
+
+	err = iio_dma_buffer_alloc_dmamem(block);
+	if (err)
 		goto err_free_block;
-	}
 
 	einfo.ops = &iio_dma_buffer_dmabuf_ops;
 	einfo.size = PAGE_ALIGN(size);
@@ -322,10 +351,8 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 	}
 
 	block->dmabuf = dmabuf;
-	block->size = size;
 	block->bytes_used = size;
 	block->state = IIO_BLOCK_STATE_DONE;
-	block->queue = queue;
 	block->fileio = fileio;
 	INIT_LIST_HEAD(&block->head);
 
@@ -338,8 +365,7 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 	return block;
 
 err_free_dma:
-	dma_free_coherent(queue->dev, PAGE_ALIGN(size),
-			  block->vaddr, block->phys_addr);
+	iio_dma_buffer_free_dmamem(block);
 err_free_block:
 	kfree(block);
 	return ERR_PTR(err);
-- 
2.33.0

