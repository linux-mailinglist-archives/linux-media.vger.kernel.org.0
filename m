Return-Path: <linux-media+bounces-26286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1160A3A007
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 15:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BA8D1889D18
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 14:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CACF26AA9A;
	Tue, 18 Feb 2025 14:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BY03jPkz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7E26A0D1
	for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739889342; cv=none; b=I9fQzwfAkStBQLd6WFRTLejnrJkuA98oxepATBaMwizewLH6n/JjFMibaO0Gh4/SuyZR91jgyuXbkPfTD+g5g9FdQvD5VLTsgMP2bhy4CW7ZC869otesXxpaiPXje6OCWt84Qn63EX6uj33rK49YtIRDeAcmcbjsdwbDZi+6+qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739889342; c=relaxed/simple;
	bh=3QwjNj0ROdzqLW71IRTDhiQ0v1pIcRutbYPvI7OCWac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P6iNN+84WkjxOefprqmcOij5dd87bguSrLE/VjXO5XGLCExgqaFShpd5Q2fdacCEKU+rAejOgKoL5Z5HGPPTbg61PVnadSm9PDHQ5wiIoGvhihPjdS7m2QxD3iSUXG/wXNfBm+lRrNOoy1qRQZtzdOiB0OHWUwDqOUfqaqrIYUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BY03jPkz; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30613802a6bso57525581fa.1
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 06:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739889338; x=1740494138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSw2Z+vDYpMcPS9QNEoQcbq77hOYHck6fzByPwaDKgI=;
        b=BY03jPkz7YPdrMl50ZpK6IJmV8hRlvrHFIXDyxd6bmaT8HefDrUMYFyWU6dQ4W5z3h
         vN+JJZWMyOresHOMQD2ACXCLItl+KHfxIYJdFtGPLN9kvYwQjORUfcD3aIlaTKON7O35
         L+LL7Fx7eYWJP868ObV1gIGwQ5/l2I0dbckw6+f3jE4woNkVrt3F410BTfvpOeiugJCW
         6rYsvEjSBR38Cru2geN2i7y1j3wvs9aAafyAyyArXPe4eZ4CNvWtrxZXUwQHHw3lTenJ
         MQAWqCjUFWh1sn6Z7fWLH90HbQ8ffMwx3/Vf6HqOossXZTaYucyE9pTclc3mFyoI56Pa
         Ey6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889338; x=1740494138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSw2Z+vDYpMcPS9QNEoQcbq77hOYHck6fzByPwaDKgI=;
        b=J7dCkoT9WaKchXSZjFjz/OyEE9eqfkcHP+XHY5JYXwqP+QlSLkvUixRBVWnuPxzlPG
         wZAgyaQnVfexiKuR5aKfgvA2hvgjdmoDh7Z15jaxjW2DxCI7QCPJO2C3Mev6+fysxkhY
         N7FY1cZgLkESHKw8+JCkGh0qn23Iz/UoMZBUk2YxE/XY0shWeA8Gjqhb4HRr9Ph8nLN2
         FVAO5dQa6NQ80pnoB3OHBNyHFbKdKHlJifIgoMOlG9FJEbvmg8iDKfvpnnJVhHmQugEo
         4x4lhlBMYDD2YKHfUHF0rJL2R2u/+tpiV0YWfl+nPLwyT8TKeBbYdG5uQ28Us8dNT2MS
         MdCg==
X-Forwarded-Encrypted: i=1; AJvYcCUtj/1hoQww4AvOOytgdbdCHRKfID/cUJyDfuIPB29vErzmjO2/NKTMbp0cA4LJ+xCSyFnNFkv2FjcGog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDHoESHuZuVOPflMVASjF2KqGcbKptyNyii4d3jzgAbCh7ER51
	JtOSqKnIo/BZ11NKEcmfd0K9KuyIAGjc5KTA3/dviol062blWNA9PliHIHCLHSA=
