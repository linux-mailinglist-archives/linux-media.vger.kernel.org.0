Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0AE634BBA1
	for <lists+linux-media@lfdr.de>; Sun, 28 Mar 2021 10:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhC1IIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Mar 2021 04:08:45 -0400
Received: from out05.smtpout.orange.fr ([193.252.22.214]:49532 "EHLO
        out.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbhC1II0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Mar 2021 04:08:26 -0400
Received: from localhost.localdomain ([90.126.11.170])
        by mwinf5d19 with ME
        id lk8M2400E3g7mfN03k8NsB; Sun, 28 Mar 2021 10:08:24 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 28 Mar 2021 10:08:24 +0200
X-ME-IP: 90.126.11.170
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        m.szyprowski@samsung.com, brad@nextdimension.cc,
        vaibhavgupta40@gmail.com, daniel.lee.kruse@protonmail.com,
        tglx@linutronix.de
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: cx23885: switch from 'pci_' to 'dma_' API
Date:   Sun, 28 Mar 2021 10:08:19 +0200
Message-Id: <7870058f8c345153e53a9ceef1c49c1f313c3c3f.1616918733.git.christophe.jaillet@wanadoo.fr>
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

When memory is allocated in 'cx23885_risc_buffer()' GFP_KERNEL can be used
because this function is only called from a vb2_ops buf_prepare function.
The call chain is:
  cx23885_video_qops.buf_prepare        (cx23885-video.c)
    --> buffer_prepare                  (cx23885-video.c)
      --> cx23885_risc_buffer

When memory is allocated in 'cx23885_risc_databuffer()' GFP_KERNEL can be
used because this function is only called from a function that already uses
GFP_KERNEL or from a vb2_ops buf_prepare
function.
The call chains are:
  snd_cx23885_hw_params                 (cx23885-alsa.c) --> use GFP_KERNEL
    --> cx23885_risc_databuffer

  cx23885_qops.buffer_prepare           (cx23885-417.c)
     or
  dvb_qops.buffer_prepare               (cx23885-dvb.c)
    --> cx23885_buf_prepare
      --> cx23885_risc_databuffer

When memory is allocated in 'cx23885_risc_vbibuffer()' GFP_KERNEL can be
used because this function is only called from a vb2_ops buf_prepare
function.
The call chains are:
  cx23885_vbi_qops.buffer_prepare       (cx23885-vbi.c)
    --> cx23885_risc_vbibuffer


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
 drivers/media/pci/cx23885/cx23885-alsa.c |  2 +-
 drivers/media/pci/cx23885/cx23885-core.c | 13 ++++++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
index 13689c5dd47f..ab14d35214aa 100644
--- a/drivers/media/pci/cx23885/cx23885-alsa.c
+++ b/drivers/media/pci/cx23885/cx23885-alsa.c
@@ -266,7 +266,7 @@ static int dsp_buffer_free(struct cx23885_audio_dev *chip)
 	cx23885_alsa_dma_unmap(chip);
 	cx23885_alsa_dma_free(chip->buf);
 	risc = &chip->buf->risc;
-	pci_free_consistent(chip->pci, risc->size, risc->cpu, risc->dma);
+	dma_free_coherent(&chip->pci->dev, risc->size, risc->cpu, risc->dma);
 	kfree(chip->buf);
 
 	chip->buf = NULL;
diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index d0ca260ecf70..f8f2ff3b00c3 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -1218,7 +1218,8 @@ int cx23885_risc_buffer(struct pci_dev *pci, struct cx23885_riscmem *risc,
 		/ PAGE_SIZE + lines);
 	instructions += 5;
 	risc->size = instructions * 12;
-	risc->cpu = pci_alloc_consistent(pci, risc->size, &risc->dma);
+	risc->cpu = dma_alloc_coherent(&pci->dev, risc->size, &risc->dma,
+				       GFP_KERNEL);
 	if (risc->cpu == NULL)
 		return -ENOMEM;
 
@@ -1255,7 +1256,8 @@ int cx23885_risc_databuffer(struct pci_dev *pci,
 	instructions += 4;
 
 	risc->size = instructions * 12;
-	risc->cpu = pci_alloc_consistent(pci, risc->size, &risc->dma);
+	risc->cpu = dma_alloc_coherent(&pci->dev, risc->size, &risc->dma,
+				       GFP_KERNEL);
 	if (risc->cpu == NULL)
 		return -ENOMEM;
 
@@ -1293,7 +1295,8 @@ int cx23885_risc_vbibuffer(struct pci_dev *pci, struct cx23885_riscmem *risc,
 		/ PAGE_SIZE + lines);
 	instructions += 5;
 	risc->size = instructions * 12;
-	risc->cpu = pci_alloc_consistent(pci, risc->size, &risc->dma);
+	risc->cpu = dma_alloc_coherent(&pci->dev, risc->size, &risc->dma,
+				       GFP_KERNEL);
 	if (risc->cpu == NULL)
 		return -ENOMEM;
 	/* write risc instructions */
@@ -1322,7 +1325,7 @@ void cx23885_free_buffer(struct cx23885_dev *dev, struct cx23885_buffer *buf)
 {
 	struct cx23885_riscmem *risc = &buf->risc;
 
-	pci_free_consistent(dev->pci, risc->size, risc->cpu, risc->dma);
+	dma_free_coherent(&dev->pci->dev, risc->size, risc->cpu, risc->dma);
 }
 
 static void cx23885_tsport_reg_dump(struct cx23885_tsport *port)
@@ -2159,7 +2162,7 @@ static int cx23885_initdev(struct pci_dev *pci_dev,
 		(unsigned long long)pci_resource_start(pci_dev, 0));
 
 	pci_set_master(pci_dev);
-	err = pci_set_dma_mask(pci_dev, 0xffffffff);
+	err = dma_set_mask(&pci_dev->dev, 0xffffffff);
 	if (err) {
 		pr_err("%s/0: Oops: no 32bit PCI DMA ???\n", dev->name);
 		goto fail_ctrl;
-- 
2.27.0

