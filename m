Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4AFAD58F1
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 02:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729504AbfJNAQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 20:16:31 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:30336 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729359AbfJNAQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 20:16:31 -0400
X-Halon-ID: af99f8c2-ee17-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id af99f8c2-ee17-11e9-837a-0050569116f7;
        Mon, 14 Oct 2019 02:15:12 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 2/2] rcar-vin: Add support for outputting NV12
Date:   Mon, 14 Oct 2019 02:16:15 +0200
Message-Id: <20191014001615.2865301-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014001615.2865301-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191014001615.2865301-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most Gen3 boards can output frames in NV12 format, add support for this
with a runtime check that the running hardware supports it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/media/platform/rcar-vin/rcar-dma.c  |  5 ++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 39 +++++++++++++++++----
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index af4f774149f08597..cf9029efeb0450cb 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -118,6 +118,7 @@
 #define VNDMR_ABIT		(1 << 2)
 #define VNDMR_DTMD_YCSEP	(1 << 1)
 #define VNDMR_DTMD_ARGB		(1 << 0)
+#define VNDMR_DTMD_YCSEP_420	(3 << 0)
 
 /* Video n Data Mode Register 2 bits */
 #define VNDMR2_VPS		(1 << 30)
@@ -701,11 +702,13 @@ static int rvin_setup(struct rvin_dev *vin)
 	 * Output format
 	 */
 	switch (vin->format.pixelformat) {
+	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV16:
 		rvin_write(vin,
 			   ALIGN(vin->format.bytesperline * vin->format.height,
 				 0x80), VNUVAOF_REG);
-		dmr = VNDMR_DTMD_YCSEP;
+		dmr = vin->format.pixelformat == V4L2_PIX_FMT_NV12 ?
+			VNDMR_DTMD_YCSEP_420 : VNDMR_DTMD_YCSEP;
 		output_is_yuv = true;
 		break;
 	case V4L2_PIX_FMT_YUYV:
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 13b7cd5d2e40415a..9e2e63ffcc47acad 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -30,6 +30,10 @@
  */
 
 static const struct rvin_video_format rvin_formats[] = {
+	{
+		.fourcc			= V4L2_PIX_FMT_NV12,
+		.bpp			= 1,
+	},
 	{
 		.fourcc			= V4L2_PIX_FMT_NV16,
 		.bpp			= 1,
@@ -72,6 +76,9 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
 	if (vin->info->model == RCAR_M1 && pixelformat == V4L2_PIX_FMT_XBGR32)
 		return NULL;
 
+	if (pixelformat == V4L2_PIX_FMT_NV12 && !vin->info->nv12)
+		return NULL;
+
 	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++)
 		if (rvin_formats[i].fourcc == pixelformat)
 			return rvin_formats + i;
@@ -90,17 +97,29 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
 	if (WARN_ON(!fmt))
 		return -EINVAL;
 
-	align = pix->pixelformat == V4L2_PIX_FMT_NV16 ? 0x20 : 0x10;
+	switch (pix->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV16:
+		align = 0x20;
+		break;
+	default:
+		align = 0x10;
+		break;
+	}
 
 	return ALIGN(pix->width, align) * fmt->bpp;
 }
 
 static u32 rvin_format_sizeimage(struct v4l2_pix_format *pix)
 {
-	if (pix->pixelformat == V4L2_PIX_FMT_NV16)
+	switch (pix->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		return pix->bytesperline * pix->height * 3 / 2;
+	case V4L2_PIX_FMT_NV16:
 		return pix->bytesperline * pix->height * 2;
-
-	return pix->bytesperline * pix->height;
+	default:
+		return pix->bytesperline * pix->height;
+	}
 }
 
 static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
@@ -124,8 +143,16 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
 		break;
 	}
 
-	/* HW limit width to a multiple of 32 (2^5) for NV16 else 2 (2^1) */
-	walign = vin->format.pixelformat == V4L2_PIX_FMT_NV16 ? 5 : 1;
+	/* HW limit width to a multiple of 32 (2^5) for NV12/16 else 2 (2^1) */
+	switch (vin->format.pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV16:
+		walign = 5;
+		break;
+	default:
+		walign = 1;
+		break;
+	}
 
 	/* Limit to VIN capabilities */
 	v4l_bound_align_image(&pix->width, 2, vin->info->max_width, walign,
-- 
2.23.0

