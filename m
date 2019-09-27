Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12A00C0B56
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbfI0Set (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:34:49 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57762 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbfI0Ses (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:34:48 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYlVD091552;
        Fri, 27 Sep 2019 13:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609287;
        bh=HuKfbtAS6502L4aeFWxqTkMVjLR2uSz+eszYj8624Hc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=u9ckipjtcX5OQdppvsWuablAlM0B205g8e0bO8PbL6s/PgFfDT+7up5FRutFiuhrK
         6Zdm3aVoyx4zPLw6b7kQX+rhf7XBru+qXmLn5gIz9fk2p+z1uJSWyIEknLdmGAzhO+
         NPZfUkWfnULoLeJS5TOLjpwjhAsfytwGvBAQMbUw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIYlaG054057
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:34:47 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:34:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:34:38 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYgbs073031;
        Fri, 27 Sep 2019 13:34:46 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 05/16] media: ti-vpe: Add support for NV21 format
Date:   Fri, 27 Sep 2019 13:36:39 -0500
Message-ID: <20190927183650.31345-6-bparrot@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

In NV21 format, the chroma plane is written to memory such that the U
and V components are swapped for NV12.

Create a new entry in the VPDMA formats to describe the correct data
types used in the data descriptors.

Update all checks for NV12 and add NV21 there as well.

Add support for V4L2_PIX_FMT_NV21 format for both capture and output
streams.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/vpdma.c      | 11 ++++++--
 drivers/media/platform/ti-vpe/vpdma.h      |  1 +
 drivers/media/platform/ti-vpe/vpdma_priv.h |  1 +
 drivers/media/platform/ti-vpe/vpe.c        | 29 +++++++++++++++++-----
 4 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
index 53d27cd6e10a..817d287c8138 100644
--- a/drivers/media/platform/ti-vpe/vpdma.c
+++ b/drivers/media/platform/ti-vpe/vpdma.c
@@ -56,6 +56,11 @@ const struct vpdma_data_format vpdma_yuv_fmts[] = {
 		.data_type	= DATA_TYPE_C420,
 		.depth		= 4,
 	},
+	[VPDMA_DATA_FMT_CB420] = {
+		.type		= VPDMA_DATA_FMT_TYPE_YUV,
+		.data_type	= DATA_TYPE_CB420,
+		.depth		= 4,
+	},
 	[VPDMA_DATA_FMT_YCR422] = {
 		.type		= VPDMA_DATA_FMT_TYPE_YUV,
 		.data_type	= DATA_TYPE_YCR422,
@@ -825,7 +830,8 @@ void vpdma_rawchan_add_out_dtd(struct vpdma_desc_list *list, int width,
 	channel = next_chan = raw_vpdma_chan;
 
 	if (fmt->type == VPDMA_DATA_FMT_TYPE_YUV &&
-			fmt->data_type == DATA_TYPE_C420) {
+	    (fmt->data_type == DATA_TYPE_C420 ||
+	     fmt->data_type == DATA_TYPE_CB420)) {
 		rect.height >>= 1;
 		rect.top >>= 1;
 		depth = 8;
@@ -893,7 +899,8 @@ void vpdma_add_in_dtd(struct vpdma_desc_list *list, int width,
 	channel = next_chan = chan_info[chan].num;
 
 	if (fmt->type == VPDMA_DATA_FMT_TYPE_YUV &&
-			fmt->data_type == DATA_TYPE_C420) {
+	    (fmt->data_type == DATA_TYPE_C420 ||
+	     fmt->data_type == DATA_TYPE_CB420)) {
 		rect.height >>= 1;
 		rect.top >>= 1;
 		depth = 8;
diff --git a/drivers/media/platform/ti-vpe/vpdma.h b/drivers/media/platform/ti-vpe/vpdma.h
index 28bc94129348..bce17329c4c9 100644
--- a/drivers/media/platform/ti-vpe/vpdma.h
+++ b/drivers/media/platform/ti-vpe/vpdma.h
@@ -71,6 +71,7 @@ enum vpdma_yuv_formats {
 	VPDMA_DATA_FMT_C444,
 	VPDMA_DATA_FMT_C422,
 	VPDMA_DATA_FMT_C420,
+	VPDMA_DATA_FMT_CB420,
 	VPDMA_DATA_FMT_YCR422,
 	VPDMA_DATA_FMT_YC444,
 	VPDMA_DATA_FMT_CRY422,
diff --git a/drivers/media/platform/ti-vpe/vpdma_priv.h b/drivers/media/platform/ti-vpe/vpdma_priv.h
index c488609bc162..d8ae3e1cd54d 100644
--- a/drivers/media/platform/ti-vpe/vpdma_priv.h
+++ b/drivers/media/platform/ti-vpe/vpdma_priv.h
@@ -92,6 +92,7 @@
 #define DATA_TYPE_C444				0x4
 #define DATA_TYPE_C422				0x5
 #define DATA_TYPE_C420				0x6
+#define DATA_TYPE_CB420				0x16
 #define DATA_TYPE_YC444				0x8
 #define DATA_TYPE_YCB422			0x7
 #define DATA_TYPE_YCR422			0x17
diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 5d0ec5f7ca25..f3ee9ff87927 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -248,6 +248,14 @@ static struct vpe_fmt vpe_formats[] = {
 				    &vpdma_yuv_fmts[VPDMA_DATA_FMT_C420],
 				  },
 	},
+	{
+		.fourcc		= V4L2_PIX_FMT_NV21,
+		.types		= VPE_FMT_TYPE_CAPTURE | VPE_FMT_TYPE_OUTPUT,
+		.coplanar	= 1,
+		.vpdma_fmt	= { &vpdma_yuv_fmts[VPDMA_DATA_FMT_Y420],
+				    &vpdma_yuv_fmts[VPDMA_DATA_FMT_CB420],
+				  },
+	},
 	{
 		.fourcc		= V4L2_PIX_FMT_YUYV,
 		.types		= VPE_FMT_TYPE_CAPTURE | VPE_FMT_TYPE_OUTPUT,
@@ -686,7 +694,8 @@ static void set_cfg_modes(struct vpe_ctx *ctx)
 	 * Cfg Mode 1: YUV422 source, disable upsampler, DEI is de-interlacing.
 	 */
 
-	if (fmt->fourcc == V4L2_PIX_FMT_NV12)
+	if (fmt->fourcc == V4L2_PIX_FMT_NV12 ||
+	    fmt->fourcc == V4L2_PIX_FMT_NV21)
 		cfg_mode = 0;
 
 	write_field(us1_reg0, cfg_mode, VPE_US_MODE_MASK, VPE_US_MODE_SHIFT);
@@ -701,7 +710,8 @@ static void set_line_modes(struct vpe_ctx *ctx)
 	struct vpe_fmt *fmt = ctx->q_data[Q_DATA_SRC].fmt;
 	int line_mode = 1;
 
-	if (fmt->fourcc == V4L2_PIX_FMT_NV12)
+	if (fmt->fourcc == V4L2_PIX_FMT_NV12 ||
+	    fmt->fourcc == V4L2_PIX_FMT_NV21)
 		line_mode = 0;		/* double lines to line buffer */
 
 	/* regs for now */
@@ -763,7 +773,8 @@ static void set_dst_registers(struct vpe_ctx *ctx)
 	 */
 	val |= VPE_DS_SRC_DEI_SCALER | VPE_CSC_SRC_DEI_SCALER;
 
-	if (fmt->fourcc != V4L2_PIX_FMT_NV12)
+	if (fmt->fourcc != V4L2_PIX_FMT_NV12 &&
+	    fmt->fourcc != V4L2_PIX_FMT_NV21)
 		val |= VPE_DS_BYPASS;
 
 	mmr_adb->out_fmt_reg[0] = val;
@@ -1129,8 +1140,13 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 
 			if (field) {
 				int height = q_data->height / 2;
-				int bpp = fmt->fourcc == V4L2_PIX_FMT_NV12 ?
-						1 : (vpdma_fmt->depth >> 3);
+				int bpp;
+
+				if (fmt->fourcc == V4L2_PIX_FMT_NV12 ||
+				    fmt->fourcc == V4L2_PIX_FMT_NV21)
+					bpp = 1;
+				else
+					bpp = vpdma_fmt->depth >> 3;
 
 				if (plane)
 					height /= 2;
@@ -1148,7 +1164,8 @@ static void add_in_dtd(struct vpe_ctx *ctx, int port)
 	frame_width = q_data->c_rect.width;
 	frame_height = q_data->c_rect.height;
 
-	if (p_data->vb_part && fmt->fourcc == V4L2_PIX_FMT_NV12)
+	if (p_data->vb_part && (fmt->fourcc == V4L2_PIX_FMT_NV12 ||
+				fmt->fourcc == V4L2_PIX_FMT_NV21))
 		frame_height /= 2;
 
 	vpdma_add_in_dtd(&ctx->desc_list, q_data->width, stride,
-- 
2.17.1

