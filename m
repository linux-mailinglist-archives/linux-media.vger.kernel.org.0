Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4BAB731B13
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344847AbjFOOPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345015AbjFOOPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BB32951
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/SJUemBry4tG0XfxVxEXNLEmggSU+WPjWD98UjX00nA=;
        b=ZX9Pb3yDvjE8ACiLVxfg02TvBqcWxk+8LtdLe/F0+Uwnr9Ny+Y8kGgB0xsuN1QO4sZ5q9o
        6HRk+ywleq89Rc1zkTXVDn2Ya5JtQT6Al1MnT93LP295+NtAM9zdZ20gwk75MSqGx9B3dQ
        jGZj2iDe5RD9pRSTZczRJHKzVBJ30Lk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-NOZpRNtRNK2hT-tkjXZzVA-1; Thu, 15 Jun 2023 10:14:47 -0400
X-MC-Unique: NOZpRNtRNK2hT-tkjXZzVA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FE8D1C07838;
        Thu, 15 Jun 2023 14:14:17 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD14429543;
        Thu, 15 Jun 2023 14:14:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 20/28] media: ov2680: Add ov2680_mode struct
Date:   Thu, 15 Jun 2023 16:13:41 +0200
Message-Id: <20230615141349.172363-21-hdegoede@redhat.com>
In-Reply-To: <20230615141349.172363-1-hdegoede@redhat.com>
References: <20230615141349.172363-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
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

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 2ae3696c1e48..3b164021b72a 100644
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
 	struct fwnode_handle		*ep_fwnode;
@@ -119,8 +124,7 @@ struct ov2680_dev {
 	bool				is_streaming;
 
 	struct ov2680_ctrls		ctrls;
-	struct v4l2_mbus_framefmt	fmt;
-	struct v4l2_fract		frame_interval;
+	struct ov2680_mode		mode;
 
 	const struct ov2680_mode_info	*current_mode;
 };
@@ -339,7 +343,7 @@ static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
 	if (ret < 0)
 		return ret;
 
-	ov2680_set_bayer_order(sensor, &sensor->fmt);
+	ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
 	return 0;
 }
 
@@ -355,7 +359,7 @@ static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
 	if (ret < 0)
 		return ret;
 
-	ov2680_set_bayer_order(sensor, &sensor->fmt);
+	ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
 	return 0;
 }
 
@@ -468,7 +472,7 @@ static int ov2680_s_g_frame_interval(struct v4l2_subdev *sd,
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
 	mutex_lock(&sensor->lock);
-	fi->interval = sensor->frame_interval;
+	fi->interval = sensor->mode.frame_interval;
 	mutex_unlock(&sensor->lock);
 
 	return 0;
@@ -516,7 +520,7 @@ static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->pad != 0 || code->index != 0)
 		return -EINVAL;
 
-	code->code = sensor->fmt.code;
+	code->code = sensor->mode.fmt.code;
 
 	return 0;
 }
@@ -537,7 +541,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
 						 format->pad);
 	} else {
-		fmt = &sensor->fmt;
+		fmt = &sensor->mode.fmt;
 	}
 
 	format->format = *fmt;
@@ -583,7 +587,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	sensor->current_mode = mode;
-	sensor->fmt = format->format;
+	sensor->mode.fmt = format->format;
 
 unlock:
 	mutex_unlock(&sensor->lock);
@@ -628,7 +632,7 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
 	if (fie->index)
 		return -EINVAL;
 
-	fie->interval = sensor->frame_interval;
+	fie->interval = sensor->mode.frame_interval;
 
 	return 0;
 }
@@ -641,7 +645,7 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* Only apply changes to the controls if the device is powered up */
 	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
-		ov2680_set_bayer_order(sensor, &sensor->fmt);
+		ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
 		return 0;
 	}
 
@@ -699,11 +703,11 @@ static int ov2680_mode_init(struct ov2680_dev *sensor)
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
2.40.1

