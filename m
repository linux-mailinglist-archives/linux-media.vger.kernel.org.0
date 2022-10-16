Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E43D5FFD85
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiJPGQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiJPGQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:16:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A983685D
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:16:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD95C1C90;
        Sun, 16 Oct 2022 08:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900975;
        bh=Rrg8TBi0sjw3FVUSO4X6McEL2SYrNmPd92xzQbsCEuc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=POO0Cm8KQ6PmquvLNWlBdbha4LoefTsMRCwnnBu0KBvyYjmnwhDIl+DmVHbbiYEiY
         m4Zh5r+jcH8cyRPqdTCesa4yjsiiYuAlz6+jzFlEq4y3dEHoRN6poRw1rClqby0Ghi
         13V+joGXNSNUTrwk0JPwj2evOiaFZuFuMN9FKvXU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 18/20] media: i2c: imx290: Factor out format retrieval to separate function
Date:   Sun, 16 Oct 2022 09:15:21 +0300
Message-Id: <20221016061523.30127-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
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

The driver duplicates the same pattern to access the try or active
format in multiple locations. Factor it out to a separate function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Avoid returning NULL from imx290_get_pad_format()
---
 drivers/media/i2c/imx290.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 0b34d60f8ce2..b0ff0e8ed45a 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -519,6 +519,16 @@ static const struct v4l2_ctrl_ops imx290_ctrl_ops = {
 	.s_ctrl = imx290_set_ctrl,
 };
 
+static struct v4l2_mbus_framefmt *
+imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state *state,
+		      u32 which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return &imx290->current_format;
+	else
+		return v4l2_subdev_get_try_format(&imx290->sd, state, 0);
+}
+
 static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -562,12 +572,7 @@ static int imx290_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&imx290->lock);
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		framefmt = v4l2_subdev_get_try_format(&imx290->sd, sd_state,
-						      fmt->pad);
-	else
-		framefmt = &imx290->current_format;
-
+	framefmt = imx290_get_pad_format(imx290, sd_state, fmt->which);
 	fmt->format = *framefmt;
 
 	mutex_unlock(&imx290->lock);
@@ -627,10 +632,9 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.code = imx290_formats[i].code;
 	fmt->format.field = V4L2_FIELD_NONE;
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		format = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
-	} else {
-		format = &imx290->current_format;
+	format = imx290_get_pad_format(imx290, sd_state, fmt->which);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		imx290->current_mode = mode;
 		imx290->bpp = imx290_formats[i].bpp;
 
-- 
Regards,

Laurent Pinchart

