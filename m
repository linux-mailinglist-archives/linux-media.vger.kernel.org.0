Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5CED60040
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 06:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbfGEEoI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 00:44:08 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:15434 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725554AbfGEEoI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jul 2019 00:44:08 -0400
X-Halon-ID: 7d22aa9f-9edf-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 7d22aa9f-9edf-11e9-8ab4-005056917a89;
        Fri, 05 Jul 2019 06:44:05 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: Centralize black listing of pixel formats
Date:   Fri,  5 Jul 2019 06:43:50 +0200
Message-Id: <20190705044350.22766-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of scattering black listing of pixel formats who are not
supported on particular platforms move it to a central location.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c  |  2 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 23 +++++++++++----------
 drivers/media/platform/rcar-vin/rcar-vin.h  |  4 +++-
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 91ab064404a185af..372d6b106b9970d2 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -794,7 +794,7 @@ static void rvin_set_slot_addr(struct rvin_dev *vin, int slot, dma_addr_t addr)
 	int offsetx, offsety;
 	dma_addr_t offset;
 
-	fmt = rvin_format_from_pixel(vin->format.pixelformat);
+	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
 
 	/*
 	 * There is no HW support for composition do the beast we can
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 0936bcd98df1f75d..04d798d8070f912c 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -56,10 +56,14 @@ static const struct rvin_video_format rvin_formats[] = {
 	},
 };
 
-const struct rvin_video_format *rvin_format_from_pixel(u32 pixelformat)
+const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
+						       u32 pixelformat)
 {
 	int i;
 
+	if (vin->info->model == RCAR_M1 && pixelformat == V4L2_PIX_FMT_XBGR32)
+		return NULL;
+
 	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++)
 		if (rvin_formats[i].fourcc == pixelformat)
 			return rvin_formats + i;
@@ -67,11 +71,12 @@ const struct rvin_video_format *rvin_format_from_pixel(u32 pixelformat)
 	return NULL;
 }
 
-static u32 rvin_format_bytesperline(struct v4l2_pix_format *pix)
+static u32 rvin_format_bytesperline(struct rvin_dev *vin,
+				    struct v4l2_pix_format *pix)
 {
 	const struct rvin_video_format *fmt;
 
-	fmt = rvin_format_from_pixel(pix->pixelformat);
+	fmt = rvin_format_from_pixel(vin, pix->pixelformat);
 
 	if (WARN_ON(!fmt))
 		return -EINVAL;
@@ -91,9 +96,7 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
 {
 	u32 walign;
 
-	if (!rvin_format_from_pixel(pix->pixelformat) ||
-	    (vin->info->model == RCAR_M1 &&
-	     pix->pixelformat == V4L2_PIX_FMT_XBGR32))
+	if (!rvin_format_from_pixel(vin, pix->pixelformat))
 		pix->pixelformat = RVIN_DEFAULT_FORMAT;
 
 	switch (pix->field) {
@@ -125,7 +128,7 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
 	v4l_bound_align_image(&pix->width, 2, vin->info->max_width, walign,
 			      &pix->height, 4, vin->info->max_height, 2, 0);
 
-	pix->bytesperline = rvin_format_bytesperline(pix);
+	pix->bytesperline = rvin_format_bytesperline(vin, pix);
 	pix->sizeimage = rvin_format_sizeimage(pix);
 
 	vin_dbg(vin, "Format %ux%u bpl: %u size: %u\n",
@@ -181,9 +184,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	if (pad_cfg == NULL)
 		return -ENOMEM;
 
-	if (!rvin_format_from_pixel(pix->pixelformat) ||
-	    (vin->info->model == RCAR_M1 &&
-	     pix->pixelformat == V4L2_PIX_FMT_XBGR32))
+	if (!rvin_format_from_pixel(vin, pix->pixelformat))
 		pix->pixelformat = RVIN_DEFAULT_FORMAT;
 
 	v4l2_fill_mbus_format(&format.format, pix, vin->mbus_code);
@@ -384,7 +385,7 @@ static int rvin_s_selection(struct file *file, void *fh,
 		while ((r.top * vin->format.bytesperline) & HW_BUFFER_MASK)
 			r.top--;
 
-		fmt = rvin_format_from_pixel(vin->format.pixelformat);
+		fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
 		while ((r.left * fmt->bpp) & HW_BUFFER_MASK)
 			r.left--;
 
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 0b13b34d03e3dce4..ac1a6fe90015ed69 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -260,7 +260,9 @@ void rvin_dma_unregister(struct rvin_dev *vin);
 int rvin_v4l2_register(struct rvin_dev *vin);
 void rvin_v4l2_unregister(struct rvin_dev *vin);
 
-const struct rvin_video_format *rvin_format_from_pixel(u32 pixelformat);
+const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
+						       u32 pixelformat);
+
 
 /* Cropping, composing and scaling */
 void rvin_crop_scale_comp(struct rvin_dev *vin);
-- 
2.21.0

