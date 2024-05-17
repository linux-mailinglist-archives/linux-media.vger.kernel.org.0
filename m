Return-Path: <linux-media+bounces-11610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB38C8B08
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 19:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 599C21F214BA
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 17:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFF813DDB5;
	Fri, 17 May 2024 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iOjppWaX"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D354F12FB3E;
	Fri, 17 May 2024 17:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715967181; cv=none; b=Za1Bjm97GD7ACPtwlorQAdQ9ei1uR6dqDvz4TLtu0hiBTbU7GU+/YuBEX0Qz5ugZyiXilFDlL8MwwZBcN5VsD+31CQHWpmoRCPFTQFyGMX+Sv+1u93UQ+6NSMjdka/mFaSGXYUN2VqAJlASjdLheX2Yt3nvaj/GXip/X/vj2iwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715967181; c=relaxed/simple;
	bh=GDe9PitpT05WJh92bFr9Sw3a4IG+ZwuqbBamK9bxCeY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZGqR2uqgCbVwo+mnUD6kDgZWmt+Pqezwo4hHpHZbiJHlcC0AwMbNegYJWcM32Ke1RN4QZuXPsU6dboEjiUjWJXnolCSeCWUTgRa7qjpp/vl+e1p+tmXXXiZ5Na85J8sIw/f1UlmnjKRGt27oo0Svg3NoLe+CK1lfE+HqY9XFcMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iOjppWaX; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44HHWgkf008402;
	Fri, 17 May 2024 12:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715967162;
	bh=GWnYv9UiVnj19rMD8OX/155e+U//sXC+1BZnk6mVzGE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iOjppWaXFSBW0QhtnGfdimUziufzbDCP/aGHCAkJSM4upNXuQHyfJyCv+Xxq43dPq
	 Nw2TFXytlayU4JyZXcWdMpQrvC7u1Z67MdyKShpIoj9q/qPDFdK23OJAF9yd9HO0en
	 ulNuF+lve3r9m+9AdVTmPJ+gmxP5Fuv4gHwVpp8o=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44HHWgI8023614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 May 2024 12:32:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 May 2024 12:32:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 May 2024 12:32:41 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44HHWftn126984;
	Fri, 17 May 2024 12:32:41 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <ezequiel@vanguardiasur.com.ar>,
        <p.zabel@pengutronix.de>, <linux-rockchip@lists.infradead.org>
Subject: [PATCH v8 04/10] media: imagination: Use exported tables from v4l2-jpeg core
Date: Fri, 17 May 2024 23:02:40 +0530
Message-ID: <20240517173240.791719-1-devarsht@ti.com>
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

Use exported huffman and quantization tables from v4l2-jpeg core library.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V1->V8 (No change, patch introduced in V7)
---
 .../platform/imagination/e5010-jpeg-enc.c     | 140 +++---------------
 1 file changed, 19 insertions(+), 121 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 5606d9c90d80..189e2a99c43d 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -32,116 +32,6 @@
 #include "e5010-jpeg-enc.h"
 #include "e5010-jpeg-enc-hw.h"
 
