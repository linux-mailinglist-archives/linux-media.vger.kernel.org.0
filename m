Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A58AAADD37
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 18:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389693AbfIIQ0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 12:26:04 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54458 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389660AbfIIQ0E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 12:26:04 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89GQ3ck034853;
        Mon, 9 Sep 2019 11:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568046363;
        bh=xbPucjBg76/F+AfikeBA08kKETiUuJMtVgneCx3l9YM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=EAkruQVLDdthmMU2NBD1cl4OMP/4a002KwQllw4sptfJAok+kmEyp1wOGM/sMSDDN
         Xa0E5BRgeQL3ONkdbZtKXMWROhvesp3SyPSJs4R6+tCEjVHZrRxma/nbg7RZ/9+WUO
         gC3cswnAxnuga1bzLGrshcSTVaxBHP7nbY8xt1V0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89GQ2fe090030
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Sep 2019 11:26:02 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 11:26:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 11:26:02 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GPnoR056522;
        Mon, 9 Sep 2019 11:26:02 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 03/13] media: am437x-vpfe: Rework ISR routine for clarity
Date:   Mon, 9 Sep 2019 11:27:33 -0500
Message-ID: <20190909162743.30114-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190909162743.30114-1-bparrot@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make the ISR code simpler to follow by removing goto and
relocating/eliminating duplicate spinlock accesses.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 128 ++++++++++----------
 1 file changed, 66 insertions(+), 62 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 0ecb75bf5abd..7c5b734f7143 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -1233,22 +1233,29 @@ static int vpfe_open(struct file *file)
  * This function will get next buffer from the dma queue and
  * set the buffer address in the vpfe register for capture.
  * the buffer is marked active
- *
- * Assumes caller is holding vpfe->dma_queue_lock already
  */
-static inline void vpfe_schedule_next_buffer(struct vpfe_device *vpfe)
+static void vpfe_schedule_next_buffer(struct vpfe_device *vpfe)
 {
+	dma_addr_t addr;
+
+	spin_lock(&vpfe->dma_queue_lock);
+	if (list_empty(&vpfe->dma_queue)) {
+		spin_unlock(&vpfe->dma_queue_lock);
+		return;
+	}
+
 	vpfe->next_frm = list_entry(vpfe->dma_queue.next,
 				    struct vpfe_cap_buffer, list);
 	list_del(&vpfe->next_frm->list);
+	spin_unlock(&vpfe->dma_queue_lock);
 
-	vpfe_set_sdr_addr(&vpfe->ccdc,
-	       vb2_dma_contig_plane_dma_addr(&vpfe->next_frm->vb.vb2_buf, 0));
+	addr = vb2_dma_contig_plane_dma_addr(&vpfe->next_frm->vb.vb2_buf, 0);
+	vpfe_set_sdr_addr(&vpfe->ccdc, addr);
 }
 
 static inline void vpfe_schedule_bottom_field(struct vpfe_device *vpfe)
 {
-	unsigned long addr;
+	dma_addr_t addr;
 
 	addr = vb2_dma_contig_plane_dma_addr(&vpfe->next_frm->vb.vb2_buf, 0) +
 					vpfe->field_off;
@@ -1273,6 +1280,55 @@ static inline void vpfe_process_buffer_complete(struct vpfe_device *vpfe)
 	vpfe->cur_frm = vpfe->next_frm;
 }
 
