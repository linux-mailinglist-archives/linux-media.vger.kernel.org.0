Return-Path: <linux-media+bounces-27626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCAA4FFBE
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1457E16BFA5
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91B324E4A6;
	Wed,  5 Mar 2025 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fdNpWnH/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6FB24DFF9
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180019; cv=none; b=IIdpSpROu0JO67EZ7BtkKFIgYmYUbXnQQuGNy3OEfOzFuX3wghDzXRsnUv8HRYTdJTf2BmlFdvrj9t7mnukawfQi/vLIDxtOkvQOwaJjUKG/8JPutxkaJ5S3+PIVaPP3WI5oWXZTsg8g1vAFRdf3PzCQUCYyuEDOutbzpfjhDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180019; c=relaxed/simple;
	bh=3shnqngrEyjrgHR4EUbJ3v8C6gwyfXgvQ3zrDaUBzcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uEj8o+UWnf2dKNrIfvpkF3w6rRE4N4KSKft9qBZdOCb7zKaN8sorPWGDEhsaPANWsKBQvbq8lIjIz5aCO5AEQyv+2QAa6F4dU5EztflOSwV4tUNhjTfNl40zX+Ufdt0fzx7I/3teWLi4xBJHTpaYhE0GIz0TQ34zta5+pgEnZ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fdNpWnH/; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so1813230a12.0
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 05:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180014; x=1741784814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4A2RMjc7+ET06/OLz7LUVQUp9/M2mVREMhZjdI+mgFg=;
        b=fdNpWnH/Gp4+Ra6aEYJPTHb0oXSvgpsTkigE4kxgJFVSnrMdb/aBxhkKeyjQm2nwqV
         BaoLu611cuRWNf+q9WbMK5iBVhQ3+DHUaorPUJrx7yx9Ft+w015psadJh1k6IJCCjWrO
         mjn2IUZbydauIcr6Y3YbeD72QgGvkioo/Fe0NI8W0cyb7NOJbyYjUnULkaZBKpZap+9T
         Y6HPg7xf7V0Sbcslw+bMOUBt389jNKjbDB9SbsMRgknZsn7/28vLlMz+f7rNhR0pHQho
         g1TAzSwXhV6tmpfUeAByft0Oxrh9R/LiIYPRZQhHkAI2fSUpEZbXu8EmHspv0WHmqnuN
         aivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180014; x=1741784814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4A2RMjc7+ET06/OLz7LUVQUp9/M2mVREMhZjdI+mgFg=;
        b=HatxIrBROzRmzqGtoSAFA8XGX1L6Q1r7yrITj+lHVVH6zmaNmzZbkJNWWhSCgA4DBn
         sjqsQ9PehAuFkLVfITwgXyc3dY6R05rRLx4a6nSYxYlyIAsF0UJ/xOFE3766ys2Dbsbj
         QzpDzcMzeKtuSoaK5p+Kw9g4uvguBusP8hhAVBencPrYGgRQs/lUwrnCRo+nJ1pQOPj4
         kC4vtbGH5zmg3pJUuxoj9IjVu+Ej75g/sokutpMbhqCdsp1QU3iDxJTj75f3Dv64eoDh
         mS95gToRjRoDZvLlg7OBqvy1KSNMtyJxqqzxF6+UIuFWdrgrfvfVaHeUyo7ymQxQhweK
         200w==
X-Forwarded-Encrypted: i=1; AJvYcCWmEcT8/qTgXmQ1Akgp8BXPCisN04CBh3XFlOfvIqbDcR7JynxrvHkEZpsc2BHKgcwx+v88RnI+P5Mjrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvElFGrgCKDuo3ctcdYcM+LRvjariStf+eKqttfdvC6NwR4fo6
	XIVvK7PftwyJmChT7sYMDa0F5A1jqKL+nQI9Ah2WSlM+MlH1TbTKnECO1WNn72M=
