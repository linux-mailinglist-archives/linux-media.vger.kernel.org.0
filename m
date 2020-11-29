Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB262C791D
	for <lists+linux-media@lfdr.de>; Sun, 29 Nov 2020 13:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbgK2Mce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Nov 2020 07:32:34 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:42646 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbgK2Mcc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Nov 2020 07:32:32 -0500
Received: from localhost.localdomain ([92.131.86.32])
        by mwinf5d20 with ME
        id yCWm2300K0hrljw03CWnrX; Sun, 29 Nov 2020 13:30:47 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Nov 2020 13:30:47 +0100
X-ME-IP: 92.131.86.32
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     hverkuil@xs4all.nl, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] media: saa7146: switch from 'pci_' to 'dma_' API
Date:   Sun, 29 Nov 2020 13:30:11 +0100
Message-Id: <20201129123011.1459295-1-christophe.jaillet@wanadoo.fr>
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

When memory is allocated in 'saa7146_pgtable_alloc()' GFP_KERNEL can be
used because the callers are either .buf_prepare functions or function that
already use GFP_KERNEL (hidden in a 'vmalloc_32()' call).

When memory is allocated in 'saa7146_init_one()' GFP_KERNEL can be used
because it is probe function and no lock is taken in the between.

When memory is allocated in 'saa7146_vv_init()' GFP_KERNEL can be used
because this function already uses GFP_KERNEL and no lock is taken in the
between.

When memory is allocated in 'vbi_workaround()' GFP_KERNEL can be used
because it is only called from a .open function.


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

V1 -> v2: fix to GFP_ flag that had been left as-is. They should be GFP_KERNEL
---
 drivers/media/common/saa7146/saa7146_core.c | 39 +++++++++++----------
 drivers/media/common/saa7146/saa7146_fops.c |  7 ++--
 drivers/media/common/saa7146/saa7146_vbi.c  |  6 ++--
 3 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_core.c b/drivers/media/common/saa7146/saa7146_core.c
