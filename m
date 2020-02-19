Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14A53163E8F
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgBSII2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:08:28 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44691 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgBSII1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:08:27 -0500
Received: by mail-pf1-f194.google.com with SMTP id y5so12100262pfb.11
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 00:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g5stQAl3NJEC6fHUukjBTKJAHWCBbDmuSHHELLFMGqQ=;
        b=TtuG0PkxamL5+7VWhModU9V9jvnxOC1JbG2PpMhacSPsHkxJux3u4nR973vrgB4G+Q
         I/7B7d0+3Sk9dj8tUqt7xGg/aSgn4zMWLgAE1iMyNaOgexfS+bD4ter5Z7ndl1EwhmXU
         guNVtgSs2qp1TlzZ3L+46bBqFwN/nt2P6CzWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g5stQAl3NJEC6fHUukjBTKJAHWCBbDmuSHHELLFMGqQ=;
        b=DhRJS7bmGMZuKPvq9PTWhywsDEho3AJZ68baZhCaSNHaGxzvFQvreTymDxZNIQIV4m
         FyThuV95mhvTbwJfM/rw8cuxzz+GAjFICIKnmA1Uv1FpozEP9lvpLgJNrpTYGn6U5SN7
         iVAE6QH32dJiQ8jiP8+B3oZEhK8cBfiSsTNY0v4Dl6oEdfd8FqlDW+Ww2nNMfemDYZiW
         ql9sl4GH0vGcNG8/u/MIQL6sYd2MXSVrjOJ1pRwL00VO3sNJV71GVnhJtWOPu9uJ9QjX
         hN3LQBydkMLY1n9ri0DSlnKfRP7c/TpLKMNtlIZXoofO/Vf1cPWGc2rfYrA2/mTbHzXS
         8iGw==
X-Gm-Message-State: APjAAAVchDZXeERzXGLJ12hTavp5bqiljF9WGKZDdCIZLR9bGi+tyyVJ
        Zuo0FcsHDBr/4/zkHPVB3MI+5A==
X-Google-Smtp-Source: APXvYqxbX1TynOOZNyoZ2MSU0WcVRXogTe99/50ezhhQkciXIuR7zwPkIv8Ls5eGWvpKnJ6H0iazoA==
X-Received: by 2002:a65:68d8:: with SMTP id k24mr27688567pgt.208.1582099706567;
        Wed, 19 Feb 2020 00:08:26 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:1f16:51f4:8631:68b2])
        by smtp.gmail.com with ESMTPSA id z3sm1631943pfz.155.2020.02.19.00.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 00:08:26 -0800 (PST)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH 1/2] virtio: add dma-buf support for exported objects
Date:   Wed, 19 Feb 2020 17:06:36 +0900
Message-Id: <20200219080637.61312-2-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200219080637.61312-1-stevensd@chromium.org>
References: <20200219080637.61312-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This change adds a new flavor of dma-bufs that can be used by virtio
drivers to share exported objects. A virtio dma-buf can be queried by
virtio drivers to obtain the UUID which identifies the underlying
exported object.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/virtio/Makefile         |  2 +-
 drivers/virtio/virtio.c         |  6 ++
 drivers/virtio/virtio_dma_buf.c | 97 +++++++++++++++++++++++++++++++++
 include/linux/virtio.h          |  1 +
 include/linux/virtio_dma_buf.h  | 62 +++++++++++++++++++++
 5 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/linux/virtio_dma_buf.h

diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
index 3a2b5c5dcf46..0ad30f4cdb9f 100644
--- a/drivers/virtio/Makefile
+++ b/drivers/virtio/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
+obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
 obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
 obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
 virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index a977e32a88f2..5d46f0ded92d 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
 }
 EXPORT_SYMBOL_GPL(register_virtio_device);
 
