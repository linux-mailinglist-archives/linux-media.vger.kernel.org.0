Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A7557C665
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbiGUIgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbiGUIgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:36:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C016F13FB1
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:36:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FF6B13B9;
        Thu, 21 Jul 2022 10:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392566;
        bh=S3++aGm2YNcn822kuVev900tz8IkN5XPkvXe75Rvq2o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QdxlyEQWSJqoH0IvcE6rC83ATZtYfjxdyVbxHSRNzBLT+lF5P4yUYUl0hTOt/nWaD
         INt3MvOnsMf72+ZDSS+eseYUvkGWq6IAaxZIvj4JnJXCARO/umK/XerWe0S83lBzTa
         y6TXX9jGcjhjBkOoWr0sxsffKKJcutgAbovI//Hk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 17/19] media: i2c: imx290: Factor out format retrieval to separate function
Date:   Thu, 21 Jul 2022 11:35:38 +0300
Message-Id: <20220721083540.1525-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx290.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index fc6e87fada1c..baf9941c5fbe 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -519,6 +519,20 @@ static const struct v4l2_ctrl_ops imx290_ctrl_ops = {
 	.s_ctrl = imx290_set_ctrl,
 };
 
+static struct v4l2_mbus_framefmt *
+imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state *state,
+		      u32 which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_format(&imx290->sd, state, 0);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &imx290->current_format;
+	default:
+		return NULL;
+	}
+}
+
 static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -562,12 +576,7 @@ static int imx290_get_fmt(struct v4l2_subdev *sd,
 
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
@@ -627,10 +636,9 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
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

