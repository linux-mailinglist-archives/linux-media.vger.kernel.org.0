Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC6A175A32
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 13:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgCBMPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 07:15:40 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34086 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbgCBMPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 07:15:40 -0500
Received: by mail-pf1-f193.google.com with SMTP id y21so1986902pfp.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 04:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tDVKWN8XWWDBkIxhOMDWJ8WNqkbJxq41FKX/p0TJDsQ=;
        b=RbeH33OKo6ex4yBiWGoHZuPQZDFiMdnr74+jO7xV8RBZ/HBqXUwdgRgeWFajr7tksx
         nkaHJorAAEdADlX0fiP8/9c5+GvwCWUWeQ4VEYBE6+cMhEG6KMgTVJkGriOPtN/faamn
         kQPWVhol1Rc4kvzN1WSkWTuwQMD/+N+ZL/elI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tDVKWN8XWWDBkIxhOMDWJ8WNqkbJxq41FKX/p0TJDsQ=;
        b=T2jF2+dtV3aCF3n8nFyWkohpqy43veuIvrsGP9UnRJ9dKriZ1V9MN9DW0w43SK9bzk
         wdy5Dc/5lN+F6X6zas0oTjmYz5VLUdUVztiejMAJncnx2VgbWKbkjbGfMKbcNle72vvm
         A4QeSsGa1gD3KOtDeC/gWvcjCVb9+nGmuGe1/v9Bvtj2514GUaJroRPVsWGWvmunzoLR
         +WCleE0l6RPJ1j16sw6wRHQfeG55gEFxzHxeQTGKbFBXRapVnvq5WFUKGLUPNqCDfxxG
         PyJmFjbzoUa1+Y/eAp53a/hgwraNvdasyC5nZ8JmPmw0Q66Lq63+e0sR8rhOOwkMCiyS
         cHSw==
X-Gm-Message-State: APjAAAXwbhH7/hxh9YA0tSz1zxMFS8uhjhpJB+Yu2rg4v08q7DwprVCZ
        5W/hdzIHicdWJshI+yII4ATlqg==
X-Google-Smtp-Source: APXvYqxZ1YfM7I9O5uFy/PJVuxbZj1mE7Mg7Fm9ZeSEO9i+JiSLEETE1w1UTUusb8qRcUt3IahS3Fw==
X-Received: by 2002:a65:53c9:: with SMTP id z9mr17640332pgr.405.1583151339181;
        Mon, 02 Mar 2020 04:15:39 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id e9sm12708987pjt.16.2020.03.02.04.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 04:15:38 -0800 (PST)
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
Subject: [PATCH v2 1/4] dma-buf: add support for virtio exported objects
Date:   Mon,  2 Mar 2020 21:15:21 +0900
Message-Id: <20200302121524.7543-2-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302121524.7543-1-stevensd@chromium.org>
References: <20200302121524.7543-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This change adds a new dma-buf operation that allows dma-bufs to be used
by virtio drivers to share exported objects. The new operation allows
the importing driver to query the exporting driver for the UUID which
identifies the underlying exported object.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/dma-buf/dma-buf.c | 14 ++++++++++++++
 include/linux/dma-buf.h   | 22 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d4097856c86b..a04632284ec2 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1158,6 +1158,20 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
 }
 EXPORT_SYMBOL_GPL(dma_buf_vunmap);
 
+#ifdef CONFIG_VIRTIO
+int dma_buf_get_uuid(struct dma_buf *dmabuf, uuid_t *uuid)
+{
+	if (WARN_ON(!dmabuf) || !uuid)
+		return -EINVAL;
+
+	if (!dmabuf->ops->get_uuid)
+		return -ENODEV;
+
+	return dmabuf->ops->get_uuid(dmabuf, uuid);
+}
+EXPORT_SYMBOL_GPL(dma_buf_get_uuid);
+#endif
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index abf5459a5b9d..f5fecf8abe6a 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -251,6 +251,23 @@ struct dma_buf_ops {
 
 	void *(*vmap)(struct dma_buf *);
 	void (*vunmap)(struct dma_buf *, void *vaddr);
+
+#ifdef CONFIG_VIRTIO
+	/**
+	 * @get_uuid
+	 *
+	 * This is called by dma_buf_get_uuid to get the UUID which identifies
+	 * the buffer to virtio devices.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or a negative error code on failure. On success uuid
+	 * will be populated with the buffer's UUID.
+	 */
+	int (*get_uuid)(struct dma_buf *dmabuf, uuid_t *uuid);
+#endif
 };
 
 /**
@@ -444,4 +461,9 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 void *dma_buf_vmap(struct dma_buf *);
 void dma_buf_vunmap(struct dma_buf *, void *vaddr);
+
+#ifdef CONFIG_VIRTIO
+int dma_buf_get_uuid(struct dma_buf *dmabuf, uuid_t *uuid);
+#endif
+
 #endif /* __DMA_BUF_H__ */
-- 
2.25.0.265.gbab2e86ba0-goog

