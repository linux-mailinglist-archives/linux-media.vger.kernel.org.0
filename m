Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52614677BE2
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbjAWMzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbjAWMzB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C89C10418
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JpffBrD2RrJmsYOxcP4CXCGr6ajkN7YFrZb8niFP7qo=;
        b=FKF6KOJaqsMEcp8GoWOjOfB8c6AyS+gN9O+p/qzXdG5Oy01aUB/0G58BNO8GPuIjQy+RVL
        0o+HZJS3zt3Fze0KJYTMzgZDLZB34pou51Jv3vnPvAaCKFBoqskee6IVwTz6Ght7TeCeX/
        XhpYZfiHcZolFXs2uFn1vtaXTPmxZFA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-Zp7kjK5rOKaHdEzchvVK7g-1; Mon, 23 Jan 2023 07:54:00 -0500
X-MC-Unique: Zp7kjK5rOKaHdEzchvVK7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46DB33C0F222;
        Mon, 23 Jan 2023 12:53:59 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 95C18C15BA0;
        Mon, 23 Jan 2023 12:53:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 36/57] media: atomisp: ov2680: Use defines for fps, lines-per-frame and skip-frames
Date:   Mon, 23 Jan 2023 13:51:44 +0100
Message-Id: <20230123125205.622152-37-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The fps, lines-per-frame and skip-frames values are the same for all
resolutions, use defines for these.

The ov2680_res_preview[] incorrectly sets fps to 60 for some low-res
modes, this is incorrect with the current fixed (resolution independent)
lines-per-frame value.

Note this not drop the now no longer used fps, lines-per-frame and
skip-frames struct ov2680_resolution members. The entire struct is going
away in the next patches so that would just cause unnecessary changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/i2c/atomisp-ov2680.c   | 16 ++++------------
 drivers/staging/media/atomisp/i2c/ov2680.h       |  2 ++
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 6693f042f4f2..dee6eb3d8c63 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -685,11 +685,8 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
 static int ov2680_g_frame_interval(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_frame_interval *interval)
 {
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
-
 	interval->interval.numerator = 1;
-	interval->interval.denominator = dev->res->fps;
-
+	interval->interval.denominator = OV2680_FPS;
 	return 0;
 }
 
@@ -733,8 +730,8 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
 	    fie->which > V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	fract.denominator = ov2680_res_preview[fie->index].fps;
 	fract.numerator = 1;
+	fract.denominator = OV2680_FPS;
 
 	fie->interval = fract;
 
@@ -743,12 +740,7 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
 
 static int ov2680_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 {
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
-
-	mutex_lock(&dev->input_lock);
-	*frames = dev->res->skip_frames;
-	mutex_unlock(&dev->input_lock);
-
+	*frames = OV2680_SKIP_FRAMES;
 	return 0;
 }
 
@@ -792,7 +784,7 @@ static int ov2680_init_controls(struct ov2680_device *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
 	struct ov2680_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
-	int exp_max = sensor->res->lines_per_frame - OV2680_INTEGRATION_TIME_MARGIN;
+	int exp_max = OV2680_LINES_PER_FRAME - OV2680_INTEGRATION_TIME_MARGIN;
 
 	v4l2_ctrl_handler_init(hdl, 4);
 
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 9bbb34dd95a5..4c1d20f514b2 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -38,6 +38,8 @@
 /* 1704 * 1294 * 30fps = 66MHz pixel clock */
 #define OV2680_PIXELS_PER_LINE			1704
 #define OV2680_LINES_PER_FRAME			1294
+#define OV2680_FPS				30
+#define OV2680_SKIP_FRAMES			3
 
 /* If possible send 16 extra rows / lines to the ISP as padding */
 #define OV2680_END_MARGIN			16
-- 
2.39.0

