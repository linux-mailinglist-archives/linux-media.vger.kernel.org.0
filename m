Return-Path: <linux-media+bounces-29936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD252A84727
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 17:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DCF93A5C2A
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 14:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E53028FFD1;
	Thu, 10 Apr 2025 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hH1poRN5"
X-Original-To: linux-media@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546AE28D85E;
	Thu, 10 Apr 2025 14:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296807; cv=none; b=JxamlJCgLUmCIjLHEMOR9k9auu8kFCLiSBg7StYhNcs2FbEVZEo4u+In6LDj+DnCAmwls0XmUgc2sXRSerl20JVKiXCyG02pMirlB4KANjG3P25v62a/QSgjCyMJCCgkQ4s5Zz6tsBuF0KdQwfm7OKC92za51Wt9U6M2gvvEFJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296807; c=relaxed/simple;
	bh=QcskMbCCOtFEPTMI9pIZwwmENlcYs2y/qGKBTNghQJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q0LBnLNJ52HFcB2gVHUWk4uR60br/12KF0wwHlFuw0tw9zkPX3ChDADOxzYhi4JZ/IhgY9nOWI7fd26nnySYrWnWzHTb+sWBN+WoF0McqHRzFXpxXhtYdNWbbKM9epBGAmYXcj5i5CKNKDc2GgIWbzauxVzVIgALsPOksOBEgp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hH1poRN5; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DD7F44339;
	Thu, 10 Apr 2025 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744296802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NO5o2gLsjg/fYr8Sfdfzm0+WOdUe2aREMsUjD6hGuw0=;
	b=hH1poRN5LKnBl1WVpo//1Utx5CtOETUIJ5r9rsAyKBGXXbp4i7KK3KH+ss6wP+Au+zVLSI
	Lk53grJWGQ8h1NVzQirQGLKs2QNy45Lh/8EJrESAlcNaC2nIw3Ob+WsQdg2hytGkAqAoLN
	QUZSv0fCBHIJysyiecYtl6rVOaJ675jtD0Qvc/bYobUwIlkaZ5zJUy3m4NZogy8DO3OjWn
	jI80cUC6T9CWPu3CqLHpCtPX4NyclOoB4xRYGIqRzhWO9kMsvLdP8+PiAkQuWR9Fqzd6gU
	nUTl4yL1OkZt5R3Iz87yi60D94C6HbzwggvXAIzfHp+cpRa16+fbs8A0Okz+Sg==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Thu, 10 Apr 2025 16:53:20 +0200
Subject: [PATCH 3/3] uio: Add UIO_DMABUF_HEAP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-uio-dma-v1-3-6468ace2c786@bootlin.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
In-Reply-To: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepuegrshhtihgvnhcuvehurhhuthgthhgvthcuoegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtvdehfffgjeduteekgeekuddvffejueevkeektdeggfetkeeghefffeehudethfenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrheegngdpmhgrihhlfhhrohhmpegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdro
 hhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnrghrohdqmhhmqdhsihhgsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrshhtihgvnhdrtghurhhuthgthhgvthessghoohhtlhhinhdrtghomh
X-GND-Sasl: bastien.curutchet@bootlin.com

Some UIO users need to access DMA addresses from userspace to be able to
configure DMA done by the UIO device. Currently there is no way of doing
this.

Add a UIO_DMABUF_HEAP Kconfig option. When selected, a dma-heap
allocator is created for every new UIO device. This allocator only
implements 4 basic operations: allocate, release, mmap and get_dma_addr.
The buffer allocation is done through dma_alloc_coherent().

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/uio/Kconfig        |   9 ++++
 drivers/uio/Makefile       |   1 +
 drivers/uio/uio.c          |   4 ++
 drivers/uio/uio_heap.c     | 120 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/uio_driver.h |   2 +
 5 files changed, 136 insertions(+)

diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
index b060dcd7c6350191726c0830a1ae7b9a388ca4bb..2f3b1e57fceb01354b65cc4d39f342f645a238db 100644
--- a/drivers/uio/Kconfig
+++ b/drivers/uio/Kconfig
@@ -164,4 +164,13 @@ config UIO_DFL
 	    opae-sdk/tools/libopaeuio/
 
 	  If you compile this as a module, it will be called uio_dfl.
+
+config UIO_DMABUF_HEAP
+	bool "DMA-BUF UIO Heap"
+	select DMABUF_HEAPS
+	help
+	  Choose this option to enable DMA-BUF UIO heap. It will create a new
+	  heap allocator under /dev/dma_heap/ for every UIO device. This
+	  allocator allows userspace applications to allocate DMA buffers and
+	  access their DMA addresses thanks to the DMA_BUF_IOCTL_GET_DMA_HANDLE
 endif
diff --git a/drivers/uio/Makefile b/drivers/uio/Makefile
index 1c5f3b5a95cf5b681a843b745a046d7ce123255d..f6696daa36567a4e5d18b1b89ba688057e758400 100644
--- a/drivers/uio/Makefile
+++ b/drivers/uio/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_UIO_MF624)         += uio_mf624.o
 obj-$(CONFIG_UIO_FSL_ELBC_GPCM)	+= uio_fsl_elbc_gpcm.o
 obj-$(CONFIG_UIO_HV_GENERIC)	+= uio_hv_generic.o
 obj-$(CONFIG_UIO_DFL)	+= uio_dfl.o
