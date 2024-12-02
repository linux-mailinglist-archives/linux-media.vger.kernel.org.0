Return-Path: <linux-media+bounces-22466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD669E06A2
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35A6816E192
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BA720898A;
	Mon,  2 Dec 2024 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fpz4Bnxc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483B4208969
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151531; cv=none; b=s/9Oq5eun+c8ASNcS++50GamUel143Ike1yb1SgqeDY5itYVsceZq3y/OOti/vF0GKJzH8C9P2DgZfNPXngfGPyZ48YpSvO82jl/k6YDMQBAqoEl8TeipXpoZq8/RTpCAyXRGooP7sUj6JFQT9q+Rw4k8St0xdVXhMABKmYUuCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151531; c=relaxed/simple;
	bh=KMThR1ftkkd2GZtT3jZFUOmNERSEZJ3FC4H3QwJCiSs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ufywhvt0QkTwuXfTsKIlKubUOFG8JmPR2LZHCtWL2I8j2Dbdwob6F/+GAKc7+DxyLATNIrQ/UZixyMYLwky4e95fd8ssVIEICP+9RHbPFr6ggP8qL5Kwdoo+gy3WWGLjaMPxuYonTHodEghukqdyzQ3b1UZNG4ELM02+6qfmHaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fpz4Bnxc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D1B21046;
	Mon,  2 Dec 2024 15:58:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733151495;
	bh=KMThR1ftkkd2GZtT3jZFUOmNERSEZJ3FC4H3QwJCiSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fpz4BnxcJtLWy18kRjGkO9yo1VQ9uB9TgSxWw6VdSENDidf4YWUA4o4r8GDvaYk9x
	 w4y6quK5H8D6kK1szMCS/39NWJtIwixwO1rUcaUVxsVuCoL3M86RA5C0FOER9P009k
	 7phVMk2FqIk1JN2inal4zxIeWjwFhkl3NciO2doo=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	isaac.scott@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 4/5] media: rzg2l-cru: Support multiple mbus codes per pixel format
Date: Mon,  2 Dec 2024 14:58:30 +0000
Message-Id: <20241202145831.127297-5-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202145831.127297-1-dan.scally@ideasonboard.com>
References: <20241202145831.127297-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a preliminary step for supporting the CRU pixel formats, extend
the driver such that multiple media bus codes can support each of
the output pixel formats.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- New patch due to changes to patch 1

 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  8 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 67 +++++++++++++++----
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  2 +-
 3 files changed, 61 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index aaf85054f8842..ab923bfa3becf 100644
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
@@ -169,5 +173,7 @@ struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
+bool rzg2l_cru_ip_fmt_supports_mbus_code(const struct rzg2l_cru_ip_format *fmt,
+					 unsigned int code);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 399a337dbafbf..54a79d5c13e10 100644
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
@@ -155,7 +179,7 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 	sink_format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	if (!rzg2l_cru_ip_code_to_fmt(fmt->format.code))
-		sink_format->code = rzg2l_cru_ip_formats[0].code;
+		sink_format->code = rzg2l_cru_ip_formats[0].codes[0];
 	else
 		sink_format->code = fmt->format.code;
 
@@ -181,11 +205,26 @@ static int rzg2l_cru_ip_enum_mbus_code(struct v4l2_subdev *sd,
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
index 028b390488c84..57d1ff45ce1e9 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -891,7 +891,7 @@ static int rzg2l_cru_video_link_validate(struct media_link *link)
 	if (fmt.format.width != cru->format.width ||
 	    fmt.format.height != cru->format.height ||
 	    fmt.format.field != cru->format.field ||
-	    video_fmt->code != fmt.format.code)
+	    !rzg2l_cru_ip_fmt_supports_mbus_code(video_fmt, fmt.format.code))
 		return -EPIPE;
 
 	return 0;
-- 
2.34.1


