Return-Path: <linux-media+bounces-14252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7C91A78D
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A80691C23454
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D891922F0;
	Thu, 27 Jun 2024 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ncaa1QRy"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F70191491;
	Thu, 27 Jun 2024 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493857; cv=none; b=EDLbMhIpD7ep3y8uf52MatB8HfV8Av1AHzlVAMys3R1M0ZxR0H9QS2wIjoGumHpweOoWpJmf6HgqSo6XV/OZarCwLYMjetZfm16MtCoGlF8wXFvs3fPd/464pc0uwtc15Ddl0fgNub8QcdZZCPha8SqFAPqIi9+5LM2Fd/mgoHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493857; c=relaxed/simple;
	bh=FbcR+dVVbxUGN0wBjf6lwvb+us2pjWAIe25ELsV0j6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WpdXU8v2YMz93F8JFuUWX/6bHYGBTJ2ScvA/pQrWPz8dYufWbDZ0HUOVWNeDIOzOLsJcGEnllskUWZZ5bujl3AGnmyMYxneDzewgzyzgI6iwqETK4jRSPgL8a3GGffp6LGKltwE58UyFxnikCsvEW1UFDnC4HfN0hDrradCn4hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ncaa1QRy; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAiKD110257;
	Thu, 27 Jun 2024 08:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493844;
	bh=W9I8M0fJ29EEa1Vs6py4YdDpWiT/n+FZs2W3TvBARoY=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=Ncaa1QRyHcB6HIbgB9a1F70yTCxDCAEM0J/+TgdAwbJKcQM9Sk1fXpA3nw7Jhtarb
	 x6xH8e/2VzngLT1LfympFwLoAWO0jL6H/1M/D6NiAFHJsYVdF6uAzzote8rAQK74IZ
	 ZgnO40rd1TkIGG1eZZ1eHn19BaJNDClZbF8rjNQQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAik3029431
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:44 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAhJh072744;
	Thu, 27 Jun 2024 08:10:44 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:40:08 +0530
Subject: [PATCH v2 13/13] media: ti: j721e-csi2rx: Submit all available
 buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-13-6ae96c54c1c3@ti.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
In-Reply-To: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3576; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=FbcR+dVVbxUGN0wBjf6lwvb+us2pjWAIe25ELsV0j6A=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWS+jgHgO1a5SJEwXQ37yzNnduJruvc/sx6CU
 4hkmKyvqUmJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1kvgAKCRBD3pH5JJpx
 RdyjD/9QcfTeOz89dcMzVZ3z4tXfZyeKqFX5GXRBDV/S+SqZemYQ3K4Pkw1ABQRL8tSRo5LcZvh
 CqsMIZVGWgY2A1cIynS0mSI9qrGDJbUXSyUS/bL5ceWTUYiKd8m/J0/6Og7+3/3x6i0jQmgNkW7
 rlLibDNaZYTqWEIDTnqGpXbTZInqjFzhte2IBKH51BtrHk3zxX/BWLU1jbW5Z0o+DiEJt+NfICu
 WOiW+Y5yp266MoLG5RyGcTIrv4ndwkMMGqBhOP0bZsMyH7j+qkBN4h84j4YcDlxtTZN6/58Iw6p
 n8UhynuGNG38zZQNOop5OOuCkbzFnkDThp7ClCz6Q6nJEfHK6V8u6ZiZb5c489RP2G/fwGFwySc
 XwNRFg7UyoJ4r3YKw/VfdzVfPMZid8ZqOfIY+uEDiNB1fmt+2LUd+vvUhZzZPI3jLbeJL7CSJxK
 qC5iEHD7Ty0EG/XEP8dY8fAxrLmjYZ0e8mYfIvg4zW0+fFIJEMpeY+D8GxIknTir/HHjDQ2JKrs
 EirR25dDLy2AEw1sMMJ25HL3/CXUrhj8Rym/xTVKdUh+DSKon5nVBuLPwL0OBiys0j+vZHnfnOt
 pd0VrpKSnL+F8B/dUg7ZbwruvT8iolrNtFIt5mvlwzcwi9GiRtbngS7GsV8YNrV8bHJqBpNDyyv
 w1Pxq7uJqC3mSCg==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

We already make sure to submit all available buffers to DMA in each DMA
completion callback.

Move that logic in a separate function, and use it during stream start
as well, as most application queue all their buffers before stream on.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 43 ++++++++++++----------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 84b972c251e8..a258477b9084 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -637,6 +637,27 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
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
@@ -657,18 +678,7 @@ static void ti_csi2rx_dma_callback(void *param)
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
@@ -877,7 +887,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
-	struct ti_csi2rx_buffer *buf;
 	struct v4l2_subdev_krouting *routing;
 	struct v4l2_subdev_route *route = NULL;
 	struct media_pad *remote_pad;
@@ -943,16 +952,13 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
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
 
@@ -967,7 +973,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_dma:
 	ti_csi2rx_stop_dma(ctx);
-err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));

-- 
2.43.0


