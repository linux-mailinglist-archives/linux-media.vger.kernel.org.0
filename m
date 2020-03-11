Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9F61816AF
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 12:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgCKLU1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 07:20:27 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39841 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729089AbgCKLUY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 07:20:24 -0400
Received: by mail-pg1-f196.google.com with SMTP id s2so1032050pgv.6
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dwWKWsLEV24axZ5LPi6+9EofRSocDQnNjSMdJCwyg/k=;
        b=DiECrG1ChFrIsdnCWJkiiijV0Oa2bLJvHMESQKerzpeZrJBihyO27UbVoCHaNyHPMH
         3Zf0FXl3wUuI7rGKr3W7raEbt/GKRIAgNwv8jRHu9xBi2qAhYsfvrS6rwyKm2U7mBDtZ
         SzR6JVH7cbDV7RKvMFAbM3cWCfSEgVFtW7rTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dwWKWsLEV24axZ5LPi6+9EofRSocDQnNjSMdJCwyg/k=;
        b=SP9WvIUhHSPDee8/1aeQdf5/26HF6UMO1JvX7oMeREc9t2sQt6FRNhMX4eS0AFQ+ZF
         UiWOv19m+DS59K/VMVJorb4k8Aewn4YRrm4McsZJN2tm5QqAgijEkNPy1JCKN1twSpj1
         bu58Pi+72oeXjRhhoIr8rK20DR6JgF34ZTqndlX1g6z//M7BX8xlTyiwGoyCZNYJwXHb
         IvZELkG82tmDhembaXjYPvbP/n69OUw9JuVV3wb4ASsV4QX7hiB5A1IYUTIzBWgvE/Ny
         +n1mzOOTS8Hy7VYOEkbj0bQjU8W60yKblBKCkS1ysvQ7WL2fjJmSJkzuoEmTLFkmTbCk
         bn/w==
X-Gm-Message-State: ANhLgQ3n6jIwVQqCh0ML8lgQGStjQInVupaP0Tq6xktGOaIwXuDJBdH9
        aNlUXL94ADJSPBz3y1V5wmnHig==
X-Google-Smtp-Source: ADFU+vsqTKXWkUwlZU65GnXLcGQeIusImXSF6/071PjPajjV9Zy+d6+78zX7Xm4MNtky83+YtZg6Ow==
X-Received: by 2002:aa7:94b5:: with SMTP id a21mr295803pfl.290.1583925623087;
        Wed, 11 Mar 2020 04:20:23 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id q43sm4280776pjc.40.2020.03.11.04.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 04:20:22 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
Date:   Wed, 11 Mar 2020 20:20:01 +0900
Message-Id: <20200311112004.47138-2-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200311112004.47138-1-stevensd@chromium.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
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
 drivers/dma-buf/dma-buf.c | 12 ++++++++++++
 include/linux/dma-buf.h   | 18 ++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d4097856c86b..fa5210ba6aaa 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1158,6 +1158,18 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
 }
 EXPORT_SYMBOL_GPL(dma_buf_vunmap);
 
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
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index abf5459a5b9d..00758523597d 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -251,6 +251,21 @@ struct dma_buf_ops {
 
 	void *(*vmap)(struct dma_buf *);
 	void (*vunmap)(struct dma_buf *, void *vaddr);
+
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
 };
 
 /**
@@ -444,4 +459,7 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 void *dma_buf_vmap(struct dma_buf *);
 void dma_buf_vunmap(struct dma_buf *, void *vaddr);
+
+int dma_buf_get_uuid(struct dma_buf *dmabuf, uuid_t *uuid);
+
 #endif /* __DMA_BUF_H__ */
-- 
2.25.1.481.gfbce0eb801-goog

