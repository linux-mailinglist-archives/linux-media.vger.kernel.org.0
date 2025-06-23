Return-Path: <linux-media+bounces-35663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 243EDAE4749
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75F7D3A8DE5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BAD267F74;
	Mon, 23 Jun 2025 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tG1v044G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC897267F4A
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689821; cv=none; b=g/FlxkJm6XORBvXYbSx1Clm4/6bd2rc+j5d6WPT/hwttaJf8Iej8wdieGd93e9UF8L0O2HuIlkJBRZBnhTix76cVpDRNjtStCCcMRONA2pMapt74BM7H0t4z3Hh5/wEbnS2OMjBNlNlJQt+TZle7Lmw+fieDDOD7tb8LyAm3hb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689821; c=relaxed/simple;
	bh=eIdx9chVIo49TP7Ph26jIGxPKrEhp5942IdoMfYUUAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhHpm0r95emKEw5Ax5iy/OVDvBCFUgIGZPjv4AUrLq/hzinpUUUavQOQkC/8YxrGo8k0YtlpWz/+EJTcKE8OiI5Hw8/tMQB8lliUtZtVA9Dr4Ns5KMzEO57fJY/IwunPSdm2Ki2GCOpMLhOm1SHEoLb2iMJdss5FApPLLWZEAGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tG1v044G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0D901AD5;
	Mon, 23 Jun 2025 16:43:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750689794;
	bh=eIdx9chVIo49TP7Ph26jIGxPKrEhp5942IdoMfYUUAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tG1v044GqeF2x0ic8ILPXK6ZWNv6CHubKZz4gx0vjKb9urNc1SFOBEuBCCGpGFg3v
	 TlSkD/mr3C+ely39zQvo+Madf37UM/+GgyIhNiy0wm2tyFMg5QtxjvZnZCnFuHiWBb
	 rULHhvpkk+k2Jrzq2kfYo7cuvykG512PMZ1ga5Hc=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 23 Jun 2025 15:43:23 +0100
Subject: [PATCH v5 6/6] media: platform: rzg2l-cru: Add support for
 RAW10/12/14 data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-rzg2l-cru-v5-6-1663a8c6719a@ideasonboard.com>
References: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
In-Reply-To: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
 dan.scally@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3516;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=joE4KdqrscFMzh5nxq/pyRcrAWJL6mtkIk7kDuxqv4E=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWWgP1ooqGLNHuOQRGcj86EIfXnjGyIYII+z9N
 uLwGZsQGReJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFloDwAKCRDISVd6bEV1
 MhzmEACswtI6y6jy9UaA9XpE123aGe6Ymtn/hAQT6uzBJmROnjnnVwtanbETv044mfcjgCMi+AC
 qeoSU+sx/XiBVTFMxpJuAcsgY/PIZ6yGkqUATl0OWl+236NrBbVtfa/m6yBieps3/fVFx1Mto0m
 fhmrR5yTD1ayRSER/DlslG0/V7b/egctcvWMxTU15Xdf5/Hg06TMaJ70gbUTwQXWkJKJHrL50hG
 7U+w/To0DZuFWQXgRSJsov95hpglfl6c3KWh08li9EOI/1cBrHPe0Byp3sHFoWZyj5SNmlPyNMf
 Fwk7gXg0X2zXUJmxbcgkBtzO8M6/c0vgf9QG5Oz/4M8CkWH9gKwY6FCp5N5U+3esrGKqynwPUNT
 WnyCA+xTz32OkAEn8qY3ftA4N4ughMi5sV31Th0yu9HqIG36E8I5mDl7HBEuaTv1wvXUiE5rTNc
 5blb3rGIhKF+quo4Y827b0PriZoV9BPLt+zVct78XjDYFHLX7NmsxwshH5kcjff2yKcTmycSYDr
 +qs7aOJ4qB42wDtLyAGGwXsxggF5eiU35QOIMnx0JmJmOWwkv58/RHmCNg58A6MGFEOIgizP/cw
 9Gaxt+6nF9TPE6bU/Pd24cHU1qWEvIYPR1gUFylMJWk4eiofBc9E9937hhGxKJqJCGnQS9cnkRQ
 xRi5g2zZO1CvOng==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Add support to the rzg2l-cru driver to capture 10/12/14 bit bayer
data and output it into the CRU's 64-bit packed pixel format.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
Changes in v5:

	- None

Changes in v4:

	- None

Changes in v3:

	- Fewer new entries as the RAWnn pixel formats support multiple mbus
	  codes

Changes in v2:

	- Minor updates accounting for rebase
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 12 ++++++++
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    | 36 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index cec165551183afb71ae019b277c46a17a0f8096d..1520211e74185fea3bca85f36239254f6b4651db 100644
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
index fbbcdb96c4570baf07cc9685c2fc847fb489df89..2a2cb008a0ddcf3a55602d7aa0752711b302899f 100644
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


