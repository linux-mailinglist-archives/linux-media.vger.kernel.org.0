Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C5172664F
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjFGQsV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjFGQsT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8603B1FC8
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156451;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xLLAZh13DJUzhWp9Kgr6UgosVwz7mu1gg27OFcXL+xo=;
        b=ZhNRfffJh8LpmM/uxkiK7/34oVJlq4xbiQWUWsWC4akWt0VB176MgO2CDv583eHQqMIl3w
        EpwOTl84DnaJp+utqZ7nVI9V+lAyKlUohWpLWkUGljeSv/Anr/nuHNHUwbXRbCzPeT3Lqy
        3VCTA/v7xayizo3REgzJOf3Ck0icIbU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-LUWqC4RePgGY1V6DObU_Iw-1; Wed, 07 Jun 2023 12:47:28 -0400
X-MC-Unique: LUWqC4RePgGY1V6DObU_Iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBF2E8032EF;
        Wed,  7 Jun 2023 16:47:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B3585C1603B;
        Wed,  7 Jun 2023 16:47:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 06/28] media: ov2680: Add ov2680_fill_format() helper function
Date:   Wed,  7 Jun 2023 18:46:50 +0200
Message-Id: <20230607164712.63579-7-hdegoede@redhat.com>
In-Reply-To: <20230607164712.63579-1-hdegoede@redhat.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a ov2680_fill_format() helper function and use this everywhere were
a v4l2_mbus_framefmt struct needs to be filled in so that the driver always
fills it consistently.

This is a preparation patch for fixing ov2680_set_fmt()
which == V4L2_SUBDEV_FORMAT_TRY calls not properly filling in
the passed in v4l2_mbus_framefmt struct.

Note that for ov2680_init_cfg() this now simply always fills
the try_fmt struct of the passed in sd_state. This is correct because
ov2680_init_cfg() is never called with a NULL sd_state so the old
sd_state check is not necessary.

Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 47 ++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index a26a6f18f4f1..9d26437a1297 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -54,6 +54,9 @@
 #define OV2680_WIDTH_MAX		1600
 #define OV2680_HEIGHT_MAX		1200
 
+#define OV2680_DEFAULT_WIDTH			800
+#define OV2680_DEFAULT_HEIGHT			600
+
 enum ov2680_mode_id {
 	OV2680_MODE_QUXGA_800_600,
 	OV2680_MODE_720P_1280_720,
@@ -315,7 +318,7 @@ static void ov2680_power_down(struct ov2680_dev *sensor)
 	usleep_range(5000, 10000);
 }
 
-static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
+static void ov2680_set_bayer_order(struct ov2680_dev *sensor, struct v4l2_mbus_framefmt *fmt)
 {
 	int hv_flip = 0;
 
@@ -325,7 +328,19 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
 	if (sensor->ctrls.hflip && sensor->ctrls.hflip->val)
 		hv_flip += 2;
 
-	sensor->fmt.code = ov2680_hv_flip_bayer_order[hv_flip];
+	fmt->code = ov2680_hv_flip_bayer_order[hv_flip];
+}
+
+static void ov2680_fill_format(struct ov2680_dev *sensor,
+			       struct v4l2_mbus_framefmt *fmt,
+			       unsigned int width, unsigned int height)
+{
+	memset(fmt, 0, sizeof(*fmt));
+	fmt->width = width;
+	fmt->height = height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	ov2680_set_bayer_order(sensor, fmt);
 }
 
 static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
@@ -339,7 +354,7 @@ static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
 	if (ret < 0)
 		return ret;
 
-	ov2680_set_bayer_order(sensor);
+	ov2680_set_bayer_order(sensor, &sensor->fmt);
 	return 0;
 }
 
@@ -354,7 +369,7 @@ static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
 	if (ret < 0)
 		return ret;
 
-	ov2680_set_bayer_order(sensor);
+	ov2680_set_bayer_order(sensor, &sensor->fmt);
 	return 0;
 }
 
@@ -611,10 +626,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		goto unlock;
 	}
 
-	fmt->width = mode->width;
-	fmt->height = mode->height;
-	fmt->code = sensor->fmt.code;
-	fmt->colorspace = sensor->fmt.colorspace;
+	ov2680_fill_format(sensor, fmt, mode->width, mode->height);
 
 	sensor->current_mode = mode;
 	sensor->fmt = format->format;
@@ -629,16 +641,11 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 static int ov2680_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *sd_state)
 {
-	struct v4l2_subdev_format fmt = {
-		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
-		: V4L2_SUBDEV_FORMAT_ACTIVE,
-		.format = {
-			.width = 800,
-			.height = 600,
-		}
-	};
+	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
-	return ov2680_set_fmt(sd, sd_state, &fmt);
+	ov2680_fill_format(sensor, &sd_state->pads[0].try_fmt,
+			   OV2680_DEFAULT_WIDTH, OV2680_DEFAULT_HEIGHT);
+	return 0;
 }
 
 static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
@@ -737,11 +744,7 @@ static int ov2680_mode_init(struct ov2680_dev *sensor)
 	const struct ov2680_mode_info *init_mode;
 
 	/* set initial mode */
-	sensor->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
-	sensor->fmt.width = 800;
-	sensor->fmt.height = 600;
-	sensor->fmt.field = V4L2_FIELD_NONE;
-	sensor->fmt.colorspace = V4L2_COLORSPACE_SRGB;
+	ov2680_fill_format(sensor, &sensor->fmt, OV2680_DEFAULT_WIDTH, OV2680_DEFAULT_HEIGHT);
 
 	sensor->frame_interval.denominator = OV2680_FRAME_RATE;
 	sensor->frame_interval.numerator = 1;
-- 
2.40.1

