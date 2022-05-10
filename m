Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F14B7521490
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241506AbiEJMEH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241501AbiEJMEH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:04:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C094F5418B
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:09 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4063CDFF;
        Tue, 10 May 2022 13:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183987;
        bh=KgBCrsGlH31L2cj6pWaqulM0WKSu9Yyu/7MNfoNUqqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oxS4CMlqGLPFVUeICbbQS3jFTKvUcxWAZZTI/QnAPSvchknp71/o4RkkrnWKWlkjp
         OVbrppFEY0nelIcq8Z+3Ms0hayHe1uCn66UZY3LAXDCjimV3eaaFqtdf2QaSKpVawd
         /PpYU4DHmrOhUZrkEZxoLP3VLh8T6ffyNTEfbggQ=
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
Subject: [PATCH 44/50] staging: media: imx: imx7-media-csi: Simplify default format in try_fmt
Date:   Tue, 10 May 2022 14:58:53 +0300
Message-Id: <20220510115859.19777-45-laurent.pinchart@ideasonboard.com>
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

When trying a format on the video node, if the requested pixel format
isn't supported, fallback to the default with a simpler logic.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index bc3a87656117..0fb5e0c03396 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -168,6 +168,7 @@
 #define IMX7_CSI_VIDEO_EOF_TIMEOUT	2000
 
 #define IMX7_CSI_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_2X8
+#define IMX7_CSI_DEF_PIX_FORMAT		V4L2_PIX_FMT_UYVY
 #define IMX7_CSI_DEF_PIX_WIDTH		640
 #define IMX7_CSI_DEF_PIX_HEIGHT		480
 
@@ -1130,7 +1131,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
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

