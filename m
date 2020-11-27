Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEEFF2C6CC2
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 21:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732557AbgK0U67 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 15:58:59 -0500
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:41992 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731028AbgK0U6J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 15:58:09 -0500
Received: from localhost.localdomain ([81.185.168.160])
        by mwinf5d27 with ME
        id xYy3230043Tyla903Yy370; Fri, 27 Nov 2020 21:58:05 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 27 Nov 2020 21:58:05 +0100
X-ME-IP: 81.185.168.160
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, baijiaju@tsinghua.edu.cn, sean@mess.org,
        allen.lkml@gmail.com, gustavoars@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: ttpci: switch from 'pci_' to 'dma_' API
Date:   Fri, 27 Nov 2020 21:58:01 +0100
Message-Id: <20201127205801.1436239-1-christophe.jaillet@wanadoo.fr>
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

When memory is allocated in 'av7110_attach()' GFP_KERNEL can be used
because this flag is already used above in the same function and no lock is
taken in the between.

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
 drivers/media/pci/ttpci/av7110.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/ttpci/av7110.c b/drivers/media/pci/ttpci/av7110.c
index 2f7069e19b78..d74ee0ecfb36 100644
--- a/drivers/media/pci/ttpci/av7110.c
+++ b/drivers/media/pci/ttpci/av7110.c
@@ -1250,7 +1250,8 @@ static void vpeirq(struct tasklet_struct *t)
 		return;
 
 	/* Ensure streamed PCI data is synced to CPU */
-	pci_dma_sync_sg_for_cpu(budget->dev->pci, budget->pt.slist, budget->pt.nents, PCI_DMA_FROMDEVICE);
+	dma_sync_sg_for_cpu(&budget->dev->pci->dev, budget->pt.slist,
+			    budget->pt.nents, DMA_FROM_DEVICE);
 
 #if 0
 	/* track rps1 activity */
@@ -2637,7 +2638,8 @@ static int av7110_attach(struct saa7146_dev* dev,
 	av7110->arm_thread = NULL;
 
 	/* allocate and init buffers */
-	av7110->debi_virt = pci_alloc_consistent(pdev, 8192, &av7110->debi_bus);
+	av7110->debi_virt = dma_alloc_coherent(&pdev->dev, 8192,
+					       &av7110->debi_bus, GFP_KERNEL);
 	if (!av7110->debi_virt)
 		goto err_saa71466_vfree_4;
 
@@ -2726,7 +2728,8 @@ static int av7110_attach(struct saa7146_dev* dev,
 err_iobuf_vfree_6:
 	vfree(av7110->iobuf);
 err_pci_free_5:
-	pci_free_consistent(pdev, 8192, av7110->debi_virt, av7110->debi_bus);
+	dma_free_coherent(&pdev->dev, 8192, av7110->debi_virt,
+			  av7110->debi_bus);
 err_saa71466_vfree_4:
 	if (av7110->grabbing)
 		saa7146_vfree_destroy_pgtable(pdev, av7110->grabbing, &av7110->pt);
@@ -2779,8 +2782,8 @@ static int av7110_detach(struct saa7146_dev* saa)
 	av7110_av_exit(av7110);
 
 	vfree(av7110->iobuf);
-	pci_free_consistent(saa->pci, 8192, av7110->debi_virt,
-			    av7110->debi_bus);
+	dma_free_coherent(&saa->pci->dev, 8192, av7110->debi_virt,
+			  av7110->debi_bus);
 
 	i2c_del_adapter(&av7110->i2c_adap);
 
-- 
2.27.0

