Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5005FFD7F
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiJPGQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiJPGQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:16:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85833ED51
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:16:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 278AD491;
        Sun, 16 Oct 2022 08:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900966;
        bh=3tYPjljsozIMbFKBtCQ7Z1NcFs/pW7N9F30oeBmmoDo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZCEFNtUw168YnKpufzbUg5i+zZUW793MYlt68C3eMKky0gMIXTAoTBuNKsZjR5NEt
         b1MRjUMqIYKLHSogLBNTywVR8b90KfhWHHYJ5zvi6b8o6G1rzCWeQINzHjsF+xQd/I
         tgWOmR5NkJ5DXN+R0ZMtCWtq9SxOa+O9Fw/0EjGk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 12/20] media: i2c: imx290: Add exposure time control
Date:   Sun, 16 Oct 2022 09:15:15 +0300
Message-Id: <20221016061523.30127-13-laurent.pinchart@ideasonboard.com>
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

Support configuring the exposure time, which is expressed as the
complement of the exposure time (frame period minus integration time).
The frame period is currently fixed.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 93fd043669dc..a3d1394819ec 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -103,6 +103,8 @@
 #define IMX290_PGCTRL_THRU				BIT(1)
 #define IMX290_PGCTRL_MODE(n)				((n) << 4)
 
+#define IMX290_VMAX_DEFAULT				1125
+
 static const char * const imx290_supply_name[] = {
 	"vdda",
 	"vddd",
@@ -176,7 +178,7 @@ static const char * const imx290_test_pattern_menu[] = {
 
 static const struct imx290_regval imx290_global_init_settings[] = {
 	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
-	{ IMX290_VMAX, 1125 },
+	{ IMX290_VMAX, IMX290_VMAX_DEFAULT },
 	{ IMX290_EXTCK_FREQ, 0x2520 },
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_WINPH, 0 },
@@ -480,6 +482,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_GAIN:
 		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
 		break;
+
+	case V4L2_CID_EXPOSURE:
+		ret = imx290_write(imx290, IMX290_SHS1,
+				   IMX290_VMAX_DEFAULT - ctrl->val - 1, NULL);
+		break;
+
 	case V4L2_CID_TEST_PATTERN:
 		if (ctrl->val) {
 			imx290_write(imx290, IMX290_BLKLEVEL, 0, &ret);
@@ -1008,12 +1016,16 @@ static int imx290_probe(struct i2c_client *client)
 	 */
 	imx290_entity_init_cfg(&imx290->sd, NULL);
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
+	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
 	imx290->ctrls.lock = &imx290->lock;
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_GAIN, 0, 72, 1, 0);
 
+	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
+			  IMX290_VMAX_DEFAULT - 2);
+
 	imx290->link_freq =
 		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
 				       V4L2_CID_LINK_FREQ,
-- 
Regards,

Laurent Pinchart

