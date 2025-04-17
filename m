Return-Path: <linux-media+bounces-30420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94882A9148F
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAE7B17B012
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5904921C163;
	Thu, 17 Apr 2025 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CZH47SMO"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E612A21B9C1;
	Thu, 17 Apr 2025 06:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873044; cv=none; b=BC+E0k4h6hfJabXU6PtfFcUHN/C7JESpxb3V0Gu89X5ZJVmvfTZpPDobZxCxENOnm/NAEMenbhHaAlzbk0TohaqQWk11L4iIx6CBvE6WyeQjuaEmo3hPKnRiiwG8dAyvjhCCz0C1abIKa1s3yLBuXPUviRJJWElECFz0oJD0CDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873044; c=relaxed/simple;
	bh=sEIegzlIhef8uFEitubqjX3tMdcykCCYJ2vuArlmZEw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hILt153su1HnluMFQKs05Nmo+evn4QZJ1LzNUDnSgen2PXEfYiH0x4wvN4GR3mTfD5ml5l/VAJhJljpg3fj8jH3HS6X8SDcf2ADeId0yYOOqlbG6gedWQX1wyMeWKBIKNq1P0wCks0C8pJdVkmickUoGqYIl4iyCknf7BolJWn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CZH47SMO; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53H6vC5u3003895
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 01:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744873032;
	bh=PhShn70TdRYL1J6DfOPQlJOJ9SjRcFePPYyx3QRsNtE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CZH47SMOa/rh5FYCHWUSx/XeLAEiBRPn5dRnf3j+ZaQTEzpJid1W3C9SiVo1Q24JM
	 PAF6g1jQuDkhzX47Zn8qw6rW//IU9aYwK8vtj9KA7IBMsSnglzP/bwoyDRXv7NIwdh
	 y4mf/Uf+mnfYemnskp5+FkXJDw0lGubk5yWQOdpo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53H6vCic000501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 01:57:12 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 01:57:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 01:57:11 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53H6tsxC035403;
	Thu, 17 Apr 2025 01:57:06 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <mripard@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <r-donadkar@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 12/13] media: ti: j721e-csi2rx: Submit all available buffers
Date: Thu, 17 Apr 2025 12:25:53 +0530
Message-ID: <20250417065554.437541-13-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417065554.437541-1-r-donadkar@ti.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Jai Luthra <j-luthra@ti.com>

We already make sure to submit all available buffers to DMA in each DMA
completion callback.

Move that logic in a separate function, and use it during stream start
as well, as most application queue all their buffers before stream on.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 43 +++++++++++--------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index d00b5a1848043..23d63d8bcd36a 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -644,6 +644,27 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 	return ret;
 }
 
+static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dma *dma = &ctx->dma;
+	struct ti_csi2rx_buffer *buf;
+	int ret = 0;
+
+	/* If there are more buffers to process then start their transfer. */
+	while (!list_empty(&dma->queue)) {
+		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
+		ret = ti_csi2rx_start_dma(ctx, buf);
+		if (ret) {
+			dev_err(ctx->csi->dev,
+				"Failed to queue the next buffer for DMA\n");
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+			break;
+		}
+		list_move_tail(&buf->list, &dma->submitted);
+	}
+	return ret;
+}
+
 static void ti_csi2rx_dma_callback(void *param)
 {
 	struct ti_csi2rx_buffer *buf = param;
@@ -664,18 +685,7 @@ static void ti_csi2rx_dma_callback(void *param)
 	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 	list_del(&buf->list);
 
-	/* If there are more buffers to process then start their transfer. */
-	while (!list_empty(&dma->queue)) {
-		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
-
-		if (ti_csi2rx_start_dma(ctx, buf)) {
-			dev_err(ctx->csi->dev,
-				"Failed to queue the next buffer for DMA\n");
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-		} else {
-			list_move_tail(&buf->list, &dma->submitted);
-		}
-	}
+	ti_csi2rx_dma_submit_pending(ctx);
 
 	if (list_empty(&dma->submitted))
 		dma->state = TI_CSI2RX_DMA_IDLE;
@@ -884,7 +894,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
-	struct ti_csi2rx_buffer *buf;
 	struct v4l2_subdev_krouting *routing;
 	struct v4l2_subdev_route *route = NULL, *r;
 	struct media_pad *remote_pad;
@@ -948,16 +957,13 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	ctx->sequence = 0;
 
 	spin_lock_irqsave(&dma->lock, flags);
-	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
 
-	ret = ti_csi2rx_start_dma(ctx, buf);
+	ret = ti_csi2rx_dma_submit_pending(ctx);
 	if (ret) {
-		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
 		spin_unlock_irqrestore(&dma->lock, flags);
-		goto err_pipeline;
+		goto err_dma;
 	}
 
-	list_move_tail(&buf->list, &dma->submitted);
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
@@ -972,7 +978,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_dma:
 	ti_csi2rx_stop_dma(ctx);
-err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
-- 
2.34.1


