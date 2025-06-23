Return-Path: <linux-media+bounces-35664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F050AE472E
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 071ED7A28AC
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4D2267F4A;
	Mon, 23 Jun 2025 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="onfaUVa0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8FC267F4C
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689821; cv=none; b=RvXxE+Z8ersXFKK+LI9Eds3rsn1yM2HWvitwYAsXLvMn3S6pw3B3gVY4avZMTwWT1Vk8hW5n973dKKm5DyXBPEQs+5A1Vl3D929iJCaHmd5Ne2ZNYlnA5juJep+W0yvsnjrB1C1VKO3WLA1Xw/cOvsRR3w4C0P8pKSSPDrAAj5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689821; c=relaxed/simple;
	bh=9jBFIzbF6hERxuP8+sCA0Q+/G86Mi+7V1eGcbgi7BG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtMnoAe+AowCWzWBJATCwvdUi89SUCaeQM7vCOxveecNLoVg8PTwkDxiNocng/7OO8EPogAYwErsMEuTT4+3ZekiCrX153sjOiKM+U0f7Do//Fb3DS2ZWMHHm/6bT0MzFkmwg16IDuvL/FhieAiw4+7zWGTrtF8HkiVkPI+uOI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=onfaUVa0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3647F19E4;
	Mon, 23 Jun 2025 16:43:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750689794;
	bh=9jBFIzbF6hERxuP8+sCA0Q+/G86Mi+7V1eGcbgi7BG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=onfaUVa0chxYLr3ZShXbiFfqdow1XwXv5BhIClUFZK7te8gywAX94+EOCgwytHZzu
	 eQRS+gFbbqxWkSQUxByhFi7MhoP5NqkaJyStaBc8t/8tvzeDs48+K8N3M7aj+P7BzG
	 t1cVp/hnwmLqsgVCwIzpPY0vR/sZEYfBmkyv1gPY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 23 Jun 2025 15:43:22 +0100
Subject: [PATCH v5 5/6] media: rzg2l-cru: Support multiple mbus codes per
 pixel format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-rzg2l-cru-v5-5-1663a8c6719a@ideasonboard.com>
References: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
In-Reply-To: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWWgPH3XYW6XUGPlDlFO3gJZZrI7lJmtmaObIu
 amh6o3aHWmJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFloDwAKCRDISVd6bEV1
 MgR5D/0Vm4RnHet/AjW5TjpsTtl1updyqj99IXR70z8s4LJeGhMvaGQ5xq3paXpbiqK/ik7mhtC
 jimK/M7k8C3KEGmbJV5JC1Y+f7398fZopp2+ote++fVAYRlga3J4e21vIrQ9YNtBz1jVVzEXz/s
 clqDtfI0mInybttY79rVofPpi92CViOWd25fw9Ca0NtYtnjm6l5cRo1H/QQPqDiTfQG5pvjE3jO
 ZD/Wx/pq5Nl/vj8XUwFiLsn/HeKCfvcMpgbz7iheRlxbb17P8oX4HU4Zn43y/fDlqm9C2RpiJra
 NqCtXV8dPzp688xEbuVC/CgVPx3sYqPgt5knPelq1/OFQzG8yc8RDsdSoidbEnIArva9APJwHlr
 SPmK92KsbMxCdw2PCnf/fx3qI4x0xgT0VLXQSEmpT3vjX33GEFFkc8kkjLQ0n8wLdvyqaovI9ZF
 1jLjsvthEGP2fBWYSWMegaXcBNvWVDVvLBv90JlTpX98DnTkTY5mUZnX6qR00PU/qvz7z54W1yS
 HQU9NXM3Kf220wW0wkU5NEySwAjsRESZuXhJJFUJZHXgUL0mgZWVrloXXNd2tVMrQHl7b3NtwpX
 odnQ5MvDUZxgs2S27WcWknGzddh04yb1Lr9yQI1WyrXM6nDIL0ZSocIhq3IzUB6EuLtm+j6g0ro
 iYqFz5dsyfka3cQ==
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