+static void vpfe_handle_interlaced_irq(struct vpfe_device *vpfe,
+				       enum v4l2_field field)
+{
+	int fid;
+
+	/* interlaced or TB capture check which field
+	 * we are in hardware
+	 */
+	fid = vpfe_ccdc_getfid(&vpfe->ccdc);
+
+	/* switch the software maintained field id */
+	vpfe->field ^= 1;
+	if (fid == vpfe->field) {
+		/* we are in-sync here,continue */
+		if (fid == 0) {
+			/*
+			 * One frame is just being captured. If the
+			 * next frame is available, release the
+			 * current frame and move on
+			 */
+			if (vpfe->cur_frm != vpfe->next_frm)
+				vpfe_process_buffer_complete(vpfe);
+
+			/*
+			 * based on whether the two fields are stored
+			 * interleave or separately in memory,
+			 * reconfigure the CCDC memory address
+			 */
+			if (field == V4L2_FIELD_SEQ_TB)
+				vpfe_schedule_bottom_field(vpfe);
+		} else {
+			/*
+			 * if one field is just being captured configure
+			 * the next frame get the next frame from the empty
+			 * queue if no frame is available hold on to the
+			 * current buffer
+			 */
+			if (vpfe->cur_frm == vpfe->next_frm)
+				vpfe_schedule_next_buffer(vpfe);
+		}
+	} else if (fid == 0) {
+		/*
+		 * out of sync. Recover from any hardware out-of-sync.
+		 * May loose one frame
+		 */
+		vpfe->field = fid;
+	}
+}
+
 /*
  * vpfe_isr : ISR handler for vpfe capture (VINT0)
  * @irq: irq number
@@ -1284,76 +1340,24 @@ static inline void vpfe_process_buffer_complete(struct vpfe_device *vpfe)
 static irqreturn_t vpfe_isr(int irq, void *dev)
 {
 	struct vpfe_device *vpfe = (struct vpfe_device *)dev;
-	enum v4l2_field field;
+	enum v4l2_field field = vpfe->fmt.fmt.pix.field;
 	int intr_status;
-	int fid;
 
 	intr_status = vpfe_reg_read(&vpfe->ccdc, VPFE_IRQ_STS);
 
 	if (intr_status & VPFE_VDINT0) {
-		field = vpfe->fmt.fmt.pix.field;
-
 		if (field == V4L2_FIELD_NONE) {
-			/* handle progressive frame capture */
 			if (vpfe->cur_frm != vpfe->next_frm)
 				vpfe_process_buffer_complete(vpfe);
-			goto next_intr;
-		}
-
-		/* interlaced or TB capture check which field
-		   we are in hardware */
-		fid = vpfe_ccdc_getfid(&vpfe->ccdc);
-
-		/* switch the software maintained field id */
-		vpfe->field ^= 1;
-		if (fid == vpfe->field) {
-			/* we are in-sync here,continue */
-			if (fid == 0) {
-				/*
-				 * One frame is just being captured. If the
-				 * next frame is available, release the
-				 * current frame and move on
-				 */
-				if (vpfe->cur_frm != vpfe->next_frm)
-					vpfe_process_buffer_complete(vpfe);
-				/*
-				 * based on whether the two fields are stored
-				 * interleave or separately in memory,
-				 * reconfigure the CCDC memory address
-				 */
-				if (field == V4L2_FIELD_SEQ_TB)
-					vpfe_schedule_bottom_field(vpfe);
-
-				goto next_intr;
-			}
-			/*
-			 * if one field is just being captured configure
-			 * the next frame get the next frame from the empty
-			 * queue if no frame is available hold on to the
-			 * current buffer
-			 */
-			spin_lock(&vpfe->dma_queue_lock);
-			if (!list_empty(&vpfe->dma_queue) &&
-			    vpfe->cur_frm == vpfe->next_frm)
-				vpfe_schedule_next_buffer(vpfe);
-			spin_unlock(&vpfe->dma_queue_lock);
-		} else if (fid == 0) {
-			/*
-			 * out of sync. Recover from any hardware out-of-sync.
-			 * May loose one frame
-			 */
-			vpfe->field = fid;
+		} else {
+			vpfe_handle_interlaced_irq(vpfe, field);
 		}
 	}
 
-next_intr:
 	if (intr_status & VPFE_VDINT1) {
-		spin_lock(&vpfe->dma_queue_lock);
-		if (vpfe->fmt.fmt.pix.field == V4L2_FIELD_NONE &&
-		    !list_empty(&vpfe->dma_queue) &&
+		if (field == V4L2_FIELD_NONE &&
 		    vpfe->cur_frm == vpfe->next_frm)
 			vpfe_schedule_next_buffer(vpfe);
-		spin_unlock(&vpfe->dma_queue_lock);
 	}
 
 	vpfe_clear_intr(&vpfe->ccdc, intr_status);
-- 
2.17.1

