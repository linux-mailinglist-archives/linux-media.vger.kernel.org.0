Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D473A59E1
	for <lists+linux-media@lfdr.de>; Sun, 13 Jun 2021 19:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbhFMRio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Jun 2021 13:38:44 -0400
Received: from out07.smtpout.orange.fr ([193.252.22.91]:42036 "EHLO
        out.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231902AbhFMRin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Jun 2021 13:38:43 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d78 with ME
        id Ghcb2500321Fzsu03hcbeh; Sun, 13 Jun 2021 19:36:39 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 13 Jun 2021 19:36:39 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, leon@kernel.org,
        m.szyprowski@samsung.com, vulab@iscas.ac.cn, gustavoars@kernel.org,
        sakari.ailus@linux.intel.com, vaibhavgupta40@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: pci: cx88: switch from 'pci_' to 'dma_' API
Date:   Sun, 13 Jun 2021 19:36:34 +0200
Message-Id: <ac1b23b29b5abe2884bdc4849e20728deacfba2d.1623605641.git.christophe.jaillet@wanadoo.fr>
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

Only 2 functions allocate some memory. They are both in cx88-core.c

When memory is allocated in 'cx88_risc_buffer()', GFP_KERNEL can be
used because its 2 callers end up to '.buf_prepare' functions in 'vb2_ops'
structures.
The call chains are:

  .buf_prepare                   (cx88-vbi.c)
    --> buffer_prepare           (cx88-vbi.c)
      --> cx88_risc_buffer

  .buf_prepare                   (cx88-video.c)
    --> buffer_prepare           (cx88-video.c)
      --> cx88_risc_buffer

When memory is allocated in 'cx88_risc_databuffer()', GFP_KERNEL can be
used because its 2 callers end up to 'snd_cx88_hw_params' which already
uses GFP_KERNEL and '.buf_prepare' functions in 'vb2_ops' structures.
The call chains are:

  snd_cx88_hw_params                   (cx88-alsa.c)
    --> cx88_risc_databuffer

  .buf_prepare                         (cx88-blackbird.c)
    --> buffer_prepare                 (cx88-blackbird.c)
      --> cx8802_buf_prepare           (cx88-mpeg.c)
        --> cx88_risc_databuffer

  .buf_prepare                         (cx88-dvb.c)
    --> buffer_prepare                 (cx88-dvb.c)
      --> cx8802_buf_prepare           (cx88-mpeg.c)
        --> cx88_risc_databuffer

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
 drivers/media/pci/cx88/cx88-alsa.c      | 6 +++---
 drivers/media/pci/cx88/cx88-blackbird.c | 3 ++-
 drivers/media/pci/cx88/cx88-core.c      | 6 ++++--
 drivers/media/pci/cx88/cx88-dvb.c       | 3 ++-
 drivers/media/pci/cx88/cx88-mpeg.c      | 6 +++---
 drivers/media/pci/cx88/cx88-vbi.c       | 3 ++-
 drivers/media/pci/cx88/cx88-video.c     | 5 +++--
 7 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index c83814c052d3..29fb1311e443 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -357,8 +357,8 @@ static int dsp_buffer_free(struct cx88_audio_dev *chip)
 	cx88_alsa_dma_unmap(chip);
 	cx88_alsa_dma_free(chip->buf);
 	if (risc->cpu)
-		pci_free_consistent(chip->pci, risc->size,
-				    risc->cpu, risc->dma);
+		dma_free_coherent(&chip->pci->dev, risc->size, risc->cpu,
+				  risc->dma);
 	kfree(chip->buf);
 
 	chip->buf = NULL;
@@ -868,7 +868,7 @@ static int snd_cx88_create(struct snd_card *card, struct pci_dev *pci,
 		return err;
 	}
 
-	err = pci_set_dma_mask(pci, DMA_BIT_MASK(32));
+	err = dma_set_mask(&pci->dev, DMA_BIT_MASK(32));
 	if (err) {
 		dprintk(0, "%s/1: Oops: no 32bit PCI DMA ???\n", core->name);
 		cx88_core_put(core, pci);
diff --git a/drivers/media/pci/cx88/cx88-blackbird.c b/drivers/media/pci/cx88/cx88-blackbird.c
index fa4ca002ed19..d5da3bd5695d 100644
--- a/drivers/media/pci/cx88/cx88-blackbird.c
+++ b/drivers/media/pci/cx88/cx88-blackbird.c
@@ -685,7 +685,8 @@ static void buffer_finish(struct vb2_buffer *vb)
 	struct cx88_riscmem *risc = &buf->risc;
 
 	if (risc->cpu)
-		pci_free_consistent(dev->pci, risc->size, risc->cpu, risc->dma);
+		dma_free_coherent(&dev->pci->dev, risc->size, risc->cpu,
+				  risc->dma);
 	memset(risc, 0, sizeof(*risc));
 }
 
diff --git a/drivers/media/pci/cx88/cx88-core.c b/drivers/media/pci/cx88/cx88-core.c
index 48c8a3429542..89d4d5a3ba34 100644
--- a/drivers/media/pci/cx88/cx88-core.c
+++ b/drivers/media/pci/cx88/cx88-core.c
@@ -152,7 +152,8 @@ int cx88_risc_buffer(struct pci_dev *pci, struct cx88_riscmem *risc,
 	instructions += 4;
 	risc->size = instructions * 8;
 	risc->dma = 0;
-	risc->cpu = pci_zalloc_consistent(pci, risc->size, &risc->dma);
+	risc->cpu = dma_alloc_coherent(&pci->dev, risc->size, &risc->dma,
+				       GFP_KERNEL);
 	if (!risc->cpu)
 		return -ENOMEM;
 
@@ -190,7 +191,8 @@ int cx88_risc_databuffer(struct pci_dev *pci, struct cx88_riscmem *risc,
 	instructions += 3;
 	risc->size = instructions * 8;
 	risc->dma = 0;
-	risc->cpu = pci_zalloc_consistent(pci, risc->size, &risc->dma);
+	risc->cpu = dma_alloc_coherent(&pci->dev, risc->size, &risc->dma,
+				       GFP_KERNEL);
 	if (!risc->cpu)
 		return -ENOMEM;
 
diff --git a/drivers/media/pci/cx88/cx88-dvb.c b/drivers/media/pci/cx88/cx88-dvb.c
index 202ff9e8c257..2087f2491c42 100644
--- a/drivers/media/pci/cx88/cx88-dvb.c
+++ b/drivers/media/pci/cx88/cx88-dvb.c
@@ -103,7 +103,8 @@ static void buffer_finish(struct vb2_buffer *vb)
 	struct cx88_riscmem *risc = &buf->risc;
 
 	if (risc->cpu)
-		pci_free_consistent(dev->pci, risc->size, risc->cpu, risc->dma);
+		dma_free_coherent(&dev->pci->dev, risc->size, risc->cpu,
+				  risc->dma);
 	memset(risc, 0, sizeof(*risc));
 }
 
diff --git a/drivers/media/pci/cx88/cx88-mpeg.c b/drivers/media/pci/cx88/cx88-mpeg.c
index a3edb548afde..680e1e3fe89b 100644
--- a/drivers/media/pci/cx88/cx88-mpeg.c
+++ b/drivers/media/pci/cx88/cx88-mpeg.c
@@ -226,8 +226,8 @@ int cx8802_buf_prepare(struct vb2_queue *q, struct cx8802_dev *dev,
 				  dev->ts_packet_size, dev->ts_packet_count, 0);
 	if (rc) {
 		if (risc->cpu)
-			pci_free_consistent(dev->pci, risc->size,
-					    risc->cpu, risc->dma);
+			dma_free_coherent(&dev->pci->dev, risc->size,
+					  risc->cpu, risc->dma);
 		memset(risc, 0, sizeof(*risc));
 		return rc;
 	}
@@ -386,7 +386,7 @@ static int cx8802_init_common(struct cx8802_dev *dev)
 	if (pci_enable_device(dev->pci))
 		return -EIO;
 	pci_set_master(dev->pci);
-	err = pci_set_dma_mask(dev->pci, DMA_BIT_MASK(32));
+	err = dma_set_mask(&dev->pci->dev, DMA_BIT_MASK(32));
 	if (err) {
 		pr_err("Oops: no 32bit PCI DMA ???\n");
 		return -EIO;
diff --git a/drivers/media/pci/cx88/cx88-vbi.c b/drivers/media/pci/cx88/cx88-vbi.c
index 58489ea0c1da..a075788c64d4 100644
--- a/drivers/media/pci/cx88/cx88-vbi.c
+++ b/drivers/media/pci/cx88/cx88-vbi.c
@@ -159,7 +159,8 @@ static void buffer_finish(struct vb2_buffer *vb)
 	struct cx88_riscmem *risc = &buf->risc;
 
 	if (risc->cpu)
-		pci_free_consistent(dev->pci, risc->size, risc->cpu, risc->dma);
+		dma_free_coherent(&dev->pci->dev, risc->size, risc->cpu,
+				  risc->dma);
 	memset(risc, 0, sizeof(*risc));
 }
 
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index 8cffdacf6007..c17ad9f7d822 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -492,7 +492,8 @@ static void buffer_finish(struct vb2_buffer *vb)
 	struct cx88_riscmem *risc = &buf->risc;
 
 	if (risc->cpu)
-		pci_free_consistent(dev->pci, risc->size, risc->cpu, risc->dma);
+		dma_free_coherent(&dev->pci->dev, risc->size, risc->cpu,
+				  risc->dma);
 	memset(risc, 0, sizeof(*risc));
 }
 
@@ -1288,7 +1289,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 		(unsigned long long)pci_resource_start(pci_dev, 0));
 
 	pci_set_master(pci_dev);
-	err = pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32));
+	err = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
 	if (err) {
 		pr_err("Oops: no 32bit PCI DMA ???\n");
 		goto fail_core;
-- 
2.30.2