X-Gm-Gg: ASbGnctniUT79+RD21shUuWWzCQEK6bXBzx7Q0kNY+28kCBoUsKIJFKXdY9dI/VM1l4
	ZKeTOdomUAe/QAl2rqQR1vYoXqJKJT9NAWjufZBKPN2gNJI55ZbVnUP8y1C9sTkv5GreoJHSHJ1
	Q+1ZKZpmK8Oif/tXhIa/+kGp8j0d7JmkUqdcfTmVvEfEnpkLwqNn5Q6+6LDbCEGFA8DaZzxzO3Q
	s6F3urIxivqTiCtZdezaJ8zy+dhMuAxJTyykQkvvdmocu2fn1UEWtNEQlZ8JyplOsWbURjBado/
	24fDzD2LMuFAAQ4JOip0JA1CTDoaHdr/krOV/AqJFOs1WGHVVcxj09RCDIZJOI+1/7uv2juZ9Ps
	j6IKe1qldWt7oruDIhJ8zXA==
X-Google-Smtp-Source: AGHT+IFwVg2fe30YJ6NhkeUa+m2OUhrYsSvmDZcpiLEWIsMefC5Un9QvScvwsJSP1T5LTCC7FAF7Mw==
X-Received: by 2002:a05:6402:2742:b0:5dc:eb2:570d with SMTP id 4fb4d7f45d1cf-5e59f0dc9d3mr3049042a12.2.1741180014215;
        Wed, 05 Mar 2025 05:06:54 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:06:53 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 05/10] tee: implement restricted DMA-heap
Date: Wed,  5 Mar 2025 14:04:11 +0100
Message-ID: <20250305130634.1850178-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement DMA heap for restricted DMA-buf allocation in the TEE
subsystem.

Restricted memory refers to memory buffers behind a hardware enforced
firewall. It is not accessible to the kernel during normal circumstances
but rather only accessible to certain hardware IPs or CPUs executing in
higher or differently privileged mode than the kernel itself. This
interface allows to allocate and manage such restricted memory buffers
via interaction with a TEE implementation.

The restricted memory is allocated for a specific use-case, like Secure
Video Playback, Trusted UI, or Secure Video Recording where certain
hardware devices can access the memory.

The DMA-heaps are enabled explicitly by the TEE backend driver. The TEE
backend drivers needs to implement restricted memory pool to manage the
restricted memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/Makefile      |   1 +
 drivers/tee/tee_heap.c    | 470 ++++++++++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h |   6 +
 include/linux/tee_core.h  |  62 +++++
 4 files changed, 539 insertions(+)
 create mode 100644 drivers/tee/tee_heap.c

diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
index 5488cba30bd2..949a6a79fb06 100644
--- a/drivers/tee/Makefile
+++ b/drivers/tee/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TEE) += tee.o
 tee-objs += tee_core.o
+tee-objs += tee_heap.o
 tee-objs += tee_shm.o
 tee-objs += tee_shm_pool.o
 obj-$(CONFIG_OPTEE) += optee/
