Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C58DC0B52
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbfI0Seo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:34:44 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47050 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbfI0Seo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:34:44 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYh62066321;
        Fri, 27 Sep 2019 13:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609283;
        bh=PJbcQkGUyLQUkdIltaZ+oCCPly62Nq7aKQ+5h4XsBMo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jBcPLMNdGgMA+cqJB6QaHzl/pGMAJn1QQSwaMenHVrKU1gigmjfOdhTPKREz5xQ7s
         GuaH+JhJy5xEzcQ1Jkyq6mLVM7hIAjIiavvYPvH47Ow3Kd6dQexMfU5rJ7Lou6UKLo
         EXDA43+deRovaEHj9Lz0LQXmMPZxMPZyv0YpAb8A=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIYhKF054030
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:34:43 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:34:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:34:43 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYgbo073031;
        Fri, 27 Sep 2019 13:34:42 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 01/16] media: ti-vpe: vpe: Fix Motion Vector vpdma stride
Date:   Fri, 27 Sep 2019 13:36:35 -0500
Message-ID: <20190927183650.31345-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927183650.31345-1-bparrot@ti.com>
References: <20190927183650.31345-1-bparrot@ti.com>
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

