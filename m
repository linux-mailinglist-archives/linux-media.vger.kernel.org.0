Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922A3267FD5
	for <lists+linux-media@lfdr.de>; Sun, 13 Sep 2020 16:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgIMO5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Sep 2020 10:57:24 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:40170 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgIMO5V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Sep 2020 10:57:21 -0400
Received: from localhost.localdomain ([93.23.14.57])
        by mwinf5d67 with ME
        id TSxH2300L1Drbmd03SxJxr; Sun, 13 Sep 2020 16:57:19 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 13 Sep 2020 16:57:19 +0200
X-ME-IP: 93.23.14.57
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, romain.perier@gmail.com,
        hverkuil-cisco@xs4all.nl, allen.lkml@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: mantis: switch from 'pci_' to 'dma_' API
Date:   Sun, 13 Sep 2020 16:57:16 +0200
Message-Id: <20200913145716.361507-1-christophe.jaillet@wanadoo.fr>
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

When memory is allocated in 'mantis_alloc_buffers()' (mantis_dma.c)
GFP_KERNEL can be used because it is called from 'mantis_dma_init()' which
is only called from probe functions and no lock is taken in the between.


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
 drivers/media/pci/mantis/mantis_dma.c | 20 ++++++++++----------
 drivers/media/pci/mantis/mantis_pci.c |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/mantis/mantis_dma.c b/drivers/media/pci/mantis/mantis_dma.c
index 4df571ff272b..80c843936493 100644
--- a/drivers/media/pci/mantis/mantis_dma.c
+++ b/drivers/media/pci/mantis/mantis_dma.c
@@ -52,8 +52,8 @@ int mantis_dma_exit(struct mantis_pci *mantis)
 			 mantis->buf_cpu,
 			 MANTIS_BUF_SIZE);
 
-		pci_free_consistent(mantis->pdev, MANTIS_BUF_SIZE,
-				    mantis->buf_cpu, mantis->buf_dma);
+		dma_free_coherent(&mantis->pdev->dev, MANTIS_BUF_SIZE,
+				  mantis->buf_cpu, mantis->buf_dma);
 
 		mantis->buf_cpu = NULL;
 	}
@@ -64,8 +64,8 @@ int mantis_dma_exit(struct mantis_pci *mantis)
 			mantis->risc_cpu,
 			MANTIS_RISC_SIZE);
 
-		pci_free_consistent(mantis->pdev, MANTIS_RISC_SIZE,
-				    mantis->risc_cpu, mantis->risc_dma);
+		dma_free_coherent(&mantis->pdev->dev, MANTIS_RISC_SIZE,
+				  mantis->risc_cpu, mantis->risc_dma);
 
 		mantis->risc_cpu = NULL;
 	}
@@ -77,9 +77,9 @@ EXPORT_SYMBOL_GPL(mantis_dma_exit);
 static inline int mantis_alloc_buffers(struct mantis_pci *mantis)
 {
 	if (!mantis->buf_cpu) {
-		mantis->buf_cpu = pci_alloc_consistent(mantis->pdev,
-						       MANTIS_BUF_SIZE,
-						       &mantis->buf_dma);
+		mantis->buf_cpu = dma_alloc_coherent(&mantis->pdev->dev,
+						     MANTIS_BUF_SIZE,
+						     &mantis->buf_dma, GFP_KERNEL);
 		if (!mantis->buf_cpu) {
 			dprintk(MANTIS_ERROR, 1,
 				"DMA buffer allocation failed");
@@ -92,9 +92,9 @@ static inline int mantis_alloc_buffers(struct mantis_pci *mantis)
 			mantis->buf_cpu, MANTIS_BUF_SIZE);
 	}
 	if (!mantis->risc_cpu) {
-		mantis->risc_cpu = pci_alloc_consistent(mantis->pdev,
-							MANTIS_RISC_SIZE,
-							&mantis->risc_dma);
+		mantis->risc_cpu = dma_alloc_coherent(&mantis->pdev->dev,
+						      MANTIS_RISC_SIZE,
+						      &mantis->risc_dma, GFP_KERNEL);
 
 		if (!mantis->risc_cpu) {
 			dprintk(MANTIS_ERROR, 1,
diff --git a/drivers/media/pci/mantis/mantis_pci.c b/drivers/media/pci/mantis/mantis_pci.c
index 3bfb3e99c93a..9fbce74b00c8 100644
--- a/drivers/media/pci/mantis/mantis_pci.c
+++ b/drivers/media/pci/mantis/mantis_pci.c
@@ -55,7 +55,7 @@ int mantis_pci_init(struct mantis_pci *mantis)
 		goto fail0;
 	}
 
-	err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
+	err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
 	if (err != 0) {
 		dprintk(MANTIS_ERROR, 1, "ERROR: Unable to obtain 32 bit DMA <%i>", err);
 		ret = -ENOMEM;
-- 
2.25.1

