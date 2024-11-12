Return-Path: <linux-media+bounces-21314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA9D9C59FA
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 15:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 258FAB3E5A3
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 12:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8658515699D;
	Tue, 12 Nov 2024 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g6R8/VTd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538B915665D
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415607; cv=none; b=ItsjfkpDcGBndYcy4Z4NnmSRsYNn9y6UrS5ZXxRoQC1Kb4iOV3uGP0Oyb+p7aRbPI9YHb/tsYXdfhFu0xfMFqTDaHPd1vLhw2sUMhp53IrLBO3z/Laa+VDV7k/5oi7XDWnZVt8crMbaPiwL/xgyNGD3tXl6BqbG+GWLS82/gtOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415607; c=relaxed/simple;
	bh=XW4SZSWlytSUq0gNRIozrhcA/mfclGBNKDhpujhUi/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dbwfgHU10XlMZGjqnTCM9H1r8JWnNq2tpO+cZ23iBc/8PiQdOnvso7uOtWvkk8nQ8hgcqIhfCUgbl4UF118Qz/sABgp2JQjRDUnYxP2anUUZidrMBXqoHzUw8y/XS2HA10+2xuTyyNDb8oPCZT59nINmOB9sNemqOyn6ogWlj3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g6R8/VTd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 126021659;
	Tue, 12 Nov 2024 13:46:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731415584;
	bh=XW4SZSWlytSUq0gNRIozrhcA/mfclGBNKDhpujhUi/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g6R8/VTdt2IqBp2k6jjiaBcTXLBmEdUm1XLR9ge/SMJr/y4EVB+kDcoyd148EgmzX
	 afzaIoyDkHIOjFuuUIMo5s/JcTQ7hulOYXheji/dVEaDSqpCXblSwOZ4yD/TE2UocY
	 K7lHUOpKJbXdYT5VyJRgmDzHXGHqUobepa9Jk5eQ=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH v2 4/4] media: platform: rzg2l-cru: Add support for RAW10/12/14 data
Date: Tue, 12 Nov 2024 12:46:14 +0000
Message-Id: <20241112124614.646281-5-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112124614.646281-1-dan.scally@ideasonboard.com>
References: <20241112124614.646281-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Add support to the rzg2l-cru driver to capture 10/12/14 bit bayer
data and output it into the CRU's 64-bit packed pixel format.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
Changes in v2:

	- Minor updates accounting for rebase

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 12 +++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 84 +++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index cbefd43de09b..e77cce2a8ddf 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -192,6 +192,18 @@ static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
 	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, },
 	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, },
 	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10, },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, },
+	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12, },
+	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .bpp = 12, },
+	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .bpp = 12, },
+	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12, },
+	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .bpp = 14, },
+	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .bpp = 14, },
+	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .bpp = 14, },
+	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .bpp = 14, },
 };
 
 static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 399a337dbafb..3e93c801f1b5 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -47,6 +47,90 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.icndmr = 0,
 		.yuv = false,
 	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.format = V4L2_PIX_FMT_CRU_SBGGR10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.format = V4L2_PIX_FMT_CRU_SGBRG10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.format = V4L2_PIX_FMT_CRU_SGRBG10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.format = V4L2_PIX_FMT_CRU_SRGGB10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.format = V4L2_PIX_FMT_CRU_SBGGR12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.format = V4L2_PIX_FMT_CRU_SGBRG12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.format = V4L2_PIX_FMT_CRU_SGRBG12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.format = V4L2_PIX_FMT_CRU_SRGGB12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.format = V4L2_PIX_FMT_CRU_SBGGR14,
+		.datatype = MIPI_CSI2_DT_RAW14,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.format = V4L2_PIX_FMT_CRU_SGBRG14,
+		.datatype = MIPI_CSI2_DT_RAW14,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.format = V4L2_PIX_FMT_CRU_SGRBG14,
+		.datatype = MIPI_CSI2_DT_RAW14,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.format = V4L2_PIX_FMT_CRU_SRGGB14,
+		.datatype = MIPI_CSI2_DT_RAW14,
+		.icndmr = 0,
+		.yuv = false,
+	},
 };
 
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
-- 
2.34.1


