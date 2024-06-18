Return-Path: <linux-media+bounces-13603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECF190DC8E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 21:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 881231C21C6B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 19:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A0F16EB42;
	Tue, 18 Jun 2024 19:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="T6sLVMYD"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E873716CD27;
	Tue, 18 Jun 2024 19:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718739429; cv=none; b=AgCl7YHIjutxxmApSubLX9FwT/w9n55Wa6U0wfjn3uPRYC3GK2ig50sQKhK7dSNWzhnd/J93kuq+bUdeeOuwmK+Q+0TVFXCMBWqTmMEgc+/yIXLFhj8/DNFIMrP8IHWt5+EvrU3yJ7+pujbz7Jlj8WxIxDUoP/8lRzHXTQmDKME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718739429; c=relaxed/simple;
	bh=kxmJJMLmjMfAc+Dm4jpHpaR5Kf/q8h4d0sJlkGsBy80=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=keapd8Ht+VqA7sTOowm5JTgMBvV9AhuobXlEEjD6meN2n/EFqouGzoTRPZTzDbCotCtsv6LHBlsyZkR+PTz2l/b05DFYHnVLWoMAYZHK7O+dCCondqzw27G7l8bXtlnZ+/sOvNKX6xWTq3ngsco0Bo/987PivkZYJkFrOnkX21A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=T6sLVMYD; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45IJav5s121237;
	Tue, 18 Jun 2024 14:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718739417;
	bh=fXJVcIZm1989yhvZoUOuVoXLMafbOIVb6DTXKhtn04w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=T6sLVMYDnTTPcahL/jrsY7TSzAqWu8gYNqVNBCUUMOLQTY4GVitqg40CzgKSrHGHO
	 +l06DJhgfxJHUp/RjkZVcuhxDTW7UG3XbWPFiylmZnzkC99ndx6jRNwg8BTT5qilHy
	 0Xajyrn72fL7SHb5Jfe8HtT/NpOuyk/OnE+82jHM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45IJavOZ116609
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2024 14:36:57 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 14:36:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 14:36:57 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45IJauiK010535;
	Tue, 18 Jun 2024 14:36:57 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <afd@ti.com>
Subject: [PATCH v14 3/6] media: v4l2-jpeg: Export reference quantization and huffman tables
Date: Wed, 19 Jun 2024 01:06:48 +0530
Message-ID: <20240618193651.2771478-4-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240618193651.2771478-1-devarsht@ti.com>
References: <20240618193651.2771478-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Export reference quantization and huffman tables as provided in ITU-T.81 so
that they can be re-used by other JPEG drivers.

These are example tables provided in ITU-T.81 as reference tables and the
JPEG encoders are free to use either these or their own proprietary tables.

Also add necessary prefixes to be used for huffman tables in global header
file.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V14:
- Directly export jpeg tables and declare them as extern variables
  instead of using helper functions.

V13: 
- Fix smatch/sparse related below warning by using static global
variable for arrays:
Logs:
+drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'luma_qt' was not
declared. Should it be static?
+drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'chroma_qt' was
not declared. Should it be static?
+drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'zigzag' was not
declared. Should it be static?
+drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'luma_dc_ht' was
not declared. Should it be static?
+drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'luma_ac_ht' was
not declared. Should it be static?
+drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'chroma_dc_ht' was
not declared. Should it be static?
+drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'chroma_ac_ht' was
not declared. Should it be static?"

V12: Fix html-doc warnings by removing * from args
V11: No change
V10: Add description for new macros introduced in this patchset
V1->V9: No change (Patch introduced in V7)

 drivers/media/v4l2-core/v4l2-jpeg.c | 116 ++++++++++++++++++++++++++++
 include/media/v4l2-jpeg.h           |  32 ++++++++
 2 files changed, 148 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 94435a7b6816..b8bece739d07 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -52,6 +52,122 @@ MODULE_LICENSE("GPL");
 #define COM	0xfffe	/* comment */
 #define TEM	0xff01	/* temporary */
 
