Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B6A268131
	for <lists+linux-media@lfdr.de>; Sun, 13 Sep 2020 22:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgIMUoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Sep 2020 16:44:01 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:22403 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgIMUoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Sep 2020 16:44:00 -0400
Received: from localhost.localdomain ([93.22.148.196])
        by mwinf5d50 with ME
        id TYjw230064EUi3903YjwNM; Sun, 13 Sep 2020 22:43:58 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 13 Sep 2020 22:43:58 +0200
X-ME-IP: 93.22.148.196
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, allen.lkml@gmail.com, hverkuil-cisco@xs4all.nl,
        romain.perier@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: ngene: switch from 'pci_' to 'dma_' API
Date:   Sun, 13 Sep 2020 22:43:56 +0200
Message-Id: <20200913204356.364837-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below and has been
hand modified to replace GFP_ with a correct flag.
It has been compile tested.

When memory is allocated, GFP_KERNEL can be used because in all cases,
it is called from a probe function and no lock is taken in the between.

The call chain is:
  ngene_probe                       (probe function, used in ngene-cards.c)
    --> ngene_get_buffers
      --> AllocateRingBuffers                 (call dma_alloc_coherent)
        --> create_ring_buffer                (call dma_alloc_coherent)
      --> AllocCommonBuffers                  (call dma_alloc_coherent)


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
 drivers/media/pci/ngene/ngene-core.c | 56 ++++++++++++++--------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/media/pci/ngene/ngene-core.c b/drivers/media/pci/ngene/ngene-core.c
index f9f94f47d76b..07f342db6701 100644
--- a/drivers/media/pci/ngene/ngene-core.c
+++ b/drivers/media/pci/ngene/ngene-core.c
@@ -763,23 +763,22 @@ static void free_ringbuffer(struct ngene *dev, struct SRingBufferDescriptor *rb)
 
 	for (j = 0; j < rb->NumBuffers; j++, Cur = Cur->Next) {
 		if (Cur->Buffer1)
-			pci_free_consistent(dev->pci_dev,
-					    rb->Buffer1Length,
-					    Cur->Buffer1,
-					    Cur->scList1->Address);
+			dma_free_coherent(&dev->pci_dev->dev,
+					  rb->Buffer1Length, Cur->Buffer1,
+					  Cur->scList1->Address);
 
 		if (Cur->Buffer2)
-			pci_free_consistent(dev->pci_dev,
-					    rb->Buffer2Length,
-					    Cur->Buffer2,
-					    Cur->scList2->Address);
+			dma_free_coherent(&dev->pci_dev->dev,
+					  rb->Buffer2Length, Cur->Buffer2,
+					  Cur->scList2->Address);
 	}
 
 	if (rb->SCListMem)
-		pci_free_consistent(dev->pci_dev, rb->SCListMemSize,
-				    rb->SCListMem, rb->PASCListMem);
+		dma_free_coherent(&dev->pci_dev->dev, rb->SCListMemSize,
+				  rb->SCListMem, rb->PASCListMem);
 
-	pci_free_consistent(dev->pci_dev, rb->MemSize, rb->Head, rb->PAHead);
+	dma_free_coherent(&dev->pci_dev->dev, rb->MemSize, rb->Head,
+			  rb->PAHead);
 }
 
 static void free_idlebuffer(struct ngene *dev,
@@ -813,15 +812,13 @@ static void free_common_buffers(struct ngene *dev)
 	}
 
 	if (dev->OverflowBuffer)
-		pci_free_consistent(dev->pci_dev,
-				    OVERFLOW_BUFFER_SIZE,
-				    dev->OverflowBuffer, dev->PAOverflowBuffer);
+		dma_free_coherent(&dev->pci_dev->dev, OVERFLOW_BUFFER_SIZE,
+				  dev->OverflowBuffer, dev->PAOverflowBuffer);
 
 	if (dev->FWInterfaceBuffer)
-		pci_free_consistent(dev->pci_dev,
-				    4096,
-				    dev->FWInterfaceBuffer,
-				    dev->PAFWInterfaceBuffer);
+		dma_free_coherent(&dev->pci_dev->dev, 4096,
+				  dev->FWInterfaceBuffer,
+				  dev->PAFWInterfaceBuffer);
 }
 
 /****************************************************************************/
@@ -848,7 +845,7 @@ static int create_ring_buffer(struct pci_dev *pci_dev,
 	if (MemSize < 4096)
 		MemSize = 4096;
 
-	Head = pci_alloc_consistent(pci_dev, MemSize, &tmp);
+	Head = dma_alloc_coherent(&pci_dev->dev, MemSize, &tmp, GFP_KERNEL);
 	PARingBufferHead = tmp;
 
 	if (!Head)
@@ -899,7 +896,8 @@ static int AllocateRingBuffers(struct pci_dev *pci_dev,
 	if (SCListMemSize < 4096)
 		SCListMemSize = 4096;
 
-	SCListMem = pci_alloc_consistent(pci_dev, SCListMemSize, &tmp);
+	SCListMem = dma_alloc_coherent(&pci_dev->dev, SCListMemSize, &tmp,
+				       GFP_KERNEL);
 
 	PASCListMem = tmp;
 	if (SCListMem == NULL)
@@ -918,8 +916,8 @@ static int AllocateRingBuffers(struct pci_dev *pci_dev,
 	for (i = 0; i < pRingBuffer->NumBuffers; i += 1, Cur = Cur->Next) {
 		u64 PABuffer;
 
-		void *Buffer = pci_alloc_consistent(pci_dev, Buffer1Length,
-						    &tmp);
+		void *Buffer = dma_alloc_coherent(&pci_dev->dev,
+						  Buffer1Length, &tmp, GFP_KERNEL);
 		PABuffer = tmp;
 
 		if (Buffer == NULL)
@@ -951,7 +949,8 @@ static int AllocateRingBuffers(struct pci_dev *pci_dev,
 		if (!Buffer2Length)
 			continue;
 
-		Buffer = pci_alloc_consistent(pci_dev, Buffer2Length, &tmp);
+		Buffer = dma_alloc_coherent(&pci_dev->dev, Buffer2Length,
+					    &tmp, GFP_KERNEL);
 		PABuffer = tmp;
 
 		if (Buffer == NULL)
@@ -1040,17 +1039,18 @@ static int AllocCommonBuffers(struct ngene *dev)
 {
 	int status = 0, i;
 
-	dev->FWInterfaceBuffer = pci_alloc_consistent(dev->pci_dev, 4096,
-						     &dev->PAFWInterfaceBuffer);
+	dev->FWInterfaceBuffer = dma_alloc_coherent(&dev->pci_dev->dev, 4096,
+						    &dev->PAFWInterfaceBuffer,
+						    GFP_KERNEL);
 	if (!dev->FWInterfaceBuffer)
 		return -ENOMEM;
 	dev->hosttongene = dev->FWInterfaceBuffer;
 	dev->ngenetohost = dev->FWInterfaceBuffer + 256;
 	dev->EventBuffer = dev->FWInterfaceBuffer + 512;
 
-	dev->OverflowBuffer = pci_zalloc_consistent(dev->pci_dev,
-						    OVERFLOW_BUFFER_SIZE,
-						    &dev->PAOverflowBuffer);
+	dev->OverflowBuffer = dma_alloc_coherent(&dev->pci_dev->dev,
+						 OVERFLOW_BUFFER_SIZE,
+						 &dev->PAOverflowBuffer, GFP_KERNEL);
 	if (!dev->OverflowBuffer)
 		return -ENOMEM;
 
-- 
2.25.1

