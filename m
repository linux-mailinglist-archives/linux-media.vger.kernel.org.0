Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6BF76E4A4
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235094AbjHCJhc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234112AbjHCJg0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:36:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DE43A9A
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hnAwueLUQXgVYtRRO1NBVgEiemeasyJQZpVC6Flu85w=;
        b=FtGKt/mHx5xm2VrjfN/z5oce3LNOThluY4QO7JihqAhocUBqUi1UK5g7+s0wA8tQIB1g8l
        +sdWgKfUB2tNOmYfZv9SEU23UCigTgrYe3kKQw8iKc9vbJrCOyGWKN7SzOEvF0GdyHEOiJ
        eXDDC+hneCzqBJwW12E4AZ2f6oc5tso=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646--1JOHr2rMLi6TO83GePXIw-1; Thu, 03 Aug 2023 05:34:37 -0400
X-MC-Unique: -1JOHr2rMLi6TO83GePXIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F74D810BB2;
        Thu,  3 Aug 2023 09:34:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BE6142166B25;
        Thu,  3 Aug 2023 09:34:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 28/32] media: ov2680: Add link-freq and pixel-rate controls
Date:   Thu,  3 Aug 2023 11:33:43 +0200
Message-ID: <20230803093348.15679-29-hdegoede@redhat.com>
In-Reply-To: <20230803093348.15679-1-hdegoede@redhat.com>
References: <20230803093348.15679-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
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
Changes in v5:
- Make pixel_rate u64 instead of s64 for do_div() to fix:
  drivers/media/i2c/ov2680.c:1092:2: warning: comparison of distinct pointer types ('typeof ((sensor->pixel_rate)) *' (aka 'long long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]

Changes in v4:
- Use do_div to calculate pixel_rate to avoid unresolved __divdi3 symbol
---
 drivers/media/i2c/ov2680.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 1f59013e440c..83ec034b5307 100644
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
@@ -121,6 +127,8 @@ struct ov2680_ctrls {
 	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *test_pattern;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
 };
 
 struct ov2680_mode {
@@ -147,6 +155,8 @@ struct ov2680_dev {
 	struct clk			*xvclk;
 	u32				xvclk_freq;
 	u8				pll_mult;
+	s64				link_freq[1];
+	u64				pixel_rate;
 	struct regulator_bulk_data	supplies[OV2680_NUM_SUPPLIES];
 
 	struct gpio_desc		*pwdn_gpio;
@@ -931,6 +941,12 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
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
@@ -938,6 +954,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 
 	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	sensor->sd.ctrl_handler = hdl;
 
@@ -1067,6 +1084,13 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 
 	sensor->pll_mult = ov2680_pll_multipliers[i];
 
+	sensor->link_freq[0] = sensor->xvclk_freq / OV2680_PLL_PREDIV0 /
+			       OV2680_PLL_PREDIV * sensor->pll_mult;
+
+	/* CSI-2 is double data rate, bus-format is 10 bpp */
+	sensor->pixel_rate = sensor->link_freq[0] * 2;
+	do_div(sensor->pixel_rate, 10);
+
 	return 0;
 }
 
-- 
2.41.0

