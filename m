Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88E80E0747
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 17:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388435AbfJVP1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 11:27:05 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:48715 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730405AbfJVP1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 11:27:05 -0400
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id B58D3240003;
        Tue, 22 Oct 2019 15:27:01 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v9 1/5] media: cedrus: Fix undefined shift with a SHIFT_AND_MASK_BITS macro
Date:   Tue, 22 Oct 2019 17:26:50 +0200
Message-Id: <20191022152654.1999355-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022152654.1999355-1-paul.kocialkowski@bootlin.com>
References: <20191022152654.1999355-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to shift and mask values at different occasions to fill up
cedrus registers. This was done using macros that don't explicitly
treat arguments as unsigned, leading to possibly undefined behavior.

Introduce the SHIFT_AND_MASK_BITS macro and use it where possible.
In cases where it doesn't apply as-is, explicitly cast to unsigned
instead.

This macro should be moved to include/linux/bits.h eventually.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  | 31 ++++++++++---------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index ddd29788d685..f9dd8cbf3458 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -10,6 +10,9 @@
 #ifndef _CEDRUS_REGS_H_
 #define _CEDRUS_REGS_H_
 
+#define SHIFT_AND_MASK_BITS(v, h, l) \
+	(((unsigned long)(v) << (l)) & GENMASK(h, l))
+
 /*
  * Common acronyms and contractions used in register descriptions:
  * * VLD : Variable-Length Decoder
@@ -37,8 +40,8 @@
 #define VE_PRIMARY_CHROMA_BUF_LEN		0xc4
 #define VE_PRIMARY_FB_LINE_STRIDE		0xc8
 
-#define VE_PRIMARY_FB_LINE_STRIDE_CHROMA(s)	(((s) << 16) & GENMASK(31, 16))
-#define VE_PRIMARY_FB_LINE_STRIDE_LUMA(s)	(((s) << 0) & GENMASK(15, 0))
+#define VE_PRIMARY_FB_LINE_STRIDE_CHROMA(s)	SHIFT_AND_MASK_BITS(s, 31, 16)
+#define VE_PRIMARY_FB_LINE_STRIDE_LUMA(s)	SHIFT_AND_MASK_BITS(s, 15, 0)
 
 #define VE_CHROMA_BUF_LEN			0xe8
 
@@ -46,7 +49,7 @@
 #define VE_SECONDARY_OUT_FMT_EXT		(0x01 << 30)
 #define VE_SECONDARY_OUT_FMT_YU12		(0x02 << 30)
 #define VE_SECONDARY_OUT_FMT_YV12		(0x03 << 30)
-#define VE_CHROMA_BUF_LEN_SDRT(l)		((l) & GENMASK(27, 0))
+#define VE_CHROMA_BUF_LEN_SDRT(l)		SHIFT_AND_MASK_BITS(l, 27, 0)
 
 #define VE_PRIMARY_OUT_FMT			0xec
 
@@ -69,15 +72,15 @@
 
 #define VE_DEC_MPEG_MP12HDR			(VE_ENGINE_DEC_MPEG + 0x00)
 
-#define VE_DEC_MPEG_MP12HDR_SLICE_TYPE(t)	(((t) << 28) & GENMASK(30, 28))
+#define VE_DEC_MPEG_MP12HDR_SLICE_TYPE(t)	SHIFT_AND_MASK_BITS(t, 30, 28)
 #define VE_DEC_MPEG_MP12HDR_F_CODE_SHIFT(x, y)	(24 - 4 * (y) - 8 * (x))
 #define VE_DEC_MPEG_MP12HDR_F_CODE(__x, __y, __v) \
-	(((__v) & GENMASK(3, 0)) << VE_DEC_MPEG_MP12HDR_F_CODE_SHIFT(__x, __y))
+	(((unsigned long)(__v) & GENMASK(3, 0)) << VE_DEC_MPEG_MP12HDR_F_CODE_SHIFT(__x, __y))
 
 #define VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(p) \
-	(((p) << 10) & GENMASK(11, 10))
+	SHIFT_AND_MASK_BITS(p, 11, 10)
 #define VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(s) \
-	(((s) << 8) & GENMASK(9, 8))
+	SHIFT_AND_MASK_BITS(s, 9, 8)
 #define VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(v) \
 	((v) ? BIT(7) : 0)
 #define VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(v) \
@@ -98,19 +101,19 @@
 #define VE_DEC_MPEG_PICCODEDSIZE		(VE_ENGINE_DEC_MPEG + 0x08)
 
 #define VE_DEC_MPEG_PICCODEDSIZE_WIDTH(w) \
-	((DIV_ROUND_UP((w), 16) << 8) & GENMASK(15, 8))
+	SHIFT_AND_MASK_BITS(DIV_ROUND_UP((w), 16), 15, 8)
 #define VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(h) \
-	((DIV_ROUND_UP((h), 16) << 0) & GENMASK(7, 0))
+	SHIFT_AND_MASK_BITS(DIV_ROUND_UP((h), 16), 7, 0)
 
 #define VE_DEC_MPEG_PICBOUNDSIZE		(VE_ENGINE_DEC_MPEG + 0x0c)
 
-#define VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(w)	(((w) << 16) & GENMASK(27, 16))
-#define VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(h)	(((h) << 0) & GENMASK(11, 0))
+#define VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(w)	SHIFT_AND_MASK_BITS(w, 27, 16)
+#define VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(h)	SHIFT_AND_MASK_BITS(h, 11, 0)
 
 #define VE_DEC_MPEG_MBADDR			(VE_ENGINE_DEC_MPEG + 0x10)
 
-#define VE_DEC_MPEG_MBADDR_X(w)			(((w) << 8) & GENMASK(15, 8))
-#define VE_DEC_MPEG_MBADDR_Y(h)			(((h) << 0) & GENMASK(7, 0))
+#define VE_DEC_MPEG_MBADDR_X(w)			SHIFT_AND_MASK_BITS(w, 15, 8)
+#define VE_DEC_MPEG_MBADDR_Y(h)			SHIFT_AND_MASK_BITS(h, 7, 0)
 
 #define VE_DEC_MPEG_CTRL			(VE_ENGINE_DEC_MPEG + 0x14)
 
@@ -225,7 +228,7 @@
 #define VE_DEC_MPEG_IQMINPUT_FLAG_INTRA		(0x01 << 14)
 #define VE_DEC_MPEG_IQMINPUT_FLAG_NON_INTRA	(0x00 << 14)
 #define VE_DEC_MPEG_IQMINPUT_WEIGHT(i, v) \
-	(((v) & GENMASK(7, 0)) | (((i) << 8) & GENMASK(13, 8)))
+	(SHIFT_AND_MASK_BITS(i, 13, 8) | SHIFT_AND_MASK_BITS(v, 7, 0))
 
 #define VE_DEC_MPEG_ERROR			(VE_ENGINE_DEC_MPEG + 0xc4)
 #define VE_DEC_MPEG_CRTMBADDR			(VE_ENGINE_DEC_MPEG + 0xc8)
-- 
2.23.0