X-Gm-Gg: ASbGncuUoYMAPPiYzV6kAxagxcf0smCm+Gjg0ByFVjO7YLM8FHkTAQl6Am+dBKAs1ls
	zIC0bJdJg05ROoXAIoFKCBLFCOlKEuSRzoWzmLrRyWCeHDwudZ04+e0f/XFfTIUrLypqXT6LeUC
	PP/ux/P593Wz9bYAZViEJa/t6oxJlsfxtkRlnJgfaAMnd8KZ+VScUBcACVUhXkS0lQ4/eajC+R7
	vpDHFCdxqKaCWB9vVUq12zcH5Bh54A8CJ4SnQszvvS851Vns7EhYJmrydsXyy/5ENbflKVCsSew
	xozVDr4ZcrinEMG+0jq9Y3qVQfdZP3EuQ+QBjYfcIZWF3Qp06fgE6WpwpGXRy4VfmGtf
X-Google-Smtp-Source: AGHT+IF7f9ec48KaZv7M3tutHQN+6tTXNf+jaL1lxy33GRxn28Otk9evT4b6BnrHCYuKUlHmWKLqmQ==
X-Received: by 2002:a2e:9f54:0:b0:2fa:d2c3:a7e8 with SMTP id 38308e7fff4ca-30927a474a1mr39521641fa.13.1739889337817;
        Tue, 18 Feb 2025 06:35:37 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309311777a8sm12360831fa.25.2025.02.18.06.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:35:36 -0800 (PST)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 1/7] tee: add restricted memory allocation
Date: Tue, 18 Feb 2025 15:34:50 +0100
Message-ID: <20250218143527.1236668-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218143527.1236668-1-jens.wiklander@linaro.org>
References: <20250218143527.1236668-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add restricted memory allocation to the TEE subsystem.

Restricted memory refers to memory buffers behind a hardware enforced
firewall. It is not accessible to the kernel during normal circumstances
but rather only accessible to certain hardware IPs or CPUs executing in
higher privileged mode than the kernel itself. This interface allows to
allocate and manage such restricted memory buffers via interaction with
a TEE implementation.

A new ioctl TEE_IOC_RSTMEM_ALLOC is added to allocate these restricted
memory buffers.

The restricted memory is allocated for a specific use-case, like Secure
Video Playback, Trusted UI, or Secure Video Recording where certain
hardware devices can access the memory.

More use-cases can be added in userspace ABI, but it's up to the backend
drivers to provide the implementation.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/Makefile       |   1 +
 drivers/tee/tee_core.c     |  38 +++++++-
 drivers/tee/tee_private.h  |   2 +
 drivers/tee/tee_rstmem.c   | 180 +++++++++++++++++++++++++++++++++++++
 drivers/tee/tee_shm.c      |   2 +
 drivers/tee/tee_shm_pool.c |  69 +++++++++++++-
 include/linux/tee_core.h   |  15 ++++
 include/linux/tee_drv.h    |   2 +
 include/uapi/linux/tee.h   |  44 ++++++++-
 9 files changed, 349 insertions(+), 4 deletions(-)
 create mode 100644 drivers/tee/tee_rstmem.c

diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
index 5488cba30bd2..a4c6b55444b9 100644
--- a/drivers/tee/Makefile
+++ b/drivers/tee/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_TEE) += tee.o
 tee-objs += tee_core.o
 tee-objs += tee_shm.o
 tee-objs += tee_shm_pool.o
+tee-objs += tee_rstmem.o
 obj-$(CONFIG_OPTEE) += optee/
 obj-$(CONFIG_AMDTEE) += amdtee/
 obj-$(CONFIG_ARM_TSTEE) += tstee/
diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..f4a45b77753b 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015-2016, Linaro Limited
+ * Copyright (c) 2015-2022, 2024, Linaro Limited
  */
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/cdev.h>
 #include <linux/cred.h>
+#include <linux/dma-buf.h>
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/module.h>
@@ -815,6 +816,38 @@ static int tee_ioctl_supp_send(struct tee_context *ctx,
 	return rc;
 }
 
