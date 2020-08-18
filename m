Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0B2247BE2
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 03:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgHRBiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 21:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgHRBh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 21:37:58 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A2FC061389
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 18:37:58 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y10so6885688plr.11
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 18:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ZAKk11xm2oOfJedv9nP0DN+H1or/1aNk009KihzXEs=;
        b=oQE/CMKqjwEx65Hg+U91eJ+C6nJvGO1SYrZnNGfhfNE6PxxGPibwVo/BNLyWvUkmDI
         U6orBy+iTnWgz00x4ARi30yeMMUxOYrD6aswv+owIZEHXC/P3QoatxDoZh8RfRC16FED
         a03bM4Z3Ca+YEIF8pUrBPuuZbS9CHsRd1vlew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ZAKk11xm2oOfJedv9nP0DN+H1or/1aNk009KihzXEs=;
        b=jnNajchdWjjjGPh3W2/FXK0ylvCQ0sxu5lz1Ozwc/459lTtAcmmpJAkBa/TlOgT8mN
         DZFQNchDr4Z4hX650BXsX2ORtCPfjFbhqeDNFu/+zjXQHZtqF97wnLcalCXtv7vt6X33
         GY3dOmpUkHdXNwvRi6CLvjfQMaiEKH64TedFsdj3zQ4klLBjpkFWdR2C2howZ6x265Mz
         hJ0eZsRTDtr7wlgWr+nDTFDxJEKoH9U5URoKLsLtadghcNnK23a7GDb8jH4T9UH4jNWb
         tYluJlckJ33ROakBNHIFsqEnGI++uC277SlE6e0yvm78LanRe54T7URpcnhu5p80NfMO
         rchw==
X-Gm-Message-State: AOAM530larodmYuJvk3+QTmGZMEvq/L38L5++kRdXEhkROht7tLRt8W7
        Ye8Oo5RVK7lBaaEbKuzPfDZHlw==
X-Google-Smtp-Source: ABdhPJxpdxKazeqW9JKyS2yi7ohSYJl1jjKgLYCrvK6Ju+A69z/PdgVt4G5g/C/i8aQTHtFE7UtDYw==
X-Received: by 2002:a17:90a:df11:: with SMTP id gp17mr14985285pjb.140.1597714678049;
        Mon, 17 Aug 2020 18:37:58 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:f693:9fff:fef4:a930])
        by smtp.gmail.com with ESMTPSA id s17sm12348691pgm.63.2020.08.17.18.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 18:37:57 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH v6 1/3] virtio: add dma-buf support for exported objects
Date:   Tue, 18 Aug 2020 10:37:42 +0900
Message-Id: <20200818013744.3327271-2-stevensd@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
In-Reply-To: <20200818013744.3327271-1-stevensd@chromium.org>
References: <20200818013744.3327271-1-stevensd@chromium.org>
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
 drivers/virtio/virtio.c         |  6 +++
 drivers/virtio/virtio_dma_buf.c | 82 +++++++++++++++++++++++++++++++++
 include/linux/virtio.h          |  1 +
 include/linux/virtio_dma_buf.h  | 37 +++++++++++++++
 5 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/linux/virtio_dma_buf.h

diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
index 29a1386ecc03..ecdae5b596de 100644
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
index 000000000000..63e6b1908397
--- /dev/null
+++ b/drivers/virtio/virtio_dma_buf.c
@@ -0,0 +1,82 @@
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
+ * @exp_info: [in] see dma_buf_export(). ops MUST refer to a dma_buf_ops
+ *	struct embedded in a virtio_dma_buf_ops.
+ *
+ * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
+ * for an virtio exported object that can be queried by other virtio drivers
+ * for the object's UUID.
+ */
+struct dma_buf *virtio_dma_buf_export(
+		const struct dma_buf_export_info *exp_info)
+{
+	const struct virtio_dma_buf_ops *virtio_ops = container_of(
+			exp_info->ops, const struct virtio_dma_buf_ops, ops);
+
+	if (!exp_info->ops
+		|| exp_info->ops->attach != &virtio_dma_buf_attach
+		|| !virtio_ops->get_uuid) {
+		return ERR_PTR(-EINVAL);
+	}
+
+	return dma_buf_export(exp_info);
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
+ * virtio_dma_buf_get_uuid - gets a virtio dma-buf's exported object's uuid
+ * @dma_buf: [in] buffer to query
+ * @uuid: [out] the uuid
+ *
+ * Returns: 0 on success, negative on failure.
+ */
+int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
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
+EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
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
index 000000000000..394bf04362d7
--- /dev/null
+++ b/include/linux/virtio_dma_buf.h
@@ -0,0 +1,37 @@
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
+ * @device_attach: [optional] callback invoked by virtio_dma_buf_attach during
+ *		   all attach operations.
+ * @get_uid: [required] callback to get the uuid of the exported object.
+ */
+struct virtio_dma_buf_ops {
+	struct dma_buf_ops ops;
+	int (*device_attach)(struct dma_buf *dma_buf,
+			     struct dma_buf_attachment *attach);
+	int (*get_uuid)(struct dma_buf *dma_buf, uuid_t *uuid);
+};
+
+int virtio_dma_buf_attach(struct dma_buf *dma_buf,
+			  struct dma_buf_attachment *attach);
+
+struct dma_buf *virtio_dma_buf_export(
+		const struct dma_buf_export_info *exp_info);
+bool is_virtio_dma_buf(struct dma_buf *dma_buf);
+int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf, uuid_t *uuid);
+
+#endif /* _LINUX_VIRTIO_DMA_BUF_H */
-- 
2.28.0.220.ged08abb693-goog

