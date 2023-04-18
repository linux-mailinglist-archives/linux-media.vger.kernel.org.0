Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6E46E6119
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 14:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbjDRMUy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 08:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjDRMUu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 08:20:50 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09C5C2
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 05:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681820449; x=1713356449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yqtw1gSjX/Af8g3HdWuO5BZ7Xg3V/5xF83DiiRqFiDU=;
  b=n0PHTpCj7FnoVHLQ3A4hLwruY4pFpeVGFcpmm9VKVtOUagqBCytDt5Eq
   jqvMZgdxrcyxK3t76oS5BQhfSdMqbVez+DxNvUwolqyzoaw+PvRgSLY88
   aZQWsEr0ZNGHE3YviLJ3gPsi8Lg3hlZjLrWJyiq8OYgveRb9YrSAoI1m4
   ry9GrliFsSVAI8pNrJIVbjs93jLf5FMW7QA1yv869zF8wc7UHTc6CcWKK
   he3DXfzrG9Qo6fu6kc+XQpriXHIQBRe3aHJ7asTpwQyjHpAlixJTnMI6V
   Z8DZHWNAtQSkCaLCm4g/HimgBcI5IefD4SoulVwepDvz+BjWfO1zBfW3E
   w==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398478"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Apr 2023 14:20:45 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Apr 2023 14:20:45 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Apr 2023 14:20:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681820445; x=1713356445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yqtw1gSjX/Af8g3HdWuO5BZ7Xg3V/5xF83DiiRqFiDU=;
  b=Hyu8E5JsBsewzdvfvhsfeKkU3XcIKeJ248iPeaT0VLw2/fD+vox2Z3OV
   iKzUodHYrulXA+Je8kjRg8eD/CweP95Xi2jqxw5lmz3OnxbFWRuIyWiJc
   ZDdcAiEaMcf4fyRh5G8PgCXlrElWrVfuZwQEhAnr23LOI+U6JmTUrcN00
   IPCUbqtIiFrt43iTRgGI6YURVYMMkCaosICJEoPv2CDiWHwaJMRDWqTbo
   z8GmVSg8ZqBxjfj3ZW3nbIpH5iUrTzYXxGbwfhGmvwV+DE5ON58y/NBkE
   yEsheFnk8PGsOwQI+SdoCO2zlHVyIhiVhZxMPNS0I+4LDu3lD2x4TvEYr
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398476"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 14:20:45 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1564A280075;
        Tue, 18 Apr 2023 14:20:45 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 4/4] media: imx: imx7-media-csi: Init default format with __imx7_csi_video_try_fmt()
Date:   Tue, 18 Apr 2023 14:20:41 +0200
Message-Id: <20230418122041.1318862-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418122041.1318862-1-alexander.stein@ew.tq-group.com>
References: <20230418122041.1318862-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Use the __imx7_csi_video_try_fmt() helper function to initialize the
default format at probe time. This improves consistency by using the
same code path for both default initialization and validation at
runtime, and allows dropping the now unused imx7_csi_find_pixel_format()
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* New in v3

 drivers/media/platform/nxp/imx7-media-csi.c | 55 +++------------------
 1 file changed, 6 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 730c9c57bf4bc..b5c8c951eac49 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1014,39 +1014,6 @@ static int imx7_csi_enum_mbus_formats(u32 *code, u32 index)
 	return -EINVAL;
 }
 
-static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-					const struct v4l2_mbus_framefmt *mbus,
-					const struct imx7_csi_pixfmt *cc)
-{
-	u32 width;
-	u32 stride;
-
-	if (!cc) {
-		cc = imx7_csi_find_mbus_format(mbus->code);
-		if (!cc)
-			return -EINVAL;
-	}
-
-	/* Round up width for minimum burst size */
-	width = round_up(mbus->width, 8);
-
-	/* Round up stride for IDMAC line start address alignment */
-	stride = round_up((width * cc->bpp) >> 3, 8);
-
-	pix->width = width;
-	pix->height = mbus->height;
-	pix->pixelformat = cc->fourcc;
-	pix->colorspace = mbus->colorspace;
-	pix->xfer_func = mbus->xfer_func;
-	pix->ycbcr_enc = mbus->ycbcr_enc;
-	pix->quantization = mbus->quantization;
-	pix->field = mbus->field;
-	pix->bytesperline = stride;
-	pix->sizeimage = stride * pix->height;
-
-	return 0;
-}
-
 /* -----------------------------------------------------------------------------
  * Video Capture Device - IOCTLs
  */
@@ -1608,22 +1575,14 @@ static struct imx7_csi_vb2_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi)
 	return buf;
 }
 
-static int imx7_csi_video_init_format(struct imx7_csi *csi)
+static void imx7_csi_video_init_format(struct imx7_csi *csi)
 {
-	struct v4l2_mbus_framefmt format = { };
-
-	format.code = IMX7_CSI_DEF_MBUS_CODE;
-	format.width = IMX7_CSI_DEF_PIX_WIDTH;
-	format.height = IMX7_CSI_DEF_PIX_HEIGHT;
-	format.field = V4L2_FIELD_NONE;
+	struct v4l2_pix_format *pixfmt = &csi->vdev_fmt;
 
-	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
-	csi->vdev_compose.width = format.width;
-	csi->vdev_compose.height = format.height;
+	pixfmt->width = IMX7_CSI_DEF_PIX_WIDTH;
+	pixfmt->height = IMX7_CSI_DEF_PIX_HEIGHT;
 
-	csi->vdev_cc = imx7_csi_find_pixel_format(csi->vdev_fmt.pixelformat);
-
-	return 0;
+	csi->vdev_cc = __imx7_csi_video_try_fmt(pixfmt, &csi->vdev_compose);
 }
 
 static int imx7_csi_video_register(struct imx7_csi *csi)
@@ -1636,9 +1595,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
 	vdev->v4l2_dev = v4l2_dev;
 
 	/* Initialize the default format and compose rectangle. */
-	ret = imx7_csi_video_init_format(csi);
-	if (ret < 0)
-		return ret;
+	imx7_csi_video_init_format(csi);
 
 	/* Register the video device. */
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
-- 
2.34.1

