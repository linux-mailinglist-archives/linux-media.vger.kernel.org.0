Return-Path: <linux-media+bounces-45050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E31F1BF2246
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 17:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72BCC4274D4
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 15:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6445D26C3BF;
	Mon, 20 Oct 2025 15:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITxXyToD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F3266581
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 15:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760974664; cv=none; b=dcGEdDzJNWNoFIdygbsyU4IPQBst4jf4BClQEQcm0lOdCEj3XKtQCeM0eQlJbHQhKkDfDKWS8+ncBDYfCjnQLLWK8HG4dHfjqMCehY6UQ3z8PEmT1AkJmCpEDXnLrsfa74JgTv9NXequDRz+VQWub2oZzp/brUcRmyyFSFf/P/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760974664; c=relaxed/simple;
	bh=dbYDWVlRtGri7Jl+JmIYCKCV/yHDSqG4bnvcpD+Nj7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SJnOcpovnMPbIiTotYBzW9ltIbBL3LOdJBKQ505MITQjrAlGXQd5RMwiYXWb1n5I0XThGM2qKSCYJiPx2OD/bwYCZ+qkO25MeNe5E8x6CQOtn18sWVSpIrOEfMyRi68V+9t8O4onR8H6b2GB1nng7dFL9qeTjfuoCJdTUxYEqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITxXyToD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283EFC4CEF9;
	Mon, 20 Oct 2025 15:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760974664;
	bh=dbYDWVlRtGri7Jl+JmIYCKCV/yHDSqG4bnvcpD+Nj7M=;
	h=From:To:Cc:Subject:Date:From;
	b=ITxXyToDULYRfVcIGhLA2aERDovZQ/RX4anls20lJUtyHY1hmtlqXX75VQ0EeOI5V
	 jRbkRO9A5P5Lz8gvnlnCIWaclQm/7F8mednFGQ7PRq/4tspk5FTfVOeqJyHSNudm9V
	 9vLp4gBfMMqz5nYrUGgMx4kooXMqf5dwgZ10PsAsxb0gtRfczRipRIQfyBey6kSwpv
	 uvFbU+tQ1dhD7GRzwTTNc1HLwn/xspeDoxL1PonssDPVeeNCAbROED2YLVVUK69PxH
	 hYhnYwyud7f7M4Itn3M0wdeLwS/FZo9Yjw81BT1oKHuUhjfPlFy/fKc7jpB9nxlZmp
	 5/0ZMM0qo0SUA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: ipu6: isys: Add support for monochrome media bus formats
Date: Mon, 20 Oct 2025 17:37:41 +0200
Message-ID: <20251020153741.55404-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for monochrome media bus formats, for use with monochrome/IR
camera sensors.

This has been tested on a Dell XPS 13 9320 with OV1A1B IR sensor.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  4 +++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 34 ++++++++++++++-----
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 14 ++++++++
 3 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index d1fece6210ab..daec6b865bda 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -42,6 +42,10 @@ static const u32 csi2_supported_codes[] = {
 	MEDIA_BUS_FMT_SGBRG8_1X8,
 	MEDIA_BUS_FMT_SGRBG8_1X8,
 	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_Y8_1X8,
+	MEDIA_BUS_FMT_Y10_1X10,
+	MEDIA_BUS_FMT_Y12_1X12,
+	MEDIA_BUS_FMT_Y16_1X16,
 	MEDIA_BUS_FMT_META_8,
 	MEDIA_BUS_FMT_META_10,
 	MEDIA_BUS_FMT_META_12,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 463a0adf9e13..869e7d4ba572 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -25,24 +25,28 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_RGB565_1X16:
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_Y16_1X16:
 	case MEDIA_BUS_FMT_META_16:
 		return 16;
 	case MEDIA_BUS_FMT_SBGGR12_1X12:
 	case MEDIA_BUS_FMT_SGBRG12_1X12:
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_Y12_1X12:
 	case MEDIA_BUS_FMT_META_12:
 		return 12;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_Y10_1X10:
 	case MEDIA_BUS_FMT_META_10:
 		return 10;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_Y8_1X8:
 	case MEDIA_BUS_FMT_META_8:
 		return 8;
 	default:
@@ -65,21 +69,25 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
 	case MEDIA_BUS_FMT_SGBRG16_1X16:
 	case MEDIA_BUS_FMT_SGRBG16_1X16:
 	case MEDIA_BUS_FMT_SRGGB16_1X16:
+	case MEDIA_BUS_FMT_Y16_1X16:
 		return MIPI_CSI2_DT_RAW16;
 	case MEDIA_BUS_FMT_SBGGR12_1X12:
 	case MEDIA_BUS_FMT_SGBRG12_1X12:
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_Y12_1X12:
 		return MIPI_CSI2_DT_RAW12;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_Y10_1X10:
 		return MIPI_CSI2_DT_RAW10;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_Y8_1X8:
 		return MIPI_CSI2_DT_RAW8;
 	case MEDIA_BUS_FMT_META_8:
 	case MEDIA_BUS_FMT_META_10:
@@ -96,15 +104,23 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
 
 bool ipu6_isys_is_bayer_format(u32 code)
 {
-	switch (ipu6_isys_mbus_code_to_mipi(code)) {
-	case MIPI_CSI2_DT_RAW8:
-	case MIPI_CSI2_DT_RAW10:
-	case MIPI_CSI2_DT_RAW12:
-	case MIPI_CSI2_DT_RAW14:
-	case MIPI_CSI2_DT_RAW16:
-	case MIPI_CSI2_DT_RAW20:
-	case MIPI_CSI2_DT_RAW24:
-	case MIPI_CSI2_DT_RAW28:
+	switch (code) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_SRGGB16_1X16:
+	case MEDIA_BUS_FMT_SGRBG16_1X16:
+	case MEDIA_BUS_FMT_SGBRG16_1X16:
+	case MEDIA_BUS_FMT_SBGGR16_1X16:
 		return true;
 	default:
 		return false;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index f3f3bc0615e5..dec8f5ffcfa5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -77,6 +77,20 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
 	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
+
+	{ V4L2_PIX_FMT_GREY, 8, 8, MEDIA_BUS_FMT_Y8_1X8,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
+	{ V4L2_PIX_FMT_Y10, 16, 10, MEDIA_BUS_FMT_Y10_1X10,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
+	{ V4L2_PIX_FMT_Y12, 16, 12, MEDIA_BUS_FMT_Y12_1X12,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
+	{ V4L2_PIX_FMT_Y16, 16, 16, MEDIA_BUS_FMT_Y16_1X16,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
+	{ V4L2_PIX_FMT_Y10P, 10, 10, MEDIA_BUS_FMT_Y10_1X10,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
+	{ V4L2_PIX_FMT_Y12P, 12, 12, MEDIA_BUS_FMT_Y12_1X12,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
+
 	{ V4L2_PIX_FMT_UYVY, 16, 16, MEDIA_BUS_FMT_UYVY8_1X16,
 	  IPU6_FW_ISYS_FRAME_FORMAT_UYVY},
 	{ V4L2_PIX_FMT_YUYV, 16, 16, MEDIA_BUS_FMT_YUYV8_1X16,
-- 
2.51.0


