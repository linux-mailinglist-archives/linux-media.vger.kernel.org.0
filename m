Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832BD74DA77
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 17:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233602AbjGJPxZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 11:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbjGJPxR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 11:53:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B1A120
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 08:52:56 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25339DA7;
        Mon, 10 Jul 2023 17:51:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689004288;
        bh=4HZZ8O6AeBqAPIZRh1N/dU+GAxO/VxOE1Fc+U5qv/1Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ieh/6bXBFF5F6YueAW3r2bYVHtw+w2p8NE76wYA9tKGl1qAgcq4mCTMRpm0MCUR9y
         /IbzHkPrucu+o8vxUbCNGJP0BL5F/ABn0p5w1iYT6Rr87S3J0kfjPZGKSIWfUtTVre
         4vIqTfAdRWi/aDsovN5q1iIe4ClzYyzaw22bruNY=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v2 1/7] media: i2c: imx219: Rename mbus codes array
Date:   Mon, 10 Jul 2023 17:51:57 +0200
Message-Id: <20230710155203.92366-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
References: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
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

From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

The imx219 is using the name "codes" for the mbus formats array. The
name is too generic and not easy to read and follow in the code. Change
it to imx219_mbus_formats.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/imx219.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index d737d5e9a4a6..ac6b0e7a838d 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -345,7 +345,7 @@ static const char * const imx219_supply_name[] = {
  * - v flip
  * - h&v flips
  */
-static const u32 codes[] = {
+static const u32 imx219_mbus_formats[] = {
 	MEDIA_BUS_FMT_SRGGB10_1X10,
 	MEDIA_BUS_FMT_SGRBG10_1X10,
 	MEDIA_BUS_FMT_SGBRG10_1X10,
@@ -578,17 +578,17 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 
 	lockdep_assert_held(&imx219->mutex);
 
-	for (i = 0; i < ARRAY_SIZE(codes); i++)
-		if (codes[i] == code)
+	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
+		if (imx219_mbus_formats[i] == code)
 			break;
 
-	if (i >= ARRAY_SIZE(codes))
+	if (i >= ARRAY_SIZE(imx219_mbus_formats))
 		i = 0;
 
 	i = (i & ~3) | (imx219->vflip->val ? 2 : 0) |
 	    (imx219->hflip->val ? 1 : 0);
 
-	return codes[i];
+	return imx219_mbus_formats[i];
 }
 
 static void imx219_set_default_format(struct imx219 *imx219)
@@ -731,11 +731,11 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 
-	if (code->index >= (ARRAY_SIZE(codes) / 4))
+	if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
 		return -EINVAL;
 
 	mutex_lock(&imx219->mutex);
-	code->code = imx219_get_format_code(imx219, codes[code->index * 4]);
+	code->code = imx219_get_format_code(imx219, imx219_mbus_formats[code->index * 4]);
 	mutex_unlock(&imx219->mutex);
 
 	return 0;
@@ -831,14 +831,14 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&imx219->mutex);
 
-	for (i = 0; i < ARRAY_SIZE(codes); i++)
-		if (codes[i] == fmt->format.code)
+	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
+		if (imx219_mbus_formats[i] == fmt->format.code)
 			break;
-	if (i >= ARRAY_SIZE(codes))
+	if (i >= ARRAY_SIZE(imx219_mbus_formats))
 		i = 0;
 
 	/* Bayer order varies with flips */
-	fmt->format.code = imx219_get_format_code(imx219, codes[i]);
+	fmt->format.code = imx219_get_format_code(imx219, imx219_mbus_formats[i]);
 
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
-- 
2.40.1

