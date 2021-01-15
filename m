Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8DAF2F87A4
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 22:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbhAOV0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 16:26:03 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:45662 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbhAOV0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 16:26:02 -0500
Received: from localhost.localdomain ([92.131.99.25])
        by mwinf5d04 with ME
        id H9QF2400C0Ys01Y039QHn8; Fri, 15 Jan 2021 22:24:18 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 Jan 2021 22:24:18 +0100
X-ME-IP: 92.131.99.25
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, dwlsalmeida@gmail.com,
        hverkuil-cisco@xs4all.nl, vaibhavgupta40@gmail.com,
        liushixin2@huawei.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: saa7164: switch from 'pci_' to 'dma_' API
Date:   Fri, 15 Jan 2021 22:24:15 +0100
Message-Id: <20210115212415.497079-1-christophe.jaillet@wanadoo.fr>
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

When memory is allocated in 'saa7164_buffer_alloc()' GFP_KERNEL can be used
because this function is already using this flag just a few lines above.

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
 drivers/media/pci/saa7164/saa7164-buffer.c | 16 +++++++++-------
 drivers/media/pci/saa7164/saa7164-core.c   |  2 +-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-buffer.c b/drivers/media/pci/saa7164/saa7164-buffer.c
index 245d9db280aa..89c5b79a5b24 100644
--- a/drivers/media/pci/saa7164/saa7164-buffer.c
+++ b/drivers/media/pci/saa7164/saa7164-buffer.c
@@ -103,13 +103,13 @@ struct saa7164_buffer *saa7164_buffer_alloc(struct saa7164_port *port,
 	buf->pt_size = (SAA7164_PT_ENTRIES * sizeof(u64)) + 0x1000;
 
 	/* Allocate contiguous memory */
-	buf->cpu = pci_alloc_consistent(port->dev->pci, buf->pci_size,
-		&buf->dma);
+	buf->cpu = dma_alloc_coherent(&port->dev->pci->dev, buf->pci_size,
+				      &buf->dma, GFP_KERNEL);
 	if (!buf->cpu)
 		goto fail1;
 
-	buf->pt_cpu = pci_alloc_consistent(port->dev->pci, buf->pt_size,
-		&buf->pt_dma);
+	buf->pt_cpu = dma_alloc_coherent(&port->dev->pci->dev, buf->pt_size,
+					 &buf->pt_dma, GFP_KERNEL);
 	if (!buf->pt_cpu)
 		goto fail2;
 
@@ -137,7 +137,8 @@ struct saa7164_buffer *saa7164_buffer_alloc(struct saa7164_port *port,
 	goto ret;
 
 fail2:
-	pci_free_consistent(port->dev->pci, buf->pci_size, buf->cpu, buf->dma);
+	dma_free_coherent(&port->dev->pci->dev, buf->pci_size, buf->cpu,
+			  buf->dma);
 fail1:
 	kfree(buf);
 
@@ -160,8 +161,9 @@ int saa7164_buffer_dealloc(struct saa7164_buffer *buf)
 	if (buf->flags != SAA7164_BUFFER_FREE)
 		log_warn(" freeing a non-free buffer\n");
 
-	pci_free_consistent(dev->pci, buf->pci_size, buf->cpu, buf->dma);
-	pci_free_consistent(dev->pci, buf->pt_size, buf->pt_cpu, buf->pt_dma);
+	dma_free_coherent(&dev->pci->dev, buf->pci_size, buf->cpu, buf->dma);
+	dma_free_coherent(&dev->pci->dev, buf->pt_size, buf->pt_cpu,
+			  buf->pt_dma);
 
 	kfree(buf);
 
diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index f3a4e575a782..7973ae42873a 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -1273,7 +1273,7 @@ static int saa7164_initdev(struct pci_dev *pci_dev,
 
 	pci_set_master(pci_dev);
 	/* TODO */
-	err = pci_set_dma_mask(pci_dev, 0xffffffff);
+	err = dma_set_mask(&pci_dev->dev, 0xffffffff);
 	if (err) {
 		printk("%s/0: Oops: no 32bit PCI DMA ???\n", dev->name);
 		goto fail_irq;
-- 
2.27.0

