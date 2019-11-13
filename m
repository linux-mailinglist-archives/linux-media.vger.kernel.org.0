Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C457DFB0EA
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 13:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfKMM6k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 07:58:40 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54417 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbfKMM6j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 07:58:39 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iUsEI-0000lm-Fq; Wed, 13 Nov 2019 13:58:38 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
Subject: [PATCH 2/4] media: coda: jpeg: merge Huffman table bits and values
Date:   Wed, 13 Nov 2019 13:58:22 +0100
Message-Id: <20191113125824.19547-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113125824.19547-1-p.zabel@pengutronix.de>
References: <20191113125824.19547-1-p.zabel@pengutronix.de>
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

The Huffman bits tables are always 16 bytes long, and they are always
followed directly by the values tables, both in hardware and in JPEG
files. Just merge the two tables.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-jpeg.c | 40 ++++++++++---------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
index bf61a3ecc580..27e20aee1a8c 100644
--- a/drivers/media/platform/coda/coda-jpeg.c
+++ b/drivers/media/platform/coda/coda-jpeg.c
@@ -19,32 +19,29 @@
  * chrominance from JPEG ITU-T.81 (ISO/IEC 10918-1) Annex K.3
  */
 
-static const unsigned char luma_dc_bits[16] = {
+static const unsigned char luma_dc[16 + 12] = {
+	/* bits */
 	0x00, 0x01, 0x05, 0x01, 0x01, 0x01, 0x01, 0x01,
 	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-};
-
-static const unsigned char luma_dc_value[12] = {
+	/* values */
 	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
 	0x08, 0x09, 0x0a, 0x0b,
 };
 
-static const unsigned char chroma_dc_bits[16] = {
+static const unsigned char chroma_dc[16 + 12] = {
+	/* bits */
 	0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
 	0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
-};
-
-static const unsigned char chroma_dc_value[12] = {
+	/* values */
 	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
 	0x08, 0x09, 0x0a, 0x0b,
 };
 
-static const unsigned char luma_ac_bits[16] = {
+static const unsigned char luma_ac[16 + 162 + 2] = {
+	/* bits */
 	0x00, 0x02, 0x01, 0x03, 0x03, 0x02, 0x04, 0x03,
 	0x05, 0x05, 0x04, 0x04, 0x00, 0x00, 0x01, 0x7d,
-};
-
-static const unsigned char luma_ac_value[162 + 2] = {
+	/* values */
 	0x01, 0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12,
 	0x21, 0x31, 0x41, 0x06, 0x13, 0x51, 0x61, 0x07,
 	0x22, 0x71, 0x14, 0x32, 0x81, 0x91, 0xa1, 0x08,
@@ -68,12 +65,11 @@ static const unsigned char luma_ac_value[162 + 2] = {
 	0xf9, 0xfa, /* padded to 32-bit */
 };
 
-static const unsigned char chroma_ac_bits[16] = {
+static const unsigned char chroma_ac[16 + 162 + 2] = {
+	/* bits */
 	0x00, 0x02, 0x01, 0x02, 0x04, 0x04, 0x03, 0x04,
 	0x07, 0x05, 0x04, 0x04, 0x00, 0x01, 0x02, 0x77,
-};
-
-static const unsigned char chroma_ac_value[162 + 2] = {
+	/* values */
 	0x00, 0x01, 0x02, 0x03, 0x11, 0x04, 0x05, 0x21,
 	0x31, 0x06, 0x12, 0x41, 0x51, 0x07, 0x61, 0x71,
 	0x13, 0x22, 0x32, 0x81, 0x08, 0x14, 0x42, 0x91,
@@ -148,14 +144,10 @@ int coda_jpeg_write_tables(struct coda_ctx *ctx)
 {
 	int i;
 	static const struct coda_memcpy_desc huff[8] = {
-		{ 0,   luma_dc_bits,    sizeof(luma_dc_bits)    },
-		{ 16,  luma_dc_value,   sizeof(luma_dc_value)   },
-		{ 32,  luma_ac_bits,    sizeof(luma_ac_bits)    },
-		{ 48,  luma_ac_value,   sizeof(luma_ac_value)   },
-		{ 216, chroma_dc_bits,  sizeof(chroma_dc_bits)  },
-		{ 232, chroma_dc_value, sizeof(chroma_dc_value) },
-		{ 248, chroma_ac_bits,  sizeof(chroma_ac_bits)  },
-		{ 264, chroma_ac_value, sizeof(chroma_ac_value) },
+		{ 0,   luma_dc,    sizeof(luma_dc)    },
+		{ 32,  luma_ac,    sizeof(luma_ac)    },
+		{ 216, chroma_dc,  sizeof(chroma_dc)  },
+		{ 248, chroma_ac,  sizeof(chroma_ac)  },
 	};
 	struct coda_memcpy_desc qmat[3] = {
 		{ 512, ctx->params.jpeg_qmat_tab[0], 64 },
-- 
2.20.1

