Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1571B1816AD
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 12:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbgCKLUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 07:20:30 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40726 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729138AbgCKLU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 07:20:29 -0400
Received: by mail-pl1-f194.google.com with SMTP id h11so950837plk.7
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 04:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HbNivqIBs4pO6i4JqhZUJefImajxMHo9WsbKwRa5KuU=;
        b=BLZlM4VsvKYHd4VLsroG9x3pc9BkKgFIdNxhZjBjjm/+j1sEDSnWY3afVjyUu7R6PM
         bisd04NTMJZyGDEK6+/B/pplIvIEPM5REXLbhgmATI7bvqLjrR1V4s3Oo7De/j21DCt2
         p3alVM4+Krbfjf5UHngcmpJiWwKY/s217aLkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HbNivqIBs4pO6i4JqhZUJefImajxMHo9WsbKwRa5KuU=;
        b=Eyyr0g70gsD93IrNU5xfclhd8JuTaCmZiSarjU8o8/L+Lgn+OI4gRt7vPDe3eR+n/R
         sOBzOjjqSGqeq+g+q5Fz1QBpgYaFZGDP534ggUWVNnDn37WzVbztca4HhaP/jgje0lg6
         J0YhpYVd/Ph/FbPf3Fmls2sEbTW1IWRFzwBZN82x5oUAJ2IQSzkaqg8ij7HIJJt6zpAm
         Q4mBAeqNWvO3rPWPLqzD90v7WYAzKYIYBGYOtJbv+4/bSjQ0MwaM0l7PF6J3zrJVIlQR
         wO0v5syjtjycaGcbhME6oPW5bQgH9gkZ7smH8NEdcnmPZQtiXfQwPZGpyOU/GC3VV1MR
         HIsQ==
X-Gm-Message-State: ANhLgQ0I6L/+FpxX2mTKSg5vHpFVPbFHmoAUA/Fgkp88/9hV8QEvHhUs
        s5+En7BWQy6RCwFMT3y0JHlXJg==
X-Google-Smtp-Source: ADFU+vtvpxb5f2yDL72gUW/DV61OyipUNCKf7TWHyZgzhYWvjtGBXk+7g0gih+9tvtIh3gj1Ol64hA==
X-Received: by 2002:a17:902:aa44:: with SMTP id c4mr2543611plr.73.1583925628333;
        Wed, 11 Mar 2020 04:20:28 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id i72sm23110641pgd.88.2020.03.11.04.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 04:20:27 -0700 (PDT)
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
Subject: [PATCH v3 2/4] drm/prime: add support for virtio exported objects
Date:   Wed, 11 Mar 2020 20:20:02 +0900
Message-Id: <20200311112004.47138-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200311112004.47138-1-stevensd@chromium.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This change exposes dma-buf's get_uuid callback to PRIME drivers.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/drm_prime.c | 23 +++++++++++++++++++++++
 include/drm/drm_drv.h       | 10 ++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 86d9b0e45c8c..50fed8497d3c 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -779,6 +779,28 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
 
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
+
 static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.cache_sgt_mapping = true,
 	.attach = drm_gem_map_attach,
@@ -789,6 +811,7 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
 	.vunmap = drm_gem_dmabuf_vunmap,
+	.get_uuid = drm_gem_dmabuf_get_uuid,
 };
 
 /**
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 77685ed7aa65..61e3ff341844 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -29,6 +29,7 @@
 
 #include <linux/list.h>
 #include <linux/irqreturn.h>
+#include <linux/uuid.h>
 
 #include <drm/drm_device.h>
 
@@ -639,6 +640,15 @@ struct drm_driver {
 	int (*gem_prime_mmap)(struct drm_gem_object *obj,
 				struct vm_area_struct *vma);
 
+	/**
+	 * @gem_prime_get_uuid
+	 *
+	 * get_uuid hook for GEM drivers. Retrieves the virtio uuid of the
+	 * given GEM buffer.
+	 */
+	int (*gem_prime_get_uuid)(struct drm_gem_object *obj,
+				  uuid_t *uuid);
+
 	/**
 	 * @dumb_create:
 	 *
-- 
2.25.1.481.gfbce0eb801-goog