-/* Luma and chroma qp table to achieve 50% compression quality
- * This is as per example in Annex K.1 of ITU-T.81
- */
-static const u8 luma_q_table[64] = {
-	16, 11, 10, 16, 24, 40, 51, 61,
-	12, 12, 14, 19, 26, 58, 60, 55,
-	14, 13, 16, 24, 40, 57, 69, 56,
-	14, 17, 22, 29, 51, 87, 80, 62,
-	18, 22, 37, 56, 68, 109, 103, 77,
-	24, 35, 55, 64, 81, 104, 113, 92,
-	49, 64, 78, 87, 103, 121, 120, 101,
-	72, 92, 95, 98, 112, 100, 103, 99
-};
-
-static const u8 chroma_q_table[64] = {
-	17, 18, 24, 47, 99, 99, 99, 99,
-	18, 21, 26, 66, 99, 99, 99, 99,
-	24, 26, 56, 99, 99, 99, 99, 99,
-	47, 66, 99, 99, 99, 99, 99, 99,
-	99, 99, 99, 99, 99, 99, 99, 99,
-	99, 99, 99, 99, 99, 99, 99, 99,
-	99, 99, 99, 99, 99, 99, 99, 99,
-	99, 99, 99, 99, 99, 99, 99, 99
-};
-
-/* Zigzag scan pattern */
-static const u8 zigzag[64] = {
-	0,   1,  8, 16,  9,  2,  3, 10,
-	17, 24, 32, 25, 18, 11,  4,  5,
-	12, 19, 26, 33, 40, 48, 41, 34,
-	27, 20, 13,  6,  7, 14, 21, 28,
-	35, 42, 49, 56, 57, 50, 43, 36,
-	29, 22, 15, 23, 30, 37, 44, 51,
-	58, 59, 52, 45, 38, 31, 39, 46,
-	53, 60, 61, 54, 47, 55, 62, 63
-};
-
-/*
- * Contains the data that needs to be sent in the marker segment of an interchange format JPEG
- * stream or an abbreviated format table specification data stream.
- * Specifies the huffman table used for encoding the luminance DC coefficient differences.
- * The table represents Table K.3 of ITU-T.81
- */
-static const u8 luma_dc_table[] = {
-	0x00, 0x01, 0x05, 0x01, 0x01, 0x01, 0x01, 0x01,
-	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
-};
-
-/*
- * Contains the data that needs to be sent in the marker segment of an interchange format JPEG
- * stream or an abbreviated format table specification data stream.
- * Specifies the huffman table used for encoding the luminance AC coefficients.
- * The table represents Table K.5 of ITU-T.81
- */
-static const u8 luma_ac_table[] = {
-	0x00, 0x02, 0x01, 0x03, 0x03, 0x02, 0x04, 0x03,
-	0x05, 0x05, 0x04, 0x04, 0x00, 0x00, 0x01, 0x7D,
-	0x01, 0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12, 0x21, 0x31, 0x41, 0x06, 0x13, 0x51, 0x61,
-	0x07, 0x22, 0x71, 0x14, 0x32, 0x81, 0x91, 0xA1, 0x08, 0x23, 0x42, 0xB1, 0xC1, 0x15, 0x52,
-	0xD1, 0xF0, 0x24, 0x33, 0x62, 0x72, 0x82, 0x09, 0x0A, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x25,
-	0x26, 0x27, 0x28, 0x29, 0x2A, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x43, 0x44, 0x45,
-	0x46, 0x47, 0x48, 0x49, 0x4A, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x63, 0x64,
-	0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A, 0x83,
-	0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98, 0x99,
-	0x9A, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8, 0xA9, 0xAA, 0xB2, 0xB3, 0xB4, 0xB5, 0xB6,
-	0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3, 0xC4, 0xC5, 0xC6, 0xC7, 0xC8, 0xC9, 0xCA, 0xD2, 0xD3,
-	0xD4, 0xD5, 0xD6, 0xD7, 0xD8, 0xD9, 0xDA, 0xE1, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0xE8,
-	0xE9, 0xEA, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0xF7, 0xF8, 0xF9, 0xFA
-};
-
-/*
- * Contains the data that needs to be sent in the marker segment of an interchange format JPEG
- * stream or an abbreviated format table specification data stream.
- * Specifies the huffman table used for encoding the chrominance DC coefficient differences.
- * The table represents Table K.4 of ITU-T.81
- */
-static const u8 chroma_dc_table[] = {
-	0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
-	0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
-};
-
-/*
- * Contains the data that needs to be sent in the marker segment of an interchange format JPEG
- * stream or an abbreviated format table specification data stream.
- * Specifies the huffman table used for encoding the chrominance AC coefficients.
- * The table represents Table K.6 of ITU-T.81
- */
-static const u8 chroma_ac_table[] = {
-	0x00, 0x02, 0x01, 0x02, 0x04, 0x04, 0x03, 0x04,
-	0x07, 0x05, 0x04, 0x04, 0x00, 0x01, 0x02, 0x77,
-	0x00, 0x01, 0x02, 0x03, 0x11, 0x04, 0x05, 0x21, 0x31, 0x06, 0x12, 0x41, 0x51, 0x07, 0x61,
-	0x71, 0x13, 0x22, 0x32, 0x81, 0x08, 0x14, 0x42, 0x91, 0xA1, 0xB1, 0xC1, 0x09, 0x23, 0x33,
-	0x52, 0xF0, 0x15, 0x62, 0x72, 0xD1, 0x0A, 0x16, 0x24, 0x34, 0xE1, 0x25, 0xF1, 0x17, 0x18,
-	0x19, 0x1A, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x43, 0x44,
-	0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x63,
-	0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A,
-	0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97,
-	0x98, 0x99, 0x9A, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8, 0xA9, 0xAA, 0xB2, 0xB3, 0xB4,
-	0xB5, 0xB6, 0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3, 0xC4, 0xC5, 0xC6, 0xC7, 0xC8, 0xC9, 0xCA,
-	0xD2, 0xD3, 0xD4, 0xD5, 0xD6, 0xD7, 0xD8, 0xD9, 0xDA, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7,
-	0xE8, 0xE9, 0xEA, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0xF7, 0xF8, 0xF9, 0xFA
-};
-
-#define JPEG_LUM_HT		0x00
-#define JPEG_CHR_HT		0x01
-#define JPEG_DC_HT		0x00
-#define JPEG_AC_HT		0x10
-
 /* forward declarations */
 static const struct of_device_id e5010_of_match[];
 
