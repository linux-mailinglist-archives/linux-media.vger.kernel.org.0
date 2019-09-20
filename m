Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D12EB9647
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 19:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406154AbfITREh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 13:04:37 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39318 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405823AbfITREA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 13:04:00 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KH3xeV101463;
        Fri, 20 Sep 2019 12:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568999039;
        bh=SnHHVBGUrd5TNBEfAg227GGjiJBRYEdc3yNRTaL6AMY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=EeHZHdP8Selbnj4DWJm7Is7BvY+fqeUVsM2C86wQMIlNjZ0lXyPC0TIGax0LY15Jx
         Vi3maq06wz5CM77/rLMt9kt4Q7p4ilLhgvkhZ/lLmOtdky2PEli8HzzxG4ZOm3NTcu
         ZDWJb9e6Ku+zAmh/Q8QMSMbbrPtpKo0Be22H/s5E=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KH3xYM094936
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 12:03:59 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 12:03:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 12:03:54 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KH3r70054719;
        Fri, 20 Sep 2019 12:03:59 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 06/13] media: am437x-vpfe: Streamlined vb2 buffer cleanup
Date:   Fri, 20 Sep 2019 12:05:47 -0500
Message-ID: <20190920170554.29666-7-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920170554.29666-1-bparrot@ti.com>
References: <20190920170554.29666-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Returning queued vb2 buffers back to user space is a common
task best handled by a helper function.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 53 ++++++++++-----------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index e0a4c8920df8..03415c179c85 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -1949,6 +1949,29 @@ static void vpfe_buffer_queue(struct vb2_buffer *vb)
 	spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
 }
 
+static void vpfe_return_all_buffers(struct vpfe_device *vpfe,
+				    enum vb2_buffer_state state)
+{
+	struct vpfe_cap_buffer *buf, *node;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vpfe->dma_queue_lock, flags);
+	list_for_each_entry_safe(buf, node, &vpfe->dma_queue, list) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->list);
+	}
+
+	if (vpfe->cur_frm)
+		vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf, state);
+
+	if (vpfe->next_frm && vpfe->next_frm != vpfe->cur_frm)
+		vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf, state);
+
+	vpfe->cur_frm = NULL;
+	vpfe->next_frm = NULL;
+	spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
+}
+
 /*
  * vpfe_start_streaming : Starts the DMA engine for streaming
  * @vb: ptr to vb2_buffer
@@ -1957,7 +1980,6 @@ static void vpfe_buffer_queue(struct vb2_buffer *vb)
 static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
-	struct vpfe_cap_buffer *buf, *tmp;
 	struct vpfe_subdev_info *sdinfo;
 	unsigned long flags;
 	unsigned long addr;
@@ -2003,11 +2025,7 @@ static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 err:
-	list_for_each_entry_safe(buf, tmp, &vpfe->dma_queue, list) {
-		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
-	}
-
+	vpfe_return_all_buffers(vpfe, VB2_BUF_STATE_QUEUED);
 	vpfe_pcr_enable(&vpfe->ccdc, 0);
 	return ret;
 }
@@ -2023,7 +2041,6 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
 {
 	struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
 	struct vpfe_subdev_info *sdinfo;
-	unsigned long flags;
 	int ret;
 
 	vpfe_pcr_enable(&vpfe->ccdc, 0);
@@ -2041,27 +2058,7 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
 		vpfe_dbg(1, vpfe, "stream off failed in subdev\n");
 
 	/* release all active buffers */
-	spin_lock_irqsave(&vpfe->dma_queue_lock, flags);
-	if (vpfe->cur_frm == vpfe->next_frm) {
-		vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf,
-				VB2_BUF_STATE_ERROR);
-	} else {
-		if (vpfe->cur_frm != NULL)
-			vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf,
-					VB2_BUF_STATE_ERROR);
-		if (vpfe->next_frm != NULL)
-			vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf,
-					VB2_BUF_STATE_ERROR);
-	}
-
-	while (!list_empty(&vpfe->dma_queue)) {
-		vpfe->next_frm = list_entry(vpfe->dma_queue.next,
-						struct vpfe_cap_buffer, list);
-		list_del(&vpfe->next_frm->list);
-		vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf,
-				VB2_BUF_STATE_ERROR);
-	}
-	spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
+	vpfe_return_all_buffers(vpfe, VB2_BUF_STATE_ERROR);
 }
 
 static int vpfe_g_pixelaspect(struct file *file, void *priv,
-- 
2.17.1

