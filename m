Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E7E26B365
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 01:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgIOXCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 19:02:25 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:19243 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727465AbgIOXCR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 19:02:17 -0400
X-Halon-ID: 79bb749e-f7a7-11ea-92dc-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 79bb749e-f7a7-11ea-92dc-005056917a89;
        Wed, 16 Sep 2020 01:02:06 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] rcar-vin: Extend RAW8 support to all RGB layouts
Date:   Wed, 16 Sep 2020 01:01:40 +0200
Message-Id: <20200915230140.1201187-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915230140.1201187-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200915230140.1201187-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Extend the list of supported formats to include all RGB layouts of RAW8.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c  | 28 ++++++++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 27 ++++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index a5dbb90c5210bae7..7f8997536aba6f0b 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -598,8 +598,16 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 	/* For RAW8 format bpp is 1, but the hardware process RAW8
 	 * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
 	 */
-	if (vin->format.pixelformat == V4L2_PIX_FMT_SRGGB8)
+	switch (vin->format.pixelformat) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
 		stride /= 2;
+		break;
+	default:
+		break;
+	}
 
 	rvin_write(vin, stride, VNIS_REG);
 }
@@ -683,6 +691,9 @@ static int rvin_setup(struct rvin_dev *vin)
 
 		input_is_yuv = true;
 		break;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 		vnmc |= VNMC_INF_RAW8;
 		break;
@@ -747,6 +758,9 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_PIX_FMT_ABGR32:
 		dmr = VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
 		break;
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
 	case V4L2_PIX_FMT_SRGGB8:
 		dmr = 0;
 		break;
@@ -1124,6 +1138,18 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 	case MEDIA_BUS_FMT_UYVY10_2X10:
 	case MEDIA_BUS_FMT_RGB888_1X24:
 		break;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		if (vin->format.pixelformat != V4L2_PIX_FMT_SBGGR8)
+			return -EPIPE;
+		break;
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+		if (vin->format.pixelformat != V4L2_PIX_FMT_SGBRG8)
+			return -EPIPE;
+		break;
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+		if (vin->format.pixelformat != V4L2_PIX_FMT_SGRBG8)
+			return -EPIPE;
+		break;
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 		if (vin->format.pixelformat != V4L2_PIX_FMT_SRGGB8)
 			return -EPIPE;
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 0e066bba747e0b73..4071d9bd554ab88f 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -66,6 +66,18 @@ static const struct rvin_video_format rvin_formats[] = {
 		.fourcc			= V4L2_PIX_FMT_ABGR32,
 		.bpp			= 4,
 	},
+	{
+		.fourcc			= V4L2_PIX_FMT_SBGGR8,
+		.bpp			= 1,
+	},
+	{
+		.fourcc			= V4L2_PIX_FMT_SGBRG8,
+		.bpp			= 1,
+	},
+	{
+		.fourcc			= V4L2_PIX_FMT_SGRBG8,
+		.bpp			= 1,
+	},
 	{
 		.fourcc			= V4L2_PIX_FMT_SRGGB8,
 		.bpp			= 1,
@@ -366,6 +378,21 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 	case MEDIA_BUS_FMT_UYVY10_2X10:
 	case MEDIA_BUS_FMT_RGB888_1X24:
 		break;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		if (f->index)
+			return -EINVAL;
+		f->pixelformat = V4L2_PIX_FMT_SBGGR8;
+		return 0;
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+		if (f->index)
+			return -EINVAL;
+		f->pixelformat = V4L2_PIX_FMT_SGBRG8;
+		return 0;
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+		if (f->index)
+			return -EINVAL;
+		f->pixelformat = V4L2_PIX_FMT_SGRBG8;
+		return 0;
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 		if (f->index)
 			return -EINVAL;
-- 
2.28.0

