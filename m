Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D183718A124
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 18:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgCRRGu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 13:06:50 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35002 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgCRRGu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 13:06:50 -0400
Received: by mail-wm1-f68.google.com with SMTP id m3so4253814wmi.0;
        Wed, 18 Mar 2020 10:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AKG+GN0tLvAbfU9WEgK4/H/mkkbxaZC0ozS15O6wNtE=;
        b=YIPZRkUXsdgS+wOeeeEIhYRJ1WIMuj1srlJEN2cDWXvCBqcB/P+AoxdAAusmAlEEpS
         0l//KkDKGCtGuz7K9wIdcaU8QoiHZtQQ12qz5xjQpi2veoxKO6QQ06u7Jr85lDrlDYQE
         oT+uhkbgd7fm5MR6Pg030opdLJUzpRknYB2kaDLpWzm5kDjkNLxIQkHHqsN7iKPf1SIL
         pYHS39xm1BEn1LZq0uSmeyViXq/50wXyk1ZLt6yBg0u+Aeean++c8gJsPxPA1hfam9pb
         A16UD2IA9CXe7gdCnf7lpA57F5HgBPBcQ46m2f/4t/GKm3gvYmyFI4sTYdLm5R8Fq+zQ
         w1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AKG+GN0tLvAbfU9WEgK4/H/mkkbxaZC0ozS15O6wNtE=;
        b=RL5ow5xGUPLXhMKuGH0lUBTM8mKs6ZCz6oXY0kFIX5EMGJlUkWovJksGRIWhHOp7hZ
         HZPMcMOxXM1M8YRQhh2sBFPvSUysQ2+vwYdl+ZCZpVx7tMQYdV09tor4NQP3jbzMdBvc
         tL1fOHWdXGPr8ap4jdQdK3KCkcMLtEQBZArQU6aJ8miVuZH3XYCuXxMdJSOBbnQbMn0R
         B4eRzwpMCqCOdQUjXH/HWE26VHxSGrM4gMjttfZK0Y0GrF025uMf3NB4la8axEUENxyf
         WEEKzlm0/HgvgPzeSWO+gd3skFU+e+HTioWNGp7uW/RzMU4RUDA1IQOb3Ay3dy7VuhKP
         MLSw==
X-Gm-Message-State: ANhLgQ125rWM+SBxBsxYOzdpKlwAnFy90P+l9CQh6DY0NIKon0DgIxDv
        oKMZeAsMOLIBk9VQXiN14qQ=
X-Google-Smtp-Source: ADFU+vudGxo86o2fdiefNN+SeCWNfJvzwl3Tima8DV/uunucbqnsvijIdK0bYFXd7j9Fbpa9ZZrr0g==
X-Received: by 2002:a7b:c08a:: with SMTP id r10mr6062488wmh.130.1584551208080;
        Wed, 18 Mar 2020 10:06:48 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2510:d000:caa:1f1f:ffe5:ef76])
        by smtp.gmail.com with ESMTPSA id k5sm4661283wmj.18.2020.03.18.10.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:06:45 -0700 (PDT)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/2] media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
Date:   Wed, 18 Mar 2020 17:06:37 +0000
Message-Id: <20200318170638.18562-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318170638.18562-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200318170638.18562-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format in rcar-vin by setting
format type to RAW8 in VNMC register and appropriately setting the
bpp, bytesperline to enable V4L2_PIX_FMT_SRGGB8.
For RAW8 format data is transferred by 4-Byte unit so VnIS register is
configured accordingly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c |  1 +
 drivers/media/platform/rcar-vin/rcar-dma.c  | 11 ++++++++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c8965d27..76daf2fe5bcd 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -469,6 +469,7 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 		case MEDIA_BUS_FMT_UYVY8_2X8:
 		case MEDIA_BUS_FMT_UYVY10_2X10:
 		case MEDIA_BUS_FMT_RGB888_1X24:
+		case MEDIA_BUS_FMT_SRGGB8_1X8:
 			vin->mbus_code = code.code;
 			vin_dbg(vin, "Found media bus format for %s: %d\n",
 				subdev->name, vin->mbus_code);
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 1a30cd036371..ec7b49c0b281 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -85,6 +85,7 @@
 #define VNMC_INF_YUV8_BT601	(1 << 16)
 #define VNMC_INF_YUV10_BT656	(2 << 16)
 #define VNMC_INF_YUV10_BT601	(3 << 16)
+#define VNMC_INF_RAW8		(4 << 16)
 #define VNMC_INF_YUV16		(5 << 16)
 #define VNMC_INF_RGB888		(6 << 16)
 #define VNMC_VUP		(1 << 10)
@@ -587,13 +588,14 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 	rvin_write(vin, vin->crop.top, VNSLPRC_REG);
 	rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
 
-
 	/* TODO: Add support for the UDS scaler. */
 	if (vin->info->model != RCAR_GEN3)
 		rvin_crop_scale_comp_gen2(vin);
 
 	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
 	stride = vin->format.bytesperline / fmt->bpp;
+	if (vin->format.pixelformat == V4L2_PIX_FMT_SRGGB8)
+		stride /= 2;
 	rvin_write(vin, stride, VNIS_REG);
 }
 
@@ -676,6 +678,9 @@ static int rvin_setup(struct rvin_dev *vin)
 
 		input_is_yuv = true;
 		break;
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		vnmc |= VNMC_INF_RAW8;
+		break;
 	default:
 		break;
 	}
@@ -737,6 +742,9 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_PIX_FMT_ABGR32:
 		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
 		break;
+	case V4L2_PIX_FMT_SRGGB8:
+		dmr = 0;
+		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
 			vin->format.pixelformat);
@@ -1110,6 +1118,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 	case MEDIA_BUS_FMT_UYVY10_2X10:
 	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
 		vin->mbus_code = fmt.format.code;
 		break;
 	default:
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 5151a3cd8a6e..ca542219e8ae 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -66,6 +66,10 @@ static const struct rvin_video_format rvin_formats[] = {
 		.fourcc			= V4L2_PIX_FMT_ABGR32,
 		.bpp			= 4,
 	},
+	{
+		.fourcc			= V4L2_PIX_FMT_SRGGB8,
+		.bpp			= 1,
+	},
 };
 
 const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
-- 
2.20.1

