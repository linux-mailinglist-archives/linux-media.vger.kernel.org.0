Return-Path: <linux-media+bounces-31855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE82AAC495
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 166741C281DF
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DC4280032;
	Tue,  6 May 2025 12:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kL08QbQV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9813F27FD54
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535838; cv=none; b=TuBB5G1O2LA/R8Jc7fhRY2iTASkOWQixXBTiZUIsNayEx5nNPaGVb3yl/88J1N6Hcex4YBAzQpujqkdPHaGB8YXj19c0rzNY2b5dH5KMlf9KB3Lwb1QbU1phP8vX7q1d5Q+CrApLatgvBsath+NWJUb1P8lr5hSc3nw4JF1hSFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535838; c=relaxed/simple;
	bh=R5EWTAp2bHVJ4uouW8Vmw+ezJamFSpV91WdRHrLGQiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MHEJLRKDLz6FzGyih/U2/a/ISdva7TJ4AWXhRvHVUl1bYFRzUeXPUc6X22BHq6kYotvITSxbl6VVSMxKFs1pygUc8lX7kWq7CC63ecKwbzgIaAJw4XOn+apVYal+h2GQXMYUGiTcbuRaq92Oz22aoV15Gycbkm0ovJ5uJrm1B7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kL08QbQV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 390F3101F;
	Tue,  6 May 2025 14:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746535817;
	bh=R5EWTAp2bHVJ4uouW8Vmw+ezJamFSpV91WdRHrLGQiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kL08QbQVNeRN8GqpGIxmqZCugTqEDHT/2juaH2542RqAKSlt9nbNP7FUmRB2PLnOs
	 rjiq9V4+wVZBVQMyeAKNTP3cuSdHYkqcQJxMWjstMNfpOdAAH0A2jjf0TiYurrnkcI
	 3jMLU7A9/pC0DJTA8Di+wU8415qHYe5W6xhd3XR0=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH v4 6/6] media: platform: rzg2l-cru: Add support for RAW10/12/14 data
Date: Tue,  6 May 2025 13:50:15 +0100
Message-Id: <20250506125015.567746-7-dan.scally@ideasonboard.com>
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

Add support to the rzg2l-cru driver to capture 10/12/14 bit bayer
data and output it into the CRU's 64-bit packed pixel format.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
Changes in v4:

	- None

Changes in v3:

	- Fewer new entries as the RAWnn pixel formats support multiple mbus
	  codes

Changes in v2:

	- Minor updates accounting for rebase

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 12 +++++++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 36 +++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 8870c2cb8104..61175a344e8e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -232,6 +232,18 @@ static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
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
index fbbcdb96c457..2a2cb008a0dd 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -57,6 +57,42 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.icndmr = 0,
 		.yuv = false,
 	},
+	{
+		.codes = {
+			MEDIA_BUS_FMT_SBGGR10_1X10,
+			MEDIA_BUS_FMT_SGBRG10_1X10,
+			MEDIA_BUS_FMT_SGRBG10_1X10,
+			MEDIA_BUS_FMT_SRGGB10_1X10
+		},
+		.format = V4L2_PIX_FMT_CRU_RAW10,
+		.datatype = MIPI_CSI2_DT_RAW10,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.codes = {
+			MEDIA_BUS_FMT_SBGGR12_1X12,
+			MEDIA_BUS_FMT_SGBRG12_1X12,
+			MEDIA_BUS_FMT_SGRBG12_1X12,
+			MEDIA_BUS_FMT_SRGGB12_1X12
+		},
+		.format = V4L2_PIX_FMT_CRU_RAW12,
+		.datatype = MIPI_CSI2_DT_RAW12,
+		.icndmr = 0,
+		.yuv = false,
+	},
+	{
+		.codes = {
+			MEDIA_BUS_FMT_SBGGR14_1X14,
+			MEDIA_BUS_FMT_SGBRG14_1X14,
+			MEDIA_BUS_FMT_SGRBG14_1X14,
+			MEDIA_BUS_FMT_SRGGB14_1X14
+		},
+		.format = V4L2_PIX_FMT_CRU_RAW14,
+		.datatype = MIPI_CSI2_DT_RAW14,
+		.icndmr = 0,
+		.yuv = false,
+	},
 };
 
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
-- 
2.34.1


