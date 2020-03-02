Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0E8175A35
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 13:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgCBMPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 07:15:48 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33754 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727869AbgCBMPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 07:15:46 -0500
Received: by mail-pf1-f196.google.com with SMTP id n7so5505685pfn.0
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 04:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MCeo2KlvghZWVQTpBB2M3t/GqxIcmv4hUXrDyywqjuA=;
        b=KtxIhZ5KSuM307kYGYUjWPph23TtSi3zkl41oYk+e1N7AfE29LJ3C6CKjZkYNgKjpw
         4L7yKKgpbAX7P0xTk/2dEvii1zi6OjS959+FmubaRaysgfdGmCfNOp6qbVyZpA/iBBmT
         psh7VxYuvg7KhzEYy0kpZHTDWLa1eXUASldIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MCeo2KlvghZWVQTpBB2M3t/GqxIcmv4hUXrDyywqjuA=;
        b=TfvSWRAY9z+siyUlMV6rxkToEZ/eIcJPf+TZq0+bp7bAKGzyGqp+mb3kfkCyz8QqP/
         PHDp2qiLqCoIN6mZr4ZIE/ZVJ2fXskVUrTcK8DI7lAZLY8Yodx5JEn85/T/RrV0+w3X/
         HZxnZrIDL62+nRWtBsKetcpsUFfPro+rE627740Yd32ZqoyZZG/63YG+BH6t+Ji6upBl
         80M7mvD887uSJ/YuV4i+4bHd84b06Y29YsxPkFly/RqxyNWe77oHnEpPC9f+w6ZDCHpa
         dTBXFUZo/h5WDDoaCV3SSJgesPdIWSZgDCFA3Hayfc7dnpA5zJfvQ3fSoKS46ozgd//q
         ylyw==
X-Gm-Message-State: APjAAAXpznd1gmpw6OT379gftLDxphPAFoYmcKH83Jwyh2N+F9JVNPL5
        7QSG41U9GCWbaT/B350MKmlznA==
X-Google-Smtp-Source: APXvYqxIIxTmqhb5EzFiF3tO0HTYSibpGKOCSX4H52SA6OGSHfrVeCkQaE0nBxoudGWjDs99vgRxuQ==
X-Received: by 2002:a63:fc62:: with SMTP id r34mr19239431pgk.437.1583151344152;
        Mon, 02 Mar 2020 04:15:44 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id w26sm21819818pfj.119.2020.03.02.04.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 04:15:43 -0800 (PST)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 2/4] drm/prime: add support for virtio exported objects
Date:   Mon,  2 Mar 2020 21:15:22 +0900
Message-Id: <20200302121524.7543-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302121524.7543-1-stevensd@chromium.org>
References: <20200302121524.7543-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This change exposes dma-buf's get_uuid callback to PRIME drivers.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/drm_prime.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_drv.h       | 15 +++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 86d9b0e45c8c..fc6e932a4fa6 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -779,6 +779,30 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
 
+#ifdef CONFIG_VIRTIO
+/**
+ * drm_gem_dmabuf_get_uuid - dma_buf get_uuid implementation for GEM
+ * @dma_buf: buffer to query
+ * @uuid: uuid outparam
+ *
+ * Queries the buffer's virtio UUID. This can be used as the
+ * &dma_buf_ops.get_uuid callback. Calls into &drm_driver.gem_prime_get_uuid.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_gem_dmabuf_get_uuid(struct dma_buf *dma_buf, uuid_t *uuid)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+	struct drm_device *dev = obj->dev;
+
+	if (!dev->driver->gem_prime_get_uuid)
+		return -ENODEV;
+
+	return dev->driver->gem_prime_get_uuid(obj, uuid);
+}
+EXPORT_SYMBOL(drm_gem_dmabuf_get_uuid);
+#endif
+
 static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.cache_sgt_mapping = true,
 	.attach = drm_gem_map_attach,
@@ -789,6 +813,9 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
 	.vunmap = drm_gem_dmabuf_vunmap,
+#ifdef CONFIG_VIRTIO
+	.get_uuid = drm_gem_dmabuf_get_uuid,
+#endif
 };
 
 /**
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 77685ed7aa65..3cbe9aa6b44a 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -32,6 +32,10 @@
 
 #include <drm/drm_device.h>
 
+#ifdef CONFIG_VIRTIO
+#include <linux/uuid.h>
+#endif
+
 struct drm_file;
 struct drm_gem_object;
 struct drm_master;
@@ -639,6 +643,17 @@ struct drm_driver {
 	int (*gem_prime_mmap)(struct drm_gem_object *obj,
 				struct vm_area_struct *vma);
 
+#ifdef CONFIG_VIRTIO
+	/**
+	 * @gem_prime_get_uuid
+	 *
+	 * get_uuid hook for GEM drivers. Retrieves the virtio uuid of the
+	 * given GEM buffer.
+	 */
+	int (*gem_prime_get_uuid)(struct drm_gem_object *obj,
+				  uuid_t *uuid);
+#endif
+
 	/**
 	 * @dumb_create:
 	 *
-- 
2.25.0.265.gbab2e86ba0-goog

