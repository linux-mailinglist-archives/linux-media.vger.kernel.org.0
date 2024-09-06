Return-Path: <linux-media+bounces-17815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 755D096FA0D
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 19:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAFB51F22D1D
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FC31D86F1;
	Fri,  6 Sep 2024 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqiZUeT8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D061D679A;
	Fri,  6 Sep 2024 17:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725644430; cv=none; b=DOl4HRCclv2jhRDJQ8P8eEhjAOZFjCVGo20BIyX5ZL83FUtNXPT9tjitiFNjq8P+ETnxIvAv39J2JyYP+75LptqpyePEitqOLGkVi0+f81HOzuHBaoUQMLCtu0QVW876xn+Li8ezESCyIN40JWpIrAWfM2Su+fmegOGTdv+YU2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725644430; c=relaxed/simple;
	bh=Kg1fESNf0X+5YiKDQLqfDlABO5VKIZosjyhbT0lEztE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O3dfjtzQeN9qJiwd79cL/zWkzm9AFjKt1sfxnU+/g2nAFYFtnBKm0uIVvb6ECDg8wPVHtBZ8l5aTWnuyd/lmMfA3mY7uakLuFNi+okkCpYbB/Dw3JrUUIvHxlQGNFsjOfEN42PlpUO+0Txf5hZ9ebHxjJXSxP7KZ8bI0E6MPfsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqiZUeT8; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c260b19f71so2458588a12.1;
        Fri, 06 Sep 2024 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725644427; x=1726249227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNJfl5F+xChDdawnSeQiz1xfV4q03mnwuTx7Ec+zuZM=;
        b=AqiZUeT8wHsZQQ+dH9/dDo9FS41ABJ5U4uSm8dDVNaHkoQPOkqZX73MQhknZUF2Ae0
         HixAFSkEWmZfwN9fseoT/g5p7Q1emRW4J4mAnz2LKV3CmIXLrwDFFhCkKu4lH+0cLiE0
         tRNtyDUhNXHeLFGN/7lrPGsuuT8lStDGDVRpaD6WoMYp9pwYAZbdVMBrdaQdPDbXrU64
         PnixRIECozYC1fiqjmcNo7VtmbLX4lN5PCGs1iHOmO0N7FuWcBuBt/8LwNajAdnBAsxt
         jbL6ieOvsgIcgzc1PVu7vvlTp8y7i01lGib+Fu2+bqBXViLpFR92pcXz9HSFX4+xsiER
         4X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644427; x=1726249227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNJfl5F+xChDdawnSeQiz1xfV4q03mnwuTx7Ec+zuZM=;
        b=iCLngzOAR+GynMfVBkvavvDys/JCZdjqqb8HsdI8QSPEkG5gMktU/Zqah6TRDhZPjV
         x6oUOFvrO6OlNosimdJgPAJl9Ngr4e6EicZqhTC/AW0ZdkgsGYpJiw49VWstAaBCbyB+
         b0xVKhmdeWvuhwR5smcGOcp4FZ3R1drM3bEylMUNo9om+pq/LB6oq+EE393dEE/cjr6Y
         +hd+B9WStLg/EPH7IUeDmUXAIUYfZeKYgFsifMn/O2vGEJZ2ccHvzZ9iwWi55pCswyGE
         roRlY9ssrfbr2ZMwOHPHIbgHOOzjbM3SNq3/5cAuuz2e20ZiQopGo6Sj45SSyIiQu7+n
         n2tg==
X-Forwarded-Encrypted: i=1; AJvYcCU2+xR/1OhT1HFsQeQwgMxjyAiQyoRdFfDdCKYFaPFibcg1/CZSomSyV4yDp+6J401675dN8dAVOrkluGs=@vger.kernel.org, AJvYcCXvWTj6dCQ+Na93ILeKi4UPp8ND9BxVSSo+camN+ehSpLUyrlEMasMpfcV9kTaz5C1zlVOAUiJAA2nE9/aGcBrDtL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywem2wFjbou/ULXtGVAijLQBmP7N1KxJgFl/qmpBIdAAWaVG5z1
	bYykOlnhw/bia2/dNEPkiwyeu4Jp6ruGVQVTyLFtyBEvz+ha7DEALbNxcTN3QNo=
X-Google-Smtp-Source: AGHT+IEgT20D35Jq7u07g5CPkHIdZkey4MccTXBjTlh7Xr5XvBls1yInooC8Pp9czV7Ju4//M/l4lw==
X-Received: by 2002:a05:6402:5386:b0:5a2:68a2:ae57 with SMTP id 4fb4d7f45d1cf-5c3dc7c4c45mr2092216a12.31.1725644426996;
        Fri, 06 Sep 2024 10:40:26 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc697fedsm2623557a12.64.2024.09.06.10.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:40:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] media: platform: rzg2l-cru: Add support to capture 8bit raw sRGB
