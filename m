Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C62776E497
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235211AbjHCJhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235104AbjHCJgQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:36:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB28635B5
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uUprhVBja7nZeiW0CAnKUaW64QHkdPVI2IpjVXsFGuo=;
        b=H5uP+V0LQs7RKVdYDWEih1vsD1XA7cKpyg91Hofy4b3FeGQtDkJKKa8p3RS6qyCpTiMJSC
        MrU5jMwb3teRg3n5W4npXJt9/IMlmn2XQ9mBqAZID7Qb1Kxi1WwCCrtZ6rVU3kASY/W6ji
        8+Cr+/4ofOL3xW5xbrmwXOy2u+00FFE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-mlTnI9MvN9OK0szWtD89kQ-1; Thu, 03 Aug 2023 05:34:24 -0400
X-MC-Unique: mlTnI9MvN9OK0szWtD89kQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FCED856F66;
        Thu,  3 Aug 2023 09:34:24 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A9EA62166B25;
        Thu,  3 Aug 2023 09:34:22 +0000 (UTC)
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
Subject: [PATCH v5 20/32] media: ov2680: Add ov2680_mode struct
Date:   Thu,  3 Aug 2023 11:33:35 +0200
Message-ID: <20230803093348.15679-21-hdegoede@redhat.com>
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

Add an ov2680_mode struct to group together mode related state.

For now this only containst the v4l2_mbus_framefmt and
the frame_interval.

This is a preparation patch for moving to calculating the per mode
settings, which will store more info in the new ov2680_mode struct.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index e7d2e555e1c6..76f97d053e45 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -101,6 +101,11 @@ struct ov2680_ctrls {
 	struct v4l2_ctrl *test_pattern;
 };
 
+struct ov2680_mode {
+	struct v4l2_mbus_framefmt	fmt;
+	struct v4l2_fract		frame_interval;
+};
+
 struct ov2680_dev {
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -118,8 +123,7 @@ struct ov2680_dev {
 	bool				is_streaming;
 
 	struct ov2680_ctrls		ctrls;
-	struct v4l2_mbus_framefmt	fmt;
-	struct v4l2_fract		frame_interval;
+	struct ov2680_mode		mode;
 
 	const struct ov2680_mode_info	*current_mode;
 };
@@ -338,7 +342,7 @@ static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
 	if (ret < 0)
 		return ret;
 
-	ov2680_set_bayer_order(sensor, &sensor->fmt);
+	ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
 	return 0;
 }
 
@@ -354,7 +358,7 @@ static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
 	if (ret < 0)
 		return ret;
 
-	ov2680_set_bayer_order(sensor, &sensor->fmt);
+	ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
 	return 0;
 }
 
@@ -467,7 +471,7 @@ static int ov2680_s_g_frame_interval(struct v4l2_subdev *sd,
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
 	mutex_lock(&sensor->lock);
-	fi->interval = sensor->frame_interval;
+	fi->interval = sensor->mode.frame_interval;
 	mutex_unlock(&sensor->lock);
 
 	return 0;
@@ -515,7 +519,7 @@ static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->pad != 0 || code->index != 0)
 		return -EINVAL;
 
-	code->code = sensor->fmt.code;
+	code->code = sensor->mode.fmt.code;
 
 	return 0;
 }
@@ -536,7 +540,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
 						 format->pad);
 	} else {
-		fmt = &sensor->fmt;
+		fmt = &sensor->mode.fmt;
 	}
 
 	format->format = *fmt;
@@ -582,7 +586,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	sensor->current_mode = mode;
-	sensor->fmt = format->format;
+	sensor->mode.fmt = format->format;
 
 unlock:
 	mutex_unlock(&sensor->lock);
@@ -640,7 +644,7 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
 	if (fie->index || !ov2680_valid_frame_size(fie))
 		return -EINVAL;
 
-	fie->interval = sensor->frame_interval;
+	fie->interval = sensor->mode.frame_interval;
 
 	return 0;
 }
@@ -653,7 +657,7 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* Only apply changes to the controls if the device is powered up */
 	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
-		ov2680_set_bayer_order(sensor, &sensor->fmt);
+		ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
 		return 0;
 	}
 
@@ -711,11 +715,11 @@ static int ov2680_mode_init(struct ov2680_dev *sensor)
 	const struct ov2680_mode_info *init_mode;
 
 	/* set initial mode */
-	ov2680_fill_format(sensor, &sensor->fmt,
+	ov2680_fill_format(sensor, &sensor->mode.fmt,
 			   OV2680_DEFAULT_WIDTH, OV2680_DEFAULT_HEIGHT);
 
-	sensor->frame_interval.denominator = OV2680_FRAME_RATE;
-	sensor->frame_interval.numerator = 1;
+	sensor->mode.frame_interval.denominator = OV2680_FRAME_RATE;
+	sensor->mode.frame_interval.numerator = 1;
 
 	init_mode = &ov2680_mode_init_data;
 
-- 
2.41.0

