Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA0BD74DA90
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 17:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233674AbjGJPyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 11:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233679AbjGJPyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 11:54:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0AF135
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 08:54:26 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB6E932D2;
        Mon, 10 Jul 2023 17:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689004293;
        bh=lEFVKKW37iKSybKu8oGE2XTUJnZv6OibFkc2bij6VSk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rTgcmqsePVh3mC62ton5OUubCAmI8Wb92Mo7aALBgIQCTWxe6tbZeYyzVapHfTCIQ
         AZqBtOI7OjWFEueMJaShPp2oPOMmBgAPgp3/qn2U7oO19ZSqbALzZbdiiKF82qoqYI
         gRRR1Ay/eiCkOzcYd4DVzB5XmzDqA5OvX0JBYOeU=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH v2 7/7] media: i2c: imx219: Simplify code handling in s_fmt
Date:   Mon, 10 Jul 2023 17:52:03 +0200
Message-Id: <20230710155203.92366-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
References: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx219_set_pad_format() function adjusts the media bus code provided
through the v4l2_subdev_format parameter to a media bus code known
to be supported by the sensor.

The same exact operation is performed by the imx219_get_format_code()
function which called by imx219_update_pad_format(), which is in the
imx219_set_pad_format() call path.

Remove the duplicated operation and simplify imx219_set_pad_format().

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 4f214f10846c..a1136fdfbed2 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -750,21 +750,13 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx219_mode *mode;
 	int exposure_max, exposure_def, hblank;
 	struct v4l2_mbus_framefmt *format;
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
-		if (imx219_mbus_formats[i] == fmt->format.code)
-			break;
-	if (i >= ARRAY_SIZE(imx219_mbus_formats))
-		i = 0;
 
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 
-	imx219_update_pad_format(imx219, mode, &fmt->format,
-				 imx219_mbus_formats[i]);
+	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
 	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
 
 	if (imx219->mode == mode && format->code == fmt->format.code)
-- 
2.40.1