index 21fb16cc5ca1..f2d13b71416c 100644
--- a/drivers/media/common/saa7146/saa7146_core.c
+++ b/drivers/media/common/saa7146/saa7146_core.c
@@ -177,7 +177,7 @@ void *saa7146_vmalloc_build_pgtable(struct pci_dev *pci, long length, struct saa
 		goto err_free_slist;
 
 	pt->nents = pages;
-	slen = pci_map_sg(pci,pt->slist,pt->nents,PCI_DMA_FROMDEVICE);
+	slen = dma_map_sg(&pci->dev, pt->slist, pt->nents, DMA_FROM_DEVICE);
 	if (0 == slen)
 		goto err_free_pgtable;
 
@@ -187,7 +187,7 @@ void *saa7146_vmalloc_build_pgtable(struct pci_dev *pci, long length, struct saa
 	return mem;
 
 err_unmap_sg:
-	pci_unmap_sg(pci, pt->slist, pt->nents, PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&pci->dev, pt->slist, pt->nents, DMA_FROM_DEVICE);
 err_free_pgtable:
 	saa7146_pgtable_free(pci, pt);
 err_free_slist:
@@ -201,7 +201,7 @@ void *saa7146_vmalloc_build_pgtable(struct pci_dev *pci, long length, struct saa
 
 void saa7146_vfree_destroy_pgtable(struct pci_dev *pci, void *mem, struct saa7146_pgtable *pt)
 {
-	pci_unmap_sg(pci, pt->slist, pt->nents, PCI_DMA_FROMDEVICE);
+	dma_unmap_sg(&pci->dev, pt->slist, pt->nents, DMA_FROM_DEVICE);
 	saa7146_pgtable_free(pci, pt);
 	kfree(pt->slist);
 	pt->slist = NULL;
@@ -212,7 +212,7 @@ void saa7146_pgtable_free(struct pci_dev *pci, struct saa7146_pgtable *pt)
 {
 	if (NULL == pt->cpu)
 		return;
-	pci_free_consistent(pci, pt->size, pt->cpu, pt->dma);
+	dma_free_coherent(&pci->dev, pt->size, pt->cpu, pt->dma);
 	pt->cpu = NULL;
 }
 
@@ -221,7 +221,7 @@ int saa7146_pgtable_alloc(struct pci_dev *pci, struct saa7146_pgtable *pt)
 	__le32       *cpu;
 	dma_addr_t   dma_addr = 0;
 
-	cpu = pci_alloc_consistent(pci, PAGE_SIZE, &dma_addr);
+	cpu = dma_alloc_coherent(&pci->dev, PAGE_SIZE, &dma_addr, GFP_KERNEL);
 	if (NULL == cpu) {
 		return -ENOMEM;
 	}
@@ -412,18 +412,20 @@ static int saa7146_init_one(struct pci_dev *pci, const struct pci_device_id *ent
 	err = -ENOMEM;
 
 	/* get memory for various stuff */
-	dev->d_rps0.cpu_addr = pci_zalloc_consistent(pci, SAA7146_RPS_MEM,
-						     &dev->d_rps0.dma_handle);
+	dev->d_rps0.cpu_addr = dma_alloc_coherent(&pci->dev, SAA7146_RPS_MEM,
+						  &dev->d_rps0.dma_handle,
+						  GFP_KERNEL);
 	if (!dev->d_rps0.cpu_addr)
 		goto err_free_irq;
 
-	dev->d_rps1.cpu_addr = pci_zalloc_consistent(pci, SAA7146_RPS_MEM,
-						     &dev->d_rps1.dma_handle);
+	dev->d_rps1.cpu_addr = dma_alloc_coherent(&pci->dev, SAA7146_RPS_MEM,
+						  &dev->d_rps1.dma_handle,
+						  GFP_KERNEL);
 	if (!dev->d_rps1.cpu_addr)
 		goto err_free_rps0;
 
-	dev->d_i2c.cpu_addr = pci_zalloc_consistent(pci, SAA7146_RPS_MEM,
-						    &dev->d_i2c.dma_handle);
+	dev->d_i2c.cpu_addr = dma_alloc_coherent(&pci->dev, SAA7146_RPS_MEM,
+						 &dev->d_i2c.dma_handle, GFP_KERNEL);
 	if (!dev->d_i2c.cpu_addr)
 		goto err_free_rps1;
 
@@ -471,14 +473,14 @@ static int saa7146_init_one(struct pci_dev *pci, const struct pci_device_id *ent
 	return err;
 
 err_free_i2c:
-	pci_free_consistent(pci, SAA7146_RPS_MEM, dev->d_i2c.cpu_addr,
-			    dev->d_i2c.dma_handle);
+	dma_free_coherent(&pci->dev, SAA7146_RPS_MEM, dev->d_i2c.cpu_addr,
+			  dev->d_i2c.dma_handle);
 err_free_rps1:
-	pci_free_consistent(pci, SAA7146_RPS_MEM, dev->d_rps1.cpu_addr,
-			    dev->d_rps1.dma_handle);
+	dma_free_coherent(&pci->dev, SAA7146_RPS_MEM, dev->d_rps1.cpu_addr,
+			  dev->d_rps1.dma_handle);
 err_free_rps0:
-	pci_free_consistent(pci, SAA7146_RPS_MEM, dev->d_rps0.cpu_addr,
-			    dev->d_rps0.dma_handle);
+	dma_free_coherent(&pci->dev, SAA7146_RPS_MEM, dev->d_rps0.cpu_addr,
+			  dev->d_rps0.dma_handle);
 err_free_irq:
 	free_irq(pci->irq, (void *)dev);
 err_unmap:
@@ -519,7 +521,8 @@ static void saa7146_remove_one(struct pci_dev *pdev)
 	free_irq(pdev->irq, dev);
 
 	for (p = dev_map; p->addr; p++)
-		pci_free_consistent(pdev, SAA7146_RPS_MEM, p->addr, p->dma);
+		dma_free_coherent(&pdev->dev, SAA7146_RPS_MEM, p->addr,
+				  p->dma);
 
 	iounmap(dev->mem);
 	pci_release_region(pdev, 0);
diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index e936c56b0378..7b1840cad278 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -515,8 +515,8 @@ int saa7146_vv_init(struct saa7146_dev* dev, struct saa7146_ext_vv *ext_vv)
 	dev->ext_vv_data = ext_vv;
 
 	vv->d_clipping.cpu_addr =
-		pci_zalloc_consistent(dev->pci, SAA7146_CLIPPING_MEM,
-				      &vv->d_clipping.dma_handle);
+		dma_alloc_coherent(&dev->pci->dev, SAA7146_CLIPPING_MEM,
+				   &vv->d_clipping.dma_handle, GFP_KERNEL);
 	if( NULL == vv->d_clipping.cpu_addr ) {
 		ERR("out of memory. aborting.\n");
 		kfree(vv);
@@ -574,7 +574,8 @@ int saa7146_vv_release(struct saa7146_dev* dev)
 	DEB_EE("dev:%p\n", dev);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	pci_free_consistent(dev->pci, SAA7146_CLIPPING_MEM, vv->d_clipping.cpu_addr, vv->d_clipping.dma_handle);
+	dma_free_coherent(&dev->pci->dev, SAA7146_CLIPPING_MEM,
+			  vv->d_clipping.cpu_addr, vv->d_clipping.dma_handle);
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 	kfree(vv);
 	dev->vv_data = NULL;
diff --git a/drivers/media/common/saa7146/saa7146_vbi.c b/drivers/media/common/saa7146/saa7146_vbi.c
index e1d369b976ed..e140d4a5aeb2 100644
--- a/drivers/media/common/saa7146/saa7146_vbi.c
+++ b/drivers/media/common/saa7146/saa7146_vbi.c
@@ -22,7 +22,7 @@ static int vbi_workaround(struct saa7146_dev *dev)
 	   as specified. there is this workaround, but please
 	   don't let me explain it. ;-) */
 
-	cpu = pci_alloc_consistent(dev->pci, 4096, &dma_addr);
+	cpu = dma_alloc_coherent(&dev->pci->dev, 4096, &dma_addr, GFP_KERNEL);
 	if (NULL == cpu)
 		return -ENOMEM;
 
@@ -123,12 +123,12 @@ static int vbi_workaround(struct saa7146_dev *dev)
 			/* stop rps1 for sure */
 			saa7146_write(dev, MC1, MASK_29);
 
-			pci_free_consistent(dev->pci, 4096, cpu, dma_addr);
+			dma_free_coherent(&dev->pci->dev, 4096, cpu, dma_addr);
 			return -EINTR;
 		}
 	}
 
-	pci_free_consistent(dev->pci, 4096, cpu, dma_addr);
+	dma_free_coherent(&dev->pci->dev, 4096, cpu, dma_addr);
 	return 0;
 }
 
-- 
2.27.0

