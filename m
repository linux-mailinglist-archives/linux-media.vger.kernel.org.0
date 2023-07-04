Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF88D746EF5
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 12:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbjGDKlr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 06:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbjGDKlP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 06:41:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51584184
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 03:41:14 -0700 (PDT)
Received: from uno.localdomain (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC49A6DF;
        Tue,  4 Jul 2023 12:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688467227;
        bh=OZoM7ukDkf+Zcgcf0A2sr6bk5C9jADHgi+1fDPn9Q9E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gp8lIUQBF39ZhqcH80xrxKnHH4Orv9hVvKjBm3aTYex8t9p6jLnkqobfIdjksRVLi
         01AFWGf8Q6bRutrh27O6i7LLZl3Yi9J0R0MiaBWy1XMdX/OwNy748BLEGJXWGBAnfK
         beRJVCRgnagKz/XjmqZuNRlxGzslmOuZM7tmN3wo=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH 5/5] media: i2c: imx219: Simplify code handling in s_fmt
Date:   Tue,  4 Jul 2023 12:40:57 +0200
Message-Id: <20230704104057.149837-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230704104057.149837-1-jacopo.mondi@ideasonboard.com>
References: <20230704103611.149631-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-1-jacopo.mondi@ideasonboard.com>
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

The imx219_set_pad_format() function adjusts the media bus code provided
through the v4l2_subdev_format parameter to a media bus code known
to be supported by the sensor.

The same exact operation is performed by the imx219_get_format_code()
function which called by imx219_update_pad_format(), which is in the
imx219_set_pad_format() call path.

Remove the duplicated operation and simplify imx219_set_pad_format().

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index c1246bd23b0d..37630e173040 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -754,19 +754,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	int exposure_max, exposure_def, hblank;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
-		if (imx219_mbus_formats[i] == fmt->format.code)
-			break;
-	if (i >= ARRAY_SIZE(imx219_mbus_formats))
-		i = 0;
-
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 
-	imx219_update_pad_format(imx219, mode, &fmt->format,
-				 imx219_mbus_formats[i]);
+	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		imx219->mode = mode;
-- 
2.40.1

