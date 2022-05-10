Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB126521486
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241499AbiEJMEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241484AbiEJMD7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54EA5131E
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:02 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33DA621C3;
        Tue, 10 May 2022 13:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183982;
        bh=B6WanzxxZOvDy0QJchsYwXbrY8qfDYztQWKS2dM7214=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fI3sMoXzX4X0+qvSmW9WK+nzfZtBoBk3th1GlDI++8KQn7V0zIogemptiEjYSeUNp
         DmvaUhucaCTZ/PkzG5VmqOY0nak15DD1jtX8G/9AwumBRU8ChVbdhVGhQshsnHKZyi
         +uGsfYoN6Dl4EqoSZebg1+ASaZFOMVK+reYeDKik=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 38/50] staging: media: imx: imx7-media-csi: Make default formats consistent
Date:   Tue, 10 May 2022 14:58:47 +0300
Message-Id: <20220510115859.19777-39-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the same default image width and height for both the CSI subdev and
the video node to achieve a consistent default through the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 6704e5d4d43b..bcf57aff3572 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -165,10 +165,11 @@
 #define IMX7_CSI_VIDEO_NAME		"imx-capture"
 /* In bytes, per queue */
 #define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_64M
-#define IMX7_CSI_VIDEO_DEF_PIX_WIDTH	640
-#define IMX7_CSI_VIDEO_DEF_PIX_HEIGHT	480
 #define IMX7_CSI_VIDEO_EOF_TIMEOUT	2000
 
+#define IMX7_CSI_DEF_PIX_WIDTH		640
+#define IMX7_CSI_DEF_PIX_HEIGHT		480
+
 enum imx_csi_model {
 	IMX7_CSI_IMX7 = 0,
 	IMX7_CSI_IMX8MQ,
@@ -303,7 +304,8 @@ static void imx7_csi_init_default(struct imx7_csi *csi)
 	imx7_csi_reg_write(csi, 0, CSI_CSICR2);
 	imx7_csi_reg_write(csi, BIT_FRMCNT_RST, CSI_CSICR3);
 
-	imx7_csi_reg_write(csi, BIT_IMAGE_WIDTH(800) | BIT_IMAGE_HEIGHT(600),
+	imx7_csi_reg_write(csi, BIT_IMAGE_WIDTH(IMX7_CSI_DEF_PIX_WIDTH) |
+			   BIT_IMAGE_HEIGHT(IMX7_CSI_DEF_PIX_HEIGHT),
 			   CSI_CSIIMAG_PARA);
 
 	imx7_csi_reg_write(csi, BIT_DMA_REFLASH_RFF, CSI_CSICR3);
@@ -1628,8 +1630,8 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 	fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
-	fmt_src.format.width = IMX7_CSI_VIDEO_DEF_PIX_WIDTH;
-	fmt_src.format.height = IMX7_CSI_VIDEO_DEF_PIX_HEIGHT;
+	fmt_src.format.width = IMX7_CSI_DEF_PIX_WIDTH;
+	fmt_src.format.height = IMX7_CSI_DEF_PIX_HEIGHT;
 
 	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &fmt_src.format, NULL);
 	csi->vdev_compose.width = fmt_src.format.width;
@@ -1818,8 +1820,9 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 		struct v4l2_mbus_framefmt *mf =
 			imx7_csi_get_format(csi, sd_state, i, which);
 
-		ret = imx7_csi_init_mbus_fmt(mf, 800, 600, 0, V4L2_FIELD_NONE,
-					     &csi->cc[i]);
+		ret = imx7_csi_init_mbus_fmt(mf, IMX7_CSI_DEF_PIX_WIDTH,
+					     IMX7_CSI_DEF_PIX_HEIGHT, 0,
+					     V4L2_FIELD_NONE, &csi->cc[i]);
 		if (ret < 0)
 			return ret;
 	}
-- 
Regards,

Laurent Pinchart

