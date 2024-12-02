Return-Path: <linux-media+bounces-22464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B05969E0673
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6724A173191
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F202208977;
	Mon,  2 Dec 2024 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k9HcHMOu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9CA208967
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151527; cv=none; b=rNRbcg0wt7ha90fHzhm3PcFKPanG6GCNwMR1USAWU0FY/5kRYtFh27pdK4MlsNAi6E0FkDHKtEv3t16E1/nqlKt9a8sLECjTqxe0ExC+m17D4trMJNgHTeD+ZdV89cTAaXsOKkN/nJxfAe0K2F5nERQI5lpPd1Q0JsWM2bLcgfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151527; c=relaxed/simple;
	bh=cC9Q9CAJD3RayUe22OQ7BCKKJpf/iVo4m0OFNevMp9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rqs8Pu4iM+dyIs7EiQ3hGphJA5W4AOazPVP00N3cxcnXaagwcdOcZDjw56CgWD/U4iJBezuziGpwNZ1G1ALeBobnJ7Apwu0gFPR/+pnqADFRnGWbqreeM5tjAC/mQpaU8zfuByIEGzm2oFNHTaMpMA5vFZN4RTHHcFDWGOX8xFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k9HcHMOu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BC301045;
	Mon,  2 Dec 2024 15:58:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733151494;
	bh=cC9Q9CAJD3RayUe22OQ7BCKKJpf/iVo4m0OFNevMp9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k9HcHMOuDfPL9mCU9WngnFl14QP6Fb2GAeVI8Xkd+D0dWxXaoHx9uUrgEjj50EiPS
	 +PWv8f6e82sK10+DLbHIBMp8r6ApBRsu2MsZ3+pN40HU1ufGj+VNR1tkYcmZlDSxk/
	 Q1O3GIr/4B7RRlhnIQDH/btbi9ZBf+PZZVStLbgw=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	isaac.scott@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 3/5] media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
Date: Mon,  2 Dec 2024 14:58:29 +0000
Message-Id: <20241202145831.127297-4-dan.scally@ideasonboard.com>
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
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- None

Changes in v2:

	- Minor changes due to rebase

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 --
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c    | 5 -----
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 +--
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 8b898ce05b847..aaf85054f8842 100644
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
index 76a2b451f1daf..399a337dbafbf 100644
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
index 17a1af507a270..028b390488c84 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -711,8 +711,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH, 1,
 			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
 
-	pix->bytesperline = pix->width * fmt->bpp;
-	pix->sizeimage = pix->bytesperline * pix->height;
+	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
 		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
-- 
2.34.1


