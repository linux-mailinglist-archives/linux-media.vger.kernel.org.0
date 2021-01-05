Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA952EAE5A
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbhAEPbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:31:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbhAEPbL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:31:11 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 441DC8AD;
        Tue,  5 Jan 2021 16:29:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860580;
        bh=PRrKw8h7EbeoHZKsHr3iblkqk1/XntCO9c55lkbMPu8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J7jbIhlZx+ekL1IddHLj+KDphKoaXgIbMXkcRDuSiD6mmZEyQLDXFBekrsHPTevuq
         xy0+8wB+MWQFdA6pL79Bm1eb2Vw+aVTN6iDx9JXgrnjp3rnJJPm3c8/jCH4glAqlyw
         afZsnilv4bAf4+5zAmvxtDFdSnW+aiBRo7MyrQwY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 06/75] media: imx: Set default sizes through macros in all drivers
Date:   Tue,  5 Jan 2021 17:27:43 +0200
Message-Id: <20210105152852.5733-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All drivers use 640x480 as the default size, but they all hardcode those
values. Create two global macros named IMX_MEDIA_DEF_PIX_WIDTH and
IMX_MEDIA_DEF_PIX_HEIGHT to store the default size, and use them through
the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-ic-prp.c      |  4 +++-
 drivers/staging/media/imx/imx-ic-prpencvf.c |  5 +++--
 drivers/staging/media/imx/imx-media-csi.c   | 13 +++++++------
 drivers/staging/media/imx/imx-media-vdic.c  |  5 +++--
 drivers/staging/media/imx/imx-media.h       |  3 +++
 drivers/staging/media/imx/imx6-mipi-csi2.c  |  4 +++-
 6 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 5b09e11b1a0e..f21ed881295f 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -442,7 +442,9 @@ static int prp_registered(struct v4l2_subdev *sd)
 	/* set a default mbus format  */
 	imx_media_enum_ipu_formats(&code, 0, PIXFMT_SEL_YUV);
 
-	return imx_media_init_mbus_fmt(&priv->format_mbus, 640, 480, code,
+	return imx_media_init_mbus_fmt(&priv->format_mbus,
+				       IMX_MEDIA_DEF_PIX_WIDTH,
+				       IMX_MEDIA_DEF_PIX_HEIGHT, code,
 				       V4L2_FIELD_NONE, NULL);
 }
 
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 74f5de466d5d..47df1a5a1ae8 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1255,8 +1255,9 @@ static int prp_registered(struct v4l2_subdev *sd)
 
 	for (i = 0; i < PRPENCVF_NUM_PADS; i++) {
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
-					      640, 480, code, V4L2_FIELD_NONE,
-					      &priv->cc[i]);
+					      IMX_MEDIA_DEF_PIX_WIDTH,
+					      IMX_MEDIA_DEF_PIX_HEIGHT, code,
+					      V4L2_FIELD_NONE, &priv->cc[i]);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 21ebf7769696..434866d28bfd 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1766,8 +1766,9 @@ static int csi_registered(struct v4l2_subdev *sd)
 
 		/* set a default mbus format  */
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
-					      640, 480, code, V4L2_FIELD_NONE,
-					      &priv->cc[i]);
+					      IMX_MEDIA_DEF_PIX_WIDTH,
+					      IMX_MEDIA_DEF_PIX_HEIGHT, code,
+					      V4L2_FIELD_NONE, &priv->cc[i]);
 		if (ret)
 			goto put_csi;
 
@@ -1780,10 +1781,10 @@ static int csi_registered(struct v4l2_subdev *sd)
 	priv->skip = &csi_skip[0];
 
 	/* init default crop and compose rectangle sizes */
-	priv->crop.width = 640;
-	priv->crop.height = 480;
-	priv->compose.width = 640;
-	priv->compose.height = 480;
+	priv->crop.width = IMX_MEDIA_DEF_PIX_WIDTH;
+	priv->crop.height = IMX_MEDIA_DEF_PIX_HEIGHT;
+	priv->compose.width = IMX_MEDIA_DEF_PIX_WIDTH;
+	priv->compose.height = IMX_MEDIA_DEF_PIX_HEIGHT;
 
 	priv->fim = imx_media_fim_init(&priv->sd);
 	if (IS_ERR(priv->fim)) {
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 879329f81f79..395b850736fa 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -856,8 +856,9 @@ static int vdic_registered(struct v4l2_subdev *sd)
 
 		/* set a default mbus format  */
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
-					      640, 480, code, V4L2_FIELD_NONE,
-					      &priv->cc[i]);
+					      IMX_MEDIA_DEF_PIX_WIDTH,
+					      IMX_MEDIA_DEF_PIX_HEIGHT, code,
+					      V4L2_FIELD_NONE, &priv->cc[i]);
 		if (ret)
 			return ret;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index f17135158029..5b904c3448a0 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -15,6 +15,9 @@
 #include <media/videobuf2-dma-contig.h>
 #include <video/imx-ipu-v3.h>
 
+#define IMX_MEDIA_DEF_PIX_WIDTH		640
+#define IMX_MEDIA_DEF_PIX_HEIGHT	480
+
 /*
  * Enumeration of the IPU internal sub-devices
  */
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 94d87d27d389..d12b57a5d222 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -510,7 +510,9 @@ static int csi2_registered(struct v4l2_subdev *sd)
 
 	/* set a default mbus format  */
 	return imx_media_init_mbus_fmt(&csi2->format_mbus,
-				      640, 480, 0, V4L2_FIELD_NONE, NULL);
+				      IMX_MEDIA_DEF_PIX_WIDTH,
+				      IMX_MEDIA_DEF_PIX_HEIGHT, 0,
+				      V4L2_FIELD_NONE, NULL);
 }
 
 static const struct media_entity_operations csi2_entity_ops = {
-- 
Regards,

Laurent Pinchart

