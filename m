Return-Path: <linux-media+bounces-36318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C04F1AEE1F5
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 17:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1A803AE0E3
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9A128CF74;
	Mon, 30 Jun 2025 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bV/PXD8A"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8523ABB1
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296028; cv=none; b=mKjs3bICBwLKKBddfNP5K39I1mhb4rhOeMkx0NbqZ27QTsFRsIKmuaJH33SMeFXy7732yB+M28SAZBkkfWfkcM3Tvt3qOjzgPg3qBke3mj6ET2TQiG79eX4DVqUjlp305Mp2Kvo1fwgX7iVbUcRRZfFHxvw6GMNVVPXXJa8VN+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296028; c=relaxed/simple;
	bh=sx5p5G5+2skkdjVuGHr64Pg5tkmmhIDv6CDXC/tAokQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UL8VkgayEwMt0RBBchG/V5yOaZ0J4N1pj37+4xOZAPoGUj3qIPb169OGCAGPpXbQ3mNiwbP1LHn3La7YFu9kqPLjIrg+LB/L5H4YEhY2/V8OkmKVlJgGlE1NttJD9fm58DhmWvSiyxQ68FPXPDIEQYljkGd2mAb3UwLaHNDuw1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bV/PXD8A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA7A9928;
	Mon, 30 Jun 2025 17:06:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751296003;
	bh=sx5p5G5+2skkdjVuGHr64Pg5tkmmhIDv6CDXC/tAokQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bV/PXD8A8ig+B2MDfjLgsm56d/F5XzmV+Bv5rCnmqchClBqDHxquzHe4vFRYtzRB0
	 36eU0vaqranjPUbIDfdvCnh95NoFALVrky182joTYGIgn9K3Q7dZHFMI2ai8qpzNvT
	 jPhyUkUb/cm6C0G5Li9wv0xefw6Uai8Rx31EaOZ8=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	dan.scally@ideasonboard.com,
	hverkuil@xs4all.nl,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v6.1 5/6] media: rzg2l-cru: Support multiple mbus codes per pixel format
Date: Mon, 30 Jun 2025 16:06:51 +0100
Message-Id: <20250630150651.2698237-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625-rzg2l-cru-v6-5-a9099ed26c14@ideasonboard.com>
References: <20250625-rzg2l-cru-v6-5-a9099ed26c14@ideasonboard.com>
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
Changes in v7:

	- Updated kerneldoc comment for struct rzg2l_cru_ip_format

Changes in v5:

	- None

Changes in v4:

	- None

Changes in v3:

	- New patch due to changes to patch 1
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    | 10 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 67 +++++++++++++++----
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  2 +-
 3 files changed, 62 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 8d74bdfae7c8..a1034feda4af 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -64,14 +64,18 @@ struct rzg2l_cru_ip {
 
 /**
  * struct rzg2l_cru_ip_format - CRU IP format
- * @code: Media bus code
+ * @codes: Array of up to four media bus codes
  * @datatype: MIPI CSI2 data type
  * @format: 4CC format identifier (V4L2_PIX_FMT_*)
  * @icndmr: ICnDMR register value
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
index 650a23f7b5bd..8e83eb5ed5c3 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -1147,7 +1147,7 @@ static int rzg2l_cru_video_link_validate(struct media_link *link)
 	if (fmt.format.width != cru->format.width ||
 	    fmt.format.height != cru->format.height ||
 	    fmt.format.field != cru->format.field ||
-	    video_fmt->code != fmt.format.code)
+	    !rzg2l_cru_ip_fmt_supports_mbus_code(video_fmt, fmt.format.code))
 		return -EPIPE;
 
 	return 0;
-- 
2.34.1


