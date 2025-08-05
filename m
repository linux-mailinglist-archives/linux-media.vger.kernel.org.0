Return-Path: <linux-media+bounces-38944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C41B1BB83
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 22:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 089187AF97E
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 20:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DF721E087;
	Tue,  5 Aug 2025 20:47:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596752F2E;
	Tue,  5 Aug 2025 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754426862; cv=none; b=UadpwcnKX9G/sHWwI/s+t2YWWNfj+UPGaD5Iv2EUOd/3lcEq7lDVZRph7PKr+09QtDLa6OLxV4AiQNWn1FuJa25gfya4M6pYuwWonGTPtK0up9grAYFEXMnjq/ZEixIo4ZRoE5jKckAi+/ZhebgOhQ2EMOx/mrj+yukhhk/e1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754426862; c=relaxed/simple;
	bh=IVNEX/N5pP68FirwTK9wbwXxMlQy2oD+T/nM86DuZF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K7AzErsBajHLIfiLucZRNKXbu0HBQC3zEYqDbHa/gLsXfuLsQmV5Zcldq3FRy8mQXWET2dLoYo+ZptXAp7UD0k16vDSOvMkDqbEfsOnNaDmvLqegZHjGqHucfnogIdKOu7C+DEz0EYJeZnSFfQpD2BNuUjaMl1TG+mwjga6E+DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 021FF1F00036;
	Tue,  5 Aug 2025 20:47:36 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 79E2BB011F6; Tue,  5 Aug 2025 20:47:36 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 27FFBB011F1;
	Tue,  5 Aug 2025 20:47:19 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 1/2] media: uapi: Move colorimetry controls at the end of the file
Date: Tue,  5 Aug 2025 22:47:17 +0200
Message-ID: <20250805204718.6893-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.50.1
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
index 73e2a4ec7a16..e52cdf48d652 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2664,40 +2664,6 @@ struct v4l2_ctrl_hevc_scaling_matrix {
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
@@ -3630,4 +3596,38 @@ struct v4l2_ctrl_av1_film_grain {
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


