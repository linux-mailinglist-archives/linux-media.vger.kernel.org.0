Return-Path: <linux-media+bounces-11611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F3F8C8B0B
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 19:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FC32282647
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 17:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D53613DDB7;
	Fri, 17 May 2024 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yuqCwIRG"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E959D12FB3E;
	Fri, 17 May 2024 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715967264; cv=none; b=pf8k8EomCl9+X1qCX+Xf/WAqR93b/S9IX35ETa7bTvUYWvlI2t7GY38LVaepIs6XRlyDGRQ2pE5v/Ca/jeD36mZihghgIaY3FRn2ahm0OqeiiIIek6TQOMsjbloC/mAEHq+rPqFa95nGULbQOeGy/DxYv/UzUxzPVbIDtCcjsaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715967264; c=relaxed/simple;
	bh=3CbUDoSFWbwQ8xYrpKAae2JXUbKaVLKWQqaAZ7jXQAQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pZWyU61ZQJLyXMuGb2f6jgPamrwgM/hDHrmc4NiTi7n2ePKswstNPMiqTiuOtRLMWM8SgKOBkuNNfMjKVhVMf8NTEQXOhxRJ3JtKpBOOumKjsFLflvpEyqgcSt3HrhqnmxqMH1uSvF/BdS/KTJpUUojA2ALl2V2XA2aZ3aYupt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yuqCwIRG; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44HHXll8076357;
	Fri, 17 May 2024 12:33:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715967227;
	bh=0EwXBKCRAxAG/OUrii9PbnBkQTkKx1Oyx40xLcmJkHc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yuqCwIRGryJJCFv4t/A1EbMyhABgAZN37kxYiW0K+lngX6AC0MEbpXil18+R2PptY
	 MDULYJNyfPdc7mBIXkrcU/3uhDi8yZOkQ7lVTjGKN3QLvMWzrH4Usp7CEkeo0+ONj8
	 CPxE4PE4xXKE9POTkrg0hE/cJC4vFfxY37zz1MMk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44HHXlU7042232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 May 2024 12:33:47 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 May 2024 12:33:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 May 2024 12:33:47 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44HHXktI128304;
	Fri, 17 May 2024 12:33:46 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <ezequiel@vanguardiasur.com.ar>, <p.zabel@pengutronix.de>,
        <linux-rockchip@lists.infradead.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>
Subject: [PATCH v8 05/10] media: verisilcon : Use exported tables from v4l2-jpeg for hantro codec
Date: Fri, 17 May 2024 23:03:46 +0530
Message-ID: <20240517173346.794542-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240517171532.748684-1-devarsht@ti.com>
References: <20240517171532.748684-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Use v4l2-jpeg core API to import reference quantization and huffman tables
used for JPEG Encoding.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
V8: Add Reviewed-by and Acked-by tags
V1->V6 (No change, patch introduced in V7)
---
 .../media/platform/verisilicon/hantro_jpeg.c  | 128 ++----------------
 1 file changed, 14 insertions(+), 114 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_jpeg.c b/drivers/media/platform/verisilicon/hantro_jpeg.c
index d07b1b449b61..fa4e8ee92c05 100644
--- a/drivers/media/platform/verisilicon/hantro_jpeg.c
+++ b/drivers/media/platform/verisilicon/hantro_jpeg.c
@@ -11,6 +11,7 @@
 #include <linux/build_bug.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
+#include <media/v4l2-jpeg.h>
 #include "hantro_jpeg.h"
 #include "hantro.h"
 
@@ -24,42 +25,6 @@
 #define HUFF_CHROMA_DC_OFF	394
 #define HUFF_CHROMA_AC_OFF	427
 
