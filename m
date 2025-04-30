Return-Path: <linux-media+bounces-31396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD915AA4629
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29F271BC8251
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A04221F1B;
	Wed, 30 Apr 2025 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jaYt98KW"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5DE21ABDF;
	Wed, 30 Apr 2025 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003542; cv=none; b=dj5QtC/UKZk7k0FV+5NWauviT1Mh10Yig6FatnMB6kLQtAGuPNA/Zp7FbGo6ZCz9+/dSK222P+fo7tBuDfD7kwZxz0VwYMNn4LgthA3OQwv+aygIH6CY7OH4cEcGdSAg3oMh5q3CwGM0tU/uwIwNKiZU9x+pgVJeG2eD4qIOE1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003542; c=relaxed/simple;
	bh=YwrepJ71g8/ylUSFehQewVyJXBac8qkJUhMVQTRCUu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Md8Nse/4ql7DOyyzEVOf1nncWPlNtKIjlFWw5+Dhme73v2PhFR6RW/Tz0OOCk3wCwL1ipb0b0sWSta+aEIjqDtqu0xVw7tpQA3MITs2MGhxWvcN69DPksuRANUcVcr/GmG4RNbVXPl72R0V/bfcJveiNpC7q7yupl1vJrDX28A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jaYt98KW; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=g8Ktf
	6Uf8MsFSBk1Ec9eCHLgv5uK78ZOHjRCxH628q4=; b=jaYt98KWbf2Yv11PFDv71
	A0NtM/3DDdj8KdOKKcDY9GCv4BMgtaQM+P6/6EEuxBBC4fsIViSAGSgZxF+9sI9O
	r3Nu903asUsnp7/RFnO6O17fSl7SvSsWd/5zCvT61PIW+TDd+m4lK2mPlML0NyH2
	pwoCNxeWSQIxgqXdVqlyuo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD351ze5RFo2yEaBg--.45889S3;
	Wed, 30 Apr 2025 16:57:59 +0800 (CST)
From: oushixiong1025@163.com
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>,
	Sean Paul <sean@poorly.run>,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH 2/3] drm/prime: Support importing DMA-BUF without sg_table
Date: Wed, 30 Apr 2025 16:56:57 +0800
Message-Id: <20250430085658.540746-2-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430085658.540746-1-oushixiong1025@163.com>
References: <20250430085658.540746-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgD351ze5RFo2yEaBg--.45889S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF1rGw15Jr13Kw4ruFy8Xwb_yoWxKFyDpF
	sxZFyUKrWYqFWqgF93A3ZrAa45uw4Iga1I9rWfJw4Y93Wktr1qkF98Ar98Zry5JryDJF1f
	tFyDtFyrAryjkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZeOJUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRc-D2gR5W4O-wAAs5

From: Shixiong Ou <oushixiong@kylinos.cn>

[WHY]
On some boards, the dma_mask of Aspeed devices is 0xffff_ffff, this
quite possibly causes the SWIOTLB to be triggered when importing dmabuf.
However IO_TLB_SEGSIZE limits the maximum amount of available memory
for DMA Streaming Mapping, as dmesg following:

[   24.885303][ T1947] ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)

[HOW] Provide an interface so that attachment is not mapped when
importing dma-buf.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/ast/ast_drv.c          |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c | 17 +++++++
 drivers/gpu/drm/drm_prime.c            | 67 ++++++++++++++++++++++++--
 drivers/gpu/drm/udl/udl_drv.c          |  2 +-
 include/drm/drm_drv.h                  |  3 ++
 include/drm/drm_gem_shmem_helper.h     |  6 +++
 6 files changed, 91 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 6fbf62a99c48..2dac6acf79e7 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -64,7 +64,7 @@ static const struct drm_driver ast_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d99dee67353a..655d841df933 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -799,6 +799,23 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
 
