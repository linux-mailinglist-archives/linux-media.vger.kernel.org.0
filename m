Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9D2CC0A8
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 18:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730699AbfJDQ1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 12:27:52 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40512 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730555AbfJDQ1v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 12:27:51 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94GRo8n076872;
        Fri, 4 Oct 2019 11:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570206470;
        bh=U+40G8RP769IGoztZIVs1oL82vYi9RvZaUh9qX9X+H0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hGfc8vbDQEaUwD3nlex6Tl/bppWP86n2y9kambxN1Jo0RnCQocW/t082ez4Kqj2wS
         4cr/uCDWMfL1cWMZZibLXNxO3btbqYqizWPqedHOEhprYTDMtS/BJrpuGVYxGo0oZn
         70fLJ9qPDDfPWw6vQCOxjMw84HQTsCqKJfwdwWcQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94GRoXF050591
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 11:27:50 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:27:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:27:49 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GRgA7028904;
        Fri, 4 Oct 2019 11:27:49 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 05/21] media: ti-vpe: Add support for SEQ_BT
Date:   Fri, 4 Oct 2019 11:29:36 -0500
Message-ID: <20191004162952.4963-6-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Nikhil Devshatwar <nikhil.nd@ti.com>

SEQ_BT indicates the buffer for bottom field needs to be processed
before the top field.

Simplify the field selection logic to support SEQ_BT as well.

Modify the interlace flags to include any of alternate, SEQ_TB, SEQ_BT.
Update other format error checking to consider SEQ_BT.
Replace SEQ_TB with SEQ_XX wherever applicable.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 73 ++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 0e9cb0319a92..5d0ec5f7ca25 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -328,9 +328,14 @@ struct vpe_q_data {
 #define	Q_DATA_MODE_TILED		BIT(1)
 #define	Q_DATA_INTERLACED_ALTERNATE	BIT(2)
 #define	Q_DATA_INTERLACED_SEQ_TB	BIT(3)
+#define	Q_DATA_INTERLACED_SEQ_BT	BIT(4)
+
+#define Q_IS_SEQ_XX		(Q_DATA_INTERLACED_SEQ_TB | \
+				Q_DATA_INTERLACED_SEQ_BT)
 
 #define Q_IS_INTERLACED		(Q_DATA_INTERLACED_ALTERNATE | \
