Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4761057C661
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbiGUIgF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbiGUIgE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:36:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D586F14011
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:36:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51D0AA38;
        Thu, 21 Jul 2022 10:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392562;
        bh=Ki8f+TS/S0VGL6RhpHqNoWW0COHldTvbQBBvkwl4sh4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wKnbAnpbAhE9NiXRx7TAaRMIxru4mJRSBGxixvNOuZonCw0HqqBYmGh24CV3cLCr4
         70HNFwsvI59K6OFVK5adIMCjq0hYxKHMcM94BieJKP3K6OEJHhIdWkiF2WnX1bJebI
         ryrGI5yvRTSlqgwNZ+EXhZhfjELyfAiEaUVNsnu4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 14/19] media: i2c: imx290: Implement HBLANK and VBLANK controls
Date:   Thu, 21 Jul 2022 11:35:35 +0300
Message-Id: <20220721083540.1525-15-laurent.pinchart@ideasonboard.com>
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

Add support for the V4L2_CID_HBLANK and V4L2_CID_VBLANK controls to the
imx290 driver. Make the controls read-only to start with, to report the
values to userspace for timing calculation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 39 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 4408dd3e191f..7190399f4111 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -146,6 +146,8 @@ struct imx290 {
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
 
 	struct mutex lock;
 };
@@ -642,6 +644,20 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 		if (imx290->pixel_rate)
 			__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
 						 imx290_calc_pixel_rate(imx290));
+
+		if (imx290->hblank) {
+			unsigned int hblank = mode->hmax - mode->width;
+
+			__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank,
+						 1, hblank);
+		}
+
+		if (imx290->vblank) {
+			unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
+
+			__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank,
+						 1, vblank);
+		}
 	}
 
 	*format = fmt->format;
@@ -880,9 +896,10 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
 
 static int imx290_ctrl_init(struct imx290 *imx290)
 {
+	unsigned int blank;
 	int ret;
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
+	v4l2_ctrl_handler_init(&imx290->ctrls, 7);
 	imx290->ctrls.lock = &imx290->lock;
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
@@ -910,6 +927,26 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
 				     0, 0, imx290_test_pattern_menu);
 
+	/*
+	 * Horizontal blanking is controlled through the HMAX register, which
+	 * contains a line length in INCK clock units. The INCK frequency is
+	 * fixed to 74.25 MHz. The HMAX value is currently fixed to 1100,
+	 * convert it to a number of pixels based on the nominal pixel rate.
+	 */
+	blank = imx290->current_mode->hmax - imx290->current_mode->width;
+	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+					   V4L2_CID_HBLANK, blank, blank, 1,
+					   blank);
+	if (imx290->hblank)
+		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
+	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+					   V4L2_CID_VBLANK, blank, blank, 1,
+					   blank);
+	if (imx290->vblank)
+		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	imx290->sd.ctrl_handler = &imx290->ctrls;
 
 	if (imx290->ctrls.error) {
-- 
Regards,

Laurent Pinchart

