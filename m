Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219FE34BE40
	for <lists+linux-media@lfdr.de>; Sun, 28 Mar 2021 20:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhC1Sbb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Mar 2021 14:31:31 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:26090 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbhC1SbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Mar 2021 14:31:05 -0400
Received: from localhost.localdomain ([90.126.11.170])
        by mwinf5d43 with ME
        id luX3240043g7mfN03uX3l1; Sun, 28 Mar 2021 20:31:04 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 28 Mar 2021 20:31:04 +0200
X-ME-IP: 90.126.11.170
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     hverkuil@xs4all.nl, mchehab@kernel.org, vaibhavgupta40@gmail.com,
        grandmaster@al2klimov.de
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: tw68: switch from 'pci_' to 'dma_' API
Date:   Sun, 28 Mar 2021 20:31:01 +0200
Message-Id: <6d06f427d60660d7e0cca2cc107c0e27f57beef3.1616956181.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below and has been
hand modified to replace GFP_ with a correct flag.
It has been compile tested.

When memory is allocated in 'tw68_risc_buffer()' (tw68-risc.c) GFP_KERNEL
can be used because this function is only called from a vb2_ops buf_prepare
function.
The call chain is:
  tw68_video_qops.buf_prepare	         (tw68-video.c)
    --> tw68_buf_prepare               (tw68-video.c)
      --> tw68_risc_buffer

@@
@@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@
@@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@
@@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
@@
-    PCI_DMA_NONE
+    DMA_NONE

@@
expression e1, e2, e3;
@@
-    pci_alloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3;
@@
-    pci_zalloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_single(e1, e2, e3, e4)
+    dma_map_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4, e5;
@@
-    pci_map_page(e1, e2, e3, e4, e5)
+    dma_map_page(&e1->dev, e2, e3, e4, e5)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_page(e1, e2, e3, e4)
+    dma_unmap_page(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_sg(e1, e2, e3, e4)
+    dma_map_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_sg(e1, e2, e3, e4)
+    dma_unmap_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
+    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_device(e1, e2, e3, e4)
+    dma_sync_single_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
+    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
+    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2;
@@
-    pci_dma_mapping_error(e1, e2)
+    dma_mapping_error(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_consistent_dma_mask(e1, e2)
+    dma_set_coherent_mask(&e1->dev, e2)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If needed, see post from Christoph Hellwig on the kernel-janitors ML:
   https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
---
 drivers/media/pci/tw68/tw68-core.c  | 2 +-
 drivers/media/pci/tw68/tw68-risc.c  | 3 ++-
 drivers/media/pci/tw68/tw68-video.c | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/tw68/tw68-core.c b/drivers/media/pci/tw68/tw68-core.c
index bf15fa7c0ea1..35dd19b2427e 100644
--- a/drivers/media/pci/tw68/tw68-core.c
+++ b/drivers/media/pci/tw68/tw68-core.c
@@ -248,7 +248,7 @@ static int tw68_initdev(struct pci_dev *pci_dev,
 		dev->name, pci_name(pci_dev), dev->pci_rev, pci_dev->irq,
 		dev->pci_lat, (u64)pci_resource_start(pci_dev, 0));
 	pci_set_master(pci_dev);
-	err = pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32));
+	err = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
 	if (err) {
 		pr_info("%s: Oops: no 32bit PCI DMA ???\n", dev->name);
 		goto fail1;
diff --git a/drivers/media/pci/tw68/tw68-risc.c b/drivers/media/pci/tw68/tw68-risc.c
index eef0c5281f61..dacb136c4f3a 100644
--- a/drivers/media/pci/tw68/tw68-risc.c
+++ b/drivers/media/pci/tw68/tw68-risc.c
@@ -151,7 +151,8 @@ int tw68_risc_buffer(struct pci_dev *pci,
 	instructions  = fields * (1 + (((bpl + padding) * lines) /
 			 PAGE_SIZE) + lines) + 4;
 	buf->size = instructions * 8;
-	buf->cpu = pci_alloc_consistent(pci, buf->size, &buf->dma);
+	buf->cpu = dma_alloc_coherent(&pci->dev, buf->size, &buf->dma,
+				      GFP_KERNEL);
 	if (buf->cpu == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 10986fcd66a5..fe94944d0531 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -485,7 +485,7 @@ static void tw68_buf_finish(struct vb2_buffer *vb)
 	struct tw68_dev *dev = vb2_get_drv_priv(vq);
 	struct tw68_buf *buf = container_of(vbuf, struct tw68_buf, vb);
 
-	pci_free_consistent(dev->pci, buf->size, buf->cpu, buf->dma);
+	dma_free_coherent(&dev->pci->dev, buf->size, buf->cpu, buf->dma);
 }
 
 static int tw68_start_streaming(struct vb2_queue *q, unsigned int count)
-- 
2.27.0