+obj-$(CONFIG_UIO_DMABUF_HEAP) += uio_heap.o
diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index d93ed4e86a174b5bad193a61aa522cd833fe7bb5..f31936a897805a284165cccfee3d66e96acd4b39 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -1046,7 +1046,11 @@ int __uio_register_device(struct module *owner,
 		}
 	}
 
+#if defined(CONFIG_UIO_DMABUF_HEAP)
+	return add_uio_heap(idev);
+#else
 	return 0;
+#endif
 
 err_request_irq:
 	uio_dev_del_attributes(idev);
diff --git a/drivers/uio/uio_heap.c b/drivers/uio/uio_heap.c
new file mode 100644
index 0000000000000000000000000000000000000000..2e836b503458e280babba0e0adc4f6d8344efc82
--- /dev/null
+++ b/drivers/uio/uio_heap.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/uio_driver.h>
+
+struct uio_heap {
+	struct dma_heap *heap;
+	struct device *dev;
+};
+
+struct uio_heap_buffer {
+	struct uio_heap *heap;
+	dma_addr_t dma_addr;
+	unsigned long len;
+	void *vaddr;
+};
+
+static int uio_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct uio_heap_buffer *buffer = dmabuf->priv;
+
+	return dma_mmap_coherent(buffer->heap->dev, vma, buffer->vaddr,
+				 buffer->dma_addr, buffer->len);
+}
+
+static void uio_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct uio_heap_buffer *buffer = dmabuf->priv;
+
+	dma_free_coherent(buffer->heap->dev, buffer->len, buffer->vaddr,
+			  buffer->dma_addr);
+	kfree(buffer);
+}
+
+static int uio_heap_get_dma_addr(struct dma_buf *dmabuf, u64 *addr)
+{
+	struct uio_heap_buffer *buffer = dmabuf->priv;
+
+	*addr = buffer->dma_addr;
+	return 0;
+}
+
+static const struct dma_buf_ops uio_heap_buf_ops = {
+	.mmap = uio_heap_mmap,
+	.release = uio_heap_dma_buf_release,
+	.get_dma_addr = uio_heap_get_dma_addr,
+};
+
+static struct dma_buf *uio_heap_allocate(struct dma_heap *heap,
+					 unsigned long len,
+					 u32 fd_flags,
+					 u64 heap_flags)
+{
+	struct uio_heap *uio_heap = dma_heap_get_drvdata(heap);
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct uio_heap_buffer *buffer;
+	struct dma_buf *dmabuf;
+
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return ERR_PTR(-ENOMEM);
+
+	dma_set_coherent_mask(uio_heap->dev, DMA_BIT_MASK(32));
+
+	buffer->heap = uio_heap;
+	buffer->len = len;
+	buffer->vaddr = dma_alloc_coherent(uio_heap->dev, buffer->len,
+					   &buffer->dma_addr, GFP_KERNEL);
+	if (IS_ERR(buffer->vaddr))
+		goto free_buf;
+
+	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.ops = &uio_heap_buf_ops;
+	exp_info.size = buffer->len;
+	exp_info.flags = fd_flags;
+	exp_info.priv = buffer;
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf))
+		goto free_dma;
+
+	return dmabuf;
+
+free_dma:
+	dma_free_coherent(uio_heap->dev, buffer->len, buffer->vaddr, buffer->dma_addr);
+free_buf:
+	kfree(buffer);
+
+	return ERR_PTR(-ENOMEM);
+}
+
+static const struct dma_heap_ops uio_heap_ops = {
+	.allocate = uio_heap_allocate,
+};
+
+int add_uio_heap(struct uio_device *uio)
+{
+	struct dma_heap_export_info exp_info;
+	struct uio_heap *uio_heap;
+
+	uio_heap = kzalloc(sizeof(*uio_heap), GFP_KERNEL);
+	if (!uio_heap)
+		return -ENOMEM;
+
+	uio_heap->dev = &uio->dev;
+
+	/* Use device name as heap name */
+	exp_info.name = uio_heap->dev->kobj.name;
+	exp_info.ops = &uio_heap_ops;
+	exp_info.priv = uio_heap;
+
+	uio_heap->heap = dma_heap_add(&exp_info);
+	if (IS_ERR(uio_heap->heap)) {
+		int ret = PTR_ERR(uio_heap->heap);
+
+		kfree(uio_heap);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/include/linux/uio_driver.h b/include/linux/uio_driver.h
index 18238dc8bfd356a20996ba6cd84f1ff508bbb81c..f8b774d2fa1c7de4b6af881f1e53dfa9f25b3dbf 100644
--- a/include/linux/uio_driver.h
+++ b/include/linux/uio_driver.h
@@ -143,6 +143,8 @@ extern int __must_check
 				   struct device *parent,
 				   struct uio_info *info);
 
+extern int add_uio_heap(struct uio_device *uio);
+
 /* use a define to avoid include chaining to get THIS_MODULE */
 
 /**

-- 
2.49.0