-				Q_DATA_INTERLACED_SEQ_TB)
+				Q_DATA_INTERLACED_SEQ_TB | \
+				Q_DATA_INTERLACED_SEQ_BT)
 
 enum {
 	Q_DATA_SRC = 0,
@@ -1105,24 +1110,31 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 		dma_addr += offset;
 		stride = q_data->bytesperline[VPE_LUMA];
 
-		if (q_data->flags & Q_DATA_INTERLACED_SEQ_TB) {
-			/*
-			 * Use top or bottom field from same vb alternately
-			 * f,f-1,f-2 = TBT when seq is even
-			 * f,f-1,f-2 = BTB when seq is odd
-			 */
-			field = (p_data->vb_index + (ctx->sequence % 2)) % 2;
+		/*
+		 * field used in VPDMA desc  = 0 (top) / 1 (bottom)
+		 * Use top or bottom field from same vb alternately
+		 * For each de-interlacing operation, f,f-1,f-2 should be one
+		 * of TBT or BTB
+		 */
+		if (q_data->flags & Q_DATA_INTERLACED_SEQ_TB ||
+		    q_data->flags & Q_DATA_INTERLACED_SEQ_BT) {
+			/* Select initial value based on format */
+			if (q_data->flags & Q_DATA_INTERLACED_SEQ_BT)
+				field = 1;
+			else
+				field = 0;
+
+			/* Toggle for each vb_index and each operation */
+			field = (field + p_data->vb_index + ctx->sequence) % 2;
 
 			if (field) {
-				/*
-				 * bottom field of a SEQ_TB buffer
-				 * Skip the top field data by
-				 */
 				int height = q_data->height / 2;
 				int bpp = fmt->fourcc == V4L2_PIX_FMT_NV12 ?
 						1 : (vpdma_fmt->depth >> 3);
+
 				if (plane)
 					height /= 2;
+
 				dma_addr += q_data->width * height * bpp;
 			}
 		}
@@ -1177,12 +1189,14 @@ static void device_run(void *priv)
 	struct vpe_q_data *d_q_data = &ctx->q_data[Q_DATA_DST];
 	struct vpe_q_data *s_q_data = &ctx->q_data[Q_DATA_SRC];
 
-	if (ctx->deinterlacing && s_q_data->flags & Q_DATA_INTERLACED_SEQ_TB &&
-		ctx->sequence % 2 == 0) {
-		/* When using SEQ_TB buffers, When using it first time,
-		 * No need to remove the buffer as the next field is present
-		 * in the same buffer. (so that job_ready won't fail)
-		 * It will be removed when using bottom field
+	if (ctx->deinterlacing && s_q_data->flags & Q_IS_SEQ_XX &&
+	    ctx->sequence % 2 == 0) {
+		/* When using SEQ_XX type buffers, each buffer has two fields
+		 * each buffer has two fields (top & bottom)
+		 * Removing one buffer is actually getting two fields
+		 * Alternate between two operations:-
+		 * Even : consume one field but DO NOT REMOVE from queue
+		 * Odd : consume other field and REMOVE from queue
 		 */
 		ctx->src_vbs[0] = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 		WARN_ON(ctx->src_vbs[0] == NULL);
@@ -1573,8 +1587,10 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 		return -EINVAL;
 	}
 
-	if (pix->field != V4L2_FIELD_NONE && pix->field != V4L2_FIELD_ALTERNATE
-			&& pix->field != V4L2_FIELD_SEQ_TB)
+	if (pix->field != V4L2_FIELD_NONE &&
+	    pix->field != V4L2_FIELD_ALTERNATE &&
+	    pix->field != V4L2_FIELD_SEQ_TB &&
+	    pix->field != V4L2_FIELD_SEQ_BT)
 		pix->field = V4L2_FIELD_NONE;
 
 	depth = fmt->vpdma_fmt[VPE_LUMA]->depth;
@@ -1626,9 +1642,9 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 
 	/*
 	 * For the actual image parameters, we need to consider the field
-	 * height of the image for SEQ_TB buffers.
+	 * height of the image for SEQ_XX buffers.
 	 */
-	if (pix->field == V4L2_FIELD_SEQ_TB)
+	if (pix->field == V4L2_FIELD_SEQ_TB || pix->field == V4L2_FIELD_SEQ_BT)
 		height = pix->height / 2;
 	else
 		height = pix->height;
@@ -1734,11 +1750,13 @@ static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 		q_data->flags |= Q_DATA_INTERLACED_ALTERNATE;
 	else if (q_data->field == V4L2_FIELD_SEQ_TB)
 		q_data->flags |= Q_DATA_INTERLACED_SEQ_TB;
+	else if (q_data->field == V4L2_FIELD_SEQ_BT)
+		q_data->flags |= Q_DATA_INTERLACED_SEQ_BT;
 	else
 		q_data->flags &= ~Q_IS_INTERLACED;
 
-	/* the crop height is halved for the case of SEQ_TB buffers */
-	if (q_data->flags & Q_DATA_INTERLACED_SEQ_TB)
+	/* the crop height is halved for the case of SEQ_XX buffers */
+	if (q_data->flags & Q_IS_SEQ_XX)
 		q_data->c_rect.height /= 2;
 
 	vpe_dbg(ctx->dev, "Setting format for type %d, wxh: %dx%d, fmt: %d bpl_y %d",
@@ -1811,10 +1829,10 @@ static int __vpe_try_selection(struct vpe_ctx *ctx, struct v4l2_selection *s)
 	}
 
 	/*
-	 * For SEQ_TB buffers, crop height should be less than the height of
+	 * For SEQ_XX buffers, crop height should be less than the height of
 	 * the field height, not the buffer height
 	 */
-	if (q_data->flags & Q_DATA_INTERLACED_SEQ_TB)
+	if (q_data->flags & Q_IS_SEQ_XX)
 		height = q_data->height / 2;
 	else
 		height = q_data->height;
@@ -2031,7 +2049,8 @@ static int vpe_buf_prepare(struct vb2_buffer *vb)
 		} else {
 			if (vbuf->field != V4L2_FIELD_TOP &&
 			    vbuf->field != V4L2_FIELD_BOTTOM &&
-			    vbuf->field != V4L2_FIELD_SEQ_TB)
+			    vbuf->field != V4L2_FIELD_SEQ_TB &&
+			    vbuf->field != V4L2_FIELD_SEQ_BT)
 				return -EINVAL;
 		}
 	}
-- 
2.17.1

