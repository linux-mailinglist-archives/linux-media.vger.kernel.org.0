Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CA73C7EFC
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 09:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238176AbhGNHOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 03:14:51 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58052 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S238129AbhGNHOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 03:14:51 -0400
X-UUID: 981c53e6deac4dc99d9518640f7c133a-20210714
X-UUID: 981c53e6deac4dc99d9518640f7c133a-20210714
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1385633967; Wed, 14 Jul 2021 15:11:57 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 15:11:49 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 14 Jul 2021 15:11:49 +0800
From:   <guangming.cao@mediatek.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>, <christian.koenig@amd.com>
CC:     <wsd_upstream@mediatek.com>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Guangming Cao <Guangming.Cao@mediatek.com>
Subject: [PATCH] dma-buf: add kernel count for dma_buf
Date:   Wed, 14 Jul 2021 15:11:44 +0800
Message-ID: <20210714071144.62126-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Guangming Cao <Guangming.Cao@mediatek.com>

Add a refcount for kernel to prevent UAF(Use After Free) issue.

We can assume a case like below:
    1. kernel space alloc dma_buf(file count = 1)
    2. kernel use dma_buf to get fd(file count = 1)
    3. userspace use fd to do mapping (file count = 2)
    4. kernel call dma_buf_put (file count = 1)
    5. userpsace close buffer fd(file count = 0)
    6. at this time, buffer is released, but va is valid!!
       So we still can read/write buffer via mmap va,
       it maybe cause memory leak, or kernel exception.
       And also, if we use "ls -ll" to watch corresponding process
           fd link info, it also will cause kernel exception.

Another case:
     Using dma_buf_fd to generate more than 1 fd, because
     dma_buf_fd will not increase file count, thus, when close
     the second fd, it maybe occurs error.

Solution:
    Add a kernel count for dma_buf, and make sure the file count
        of dma_buf.file hold by kernel is 1.

Notes: For this solution, kref couldn't work because kernel ref
       maybe added from 0, but kref don't allow it.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++----
 include/linux/dma-buf.h   |  6 ++++--
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..04ee92aac8b9 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -62,6 +62,7 @@ static void dma_buf_release(struct dentry *dentry)
 	if (unlikely(!dmabuf))
 		return;
 
+	WARN_ON(atomic64_read(&dmabuf->kernel_ref));
 	BUG_ON(dmabuf->vmapping_counter);
 
 	/*
@@ -555,6 +556,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 		goto err_module;
 	}
 
+	atomic64_set(&dmabuf->kernel_ref, 1);
 	dmabuf->priv = exp_info->priv;
 	dmabuf->ops = exp_info->ops;
 	dmabuf->size = exp_info->size;
@@ -617,6 +619,9 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	fd_install(fd, dmabuf->file);
 
+	/* Add file cnt for each new fd */
+	get_file(dmabuf->file);
+
 	return fd;
 }
 EXPORT_SYMBOL_GPL(dma_buf_fd);
@@ -626,12 +631,13 @@ EXPORT_SYMBOL_GPL(dma_buf_fd);
  * @fd:	[in]	fd associated with the struct dma_buf to be returned
  *
  * On success, returns the struct dma_buf associated with an fd; uses
- * file's refcounting done by fget to increase refcount. returns ERR_PTR
- * otherwise.
+ * dmabuf's ref refcounting done by kref_get to increase refcount.
+ * Returns ERR_PTR otherwise.
  */
 struct dma_buf *dma_buf_get(int fd)
 {
 	struct file *file;
+	struct dma_buf *dmabuf;
 
 	file = fget(fd);
 
@@ -643,7 +649,12 @@ struct dma_buf *dma_buf_get(int fd)
 		return ERR_PTR(-EINVAL);
 	}
 
-	return file->private_data;
+	dmabuf = file->private_data;
+	/* replace file count increase as ref increase for kernel user */
+	get_dma_buf(dmabuf);
+	fput(file);
+
+	return dmabuf;
 }
 EXPORT_SYMBOL_GPL(dma_buf_get);
 
@@ -662,7 +673,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
 	if (WARN_ON(!dmabuf || !dmabuf->file))
 		return;
 
-	fput(dmabuf->file);
+	if (WARN_ON(!atomic64_read(&dmabuf->kernel_ref)))
+		return;
+
+	if (!atomic64_dec_return(&dmabuf->kernel_ref))
+		fput(dmabuf->file);
 }
 EXPORT_SYMBOL_GPL(dma_buf_put);
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index efdc56b9d95f..bc790cb028eb 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -308,6 +308,7 @@ struct dma_buf_ops {
 struct dma_buf {
 	size_t size;
 	struct file *file;
+	atomic64_t kernel_ref;
 	struct list_head attachments;
 	const struct dma_buf_ops *ops;
 	struct mutex lock;
@@ -436,7 +437,7 @@ struct dma_buf_export_info {
 					 .owner = THIS_MODULE }
 
 /**
- * get_dma_buf - convenience wrapper for get_file.
+ * get_dma_buf - increase a kernel ref of dma-buf
  * @dmabuf:	[in]	pointer to dma_buf
  *
  * Increments the reference count on the dma-buf, needed in case of drivers
@@ -446,7 +447,8 @@ struct dma_buf_export_info {
  */
 static inline void get_dma_buf(struct dma_buf *dmabuf)
 {
-	get_file(dmabuf->file);
+	if (atomic64_inc_return(&dmabuf->kernel_ref) == 1)
+		get_file(dmabuf->file);
 }
 
 /**
-- 
2.17.1

