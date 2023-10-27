Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334777D934F
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345406AbjJ0JQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbjJ0JQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:16:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E340693
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:16:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BCE2DD9;
        Fri, 27 Oct 2023 11:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698398194;
        bh=CNzQUdy5MIzqA/6ECnRgoM1rLl0qzC1xGoCLrU8k/WY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fy4YBouYFbMXY0Ovy9mK1x7eBNWxfQnuHr6lmzO644+kDHhEUYh/9ALxYBCb1Qgsj
         oa+szPgfDN9K4N9A5hrCbemwY3/pujapsg+Ki8dFKM1dI6b0n0hFTL0LLDoiB9bmaU
         w53oU+aPRkCNoKZUKIt9wMV7vOzBYi0E2PlxuTXo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH v2 3/9] media: microchip-isc: Remove dead code in pipeline validation
Date:   Fri, 27 Oct 2023 12:16:43 +0300
Message-ID: <20231027091649.10553-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
References: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

