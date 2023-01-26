Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82FC467CB37
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 13:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236807AbjAZMre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 07:47:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236591AbjAZMrT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 07:47:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 990986E412
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 04:47:10 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D0FA1817;
        Thu, 26 Jan 2023 13:46:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674737218;
        bh=MAQqT4UAk1AKtvkJYkZrjFjo5/jBx2Y9heJD2iSy4/I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DF+Z6YFdz8o0u0AFbH3pfyivS00ulvW9Mv2kxWIdtwwCobXH2lZBZhPllTDxDvrHf
         LEdC5eLa9K65/8bzo3xHmmy7QYdBYCXzRRTX4XcHsETljRmgO+cNq+2lwK2OrOL5ZB
         ACfetklyhFfwvhib4wJ7qAw/zh72cABLHGR3xp8Q=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 9/9] media: i2c: ov5670: Handle RO controls in set_ctrl
Date:   Thu, 26 Jan 2023 13:46:32 +0100
Message-Id: <20230126124632.45842-10-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
References: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
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

The ov5670 driver registers three controls as read-only:
- V4L2_CID_PIXEL_RATE
- V4L2_CID_LINK_FREQ
- V4L2_CID_HBLANK

The driver updates the range of HBLANK with __v4l2_ctrl_modify_range()
and updates the values of PIXEL_RATE and LINK_FREQ with an
explicit call to __v4l2_ctrl_s_ctrl() in ov5670_set_pad_format() time.

This causes the .set_ctrl handler to be called on these controls
causing a non-fatal warning to be emitted:

	ov5670_set_ctrl Unhandled id:0x9e0902, val:0x824

This is currently only critical for HBLANK, as LINK_FREQ and PIXEL_RATE
currently only support a single value, and the v4l2-ctrl framework skips
calling .set_ctrl() if the current control value is not changed.

Expand the ov5670_set_ctrl() callback to handle the above controls
to remove the above warning and defend against future expansions
of the supported pixel rates and link frequencies.

Also be stricter and return an error value if a control is actually not
handled.

Reported-by: Luca Weiss <luca@z3ntu.xyz>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 8655993ee9b0..a8116ad2cdc3 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2038,7 +2038,7 @@ static int ov5670_set_ctrl(struct v4l2_ctrl *ctrl)
 					     struct ov5670, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
 	s64 max;
-	int ret = 0;
+	int ret;
 
 	/* Propagate change of current control to all related controls */
 	switch (ctrl->id) {
@@ -2077,7 +2077,13 @@ static int ov5670_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_TEST_PATTERN:
 		ret = ov5670_enable_test_pattern(ov5670, ctrl->val);
 		break;
+	case V4L2_CID_HBLANK:
+	case V4L2_CID_LINK_FREQ:
+	case V4L2_CID_PIXEL_RATE:
+		ret = 0;
+		break;
 	default:
+		ret = -EINVAL;
 		dev_info(&client->dev, "%s Unhandled id:0x%x, val:0x%x\n",
 			 __func__, ctrl->id, ctrl->val);
 		break;
-- 
2.39.0