diff --git a/drivers/tee/tee_heap.c b/drivers/tee/tee_heap.c
new file mode 100644
index 000000000000..476ab2e27260
--- /dev/null
+++ b/drivers/tee/tee_heap.c
@@ -0,0 +1,470 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Linaro Limited
+ */
+
+#include <linux/scatterlist.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/genalloc.h>
+#include <linux/module.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/tee_core.h>
+#include <linux/xarray.h>
+
+#include "tee_private.h"
+
+struct tee_dma_heap {
+	struct dma_heap *heap;
+	enum tee_dma_heap_id id;
+	struct tee_rstmem_pool *pool;
+	struct tee_device *teedev;
+	/* Protects pool and teedev above */
+	struct mutex mu;
+};
+
+struct tee_heap_buffer {
+	struct tee_rstmem_pool *pool;
+	struct tee_device *teedev;
+	size_t size;
+	size_t offs;
+	struct sg_table table;
+};
+
+struct tee_heap_attachment {
+	struct sg_table table;
+	struct device *dev;
+};
+
+struct tee_rstmem_static_pool {
+	struct tee_rstmem_pool pool;
+	struct gen_pool *gen_pool;
+	phys_addr_t pa_base;
+};
+
+#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
+static DEFINE_XARRAY_ALLOC(tee_dma_heap);
+
+static int copy_sg_table(struct sg_table *dst, struct sg_table *src)
+{
+	struct scatterlist *dst_sg;
+	struct scatterlist *src_sg;
+	int ret;
+	int i;
+
+	ret = sg_alloc_table(dst, src->orig_nents, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	dst_sg = dst->sgl;
+	for_each_sgtable_sg(src, src_sg, i) {
+		sg_set_page(dst_sg, sg_page(src_sg), src_sg->length,
+			    src_sg->offset);
+		dst_sg = sg_next(dst_sg);
+	}
+
+	return 0;
+}
+
+static int tee_heap_attach(struct dma_buf *dmabuf,
+			   struct dma_buf_attachment *attachment)
+{
+	struct tee_heap_buffer *buf = dmabuf->priv;
+	struct tee_heap_attachment *a;
+	int ret;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	ret = copy_sg_table(&a->table, &buf->table);
+	if (ret) {
+		kfree(a);
+		return ret;
+	}
+
+	a->dev = attachment->dev;
+	attachment->priv = a;
+
+	return 0;
+}
+
+static void tee_heap_detach(struct dma_buf *dmabuf,
+			    struct dma_buf_attachment *attachment)
+{
+	struct tee_heap_attachment *a = attachment->priv;
+
+	sg_free_table(&a->table);
+	kfree(a);
+}
+
+static struct sg_table *
+tee_heap_map_dma_buf(struct dma_buf_attachment *attachment,
+		     enum dma_data_direction direction)
+{
+	struct tee_heap_attachment *a = attachment->priv;
+	int ret;
+
+	ret = dma_map_sgtable(attachment->dev, &a->table, direction,
+			      DMA_ATTR_SKIP_CPU_SYNC);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &a->table;
+}
+
+static void tee_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				   struct sg_table *table,
+				   enum dma_data_direction direction)
+{
+	struct tee_heap_attachment *a = attachment->priv;
+
+	WARN_ON(&a->table != table);
+
+	dma_unmap_sgtable(attachment->dev, table, direction,
+			  DMA_ATTR_SKIP_CPU_SYNC);
+}
+
+static void tee_heap_buf_free(struct dma_buf *dmabuf)
+{
+	struct tee_heap_buffer *buf = dmabuf->priv;
+	struct tee_device *teedev = buf->teedev;
+
+	buf->pool->ops->free(buf->pool, &buf->table);
+	tee_device_put(teedev);
+}
+
+static const struct dma_buf_ops tee_heap_buf_ops = {
+	.attach = tee_heap_attach,
+	.detach = tee_heap_detach,
+	.map_dma_buf = tee_heap_map_dma_buf,
+	.unmap_dma_buf = tee_heap_unmap_dma_buf,
+	.release = tee_heap_buf_free,
+};
+
+static struct dma_buf *tee_dma_heap_alloc(struct dma_heap *heap,
+					  unsigned long len, u32 fd_flags,
+					  u64 heap_flags)
+{
+	struct tee_dma_heap *h = dma_heap_get_drvdata(heap);
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct tee_device *teedev = NULL;
+	struct tee_heap_buffer *buf;
+	struct tee_rstmem_pool *pool;
+	struct dma_buf *dmabuf;
+	int rc;
+
+	mutex_lock(&h->mu);
+	if (tee_device_get(h->teedev)) {
+		teedev = h->teedev;
+		pool = h->pool;
+	}
+	mutex_unlock(&h->mu);
+
+	if (!teedev)
+		return ERR_PTR(-EINVAL);
+
+	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf) {
+		dmabuf = ERR_PTR(-ENOMEM);
+		goto err;
+	}
+	buf->size = len;
+	buf->pool = pool;
+	buf->teedev = teedev;
+
+	rc = pool->ops->alloc(pool, &buf->table, len, &buf->offs);
+	if (rc) {
+		dmabuf = ERR_PTR(rc);
+		goto err_kfree;
+	}
+
+	exp_info.ops = &tee_heap_buf_ops;
+	exp_info.size = len;
+	exp_info.priv = buf;
+	exp_info.flags = fd_flags;
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf))
+		goto err_rstmem_free;
+
+	return dmabuf;
+
+err_rstmem_free:
+	pool->ops->free(pool, &buf->table);
+err_kfree:
+	kfree(buf);
+err:
+	tee_device_put(h->teedev);
+	return dmabuf;
+}
+
+static const struct dma_heap_ops tee_dma_heap_ops = {
+	.allocate = tee_dma_heap_alloc,
+};
+
+static const char *heap_id_2_name(enum tee_dma_heap_id id)
+{
+	switch (id) {
+	case TEE_DMA_HEAP_SECURE_VIDEO_PLAY:
+		return "restricted,secure-video";
+	case TEE_DMA_HEAP_TRUSTED_UI:
+		return "restricted,trusted-ui";
+	case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
+		return "restricted,secure-video-record";
+	default:
+		return NULL;
+	}
+}
+
+static int alloc_dma_heap(struct tee_device *teedev, enum tee_dma_heap_id id,
+			  struct tee_rstmem_pool *pool)
+{
+	struct dma_heap_export_info exp_info = {
+		.ops = &tee_dma_heap_ops,
+		.name = heap_id_2_name(id),
+	};
+	struct tee_dma_heap *h;
+	int rc;
+
+	if (!exp_info.name)
+		return -EINVAL;
+
+	if (xa_reserve(&tee_dma_heap, id, GFP_KERNEL)) {
+		if (!xa_load(&tee_dma_heap, id))
+			return -EEXIST;
+		return -ENOMEM;
+	}
+
+	h = kzalloc(sizeof(*h), GFP_KERNEL);
+	if (!h)
+		return -ENOMEM;
+	h->id = id;
+	h->teedev = teedev;
+	h->pool = pool;
+	mutex_init(&h->mu);
+
+	exp_info.priv = h;
+	h->heap = dma_heap_add(&exp_info);
+	if (IS_ERR(h->heap)) {
+		rc = PTR_ERR(h->heap);
+		kfree(h);
+
+		return rc;
+	}
+
+	/* "can't fail" due to the call to xa_reserve() above */
+	return WARN(xa_store(&tee_dma_heap, id, h, GFP_KERNEL),
+		    "xa_store() failed");
+}
+
+int tee_device_register_dma_heap(struct tee_device *teedev,
+				 enum tee_dma_heap_id id,
+				 struct tee_rstmem_pool *pool)
+{
+	struct tee_dma_heap *h;
+	int rc;
+
+	h = xa_load(&tee_dma_heap, id);
+	if (h) {
+		mutex_lock(&h->mu);
+		if (h->teedev) {
+			rc = -EBUSY;
+		} else {
+			h->teedev = teedev;
+			h->pool = pool;
+			rc = 0;
+		}
+		mutex_unlock(&h->mu);
+	} else {
+		rc = alloc_dma_heap(teedev, id, pool);
+	}
+
+	if (rc)
+		dev_err(&teedev->dev, "can't register DMA heap id %d (%s)\n",
+			id, heap_id_2_name(id));
+
+	return rc;
+}
+
+void tee_device_unregister_all_dma_heaps(struct tee_device *teedev)
+{
+	struct tee_rstmem_pool *pool;
+	struct tee_dma_heap *h;
+	u_long i;
+
+	xa_for_each(&tee_dma_heap, i, h) {
+		if (h) {
+			pool = NULL;
+			mutex_lock(&h->mu);
+			if (h->teedev == teedev) {
+				pool = h->pool;
+				h->teedev = NULL;
+				h->pool = NULL;
+			}
+			mutex_unlock(&h->mu);
+			if (pool)
+				pool->ops->destroy_pool(pool);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(tee_device_unregister_all_dma_heaps);
+
+int tee_heap_update_from_dma_buf(struct tee_device *teedev,
+				 struct dma_buf *dmabuf, size_t *offset,
+				 struct tee_shm *shm,
+				 struct tee_shm **parent_shm)
+{
+	struct tee_heap_buffer *buf;
+	int rc;
+
+	/* The DMA-buf must be from our heap */
+	if (dmabuf->ops != &tee_heap_buf_ops)
+		return -EINVAL;
+
+	buf = dmabuf->priv;
+	/* The buffer must be from the same teedev */
+	if (buf->teedev != teedev)
+		return -EINVAL;
+
+	shm->size = buf->size;
+
+	rc = buf->pool->ops->update_shm(buf->pool, &buf->table, buf->offs, shm,
+					parent_shm);
+	if (!rc && *parent_shm)
+		*offset = buf->offs;
+
+	return rc;
+}
+#else
+int tee_device_register_dma_heap(struct tee_device *teedev __always_unused,
+				 enum tee_dma_heap_id id __always_unused,
+				 struct tee_rstmem_pool *pool __always_unused)
+{
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(tee_device_register_dma_heap);
+
+void
+tee_device_unregister_all_dma_heaps(struct tee_device *teedev __always_unused)
+{
+}
+EXPORT_SYMBOL_GPL(tee_device_unregister_all_dma_heaps);
+
+int tee_heap_update_from_dma_buf(struct tee_device *teedev __always_unused,
+				 struct dma_buf *dmabuf __always_unused,
+				 size_t *offset __always_unused,
+				 struct tee_shm *shm __always_unused,
+				 struct tee_shm **parent_shm __always_unused)
+{
+	return -EINVAL;
+}
+#endif
+
+static struct tee_rstmem_static_pool *
+to_rstmem_static_pool(struct tee_rstmem_pool *pool)
+{
+	return container_of(pool, struct tee_rstmem_static_pool, pool);
+}
+
+static int rstmem_pool_op_static_alloc(struct tee_rstmem_pool *pool,
+				       struct sg_table *sgt, size_t size,
+				       size_t *offs)
+{
+	struct tee_rstmem_static_pool *stp = to_rstmem_static_pool(pool);
+	phys_addr_t pa;
+	int ret;
+
+	pa = gen_pool_alloc(stp->gen_pool, size);
+	if (!pa)
+		return -ENOMEM;
+
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (ret) {
+		gen_pool_free(stp->gen_pool, pa, size);
+		return ret;
+	}
+
+	sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);
+	*offs = pa - stp->pa_base;
+
+	return 0;
+}
+
+static void rstmem_pool_op_static_free(struct tee_rstmem_pool *pool,
+				       struct sg_table *sgt)
+{
+	struct tee_rstmem_static_pool *stp = to_rstmem_static_pool(pool);
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sgtable_sg(sgt, sg, i)
+		gen_pool_free(stp->gen_pool, sg_phys(sg), sg->length);
+	sg_free_table(sgt);
+}
+
+static int rstmem_pool_op_static_update_shm(struct tee_rstmem_pool *pool,
+					    struct sg_table *sgt, size_t offs,
+					    struct tee_shm *shm,
+					    struct tee_shm **parent_shm)
+{
+	struct tee_rstmem_static_pool *stp = to_rstmem_static_pool(pool);
+
+	shm->paddr = stp->pa_base + offs;
+	*parent_shm = NULL;
+
+	return 0;
+}
+
+static void rstmem_pool_op_static_destroy_pool(struct tee_rstmem_pool *pool)
+{
+	struct tee_rstmem_static_pool *stp = to_rstmem_static_pool(pool);
+
+	gen_pool_destroy(stp->gen_pool);
+	kfree(stp);
+}
+
+static struct tee_rstmem_pool_ops rstmem_pool_ops_static = {
+	.alloc = rstmem_pool_op_static_alloc,
+	.free = rstmem_pool_op_static_free,
+	.update_shm = rstmem_pool_op_static_update_shm,
+	.destroy_pool = rstmem_pool_op_static_destroy_pool,
+};
+
+struct tee_rstmem_pool *tee_rstmem_static_pool_alloc(phys_addr_t paddr,
+						     size_t size)
+{
+	const size_t page_mask = PAGE_SIZE - 1;
+	struct tee_rstmem_static_pool *stp;
+	int rc;
+
+	/* Check it's page aligned */
+	if ((paddr | size) & page_mask)
+		return ERR_PTR(-EINVAL);
+
+	stp = kzalloc(sizeof(*stp), GFP_KERNEL);
+	if (!stp)
+		return ERR_PTR(-ENOMEM);
+
+	stp->gen_pool = gen_pool_create(PAGE_SHIFT, -1);
+	if (!stp->gen_pool) {
+		rc = -ENOMEM;
+		goto err_free;
+	}
+
+	rc = gen_pool_add(stp->gen_pool, paddr, size, -1);
+	if (rc)
+		goto err_free_pool;
+
+	stp->pool.ops = &rstmem_pool_ops_static;
+	stp->pa_base = paddr;
+	return &stp->pool;
+
+err_free_pool:
+	gen_pool_destroy(stp->gen_pool);
+err_free:
+	kfree(stp);
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL_GPL(tee_rstmem_static_pool_alloc);
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index 9bc50605227c..6c6ff5d5eed2 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -8,6 +8,7 @@
 #include <linux/cdev.h>
 #include <linux/completion.h>
 #include <linux/device.h>
+#include <linux/dma-buf.h>
 #include <linux/kref.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
@@ -24,4 +25,9 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
 struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
 					  unsigned long addr, size_t length);
 
+int tee_heap_update_from_dma_buf(struct tee_device *teedev,
+				 struct dma_buf *dmabuf, size_t *offset,
+				 struct tee_shm *shm,
+				 struct tee_shm **parent_shm);
+
 #endif /*TEE_PRIVATE_H*/
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index a38494d6b5f4..16ef078247ae 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -8,9 +8,11 @@
 
 #include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/dma-buf.h>
 #include <linux/idr.h>
 #include <linux/kref.h>
 #include <linux/list.h>
+#include <linux/scatterlist.h>
 #include <linux/tee.h>
 #include <linux/tee_drv.h>
 #include <linux/types.h>
@@ -30,6 +32,12 @@
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
 
+enum tee_dma_heap_id {
+	TEE_DMA_HEAP_SECURE_VIDEO_PLAY = 1,
+	TEE_DMA_HEAP_TRUSTED_UI,
+	TEE_DMA_HEAP_SECURE_VIDEO_RECORD,
+};
+
 /**
  * struct tee_device - TEE Device representation
  * @name:	name of device
@@ -116,6 +124,33 @@ struct tee_desc {
 	u32 flags;
 };
 
+/**
+ * struct tee_rstmem_pool - restricted memory pool
+ * @ops:		operations
+ *
+ * This is an abstract interface where this struct is expected to be
+ * embedded in another struct specific to the implementation.
+ */
+struct tee_rstmem_pool {
+	const struct tee_rstmem_pool_ops *ops;
+};
+
+/**
+ * struct tee_rstmem_pool_ops - restricted memory pool operations
+ * @alloc:		called when allocating restricted memory
+ * @free:		called when freeing restricted memory
+ * @destroy_pool:	called when destroying the pool
+ */
+struct tee_rstmem_pool_ops {
+	int (*alloc)(struct tee_rstmem_pool *pool, struct sg_table *sgt,
+		     size_t size, size_t *offs);
+	void (*free)(struct tee_rstmem_pool *pool, struct sg_table *sgt);
+	int (*update_shm)(struct tee_rstmem_pool *pool, struct sg_table *sgt,
+			  size_t offs, struct tee_shm *shm,
+			  struct tee_shm **parent_shm);
+	void (*destroy_pool)(struct tee_rstmem_pool *pool);
+};
+
 /**
  * tee_device_alloc() - Allocate a new struct tee_device instance
  * @teedesc:	Descriptor for this driver
@@ -154,6 +189,11 @@ int tee_device_register(struct tee_device *teedev);
  */
 void tee_device_unregister(struct tee_device *teedev);
 
+int tee_device_register_dma_heap(struct tee_device *teedev,
+				 enum tee_dma_heap_id id,
+				 struct tee_rstmem_pool *pool);
+void tee_device_unregister_all_dma_heaps(struct tee_device *teedev);
+
 /**
  * tee_device_set_dev_groups() - Set device attribute groups
  * @teedev:	Device to register
@@ -229,6 +269,28 @@ static inline void tee_shm_pool_free(struct tee_shm_pool *pool)
 	pool->ops->destroy_pool(pool);
 }
 
+/**
+ * tee_rstmem_static_pool_alloc() - Create a restricted memory manager
+ * @paddr:	Physical address of start of pool
+ * @size:	Size in bytes of the pool
+ *
+ * @returns pointer to a 'struct tee_shm_pool' or an ERR_PTR on failure.
+ */
+struct tee_rstmem_pool *tee_rstmem_static_pool_alloc(phys_addr_t paddr,
+						     size_t size);
+
+/**
+ * tee_rstmem_pool_free() - Free a restricted memory pool
+ * @pool:	The restricted memory pool to free
+ *
+ * There must be no remaining restricted memory allocated from this pool
+ * when this function is called.
+ */
+static inline void tee_rstmem_pool_free(struct tee_rstmem_pool *pool)
+{
+	pool->ops->destroy_pool(pool);
+}
+
 /**
  * tee_get_drvdata() - Return driver_data pointer
  * @returns the driver_data pointer supplied to tee_register().
-- 
2.43.0