-/* Default tables from JPEG ITU-T.81
- * (ISO/IEC 10918-1) Annex K, tables K.1 and K.2
- */
-static const unsigned char luma_q_table[] = {
-	0x10, 0x0b, 0x0a, 0x10, 0x18, 0x28, 0x33, 0x3d,
-	0x0c, 0x0c, 0x0e, 0x13, 0x1a, 0x3a, 0x3c, 0x37,
-	0x0e, 0x0d, 0x10, 0x18, 0x28, 0x39, 0x45, 0x38,
-	0x0e, 0x11, 0x16, 0x1d, 0x33, 0x57, 0x50, 0x3e,
-	0x12, 0x16, 0x25, 0x38, 0x44, 0x6d, 0x67, 0x4d,
-	0x18, 0x23, 0x37, 0x40, 0x51, 0x68, 0x71, 0x5c,
-	0x31, 0x40, 0x4e, 0x57, 0x67, 0x79, 0x78, 0x65,
-	0x48, 0x5c, 0x5f, 0x62, 0x70, 0x64, 0x67, 0x63
-};
-
-static const unsigned char chroma_q_table[] = {
-	0x11, 0x12, 0x18, 0x2f, 0x63, 0x63, 0x63, 0x63,
-	0x12, 0x15, 0x1a, 0x42, 0x63, 0x63, 0x63, 0x63,
-	0x18, 0x1a, 0x38, 0x63, 0x63, 0x63, 0x63, 0x63,
-	0x2f, 0x42, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
-	0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
-	0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
-	0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
-	0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63
-};
-
-static const unsigned char zigzag[] = {
-	 0,  1,  8, 16,  9,  2,  3, 10,
-	17, 24, 32, 25, 18, 11,  4,  5,
-	12, 19, 26, 33, 40, 48, 41, 34,
-	27, 20, 13,  6,  7, 14, 21, 28,
-	35, 42, 49, 56, 57, 50, 43, 36,
-	29, 22, 15, 23, 30, 37, 44, 51,
-	58, 59, 52, 45, 38, 31, 39, 46,
-	53, 60, 61, 54, 47, 55, 62, 63
-};
-
 static const u32 hw_reorder[] = {
 	 0,  8, 16, 24,  1,  9, 17, 25,
 	32, 40, 48, 56, 33, 41, 49, 57,
@@ -71,73 +36,6 @@ static const u32 hw_reorder[] = {
 	38, 46, 54, 62, 39, 47, 55, 63
 };
 
-/* Huffman tables are shared with CODA */
-static const unsigned char luma_dc_table[] = {
-	0x00, 0x01, 0x05, 0x01, 0x01, 0x01, 0x01, 0x01,
-	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
-	0x08, 0x09, 0x0a, 0x0b,
-};
-
-static const unsigned char chroma_dc_table[] = {
-	0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
-	0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
-	0x08, 0x09, 0x0a, 0x0b,
-};
-
-static const unsigned char luma_ac_table[] = {
-	0x00, 0x02, 0x01, 0x03, 0x03, 0x02, 0x04, 0x03,
-	0x05, 0x05, 0x04, 0x04, 0x00, 0x00, 0x01, 0x7d,
-	0x01, 0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12,
-	0x21, 0x31, 0x41, 0x06, 0x13, 0x51, 0x61, 0x07,
-	0x22, 0x71, 0x14, 0x32, 0x81, 0x91, 0xa1, 0x08,
-	0x23, 0x42, 0xb1, 0xc1, 0x15, 0x52, 0xd1, 0xf0,
-	0x24, 0x33, 0x62, 0x72, 0x82, 0x09, 0x0a, 0x16,
-	0x17, 0x18, 0x19, 0x1a, 0x25, 0x26, 0x27, 0x28,
-	0x29, 0x2a, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
-	0x3a, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49,
-	0x4a, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59,
-	0x5a, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69,
-	0x6a, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79,
-	0x7a, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89,
-	0x8a, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98,
-	0x99, 0x9a, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7,
-	0xa8, 0xa9, 0xaa, 0xb2, 0xb3, 0xb4, 0xb5, 0xb6,
-	0xb7, 0xb8, 0xb9, 0xba, 0xc2, 0xc3, 0xc4, 0xc5,
-	0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xd2, 0xd3, 0xd4,
-	0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda, 0xe1, 0xe2,
-	0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xea,
-	0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8,
-	0xf9, 0xfa,
-};
-
-static const unsigned char chroma_ac_table[] = {
-	0x00, 0x02, 0x01, 0x02, 0x04, 0x04, 0x03, 0x04,
-	0x07, 0x05, 0x04, 0x04, 0x00, 0x01, 0x02, 0x77,
-	0x00, 0x01, 0x02, 0x03, 0x11, 0x04, 0x05, 0x21,
-	0x31, 0x06, 0x12, 0x41, 0x51, 0x07, 0x61, 0x71,
-	0x13, 0x22, 0x32, 0x81, 0x08, 0x14, 0x42, 0x91,
-	0xa1, 0xb1, 0xc1, 0x09, 0x23, 0x33, 0x52, 0xf0,
-	0x15, 0x62, 0x72, 0xd1, 0x0a, 0x16, 0x24, 0x34,
-	0xe1, 0x25, 0xf1, 0x17, 0x18, 0x19, 0x1a, 0x26,
-	0x27, 0x28, 0x29, 0x2a, 0x35, 0x36, 0x37, 0x38,
-	0x39, 0x3a, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48,
-	0x49, 0x4a, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58,
-	0x59, 0x5a, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68,
-	0x69, 0x6a, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78,
-	0x79, 0x7a, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87,
-	0x88, 0x89, 0x8a, 0x92, 0x93, 0x94, 0x95, 0x96,
-	0x97, 0x98, 0x99, 0x9a, 0xa2, 0xa3, 0xa4, 0xa5,
-	0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xb2, 0xb3, 0xb4,
-	0xb5, 0xb6, 0xb7, 0xb8, 0xb9, 0xba, 0xc2, 0xc3,
-	0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xd2,
-	0xd3, 0xd4, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda,
-	0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9,
-	0xea, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8,
-	0xf9, 0xfa,
-};
-
 /* For simplicity, we keep a pre-formatted JPEG header,
  * and we'll use fixed offsets to change the width, height
  * quantization tables, etc.
@@ -291,10 +189,11 @@ jpeg_scale_quant_table(unsigned char *file_q_tab,
 		       const unsigned char *tab, int scale)
 {
 	int i;
+	const u8 *zigzag;
 
-	BUILD_BUG_ON(ARRAY_SIZE(zigzag) != JPEG_QUANT_SIZE);
 	BUILD_BUG_ON(ARRAY_SIZE(hw_reorder) != JPEG_QUANT_SIZE);
 
+	v4l2_jpeg_get_zig_zag_scan(&zigzag);
 	for (i = 0; i < JPEG_QUANT_SIZE; i++) {
 		file_q_tab[i] = jpeg_scale_qp(tab[zigzag[i]], scale);
 		reordered_q_tab[i] = jpeg_scale_qp(tab[hw_reorder[i]], scale);
@@ -304,6 +203,7 @@ jpeg_scale_quant_table(unsigned char *file_q_tab,
 static void jpeg_set_quality(struct hantro_jpeg_ctx *ctx)
 {
 	int scale;
+	const u8 *luma_q_table, *chroma_q_table;
 
 	/*
 	 * Non-linear scaling factor:
@@ -314,21 +214,23 @@ static void jpeg_set_quality(struct hantro_jpeg_ctx *ctx)
 	else
 		scale = 200 - 2 * ctx->quality;
 
-	BUILD_BUG_ON(ARRAY_SIZE(luma_q_table) != JPEG_QUANT_SIZE);
-	BUILD_BUG_ON(ARRAY_SIZE(chroma_q_table) != JPEG_QUANT_SIZE);
 	BUILD_BUG_ON(ARRAY_SIZE(ctx->hw_luma_qtable) != JPEG_QUANT_SIZE);
 	BUILD_BUG_ON(ARRAY_SIZE(ctx->hw_chroma_qtable) != JPEG_QUANT_SIZE);
 
+	v4l2_jpeg_get_reference_quantization_tables(&luma_q_table, &chroma_q_table);
 	jpeg_scale_quant_table(ctx->buffer + LUMA_QUANT_OFF,
-			       ctx->hw_luma_qtable, luma_q_table, scale);
+			       ctx->hw_luma_qtable, (const unsigned char *)luma_q_table, scale);
 	jpeg_scale_quant_table(ctx->buffer + CHROMA_QUANT_OFF,
-			       ctx->hw_chroma_qtable, chroma_q_table, scale);
+			       ctx->hw_chroma_qtable, (const unsigned char *)chroma_q_table, scale);
 }
 
 void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx)
 {
 	char *buf = ctx->buffer;
+	const u8 *luma_dc_table, *chroma_dc_table, *luma_ac_table, *chroma_ac_table;
 
+	v4l2_jpeg_get_reference_huffman_tables(&luma_dc_table,  &luma_ac_table, &chroma_dc_table,
+					       &chroma_ac_table);
 	memcpy(buf, hantro_jpeg_header,
 	       sizeof(hantro_jpeg_header));
 
@@ -337,12 +239,10 @@ void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx)
 	buf[WIDTH_OFF + 0] = ctx->width >> 8;
 	buf[WIDTH_OFF + 1] = ctx->width;
 
-	memcpy(buf + HUFF_LUMA_DC_OFF, luma_dc_table, sizeof(luma_dc_table));
-	memcpy(buf + HUFF_LUMA_AC_OFF, luma_ac_table, sizeof(luma_ac_table));
-	memcpy(buf + HUFF_CHROMA_DC_OFF, chroma_dc_table,
-	       sizeof(chroma_dc_table));
-	memcpy(buf + HUFF_CHROMA_AC_OFF, chroma_ac_table,
-	       sizeof(chroma_ac_table));
+	memcpy(buf + HUFF_LUMA_DC_OFF, luma_dc_table, V4L2_JPEG_REF_HT_DC_LEN);
+	memcpy(buf + HUFF_LUMA_AC_OFF, luma_ac_table, V4L2_JPEG_REF_HT_AC_LEN);
+	memcpy(buf + HUFF_CHROMA_DC_OFF, chroma_dc_table, V4L2_JPEG_REF_HT_DC_LEN);
+	memcpy(buf + HUFF_CHROMA_AC_OFF, chroma_ac_table, V4L2_JPEG_REF_HT_AC_LEN);
 
 	jpeg_set_quality(ctx);
 }
-- 
2.39.1


