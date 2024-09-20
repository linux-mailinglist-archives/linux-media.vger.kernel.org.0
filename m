Return-Path: <linux-media+bounces-18421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FA097D58B
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 14:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2212B1C2101A
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 12:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5A4152196;
	Fri, 20 Sep 2024 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IxsUuxy1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593AE149DFD
	for <linux-media@vger.kernel.org>; Fri, 20 Sep 2024 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836100; cv=none; b=IsPJFhYyGZacqt2e+eq3pAaadMeAqPnGGsJBTP+3n3HnyGKRuQy0Pg97sCX2K35YEchTAFBetgXd3gfZFpygxnPLchmi3nXgkBu8+6evlBZOpk+6darkZe8LXJPDCfsgQd07hl7TDNEZv9k5SSj1KaEiNu0ITtkXmMhvgezQkls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836100; c=relaxed/simple;
	bh=VK4GX51+fFmkP3dM4+xu/fa6Lylxa5YnNUU3QkyXjKE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XRGpVwZSDmZ2fgstsoYyqJCf+2LRt8FX3jHtPniHkNUw53k0XhDlO3edKxHAIrPUEHQxRuHAKy74Lw/zuCUjUgV1dtS6j42u6EHA6GctuEm2CwLxE0qH+ZrO//R7xniqjtbIrXG7FtM8CR2nV1AeLKxCj27fyZF3kaO3qF84i+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IxsUuxy1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D449AE34;
	Fri, 20 Sep 2024 14:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726836008;
	bh=VK4GX51+fFmkP3dM4+xu/fa6Lylxa5YnNUU3QkyXjKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IxsUuxy169CyhoSBGvmz0c02gJDAlaipP/ipH40WB1RIpDRN0wtyhUuMcFQ6TcQNA
	 OCzFsd64ZgUEPcMcV5MxpfjfpfEA/IVYAk5hzt0MZD9O0bNDFkXhiKYirhJe7cQ/To
	 Q9zUMPcG5QTAzl7GUkRLTfKy42PCmfIqGaWsZCEc=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH 4/4] media: platform: rzg2l-cru: Add support for RAW10/12/14 data
Date: Fri, 20 Sep 2024 13:41:15 +0100
Message-Id: <20240920124115.375748-5-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920124115.375748-1-dan.scally@ideasonboard.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
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

Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 12 ++++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 72 +++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 9609ca2a2f67..6b83f317919f 100644
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
index f2fea3a63444..65b1cf9e553f 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -42,6 +42,78 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.datatype = MIPI_CSI2_DT_RAW8,
 		.icndmr = 0,
 	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.format = V4L2_PIX_FMT_CRU_SBGGR10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.format = V4L2_PIX_FMT_CRU_SGBRG10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.format = V4L2_PIX_FMT_CRU_SGRBG10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.format = V4L2_PIX_FMT_CRU_SRGGB10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.format = V4L2_PIX_FMT_CRU_SBGGR12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.format = V4L2_PIX_FMT_CRU_SGBRG12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.format = V4L2_PIX_FMT_CRU_SGRBG12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.format = V4L2_PIX_FMT_CRU_SRGGB12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.format = V4L2_PIX_FMT_CRU_SBGGR14,
+		.datatype = MIPI_CSI2_DT_RAW14,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.format = V4L2_PIX_FMT_CRU_SGBRG14,
+		.datatype = MIPI_CSI2_DT_RAW14,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.format = V4L2_PIX_FMT_CRU_SGRBG14,
+		.datatype = MIPI_CSI2_DT_RAW14,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.format = V4L2_PIX_FMT_CRU_SRGGB14,
+		.datatype = MIPI_CSI2_DT_RAW14,
+		.icndmr = 0,
+	},
 };
 
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
-- 
2.34.1