@@ -270,6 +160,9 @@ static void calculate_qp_tables(struct e5010_context *ctx)
 {
 	long long luminosity, contrast;
 	int quality, i;
+	const u8 *luma_q_table, *chroma_q_table;
+
+	v4l2_jpeg_get_reference_quantization_tables(&luma_q_table, &chroma_q_table);
 
 	quality = 50 - ctx->quality;
 
@@ -281,7 +174,7 @@ static void calculate_qp_tables(struct e5010_context *ctx)
 		contrast *= INCREASE;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(luma_q_table); i++) {
+	for (i = 0; i < V4L2_JPEG_PIXELS_IN_BLOCK; i++) {
 		long long delta = chroma_q_table[i] * contrast + luminosity;
 		int val = (int)(chroma_q_table[i] + delta);
 
@@ -927,41 +820,46 @@ static void encode_marker_segment(struct e5010_context *ctx, void *addr, unsigne
 {
 	u8 *buffer = (u8 *)addr;
 	int i;
+	const u8 *luma_dc_table, *chroma_dc_table, *luma_ac_table, *chroma_ac_table, *zigzag;
+
+	v4l2_jpeg_get_reference_huffman_tables(&luma_dc_table,  &luma_ac_table, &chroma_dc_table,
+					       &chroma_ac_table);
+	v4l2_jpeg_get_zig_zag_scan(&zigzag);
 
 	header_write(ctx, buffer, offset, 2, START_OF_IMAGE);
 	header_write(ctx, buffer, offset, 2, DQT_MARKER);
 	header_write(ctx, buffer, offset, 3, LQPQ << 4);
-	for (i = 0; i < PELS_IN_BLOCK; i++)
+	for (i = 0; i < V4L2_JPEG_PIXELS_IN_BLOCK; i++)
 		header_write(ctx, buffer, offset, 1, ctx->luma_qp[zigzag[i]]);
 
 	header_write(ctx, buffer, offset, 2, DQT_MARKER);
 	header_write(ctx, buffer, offset, 3, (LQPQ << 4) | 1);
-	for (i = 0; i < PELS_IN_BLOCK; i++)
+	for (i = 0; i < V4L2_JPEG_PIXELS_IN_BLOCK; i++)
 		header_write(ctx, buffer, offset, 1, ctx->chroma_qp[zigzag[i]]);
 
 	/* Huffman tables */
 	header_write(ctx, buffer, offset, 2, DHT_MARKER);
 	header_write(ctx, buffer, offset, 2, LH_DC);
-	header_write(ctx, buffer, offset, 1, JPEG_LUM_HT | JPEG_DC_HT);
-	for (i = 0 ; i < ARRAY_SIZE(luma_dc_table); i++)
+	header_write(ctx, buffer, offset, 1, V4L2_JPEG_LUM_HT | V4L2_JPEG_DC_HT);
+	for (i = 0 ; i < V4L2_JPEG_REF_HT_DC_LEN; i++)
 		header_write(ctx, buffer, offset, 1, luma_dc_table[i]);
 
 	header_write(ctx, buffer, offset, 2, DHT_MARKER);
 	header_write(ctx, buffer, offset, 2, LH_AC);
-	header_write(ctx, buffer, offset, 1, JPEG_LUM_HT | JPEG_AC_HT);
-	for (i = 0 ; i < ARRAY_SIZE(luma_ac_table); i++)
+	header_write(ctx, buffer, offset, 1, V4L2_JPEG_LUM_HT | V4L2_JPEG_AC_HT);
+	for (i = 0 ; i < V4L2_JPEG_REF_HT_AC_LEN; i++)
 		header_write(ctx, buffer, offset, 1, luma_ac_table[i]);
 
 	header_write(ctx, buffer, offset, 2, DHT_MARKER);
 	header_write(ctx, buffer, offset, 2, LH_DC);
-	header_write(ctx, buffer, offset, 1, JPEG_CHR_HT | JPEG_DC_HT);
-	for (i = 0 ; i < ARRAY_SIZE(chroma_dc_table); i++)
+	header_write(ctx, buffer, offset, 1, V4L2_JPEG_CHR_HT | V4L2_JPEG_DC_HT);
+	for (i = 0 ; i < V4L2_JPEG_REF_HT_DC_LEN; i++)
 		header_write(ctx, buffer, offset, 1, chroma_dc_table[i]);
 
 	header_write(ctx, buffer, offset, 2, DHT_MARKER);
 	header_write(ctx, buffer, offset, 2, LH_AC);
-	header_write(ctx, buffer, offset, 1, JPEG_CHR_HT | JPEG_AC_HT);
-	for (i = 0 ; i < ARRAY_SIZE(chroma_ac_table); i++)
+	header_write(ctx, buffer, offset, 1, V4L2_JPEG_CHR_HT | V4L2_JPEG_AC_HT);
+	for (i = 0 ; i < V4L2_JPEG_REF_HT_AC_LEN; i++)
 		header_write(ctx, buffer, offset, 1, chroma_ac_table[i]);
 }
 
-- 
2.39.1


