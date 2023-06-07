Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3C1F72665D
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjFGQss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjFGQsp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71351FFA
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lrWB72HKqX9PNL8tCkP0y56CPsDbGSYaeXDodOCf1wE=;
        b=g9wCwZC/9SQz+rxwp1rAJ2SOYpiadzCHKWkYhO+OvNtHLN1zCcush0XU6frYkcOCTb7SOm
        R0Kn7bmNbREhAsBoqjatdJikVA2xAsuDw9Cpnk6mM08vXrVEMz9CLv9FOnwVC0Plnzjk8X
        bypwTynrz1iUk9SsywFIGeO/FXfbs/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-3S8uJMnMNWOfxQK56f1Wjw-1; Wed, 07 Jun 2023 12:47:52 -0400
X-MC-Unique: 3S8uJMnMNWOfxQK56f1Wjw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22472811E78;
        Wed,  7 Jun 2023 16:47:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 09588C1603B;
        Wed,  7 Jun 2023 16:47:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 20/28] media: ov2680: Add ov2680_mode struct
Date:   Wed,  7 Jun 2023 18:47:04 +0200
Message-Id: <20230607164712.63579-21-hdegoede@redhat.com>
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
index cb6ec2272376..563b6645fea1 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -100,6 +100,11 @@ struct ov2680_ctrls {
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
@@ -118,8 +123,7 @@ struct ov2680_dev {
 	bool				is_streaming;
 
 	struct ov2680_ctrls		ctrls;
-	struct v4l2_mbus_framefmt	fmt;
-	struct v4l2_fract		frame_interval;
+	struct ov2680_mode		mode;
 
 	const struct ov2680_mode_info	*current_mode;
 };
@@ -337,7 +341,7 @@ static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
 	if (ret < 0)
 		return ret;
 
-	ov2680_set_bayer_order(sensor, &sensor->fmt);
+	ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
 	return 0;
 }
 
@@ -353,7 +357,7 @@ static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
 	if (ret < 0)
 		return ret;
 
-	ov2680_set_bayer_order(sensor, &sensor->fmt);
+	ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
 	return 0;
 }
 
@@ -448,7 +452,7 @@ static int ov2680_s_g_frame_interval(struct v4l2_subdev *sd,
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
 	mutex_lock(&sensor->lock);
-	fi->interval = sensor->frame_interval;
+	fi->interval = sensor->mode.frame_interval;
 	mutex_unlock(&sensor->lock);
 
 	return 0;
@@ -496,7 +500,7 @@ static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->pad != 0 || code->index != 0)
 		return -EINVAL;
 
-	code->code = sensor->fmt.code;
+	code->code = sensor->mode.fmt.code;
 
 	return 0;
 }
@@ -517,7 +521,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
 						 format->pad);
 	} else {
-		fmt = &sensor->fmt;
+		fmt = &sensor->mode.fmt;
 	}
 
 	format->format = *fmt;
@@ -561,7 +565,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	sensor->current_mode = mode;
-	sensor->fmt = format->format;
+	sensor->mode.fmt = format->format;
 
 unlock:
 	mutex_unlock(&sensor->lock);
@@ -606,7 +610,7 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
 	if (fie->index)
 		return -EINVAL;
 
-	fie->interval = sensor->frame_interval;
+	fie->interval = sensor->mode.frame_interval;
 
 	return 0;
 }
@@ -619,7 +623,7 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* Only apply changes to the controls if the device is powered up */
 	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
-		ov2680_set_bayer_order(sensor, &sensor->fmt);
+		ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
 		return 0;
 	}
 
@@ -677,10 +681,10 @@ static int ov2680_mode_init(struct ov2680_dev *sensor)
 	const struct ov2680_mode_info *init_mode;
 
 	/* set initial mode */
-	ov2680_fill_format(sensor, &sensor->fmt, OV2680_DEFAULT_WIDTH, OV2680_DEFAULT_HEIGHT);
+	ov2680_fill_format(sensor, &sensor->mode.fmt, OV2680_DEFAULT_WIDTH, OV2680_DEFAULT_HEIGHT);
 
-	sensor->frame_interval.denominator = OV2680_FRAME_RATE;
-	sensor->frame_interval.numerator = 1;
+	sensor->mode.frame_interval.denominator = OV2680_FRAME_RATE;
+	sensor->mode.frame_interval.numerator = 1;
 
 	init_mode = &ov2680_mode_init_data;
 
-- 
2.40.1

