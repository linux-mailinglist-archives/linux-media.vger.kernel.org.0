Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E4B67DC42
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 03:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbjA0C13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 21:27:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbjA0C12 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 21:27:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831E2410AF
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 18:27:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 101671589;
        Fri, 27 Jan 2023 03:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674786446;
        bh=Pq/HMJ1TOBBpOAhcvGA4S2MtXLuC/mfjtoxjPtdaM0s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lk1iVuuHnBRzH7oJvarK2gjWn743dawpHlPYFoQ99SR6AIZZ/IWhqan0PjzXTDsw9
         CraiTGY+grzAkXDzkDQJe1maLfwvfnQHLgIGACYv5IPntFaEiSvtiFKCa19DK8GWrw
         agZDwF0CzUQ4wGYmI33vGgDH8WhPuGpBcw8PcjXA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 5/6] media: imx: imx7-media-csi: Drop unneeded pad checks
Date:   Fri, 27 Jan 2023 04:27:14 +0200
Message-Id: <20230127022715.27234-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
References: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
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
index f02a88e1ca10..052acbd683a8 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1934,6 +1934,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		sdformat->format.quantization = in_fmt->quantization;
 		sdformat->format.ycbcr_enc = in_fmt->ycbcr_enc;
 		break;
+
 	case IMX7_CSI_PAD_SINK:
 		*cc = imx7_csi_find_mbus_format(sdformat->format.code);
 		if (!*cc) {
@@ -1945,8 +1946,6 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		if (sdformat->format.field != V4L2_FIELD_INTERLACED)
 			sdformat->format.field = V4L2_FIELD_NONE;
 		break;
-	default:
-		return -EINVAL;
 	}
 
 	imx7_csi_try_colorimetry(&sdformat->format);
@@ -1966,9 +1965,6 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
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

