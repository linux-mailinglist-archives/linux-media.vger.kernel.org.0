Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7568C76E47A
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbjHCJfS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234028AbjHCJfQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:35:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598A93583
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055245;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ApOx9JYyYB42Wtd+wLJUGbXCtlI48Gdo4YHkbgnoBTw=;
        b=ctkHOjgxxhkIaQ7XBFa7j3JFIcwVN5TFL8L0mZ6EFwzeWyPgdwIEj/acqYo5Jdtx6vyqlh
        Ndabnw03qePsiO2NrkfYMJPukp9Xf6Wq/svKvuslcGdMMIm0iGcRedFNhWS+IPyHdl8ra9
        LkCj9gKlnqbUxc9lDmul/4Qkt74wwnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-jRJsrN6tO2Ge7lTqWyPfDA-1; Thu, 03 Aug 2023 05:34:02 -0400
X-MC-Unique: jRJsrN6tO2Ge7lTqWyPfDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49956104458E;
        Thu,  3 Aug 2023 09:34:01 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D412C2166B25;
        Thu,  3 Aug 2023 09:33:58 +0000 (UTC)
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
Subject: [PATCH v5 06/32] media: ov2680: Add ov2680_fill_format() helper function
Date:   Thu,  3 Aug 2023 11:33:21 +0200
Message-ID: <20230803093348.15679-7-hdegoede@redhat.com>
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
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 49 +++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index e6e14743ba1e..f2eb8d85a7e4 100644
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
@@ -315,7 +318,8 @@ static void ov2680_power_down(struct ov2680_dev *sensor)
 	usleep_range(5000, 10000);
 }
 
-static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
+static void ov2680_set_bayer_order(struct ov2680_dev *sensor,
+				   struct v4l2_mbus_framefmt *fmt)
 {
 	int hv_flip = 0;
 
@@ -325,7 +329,19 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
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
@@ -340,7 +356,7 @@ static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
 	if (ret < 0)
 		return ret;
 
-	ov2680_set_bayer_order(sensor);
+	ov2680_set_bayer_order(sensor, &sensor->fmt);
 	return 0;
 }
 
@@ -356,7 +372,7 @@ static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
 	if (ret < 0)
 		return ret;
 
-	ov2680_set_bayer_order(sensor);
+	ov2680_set_bayer_order(sensor, &sensor->fmt);
 	return 0;
 }
 
@@ -614,10 +630,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		goto unlock;
 	}
 
-	fmt->width = mode->width;
-	fmt->height = mode->height;
-	fmt->code = sensor->fmt.code;
-	fmt->colorspace = sensor->fmt.colorspace;
+	ov2680_fill_format(sensor, fmt, mode->width, mode->height);
 
 	sensor->current_mode = mode;
 	sensor->fmt = format->format;
@@ -632,16 +645,11 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
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
@@ -740,11 +748,8 @@ static int ov2680_mode_init(struct ov2680_dev *sensor)
 	const struct ov2680_mode_info *init_mode;
 
 	/* set initial mode */
-	sensor->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
-	sensor->fmt.width = 800;
-	sensor->fmt.height = 600;
-	sensor->fmt.field = V4L2_FIELD_NONE;
-	sensor->fmt.colorspace = V4L2_COLORSPACE_SRGB;
+	ov2680_fill_format(sensor, &sensor->fmt,
+			   OV2680_DEFAULT_WIDTH, OV2680_DEFAULT_HEIGHT);
 
 	sensor->frame_interval.denominator = OV2680_FRAME_RATE;
 	sensor->frame_interval.numerator = 1;
-- 
2.41.0

