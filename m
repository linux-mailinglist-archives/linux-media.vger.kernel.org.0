Return-Path: <linux-media+bounces-34838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB5BADA4E5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 02:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58A2F188BA67
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 00:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFAB139D0A;
	Mon, 16 Jun 2025 00:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="WnpdHA+m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3AB7081E;
	Mon, 16 Jun 2025 00:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750033447; cv=none; b=btxA3yOTFowF397SgVuCXc8mwzNatEs7QSumIMaxPSuR2WEKhBGpEAYPwWlY0q1McbG5GZOxPcTNYCkuHNQd43ailPrgqUBj9/kYlLggrvSU+OBqEHYsOY9VNlwEuefH42C39pP1iT7+S32aoZjmDtTIUVPloZu3urTxqcj/JLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750033447; c=relaxed/simple;
	bh=T8S4GwijhzNpa0BJFzHIYckr2PzoK6843zAyUZ/3Mew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZC8krniiwmL6kAtr0plvsEIz97zeuXF+nUCsSmI1tj9Q1d6azVscWvP9B70Qm2VfmNO16nWmt7lzEEzbC0tgnQz4Ll19x2M9BsyOD84KH0cTrh0pA/+MZp/ZxQRy6jO7J6gDZhP8+usBjm/kyPZxN3V8Q6vwUqboDy0Ybg6Ww00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=WnpdHA+m; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=a3cxcHCIty1njJXqh9UOkwE73zPFAiXSTHhD6sWiTpk=; b=WnpdHA+mjSePUwmZ
	x85UClE8wNh1eAD+c9eZCoul4ywPfaWQWmvZn84kDtGUj1XEFEty0SHQvke+35pUozla2m+qDrHra
	1UtiZ5kbXafngosQomfUQSWfM8PDQmhm1l5rgxCfXX7IotIePuy2/e14CCAOLMeaf2q9UHuEd/IrN
	ABP8XcSdwgqZ3C0hkj/J/+gFx0LgkTyeWtucZoztVbk96IKtz/GUX/RpezXd1f4wfSQEviScHWhy5
	v4drcRW9IjXP7+C651CtieYd/inoJOeggGwyYdjq+CgMPeoL1WZe78H240EE3ZkV53caDDO9vyljF
	peaCKHaoKhRNupJ+Rg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uQxdn-009kT7-2i;
	Mon, 16 Jun 2025 00:23:59 +0000
From: linux@treblig.org
To: bparrot@ti.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: v4l2-jpeg: Remove unused v4l2_jpeg_parse_* wrappers
Date: Mon, 16 Jun 2025 01:23:59 +0100
Message-ID: <20250616002359.161639-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The functions:
  v4l2_jpeg_parse_huffman_tables()
  v4l2_jpeg_parse_quantization_tables()
  v4l2_jpeg_parse_scan_header()
and
  v4l2_jpeg_parse_frame_header()

were added in 2020 by
commit 50733b5b9102 ("media: add v4l2 JPEG helpers")

but have remained unused.

Remove them.

They're all just wrappers around an underlying set of helpers,
which are all still called via v4l2_jpeg_parse_header().

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/v4l2-core/v4l2-jpeg.c | 80 -----------------------------
 include/media/v4l2-jpeg.h           |  9 ----
 2 files changed, 89 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 6e2647323522..36a0f1a1b0d9 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -711,83 +711,3 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 	return marker;
 }
 EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_header);
-
-/**
- * v4l2_jpeg_parse_frame_header - parse frame header
- * @buf: address of the frame header, after the SOF0 marker
- * @len: length of the frame header
- * @frame_header: returns the parsed frame header
- *
- * Returns 0 or negative error if parsing failed.
- */
-int v4l2_jpeg_parse_frame_header(void *buf, size_t len,
-				 struct v4l2_jpeg_frame_header *frame_header)
-{
-	struct jpeg_stream stream;
-
-	stream.curr = buf;
-	stream.end = stream.curr + len;
-	return jpeg_parse_frame_header(&stream, SOF0, frame_header);
-}
-EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_frame_header);
-
-/**
- * v4l2_jpeg_parse_scan_header - parse scan header
- * @buf: address of the scan header, after the SOS marker
- * @len: length of the scan header
- * @scan_header: returns the parsed scan header
- *
- * Returns 0 or negative error if parsing failed.
- */
-int v4l2_jpeg_parse_scan_header(void *buf, size_t len,
-				struct v4l2_jpeg_scan_header *scan_header)
-{
-	struct jpeg_stream stream;
-
-	stream.curr = buf;
-	stream.end = stream.curr + len;
-	return jpeg_parse_scan_header(&stream, scan_header);
-}
-EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_scan_header);
-
-/**
- * v4l2_jpeg_parse_quantization_tables - parse quantization tables segment
- * @buf: address of the quantization table segment, after the DQT marker
- * @len: length of the quantization table segment
- * @precision: sample precision (P) in bits per component
- * @q_tables: returns four references into the buffer for the
- *            four possible quantization table destinations
- *
- * Returns 0 or negative error if parsing failed.
- */
-int v4l2_jpeg_parse_quantization_tables(void *buf, size_t len, u8 precision,
-					struct v4l2_jpeg_reference *q_tables)
-{
-	struct jpeg_stream stream;
-
-	stream.curr = buf;
-	stream.end = stream.curr + len;
-	return jpeg_parse_quantization_tables(&stream, precision, q_tables);
-}
-EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_quantization_tables);
-
-/**
- * v4l2_jpeg_parse_huffman_tables - parse huffman tables segment
- * @buf: address of the Huffman table segment, after the DHT marker
- * @len: length of the Huffman table segment
- * @huffman_tables: returns four references into the buffer for the
- *                  four possible Huffman table destinations, in
- *                  the order DC0, DC1, AC0, AC1
- *
- * Returns 0 or negative error if parsing failed.
- */
-int v4l2_jpeg_parse_huffman_tables(void *buf, size_t len,
-				   struct v4l2_jpeg_reference *huffman_tables)
-{
-	struct jpeg_stream stream;
-
-	stream.curr = buf;
-	stream.end = stream.curr + len;
-	return jpeg_parse_huffman_tables(&stream, huffman_tables);
-}
-EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_huffman_tables);
diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
index b65658a02e3c..62dda1560275 100644
--- a/include/media/v4l2-jpeg.h
+++ b/include/media/v4l2-jpeg.h
@@ -169,15 +169,6 @@ struct v4l2_jpeg_header {
 
 int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out);
 
-int v4l2_jpeg_parse_frame_header(void *buf, size_t len,
-				 struct v4l2_jpeg_frame_header *frame_header);
-int v4l2_jpeg_parse_scan_header(void *buf, size_t len,
-				struct v4l2_jpeg_scan_header *scan_header);
-int v4l2_jpeg_parse_quantization_tables(void *buf, size_t len, u8 precision,
-					struct v4l2_jpeg_reference *q_tables);
-int v4l2_jpeg_parse_huffman_tables(void *buf, size_t len,
-				   struct v4l2_jpeg_reference *huffman_tables);
-
 extern const u8 v4l2_jpeg_zigzag_scan_index[V4L2_JPEG_PIXELS_IN_BLOCK];
 extern const u8 v4l2_jpeg_ref_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
 extern const u8 v4l2_jpeg_ref_table_chroma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
-- 
2.49.0