+static int
+tee_ioctl_rstmem_alloc(struct tee_context *ctx,
+		       struct tee_ioctl_rstmem_alloc_data __user *udata)
+{
+	struct tee_ioctl_rstmem_alloc_data data;
+	struct dma_buf *dmabuf;
+	int id;
+	int fd;
+
+	if (copy_from_user(&data, udata, sizeof(data)))
+		return -EFAULT;
+
+	if (data.use_case == TEE_IOC_UC_RESERVED)
+		return -EINVAL;
+
+	dmabuf = tee_rstmem_alloc(ctx, data.flags, data.use_case, data.size,
+				  &id);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+	if (put_user(id, &udata->id)) {
+		fd = -EFAULT;
+		goto err;
+	}
+	fd = dma_buf_fd(dmabuf, O_CLOEXEC);
+	if (fd < 0)
+		goto err;
+	return fd;
+err:
+	dma_buf_put(dmabuf);
+	return fd;
+}
+
 static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	struct tee_context *ctx = filp->private_data;
@@ -839,6 +872,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return tee_ioctl_supp_recv(ctx, uarg);
 	case TEE_IOC_SUPPL_SEND:
 		return tee_ioctl_supp_send(ctx, uarg);
+	case TEE_IOC_RSTMEM_ALLOC:
+		return tee_ioctl_rstmem_alloc(ctx, uarg);
 	default:
 		return -EINVAL;
 	}
@@ -1286,3 +1321,4 @@ MODULE_AUTHOR("Linaro");
 MODULE_DESCRIPTION("TEE Driver");
 MODULE_VERSION("1.0");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index 9bc50605227c..bf97796909c0 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -23,5 +23,7 @@ void teedev_ctx_put(struct tee_context *ctx);
 struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
 struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
 					  unsigned long addr, size_t length);
+struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
+				 u32 use_case, size_t size, int *shm_id);
 
 #endif /*TEE_PRIVATE_H*/
