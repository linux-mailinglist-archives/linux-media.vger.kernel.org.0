Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D09B4E9C4D
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 18:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbiC1QeN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 12:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242237AbiC1QeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 12:34:11 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270486212F
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 09:32:28 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 9276F100008;
        Mon, 28 Mar 2022 16:32:26 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        sakari.ailus@iki.fi, tomi.valkeinen@ideasonboard.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: ov5645: Fix media bus format
Date:   Mon, 28 Mar 2022 18:32:20 +0200
Message-Id: <20220328163220.250203-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5645 driver reports as its unique supported format
MEDIA_BUS_FMT_UYVY8_2X8, which is not correct as the sensor
uses the MIPI CSI-2 serial bus.

Fix that by using MEDIA_BUS_FMT_UYVY8_1X16 instead.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5645.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 368fa21e675e..5720e74e843b 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -843,7 +843,7 @@ static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;

-	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
+	code->code = MEDIA_BUS_FMT_UYVY8_1X16;

 	return 0;
 }
@@ -852,7 +852,7 @@ static int ov5645_enum_frame_size(struct v4l2_subdev *subdev,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->code != MEDIA_BUS_FMT_UYVY8_2X8)
+	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
 		return -EINVAL;

 	if (fse->index >= ARRAY_SIZE(ov5645_mode_info_data))
@@ -948,7 +948,7 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 					   format->which);
 	__format->width = __crop->width;
 	__format->height = __crop->height;
-	__format->code = MEDIA_BUS_FMT_UYVY8_2X8;
+	__format->code = MEDIA_BUS_FMT_UYVY8_1X16;
 	__format->field = V4L2_FIELD_NONE;
 	__format->colorspace = V4L2_COLORSPACE_SRGB;

--
2.35.1

