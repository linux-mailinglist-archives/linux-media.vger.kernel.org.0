Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D77078EF0F
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 15:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239660AbjHaN5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 09:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235410AbjHaN5o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 09:57:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB57A91
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 06:57:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A33516C4;
        Thu, 31 Aug 2023 15:56:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693490176;
        bh=80cYYpa00p/3jFalTmvze9DMpSpwyMhSaZrYGGL6j3o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pGVrE+nD+obQNJYXRkn20nsK4kuZWwr6CzbURmdfAT1sMmWJcL7WvUlYK9aCOHBiO
         psarARzDBymyS+zLqZptLlZy/Ew6lGtuipydpIyyNvOk421zAsCyyyu7cZv4u+QnIp
         s+Z3kI8H6tOhryiGBtohgqIwbZIwqgwBamrWaCWo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 3/3] media: i2c: imx219: Perform a full mode set unconditionally
Date:   Thu, 31 Aug 2023 16:57:47 +0300
Message-ID: <20230831135747.23148-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831135747.23148-1-laurent.pinchart@ideasonboard.com>
References: <20230831135747.23148-1-laurent.pinchart@ideasonboard.com>
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

The .set_fmt() handler tries to avoid updating the sensor configuration
when the mode hasn't changed. It does so by comparing both the mode and
the media bus code. While the latter correctly uses the media bus code
stored in the subdev state, the former compares the mode being set with
the active mode, regardless of whether .set_fmt() is called for the
ACTIVE or TRY format. This can lead to .set_fmt() returning early when
operating on TRY formats.

This could be fixed by replacing the mode comparison with width and
height comparisons, using the frame size stored in the subdev state.
However, the optimization that avoids updates to the sensor
configuration is not very useful, and is not commonly found in sensor
drivers. To improve consistency across sensor drivers, it is better, in
addition to being easier, to simply drop it. Do so.

Fixes: e8a5b1df000e ("media: i2c: imx219: Use subdev active state")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f19c828b6943..ec53abe2e84e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -762,9 +762,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
 	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
 
-	if (imx219->mode == mode && format->code == fmt->format.code)
-		return 0;
-
 	*format = fmt->format;
 	*crop = mode->crop;
 
-- 
Regards,

Laurent Pinchart

