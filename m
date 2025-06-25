Return-Path: <linux-media+bounces-35858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A81AE7CDC
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 11:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEFA97B68D8
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 09:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96972DA74C;
	Wed, 25 Jun 2025 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k7P+a+55"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4756E29DB79
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843257; cv=none; b=LUMe+/pX73KZrBBVJhSP3oHNrk88e+7kM8OmlMQeqFhKCZcNHtQYLc4NY05NK8fbkdoSn3rQc1PqGhV9m+LcMaGhhF7NOD3cW5Ks7Sq6S3bzrdcudVtZprZS1ASbwIfGpX5wSfyfJi7geYrM6DRPLOICBHAg06eUT0198UDL+y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843257; c=relaxed/simple;
	bh=9jBFIzbF6hERxuP8+sCA0Q+/G86Mi+7V1eGcbgi7BG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tzcabheTRBxng4eLtnC0dFntGLW8kzlZk8oH3aQky4/nywFdfU2X5dLHk+MEUsYOtLSLFS5WQncAeoVL4Jgj+Qkxlm87DalTgcX5Sf4d/5aK9wYzxFkxmqoHRrELG+txC/r/5ZsFnaTCt++mv88rQDN6PfcDvA1OkRRNhrIbRf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k7P+a+55; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2A611449;
	Wed, 25 Jun 2025 11:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750843223;
	bh=9jBFIzbF6hERxuP8+sCA0Q+/G86Mi+7V1eGcbgi7BG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k7P+a+55BAroSroCXMCPUbYrHdTQZL6L27NcCkCv0N/hmtLVh5PBYDFqdD2zrbWfE
	 lf8Ln2FOOQzWeJQRIxYRDNN8owhKHAMrLtKNb+5DG5b4FIqogXKH9vECPcuvQjMijq
	 0ITZ8Bm6T3Gxx8lmIbcnvKqtiTEOpIYaCEpGHQLc=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 25 Jun 2025 10:20:31 +0100
Subject: [PATCH v6 5/6] media: rzg2l-cru: Support multiple mbus codes per
 pixel format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-rzg2l-cru-v6-5-a9099ed26c14@ideasonboard.com>
References: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
In-Reply-To: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
 dan.scally@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6540;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=l1jXNGuJOWhMGZrGUDcyGR/5XHW+t77Uhncgj57icQk=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoW79lqvgbfacMPUZXs4LYS7mi3LToF2Qs4GDUK
 +zs5Q8csT+JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFu/ZQAKCRDISVd6bEV1
 MlkRD/4kQhk+ClcP4qVWT9HBDf96w04UFe5ZSkHUbH3nutZOPGC9i3as5DNk7kMlFlMxGhM05ko
 NZdVKwnRVurTHxcHITAuBpVevix+DNMUFcT1m0hufO9oJYRWM4NR976vSPxqmCg2Ej9a1vJqqMG
 2765X5jQ3rgRzKVWoJujPfwAH6UBJj1eWxY4y2SBOKwleJiWOrD1s6OLwElLrlBNFgguqk3oxse
 jr3mlZswhdJ4jXywyMsJE0NQA2dDHxuHvrzonp+4VDVZJ4noFZoqQSs3FYG+XX+t/YTpXgdxRC7
 tplU7TW+EnT85Dm/N51A9hHvCltUPQnhK5sRJBloo7Shk0MtTIjBUAlnzK0vB0o/EWv02zDcwru
 WS2yreuwNe+YlZoddowA8XU1XwRJ/i1Rn6WvGUNV8x27id/SQ8M50ZYEauMPIri9NrqmfSwYsIG
 HlS3EYgsNArURC5IQIrEUY1KvUgp8k8uCHb9cMt5xFRhdCtnDPI/qohGe9SN+pFOF8IOgqICAng
 +U+xSBm1N/dOwz9ddn2zcBWek4iPwsUheaXMuZl91IbKZslFeCobZuB1TII8qU7z2pQMD9vt8oC
 FKpb6rLrYqfuzlhKRhPXWpgAmTwwnh/68eBPwfvm6l3BqZ28K0NljqztFug2E8yaaZ1c5AEPq2X
 SBFmtf69n4l3FEg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

As a preliminary step for supporting the CRU pixel formats, extend
the driver such that multiple media bus codes can support each of
the output pixel formats.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
Changes in v5:

	- None

Changes in v4:

	- None

Changes in v3:

	- New patch due to changes to patch 1
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  8 ++-
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    | 67 +++++++++++++++++-----
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  2 +-
 3 files changed, 61 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 8d74bdfae7c854f8f4c9c82303b455ef8c6d5db3..49b11d0b814850042d1b3ca3b72725d0220c2987 100644
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
index 15fc1028082add27ad3d6fa9e1314b6240ff0d4e..fbbcdb96c4570baf07cc9685c2fc847fb489df89 100644
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
index 650a23f7b5bd61ee035dd35d1754c5d9b5e614f6..8e83eb5ed5c32e1ee1a8355dc6144eb18ca598cf 100644
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


