Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACD617F5AF
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 12:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgCJLGt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 07:06:49 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:25631 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726211AbgCJLGt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 07:06:49 -0400
X-IronPort-AV: E=Sophos;i="5.70,536,1574089200"; 
   d="scan'208";a="41493399"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Mar 2020 20:06:48 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6F937420C2EE;
        Tue, 10 Mar 2020 20:06:46 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/3] media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
Date:   Tue, 10 Mar 2020 11:06:03 +0000
Message-Id: <1583838364-12932-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format in rcar-vin by setting
format type to RAW8 in VNMC register and appropriately setting the
bpp, bytesperline to enable V4L2_PIX_FMT_SRGGB8.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c |  1 +
 drivers/media/platform/rcar-vin/rcar-dma.c  |  9 ++++++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 13 ++++++++++++-
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c89..76daf2f 100644
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
index 1a30cd0..1c1fafa 100644
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
@@ -587,7 +588,6 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 	rvin_write(vin, vin->crop.top, VNSLPRC_REG);
 	rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
 
-
 	/* TODO: Add support for the UDS scaler. */
 	if (vin->info->model != RCAR_GEN3)
 		rvin_crop_scale_comp_gen2(vin);
@@ -676,6 +676,9 @@ static int rvin_setup(struct rvin_dev *vin)
 
 		input_is_yuv = true;
 		break;
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		vnmc |= VNMC_INF_RAW8;
+		break;
 	default:
 		break;
 	}
@@ -737,6 +740,9 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_PIX_FMT_ABGR32:
 		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
 		break;
+	case V4L2_PIX_FMT_SRGGB8:
+		dmr = 0;
+		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
 			vin->format.pixelformat);
@@ -1110,6 +1116,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 	case MEDIA_BUS_FMT_UYVY10_2X10:
 	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
 		vin->mbus_code = fmt.format.code;
 		break;
 	default:
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 5151a3c..4698099 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -66,6 +66,10 @@ static const struct rvin_video_format rvin_formats[] = {
 		.fourcc			= V4L2_PIX_FMT_ABGR32,
 		.bpp			= 4,
 	},
+	{
+		.fourcc			= V4L2_PIX_FMT_SRGGB8,
+		.bpp			= 2,
+	},
 };
 
 const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
@@ -102,6 +106,7 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
 {
 	const struct rvin_video_format *fmt;
 	u32 align;
+	u8 div;
 
 	fmt = rvin_format_from_pixel(vin, pix->pixelformat);
 
@@ -112,16 +117,22 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV16:
 		align = 0x20;
+		div = 1;
+		break;
+	case V4L2_PIX_FMT_SRGGB8:
+		align = 0x10;
+		div = 2;
 		break;
 	default:
 		align = 0x10;
+		div = 1;
 		break;
 	}
 
 	if (V4L2_FIELD_IS_SEQUENTIAL(pix->field))
 		align = 0x80;
 
-	return ALIGN(pix->width, align) * fmt->bpp;
+	return ALIGN(pix->width / div, align) * fmt->bpp;
 }
 
 static u32 rvin_format_sizeimage(struct v4l2_pix_format *pix)
-- 
2.7.4

