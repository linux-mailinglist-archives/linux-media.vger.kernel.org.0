Return-Path: <linux-media+bounces-32631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA63EAB98DC
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 11:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68AD116E048
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 09:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98FD22FAF8;
	Fri, 16 May 2025 09:31:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mta22.hihonor.com (mta22.hihonor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549A222592;
	Fri, 16 May 2025 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387915; cv=none; b=eC0r/z69sBAtga9UCQsOeR5PznT+grLzgCQ9ORgfH7Ji9dQGKAKw13FlsmZ5GltGLLdDr8fhMtfeue1Sx4HHIgKULXQf21xr9bMUips8PRcRNL/usMNvy1WAgWbPKr68VWLlonX5EXpiOahD15rFZizeh3vysYlPaSDKxi5fiVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387915; c=relaxed/simple;
	bh=RcNj01AbO/cC3CyRqLPMNfs74/vEnwpl0O3pVr1Qvss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UPYHjlsph3+COQGAcQyIMDxhnFEP4ryNEtGm4N9uugaZbNSUaobiOMeQr54DM+z/cJhZgMie5uw6kGLUAydtxQgW0PNMTtunGW8AMa7ly3h7GV3+4W2AQd5q7KdLm8vu9K+FDVgHWsJHIU/1yVShNRcWhEQc7ZmGn9+uD9Yxj30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w001.hihonor.com (unknown [10.68.25.235])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4ZzMH21lMmzYl1GJ;
	Fri, 16 May 2025 17:29:34 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 17:31:23 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 17:31:23 +0800
From: wangtao <tao.wangtao@honor.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
	<benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
	<jstultz@google.com>, <tjmercier@google.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
	<bintian.wang@honor.com>, <yipengxiang@honor.com>, <liulu.liu@honor.com>,
	<feng.han@honor.com>, wangtao <tao.wangtao@honor.com>
Subject: [PATCH v2 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for system_heap
Date: Fri, 16 May 2025 17:21:48 +0800
Message-ID: <20250516092148.12778-3-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250516092148.12778-1-tao.wangtao@honor.com>
References: <20250516092148.12778-1-tao.wangtao@honor.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a010.hihonor.com
 (10.68.16.52)

Support direct file I/O operations for system_heap dma-buf objects.
Implementation includes:
- Check no other drivers use the dmabuf
- Construct bio_vec
- Set IOCB_DIRECT when O_DIRECT is supported
- Invoke vfs_iocb_iter_read()/vfs_iocb_iter_write() for actual I/O

Performance metrics (UFS 4.0 device @4GB/s, Arm64 CPU @1GHz):

| Metric             |    1MB |    8MB |    64MB |   1024MB |   3072MB |
|--------------------|--------|--------|---------|----------|----------|
| Buffer Read (us)   |   1658 |   9028 |   69295 |  1019783 |  2978179 |
| Direct Read (us)   |    707 |   2647 |   18689 |   299627 |   937758 |
| Buffer Rate (MB/s) |    603 |    886 |     924 |     1004 |     1032 |
| Direct Rate (MB/s) |   1414 |   3022 |    3425 |     3418 |     3276 |

Signed-off-by: wangtao <tao.wangtao@honor.com>
---
 drivers/dma-buf/heaps/system_heap.c | 121 ++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..5ae219ad0d72 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -20,6 +20,8 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/bvec.h>
+#include <linux/uio.h>
 
 static struct dma_heap *sys_heap;
 
@@ -281,6 +283,124 @@ static void system_heap_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
 	iosys_map_clear(map);
 }
 
+static struct bio_vec *system_heap_init_bvec(struct system_heap_buffer *buffer,
+			size_t offset, size_t len, int *nr_segs)
+{
+	struct sg_table *sgt = &buffer->sg_table;
+	struct scatterlist *sg;
+	size_t length = 0;
+	unsigned int i, k = 0;
+	struct bio_vec *bvec;
+	size_t sg_left;
+	size_t sg_offset;
+	size_t sg_len;
+
+	bvec = kvcalloc(sgt->nents, sizeof(*bvec), GFP_KERNEL);
+	if (!bvec)
+		return NULL;
+
+	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+		length += sg->length;
+		if (length <= offset)
+			continue;
+
+		sg_left = length - offset;
+		sg_offset = sg->offset + sg->length - sg_left;
+		sg_len = min(sg_left, len);
+
+		bvec[k].bv_page = sg_page(sg);
+		bvec[k].bv_len = sg_len;
+		bvec[k].bv_offset = sg_offset;
+		k++;
+
+		offset += sg_len;
+		len -= sg_len;
+		if (len <= 0)
+			break;
+	}
+
+	*nr_segs = k;
+	return bvec;
+}
+
+static int system_heap_rw_file(struct system_heap_buffer *buffer, bool is_read,
+		bool direct_io, struct file *filp, loff_t file_offset,
+		size_t buf_offset, size_t len)
+{
+	struct bio_vec *bvec;
+	int nr_segs = 0;
+	struct iov_iter iter;
+	struct kiocb kiocb;
+	ssize_t ret = 0;
+
+	if (!list_empty(&buffer->attachments) || buffer->vmap_cnt)
+		return -EBUSY;
+
+	if (direct_io) {
+		if (!(filp->f_mode & FMODE_CAN_ODIRECT))
+			return -EINVAL;
+	}
+
+	bvec = system_heap_init_bvec(buffer, buf_offset, len, &nr_segs);
+	if (!bvec)
+		return -ENOMEM;
+
+	iov_iter_bvec(&iter, is_read ? ITER_DEST : ITER_SOURCE, bvec, nr_segs, len);
+	init_sync_kiocb(&kiocb, filp);
+	kiocb.ki_pos = file_offset;
+	if (direct_io)
+		kiocb.ki_flags |= IOCB_DIRECT;
+
+	while (kiocb.ki_pos < file_offset + len) {
+		if (is_read)
+			ret = vfs_iocb_iter_read(filp, &kiocb, &iter);
+		else
+			ret = vfs_iocb_iter_write(filp, &kiocb, &iter);
+		if (ret <= 0)
+			break;
+	}
+
+	kvfree(bvec);
+	return ret < 0 ? ret : 0;
+}
+
+static int system_heap_dma_buf_rw_file(struct dma_buf *dmabuf,
+			struct dma_buf_rw_file *back)
+{
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	int ret = 0;
+	__u32 op = back->flags & DMA_BUF_RW_FLAGS_OP_MASK;
+	bool direct_io = back->flags & DMA_BUF_RW_FLAGS_DIRECT;
+	struct file *filp;
+
+	if (op != DMA_BUF_RW_FLAGS_READ && op != DMA_BUF_RW_FLAGS_WRITE)
+		return -EINVAL;
+	if (direct_io) {
+		if (!PAGE_ALIGNED(back->file_offset) ||
+		    !PAGE_ALIGNED(back->buf_offset) ||
+		    !PAGE_ALIGNED(back->buf_len))
+			return -EINVAL;
+	}
+	if (!back->buf_len || back->buf_len > dmabuf->size ||
+		back->buf_offset >= dmabuf->size ||
+		back->buf_offset + back->buf_len > dmabuf->size)
+		return -EINVAL;
+	if (back->file_offset + back->buf_len < back->file_offset)
+		return -EINVAL;
+
+	filp = fget(back->fd);
+	if (!filp)
+		return -EBADF;
+
+	mutex_lock(&buffer->lock);
+	ret = system_heap_rw_file(buffer, op == DMA_BUF_RW_FLAGS_READ, direct_io,
+			filp, back->file_offset, back->buf_offset, back->buf_len);
+	mutex_unlock(&buffer->lock);
+
+	fput(filp);
+	return ret;
+}
+
 static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 {
 	struct system_heap_buffer *buffer = dmabuf->priv;
@@ -308,6 +428,7 @@ static const struct dma_buf_ops system_heap_buf_ops = {
 	.mmap = system_heap_mmap,
 	.vmap = system_heap_vmap,
 	.vunmap = system_heap_vunmap,
+	.rw_file = system_heap_dma_buf_rw_file,
 	.release = system_heap_dma_buf_release,
 };
 
-- 
2.17.1


