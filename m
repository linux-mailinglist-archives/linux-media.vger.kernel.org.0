Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCFE5DC8CC
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634327AbfJRPdY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:33:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47662 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633187AbfJRPcK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:10 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW8QG013363;
        Fri, 18 Oct 2019 10:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412728;
        bh=LoEq1nITaEuLag1pCdHbi9mndG1mH/UweEifXFbzijk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=WM8Wf5U9EypMRQPd4hycc4eY8Pn4lcwikNhoH3FaBEmxQ3hws+VO9cixIyRywS9vL
         yNLhGc4ppfgBszdWIEDKJfLyGFU/buXWK36LJkbojXzB07T1nutU8i5jqPxbxmviCO
         vqFqO7fO2Wm8sE2aZSPF1nZhWcJ9ZoB6nyyHzNKw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFW8uw112697
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:32:08 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:32:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:08 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15J080266;
        Fri, 18 Oct 2019 10:32:08 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 05/19] media: ti-vpe: cal: Restrict DMA to avoid memory corruption
Date:   Fri, 18 Oct 2019 10:34:23 -0500
Message-ID: <20191018153437.20614-6-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Nikhil Devshatwar <nikhil.nd@ti.com>

When setting DMA for video capture from CSI channel, if the DMA size
is not given, it ends up writing as much data as sent by the camera.

This may lead to overwriting the buffers causing memory corruption.
Observed green lines on the default framebuffer.

Restrict the DMA to maximum height as specified in the S_FMT ioctl.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 78fe2da61d77..62aeedb705e9 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -769,12 +769,13 @@ static void pix_proc_config(struct cal_ctx *ctx)
 }
 
 static void cal_wr_dma_config(struct cal_ctx *ctx,
-			      unsigned int width)
+			      unsigned int width, unsigned int height)
 {
 	u32 val;
 
 	val = reg_read(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port));
 	set_field(&val, ctx->csi2_port, CAL_WR_DMA_CTRL_CPORT_MASK);
+	set_field(&val, height, CAL_WR_DMA_CTRL_YSIZE_MASK);
 	set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
 		  CAL_WR_DMA_CTRL_DTAG_MASK);
 	set_field(&val, CAL_WR_DMA_CTRL_MODE_CONST,
@@ -1397,7 +1398,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	csi2_lane_config(ctx);
 	csi2_ctx_config(ctx);
 	pix_proc_config(ctx);
-	cal_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline);
+	cal_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline,
+			  ctx->v_fmt.fmt.pix.height);
 	cal_wr_dma_addr(ctx, addr);
 	csi2_ppi_enable(ctx);
 
-- 
2.17.1

