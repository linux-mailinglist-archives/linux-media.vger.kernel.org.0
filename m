Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943937835C1
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 00:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbjHUWaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 18:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbjHUWaZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 18:30:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016B0183
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 15:30:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 756EA899;
        Tue, 22 Aug 2023 00:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692656933;
        bh=6GMPtfYEuP6O5OQDgQvHzpNDvQNg39W7HQIPfV3RXeY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ev1F34tPlcg7Xq9V50hAb89k9QqNigTBuyiFcLmTx1p68TnzxswSSNSV+ED3LE74B
         zSv779tNM0N9iokQGZ886e2YPG/8n/aErP/DzkPDTgqOGnwzpDnd3YicuYOfWYCIch
         fi+A1cFbAdycxQ0Y1e+6Zo0dyM7WpbhRIFMvAatg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 10/18] media: i2c: imx219: Access height from active format in imx219_set_ctrl
Date:   Tue, 22 Aug 2023 01:29:53 +0300
Message-ID: <20230821223001.28480-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
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

Use the active format height instead of the mode height in
imx219_set_ctrl(). This prepares for dropping the mode field from the
imx219 structure.

The state is retrieved using v4l2_subdev_get_locked_active_state() as
the subdev active state and the control handler share the same lock.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 0c26cbfe58f3..4e9a50117a0a 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -401,13 +401,18 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct imx219 *imx219 =
 		container_of(ctrl->handler, struct imx219, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
+	const struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
+	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
+	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
+
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
 
 		/* Update max exposure while meeting expected vblanking */
-		exposure_max = imx219->mode->height + ctrl->val - 4;
+		exposure_max = format->height + ctrl->val - 4;
 		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 			exposure_max : IMX219_EXPOSURE_DEFAULT;
 		__v4l2_ctrl_modify_range(imx219->exposure,
@@ -447,7 +452,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		cci_write(imx219->regmap, IMX219_REG_VTS,
-			  imx219->mode->height + ctrl->val, &ret);
+			  format->height + ctrl->val, &ret);
 		break;
 	case V4L2_CID_TEST_PATTERN_RED:
 		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
-- 
Regards,

Laurent Pinchart

