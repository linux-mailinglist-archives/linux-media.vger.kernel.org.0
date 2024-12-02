Return-Path: <linux-media+bounces-22465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EDD9E07CF
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 17:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6B0ABA2549
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F898208986;
	Mon,  2 Dec 2024 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oO90q0He"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48358208967
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151530; cv=none; b=UFmjymj99S1BZckhUJOSpOY2wTv2dVwyLeWSq8hV5+WxasiFaLp15l4HCxI331AUh6hKfkQzkZ8ElXQQiPUbqPwOwMJB7io7iCMvdH/HJcP9r7d8IYv1ZA3wsw4+HqyGU8SaKA6HfMyCozAOiY/ifBAD9NP9M8BPks6fl3NXM6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151530; c=relaxed/simple;
	bh=NzORBDlZ+2b3bTIpmo6N0TIjdVHHmntl2hVVYrgVoU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZSMILKvqB3Rf+DaVyBAOS1k6BNoI5yuRGQgYd6RLTFJ8eo/wFJoCtKo+oXOHzoVlBtaxyIcbiCfvQLq/VH1kwg0DwbIq3NxO3kcEO69WNUyRhMFzXEDTtf6jEryDhoUYtspUDpyfSDqtLYxLFsXfyK8rPCSi3aF0raWol8YyV2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oO90q0He; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E20E1047;
	Mon,  2 Dec 2024 15:58:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733151495;
	bh=NzORBDlZ+2b3bTIpmo6N0TIjdVHHmntl2hVVYrgVoU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oO90q0HeUn9gD0IK949YmFzEu87U1oJ9foopGk40J5dXT3U9poM4jXyFuajvBUvQD
	 afmVu18fL11O29Uguw8QMssIHcpejMPgBBNeC1Q6G3no1isuThpJ4txiYrj7ttiXJ+
	 pWUsbkYjys7zaZFGtSmpSQwdLvs5yhBldNrvMp80=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	isaac.scott@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 5/5] media: platform: rzg2l-cru: Add support for RAW10/12/14 data
Date: Mon,  2 Dec 2024 14:58:31 +0000
Message-Id: <20241202145831.127297-6-dan.scally@ideasonboard.com>
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

Add support to the rzg2l-cru driver to capture 10/12/14 bit bayer
data and output it into the CRU's 64-bit packed pixel format.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- Fewer new entries as the RAWnn pixel formats support multiple mbus
	  codes

Changes in v2:

	- Minor updates accounting for rebase

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 12 +++++++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 36 +++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 243a36b952cb3..d4b4b334d082f 100644
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
index 54a79d5c13e10..a3432d8b54e82 100644
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


