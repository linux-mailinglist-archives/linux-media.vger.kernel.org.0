Return-Path: <linux-media+bounces-35859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9061DAE7CE1
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 11:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AAC918904D4
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 09:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EA729E0F7;
	Wed, 25 Jun 2025 09:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g8pvHN4G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B061C2DA74A
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843259; cv=none; b=I2IJpfpeCbPZRSJJadc8RCnvHX+j4m8TQE7HWsUlYqbSeaDTx5KmG7df4pNwqWDVsUkFqU2Z/cFitPrrx2WgRhmN0Pdt4v7wRPQlXUrrjh/Z7LG3LotkjlbPbH9mUr2bqsKIZ/1nmnYNJghUZ7Z7+oUQ3GeYVj8prCKfvBX4u7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843259; c=relaxed/simple;
	bh=QEdxg2yXHR100fbcCKOvNnEdxtDGEcuXui+ZU8ns9Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S88krJOeph4D0nWtEJW6yg3TttuvQ8xWeIS+t0FwnzZ+nwazX51msOxqcpDDgQjqgbLe0FE/jrjC50aeXpeJVqFgiE3EU0RHsFFXKuIun+lv0PxhNdlhgPWbU/Yjpn+mJfjWKf7E8gttQbPtwI1jq8K5ZoWNxECCyyQdunMgSkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g8pvHN4G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 433601733;
	Wed, 25 Jun 2025 11:20:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750843223;
	bh=QEdxg2yXHR100fbcCKOvNnEdxtDGEcuXui+ZU8ns9Bo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g8pvHN4GxUzkKzHdlM9uMws66RpwDxgmtPTMKDdWcyy5gFcse2uTQnukQ5+7M9FF7
	 cEex45FxC8k3Gs8mrpYBtQFwRtcbLcXHPsaM0fuq1X4zOxe1TwhPcGE7yp13RZwcnb
	 l9YpsnVO57ZWVlVYbYgLqVOiYKgZBXWdSaJEuKX0=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 25 Jun 2025 10:20:32 +0100
Subject: [PATCH v6 6/6] media: platform: rzg2l-cru: Add support for
 RAW10/12/14 data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-rzg2l-cru-v6-6-a9099ed26c14@ideasonboard.com>
References: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
In-Reply-To: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
 dan.scally@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3572;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=mO4iyzKYEU0rnBUawKFTtUelFbdSHGNzCtSZ2KLg6wQ=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoW79lRc+RCfWX4CSdwJBHtuLkJeF3ciSibEiq2
 8G7yCSEuquJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFu/ZQAKCRDISVd6bEV1
 MnprD/4yzYbzyJI0CIlY3EDgnnVUm2vmUuJRBKObd+ako/A8cA49h56WzO2EW1szHlW43xJG6ug
 OWaI48HY++LIqo02pk+Ji88+G15MlWj7boSqfxhJkD1ZIEsmU0m2XSPL5CmQaJ4wiiTM58eiO52
 9eQxJVWRpw+EHZBIc1gSpe6UFeCAQFnid4zhY9XlBbu37oU3XOKO4N9ikHNwZaIXWqOEScL15LN
 ZND+INBGcD+LYi/MaJ3mfCvyzCmTbt9x41h410NhlRrd9FM9hfcg7xlbkrS+f5NarcrfZ1oJQ8H
 evqLhGAYTWNroaRIAiVptKrwvS+/JHBfj47WGYSZ6a4jAIXxREUt+vv2a4dVHnmsKDjPsc0B+fc
 hRkuxH3VsDwgBSCIqGgeZ+V6AqF7iYjzcWW14fjvIJju+B+zTC4I1XKnvg4xZxdP4REsEMeI0Op
 h4tSPIDtchK/HiIwBzoVGiU4BNUhQf+Y396kQiaA1bc08fccbVGdV6ASwUgig0SAR4vv4H41EAw
 wHDygqKzwEVIhpqJTlblYBQY6NLMZS3dVIu+hpp+qPbXLczIMLY3E6gynW87ryPOqoC4P0b7ik3
 1aak8GREBavRLL5pGPYiruhGGVltm5jrfxYClI4fjv80uns7Qx7y0MN5UVO+ZoKH2jxCJwBbU1B
 FWV5zIa42GX0L2w==
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
Changes in v6:

	- Account for the renamed formats

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
index fbbcdb96c4570baf07cc9685c2fc847fb489df89..5f2c87858bfe6d00d6668e911991afa4820392a8 100644
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
+		.format = V4L2_PIX_FMT_RAW_CRU10,
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
+		.format = V4L2_PIX_FMT_RAW_CRU12,
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
+		.format = V4L2_PIX_FMT_RAW_CRU14,
+		.datatype = MIPI_CSI2_DT_RAW14,
+		.icndmr = 0,
+		.yuv = false,
+	},
 };
 
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)

-- 
2.34.1


