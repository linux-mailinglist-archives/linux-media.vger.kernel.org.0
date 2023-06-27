Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4440073FCBC
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 15:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbjF0NVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 09:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjF0NUw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 09:20:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19708295E
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 06:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687871961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WDuXK4TzfQmkHMyqANeUfd78Tf+eIGVy7F+h3zTwfaM=;
        b=fA+dyNgR9H8rNpztLhgqYHT4/qo2nf1JaFOLapa4rtabnAwG1ptsg3Y2c1BrvTVlaQcz4m
        c88j6AWQMQAUhlOgF8/FyANlPk8+N9AEC1KqWl1AP8sWQEGXRhbRyhN5ZVxLCjujyiJ5QV
        ZZEjf7Xh+yaWwScwzGP+RPx9ImxIJ2s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-Udlqp_xKNkiLZcYlaCEhnQ-1; Tue, 27 Jun 2023 09:19:18 -0400
X-MC-Unique: Udlqp_xKNkiLZcYlaCEhnQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79DB58C7C2B;
        Tue, 27 Jun 2023 13:19:17 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D3F08401061;
        Tue, 27 Jun 2023 13:19:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 28/29] media: ov2680: Add link-freq and pixel-rate controls
Date:   Tue, 27 Jun 2023 15:18:29 +0200
Message-ID: <20230627131830.54601-29-hdegoede@redhat.com>
In-Reply-To: <20230627131830.54601-1-hdegoede@redhat.com>
References: <20230627131830.54601-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add read-only link-freq and pixel-rate controls. This is necessary for
the sensor to work with the ipu3-cio2 driver and for libcamera.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 8bc542df1890..95d3152ddd22 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -75,6 +75,12 @@
 #define OV2680_MIN_CROP_WIDTH			2
 #define OV2680_MIN_CROP_HEIGHT			2
 
+/* Fixed pre-div of 1/2 */
+#define OV2680_PLL_PREDIV0			2
+
+/* Pre-div configurable through reg 0x3080, left at its default of 0x02 : 1/2 */
+#define OV2680_PLL_PREDIV			2
+
 /* 66MHz pixel clock: 66MHz / 1704 * 1294 = 30fps */
 #define OV2680_PIXELS_PER_LINE			1704
 #define OV2680_LINES_PER_FRAME			1294
@@ -118,6 +124,8 @@ struct ov2680_ctrls {
 	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *test_pattern;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
 };
 
 struct ov2680_mode {
@@ -145,6 +153,8 @@ struct ov2680_dev {
 	struct clk			*xvclk;
 	u32				xvclk_freq;
 	u8				pll_mult;
+	s64				link_freq[1];
+	s64				pixel_rate;
 	struct regulator_bulk_data	supplies[OV2680_NUM_SUPPLIES];
 
 	struct gpio_desc		*pwdn_gpio;
@@ -906,6 +916,12 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
 					0, 1023, 1, 250);
 
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
+						  0, 0, sensor->link_freq);
+	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE,
+					      0, sensor->pixel_rate,
+					      1, sensor->pixel_rate);
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto cleanup_entity;
@@ -913,6 +929,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 
 	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	sensor->sd.ctrl_handler = hdl;
 
@@ -1030,6 +1047,12 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 
 	sensor->pll_mult = ov2680_pll_multipliers[i];
 
+	sensor->link_freq[0] = sensor->xvclk_freq / OV2680_PLL_PREDIV0 /
+			       OV2680_PLL_PREDIV * sensor->pll_mult;
+
+	/* CSI-2 is double data rate, bus-format is 10 bpp */
+	sensor->pixel_rate = sensor->link_freq[0] * 2 / 10;
+
 	return 0;
 }
 
-- 
2.41.0

