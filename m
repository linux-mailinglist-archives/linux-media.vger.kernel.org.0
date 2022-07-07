Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753C85696D2
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 02:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234697AbiGGATu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 20:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234149AbiGGATu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 20:19:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBD62DA96
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 17:19:48 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC81A526;
        Thu,  7 Jul 2022 02:19:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657153187;
        bh=R2J5dmpyglyka4IXBrSfiwvTOSzi5AM72ldRndYmniE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pPPn+SkJD3E+dijQLIw7umIImtprwgQAIDD1aikDnb40QINuWjOdv57eyFdKdTtxn
         qTjiXzOa8Blx3X8WSO8Up88Fq+tLacFPgc+OA0Poh6puw9JjQFCnH8499YCstHH57q
         fRJ2Ewi/m0EqsrzFH5/0EoJooFMrZd+KNf5ZXP34=
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
Subject: [PATCH v1.1 39/50] staging: media: imx: imx7-media-csi: Define macro for default mbus code
Date:   Thu,  7 Jul 2022 03:19:16 +0300
Message-Id: <20220707001916.3464-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-40-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-40-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define a macro for the default media bus code and use it through the
driver to replace a hardcoded value and a dynamic query from the
pixel_formats table.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes since v1:

- Add a comment to tell MEDIA_BUS_FMT_UYVY8_2X8 must be first
---
 drivers/staging/media/imx/imx7-media-csi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index b76e040e45da..f8c21dd00e55 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -167,6 +167,7 @@
 #define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_64M
 #define IMX7_CSI_VIDEO_EOF_TIMEOUT	2000
 
+#define IMX7_CSI_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_2X8
 #define IMX7_CSI_DEF_PIX_WIDTH		640
 #define IMX7_CSI_DEF_PIX_HEIGHT		480
 
@@ -820,7 +821,8 @@ enum imx7_csi_pixfmt_sel {
 };
 
 /*
- * List of supported pixel formats for the subdevs.
+ * List of supported pixel formats for the subdevs. Keep MEDIA_BUS_FMT_UYVY8_2X8
+ * first to match IMX7_CSI_DEF_MBUS_CODE.
  */
 static const struct imx7_csi_pixfmt pixel_formats[] = {
 	/*** YUV formats start here ***/
@@ -1096,7 +1098,7 @@ static int imx7_csi_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	mbus->field = field;
 
 	if (code == 0)
-		imx7_csi_enum_mbus_formats(&code, 0, IMX7_CSI_PIXFMT_SEL_YUV);
+		code = IMX7_CSI_DEF_MBUS_CODE;
 
 	lcc = imx7_csi_find_mbus_format(code, IMX7_CSI_PIXFMT_SEL_ANY);
 	if (!lcc)
@@ -1629,7 +1631,7 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
 		.pad = IMX7_CSI_PAD_SRC,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
-	fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
+	fmt_src.format.code = IMX7_CSI_DEF_MBUS_CODE;
 	fmt_src.format.width = IMX7_CSI_DEF_PIX_WIDTH;
 	fmt_src.format.height = IMX7_CSI_DEF_PIX_HEIGHT;
 
-- 
Regards,

Laurent Pinchart

