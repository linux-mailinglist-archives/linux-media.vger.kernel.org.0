Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E6D4D62AE
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 14:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349002AbiCKN5B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 08:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344749AbiCKN5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 08:57:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74351C4B2A
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 05:55:57 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1E6E486;
        Fri, 11 Mar 2022 14:55:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647006956;
        bh=7hPsxB8EuTh1E7bFJhT3Qjz1xYOfQi3gWxkIRIXNY+E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QS0XTRSwgc9k4v/UPl+r5EBkoTRKyhiySLnLOX9ui12I+CaD7BjBMIEsRY1s7MPn9
         ghkTO6C7EH11zuPYr/0IhP2ZRju2/7b0OAyKNvY53MpL2LVf/vvdG1PVHA54qm0Zfl
         ZLTEldKyW7965nxSgqoS8Sy5xyCaW+rJ7HjAFdPA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 1/4] media: imx: imx-mipi-csis: Don't use .s_power()
Date:   Fri, 11 Mar 2022 15:55:32 +0200
Message-Id: <20220311135535.30108-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
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

The subdev .s_power() operation is deprecated. Drop it, requiring sensor
drivers to correctly use runtime PM instead of relying on .s_power().

As this driver has just been moved out of staging, and necessary drivers
to implement a full camera pipeline are still in staging, no platform
depends yet on this API being called. There is thus no risk of
regression.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 7baedc854186..6e06d19c1334 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -937,7 +937,7 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
 static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
-	int ret;
+	int ret = 0;
 
 	if (enable) {
 		ret = mipi_csis_calculate_params(csis);
@@ -949,10 +949,6 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 		ret = pm_runtime_resume_and_get(csis->dev);
 		if (ret < 0)
 			return ret;
-
-		ret = v4l2_subdev_call(csis->src_sd, core, s_power, 1);
-		if (ret < 0 && ret != -ENOIOCTLCMD)
-			goto done;
 	}
 
 	mutex_lock(&csis->lock);
@@ -973,9 +969,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 		csis->state |= ST_STREAMING;
 	} else {
 		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
-		ret = v4l2_subdev_call(csis->src_sd, core, s_power, 0);
-		if (ret == -ENOIOCTLCMD)
-			ret = 0;
+
 		mipi_csis_stop_stream(csis);
 		csis->state &= ~ST_STREAMING;
 		if (csis->debug.enable)
@@ -985,7 +979,6 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 unlock:
 	mutex_unlock(&csis->lock);
 
-done:
 	if (!enable || ret < 0)
 		pm_runtime_put(csis->dev);
 
-- 
Regards,

Laurent Pinchart