+struct drm_gem_object *
+drm_gem_shmem_prime_import_attachment(struct drm_device *dev,
+				      struct dma_buf_attachment *attach)
+{
+	size_t size = PAGE_ALIGN(attach->dmabuf->size);
+	struct drm_gem_shmem_object *shmem;
+
+	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
+	if (IS_ERR(shmem))
+		return ERR_CAST(shmem);
+
+	drm_dbg_prime(dev, "size = %zu\n", size);
+
+	return &shmem->base;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_attachment);
+
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 8e70abca33b9..522cf974e202 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -911,6 +911,62 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 }
 EXPORT_SYMBOL(drm_gem_prime_export);
 
+/**
+ * drm_gem_prime_import_dev_skip_map - core implementation of the import callback
+ * @dev: drm_device to import into
+ * @dma_buf: dma-buf object to import
+ * @attach_dev: struct device to dma_buf attach
+ *
+ * This function exports a dma-buf without get it's scatter/gather table.
+ *
+ * Drivers who need to get an scatter/gather table for objects need to call
+ * drm_gem_prime_import_dev() instead.
+ */
+struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
+							 struct dma_buf *dma_buf,
+							 struct device *attach_dev)
+{
+	struct dma_buf_attachment *attach;
+	struct drm_gem_object *obj;
+	int ret;
+
+	if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
+		obj = dma_buf->priv;
+		if (obj->dev == dev) {
+			/*
+			 * Importing dmabuf exported from our own gem increases
+			 * refcount on gem itself instead of f_count of dmabuf.
+			 */
+			drm_gem_object_get(obj);
+			return obj;
+		}
+	}
+
+	attach = dma_buf_attach(dma_buf, attach_dev, true);
+	if (IS_ERR(attach))
+		return ERR_CAST(attach);
+
+	get_dma_buf(dma_buf);
+
+	obj = dev->driver->gem_prime_import_attachment(dev, attach);
+	if (IS_ERR(obj)) {
+		ret = PTR_ERR(obj);
+		goto fail_detach;
+	}
+
+	obj->import_attach = attach;
+	obj->resv = dma_buf->resv;
+
+	return obj;
+
+fail_detach:
+	dma_buf_detach(dma_buf, attach);
+	dma_buf_put(dma_buf);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(drm_gem_prime_import_dev_skip_map);
+
 /**
  * drm_gem_prime_import_dev - core implementation of the import callback
  * @dev: drm_device to import into
@@ -946,9 +1002,6 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 		}
 	}
 
-	if (!dev->driver->gem_prime_import_sg_table)
-		return ERR_PTR(-EINVAL);
-
 	attach = dma_buf_attach(dma_buf, attach_dev, false);
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
@@ -998,7 +1051,13 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
 struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf)
 {
-	return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
+	if (dev->driver->gem_prime_import_sg_table)
+		return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
+	else if (dev->driver->gem_prime_import_attachment)
+		return drm_gem_prime_import_dev_skip_map(dev, dma_buf, dev->dev);
+	else
+		return ERR_PTR(-EINVAL);
+
 }
 EXPORT_SYMBOL(drm_gem_prime_import);
 
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 05b3a152cc33..c00d8b8834f2 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -72,7 +72,7 @@ static const struct drm_driver driver = {
 
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
 	.gem_prime_import = udl_driver_gem_prime_import,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index a43d707b5f36..aef8d9051fcd 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -326,6 +326,9 @@ struct drm_driver {
 				struct dma_buf_attachment *attach,
 				struct sg_table *sgt);
 
+	struct drm_gem_object *(*gem_prime_import_attachment)(
+				struct drm_device *dev,
+				struct dma_buf_attachment *attach);
 	/**
 	 * @dumb_create:
 	 *
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index cef5a6b5a4d6..39a93c222aaa 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -274,6 +274,9 @@ struct drm_gem_object *
 drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 				    struct dma_buf_attachment *attach,
 				    struct sg_table *sgt);
+struct drm_gem_object *
+drm_gem_shmem_prime_import_attachment(struct drm_device *dev,
+				      struct dma_buf_attachment *attach);
 int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args);
 
@@ -287,4 +290,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
 	.dumb_create		   = drm_gem_shmem_dumb_create
 
+#define DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS \
+	.gem_prime_import_attachment = drm_gem_shmem_prime_import_attachment, \
+	.dumb_create                 = drm_gem_shmem_dumb_create
 #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
-- 
2.17.1


