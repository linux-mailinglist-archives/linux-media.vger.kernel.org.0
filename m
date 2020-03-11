Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDBD181A46
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbgCKNwG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:52:06 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50619 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbgCKNwF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:52:05 -0400
Received: by mail-wm1-f66.google.com with SMTP id a5so2194187wmb.0
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xEoFbydtA55bQRoTqtzVl54mwFx3SL0wixHy09grPa0=;
        b=r7MESjrLBguiuqkJWV5+QhG2ZuQSFkodxlA1aWbNaIXYzGHoRgec96ylrOYaaeMcSQ
         h3g9fCl8X+vf4W9OEJNZUn97AGKgc4JTxzWK6LeWdFf8qVMDJy6wwf2J9IDxPUc5D5ft
         jAMp5egEe2WKoUAqyLz7AcTr6SpCm0tBpbPcUClXcPRp9xyWSqv3I6ueKAnu8wfJnCey
         57rUV5EWInn60cNMUJyI7KBKwAED8wMsCk1fC7Lu+WyPgfyn/9+AhRGeF+USeM1U9nZN
         YmMp41PV9WE/HlSyIkO2hHfqLJjZr0sHHqv5N1TC593JyqRaj2XMKu3KAlFNnQDvZ4hr
         oq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xEoFbydtA55bQRoTqtzVl54mwFx3SL0wixHy09grPa0=;
        b=uDVBJDzMTtWkgxEDY72hAWjHtoxJLyAiRHOiMy0/0nFw2DOoyWfqIsciGu+U7Cgn1d
         y+kp0pKpDaKD3UchJoyDPP/a+HVA+jSOEwiYnF30toN3ji4T+2uavHCa9JOLqagT/J4F
         V1RhyMuOUGIjUx6OGAOfhZUj6PejW7+mWzvCcZ2u7tOPTQmt9wd0nUdBUc+LloMnxmmi
         lexhITyu1N8EaaWWARssmxVUpUYrPTdB6n+q+eHOZAhHjyfdwCElNg2VEU4WN9I0x2OG
         Fbp5n9S0TzM/JgnnCaOssN41vCVat4T1gPylhEbBf7v7AuRNTK1yQQTtiC+Yp5OOUrEJ
         Gtsg==
X-Gm-Message-State: ANhLgQ26kpbDYZDTtuo1KOrlF+YrxjQMM17MldqPhcs5mx6943FroBB6
        Y5Gg7mfGYPCj/alDUf4/X1M=
X-Google-Smtp-Source: ADFU+vuIhHcOqb5hYvyJLF0VXhRNUC5gsOSa+CkV8rcXv1Lmvo1T20WArTWant8WOU2t0Mvf9O7HNQ==
X-Received: by 2002:a05:600c:4013:: with SMTP id i19mr2532147wmm.28.1583934722955;
        Wed, 11 Mar 2020 06:52:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
        by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 06:52:02 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] dma-buf: add peer2peer flag
Date:   Wed, 11 Mar 2020 14:51:54 +0100
Message-Id: <20200311135158.3310-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311135158.3310-1-christian.koenig@amd.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a peer2peer flag noting that the importer can deal with device
resources which are not backed by pages.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c |  2 ++
 include/linux/dma-buf.h   | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f4ace9af2191..f9220928ec90 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -689,6 +689,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 
 	attach->dev = dev;
 	attach->dmabuf = dmabuf;
+	if (importer_ops)
+		attach->peer2peer = importer_ops->allow_peer2peer;
 	attach->importer_ops = importer_ops;
 	attach->importer_priv = importer_priv;
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 1ade486fc2bb..82e0a4a64601 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -334,6 +334,14 @@ struct dma_buf {
  * Attachment operations implemented by the importer.
  */
 struct dma_buf_attach_ops {
+	/**
+	 * @allow_peer2peer:
+	 *
+	 * If this is set to true the importer must be able to handle peer
+	 * resources without struct pages.
+	 */
+	bool allow_peer2peer;
+
 	/**
 	 * @move_notify
 	 *
@@ -362,6 +370,7 @@ struct dma_buf_attach_ops {
  * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
  * @sgt: cached mapping.
  * @dir: direction of cached mapping.
+ * @peer2peer: true if the importer can handle peer resources without pages.
  * @priv: exporter specific attachment data.
  * @importer_ops: importer operations for this attachment, if provided
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
@@ -382,6 +391,7 @@ struct dma_buf_attachment {
 	struct list_head node;
 	struct sg_table *sgt;
 	enum dma_data_direction dir;
+	bool peer2peer;
 	const struct dma_buf_attach_ops *importer_ops;
 	void *importer_priv;
 	void *priv;
-- 
2.17.1