+/* Luma and chroma qp tables to achieve 50% compression quality
+ * This is as per example in Annex K.1 of ITU-T.81
+ */
+const u8 v4l2_jpeg_ref_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK] = {
+	16, 11, 10, 16, 24, 40, 51, 61,
+	12, 12, 14, 19, 26, 58, 60, 55,
+	14, 13, 16, 24, 40, 57, 69, 56,
+	14, 17, 22, 29, 51, 87, 80, 62,
+	18, 22, 37, 56, 68, 109, 103, 77,
+	24, 35, 55, 64, 81, 104, 113, 92,
+	49, 64, 78, 87, 103, 121, 120, 101,
+	72, 92, 95, 98, 112, 100, 103, 99
+};
+EXPORT_SYMBOL_GPL(v4l2_jpeg_ref_table_luma_qt);
+
+const u8 v4l2_jpeg_ref_table_chroma_qt[V4L2_JPEG_PIXELS_IN_BLOCK] = {
+	17, 18, 24, 47, 99, 99, 99, 99,
+	18, 21, 26, 66, 99, 99, 99, 99,
+	24, 26, 56, 99, 99, 99, 99, 99,
+	47, 66, 99, 99, 99, 99, 99, 99,
+	99, 99, 99, 99, 99, 99, 99, 99,
+	99, 99, 99, 99, 99, 99, 99, 99,
+	99, 99, 99, 99, 99, 99, 99, 99,
+	99, 99, 99, 99, 99, 99, 99, 99
+};
+EXPORT_SYMBOL_GPL(v4l2_jpeg_ref_table_chroma_qt);
+
+/* Zigzag scan pattern indexes */
+const u8 v4l2_jpeg_zigzag_scan_index[V4L2_JPEG_PIXELS_IN_BLOCK] = {
+	0,   1,  8, 16,  9,  2,  3, 10,
+	17, 24, 32, 25, 18, 11,  4,  5,
+	12, 19, 26, 33, 40, 48, 41, 34,
+	27, 20, 13,  6,  7, 14, 21, 28,
+	35, 42, 49, 56, 57, 50, 43, 36,
+	29, 22, 15, 23, 30, 37, 44, 51,
+	58, 59, 52, 45, 38, 31, 39, 46,
+	53, 60, 61, 54, 47, 55, 62, 63
+};
+EXPORT_SYMBOL_GPL(v4l2_jpeg_zigzag_scan_index);
+
+/*
+ * Contains the data that needs to be sent in the marker segment of an
+ * interchange format JPEG stream or an abbreviated format table specification
+ * data stream. Specifies the huffman table used for encoding the luminance DC
+ * coefficient differences. The table represents Table K.3 of ITU-T.81
+ */
+const u8 v4l2_jpeg_ref_table_luma_dc_ht[V4L2_JPEG_REF_HT_DC_LEN] = {
+	0x00, 0x01, 0x05, 0x01, 0x01, 0x01, 0x01, 0x01,
+	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
+};
+EXPORT_SYMBOL_GPL(v4l2_jpeg_ref_table_luma_dc_ht);
+
+/*
+ * Contains the data that needs to be sent in the marker segment of an
+ * interchange format JPEG stream or an abbreviated format table specification
+ * data stream. Specifies the huffman table used for encoding the luminance AC
+ * coefficients. The table represents Table K.5 of ITU-T.81
+ */
+const u8 v4l2_jpeg_ref_table_luma_ac_ht[V4L2_JPEG_REF_HT_AC_LEN] = {
+	0x00, 0x02, 0x01, 0x03, 0x03, 0x02, 0x04, 0x03, 0x05, 0x05, 0x04, 0x04,
+	0x00, 0x00, 0x01, 0x7D, 0x01, 0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12,
+	0x21, 0x31, 0x41, 0x06, 0x13, 0x51, 0x61, 0x07, 0x22, 0x71, 0x14, 0x32,
+	0x81, 0x91, 0xA1, 0x08, 0x23, 0x42, 0xB1, 0xC1, 0x15, 0x52, 0xD1, 0xF0,
+	0x24, 0x33, 0x62, 0x72, 0x82, 0x09, 0x0A, 0x16, 0x17, 0x18, 0x19, 0x1A,
+	0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
+	0x3A, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x53, 0x54, 0x55,
+	0x56, 0x57, 0x58, 0x59, 0x5A, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69,
+	0x6A, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A, 0x83, 0x84, 0x85,
+	0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98,
+	0x99, 0x9A, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8, 0xA9, 0xAA, 0xB2,
+	0xB3, 0xB4, 0xB5, 0xB6, 0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3, 0xC4, 0xC5,
+	0xC6, 0xC7, 0xC8, 0xC9, 0xCA, 0xD2, 0xD3, 0xD4, 0xD5, 0xD6, 0xD7, 0xD8,
+	0xD9, 0xDA, 0xE1, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0xE8, 0xE9, 0xEA,
+	0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0xF7, 0xF8, 0xF9, 0xFA
+};
+EXPORT_SYMBOL_GPL(v4l2_jpeg_ref_table_luma_ac_ht);
+
+/*
+ * Contains the data that needs to be sent in the marker segment of an interchange format JPEG
+ * stream or an abbreviated format table specification data stream.
+ * Specifies the huffman table used for encoding the chrominance DC coefficient differences.
+ * The table represents Table K.4 of ITU-T.81
+ */
+const u8 v4l2_jpeg_ref_table_chroma_dc_ht[V4L2_JPEG_REF_HT_DC_LEN] = {
+	0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+	0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
+};
+EXPORT_SYMBOL_GPL(v4l2_jpeg_ref_table_chroma_dc_ht);
+
+/*
+ * Contains the data that needs to be sent in the marker segment of an
+ * interchange format JPEG stream or an abbreviated format table specification
+ * data stream. Specifies the huffman table used for encoding the chrominance
+ * AC coefficients. The table represents Table K.6 of ITU-T.81
+ */
+const u8 v4l2_jpeg_ref_table_chroma_ac_ht[V4L2_JPEG_REF_HT_AC_LEN] = {
+	0x00, 0x02, 0x01, 0x02, 0x04, 0x04, 0x03, 0x04, 0x07, 0x05, 0x04, 0x04,
+	0x00, 0x01, 0x02, 0x77, 0x00, 0x01, 0x02, 0x03, 0x11, 0x04, 0x05, 0x21,
+	0x31, 0x06, 0x12, 0x41, 0x51, 0x07, 0x61, 0x71, 0x13, 0x22, 0x32, 0x81,
+	0x08, 0x14, 0x42, 0x91, 0xA1, 0xB1, 0xC1, 0x09, 0x23, 0x33, 0x52, 0xF0,
+	0x15, 0x62, 0x72, 0xD1, 0x0A, 0x16, 0x24, 0x34, 0xE1, 0x25, 0xF1, 0x17,
+	0x18, 0x19, 0x1A, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x35, 0x36, 0x37, 0x38,
+	0x39, 0x3A, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x53, 0x54,
+	0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68,
+	0x69, 0x6A, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A, 0x82, 0x83,
+	0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93, 0x94, 0x95, 0x96,
+	0x97, 0x98, 0x99, 0x9A, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8, 0xA9,
+	0xAA, 0xB2, 0xB3, 0xB4, 0xB5, 0xB6, 0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3,
+	0xC4, 0xC5, 0xC6, 0xC7, 0xC8, 0xC9, 0xCA, 0xD2, 0xD3, 0xD4, 0xD5, 0xD6,
+	0xD7, 0xD8, 0xD9, 0xDA, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0xE8, 0xE9,
+	0xEA, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0xF7, 0xF8, 0xF9, 0xFA
+};
+EXPORT_SYMBOL_GPL(v4l2_jpeg_ref_table_chroma_ac_ht);
+
 /**
  * struct jpeg_stream - JPEG byte stream
  * @curr: current position in stream
diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
index 2dba843ce3bd..b65658a02e3c 100644
--- a/include/media/v4l2-jpeg.h
+++ b/include/media/v4l2-jpeg.h
@@ -14,6 +14,30 @@
 
 #define V4L2_JPEG_MAX_COMPONENTS	4
 #define V4L2_JPEG_MAX_TABLES		4
+/*
+ * Prefixes used to generate huffman table class and destination identifiers as
+ * described below:
+ *
+ * V4L2_JPEG_LUM_HT | V4L2_JPEG_DC_HT : Prefix for Luma DC coefficients
+ *					huffman table
+ * V4L2_JPEG_LUM_HT | V4L2_JPEG_AC_HT : Prefix for Luma AC coefficients
+ *					huffman table
+ * V4L2_JPEG_CHR_HT | V4L2_JPEG_DC_HT : Prefix for Chroma DC coefficients
+ *					huffman table
+ * V4L2_JPEG_CHR_HT | V4L2_JPEG_AC_HT : Prefix for Chroma AC coefficients
+ *					huffman table
+ */
+#define V4L2_JPEG_LUM_HT		0x00
+#define V4L2_JPEG_CHR_HT		0x01
+#define V4L2_JPEG_DC_HT			0x00
+#define V4L2_JPEG_AC_HT			0x10
+
+/* Length of reference huffman tables as provided in Table K.3 of ITU-T.81 */
+#define V4L2_JPEG_REF_HT_AC_LEN		178
+#define V4L2_JPEG_REF_HT_DC_LEN		28
+
+/* Array size for 8x8 block of samples or DCT coefficient */
+#define V4L2_JPEG_PIXELS_IN_BLOCK	64
 
 /**
  * struct v4l2_jpeg_reference - reference into the JPEG buffer
@@ -154,4 +178,12 @@ int v4l2_jpeg_parse_quantization_tables(void *buf, size_t len, u8 precision,
 int v4l2_jpeg_parse_huffman_tables(void *buf, size_t len,
 				   struct v4l2_jpeg_reference *huffman_tables);
 
+extern const u8 v4l2_jpeg_zigzag_scan_index[V4L2_JPEG_PIXELS_IN_BLOCK];
+extern const u8 v4l2_jpeg_ref_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
+extern const u8 v4l2_jpeg_ref_table_chroma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
+extern const u8 v4l2_jpeg_ref_table_luma_dc_ht[V4L2_JPEG_REF_HT_DC_LEN];
+extern const u8 v4l2_jpeg_ref_table_luma_ac_ht[V4L2_JPEG_REF_HT_AC_LEN];
+extern const u8 v4l2_jpeg_ref_table_chroma_dc_ht[V4L2_JPEG_REF_HT_DC_LEN];
+extern const u8 v4l2_jpeg_ref_table_chroma_ac_ht[V4L2_JPEG_REF_HT_AC_LEN];
+
 #endif
-- 
2.39.1


