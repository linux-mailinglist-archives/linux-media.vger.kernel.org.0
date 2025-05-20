Return-Path: <linux-media+bounces-32931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE4FABDF16
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 17:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DB4D16C3EE
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6120726C3AF;
	Tue, 20 May 2025 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vYaayUT1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CD2266EEA
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754690; cv=none; b=Q1cl3ImXy+LDuagaVgI7ign4cJLDRuB/iHhe8OvcfoghEZ3iBukL9CGoi3FLehoXyLSw4lysvP7jlNz/UTMMSciwLolkNdDEooV+DlBcLXkhAeiJXiShF6HlkUr5CyEPunzo/sFGZmSCM7pKDYIxPSS+ZrzTYNOrpGVDapURObI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754690; c=relaxed/simple;
	bh=lsTPYGnEZvxIiBysY8RyiViCW3nEXJAj+aom6wL/FfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJMDOm4NKtSRES78PT1LMooDYfCsxaIBWxSr/4eCzZoSXj9tzcUuOuGQJgOI9VJmMldiQJstS80KtW6dgZkJCQVFWuj5Sl3XuHcvl2ANfvGnDl73NaEL6PAPkFTjaFZUrqBIp95qLfIYzI7k+OdYgpm1bR3RPcMhthDzcqLjoH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vYaayUT1; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad560321ed9so353076766b.1
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754686; x=1748359486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bl8y9iP5U+Xm+6TVvU2xw4CnUhmFn/1OadGtY/yvq4=;
        b=vYaayUT14fIRvi7Az11UCiUCT6FoifzFpFTEEzm+svwvyij1JUPKytr5EbSuUEO1Uk
         AZXH82z73IJAD/FURRgO6ujPW6okZMeRaDFFZYR9uKBTP4mueegusaJcWNO4QC7vtbVX
         pBX9Re3+xcoVCBrGSPCQ2oBgvHTlsT/GmKeGbtSZjmgk4Eyq5j3b78WSgzSkxyEkRGGk
         FsH1cN1/raFxjD3ohSkL6QIVe2c7uCPAnCRkxHEN8amVvTHEXHNxwHgxBZZgQZ4fXmD9
         mXFGCYog5ej8vzbHW7R01j92mZNMPivMy1gK2CvFC0K76GYnGlH5SVF+2vDpfojn+8MQ
         E7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754686; x=1748359486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bl8y9iP5U+Xm+6TVvU2xw4CnUhmFn/1OadGtY/yvq4=;
        b=XM7Okgax14FEYrEZJQqLzgfwUi6/ylpUWBb3MJNTA+qDbAkMWTwdLlfgOuqWCmBEoy
         5lVf3fKKxGrBefaCFpsaC+ll8HvZ6ZxHxNWT62cnEfO+E9eldtza38tCUshzZjkjNbFl
         GNbea9qSrxMaKh46QbzsUzcQVlHnLF7WguVLB+FQwX4GsGTLqB2fkGPy8UqvVS29s8pk
         2DCXEZ8CuT5gJcIwbDlnGzcHr+YGyZ/8ELFd8+mf/WN94NKNz8dPgwHLkUg4B1sokAN4
         5VgxbtCJ/xoLKQxwUHeJbqgKJ4FPn7bA0j4b+/pr2RpNBeZ5eRi4vrAwgp6KFWGf0QUI
         WUvw==
X-Forwarded-Encrypted: i=1; AJvYcCXA7qwrdyoaRtGpVFPX7F9zmAGJf3oLyXgQEwE52RlkdBJBpYwcTH/GDGZAouGcthPb2RUTr9ups0m/uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBIf3alC2XyBQCpEvSndE3IvYi8lickrHDFP+gKNiOFHjRk26u
	P6HI1+Ucj90l8+LxSCVCCYnfp3JqGfXCNxpj2CwVSxCta9FJQ+xlfYHUFNo1T3nbHEo=
X-Gm-Gg: ASbGncuatVCeBCHfqGMxo51iqZCJGt3ejydFAyBmAZjQ7nEcK8o6l/Vts3/a6K3w+ov
	jitQwKr/gwx4AvQRzdZShN6IqgKnogoozDj3zUuLrLhWASRtbgcMisxOFm64QLM+G1XzMvBrwXj
	9pkMdTHUX81yWhXkAw0Aqsj1k3KihXAqq3pjiiBdBoLLOA7izPstIW4GvtVDOEnvuEOYpOopK8w
	45cgeP/G0U7pvS8DVq7g9liRjUOhP+7eH5LQX6YNEyCZUAKDyVNzLbyd2RJlF74LnRjo36PS/Kv
	5vA51MgXCp2+JZHcyUwLw72uvQLoBUo4mf+Gf6xAZKMDA7VSKq79bRGI7REKcfeNRBtTA9d+cS7
	DpbLFeIRm/9deQsJcXtNeaHbSk6IMLILlGuy5TTE=
