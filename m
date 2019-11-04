Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A86ABEE899
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbfKDTcB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:32:01 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48730 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729632AbfKDTb7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:31:59 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVvUT104143;
        Mon, 4 Nov 2019 13:31:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572895917;
        bh=hkspqH83wgEPy5/qwu9lbvIhOuaEmsJ5tRfFg6TJ8EA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=qC7RH7+QoLNvDol4osU+WBbqWt3k+iDYQhNQ86JBZCVB8mqgl+M6k7negjn7FpHFf
         3CZ6NLQCcWkHgjDeD8LZuz3YXC6UgDRQ3pBD0BgKDkBdhKN/ycouFXgb26y/qgdwCh
         yaZj0XtCQz+pwFPLVgoy26HCbEEHHkPqDNUXxCHk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4JVvnF059490
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 13:31:57 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 13:31:42 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 13:31:42 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVmd4096934;
        Mon, 4 Nov 2019 13:31:57 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 05/20] media: ti-vpe: cal: Restrict DMA to avoid memory corruption
Date:   Mon, 4 Nov 2019 13:31:25 -0600
Message-ID: <20191104193140.31145-6-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104193140.31145-1-bparrot@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
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
index 7d25ad83ca1e..04e84c4dc92a 100644
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

