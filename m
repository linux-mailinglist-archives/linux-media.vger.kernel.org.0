Return-Path: <linux-media+bounces-40840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B978B331C5
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 20:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E958E201356
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 18:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8742DECA1;
	Sun, 24 Aug 2025 18:08:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F251E7660;
	Sun, 24 Aug 2025 18:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756058895; cv=none; b=VbNqMEFu/T5dwQFrkUlhai/sN2T/VQRm0k5vdCQJrDvpobP8+DEAQF/+xeZx/AIDAXjZnyl4pe9xK6GDhISkpxY5MHzT3J6AnrPGjp1Z4D0htJlTkdfWREK2MZ7WmUaYgMNXf2QArXelkhpF/CxER+FKiIFRBtQMQ0NxonRrEPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756058895; c=relaxed/simple;
	bh=Wc72mvhLT02KWdyxFLTSKRxzKisuZjPbKNeoXo7qk+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iolnsQyJbtV03IhzXlutFJn83wzM9U9twK9h6OGtYkqY88fdAZss4cbp8a0pooanTz6Ecl7JRjA2OeYiqOg9WZNirANvyS+DqRN/IlGuBMeTHc4adEN7hOdLISA+kXhsixCuHFq/SCJa8zWYEpNpVrT1ZzeKl3lE6xLFWQzRdnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5C60D1F0005B;
	Sun, 24 Aug 2025 18:08:11 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id ABB33B017C2; Sun, 24 Aug 2025 18:08:10 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 713B5B01DB4;
	Sun, 24 Aug 2025 18:07:36 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2 1/4] media: uapi: Move colorimetry controls at the end of the file
Date: Sun, 24 Aug 2025 20:07:32 +0200
Message-ID: <20250824180735.765587-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824180735.765587-1-paulk@sys-base.io>
References: <20250824180735.765587-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The colorimetry controls class is defined after the stateless codec
class at the top of the controls header. It is currently defined in
the middle of stateless codec controls.

Move the colorimetry controls after the stateless codec controls,
at the end of the file.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 include/uapi/linux/v4l2-controls.h | 68 +++++++++++++++---------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index f836512e9deb..4a483ff1c418 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2549,40 +2549,6 @@ struct v4l2_ctrl_hevc_scaling_matrix {
 	__u8	scaling_list_dc_coef_32x32[2];
 };
 
-#define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
-#define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
-
-#define V4L2_CID_COLORIMETRY_HDR10_CLL_INFO	(V4L2_CID_COLORIMETRY_CLASS_BASE + 0)
-
-struct v4l2_ctrl_hdr10_cll_info {
-	__u16 max_content_light_level;
-	__u16 max_pic_average_light_level;
-};
-
-#define V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY	(V4L2_CID_COLORIMETRY_CLASS_BASE + 1)
-
-#define V4L2_HDR10_MASTERING_PRIMARIES_X_LOW	5
-#define V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH	37000
-#define V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW	5
-#define V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH	42000
-#define V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW	5
-#define V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH	37000
-#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW	5
-#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH	42000
-#define V4L2_HDR10_MASTERING_MAX_LUMA_LOW	50000
-#define V4L2_HDR10_MASTERING_MAX_LUMA_HIGH	100000000
-#define V4L2_HDR10_MASTERING_MIN_LUMA_LOW	1
-#define V4L2_HDR10_MASTERING_MIN_LUMA_HIGH	50000
-
-struct v4l2_ctrl_hdr10_mastering_display {
-	__u16 display_primaries_x[3];
-	__u16 display_primaries_y[3];
-	__u16 white_point_x;
-	__u16 white_point_y;
-	__u32 max_display_mastering_luminance;
-	__u32 min_display_mastering_luminance;
-};
-
 /* Stateless VP9 controls */
 
 #define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
@@ -3515,4 +3481,38 @@ struct v4l2_ctrl_av1_film_grain {
 #define V4L2_CID_MPEG_MFC51_BASE        V4L2_CID_CODEC_MFC51_BASE
 #endif
 
+#define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
+#define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
+
+#define V4L2_CID_COLORIMETRY_HDR10_CLL_INFO	(V4L2_CID_COLORIMETRY_CLASS_BASE + 0)
+
+struct v4l2_ctrl_hdr10_cll_info {
+	__u16 max_content_light_level;
+	__u16 max_pic_average_light_level;
+};
+
+#define V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY	(V4L2_CID_COLORIMETRY_CLASS_BASE + 1)
+
+#define V4L2_HDR10_MASTERING_PRIMARIES_X_LOW	5
+#define V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH	37000
+#define V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW	5
+#define V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH	42000
+#define V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW	5
+#define V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH	37000
+#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW	5
+#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH	42000
+#define V4L2_HDR10_MASTERING_MAX_LUMA_LOW	50000
+#define V4L2_HDR10_MASTERING_MAX_LUMA_HIGH	100000000
+#define V4L2_HDR10_MASTERING_MIN_LUMA_LOW	1
+#define V4L2_HDR10_MASTERING_MIN_LUMA_HIGH	50000
+
+struct v4l2_ctrl_hdr10_mastering_display {
+	__u16 display_primaries_x[3];
+	__u16 display_primaries_y[3];
+	__u16 white_point_x;
+	__u16 white_point_y;
+	__u32 max_display_mastering_luminance;
+	__u32 min_display_mastering_luminance;
+};
+
 #endif
-- 
2.50.1


