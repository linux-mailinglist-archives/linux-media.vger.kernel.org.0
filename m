Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01D217D5EB8
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 01:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344604AbjJXXea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 19:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343883AbjJXXe3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 19:34:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907D110C6
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 16:34:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9024FD8B;
        Wed, 25 Oct 2023 01:34:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698190452;
        bh=HFB1gygcBtdGaT3GgeooTHW8WXKUrVaVDc45JjsCrSo=;
        h=From:To:Cc:Subject:Date:From;
        b=SereU1WuF/EaX2M9f4xuzCXKK/lcVaR/86xHYgswQHEEODjxDrLT4G0FHJggOlmPA
         DYVNzVeRWpAD2WnYkERkdjbCx04r53e8PGEMV+zMfPIIR8KjZK7C1DQGsfWhjgXL+w
         Q7XP150VUGv/T+DaGsBC7ErDb4/spMdop6LM7A20=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH] media: microchip-isc: Remove dead code in pipeline validation
Date:   Wed, 25 Oct 2023 02:34:30 +0300
Message-ID: <20231024233430.1488-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The isc_try_fse() function, called from isc_validate(), takes two
parameters, an isc_device pointer, and a v4l2_subdev_state pointer. The
isc_device is accessed but not modified by the function. The state is
modified, including the struct v4l2_subdev_pad_config array it points
to, but they are then never used by the caller. Furthermore, the V4L2
subdev operation called by isc_try_fse() doesn't modify the subdev it is
called on. The isc_try_fse() function has thus no effect, and can just
be dropped.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This patch has been compile-tested only. Eugen, would you be able to
test it on hardware ?
---
 .../platform/microchip/microchip-isc-base.c   | 39 -------------------
 1 file changed, 39 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 1f8528844497..540cb1378289 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -851,38 +851,6 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 	return 0;
 }
 
-static void isc_try_fse(struct isc_device *isc,
-			struct v4l2_subdev_state *sd_state)
-{
-	struct v4l2_subdev_frame_size_enum fse = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
-	int ret;
-
-	/*
-	 * If we do not know yet which format the subdev is using, we cannot
-	 * do anything.
-	 */
-	if (!isc->config.sd_format)
-		return;
-
-	fse.code = isc->try_config.sd_format->mbus_code;
-
-	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, enum_frame_size,
-			       sd_state, &fse);
-	/*
-	 * Attempt to obtain format size from subdev. If not available,
-	 * just use the maximum ISC can receive.
-	 */
-	if (ret) {
-		sd_state->pads->try_crop.width = isc->max_width;
-		sd_state->pads->try_crop.height = isc->max_height;
-	} else {
-		sd_state->pads->try_crop.width = fse.max_width;
-		sd_state->pads->try_crop.height = fse.max_height;
-	}
-}
-
 static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f)
 {
 	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
@@ -944,10 +912,6 @@ static int isc_validate(struct isc_device *isc)
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad = isc->remote_pad,
 	};
-	struct v4l2_subdev_pad_config pad_cfg = {};
-	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg,
-	};
 
 	/* Get current format from subdev */
 	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, get_fmt, NULL,
@@ -1008,9 +972,6 @@ static int isc_validate(struct isc_device *isc)
 	if (ret)
 		return ret;
 
-	/* Obtain frame sizes if possible to have crop requirements ready */
-	isc_try_fse(isc, &pad_state);
-
 	/* Configure ISC pipeline for the config */
 	ret = isc_try_configure_pipeline(isc);
 	if (ret)
-- 
Regards,

Laurent Pinchart