diff --git a/drivers/tee/tee_rstmem.c b/drivers/tee/tee_rstmem.c
new file mode 100644
index 000000000000..3b27594ec30b
--- /dev/null
+++ b/drivers/tee/tee_rstmem.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Linaro Limited
+ */
+#include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/genalloc.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/tee_core.h>
+#include "tee_private.h"
+
+struct tee_rstmem_attachment {
+	struct sg_table table;
+	struct device *dev;
+};
+
+static int rstmem_dma_attach(struct dma_buf *dmabuf,
+			     struct dma_buf_attachment *attachment)
+{
+	struct tee_shm *shm = dmabuf->priv;
+	struct tee_rstmem_attachment *a;
+	int rc;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	if (shm->pages) {
+		rc = sg_alloc_table_from_pages(&a->table, shm->pages,
+					       shm->num_pages, 0,
+					       shm->num_pages * PAGE_SIZE,
+					       GFP_KERNEL);
+		if (rc)
+			goto err;
+	} else {
+		rc = sg_alloc_table(&a->table, 1, GFP_KERNEL);
+		if (rc)
+			goto err;
+		sg_set_page(a->table.sgl, phys_to_page(shm->paddr), shm->size,
+			    0);
+	}
+
+	a->dev = attachment->dev;
+	attachment->priv = a;
+
+	return 0;
+err:
+	kfree(a);
+	return rc;
+}
+
+static void rstmem_dma_detach(struct dma_buf *dmabuf,
+			      struct dma_buf_attachment *attachment)
+{
+	struct tee_rstmem_attachment *a = attachment->priv;
+
+	sg_free_table(&a->table);
+	kfree(a);
+}
+
+static struct sg_table *
+rstmem_dma_map_dma_buf(struct dma_buf_attachment *attachment,
+		       enum dma_data_direction direction)
+{
+	struct tee_rstmem_attachment *a = attachment->priv;
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
+static void rstmem_dma_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				     struct sg_table *table,
+				     enum dma_data_direction direction)
+{
+	struct tee_rstmem_attachment *a = attachment->priv;
+
+	WARN_ON(&a->table != table);
+
+	dma_unmap_sgtable(attachment->dev, table, direction,
+			  DMA_ATTR_SKIP_CPU_SYNC);
+}
+
+static void rstmem_dma_buf_free(struct dma_buf *dmabuf)
+{
+	struct tee_shm *shm = dmabuf->priv;
+
+	tee_shm_put(shm);
+}
+
+static const struct dma_buf_ops rstmem_generic_buf_ops = {
+	.attach = rstmem_dma_attach,
+	.detach = rstmem_dma_detach,
+	.map_dma_buf = rstmem_dma_map_dma_buf,
+	.unmap_dma_buf = rstmem_dma_unmap_dma_buf,
+	.release = rstmem_dma_buf_free,
+};
+
+struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
+				 u32 use_case, size_t size, int *shm_id)
+{
+	struct tee_device *teedev = ctx->teedev;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf *dmabuf;
+	struct tee_shm *shm;
+	void *ret;
+	int rc;
+
+	if (!tee_device_get(teedev))
+		return ERR_PTR(-EINVAL);
+
+	if (!teedev->desc->ops->rstmem_alloc ||
+	    !teedev->desc->ops->rstmem_free) {
+		dmabuf = ERR_PTR(-EINVAL);
+		goto err;
+	}
+
+	shm = kzalloc(sizeof(*shm), GFP_KERNEL);
+	if (!shm) {
+		dmabuf = ERR_PTR(-ENOMEM);
+		goto err;
+	}
+
+	refcount_set(&shm->refcount, 1);
+	shm->flags = TEE_SHM_RESTRICTED;
+	shm->use_case = use_case;
+	shm->ctx = ctx;
+
+	mutex_lock(&teedev->mutex);
+	shm->id = idr_alloc(&teedev->idr, NULL, 1, 0, GFP_KERNEL);
+	mutex_unlock(&teedev->mutex);
+	if (shm->id < 0) {
+		dmabuf = ERR_PTR(shm->id);
+		goto err_kfree;
+	}
+
+	rc = teedev->desc->ops->rstmem_alloc(ctx, shm, flags, use_case, size);
+	if (rc) {
+		dmabuf = ERR_PTR(rc);
+		goto err_idr_remove;
+	}
+
+	mutex_lock(&teedev->mutex);
+	ret = idr_replace(&teedev->idr, shm, shm->id);
+	mutex_unlock(&teedev->mutex);
+	if (IS_ERR(ret)) {
+		dmabuf = ret;
+		goto err_rstmem_free;
+	}
+	teedev_ctx_get(ctx);
+
+	exp_info.ops = &rstmem_generic_buf_ops;
+	exp_info.size = shm->size;
+	exp_info.priv = shm;
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf)) {
+		tee_shm_put(shm);
+		return dmabuf;
+	}
+
+	*shm_id = shm->id;
+	return dmabuf;
+
+err_rstmem_free:
+	teedev->desc->ops->rstmem_free(ctx, shm);
+err_idr_remove:
+	mutex_lock(&teedev->mutex);
+	idr_remove(&teedev->idr, shm->id);
+	mutex_unlock(&teedev->mutex);
+err_kfree:
+	kfree(shm);
+err:
+	tee_device_put(teedev);
+	return dmabuf;
+}
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index daf6e5cfd59a..416f7f25d885 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -55,6 +55,8 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 				"unregister shm %p failed: %d", shm, rc);
 
 		release_registered_pages(shm);
+	} else if (shm->flags & TEE_SHM_RESTRICTED) {
+		teedev->desc->ops->rstmem_free(shm->ctx, shm);
 	}
 
 	teedev_ctx_put(shm->ctx);
diff --git a/drivers/tee/tee_shm_pool.c b/drivers/tee/tee_shm_pool.c
index 80004b55628d..ee57ef157a77 100644
--- a/drivers/tee/tee_shm_pool.c
+++ b/drivers/tee/tee_shm_pool.c
@@ -1,9 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015, 2017, 2022 Linaro Limited
+ * Copyright (c) 2015, 2017, 2022, 2024 Linaro Limited
  */
 #include <linux/device.h>
