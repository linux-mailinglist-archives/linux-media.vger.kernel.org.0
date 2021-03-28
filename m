Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B91534BD6D
	for <lists+linux-media@lfdr.de>; Sun, 28 Mar 2021 19:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhC1RC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Mar 2021 13:02:28 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:37868 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbhC1RCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Mar 2021 13:02:24 -0400
Received: from localhost.localdomain ([90.126.11.170])
        by mwinf5d59 with ME
        id lt2L2400H3g7mfN03t2MTN; Sun, 28 Mar 2021 19:02:22 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 28 Mar 2021 19:02:22 +0200
X-ME-IP: 90.126.11.170
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     ezequiel@vanguardiasur.com.ar, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: tw686x: switch from 'pci_' to 'dma_' API
Date:   Sun, 28 Mar 2021 19:02:18 +0200
Message-Id: <c5b0537f3471d16279ad6e36b2e446ecf2ea20dd.1616950871.git.christophe.jaillet@wanadoo.fr>
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

When memory is allocated in 'tw686x_audio_dma_alloc()' (tw686x-audio.c)
GFP_KERNEL can be used because it is only called from a probe function
and no spinlock is taken in the between.
The call chain is:
  tw686x_probe					(tw686x-core.c)
    --> tw686x_audio_init					(tw686x-audio.c)
      --> tw686x_audio_dma_alloc					(tw686x-audio.c)

When memory is allocated in 'tw686x_memcpy_dma_alloc()' and in
'tw686x_sg_dma_alloc()' (tw686x-video.c) GFP_KERNEL can be used because
these functions are .alloc functions from a tw686x_dma_ops structure.


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
 drivers/media/pci/tw686x/tw686x-audio.c | 13 +++++++------
 drivers/media/pci/tw686x/tw686x-core.c  |  2 +-
 drivers/media/pci/tw686x/tw686x-video.c | 17 ++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-audio.c b/drivers/media/pci/tw686x/tw686x-audio.c
index 54144e23a487..74cba1368cfa 100644
--- a/drivers/media/pci/tw686x/tw686x-audio.c
+++ b/drivers/media/pci/tw686x/tw686x-audio.c
@@ -300,9 +300,9 @@ static void tw686x_audio_dma_free(struct tw686x_dev *dev,
 	for (pb = 0; pb < 2; pb++) {
 		if (!ac->dma_descs[pb].virt)
 			continue;
-		pci_free_consistent(dev->pci_dev, ac->dma_descs[pb].size,
-				    ac->dma_descs[pb].virt,
-				    ac->dma_descs[pb].phys);
+		dma_free_coherent(&dev->pci_dev->dev, ac->dma_descs[pb].size,
+				  ac->dma_descs[pb].virt,
+				  ac->dma_descs[pb].phys);
 		ac->dma_descs[pb].virt = NULL;
 	}
 }
@@ -313,7 +313,7 @@ static int tw686x_audio_dma_alloc(struct tw686x_dev *dev,
 	int pb;
 
 	/*
-	 * In the memcpy DMA mode we allocate a consistent buffer
+	 * In the memcpy DMA mode we allocate a coherent buffer
 	 * and use it for the DMA capture. Otherwise, DMA
 	 * acts on the ALSA buffers as received in pcm_prepare.
 	 */
@@ -324,8 +324,9 @@ static int tw686x_audio_dma_alloc(struct tw686x_dev *dev,
 		u32 reg = pb ? ADMA_B_ADDR[ac->ch] : ADMA_P_ADDR[ac->ch];
 		void *virt;
 
-		virt = pci_alloc_consistent(dev->pci_dev, AUDIO_DMA_SIZE_MAX,
-					    &ac->dma_descs[pb].phys);
+		virt = dma_alloc_coherent(&dev->pci_dev->dev,
+					  AUDIO_DMA_SIZE_MAX,
+					  &ac->dma_descs[pb].phys, GFP_KERNEL);
 		if (!virt) {
 			dev_err(&dev->pci_dev->dev,
 				"dma%d: unable to allocate audio DMA %s-buffer\n",
diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686x/tw686x-core.c
index 74ae4f0dcee7..6676e069b515 100644
--- a/drivers/media/pci/tw686x/tw686x-core.c
+++ b/drivers/media/pci/tw686x/tw686x-core.c
@@ -276,7 +276,7 @@ static int tw686x_probe(struct pci_dev *pci_dev,
 	}
 
 	pci_set_master(pci_dev);
-	err = pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32));
+	err = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
 	if (err) {
 		dev_err(&pci_dev->dev, "32-bit PCI DMA not supported\n");
 		err = -EIO;
diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 1ced2b0ddb24..b227e9e78ebd 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -92,8 +92,8 @@ static void tw686x_memcpy_dma_free(struct tw686x_video_channel *vc,
 	}
 
 	if (desc->virt) {
-		pci_free_consistent(dev->pci_dev, desc->size,
-				    desc->virt, desc->phys);
+		dma_free_coherent(&dev->pci_dev->dev, desc->size, desc->virt,
+				  desc->phys);
 		desc->virt = NULL;
 	}
 }
@@ -110,8 +110,8 @@ static int tw686x_memcpy_dma_alloc(struct tw686x_video_channel *vc,
 	     "Allocating buffer but previous still here\n");
 
 	len = (vc->width * vc->height * vc->format->depth) >> 3;
-	virt = pci_alloc_consistent(dev->pci_dev, len,
-				    &vc->dma_descs[pb].phys);
+	virt = dma_alloc_coherent(&dev->pci_dev->dev, len,
+				  &vc->dma_descs[pb].phys, GFP_KERNEL);
 	if (!virt) {
 		v4l2_err(&dev->v4l2_dev,
 			 "dma%d: unable to allocate %s-buffer\n",
@@ -258,8 +258,8 @@ static void tw686x_sg_dma_free(struct tw686x_video_channel *vc,
 	struct tw686x_dev *dev = vc->dev;
 
 	if (desc->size) {
-		pci_free_consistent(dev->pci_dev, desc->size,
-				    desc->virt, desc->phys);
+		dma_free_coherent(&dev->pci_dev->dev, desc->size, desc->virt,
+				  desc->phys);
 		desc->virt = NULL;
 	}
 
@@ -276,9 +276,8 @@ static int tw686x_sg_dma_alloc(struct tw686x_video_channel *vc,
 	void *virt;
 
 	if (desc->size) {
-
-		virt = pci_alloc_consistent(dev->pci_dev, desc->size,
-					    &desc->phys);
+		virt = dma_alloc_coherent(&dev->pci_dev->dev, desc->size,
+					  &desc->phys, GFP_KERNEL);
 		if (!virt) {
 			v4l2_err(&dev->v4l2_dev,
 				 "dma%d: unable to allocate %s-buffer\n",
-- 
2.27.0

