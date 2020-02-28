Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7A6173D89
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 17:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbgB1QuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 11:50:21 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53927 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgB1QuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 11:50:21 -0500
Received: by mail-wm1-f67.google.com with SMTP id f15so3877701wml.3;
        Fri, 28 Feb 2020 08:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mJfep6qc886uMsHNXGk5tdCaaGsgVZaFquG8wUujrTU=;
        b=M7o1rhsKRaoCUa6UfX/eBXACh55wtTqyZLZ9mEwBsBGISJXKo7Udn31O/aMXoHBFrJ
         +nWtGdpR2UCD5BT4cgxPGWkmSjTKIWbi0dzxYgdJJCIOUJYXGpBUuOW/a/JD1ghd9ZJ4
         fTzKvURpInk/axfmapQpQjKuLYHEaCItxdjXxaFv+9YApQN1gREbAJ9fdta904aeB6kd
         o9iyowDOrMPkZhalz2OZ2nnTpY0bvYk5vSZHHJW/CNz6U+2EAJ18XyczIwyxbUj0s9jq
         c/kz8K/i7KwSDeAAx2qoJVUYpgQD3OfQhJb8Bssf3Dv01ISOt/IaDa0X9y1z+osv4o+e
         lflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mJfep6qc886uMsHNXGk5tdCaaGsgVZaFquG8wUujrTU=;
        b=FmDBj4KRVi/vYjkfyiXJcV1w+VteDkqnKmm3HaqLAylC3PSKOevxhmHU+SD+5j9VUC
         d8m7VBQw7mMtPI4qNDL30MlAzXj01+SrzQCSZhxH7GGqtmML6ye9KTXmI6o56JIrd48n
         EWOhEWKDfoluZNg2ec6G4SsR4IZDzw1x/yVmm/p8OrifU+axWFd1J/5Jnr3idF4BlJpD
         iSnTi6fobvCdGlqcs/ou2iAl6wK3s8axpNkty4huIhsKtA/QVuFbcAC2GVfb6pTkLB8h
         NgA+RwQocRJtQCEGCzss8LoxUAWazLzojrpS1fhCAc03HTfVjSt/qIf1kJgl5UKmy2Hj
         zSVw==
X-Gm-Message-State: APjAAAUYqZD5CZA7SLEYAQ8X2r8/QbA3gQvi+h+f/HElos9S1+t5pHBa
        +Hx2D+QpbXGSnRQJHWp0Ilw=
X-Google-Smtp-Source: APXvYqysdmqkNy66Xr05Ml5WtI6Ku5rfT+oBrLozxXln9ZSQ9aRy2MFfskf2BZexP7XjsL6GUsAT3Q==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr5565466wmk.172.1582908618166;
        Fri, 28 Feb 2020 08:50:18 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2510:d000:3855:fd13:6b76:a11b])
        by smtp.gmail.com with ESMTPSA id h2sm13263408wrt.45.2020.02.28.08.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 08:50:17 -0800 (PST)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] media: rcar-vin: Add support for SRGGB8_1X8
Date:   Fri, 28 Feb 2020 16:50:11 +0000
Message-Id: <20200228165011.17898-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228165011.17898-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200228165011.17898-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most of the RZ/G2x boards can support capturing frames in SRGGB8_1X8
format, add support for this with a runtime check that the running
hardware supports it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c |  1 +
 drivers/media/platform/rcar-vin/rcar-csi2.c |  1 +
 drivers/media/platform/rcar-vin/rcar-dma.c  | 14 ++++++++++++--
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
 4 files changed, 18 insertions(+), 2 deletions(-)

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
diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 5b04e4768eb1..97e4886f63f0 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -320,6 +320,7 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
 	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .bpp = 16 },
 	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .bpp = 16 },
 	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype = 0x2a, .bpp = 8 },
 };
 
 static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 1a30cd036371..63709b4bbf7a 100644
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
@@ -587,13 +588,15 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 	rvin_write(vin, vin->crop.top, VNSLPRC_REG);
 	rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
 
-
 	/* TODO: Add support for the UDS scaler. */
 	if (vin->info->model != RCAR_GEN3)
 		rvin_crop_scale_comp_gen2(vin);
 
 	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
-	stride = vin->format.bytesperline / fmt->bpp;
+	if (vin->format.pixelformat == V4L2_PIX_FMT_SRGGB8)
+		stride = ALIGN(vin->format.bytesperline / 2, 0x10);
+	else
+		stride = vin->format.bytesperline / fmt->bpp;
 	rvin_write(vin, stride, VNIS_REG);
 }
 
@@ -676,6 +679,9 @@ static int rvin_setup(struct rvin_dev *vin)
 
 		input_is_yuv = true;
 		break;
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		vnmc |= VNMC_INF_RAW8;
+		break;
 	default:
 		break;
 	}
@@ -737,6 +743,9 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_PIX_FMT_ABGR32:
 		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
 		break;
+	case V4L2_PIX_FMT_SRGGB8:
+		dmr = 0;
+		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
 			vin->format.pixelformat);
@@ -1110,6 +1119,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 	case MEDIA_BUS_FMT_UYVY10_2X10:
 	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
 		vin->mbus_code = fmt.format.code;
 		break;
 	default:
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index b12b3f88836a..d56cf85ba065 100644
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

