Return-Path: <linux-media+bounces-11292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 756F58C1FCB
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C63F28123A
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25BB54663;
	Fri, 10 May 2024 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w9wINvQc"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9A614B95C;
	Fri, 10 May 2024 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715330059; cv=none; b=Y7NQy1XgPCGJKv1NOaPd61jRcVbGyWOrMNCzM1ZXFdjwGCiLvVTVozE0B05OPSv2nHBfRaVA5nGALbXaiPtqdJ/ryEKZhFIQKrwL/GB2/sbJkslWl7oBfo8H9eEg0EdGhPT4gwsiuvZd1SVzeDiaTp9tj1XyLevdOtwmjsxeOg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715330059; c=relaxed/simple;
	bh=ZFeQsXD3cXY3X4TT2LdQqzvsRsn2reNYqY/btTlyx7U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G4NsfFlZ9ftD4rs8kCUyLv8th8w8IuITdbF9oP2nEAZ/q2UaMHtkhpjbNU//MwAr9vFJg8duSNLM3fBy7hZUMheSOeY+VIkM/lRlmX5yUJHBIl72P3GOnSugNY/jJNFDsRQ+hs7MoKSGDmC3mfjnvL5NjONsxvbp3NyXyv5SzcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=w9wINvQc; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44A8Y9N4017100;
	Fri, 10 May 2024 03:34:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715330049;
	bh=hDUtyNpyeEQv8blQHL1v7Xwp7609//ajKP8SVjT52QE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=w9wINvQcyxQyiU3pl9IIOJqBQ4zDtz3Unuq7E9YkIQSO5fGxcnfQUUAPePcQUp8As
	 +JXuLwfx/rrExoFQj17yUdv63er1IgSGkxa+P2AFNxKQ+EoJThKM0QGSMLXPL4u1xi
	 7F1j4sn88UQvK8wgKQYjJjGdw+rpR2yz+XiiaQik=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44A8Y9Sh059594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 May 2024 03:34:09 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 May 2024 03:34:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 May 2024 03:34:09 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44A8Y8bS074261;
	Fri, 10 May 2024 03:34:09 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>
Subject: [PATCH RESEND v7 3/8] media: v4l2-jpeg: Export reference quantization and huffman tables
Date: Fri, 10 May 2024 14:04:07 +0530
Message-ID: <20240510083407.1276705-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240510082603.1263256-1>
References: <20240510082603.1263256-1>
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
V1->V6: No change (Patch introduced in V7)
---
 drivers/media/v4l2-core/v4l2-jpeg.c | 162 +++++++++++++++++++++++++++-
 include/media/v4l2-jpeg.h           |  11 ++
 2 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 94435a7b6816..b21a78142710 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -16,7 +16,7 @@
 #include <linux/types.h>
 #include <media/v4l2-jpeg.h>
 
-MODULE_DESCRIPTION("V4L2 JPEG header parser helpers");
+MODULE_DESCRIPTION("V4L2 JPEG helpers");
 MODULE_AUTHOR("Philipp Zabel <kernel@pengutronix.de>");
 MODULE_LICENSE("GPL");
 
@@ -52,6 +52,115 @@ MODULE_LICENSE("GPL");
 #define COM	0xfffe	/* comment */
 #define TEM	0xff01	/* temporary */
 
