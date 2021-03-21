Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29F73431B7
	for <lists+linux-media@lfdr.de>; Sun, 21 Mar 2021 09:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhCUIGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 04:06:20 -0400
Received: from out02.smtpout.orange.fr ([193.252.22.211]:46363 "EHLO
        out.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCUIFr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 04:05:47 -0400
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Sun, 21 Mar 2021 04:05:46 EDT
Received: from localhost.localdomain ([90.126.17.6])
        by mwinf5d26 with ME
        id ivyD2400307rLVE03vyDbg; Sun, 21 Mar 2021 08:58:14 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Mar 2021 08:58:14 +0100
X-ME-IP: 90.126.17.6
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, m.szyprowski@samsung.com, leon@kernel.org,
        hverkuil-cisco@xs4all.nl, tglx@linutronix.de,
        vaibhavgupta40@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: cx25821: switch from 'pci_' to 'dma_' API
Date:   Sun, 21 Mar 2021 08:58:11 +0100
Message-Id: <c31a2005bcb3707846ce3589d8e5d5284b0292cf.1616313340.git.christophe.jaillet@wanadoo.fr>
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

When memory is allocated in 'cx25821_riscmem_alloc()' GFP_KERNEL can be
used because either this flag is already used in the call chain, or it is
called from a 'buf_prepare' function.

The call chains are:
  vb2_ops.buf_prepare              (in cx25821-video.c)
    cx25821_buffer_prepare         (in cx25821-video.c)
      cx25821_risc_buffer
        cx25821_riscmem_alloc

  snd_cx25821_hw_params            (in cx25821-alsa.c) <-- use GFP_KERNEL
    cx25821_risc_databuffer_audio
      cx25821_riscmem_alloc


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
 drivers/media/pci/cx25821/cx25821-alsa.c |  2 +-
 drivers/media/pci/cx25821/cx25821-core.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index 8797d85a6b0a..438fdcec6eac 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -402,7 +402,7 @@ static int dsp_buffer_free(struct cx25821_audio_dev *chip)
 	dprintk(2, "Freeing buffer\n");
 	cx25821_alsa_dma_unmap(chip);
 	cx25821_alsa_dma_free(chip->buf);
-	pci_free_consistent(chip->pci, risc->size, risc->cpu, risc->dma);
+	dma_free_coherent(&chip->pci->dev, risc->size, risc->cpu, risc->dma);
 	kfree(chip->buf);
 
 	chip->buf = NULL;
diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 07b6d0c49bbf..40c10ca94def 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -977,11 +977,11 @@ int cx25821_riscmem_alloc(struct pci_dev *pci,
 	dma_addr_t dma = 0;
 
 	if (risc->cpu && risc->size < size) {
-		pci_free_consistent(pci, risc->size, risc->cpu, risc->dma);
+		dma_free_coherent(&pci->dev, risc->size, risc->cpu, risc->dma);
 		risc->cpu = NULL;
 	}
 	if (NULL == risc->cpu) {
-		cpu = pci_zalloc_consistent(pci, size, &dma);
+		cpu = dma_alloc_coherent(&pci->dev, size, &dma, GFP_KERNEL);
 		if (NULL == cpu)
 			return -ENOMEM;
 		risc->cpu  = cpu;
@@ -1202,8 +1202,8 @@ void cx25821_free_buffer(struct cx25821_dev *dev, struct cx25821_buffer *buf)
 {
 	if (WARN_ON(buf->risc.size == 0))
 		return;
-	pci_free_consistent(dev->pci,
-			buf->risc.size, buf->risc.cpu, buf->risc.dma);
+	dma_free_coherent(&dev->pci->dev, buf->risc.size, buf->risc.cpu,
+			  buf->risc.dma);
 	memset(&buf->risc, 0, sizeof(buf->risc));
 }
 
@@ -1302,7 +1302,7 @@ static int cx25821_initdev(struct pci_dev *pci_dev,
 		dev->pci_lat, (unsigned long long)dev->base_io_addr);
 
 	pci_set_master(pci_dev);
-	err = pci_set_dma_mask(pci_dev, 0xffffffff);
+	err = dma_set_mask(&pci_dev->dev, 0xffffffff);
 	if (err) {
 		pr_err("%s/0: Oops: no 32bit PCI DMA ???\n", dev->name);
 		err = -EIO;
-- 
2.27.0

