Return-Path: <linux-media+bounces-12736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5439004E6
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DB261C2481F
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC911974E3;
	Fri,  7 Jun 2024 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GuIyLith"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED7D1946C6;
	Fri,  7 Jun 2024 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717766921; cv=none; b=aY40gOlvb1avqJZhT17eSdWS1bmxWmMC3wcH4LOzNxFexAfHgVJMMi/fTsA/Z8TdmTU2t1gAtAx1adMaJjIzZEOtaE99mixHgLR9Kjz9TWyrCxHCX8F818U+UG8flu/Rg8nsw6BDUKmeEvq1O/3AW8C1/iw0yeSOlRX0DXncBuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717766921; c=relaxed/simple;
	bh=9YJDgD1sUF9wLiqDz96LWHNWgihyqNTKefm3EPo+PYg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ur8CeR6Qpi7OFhkGHjP0Axx20vqUApLjGRsyLqCk3jbqpAGEWvf8MPUMJOJtpDyIeDpgMZmNcgcUqjfyfH8T5Z6NcX4LJiqcnvortL8SCGCZL0LeApz3WK5Okzw2/LkdheUgTTKPB0n6sHarR1fyEa5wFy2mfLNL6gDHWNEGpHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GuIyLith; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457DSXkT089042;
	Fri, 7 Jun 2024 08:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717766913;
	bh=a2o0W9ZTFF+lA1Bhtoj/rJ7TGEn+u+N/UnDDrxbd6ck=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GuIyLithFAkqa9SUjr139gcXjCGvpm9z9DYpALlWRGFiCCpE6+komDIsOfqmVGQyk
	 TtY+Rlmf5hQymogKzDDfaQ0odpCjtj/V2BGapqFvib6lmvA6h5qZ1zNRrgg6EaB3cj
	 UvtWWjCUNsN7gm9/hI5GOMssSP72z/1Nrj5Vklnw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457DSX1S013748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jun 2024 08:28:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 08:28:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 08:28:33 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457DSWfN038953;
	Fri, 7 Jun 2024 08:28:32 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>
Subject: [PATCH v13 03/13] media: v4l2-jpeg: Export reference quantization and huffman tables
Date: Fri, 7 Jun 2024 18:58:31 +0530
Message-ID: <20240607132831.3551333-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240607131900.3535250-1-devarsht@ti.com>
References: <20240607131900.3535250-1-devarsht@ti.com>
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
V13: Fix smatch/sparse related below warning by using static global
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
 drivers/media/v4l2-core/v4l2-jpeg.c | 162 +++++++++++++++++++++++++++-
 include/media/v4l2-jpeg.h           |  28 +++++
 2 files changed, 189 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 94435a7b6816..bd6305c92e0e 100644
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
+static const u8 luma_qt[] = {
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
+static const u8 chroma_qt[] = {
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
+static const u8 zigzag[] = {
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
+static const u8 luma_dc_ht[] = {
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
+static const u8 luma_ac_ht[] = {
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
+static const u8 chroma_dc_ht[] = {
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
+static const u8 chroma_ac_ht[] = {
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
+ * @ref_luma_qt: Output variable pointing to luma quantization table
+ * @ref_chroma_qt: Output variable pointing to chroma quantization table
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
+ * @ref_zigzag: Output variable pointing to zigzag scan table
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
+ * @ref_luma_dc_ht : Output variable pointing to huffman table for luma DC
+ * @ref_luma_ac_ht : Output variable pointing to huffman table for luma AC
+ * @ref_chroma_dc_ht : Output variable pointing to huffman table for chroma DC
+ * @ref_chroma_ac_ht : Output variable pointing to huffman table for chroma AC
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
index 2dba843ce3bd..b470bbffb73f 100644
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
@@ -154,4 +178,8 @@ int v4l2_jpeg_parse_quantization_tables(void *buf, size_t len, u8 precision,
 int v4l2_jpeg_parse_huffman_tables(void *buf, size_t len,
 				   struct v4l2_jpeg_reference *huffman_tables);
 
+void v4l2_jpeg_get_reference_quantization_tables(const u8 **luma_qt, const u8 **chroma_qt);
+void v4l2_jpeg_get_zig_zag_scan(const u8 **zigzag);
+void v4l2_jpeg_get_reference_huffman_tables(const u8 **luma_dc_ht, const u8 **luma_ac_ht,
+					    const u8 **chroma_dc_ht, const u8 **chroma_ac_ht);
 #endif
-- 
2.39.1


