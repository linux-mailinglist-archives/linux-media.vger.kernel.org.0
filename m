Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921FE3A5943
	for <lists+linux-media@lfdr.de>; Sun, 13 Jun 2021 17:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhFMPNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Jun 2021 11:13:13 -0400
Received: from out06.smtpout.orange.fr ([193.252.22.215]:59986 "EHLO
        out.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbhFMPNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Jun 2021 11:13:12 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d66 with ME
        id Gf3Z2500121Fzsu03f3Z2K; Sun, 13 Jun 2021 17:03:34 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 13 Jun 2021 17:03:34 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        Julia.Lawall@inria.fr, vaibhavgupta40@gmail.com,
        yangyingliang@huawei.com, tasos@tasossah.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: saa7134: switch from 'pci_' to 'dma_' API
Date:   Sun, 13 Jun 2021 17:03:31 +0200
Message-Id: <166687202d3802c07447b0c150c46ccd8e8cab99.1623596428.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below and has been
hand modified to replace GFP_ with a correct flag.
It has been compile tested.

When memory is allocated in 'saa7134_pgtable_alloc()', GFP_KERNEL can be
used because its 4 callers (one function calls it 2 times, so there is
only 3 functions that call it):

.hw_params in a struct snd_pcm_ops (saa7134-alsa.c)
  --> snd_card_saa7134_hw_params   (saa7134-alsa.c)
    --> saa7134_pgtable_alloc
==> .hw_params function can use GFP_KERNEL

saa7134_initdev                    (saa7134-core.c)
  --> saa7134_hwinit1              (saa7134-core.c)
    --> saa7134_ts_init1           (saa7134-ts.c)
      --> saa7134_pgtable_alloc
==> saa7134_initdev already uses GFP_KERNEL

saa7134_initdev                    (saa7134-core.c)
  --> saa7134_hwinit1              (saa7134-core.c)
    --> saa7134_video_init1        (saa7134-video.c)
      --> saa7134_pgtable_alloc    (called 2 times)
==> saa7134_initdev already uses GFP_KERNEL

and no spin_lock is taken in the between.

@@ @@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@ @@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@ @@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@ @@
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
 drivers/media/pci/saa7134/saa7134-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index ec8dd41f9ebb..911fd05de31f 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -223,7 +223,8 @@ int saa7134_pgtable_alloc(struct pci_dev *pci, struct saa7134_pgtable *pt)
 	__le32       *cpu;
 	dma_addr_t   dma_addr = 0;
 
-	cpu = pci_alloc_consistent(pci, SAA7134_PGTABLE_SIZE, &dma_addr);
+	cpu = dma_alloc_coherent(&pci->dev, SAA7134_PGTABLE_SIZE, &dma_addr,
+				 GFP_KERNEL);
 	if (NULL == cpu)
 		return -ENOMEM;
 	pt->size = SAA7134_PGTABLE_SIZE;
@@ -254,7 +255,7 @@ void saa7134_pgtable_free(struct pci_dev *pci, struct saa7134_pgtable *pt)
 {
 	if (NULL == pt->cpu)
 		return;
-	pci_free_consistent(pci, pt->size, pt->cpu, pt->dma);
+	dma_free_coherent(&pci->dev, pt->size, pt->cpu, pt->dma);
 	pt->cpu = NULL;
 }
 
@@ -1092,7 +1093,7 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 		dev->pci_lat,
 		(unsigned long long)pci_resource_start(pci_dev, 0));
 	pci_set_master(pci_dev);
-	err = pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32));
+	err = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
 	if (err) {
 		pr_warn("%s: Oops: no 32bit PCI DMA ???\n", dev->name);
 		goto fail1;
-- 
2.30.2

