Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCAA5214B8
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241515AbiEJMEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241501AbiEJMEL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:04:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4A35131E
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:14 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C14E91248;
        Tue, 10 May 2022 13:59:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183990;
        bh=k83DkJluD69YCIeo/EtpffCkhSFp7txn436AUp0SJpM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DrGoIS6Vb6VIX/DtLfRomsZFKhEsksQgKuWtClOJ8eLxO1vysfRVViChFw/tKI6oe
         zvXEcG6HRtWdz2LFcRPr0p5MFQ7Fz89jaNpCWoo0ZPjEtfgc+yI8EipuP9TbcKzedi
         uKLcWpy9lN1XQF2oCKI65edAIsS2tESx6tBvMvLo=
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
Subject: [PATCH 47/50] staging: media: imx: imx7-media-csi: Drop unneeded pixel format validation
Date:   Tue, 10 May 2022 14:58:56 +0300
Message-Id: <20220510115859.19777-48-laurent.pinchart@ideasonboard.com>
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

The driver won't accept unsupported pixel formats, there's thus no need
to validate it in imx7_csi_pad_link_validate().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 33 ----------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 4d8e3c0a3633..8be6f40588af 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1966,7 +1966,6 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_format *sink_fmt)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	const struct v4l2_pix_format *out_pix = &csi->vdev_fmt;
 	struct media_pad *pad = NULL;
 	unsigned int i;
 	int ret;
@@ -2016,38 +2015,6 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 		break;
 	}
 
-	/* Validate the sink link, ensure the pixel format is supported. */
-	switch (out_pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_GREY:
-	case V4L2_PIX_FMT_Y10:
-	case V4L2_PIX_FMT_Y12:
-	case V4L2_PIX_FMT_Y14:
-	case V4L2_PIX_FMT_SBGGR8:
-	case V4L2_PIX_FMT_SGBRG8:
-	case V4L2_PIX_FMT_SGRBG8:
-	case V4L2_PIX_FMT_SRGGB8:
-	case V4L2_PIX_FMT_SBGGR10:
-	case V4L2_PIX_FMT_SGBRG10:
-	case V4L2_PIX_FMT_SGRBG10:
-	case V4L2_PIX_FMT_SRGGB10:
-	case V4L2_PIX_FMT_SBGGR12:
-	case V4L2_PIX_FMT_SGBRG12:
-	case V4L2_PIX_FMT_SGRBG12:
-	case V4L2_PIX_FMT_SRGGB12:
-	case V4L2_PIX_FMT_SBGGR14:
-	case V4L2_PIX_FMT_SGBRG14:
-	case V4L2_PIX_FMT_SGRBG14:
-	case V4L2_PIX_FMT_SRGGB14:
-		break;
-
-	default:
-		dev_dbg(csi->dev, "Invalid capture pixel format 0x%08x\n",
-			out_pix->pixelformat);
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

