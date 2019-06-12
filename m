Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBEB419EE
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 03:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406162AbfFLBWP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 21:22:15 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36279 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405843AbfFLBWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 21:22:15 -0400
Received: by mail-pf1-f196.google.com with SMTP id r7so2678096pfl.3;
        Tue, 11 Jun 2019 18:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Ky1cJOwHZ56JNmGYppilpULLontDldd/s3eyGI0m6U0=;
        b=DvB/JIM6X6sMQrH9Y8WL3U7oZvQIzwOIQk+La/XXrFHdO15QBkDIKLqeaET/1Ep74o
         SYyudSUvfV/5cHstBLovWzTLk8PYGV8V8yD5CEHNEAIARQkpbLLgfqnBR4oR41W2wO3J
         4Bd6YcsJ30dwxmRisE9z6XiwSsb4f7F17W7AF/av2kAw/RcJ6WBelqHl1Dxy/FCH7GN/
         BnxXrrhyjzQn4wnwzmD+gWjr3Pit/qteQKKVrx4mbeliQKt5sA8MUxPfhUtHhfMdekWm
         Q/+29RX8dzEnm6sqmipV6wWmXH6Wut8hHHnjVr5/QvgbcCZny47E5We2DyfpkBL6I0Qo
         p5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ky1cJOwHZ56JNmGYppilpULLontDldd/s3eyGI0m6U0=;
        b=fWlRK0FNlJhMp7Wz4SzA4XRqxtVvTbaeFMyDsul+7qCPBNaljYQzaDKzNGr/D7eZvQ
         2Mwk+IkfsIO1rBVLwXZC8DjbQVRjazY3Z1eh4qZ0951ydVQEcyhM3/5eUDdMbwQz7Ul0
         ww+yjdNGCyUHia1Ce39Sv+rjwuvoHsHaL1D0GaPOydobEY5MGGUDSlmXB3KODtQaMDR+
         GoC1+fF5SngcMOgVg7Ko75UnyztorkWtBlF0jJzPlH0vRBAc0rsF7PTDMhQzdCIqeUOC
         X6sPvJ3CK13Z8QhxG1PIY/mGjCv2MviG4trznqWSx9pSiX9hHeg3DAqxY1OSRoJtIokJ
         PXtA==
X-Gm-Message-State: APjAAAUTDP+lFCo67R+I7GDUaHkXguClnwQMob49JWBA/B5LuTQg2ova
        lGpu7iIyKaw22vfFGEAoogQ=
X-Google-Smtp-Source: APXvYqxoq0tlHQ6kgp/iduVCCMwBl8mA/veWFn8EQTI1GGwQscJmgo9L2tHZ8aJxWuG53y/8ArR7IA==
X-Received: by 2002:aa7:8d89:: with SMTP id i9mr44034763pfr.77.1560302534005;
        Tue, 11 Jun 2019 18:22:14 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id y22sm13265319pgj.38.2019.06.11.18.22.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 18:22:13 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        daniel.vetter@ffwll.ch
Subject: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Date:   Tue, 11 Jun 2019 18:22:19 -0700
Message-Id: <20190612012219.21652-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit f13e143e7444 ("dma-buf: start caching of sg_table objects v2")
added a support of caching the sgt pointer into an attach pointer to
let users reuse the sgt pointer without another mapping. However, it
might not totally work as most of dma-buf callers are doing attach()
and map_attachment() back-to-back, using drm_prime.c for example:
    drm_gem_prime_import_dev() {
        attach = dma_buf_attach() {
            /* Allocating a new attach */
            attach = kzalloc();
            /* .... */
            return attach;
        }
        dma_buf_map_attachment(attach, direction) {
            /* attach->sgt would be always empty as attach is new */
            if (attach->sgt) {
                /* Reuse attach->sgt */
            }
            /* Otherwise, map it */
            attach->sgt = map();
        }
    }

So, for a cache_sgt_mapping use case, it would need to get the same
attachment pointer in order to reuse its sgt pointer. So this patch
adds a refcount to the attach() function and lets it search for the
existing attach pointer by matching the dev pointer.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++++++
 include/linux/dma-buf.h   |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f4104a21b069..d0260553a31c 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -559,6 +559,21 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 	if (WARN_ON(!dmabuf || !dev))
 		return ERR_PTR(-EINVAL);
 
+	/* cache_sgt_mapping requires to reuse the same attachment pointer */
+	if (dmabuf->ops->cache_sgt_mapping) {
+		mutex_lock(&dmabuf->lock);
+
+		/* Search for existing attachment and increase its refcount */
+		list_for_each_entry(attach, &dmabuf->attachments, node) {
+			if (dev != attach->dev)
+				continue;
+			atomic_inc_not_zero(&attach->refcount);
+			goto unlock_attach;
+		}
+
+		mutex_unlock(&dmabuf->lock);
+	}
+
 	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
 	if (!attach)
 		return ERR_PTR(-ENOMEM);
@@ -575,6 +590,9 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 	}
 	list_add(&attach->node, &dmabuf->attachments);
 
+	atomic_set(&attach->refcount, 1);
+
+unlock_attach:
 	mutex_unlock(&dmabuf->lock);
 
 	return attach;
@@ -599,6 +617,11 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (WARN_ON(!dmabuf || !attach))
 		return;
 
+	/* Decrease the refcount for cache_sgt_mapping use cases */
+	if (dmabuf->ops->cache_sgt_mapping &&
+	    atomic_dec_return(&attach->refcount))
+		return;
+
 	if (attach->sgt)
 		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 8a327566d7f4..65f12212ca2e 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -333,6 +333,7 @@ struct dma_buf {
  * @dev: device attached to the buffer.
  * @node: list of dma_buf_attachment.
  * @sgt: cached mapping.
+ * @refcount: refcount of the attachment for the same device.
  * @dir: direction of cached mapping.
  * @priv: exporter specific attachment data.
  *
@@ -350,6 +351,7 @@ struct dma_buf_attachment {
 	struct device *dev;
 	struct list_head node;
 	struct sg_table *sgt;
+	atomic_t refcount;
 	enum dma_data_direction dir;
 	void *priv;
 };
-- 
2.17.1

