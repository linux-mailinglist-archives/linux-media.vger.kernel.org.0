Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90B274A759
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730061AbfFRQpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:51 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41281 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730025AbfFRQpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:46 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEu-0003WX-65; Tue, 18 Jun 2019 18:45:44 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 27/28] media: coda: add coda_slice_mode() function
Date:   Tue, 18 Jun 2019 18:45:34 +0200
Message-Id: <20190618164535.20162-28-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618164535.20162-1-p.zabel@pengutronix.de>
References: <20190618164535.20162-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changing slice mode dynamically while encoding will require to calculate
the register value again, so split it out into a separate function.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c | 45 ++++++++++++++------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index de6a4216a182..b59cb16f75a1 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -675,6 +675,29 @@ static int coda_encode_header(struct coda_ctx *ctx, struct vb2_v4l2_buffer *buf,
 	return 0;
 }
 
+static u32 coda_slice_mode(struct coda_ctx *ctx)
+{
+	int size, unit;
+
+	switch (ctx->params.slice_mode) {
+	case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE:
+	default:
+		return 0;
+	case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB:
+		size = ctx->params.slice_max_mb;
+		unit = 1;
+		break;
+	case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES:
+		size = ctx->params.slice_max_bits;
+		unit = 0;
+		break;
+	}
+
+	return ((size & CODA_SLICING_SIZE_MASK) << CODA_SLICING_SIZE_OFFSET) |
+	       ((unit & CODA_SLICING_UNIT_MASK) << CODA_SLICING_UNIT_OFFSET) |
+	       ((1 & CODA_SLICING_MODE_MASK) << CODA_SLICING_MODE_OFFSET);
+}
+
 static phys_addr_t coda_iram_alloc(struct coda_iram_info *iram, size_t size)
 {
 	phys_addr_t ret;
@@ -1113,27 +1136,7 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 	 * in JPEG mode
 	 */
 	if (dst_fourcc != V4L2_PIX_FMT_JPEG) {
-		switch (ctx->params.slice_mode) {
-		case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE:
-			value = 0;
-			break;
-		case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB:
-			value  = (ctx->params.slice_max_mb &
-				  CODA_SLICING_SIZE_MASK)
-				 << CODA_SLICING_SIZE_OFFSET;
-			value |= (1 & CODA_SLICING_UNIT_MASK)
-				 << CODA_SLICING_UNIT_OFFSET;
-			value |=  1 & CODA_SLICING_MODE_MASK;
-			break;
-		case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES:
-			value  = (ctx->params.slice_max_bits &
-				  CODA_SLICING_SIZE_MASK)
-				 << CODA_SLICING_SIZE_OFFSET;
-			value |= (0 & CODA_SLICING_UNIT_MASK)
-				 << CODA_SLICING_UNIT_OFFSET;
-			value |=  1 & CODA_SLICING_MODE_MASK;
-			break;
-		}
+		value = coda_slice_mode(ctx);
 		coda_write(dev, value, CODA_CMD_ENC_SEQ_SLICE_MODE);
 		value = ctx->params.gop_size;
 		coda_write(dev, value, CODA_CMD_ENC_SEQ_GOP_SIZE);
-- 
2.20.1