X-Google-Smtp-Source: AGHT+IGYsUU2+/wZX9KVnCNjKQuqsHQtS7q46txUWoFzPF0Y5yaantzw3YenC93TVWOgKL9pRfUVfQ==
X-Received: by 2002:a17:906:3450:b0:ad5:35ab:7a8 with SMTP id a640c23a62f3a-ad535ab08a3mr1172847866b.55.1747754686179;
        Tue, 20 May 2025 08:24:46 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:45 -0700 (PDT)
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
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v9 3/9] tee: implement protected DMA-heap
Date: Tue, 20 May 2025 17:16:46 +0200
Message-ID: <20250520152436.474778-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement DMA heap for protected DMA-buf allocation in the TEE
subsystem.

Restricted memory refers to memory buffers behind a hardware enforced
firewall. It is not accessible to the kernel during normal circumstances
but rather only accessible to certain hardware IPs or CPUs executing in
higher or differently privileged mode than the kernel itself. This
interface allows to allocate and manage such protected memory buffers
via interaction with a TEE implementation.

The protected memory is allocated for a specific use-case, like Secure
Video Playback, Trusted UI, or Secure Video Recording where certain
hardware devices can access the memory.

The DMA-heaps are enabled explicitly by the TEE backend driver. The TEE
backend drivers needs to implement protected memory pool to manage the
protected memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/Makefile      |   1 +
 drivers/tee/tee_heap.c    | 487 ++++++++++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h |   6 +
 include/linux/tee_core.h  |  65 +++++
 4 files changed, 559 insertions(+)
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
index 000000000000..a332805f9f26
--- /dev/null
+++ b/drivers/tee/tee_heap.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Linaro Limited
+ */
+
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
+	struct tee_protmem_pool *pool;
+	struct tee_device *teedev;
+	/* Protects pool and teedev above */
+	struct mutex mu;
+};
+
+struct tee_heap_buffer {
+	struct tee_protmem_pool *pool;
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
+struct tee_protmem_static_pool {
+	struct tee_protmem_pool pool;
+	struct gen_pool *gen_pool;
+	phys_addr_t pa_base;
+	void *base;
+};
+
+#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
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
+	struct tee_protmem_pool *pool;
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
+		goto err_protmem_free;
+
+	return dmabuf;
+
+err_protmem_free:
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
+		return "protected,secure-video";
+	case TEE_DMA_HEAP_TRUSTED_UI:
+		return "protected,trusted-ui";
+	case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
+		return "protected,secure-video-record";
+	default:
+		return NULL;
+	}
+}
+
+static int alloc_dma_heap(struct tee_device *teedev, enum tee_dma_heap_id id,
+			  struct tee_protmem_pool *pool)
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
+				 struct tee_protmem_pool *pool)
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
+EXPORT_SYMBOL_GPL(tee_device_register_dma_heap);
+
+void tee_device_unregister_all_dma_heaps(struct tee_device *teedev)
+{
+	struct tee_protmem_pool *pool;
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
+				 struct tee_protmem_pool *pool __always_unused)
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
+static struct tee_protmem_static_pool *
+to_protmem_static_pool(struct tee_protmem_pool *pool)
+{
+	return container_of(pool, struct tee_protmem_static_pool, pool);
+}
+
+static int protmem_pool_op_static_alloc(struct tee_protmem_pool *pool,
+					struct sg_table *sgt, size_t size,
+					size_t *offs)
+{
+	struct tee_protmem_static_pool *stp = to_protmem_static_pool(pool);
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
+static void protmem_pool_op_static_free(struct tee_protmem_pool *pool,
+					struct sg_table *sgt)
+{
+	struct tee_protmem_static_pool *stp = to_protmem_static_pool(pool);
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sgtable_sg(sgt, sg, i)
+		gen_pool_free(stp->gen_pool, sg_phys(sg), sg->length);
+	sg_free_table(sgt);
+}
+
+static int protmem_pool_op_static_update_shm(struct tee_protmem_pool *pool,
+					     struct sg_table *sgt, size_t offs,
+					     struct tee_shm *shm,
+					     struct tee_shm **parent_shm)
+{
+	struct tee_protmem_static_pool *stp = to_protmem_static_pool(pool);
+
+	shm->paddr = stp->pa_base + offs;
+	*parent_shm = NULL;
+
+	return 0;
+}
+
+static void protmem_pool_op_static_destroy_pool(struct tee_protmem_pool *pool)
+{
+	struct tee_protmem_static_pool *stp = to_protmem_static_pool(pool);
+
+	gen_pool_destroy(stp->gen_pool);
+	memunmap(stp->base);
+	kfree(stp);
+}
+
+static struct tee_protmem_pool_ops protmem_pool_ops_static = {
+	.alloc = protmem_pool_op_static_alloc,
+	.free = protmem_pool_op_static_free,
+	.update_shm = protmem_pool_op_static_update_shm,
+	.destroy_pool = protmem_pool_op_static_destroy_pool,
+};
+
+struct tee_protmem_pool *tee_protmem_static_pool_alloc(phys_addr_t paddr,
+						       size_t size)
+{
+	const size_t page_mask = PAGE_SIZE - 1;
+	struct tee_protmem_static_pool *stp;
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
+	/*
+	 * Map the memory as uncached to make sure the kernel can work with
+	 * __pfn_to_page() and friends since that's needed when passing the
+	 * protected DMA-buf to a device. The memory should otherwise not
+	 * be touched by the kernel since it's likely to cause an external
+	 * abort due to the protection status.
+	 */
+	stp->base = memremap(paddr, size, MEMREMAP_WC);
+	if (!stp->base) {
+		rc = -EINVAL;
+		goto err_free;
+	}
+
+	stp->gen_pool = gen_pool_create(PAGE_SHIFT, -1);
+	if (!stp->gen_pool) {
+		rc = -ENOMEM;
+		goto err_unmap;
+	}
+
+	rc = gen_pool_add(stp->gen_pool, paddr, size, -1);
+	if (rc)
+		goto err_free_pool;
+
+	stp->pool.ops = &protmem_pool_ops_static;
+	stp->pa_base = paddr;
+	return &stp->pool;
+
+err_free_pool:
+	gen_pool_destroy(stp->gen_pool);
+err_unmap:
+	memunmap(stp->base);
+err_free:
+	kfree(stp);
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL_GPL(tee_protmem_static_pool_alloc);
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
index a38494d6b5f4..b8b99c97e00c 100644
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
@@ -116,6 +124,36 @@ struct tee_desc {
 	u32 flags;
 };
 
+/**
+ * struct tee_protmem_pool - protected memory pool
+ * @ops:		operations
+ *
+ * This is an abstract interface where this struct is expected to be
+ * embedded in another struct specific to the implementation.
+ */
+struct tee_protmem_pool {
+	const struct tee_protmem_pool_ops *ops;
+};
+
+/**
+ * struct tee_protmem_pool_ops - protected memory pool operations
+ * @alloc:		called when allocating protected memory
+ * @free:		called when freeing protected memory
+ * @update_shm:		called when registering a dma-buf to update the @shm
+ *			with physical address of the buffer or to return the
+ *			@parent_shm of the memory pool
+ * @destroy_pool:	called when destroying the pool
+ */
+struct tee_protmem_pool_ops {
+	int (*alloc)(struct tee_protmem_pool *pool, struct sg_table *sgt,
+		     size_t size, size_t *offs);
+	void (*free)(struct tee_protmem_pool *pool, struct sg_table *sgt);
+	int (*update_shm)(struct tee_protmem_pool *pool, struct sg_table *sgt,
+			  size_t offs, struct tee_shm *shm,
+			  struct tee_shm **parent_shm);
+	void (*destroy_pool)(struct tee_protmem_pool *pool);
+};
+
 /**
  * tee_device_alloc() - Allocate a new struct tee_device instance
  * @teedesc:	Descriptor for this driver
@@ -154,6 +192,11 @@ int tee_device_register(struct tee_device *teedev);
  */
 void tee_device_unregister(struct tee_device *teedev);
 
+int tee_device_register_dma_heap(struct tee_device *teedev,
+				 enum tee_dma_heap_id id,
+				 struct tee_protmem_pool *pool);
+void tee_device_unregister_all_dma_heaps(struct tee_device *teedev);
+
 /**
  * tee_device_set_dev_groups() - Set device attribute groups
  * @teedev:	Device to register
@@ -229,6 +272,28 @@ static inline void tee_shm_pool_free(struct tee_shm_pool *pool)
 	pool->ops->destroy_pool(pool);
 }
 
+/**
+ * tee_protmem_static_pool_alloc() - Create a protected memory manager
+ * @paddr:	Physical address of start of pool
+ * @size:	Size in bytes of the pool
+ *
+ * @returns pointer to a 'struct tee_shm_pool' or an ERR_PTR on failure.
+ */
+struct tee_protmem_pool *tee_protmem_static_pool_alloc(phys_addr_t paddr,
+						       size_t size);
+
+/**
+ * tee_protmem_pool_free() - Free a protected memory pool
+ * @pool:	The protected memory pool to free
+ *
+ * There must be no remaining protected memory allocated from this pool
+ * when this function is called.
+ */
+static inline void tee_protmem_pool_free(struct tee_protmem_pool *pool)
+{
+	pool->ops->destroy_pool(pool);
+}
+
 /**
  * tee_get_drvdata() - Return driver_data pointer
  * @returns the driver_data pointer supplied to tee_register().
-- 
2.43.0


