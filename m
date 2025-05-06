Return-Path: <linux-media+bounces-31853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3B6AAC493
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFC2F508587
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A1128001D;
	Tue,  6 May 2025 12:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MV891y7T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA4C27FB33
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535835; cv=none; b=kOxColwn9e5YFvDcCD6gTJkO0YTeya9mXAIV3hIBRH4R6jvj+aGd/D1hgorC9wpH0UFVR8p4FxUCqMb1TMGZuE28mC1koAlHlPgghSsd01hK9mfOKpidA5s5xlOydbEL2k8IeT2fHblRKfCc7XsobZSesC1mO4l2ZzESDN34ZJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535835; c=relaxed/simple;
	bh=ocqVbUAxoxvcx+zWrcJ3/Hp9uTkJD9TAPJv5lvL1su4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TK6vAyJ5BRhMuUzpXk85D+0fXVww7XC5g/6Ni2KURi70rUk3KFY7OXbo4XJ3b0gkQkpzE1xwZGN22zHIaFrIoRTki+/y7bXOw+MeWSN54+6sxjwE8ZahwAfV3Gr5d1KyX2POFe8PJ6yS+34S8+ORd0GKHjFx5T2Tfy2WYxhGk9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MV891y7T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F696E8A;
	Tue,  6 May 2025 14:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746535816;
	bh=ocqVbUAxoxvcx+zWrcJ3/Hp9uTkJD9TAPJv5lvL1su4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MV891y7Tse/mqbiTmMgH6vvcrMgiSVHLlbgDekvkcCwPxkKWeukN2bZ3Id+gewM/b
	 t2X199S9C5wS2IxahvUEgTkh6aqfy5eJ3XB5zddmd/yyXulBZKv64KoIRPxoxKpSsH
	 d5AZmJqKXvCq8hTaSTszRaLN5RKXyvs5HB5X2gZk=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 4/6] media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
Date: Tue,  6 May 2025 13:50:13 +0100
Message-Id: <20250506125015.567746-5-dan.scally@ideasonboard.com>
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

Rather than open-code a calculation of the format's bytesperline
and sizeimage, use the v4l2_fill_pixfmt() helper. This makes it
easier to support the CRU packed pixel formats without over
complicating the driver.

This change makes the .bpp member of struct rzg2l_cru_ip_format
superfluous - remove them.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
Changes in v4:

	- None

Changes in v3:

	- None

Changes in v2:

	- Minor changes due to rebase

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  2 --
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |  5 -----
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 10 +---------
 3 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index c30f3b281284..8d74bdfae7c8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -68,7 +68,6 @@ struct rzg2l_cru_ip {
  * @datatype: MIPI CSI2 data type
  * @format: 4CC format identifier (V4L2_PIX_FMT_*)
  * @icndmr: ICnDMR register value
- * @bpp: bytes per pixel
  * @yuv: Flag to indicate whether the format is YUV-based.
  */
 struct rzg2l_cru_ip_format {
@@ -76,7 +75,6 @@ struct rzg2l_cru_ip_format {
 	u32 datatype;
 	u32 format;
 	u32 icndmr;
-	u8 bpp;
 	bool yuv;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 7836c7cd53dc..15fc1028082a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -16,7 +16,6 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.datatype = MIPI_CSI2_DT_YUV422_8B,
 		.format = V4L2_PIX_FMT_UYVY,
-		.bpp = 2,
 		.icndmr = ICnDMR_YCMODE_UYVY,
 		.yuv = true,
 	},
@@ -24,7 +23,6 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
 		.format = V4L2_PIX_FMT_SBGGR8,
 		.datatype = MIPI_CSI2_DT_RAW8,
-		.bpp = 1,
 		.icndmr = 0,
 		.yuv = false,
 	},
@@ -32,7 +30,6 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
 		.format = V4L2_PIX_FMT_SGBRG8,
 		.datatype = MIPI_CSI2_DT_RAW8,
-		.bpp = 1,
 		.icndmr = 0,
 		.yuv = false,
 	},
@@ -40,7 +37,6 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
 		.format = V4L2_PIX_FMT_SGRBG8,
 		.datatype = MIPI_CSI2_DT_RAW8,
-		.bpp = 1,
 		.icndmr = 0,
 		.yuv = false,
 	},
@@ -48,7 +44,6 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
 		.format = V4L2_PIX_FMT_SRGGB8,
 		.datatype = MIPI_CSI2_DT_RAW8,
-		.bpp = 1,
 		.icndmr = 0,
 		.yuv = false,
 	},
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 15afb647d4d6..c8e7d5d07025 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -941,15 +941,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
 			      &pix->height, 240, info->max_height, 2, 0);
 
-	if (info->has_stride) {
-		u32 stride = clamp(pix->bytesperline, pix->width * fmt->bpp,
-				   RZG2L_CRU_STRIDE_MAX);
-		pix->bytesperline = round_up(stride, RZG2L_CRU_STRIDE_ALIGN);
-	} else {
-		pix->bytesperline = pix->width * fmt->bpp;
-	}
-
-	pix->sizeimage = pix->bytesperline * pix->height;
+	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
 		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
-- 
2.34.1


