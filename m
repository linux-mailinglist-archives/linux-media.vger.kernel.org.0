Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92E5E57C662
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbiGUIgE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbiGUIgD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:36:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A001180F
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:36:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1269612F3;
        Thu, 21 Jul 2022 10:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392561;
        bh=ah9EY9oHdq0zWuHTk/V77BrXKa1jtKUA6KVGtM4yDoA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UNa1r0hgxx6jEL1PkaI4EX2PDpxCrCsUspXz/ElkvXgVPdvAjDHcnFDYmZivsZAsO
         66h+wJD1UKFrc7TGqOcHZ67dLTCuKYAuNqggwVQZGE0wsjYk4rcmPCzlzgvS2WP5TL
         inq6X1cPD2Rv8ZDXDzUDICrsa/3aFyzZ9ZqNpxYE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 13/19] media: i2c: imx290: Split control initialization to separate function
Date:   Thu, 21 Jul 2022 11:35:34 +0300
Message-Id: <20220721083540.1525-14-laurent.pinchart@ideasonboard.com>
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

The imx290_probe() function is too large. Split control initialzation to
a dedicated function to increase code readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 83 ++++++++++++++++++++++----------------
 1 file changed, 48 insertions(+), 35 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 1bd464932432..4408dd3e191f 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -878,6 +878,49 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
+static int imx290_ctrl_init(struct imx290 *imx290)
+{
+	int ret;
+
+	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
+	imx290->ctrls.lock = &imx290->lock;
+
+	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+			  V4L2_CID_GAIN, 0, 240, 1, 0);
+
+	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
+			  IMX290_VMAX_DEFAULT - 2);
+
+	imx290->link_freq =
+		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       imx290_link_freqs_num(imx290) - 1, 0,
+				       imx290_link_freqs_ptr(imx290));
+	if (imx290->link_freq)
+		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE,
+					       1, INT_MAX, 1,
+					       imx290_calc_pixel_rate(imx290));
+
+	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
+				     0, 0, imx290_test_pattern_menu);
+
+	imx290->sd.ctrl_handler = &imx290->ctrls;
+
+	if (imx290->ctrls.error) {
+		ret = imx290->ctrls.error;
+		v4l2_ctrl_handler_free(&imx290->ctrls);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * Returns 0 if all link frequencies used by the driver for the given number
  * of MIPI data lanes are mentioned in the device tree, or the value of the
@@ -1016,41 +1059,10 @@ static int imx290_probe(struct i2c_client *client)
 	 */
 	imx290_entity_init_cfg(&imx290->sd, NULL);
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
-	imx290->ctrls.lock = &imx290->lock;
-
-	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-			  V4L2_CID_GAIN, 0, 240, 1, 0);
-
-	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
-			  IMX290_VMAX_DEFAULT - 2);
-
-	imx290->link_freq =
-		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
-				       V4L2_CID_LINK_FREQ,
-				       imx290_link_freqs_num(imx290) - 1, 0,
-				       imx290_link_freqs_ptr(imx290));
-	if (imx290->link_freq)
-		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
-	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-					       V4L2_CID_PIXEL_RATE,
-					       1, INT_MAX, 1,
-					       imx290_calc_pixel_rate(imx290));
-
-	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
-				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
-				     0, 0, imx290_test_pattern_menu);
-
-	imx290->sd.ctrl_handler = &imx290->ctrls;
-
-	if (imx290->ctrls.error) {
-		dev_err(dev, "Control initialization error %d\n",
-			imx290->ctrls.error);
-		ret = imx290->ctrls.error;
-		goto free_ctrl;
+	ret = imx290_ctrl_init(imx290);
+	if (ret < 0) {
+		dev_err(dev, "Control initialization error %d\n", ret);
+		goto free_mutex;
 	}
 
 	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
@@ -1091,6 +1103,7 @@ static int imx290_probe(struct i2c_client *client)
 	media_entity_cleanup(&imx290->sd.entity);
 free_ctrl:
 	v4l2_ctrl_handler_free(&imx290->ctrls);
+free_mutex:
 	mutex_destroy(&imx290->lock);
 free_err:
 	v4l2_fwnode_endpoint_free(&ep);
-- 
Regards,

Laurent Pinchart

