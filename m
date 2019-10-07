Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 836C0CE6C5
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728729AbfJGPHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:07:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35850 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbfJGPHk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:07:40 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97F7dZI047006;
        Mon, 7 Oct 2019 10:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570460859;
        bh=PJbcQkGUyLQUkdIltaZ+oCCPly62Nq7aKQ+5h4XsBMo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kj31jL14QukpYaXBBO8yc2hIKY+d/uvx5x6y4MV8vxmCbGW/0t5tDR9vf+OeqK1K1
         Qrr+Z8k5pYN381g+ZqLlZe2xFLBOSbOjL6tz4Loj+w0jUWHqlhD7GRm1WI5wR6hqfM
         JabEAiDNnQ+WJFXIN/SC27hmpk22HDagrp8mv3B0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97F7dZb060585;
        Mon, 7 Oct 2019 10:07:39 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 10:07:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 10:07:36 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97F7aF8055156;
        Mon, 7 Oct 2019 10:07:38 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 02/21] media: ti-vpe: vpe: Fix Motion Vector vpdma stride
Date:   Mon, 7 Oct 2019 10:09:50 -0500
Message-ID: <20191007151009.22095-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007151009.22095-1-bparrot@ti.com>
References: <20191007151009.22095-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

commit 52831a418fa6 ("[media] media: ti-vpe: vpe: allow use of user
specified stride") and commit 8c1e4fa17e92 ("[media] media: ti-vpe: vpdma:
add support for user specified stride") resulted in the Motion Vector
stride to be the same as the image stride.

This caused memory corruption in the output image as mentionned in
commit 44f98adf71a8 ("[media] media: ti-vpe: vpe: Fix line stride
for output motion vector").

Fixes: 52831a418fa6 ("[media] media: ti-vpe: vpe: allow use of user specified stride")
Fixes: 8c1e4fa17e92 ("[media] media: ti-vpe: vpdma: add support for user specified stride")
Signed-off-by: Benoit Parrot <bparrot@ti.com>
Acked-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 60b575bb44c4..5ba72445584d 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -1013,11 +1013,14 @@ static void add_out_dtd(struct vpe_ctx *ctx, int port)
 	dma_addr_t dma_addr;
 	u32 flags = 0;
 	u32 offset = 0;
+	u32 stride;
 
 	if (port == VPE_PORT_MV_OUT) {
 		vpdma_fmt = &vpdma_misc_fmts[VPDMA_DATA_FMT_MV];
 		dma_addr = ctx->mv_buf_dma[mv_buf_selector];
 		q_data = &ctx->q_data[Q_DATA_SRC];
+		stride = ALIGN((q_data->width * vpdma_fmt->depth) >> 3,
+			       VPDMA_STRIDE_ALIGN);
 	} else {
 		/* to incorporate interleaved formats */
 		int plane = fmt->coplanar ? p_data->vb_part : 0;
@@ -1044,6 +1047,7 @@ static void add_out_dtd(struct vpe_ctx *ctx, int port)
 		}
 		/* Apply the offset */
 		dma_addr += offset;
+		stride = q_data->bytesperline[VPE_LUMA];
 	}
 
 	if (q_data->flags & Q_DATA_FRAME_1D)
@@ -1055,7 +1059,7 @@ static void add_out_dtd(struct vpe_ctx *ctx, int port)
 			   MAX_W, MAX_H);
 
 	vpdma_add_out_dtd(&ctx->desc_list, q_data->width,
-			  q_data->bytesperline[VPE_LUMA], &q_data->c_rect,
+			  stride, &q_data->c_rect,
 			  vpdma_fmt, dma_addr, MAX_OUT_WIDTH_REG1,
 			  MAX_OUT_HEIGHT_REG1, p_data->channel, flags);
 }
@@ -1074,10 +1078,13 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 	dma_addr_t dma_addr;
 	u32 flags = 0;
 	u32 offset = 0;
+	u32 stride;
 
 	if (port == VPE_PORT_MV_IN) {
 		vpdma_fmt = &vpdma_misc_fmts[VPDMA_DATA_FMT_MV];
 		dma_addr = ctx->mv_buf_dma[mv_buf_selector];
+		stride = ALIGN((q_data->width * vpdma_fmt->depth) >> 3,
+			       VPDMA_STRIDE_ALIGN);
 	} else {
 		/* to incorporate interleaved formats */
 		int plane = fmt->coplanar ? p_data->vb_part : 0;
@@ -1104,6 +1111,7 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 		}
 		/* Apply the offset */
 		dma_addr += offset;
+		stride = q_data->bytesperline[VPE_LUMA];
 
 		if (q_data->flags & Q_DATA_INTERLACED_SEQ_TB) {
 			/*
@@ -1139,10 +1147,10 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 	if (p_data->vb_part && fmt->fourcc == V4L2_PIX_FMT_NV12)
 		frame_height /= 2;
 
-	vpdma_add_in_dtd(&ctx->desc_list, q_data->width,
-			 q_data->bytesperline[VPE_LUMA], &q_data->c_rect,
-		vpdma_fmt, dma_addr, p_data->channel, field, flags, frame_width,
-		frame_height, 0, 0);
+	vpdma_add_in_dtd(&ctx->desc_list, q_data->width, stride,
+			 &q_data->c_rect, vpdma_fmt, dma_addr,
+			 p_data->channel, field, flags, frame_width,
+			 frame_height, 0, 0);
 }
 
 /*
-- 
2.17.1