+/* Luma and chroma qp tables to achieve 50% compression quality
+ * This is as per example in Annex K.1 of ITU-T.81
+ */
+const u8 luma_qt[] = {
+	16, 11, 10, 16, 24, 40, 51, 61,
+	12, 12, 14, 19, 26, 58, 60, 55,
+	14, 13, 16, 24, 40, 57, 69, 56,
+	14, 17, 22, 29, 51, 87, 80, 62,
+	18, 22, 37, 56, 68, 109, 103, 77,
+	24, 35, 55, 64, 81, 104, 113, 92,
+	49, 64, 78, 87, 103, 121, 120, 101,
+	72, 92, 95, 98, 112, 100, 103, 99
+};
+
+const u8 chroma_qt[] = {
+	17, 18, 24, 47, 99, 99, 99, 99,
+	18, 21, 26, 66, 99, 99, 99, 99,
+	24, 26, 56, 99, 99, 99, 99, 99,
+	47, 66, 99, 99, 99, 99, 99, 99,
+	99, 99, 99, 99, 99, 99, 99, 99,
+	99, 99, 99, 99, 99, 99, 99, 99,
+	99, 99, 99, 99, 99, 99, 99, 99,
+	99, 99, 99, 99, 99, 99, 99, 99
+};
+
+/* Zigzag scan pattern */
+const u8 zigzag[] = {
+	0,   1,  8, 16,  9,  2,  3, 10,
+	17, 24, 32, 25, 18, 11,  4,  5,
+	12, 19, 26, 33, 40, 48, 41, 34,
+	27, 20, 13,  6,  7, 14, 21, 28,
+	35, 42, 49, 56, 57, 50, 43, 36,
+	29, 22, 15, 23, 30, 37, 44, 51,
+	58, 59, 52, 45, 38, 31, 39, 46,
+	53, 60, 61, 54, 47, 55, 62, 63
+};
+
+/*
+ * Contains the data that needs to be sent in the marker segment of an
+ * interchange format JPEG stream or an abbreviated format table specification
+ * data stream. Specifies the huffman table used for encoding the luminance DC
+ * coefficient differences. The table represents Table K.3 of ITU-T.81
+ */
+const u8 luma_dc_ht[] = {
+	0x00, 0x01, 0x05, 0x01, 0x01, 0x01, 0x01, 0x01,
+	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
+};
+
+/*
+ * Contains the data that needs to be sent in the marker segment of an
+ * interchange format JPEG stream or an abbreviated format table specification
+ * data stream. Specifies the huffman table used for encoding the luminance AC
+ * coefficients. The table represents Table K.5 of ITU-T.81
+ */
+const u8 luma_ac_ht[] = {
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
+
+/*
+ * Contains the data that needs to be sent in the marker segment of an interchange format JPEG
+ * stream or an abbreviated format table specification data stream.
+ * Specifies the huffman table used for encoding the chrominance DC coefficient differences.
+ * The table represents Table K.4 of ITU-T.81
+ */
+const u8 chroma_dc_ht[] = {
+	0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+	0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
+};
+
+/*
+ * Contains the data that needs to be sent in the marker segment of an
+ * interchange format JPEG stream or an abbreviated format table specification
+ * data stream. Specifies the huffman table used for encoding the chrominance
+ * AC coefficients. The table represents Table K.6 of ITU-T.81
+ */
+const u8 chroma_ac_ht[] = {
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
+
 /**
  * struct jpeg_stream - JPEG byte stream
  * @curr: current position in stream
@@ -675,3 +784,54 @@ int v4l2_jpeg_parse_huffman_tables(void *buf, size_t len,
 	return jpeg_parse_huffman_tables(&stream, huffman_tables);
 }
 EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_huffman_tables);
+
+/**
+ * v4l2_jpeg_get_reference_quantization_tables - Get reference quantization
+ *						 tables as defined in ITU-T.81
+ * @*ref_luma_qt: Output variable pointing to luma quantization table
+ * @*ref_chroma_qt: Output variable pointint to chroma quantization table
+ */
+void v4l2_jpeg_get_reference_quantization_tables(const u8 **ref_luma_qt, const
+						 u8 **ref_chroma_qt)
+{
+	if (ref_luma_qt)
+		*ref_luma_qt = luma_qt;
+	if (ref_chroma_qt)
+		*ref_chroma_qt = chroma_qt;
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_get_reference_quantization_tables);
+
+/**
+ * v4l2_jpeg_get_zig_zag_scan - Get zigzag scan table as defined in ITU-T.81
+ * @*ref_zigzag: Output variable pointing to zigzag scan table
+ */
+void v4l2_jpeg_get_zig_zag_scan(const u8 **ref_zigzag)
+{
+	if (ref_zigzag)
+		*ref_zigzag = zigzag;
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_get_zig_zag_scan);
+
+/**
+ * v4l2_jpeg_get_reference_huffman_tables - Get reference huffman tables as
+ *					    defined in ITU-T.81
+ * @*ref_luma_dc_ht : Output variable pointing to huffman table for luma DC
+ * @*ref_luma_ac_ht : Output variable pointing to huffman table for luma AC
+ * @*ref_chroma_dc_ht : Output variable pointing to huffman table for chroma DC
+ * @*ref_chroma_ac_ht : Output variable pointing to huffman table for chroma AC
+ */
+void v4l2_jpeg_get_reference_huffman_tables(const u8 **ref_luma_dc_ht,
+					    const u8 **ref_luma_ac_ht,
+					    const u8 **ref_chroma_dc_ht,
+					    const u8 **ref_chroma_ac_ht)
+{
+	if (ref_luma_dc_ht)
+		*ref_luma_dc_ht = luma_dc_ht;
+	if (ref_luma_ac_ht)
+		*ref_luma_ac_ht = luma_ac_ht;
+	if (ref_chroma_dc_ht)
+		*ref_chroma_dc_ht = chroma_dc_ht;
+	if (ref_chroma_ac_ht)
+		*ref_chroma_ac_ht = chroma_ac_ht;
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_get_reference_huffman_tables);
diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
index 2dba843ce3bd..7cc9a9febcd4 100644
--- a/include/media/v4l2-jpeg.h
+++ b/include/media/v4l2-jpeg.h
@@ -14,6 +14,13 @@
 
 #define V4L2_JPEG_MAX_COMPONENTS	4
 #define V4L2_JPEG_MAX_TABLES		4
+#define V4L2_JPEG_LUM_HT		0x00
+#define V4L2_JPEG_CHR_HT		0x01
+#define V4L2_JPEG_DC_HT			0x00
+#define V4L2_JPEG_AC_HT			0x10
+#define V4L2_JPEG_REF_HT_AC_LEN		178
+#define V4L2_JPEG_REF_HT_DC_LEN		28
+#define V4L2_JPEG_PIXELS_IN_BLOCK	64
 
 /**
  * struct v4l2_jpeg_reference - reference into the JPEG buffer
@@ -154,4 +161,8 @@ int v4l2_jpeg_parse_quantization_tables(void *buf, size_t len, u8 precision,
 int v4l2_jpeg_parse_huffman_tables(void *buf, size_t len,
 				   struct v4l2_jpeg_reference *huffman_tables);
 
+void v4l2_jpeg_get_reference_quantization_tables(const u8 **luma_qt, const u8 **chroma_qt);
+void v4l2_jpeg_get_zig_zag_scan(const u8 **zigzag);
+void v4l2_jpeg_get_reference_huffman_tables(const u8 **luma_dc_ht, const u8 **luma_ac_ht,
+					    const u8 **chroma_dc_ht, const u8 **chroma_ac_ht);
 #endif
-- 
2.39.1


