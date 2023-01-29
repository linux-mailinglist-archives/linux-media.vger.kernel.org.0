Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C440A67FC61
	for <lists+linux-media@lfdr.de>; Sun, 29 Jan 2023 03:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbjA2Ceq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 21:34:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbjA2Cen (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 21:34:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E17233DD
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 18:34:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25D72327;
        Sun, 29 Jan 2023 03:34:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674959681;
        bh=Fzuc9ErDIehn3XSwp9LhJBmgl7exuQbb1ULFbXI1U1s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C2tRYa/tRckzPcSZl06gnDhnRAvndumaFBRZlDMRCc8/Hv82KU4EaGSRnKrLEcH6I
         7BteTq7U2UOzLZMtROOiMoZ2kIaBgagKeqhFPtMu/d56Hj63nMxG00/2sEQnSLQGwD
         D2GbwTllcuYVc4BR6DFWU0jN5ISO+Rom9B6wjWxk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2 5/8] media: imx: imx7-media-csi: Drop unneeded pad checks
Date:   Sun, 29 Jan 2023 04:34:26 +0200
Message-Id: <20230129023429.22467-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
References: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev core guarantees that the .set_fmt() operation is always
called with a valid pad. Drop the unneeded pad checks.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 62232cd6775f..1adf5c3392d9 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1936,6 +1936,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		sdformat->format.quantization = in_fmt->quantization;
 		sdformat->format.ycbcr_enc = in_fmt->ycbcr_enc;
 		break;
+
 	case IMX7_CSI_PAD_SINK:
 		*cc = imx7_csi_find_mbus_format(sdformat->format.code);
 		if (!*cc) {
@@ -1947,8 +1948,6 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		if (sdformat->format.field != V4L2_FIELD_INTERLACED)
 			sdformat->format.field = V4L2_FIELD_NONE;
 		break;
-	default:
-		return -EINVAL;
 	}
 
 	imx7_csi_try_colorimetry(&sdformat->format);
@@ -1968,9 +1967,6 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_subdev_format format;
 	int ret = 0;
 
-	if (sdformat->pad >= IMX7_CSI_PADS_NUM)
-		return -EINVAL;
-
 	mutex_lock(&csi->lock);
 
 	if (csi->is_streaming) {
-- 
Regards,

Laurent Pinchart

