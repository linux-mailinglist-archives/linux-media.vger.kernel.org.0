Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FF631B48A
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhBOE3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:29:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45318 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhBOE3f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:29:35 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A39901644;
        Mon, 15 Feb 2021 05:28:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363295;
        bh=6clLBIoDYl0GcZbPxrdwEhAxt07A3I/8d8DktzqaR5Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tpe5IC3VW0MbzYM+YssdH7GRzOIm8m8tE4BTvSiCIeqnQLvCBW3qPEoqCvgiTX1z0
         EbWMPLFUmIz1fxHoKlVDAGjdiXv29amwQE/YEdErq4tRP+RJJae8r0uODG0oZC9d8k
         seb+dTEx0qwsLgpgLzYRxnqzUM4tHKOUUshLjDkM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 05/77] media: imx: Set default sizes through macros in all drivers
Date:   Mon, 15 Feb 2021 06:26:29 +0200
Message-Id: <20210215042741.28850-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
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
index ef5add079774..b9d3f98a2c8f 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1758,8 +1758,9 @@ static int csi_registered(struct v4l2_subdev *sd)
 
 		/* set a default mbus format  */
 		ret = imx_media_init_mbus_fmt(&priv->format_mbus[i],
-					      640, 480, code, V4L2_FIELD_NONE,
-					      &priv->cc[i]);
+					      IMX_MEDIA_DEF_PIX_WIDTH,
+					      IMX_MEDIA_DEF_PIX_HEIGHT, code,
+					      V4L2_FIELD_NONE, &priv->cc[i]);
 		if (ret)
 			goto put_csi;
 
@@ -1772,10 +1773,10 @@ static int csi_registered(struct v4l2_subdev *sd)
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
index c8b6a43d0d7c..1abb9bb88c12 100644
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
index 4f8fcc91aaae..9020541edb89 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -571,7 +571,9 @@ static int csi2_registered(struct v4l2_subdev *sd)
 
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

