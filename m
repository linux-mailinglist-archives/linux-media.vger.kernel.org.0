Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8247A22EDEC
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 15:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgG0Nvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 09:51:43 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:51426 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgG0Nvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 09:51:42 -0400
Received: from localhost.localdomain ([93.23.198.229])
        by mwinf5d90 with ME
        id 8Drf230074xT3VZ03Drfdg; Mon, 27 Jul 2020 15:51:40 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 27 Jul 2020 15:51:40 +0200
X-ME-IP: 93.23.198.229
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] media: bt8xx: switch from 'pci_' to 'dma_' API
Date:   Mon, 27 Jul 2020 15:51:37 +0200
Message-Id: <20200727135137.54702-1-christophe.jaillet@wanadoo.fr>
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

When memory is allocated in 'bt878_mem_alloc()' (bt878.c), GFP_KERNEL can
be used because it is only called from the probe function (i.e.
'bt878_probe()') and no lock is taken.


When memory is allocated in 'btcx_riscmem_alloc()' (btcx-risc.c),
GFP_KERNEL can be used because all the callers either already use
GFP_KERNEL or are called from a probe function or are called from a
.buf_prepare function.

The 4 callers are all in 'bttv-risc.c'.
   - bttv_risc_packed() and bttv_risc_planar(): only called from
        'videobuf_queue_ops''s '.buf_prepare' functions.
        The call chains are:

        .buf_prepare                     (in 'bttv-driver.c')
           --> buffer_prepare            (in 'bttv-driver.c')
              --> bttv_prepare_buffer
                 --> bttv_buffer_risc
                    --> bttv_risc_packed (x8 times)
                    --> bttv_risc_planar (x6 times)

        .buf_prepare                     (in 'bttv-vbi.c')
           --> vbi_buffer_prepare        (in 'bttv-vbi.c')
              --> bttv_risc_packed       (x2 times)

   - bttv_risc_overlay(): already uses GFP_KERNEL
   - bttv_risc_init_main(): only called from the 'bttv_probe()' probe
        function and no spin_lock is taken in the between

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
 drivers/media/pci/bt8xx/bt878.c       | 16 ++++++++--------
 drivers/media/pci/bt8xx/btcx-risc.c   |  4 ++--
 drivers/media/pci/bt8xx/bttv-driver.c |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bt878.c b/drivers/media/pci/bt8xx/bt878.c
index 79ba15a9385a..78dd35c9b65d 100644
--- a/drivers/media/pci/bt8xx/bt878.c
+++ b/drivers/media/pci/bt8xx/bt878.c
@@ -67,14 +67,14 @@ EXPORT_SYMBOL(bt878);
 static void bt878_mem_free(struct bt878 *bt)
 {
 	if (bt->buf_cpu) {
-		pci_free_consistent(bt->dev, bt->buf_size, bt->buf_cpu,
-				    bt->buf_dma);
+		dma_free_coherent(&bt->dev->dev, bt->buf_size, bt->buf_cpu,
+				  bt->buf_dma);
 		bt->buf_cpu = NULL;
 	}
 
 	if (bt->risc_cpu) {
-		pci_free_consistent(bt->dev, bt->risc_size, bt->risc_cpu,
-				    bt->risc_dma);
+		dma_free_coherent(&bt->dev->dev, bt->risc_size, bt->risc_cpu,
+				  bt->risc_dma);
 		bt->risc_cpu = NULL;
 	}
 }
@@ -84,16 +84,16 @@ static int bt878_mem_alloc(struct bt878 *bt)
 	if (!bt->buf_cpu) {
 		bt->buf_size = 128 * 1024;
 
-		bt->buf_cpu = pci_zalloc_consistent(bt->dev, bt->buf_size,
-						    &bt->buf_dma);
+		bt->buf_cpu = dma_alloc_coherent(&bt->dev->dev, bt->buf_size,
+						 &bt->buf_dma, GFP_KERNEL);
 		if (!bt->buf_cpu)
 			return -ENOMEM;
 	}
 
 	if (!bt->risc_cpu) {
 		bt->risc_size = PAGE_SIZE;
-		bt->risc_cpu = pci_zalloc_consistent(bt->dev, bt->risc_size,
-						     &bt->risc_dma);
+		bt->risc_cpu = dma_alloc_coherent(&bt->dev->dev, bt->risc_size,
+						  &bt->risc_dma, GFP_KERNEL);
 		if (!bt->risc_cpu) {
 			bt878_mem_free(bt);
 			return -ENOMEM;
diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
index 51257980f539..13bb1490a568 100644
--- a/drivers/media/pci/bt8xx/btcx-risc.c
+++ b/drivers/media/pci/bt8xx/btcx-risc.c
@@ -48,7 +48,7 @@ void btcx_riscmem_free(struct pci_dev *pci,
 	dprintk("btcx: riscmem free [%d] dma=%lx\n",
 		memcnt, (unsigned long)risc->dma);
 
-	pci_free_consistent(pci, risc->size, risc->cpu, risc->dma);
+	dma_free_coherent(&pci->dev, risc->size, risc->cpu, risc->dma);
 	memset(risc,0,sizeof(*risc));
 }
 
@@ -62,7 +62,7 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
 	if (NULL != risc->cpu && risc->size < size)
 		btcx_riscmem_free(pci,risc);
 	if (NULL == risc->cpu) {
-		cpu = pci_alloc_consistent(pci, size, &dma);
+		cpu = dma_alloc_coherent(&pci->dev, size, &dma, GFP_KERNEL);
 		if (NULL == cpu)
 			return -ENOMEM;
 		risc->cpu  = cpu;
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 9144f795fb93..0315fb7458b0 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -4015,7 +4015,7 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 		pr_warn("%d: Can't enable device\n", btv->c.nr);
 		return -EIO;
 	}
-	if (pci_set_dma_mask(dev, DMA_BIT_MASK(32))) {
+	if (dma_set_mask(&dev->dev, DMA_BIT_MASK(32))) {
 		pr_warn("%d: No suitable DMA available\n", btv->c.nr);
 		return -EIO;
 	}
-- 
2.25.1

