Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16462859A4
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 07:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730859AbfHHFLH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 01:11:07 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:18703 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728090AbfHHFLH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 01:11:07 -0400
X-Halon-ID: e8c83743-b99a-11e9-903a-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id e8c83743-b99a-11e9-903a-005056917f90;
        Thu, 08 Aug 2019 07:11:02 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: Report correct image stride
Date:   Thu,  8 Aug 2019 07:10:58 +0200
Message-Id: <20190808051058.3210-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The image stride was adjusted when it was written to hardware and not
when configuring the format. Calculate the correct stride value and
report it to userspace.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c  | 10 ++++++----
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  5 ++++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index f16f2966f9628b72..3cb29b2e0b2b18a9 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -577,6 +577,9 @@ static void rvin_crop_scale_comp_gen2(struct rvin_dev *vin)
 
 void rvin_crop_scale_comp(struct rvin_dev *vin)
 {
+	const struct rvin_video_format *fmt;
+	u32 stride;
+
 	/* Set Start/End Pixel/Line Pre-Clip */
 	rvin_write(vin, vin->crop.left, VNSPPRC_REG);
 	rvin_write(vin, vin->crop.left + vin->crop.width - 1, VNEPPRC_REG);
@@ -600,10 +603,9 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 	if (vin->info->model != RCAR_GEN3)
 		rvin_crop_scale_comp_gen2(vin);
 
-	if (vin->format.pixelformat == V4L2_PIX_FMT_NV16)
-		rvin_write(vin, ALIGN(vin->format.width, 0x20), VNIS_REG);
-	else
-		rvin_write(vin, ALIGN(vin->format.width, 0x10), VNIS_REG);
+	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
+	stride = vin->format.bytesperline / fmt->bpp;
+	rvin_write(vin, stride, VNIS_REG);
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index cfed0a2604133849..cbc1c07f0a9631a4 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -83,13 +83,16 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
 				    struct v4l2_pix_format *pix)
 {
 	const struct rvin_video_format *fmt;
+	u32 align;
 
 	fmt = rvin_format_from_pixel(vin, pix->pixelformat);
 
 	if (WARN_ON(!fmt))
 		return -EINVAL;
 
-	return pix->width * fmt->bpp;
+	align = pix->pixelformat == V4L2_PIX_FMT_NV16 ? 0x20 : 0x10;
+
+	return ALIGN(pix->width, align) * fmt->bpp;
 }
 
 static u32 rvin_format_sizeimage(struct v4l2_pix_format *pix)
-- 
2.22.0

