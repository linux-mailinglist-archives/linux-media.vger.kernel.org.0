Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B029C521493
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241488AbiEJMD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241491AbiEJMDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0B656206
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:57 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD782824;
        Tue, 10 May 2022 13:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183980;
        bh=d3QEcEuWK6z6oOc1biYGe9+5VTFDc2s4Kpf0jtO3sqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZmLr5J6TZUUdvAq+emuiTmus8fVIF/jFp29/eb8W3Xqo6Omh3z0KYoSZjs+D7V40s
         j7idOp7Bb68acJWCLa8k+a/I2Qrry84uWWE67/EFBwd9GVGeDukid+wWb8YNBC7TGA
         8mcqZHPOoJWGLwJ+zvz+WfIxnretNX4cV1Mawh0o=
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
Subject: [PATCH 35/50] staging: media: imx: imx7-media-csi: Drop IC support from imx7_csi_try_colorimetry()
Date:   Tue, 10 May 2022 14:58:44 +0300
Message-Id: <20220510115859.19777-36-laurent.pinchart@ideasonboard.com>
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

The imx7_csi_try_colorimetry() function supports the unrelated image
converter hardware as it originates from shared helpers. Drop that.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index b8ce4fd7c55d..c8ff259452b1 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -2031,13 +2031,8 @@ static int imx7_csi_get_fmt(struct v4l2_subdev *sd,
  * parameters based on the colorspace if they are uninitialized.
  *
  * tryfmt->code must be set on entry.
- *
- * If this format is destined to be routed through the Image Converter,
- * Y`CbCr encoding must be fixed. The IC supports only BT.601 Y`CbCr
- * or Rec.709 Y`CbCr encoding.
  */
-static void imx7_csi_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
-				     bool ic_route)
+static void imx7_csi_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt)
 {
 	const struct imx7_csi_pixfmt *cc;
 	bool is_rgb = false;
@@ -2069,16 +2064,9 @@ static void imx7_csi_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 		tryfmt->xfer_func =
 			V4L2_MAP_XFER_FUNC_DEFAULT(tryfmt->colorspace);
 
-	if (ic_route) {
-		if (tryfmt->ycbcr_enc != V4L2_YCBCR_ENC_601 &&
-		    tryfmt->ycbcr_enc != V4L2_YCBCR_ENC_709)
-			tryfmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
-	} else {
-		if (tryfmt->ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT) {
-			tryfmt->ycbcr_enc =
-				V4L2_MAP_YCBCR_ENC_DEFAULT(tryfmt->colorspace);
-		}
-	}
+	if (tryfmt->ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
+		tryfmt->ycbcr_enc =
+			V4L2_MAP_YCBCR_ENC_DEFAULT(tryfmt->colorspace);
 
 	if (tryfmt->quantization == V4L2_QUANTIZATION_DEFAULT)
 		tryfmt->quantization =
@@ -2135,7 +2123,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		return -EINVAL;
 	}
 
-	imx7_csi_try_colorimetry(&sdformat->format, false);
+	imx7_csi_try_colorimetry(&sdformat->format);
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