-#include <linux/dma-buf.h>
 #include <linux/genalloc.h>
 #include <linux/slab.h>
 #include <linux/tee_core.h>
@@ -90,3 +89,69 @@ struct tee_shm_pool *tee_shm_pool_alloc_res_mem(unsigned long vaddr,
 	return ERR_PTR(rc);
 }
 EXPORT_SYMBOL_GPL(tee_shm_pool_alloc_res_mem);
+
+static int rstmem_pool_op_gen_alloc(struct tee_shm_pool *pool,
+				    struct tee_shm *shm, size_t size,
+				    size_t align)
+{
+	size_t sz = ALIGN(size, PAGE_SIZE);
+	phys_addr_t pa;
+
+	pa = gen_pool_alloc(pool->private_data, sz);
+	if (!pa)
+		return -ENOMEM;
+
+	shm->size = sz;
+	shm->paddr = pa;
+
+	return 0;
+}
+
+static void rstmem_pool_op_gen_free(struct tee_shm_pool *pool,
+				    struct tee_shm *shm)
+{
+	gen_pool_free(pool->private_data, shm->paddr, shm->size);
+	shm->paddr = 0;
+}
+
+static struct tee_shm_pool_ops rstmem_pool_ops_generic = {
+	.alloc = rstmem_pool_op_gen_alloc,
+	.free = rstmem_pool_op_gen_free,
+	.destroy_pool = pool_op_gen_destroy_pool,
+};
+
+struct tee_shm_pool *tee_rstmem_gen_pool_alloc(phys_addr_t paddr, size_t size)
+{
+	const size_t page_mask = PAGE_SIZE - 1;
+	struct tee_shm_pool *pool;
+	int rc;
+
+	/* Check it's page aligned */
+	if ((paddr | size) & page_mask)
+		return ERR_PTR(-EINVAL);
+
+	pool = kzalloc(sizeof(*pool), GFP_KERNEL);
+	if (!pool)
+		return ERR_PTR(-ENOMEM);
+
+	pool->private_data = gen_pool_create(PAGE_SHIFT, -1);
+	if (!pool->private_data) {
+		rc = -ENOMEM;
+		goto err_free;
+	}
+
+	rc = gen_pool_add(pool->private_data, paddr, size, -1);
+	if (rc)
+		goto err_free_pool;
+
+	pool->ops = &rstmem_pool_ops_generic;
+	return pool;
+
+err_free_pool:
+	gen_pool_destroy(pool->private_data);
+err_free:
+	kfree(pool);
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL_GPL(tee_rstmem_gen_pool_alloc);
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index a38494d6b5f4..608302f494fe 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -26,6 +26,7 @@
 #define TEE_SHM_USER_MAPPED	BIT(1)  /* Memory mapped in user space */
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
+#define TEE_SHM_RESTRICTED	BIT(4)  /* Restricted memory */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
@@ -76,6 +77,8 @@ struct tee_device {
  * @supp_send:		called for supplicant to send a response
  * @shm_register:	register shared memory buffer in TEE
  * @shm_unregister:	unregister shared memory buffer in TEE
+ * @rstmem_alloc:	allocate restricted memory
+ * @rstmem_free:	free restricted memory
  */
 struct tee_driver_ops {
 	void (*get_version)(struct tee_device *teedev,
@@ -99,6 +102,9 @@ struct tee_driver_ops {
 			    struct page **pages, size_t num_pages,
 			    unsigned long start);
 	int (*shm_unregister)(struct tee_context *ctx, struct tee_shm *shm);
+	int (*rstmem_alloc)(struct tee_context *ctx, struct tee_shm *shm,
+			    u32 flags, u32 use_case, size_t size);
+	void (*rstmem_free)(struct tee_context *ctx, struct tee_shm *shm);
 };
 
 /**
@@ -229,6 +235,15 @@ static inline void tee_shm_pool_free(struct tee_shm_pool *pool)
 	pool->ops->destroy_pool(pool);
 }
 
+/**
+ * tee_rstmem_gen_pool_alloc() - Create a restricted memory manager
+ * @paddr:	Physical address of start of pool
+ * @size:	Size in bytes of the pool
+ *
+ * @returns pointer to a 'struct tee_shm_pool' or an ERR_PTR on failure.
+ */
+struct tee_shm_pool *tee_rstmem_gen_pool_alloc(phys_addr_t paddr, size_t size);
+
 /**
  * tee_get_drvdata() - Return driver_data pointer
  * @returns the driver_data pointer supplied to tee_register().
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index a54c203000ed..cba067715d14 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -55,6 +55,7 @@ struct tee_context {
  * @pages:	locked pages from userspace
  * @num_pages:	number of locked pages
  * @refcount:	reference counter
+ * @use_case:	defined by TEE_IOC_UC_* in tee.h
  * @flags:	defined by TEE_SHM_* in tee_core.h
  * @id:		unique id of a shared memory object on this device, shared
  *		with user space
@@ -71,6 +72,7 @@ struct tee_shm {
 	struct page **pages;
 	size_t num_pages;
 	refcount_t refcount;
+	u32 use_case;
 	u32 flags;
 	int id;
 	u64 sec_world_id;
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index d0430bee8292..88834448debb 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2015-2016, Linaro Limited
+ * Copyright (c) 2015-2017, 2020, 2024, Linaro Limited
  * All rights reserved.
  *
  * Redistribution and use in source and binary forms, with or without
@@ -48,6 +48,7 @@
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */
 #define TEE_GEN_CAP_REG_MEM	(1 << 2)/* Supports registering shared memory */
 #define TEE_GEN_CAP_MEMREF_NULL	(1 << 3)/* NULL MemRef support */
+#define TEE_GEN_CAP_RSTMEM	(1 << 4)/* Supports restricted memory */
 
 #define TEE_MEMREF_NULL		(__u64)(-1) /* NULL MemRef Buffer */
 
@@ -389,6 +390,47 @@ struct tee_ioctl_shm_register_data {
  */
 #define TEE_IOC_SHM_REGISTER   _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 9, \
 				     struct tee_ioctl_shm_register_data)
+
+#define TEE_IOC_UC_RESERVED		0
+#define TEE_IOC_UC_SECURE_VIDEO_PLAY	1
+#define TEE_IOC_UC_TRUSTED_UI		2
+#define TEE_IOC_UC_SECURE_VIDEO_RECORD	3
+
+/**
+ * struct tee_ioctl_rstmem_alloc_data - Restricted memory allocate argument
+ * @size:	[in/out] Size of restricted memory to allocate
+ * @flags:	[in/out] Flags to/from allocate
+ * @use_case	[in] Restricted memory use case, TEE_IOC_UC_*
+ * @id:		[out] Identifier of the restricted memory
+ */
+struct tee_ioctl_rstmem_alloc_data {
+	__u64 size;
+	__u32 flags;
+	__u32 use_case;
+	__s32 id;
+};
+
+/**
+ * TEE_IOC_RSTMEM_ALLOC - allocate restricted memory
+ *
+ * Allocates restricted physically memory normally not accessible by the
+ * kernel.
+ *
+ * Restricted memory refers to memory buffers behind a hardware enforced
+ * firewall. It is not accessible to the kernel during normal circumstances
+ * but rather only accessible to certain hardware IPs or CPUs executing in
+ * higher privileged mode than the kernel itself. This interface allows to
+ * allocate and manage such restricted memory buffers via interaction with
+ * a TEE implementation.
+ *
+ * Returns a file descriptor on success or < 0 on failure
+ *
+ * The returned file descriptor is a dma-buf that can be attached and
+ * mapped for device with permission to access the physical memory.
+ */
+#define TEE_IOC_RSTMEM_ALLOC     _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 10, \
+				       struct tee_ioctl_rstmem_alloc_data)
+
 /*
  * Five syscalls are used when communicating with the TEE driver.
  * open(): opens the device associated with the driver
-- 
2.43.0