+bool is_virtio_device(struct device *dev)
+{
+	return dev->bus == &virtio_bus;
+}
+EXPORT_SYMBOL_GPL(is_virtio_device);
+
 void unregister_virtio_device(struct virtio_device *dev)
 {
 	int index = dev->index; /* save for after device release */
diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
new file mode 100644
index 000000000000..1f7e2d50b189
--- /dev/null
+++ b/drivers/virtio/virtio_dma_buf.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * dma-bufs for virtio exported objects
+ *
+ * Copyright (C) 2020 Google, Inc.
+ */
+
+#include <linux/virtio_dma_buf.h>
+
+/**
+ * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
+ *
+ * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
+ * for an virtio exported object that can be queried by other virtio drivers
+ * for the object's UUID.
+ */
+struct dma_buf *virtio_dma_buf_export(
+		const struct virtio_dma_buf_export_info *virtio_exp_info)
+{
+	struct dma_buf_export_info exp_info;
+
+	if (!virtio_exp_info->ops
+		|| virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
+		|| !virtio_exp_info->ops->get_uuid) {
+		return ERR_PTR(-EINVAL);
+	}
+
+	exp_info.exp_name = virtio_exp_info->exp_name;
+	exp_info.owner = virtio_exp_info->owner;
+	exp_info.ops = &virtio_exp_info->ops->ops;
+	exp_info.size = virtio_exp_info->size;
+	exp_info.flags = virtio_exp_info->flags;
+	exp_info.resv = virtio_exp_info->resv;
+	exp_info.priv = virtio_exp_info->priv;
+	BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
+		     != sizeof(struct dma_buf_export_info));
+
+	return dma_buf_export(&exp_info);
+}
+EXPORT_SYMBOL(virtio_dma_buf_export);
+
+/**
+ * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
+ */
+int virtio_dma_buf_attach(struct dma_buf *dma_buf,
+			  struct dma_buf_attachment *attach)
+{
+	int ret;
+	const struct virtio_dma_buf_ops *ops = container_of(
+			dma_buf->ops, const struct virtio_dma_buf_ops, ops);
+
+	if (ops->virtio_attach && is_virtio_device(attach->dev)) {
+		ret = ops->virtio_attach(dma_buf, attach);
+		if (ret)
+			return ret;
+	}
+
+	if (ops->device_attach) {
+		ret = ops->device_attach(dma_buf, attach);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(virtio_dma_buf_attach);
+
+/**
+ * is_virtio_dma_buf - returns true if the given dma-buf is a virtio dma-buf
+ * @dma_buf: buffer to query
+ */
+bool is_virtio_dma_buf(struct dma_buf *dma_buf)
+{
+	return dma_buf->ops->attach == &virtio_dma_buf_attach;
+}
+EXPORT_SYMBOL(is_virtio_dma_buf);
+
+/**
+ * get_virtio_dma_buf_uuid - gets the uuid for the dma-buf's exported object
+ * @dma_buf: [in] buffer to query
+ * @uuid: [out] the uuid
+ *
+ * This function should only be called on dma_bufs attached to a virtio device.
+ *
+ * Returns: 0 on success, negative on failure.
+ */
+int get_virtio_dma_buf_uuid(struct dma_buf *dma_buf,
+			    uuid_t *uuid)
+{
+	const struct virtio_dma_buf_ops *ops = container_of(
+			dma_buf->ops, const struct virtio_dma_buf_ops, ops);
+
+	if (!is_virtio_dma_buf(dma_buf))
+		return -EINVAL;
+
+	return ops->get_uuid(dma_buf, uuid);
+}
+EXPORT_SYMBOL(get_virtio_dma_buf_uuid);
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 15f906e4a748..9397e25616c4 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -128,6 +128,7 @@ static inline struct virtio_device *dev_to_virtio(struct device *_dev)
 void virtio_add_status(struct virtio_device *dev, unsigned int status);
 int register_virtio_device(struct virtio_device *dev);
 void unregister_virtio_device(struct virtio_device *dev);
+bool is_virtio_device(struct device *dev);
 
 void virtio_break_device(struct virtio_device *dev);
 
diff --git a/include/linux/virtio_dma_buf.h b/include/linux/virtio_dma_buf.h
new file mode 100644
index 000000000000..d841a9115876
--- /dev/null
+++ b/include/linux/virtio_dma_buf.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * dma-bufs for virtio exported objects
+ *
+ * Copyright (C) 2020 Google, Inc.
+ */
+
+#ifndef _LINUX_VIRTIO_DMA_BUF_H
+#define _LINUX_VIRTIO_DMA_BUF_H
+
+#include <linux/dma-buf.h>
+#include <linux/uuid.h>
+#include <linux/virtio.h>
+
+/**
+ * struct virtio_dma_buf_ops - operations possible on exported object dma-buf
+ * @ops: the base dma_buf_ops. ops.attach MUST be virtio_dma_buf_attach.
+ * @virtio_attach: [optional] callback invoked by virtio_dma_buf_attach if
+ *		   the attaching device is a virtio device.
+ * @device_attach: [optional] callback invoked by virtio_dma_buf_attach during
+ *		   all attach operations.
+ * @get_uid: [required] callback to get the uuid of the exported object.
+ */
+struct virtio_dma_buf_ops {
+	struct dma_buf_ops ops;
+	int (*virtio_attach)(struct dma_buf *dma_buf,
+			     struct dma_buf_attachment *attach);
+	int (*device_attach)(struct dma_buf *dma_buf,
+			     struct dma_buf_attachment *attach);
+	int (*get_uuid)(struct dma_buf *dma_buf, uuid_t *uuid);
+};
+
+/**
+ * struct virtio_dma_buf_export_info - see struct dma_buf_export_info
+ */
+struct virtio_dma_buf_export_info {
+	const char *exp_name;
+	struct module *owner;
+	const struct virtio_dma_buf_ops *ops;
+	size_t size;
+	int flags;
+	struct dma_resv *resv;
+	void *priv;
+};
+
+/**
+ * DEFINE_VIRTIO_DMA_BUF_EXPORT_INFO - helper macro for exporters
+ */
+#define DEFINE_VIRTIO_DMA_BUF_EXPORT_INFO(name)	\
+	struct virtio_dma_buf_export_info name = { \
+		.exp_name = KBUILD_MODNAME, \
+		.owner = THIS_MODULE }
+
+int virtio_dma_buf_attach(struct dma_buf *dma_buf,
+			  struct dma_buf_attachment *attach);
+
+struct dma_buf *virtio_dma_buf_export(
+		const struct virtio_dma_buf_export_info *virtio_exp_info);
+bool is_virtio_dma_buf(struct dma_buf *dma_buf);
+int get_virtio_dma_buf_uuid(struct dma_buf *dma_buf, uuid_t *uuid);
+
+#endif /* _LINUX_VIRTIO_DMA_BUF_H */
-- 
2.25.0.265.gbab2e86ba0-goog

