Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3ADE5FFD81
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiJPGQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiJPGQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:16:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5428738694
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:16:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF9241804;
        Sun, 16 Oct 2022 08:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900969;
        bh=xzDptOdAaWlbBEvmzAxEpEd1hc4CwiZVV+xluYKf2R4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iXHcCzPME8vXfJB1Aqjt+BjjdabeN1q14frtyu1yyA3KZXam+C99Pc1csNaKCYab5
         l02oqnMJ4/jhQRz9sRUIMp7IeY8ICLH7C28y6dI0nEt73GuERZpl1mE63xJphrLFzF
         BRTL0lYMpop2ckfelYzZcBLB0kVSGlUCPBCj2es8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 14/20] media: i2c: imx290: Split control initialization to separate function
Date:   Sun, 16 Oct 2022 09:15:17 +0300
Message-Id: <20221016061523.30127-15-laurent.pinchart@ideasonboard.com>
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

The imx290_probe() function is too large. Split control initialzation to
a dedicated function to increase code readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 109 +++++++++++++++++++++----------------
 1 file changed, 61 insertions(+), 48 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 43ac6244c3a2..5deeab594e9b 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -878,6 +878,62 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
+static int imx290_ctrl_init(struct imx290 *imx290)
+{
+	int ret;
+
+	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
+	imx290->ctrls.lock = &imx290->lock;
+
+	/*
+	 * The sensor has an analog gain and a digital gain, both controlled
+	 * through a single gain value, expressed in 0.3dB increments. Values
+	 * from 0.0dB (0) to 30.0dB (100) apply analog gain only, higher values
+	 * up to 72.0dB (240) add further digital gain. Limit the range to
+	 * analog gain only, support for digital gain can be added separately
+	 * if needed.
+	 *
+	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
+	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
+	 * gain. When support for those sensors gets added to the driver, the
+	 * gain control should be adjusted accordingly.
+	 */
+	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+			  V4L2_CID_GAIN, 0, 100, 1, 0);
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
@@ -1016,54 +1072,10 @@ static int imx290_probe(struct i2c_client *client)
 	 */
 	imx290_entity_init_cfg(&imx290->sd, NULL);
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
-	imx290->ctrls.lock = &imx290->lock;
-
-	/*
-	 * The sensor has an analog gain and a digital gain, both controlled
-	 * through a single gain value, expressed in 0.3dB increments. Values
-	 * from 0.0dB (0) to 30.0dB (100) apply analog gain only, higher values
-	 * up to 72.0dB (240) add further digital gain. Limit the range to
-	 * analog gain only, support for digital gain can be added separately
-	 * if needed.
-	 *
-	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
-	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
-	 * gain. When support for those sensors gets added to the driver, the
-	 * gain control should be adjusted accordingly.
-	 */
-	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-			  V4L2_CID_GAIN, 0, 100, 1, 0);
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
@@ -1104,6 +1116,7 @@ static int imx290_probe(struct i2c_client *client)
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

