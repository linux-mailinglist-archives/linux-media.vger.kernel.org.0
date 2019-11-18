Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3724B10027D
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 11:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfKRKf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 05:35:58 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53462 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfKRKf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 05:35:58 -0500
Received: by mail-wm1-f65.google.com with SMTP id u18so16813771wmc.3
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2019 02:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3U7cLwSgbZNJZGXvMba11nZHa9be8EKkAKU9BRa/sPk=;
        b=HXs1Q/93DL/Rpcsd/IUXh17iFjWaBaIeTBBR9O3Y9WA7G3rHrZWBMuxc9CpliewefF
         UiWUgs27rvwtjWJxwOOZnSDS4NwU8M6fOHTuItlnv5Gix7R7i2Sd+emDeeFyfRSKSmou
         eWSRqHdVwJj8fmWhs3Oo95gjZKxYreyAtEsPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3U7cLwSgbZNJZGXvMba11nZHa9be8EKkAKU9BRa/sPk=;
        b=PAR7jNuI8KPnBhYND33fEwYf/DoGfOVg+qEbc6r3em0MMoqqyrQbijBCKP4ZRadrUs
         yMF5tsneQC3mJT+Zxy7u0aM4SE1iuV6w5io9k3FISt0JfddAkHddIrWmehY+Lz5ouso+
         m+IugY9adF+3+FMva/kztVo/H7JTYGW88w/5qLapogxc2tjAcWM0KtWEFRRM6F13x3ex
         kyvh5vfuUPnfHDTUmOJIsQoAQTgb61WKg762+i1NiN/ktaoGkWjt3t+3i7eqOEbLW3th
         J1qeji9Oe0AdT30atSAONu4eWjbVI2HgtJZBEqSiNTk+PyTxFV2NgYxDcPj7d3R5ENGh
         Uk2g==
X-Gm-Message-State: APjAAAXcfgGfvtAmPO9vsAhaf9S2KO0kOPOXV1j8cKnNEStboWeJGHhR
        8+JzQ8boMDWp8lOsj0tTbcbzEQ==
X-Google-Smtp-Source: APXvYqwaoBDpOQ9gC9LV0CLvIPoV5W1A6YdWKrCV0jvN9JZ7wEmDlR4Z3b4cMrPGgKZmeHxi6+VAKA==
X-Received: by 2002:a7b:ce90:: with SMTP id q16mr27877582wmj.172.1574073356634;
        Mon, 18 Nov 2019 02:35:56 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 02:35:55 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Subject: [PATCH 11/15] media/videobuf2: Drop dma_buf->k(un)map support
Date:   Mon, 18 Nov 2019 11:35:32 +0100
Message-Id: <20191118103536.17675-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No in-tree users left.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Pawel Osciak <pawel@osciak.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org
--
Ack for merging this through drm trees very much appreciated.
-Daniel
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 --------
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 8 --------
 drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 8 --------
 3 files changed, 24 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 44cd0e530bbd..d0c9dffe49e5 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -335,13 +335,6 @@ static void vb2_dc_dmabuf_ops_release(struct dma_buf *dbuf)
 	vb2_dc_put(dbuf->priv);
 }
 
-static void *vb2_dc_dmabuf_ops_kmap(struct dma_buf *dbuf, unsigned long pgnum)
-{
-	struct vb2_dc_buf *buf = dbuf->priv;
-
-	return buf->vaddr ? buf->vaddr + pgnum * PAGE_SIZE : NULL;
-}
-
 static void *vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf)
 {
 	struct vb2_dc_buf *buf = dbuf->priv;
@@ -360,7 +353,6 @@ static const struct dma_buf_ops vb2_dc_dmabuf_ops = {
 	.detach = vb2_dc_dmabuf_ops_detach,
 	.map_dma_buf = vb2_dc_dmabuf_ops_map,
 	.unmap_dma_buf = vb2_dc_dmabuf_ops_unmap,
-	.map = vb2_dc_dmabuf_ops_kmap,
 	.vmap = vb2_dc_dmabuf_ops_vmap,
 	.mmap = vb2_dc_dmabuf_ops_mmap,
 	.release = vb2_dc_dmabuf_ops_release,
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index ed706b2a263c..6db60e9d5183 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -470,13 +470,6 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
 	vb2_dma_sg_put(dbuf->priv);
 }
 
-static void *vb2_dma_sg_dmabuf_ops_kmap(struct dma_buf *dbuf, unsigned long pgnum)
-{
-	struct vb2_dma_sg_buf *buf = dbuf->priv;
-
-	return buf->vaddr ? buf->vaddr + pgnum * PAGE_SIZE : NULL;
-}
-
 static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
 {
 	struct vb2_dma_sg_buf *buf = dbuf->priv;
@@ -495,7 +488,6 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
 	.detach = vb2_dma_sg_dmabuf_ops_detach,
 	.map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
 	.unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
-	.map = vb2_dma_sg_dmabuf_ops_kmap,
 	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
 	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
 	.release = vb2_dma_sg_dmabuf_ops_release,
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 04d51ca63223..4d5af352e249 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -319,13 +319,6 @@ static void vb2_vmalloc_dmabuf_ops_release(struct dma_buf *dbuf)
 	vb2_vmalloc_put(dbuf->priv);
 }
 
-static void *vb2_vmalloc_dmabuf_ops_kmap(struct dma_buf *dbuf, unsigned long pgnum)
-{
-	struct vb2_vmalloc_buf *buf = dbuf->priv;
-
-	return buf->vaddr + pgnum * PAGE_SIZE;
-}
-
 static void *vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf)
 {
 	struct vb2_vmalloc_buf *buf = dbuf->priv;
@@ -344,7 +337,6 @@ static const struct dma_buf_ops vb2_vmalloc_dmabuf_ops = {
 	.detach = vb2_vmalloc_dmabuf_ops_detach,
 	.map_dma_buf = vb2_vmalloc_dmabuf_ops_map,
 	.unmap_dma_buf = vb2_vmalloc_dmabuf_ops_unmap,
-	.map = vb2_vmalloc_dmabuf_ops_kmap,
 	.vmap = vb2_vmalloc_dmabuf_ops_vmap,
 	.mmap = vb2_vmalloc_dmabuf_ops_mmap,
 	.release = vb2_vmalloc_dmabuf_ops_release,
-- 
2.24.0

