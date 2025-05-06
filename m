Return-Path: <linux-media+bounces-31854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3875AAC494
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 195A41C2640B
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFD327FB3A;
	Tue,  6 May 2025 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uOqsROMq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC67280005
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535836; cv=none; b=H57h5+L6sKPR6GA+IK6DdMPKOOjvoPYO2WOtRw5MHrozadhJKsmjZTNmeAgbswhv2r4lVJ5hJLfS5/uhx/E5XX7dQ8E+avuJxeIojpcfLxJzjvN4Nu021XzdzBR9g76uR4Pvgsn7icb9g6Yo0svK5II4vzm7FxSHGsLpr7/lKA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535836; c=relaxed/simple;
	bh=WSL6u4FnODSUL5qQz0hMnsjUuYMMt2Fo/Eq227X3oHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YCwp4o2ESPxEtSOY38fW5FQjCokTYlZieofK7CJiiosv5Oeg4SO1I3m/AoQGVYWAEOcUEs+vZJJ6rCprrCLEIiCd8NxUM2H9J4RY0Pqc0X5VGHNkH/P8QllzZw6lck4F506aOp0NkfMeR13S0w90Ey28wN3WlJC3FI5MUZjz/cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uOqsROMq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5AAFEBD;
	Tue,  6 May 2025 14:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746535817;
	bh=WSL6u4FnODSUL5qQz0hMnsjUuYMMt2Fo/Eq227X3oHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uOqsROMqhIGwxKh0acEZPufNjgmSly6KXjLqdMHEpk63RKCc7bkhLFKycCUVF75P5
	 PqBJH5PRM0FpbXmxamd0+p88OCK9TjXUA7zedUCLqJrV4AuxPtnvQVBuSYixU7EJyU
	 2w56t5+U5NGllTMdlrcclYXlUeebjjzERXTVNXO8=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 5/6] media: rzg2l-cru: Support multiple mbus codes per pixel format
Date: Tue,  6 May 2025 13:50:14 +0100
Message-Id: <20250506125015.567746-6-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506125015.567746-1-dan.scally@ideasonboard.com>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

As a preliminary step for supporting the CRU pixel formats, extend
the driver such that multiple media bus codes can support each of
the output pixel formats.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
Changes in v4:

	- None

Changes in v3:

	- New patch due to changes to patch 1

 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  8 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 67 +++++++++++++++----
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  2 +-
 3 files changed, 61 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 8d74bdfae7c8..49b11d0b8148 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -71,7 +71,11 @@ struct rzg2l_cru_ip {
  * @yuv: Flag to indicate whether the format is YUV-based.
  */
 struct rzg2l_cru_ip_format {
-	u32 code;
+	/*
+	 * RAW output formats might be produced by RAW media codes with any one
+	 * of the 4 common bayer patterns.
+	 */
+	u32 codes[4];
 	u32 datatype;
 	u32 format;
 	u32 icndmr;
@@ -190,6 +194,8 @@ struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
+bool rzg2l_cru_ip_fmt_supports_mbus_code(const struct rzg2l_cru_ip_format *fmt,
+					 unsigned int code);
 
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 15fc1028082a..fbbcdb96c457 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -13,35 +13,45 @@
 
 static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 	{
-		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.codes = {
+			MEDIA_BUS_FMT_UYVY8_1X16,
+		},
 		.datatype = MIPI_CSI2_DT_YUV422_8B,
 		.format = V4L2_PIX_FMT_UYVY,
 		.icndmr = ICnDMR_YCMODE_UYVY,
 		.yuv = true,
 	},
 	{
-		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.codes = {
+			MEDIA_BUS_FMT_SBGGR8_1X8,
+		},
 		.format = V4L2_PIX_FMT_SBGGR8,
 		.datatype = MIPI_CSI2_DT_RAW8,
 		.icndmr = 0,
 		.yuv = false,
 	},
 	{
-		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.codes = {
+			MEDIA_BUS_FMT_SGBRG8_1X8,
+		},
 		.format = V4L2_PIX_FMT_SGBRG8,
 		.datatype = MIPI_CSI2_DT_RAW8,
 		.icndmr = 0,
 		.yuv = false,
 	},
 	{
-		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.codes = {
+			MEDIA_BUS_FMT_SGRBG8_1X8,
+		},
 		.format = V4L2_PIX_FMT_SGRBG8,
 		.datatype = MIPI_CSI2_DT_RAW8,
 		.icndmr = 0,
 		.yuv = false,
 	},
 	{
-		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.codes = {
+			MEDIA_BUS_FMT_SRGGB8_1X8,
+		},
 		.format = V4L2_PIX_FMT_SRGGB8,
 		.datatype = MIPI_CSI2_DT_RAW8,
 		.icndmr = 0,
@@ -51,11 +61,14 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
 {
-	unsigned int i;
+	unsigned int i, j;
 
-	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
-		if (rzg2l_cru_ip_formats[i].code == code)
-			return &rzg2l_cru_ip_formats[i];
+	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
+		for (j = 0; j < ARRAY_SIZE(rzg2l_cru_ip_formats[i].codes); j++) {
+			if (rzg2l_cru_ip_formats[i].codes[j] == code)
+				return &rzg2l_cru_ip_formats[i];
+		}
+	}
 
 	return NULL;
 }
@@ -80,6 +93,17 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index)
 	return &rzg2l_cru_ip_formats[index];
 }
 
+bool rzg2l_cru_ip_fmt_supports_mbus_code(const struct rzg2l_cru_ip_format *fmt,
+					 unsigned int code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(fmt->codes); i++)
+		if (fmt->codes[i] == code)
+			return true;
+
+	return false;
+}
 struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_subdev_state *state;
@@ -157,7 +181,7 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 	sink_format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	if (!rzg2l_cru_ip_code_to_fmt(fmt->format.code))
-		sink_format->code = rzg2l_cru_ip_formats[0].code;
+		sink_format->code = rzg2l_cru_ip_formats[0].codes[0];
 	else
 		sink_format->code = fmt->format.code;
 
@@ -183,11 +207,26 @@ static int rzg2l_cru_ip_enum_mbus_code(struct v4l2_subdev *sd,
 				       struct v4l2_subdev_state *state,
 				       struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
-		return -EINVAL;
+	unsigned int index = code->index;
+	unsigned int i, j;
 
-	code->code = rzg2l_cru_ip_formats[code->index].code;
-	return 0;
+	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
+		const struct rzg2l_cru_ip_format *fmt = &rzg2l_cru_ip_formats[i];
+
+		for (j = 0; j < ARRAY_SIZE(fmt->codes); j++) {
+			if (!fmt->codes[j])
+				continue;
+
+			if (!index) {
+				code->code = fmt->codes[j];
+				return 0;
+			}
+
+			index--;
+		}
+	}
+
+	return -EINVAL;
 }
 
 static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index c8e7d5d07025..0fba51758f82 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -1149,7 +1149,7 @@ static int rzg2l_cru_video_link_validate(struct media_link *link)
 	if (fmt.format.width != cru->format.width ||
 	    fmt.format.height != cru->format.height ||
 	    fmt.format.field != cru->format.field ||
-	    video_fmt->code != fmt.format.code)
+	    !rzg2l_cru_ip_fmt_supports_mbus_code(video_fmt, fmt.format.code))
 		return -EPIPE;
 
 	return 0;
-- 
2.34.1


