Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60952ADD36
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 18:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390482AbfIIQ0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 12:26:50 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54470 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389706AbfIIQ0F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 12:26:05 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89GQ4dQ034918;
        Mon, 9 Sep 2019 11:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568046364;
        bh=bOGVnBJIvQUxSEqD3gF2J/p86KFbfTC5UBF/IOoiDHY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uQqSJMs4k+VlmHr097FvVGEzOwl4jc+BRNjSpN2mULGZvm9o1E9C6ES/r9IxpR6p7
         rcSijd8q5DCwOlWzvLmA2lJlkXNtPKePntNJ8EvgOVPTGcb5dIKSZR4Wx837BnT1Qa
         +04TP/zG8WiQEiDqQ0KYbCL8kIjIjvKMB3rT3mrc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89GQ4hQ090616
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Sep 2019 11:26:04 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 11:26:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 11:26:04 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GPnoT056522;
        Mon, 9 Sep 2019 11:26:04 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 05/13] media: am437x-vpfe: Streamlined vb2 buffer cleanup
Date:   Mon, 9 Sep 2019 11:27:35 -0500
Message-ID: <20190909162743.30114-6-bparrot@ti.com>
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

Returning queued vb2 buffers back to user space is a common
task best handled by a helper function.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 54 ++++++++++-----------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 3a8ad9bdf283..52f7fc6e11dd 100644
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
@@ -2003,11 +2025,8 @@ static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 err:
-	list_for_each_entry_safe(buf, tmp, &vpfe->dma_queue, list) {
-		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
-	}
-
+	vpfe_return_all_buffers(vpfe, VB2_BUF_STATE_QUEUED);
+	vpfe_pcr_enable(&vpfe->ccdc, 0);
 	return ret;
 }
 
@@ -2022,7 +2041,6 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
 {
 	struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
 	struct vpfe_subdev_info *sdinfo;
-	unsigned long flags;
 	int ret;
 
 	vpfe_pcr_enable(&vpfe->ccdc, 0);
@@ -2040,27 +2058,7 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
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

