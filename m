Return-Path: <linux-media+bounces-35857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E45AAAE7CD5
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 11:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D133217751C
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 09:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26442DA743;
	Wed, 25 Jun 2025 09:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G4fAAxJJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCCF2D1914
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843256; cv=none; b=dOmUzC0wyvLGXXjLVXSwQluQ7AiPMpH6pGvRIoK/zCNKXQ5HK5yysF5d1+kwGUpVJ2/iKybMLtT0DbLUAZ/PoE9cbikQhVIHCKN0CM9jrbOkR34TPzs2OMAKeI57BL3mDiZWY+egNEDJWE/ETC1e+7WVK+Bxs7qR1YNdZnuApuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843256; c=relaxed/simple;
	bh=2HZ5gIvdtCNlbCjTgzIVX2Z5doOMAfLGUc17DcClp/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JCwXVwxdiESZvgJQYRuoZYu8Nrw9IdrNI5gDuDz6BHYBpFFsNJG9IRhpkgBiFHg8IuH0RWQxb8zPx1fzJ8Ycc73GyWQPel6Q78lQz3MjJT9bu8a94SDEonCaezKlNP8P42A14rd4NZxbN3v8hX5Ry0KXhvdfjBIibhmJQfangWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G4fAAxJJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5629A13D7;
	Wed, 25 Jun 2025 11:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750843222;
	bh=2HZ5gIvdtCNlbCjTgzIVX2Z5doOMAfLGUc17DcClp/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G4fAAxJJg/p53VS16jioK44TYvsdm3LvLjQz5IIsFA1CnZAdkR+Gntn6YyrtRUc3Q
	 YTRH0posu+bzY3dgPYj5fHlIphVmthEdpWqRvXJzbCUjYHgJN9irBN3vfn7wpSN8ap
	 VQEfqZHK30VlShPsYPwInHEQr6zIok8j6y7FxI5U=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 25 Jun 2025 10:20:30 +0100
Subject: [PATCH v6 4/6] media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-rzg2l-cru-v6-4-a9099ed26c14@ideasonboard.com>
References: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
In-Reply-To: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
 dan.scally@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4487;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=z3z9B2jOnAcXqlFsm6v7ToxZnReYNEhfJ/Vw0GlaexM=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoW79l+/GxephZ2a/mm9T2UTb1i5eobXpDYcIvB
 01txEO3bk6JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFu/ZQAKCRDISVd6bEV1
 MkatEACtVsxr9Q3yZB6zOIDDPPAr4xT9POAJsVtCzdKVm6EBd1LSgwW3Iz9XfniUv7aa07HRuB6
 0HcMsvNMJeeq1+0Eozv5LezXNHuv3ccb6BaagCU5C6O3/oTyTAjXXSS3mbjyJ+sJXjgFxB0WKWs
 wXEKeH5v0nl00FeWcRJ5DPcwTm4HAngfAw6q9AM/5vV+idUPC+3jETknofltgS1eaaFZeX1mJlJ
 TxRISGIJKoNdzrsCVF0k9bnvqPo4UHbkecAOgXQG+pmJmnoyo8kdqkaAaIP2R+uJqbCKUYymv+5
 IJk29fINk1Sdz905C2HJzCWPjODDxut4Y7z9VNHAoeoYkBZPEKHfct7L6HFnQ9CgfcpE/ojqUlC
 xDfivIDFSX5WQN74FQkb7uUqOtZY3hbwLYqLXKHn39oMTcmdN6ywgCGvWXwNCxVCYbBhtyyrfu1
 lPmY2fFKrdbYr/RQF2t8fgLUisI7F+mFjg1aAYN7EtBzWbDJsHE/T6cePruMxfjt0YDWtqX7IzX
 dOutFY4LnqwJ46FH7LiVeLCzj//ApUoAtcbiTh6Fty+2oTmH258vbfaMkE5ADYup+frV0aEBqT0
 /mvWvb23KCUqkVR68MEgQbeilfScAF9XQJEqMf0PkiXkE305d2qY8U0X6RkZgKQhF8GsJ6yIYls
 ClmW50WFO15KA2Q==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

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
Changes in v5:

	- None

Changes in v4:

	- None

Changes in v3:

	- None

Changes in v2:

	- Minor changes due to rebase
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  2 --
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |  5 -----
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 10 +---------
 3 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index c30f3b2812846a804168c9c2f7e0433a672c602f..8d74bdfae7c854f8f4c9c82303b455ef8c6d5db3 100644
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
index 7836c7cd53dc3ff9a2c8c5e53be0265a20956e30..15fc1028082add27ad3d6fa9e1314b6240ff0d4e 100644
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
index a92c6fc4dfaff7931700e967460802725c3dcd56..650a23f7b5bd61ee035dd35d1754c5d9b5e614f6 100644
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


