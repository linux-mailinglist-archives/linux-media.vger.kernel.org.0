Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEAF5696D5
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 02:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234731AbiGGAUn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 20:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234716AbiGGAUn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 20:20:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B172B271
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 17:20:42 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62EBA526;
        Thu,  7 Jul 2022 02:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657153241;
        bh=3PfEJENW5ygKkJGXs3i8npDA2PNsQSI3N0LSIUbYVq0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ElqIubS3svE2y0VSJotiHDFD0pm1RnZm3WypNRxn8zPKCpD6Acxu4zukJqh3Xz1Hm
         /YVJhSRSC0CY1b0VvDIYzLfYrjtLJDrl+kGcm0+km4gkjem5tMsmf+Efq9BE9V2iyI
         qnG7OE3NubXUenUJQT5q8OpLO4tqh9B2WWeYvf7Y=
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
Subject: [PATCH v1.1 44/50] staging: media: imx: imx7-media-csi: Simplify default format in try_fmt
Date:   Thu,  7 Jul 2022 03:20:12 +0300
Message-Id: <20220707002012.3524-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-45-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-45-laurent.pinchart@ideasonboard.com>
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

When trying a format on the video node, if the requested pixel format
isn't supported, fallback to the default with a simpler logic.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes since v1:

- Add a comment to tell V4L2_PIX_FMT_UYVY must be first
---
 drivers/staging/media/imx/imx7-media-csi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 19aa8724f6c1..fd707a49be3f 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -168,6 +168,7 @@
 #define IMX7_CSI_VIDEO_EOF_TIMEOUT	2000
 
 #define IMX7_CSI_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_2X8
+#define IMX7_CSI_DEF_PIX_FORMAT		V4L2_PIX_FMT_UYVY
 #define IMX7_CSI_DEF_PIX_WIDTH		640
 #define IMX7_CSI_DEF_PIX_HEIGHT		480
 
@@ -806,8 +807,9 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 #define IMX_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
 
 /*
- * List of supported pixel formats for the subdevs. Keep MEDIA_BUS_FMT_UYVY8_2X8
- * first to match IMX7_CSI_DEF_MBUS_CODE.
+ * List of supported pixel formats for the subdevs. Keep V4L2_PIX_FMT_UYVY and
+ * MEDIA_BUS_FMT_UYVY8_2X8 first to match IMX7_CSI_DEF_PIX_FORMAT and
+ * IMX7_CSI_DEF_MBUS_CODE.
  */
 static const struct imx7_csi_pixfmt pixel_formats[] = {
 	/*** YUV formats start here ***/
@@ -1131,7 +1133,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 	 */
 	cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
 	if (!cc) {
-		imx7_csi_enum_pixel_formats(&pixfmt->pixelformat, 0, 0);
+		pixfmt->pixelformat = IMX7_CSI_DEF_PIX_FORMAT;
 		cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
 	}
 
-- 
Regards,

Laurent Pinchart