Date: Fri,  6 Sep 2024 18:39:47 +0100
Message-Id: <20240906173947.282402-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support to capture 8bit Bayer formats.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  5 ++
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  7 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  9 +++-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 51 ++++++++++++++++---
 4 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 174760239548..83c664cb0929 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -58,6 +58,11 @@ struct rzg2l_cru_ip {
 	struct v4l2_subdev *remote;
 };
 
+enum rzg2l_cru_fmt {
+	RZG2L_YUV = 0,
+	RZG2L_RAW_BAYER,
+	RZG2L_USER_DEFINED,
+};
 /**
  * struct rzg2l_cru_dev - Renesas CRU device structure
  * @dev:		(OF) device
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index a7e4a0c109da..b14c92cd7c18 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -18,6 +18,7 @@
 #include <linux/sys_soc.h>
 #include <linux/units.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -188,7 +189,11 @@ struct rzg2l_csi2_format {
 };
 
 static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .datatype = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
 };
 
 static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index ac8ebae4ed07..5f60be92ea85 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/delay.h>
+#include <media/mipi-csi2.h>
 #include "rzg2l-cru.h"
 
 struct rzg2l_cru_ip_format {
@@ -15,7 +16,11 @@ struct rzg2l_cru_ip_format {
 };
 
 static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .datatype = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .datatype = MIPI_CSI2_DT_RAW8, .bpp = 8, },
 };
 
 enum rzg2l_csi2_pads {
@@ -149,7 +154,7 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index != 0)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
+	if (!rzg2l_cru_ip_code_to_fmt(fse->code))
 		return -EINVAL;
 
 	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 6101a070e785..66a0b80e8da7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-contig.h>
 
@@ -78,6 +79,7 @@
 #define ICnMC				0x208
 #define ICnMC_CSCTHR			BIT(5)
 #define ICnMC_INF_YUV8_422		(0x1e << 16)
+#define ICnMC_INF_RAW8			(0x2a << 16)
 #define ICnMC_INF_USER			(0x30 << 16)
 #define ICnMC_VCSEL(x)			((x) << 22)
 #define ICnMC_INF_MASK			GENMASK(21, 16)
@@ -203,6 +205,10 @@ static int rzg2l_cru_mc_validate_format(struct rzg2l_cru_dev *cru,
 
 	switch (fmt.format.code) {
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
 		break;
 	default:
 		return -EPIPE;
@@ -300,7 +306,7 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
-static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
+static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, enum rzg2l_cru_fmt *input_fmt,
 				 struct v4l2_mbus_framefmt *ip_sd_fmt)
 {
 	u32 icnmc;
@@ -308,11 +314,18 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
 	switch (ip_sd_fmt->code) {
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 		icnmc = ICnMC_INF_YUV8_422;
-		*input_is_yuv = true;
+		*input_fmt = RZG2L_YUV;
+		break;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		icnmc = ICnMC_INF_RAW8;
+		*input_fmt = RZG2L_RAW_BAYER;
 		break;
 	default:
-		*input_is_yuv = false;
 		icnmc = ICnMC_INF_USER;
+		*input_fmt = RZG2L_USER_DEFINED;
 		break;
 	}
 
@@ -327,17 +340,23 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
 static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   struct v4l2_mbus_framefmt *ip_sd_fmt)
 {
-	bool output_is_yuv = false;
-	bool input_is_yuv = false;
+	enum rzg2l_cru_fmt input_fmt, output_fmt;
 	u32 icndmr;
 
-	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt);
+	rzg2l_cru_csi2_setup(cru, &input_fmt, ip_sd_fmt);
 
 	/* Output format */
 	switch (cru->format.pixelformat) {
 	case V4L2_PIX_FMT_UYVY:
 		icndmr = ICnDMR_YCMODE_UYVY;
-		output_is_yuv = true;
+		output_fmt = RZG2L_YUV;
+		break;
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+		icndmr = 0;
+		output_fmt = RZG2L_RAW_BAYER;
 		break;
 	default:
 		dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
@@ -346,7 +365,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	}
 
 	/* If input and output use same colorspace, do bypass mode */
-	if (output_is_yuv == input_is_yuv)
+	if (input_fmt == output_fmt)
 		rzg2l_cru_write(cru, ICnMC,
 				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
 	else
@@ -809,6 +828,22 @@ static const struct v4l2_format_info rzg2l_cru_formats[] = {
 		.format = V4L2_PIX_FMT_UYVY,
 		.bpp[0] = 2,
 	},
+	{
+		.format = V4L2_PIX_FMT_SBGGR8,
+		.bpp[0] = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_SGBRG8,
+		.bpp[0] = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_SGRBG8,
+		.bpp[0] = 1,
+	},
+	{
+		.format = V4L2_PIX_FMT_SRGGB8,
+		.bpp[0] = 1,
+	},
 };
 
 const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format)
-- 
2.34.1


