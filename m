Return-Path: <linux-media+bounces-32632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088A8AB98E6
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 11:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98DA216F4CD
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 09:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D838922FAF8;
	Fri, 16 May 2025 09:32:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mta20.hihonor.com (mta20.honor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4D17483;
	Fri, 16 May 2025 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387943; cv=none; b=erv6UZLppyNvMHa8dL4R2O6dCB1AeKp1HKt+uu94dwQHfgXH7nCjd+iW09R1FgqkItC7rc22YQVR/tJrEfm5/9cOjcbMS2j5qAdy0vm8hdmQiZEzt9Yp6ZiJslYvfSXCjbm/R7cOm+SIqQRpsWQdmx9lSHIrhVD89/HAKdnGrnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387943; c=relaxed/simple;
	bh=WSFU4n/axdeaDEjWRdFN8SACosPXM8iaSf+kxliEvzg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m2INCiSqe3ysHJmHswgkd5V4gDtVIi1qvf+TXHhVwRQuhrpVtne8SGCpypyjXTj1iDGeaQl/qwkFBjdXQFJp6NSqAWvcfZmP0QvrfhBOdCfvjv4Na+sW5z915HF5Yodx7WyBanfeM/+uxOEsnfqRSnANsqWHoQsZnmisehcSMXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4ZzMGh2Tt6zYlfv7;
	Fri, 16 May 2025 17:29:16 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 17:31:21 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 17:31:20 +0800
From: wangtao <tao.wangtao@honor.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
	<benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
	<jstultz@google.com>, <tjmercier@google.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
	<bintian.wang@honor.com>, <yipengxiang@honor.com>, <liulu.liu@honor.com>,
	<feng.han@honor.com>, wangtao <tao.wangtao@honor.com>
Subject: [PATCH v2 1/2] dmabuf: add DMA_BUF_IOCTL_RW_FILE
Date: Fri, 16 May 2025 17:21:47 +0800
Message-ID: <20250516092148.12778-2-tao.wangtao@honor.com>
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

Add DMA_BUF_IOCTL_RW_FILE to save/restore data to/from a dma-buf.

For large dmabuf operations (model loading, real-time data capture,
task snapshots), Direct I/O with zero-copy boosts performance
by avoiding file cache/memory copies, cuts CPU/power use. On UFS 4.0
(@4GB/s): dmabuf Direct I/O hits 3776MB/s read speed.

Signed-off-by: wangtao <tao.wangtao@honor.com>
---
 drivers/dma-buf/dma-buf.c    |  8 ++++++++
 include/linux/dma-buf.h      | 15 +++++++++++++++
 include/uapi/linux/dma-buf.h | 28 ++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b85515..95d8b0158ffd 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -460,6 +460,7 @@ static long dma_buf_ioctl(struct file *file,
 	struct dma_buf *dmabuf;
 	struct dma_buf_sync sync;
 	enum dma_data_direction direction;
+	struct dma_buf_rw_file kfile;
 	int ret;
 
 	dmabuf = file->private_data;
@@ -504,6 +505,13 @@ static long dma_buf_ioctl(struct file *file,
 		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
 #endif
 
+	case DMA_BUF_IOCTL_RW_FILE:
+		if (copy_from_user(&kfile, (void __user *) arg, sizeof(kfile)))
+			return -EFAULT;
+		if (!dmabuf->ops->rw_file)
+			return -EINVAL;
+		return dmabuf->ops->rw_file(dmabuf, &kfile);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bd..6d2e6eae0611 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -22,6 +22,7 @@
 #include <linux/fs.h>
 #include <linux/dma-fence.h>
 #include <linux/wait.h>
+#include <uapi/linux/dma-buf.h>
 
 struct device;
 struct dma_buf;
@@ -285,6 +286,20 @@ struct dma_buf_ops {
 
 	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
+
+	/**
+	 * @rw_file:
+	 *
+	 * If an Exporter needs to support Direct I/O file operations, it can
+	 * implement this optional callback. The exporter must verify that no
+	 * other objects hold the sg_table, ensure exclusive access to the
+	 * dmabuf's sg_table, and only then proceed with the I/O operation.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or a negative error code on failure.
+	 */
+	int (*rw_file)(struct dma_buf *dmabuf, struct dma_buf_rw_file *file);
 };
 
 /**
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 5a6fda66d9ad..9b33279fef00 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -167,6 +167,28 @@ struct dma_buf_import_sync_file {
 	__s32 fd;
 };
 
+/**
+ * struct dma_buf_rw_file - read/write file associated with a dma-buf
+ *
+ * Userspace can performs a DMA_BUF_IOCTL_BACK to save data from a dma-buf or
+ * restore data to a dma-buf.
+ */
+struct dma_buf_rw_file {
+	/** @flags: Flags indicating read/write for this dma-buf. */
+	__u32 flags;
+	/** @fd: File descriptor of the file associated with this dma-buf. */
+	__s32 fd;
+	/** @file_offset: Offset within the file where this dma-buf starts.
+	 *
+	 *  Offset and Length must be page-aligned for direct I/O.
+	 */
+	__u64 file_offset;
+	/** @buf_offset: Offset within this dma-buf where the read/write starts. */
+	__u64 buf_offset;
+	/** @buf_len: Length of this dma-buf read/write. */
+	__u64 buf_len;
+};
+
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
 
@@ -179,4 +201,10 @@ struct dma_buf_import_sync_file {
 #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
 #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
 
+#define DMA_BUF_RW_FLAGS_OP_MASK (0xFF << 0)
+#define DMA_BUF_RW_FLAGS_READ (1 << 0) /* Restore dma-buf data */
+#define DMA_BUF_RW_FLAGS_WRITE (2 << 0) /* Save dma-buf data */
+#define DMA_BUF_RW_FLAGS_DIRECT (1u << 31) /* Direct read/write file */
+#define DMA_BUF_IOCTL_RW_FILE	_IOW(DMA_BUF_BASE, 4, struct dma_buf_rw_file)
+
 #endif
-- 
2.17.1


