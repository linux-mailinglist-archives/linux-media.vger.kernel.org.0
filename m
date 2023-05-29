Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C31A7147F6
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbjE2Kis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbjE2Kip (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:38:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3387C7
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7HauYV1LQtA42nYHDSUfEJmgwzyegdZHSkyCUgefwzs=;
        b=N5G03P8GtvYmGN43WaoMcf1pmSyTmVhVdKYzYV940iAq9R9BjDcZ5VU+DRMNff3U6E+WfP
        P7nqgaSt0RJ5Ws7Fe//ARSIaIrB+CbQNPwpVjP1gzbP3dTyRBYGb0ZQEPwYuOAwW0+dEqz
        Hr3EIqeWudKo8+/mdwV+GMvFoiHiIhY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-xcRElrO3NW6Ob4WTNwU2gg-1; Mon, 29 May 2023 06:37:56 -0400
X-MC-Unique: xcRElrO3NW6Ob4WTNwU2gg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 824023C13511;
        Mon, 29 May 2023 10:37:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DE0CA2166B2B;
        Mon, 29 May 2023 10:37:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 02/21] media: atomisp: ov2680: s/ov2680_device/ov2680_dev/
Date:   Mon, 29 May 2023 12:37:22 +0200
Message-Id: <20230529103741.11904-3-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

s/ov2680_device/ov2680_dev/ ov2680_dev is used by the generic
drivers/media/i2c/ov2680.c driver. Bring the atomisp ov2680 code
inline to make it easier to port changes between the two,
with the end goal of getting rid of the atomisp specific version.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 38 +++++++++----------
 drivers/staging/media/atomisp/i2c/ov2680.h    |  8 ++--
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index b35ddf611e2b..cd6557c9a4c9 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -45,7 +45,7 @@ static int ov2680_write_reg_array(struct i2c_client *client,
 	return 0;
 }
 
-static void ov2680_set_bayer_order(struct ov2680_device *sensor, struct v4l2_mbus_framefmt *fmt)
+static void ov2680_set_bayer_order(struct ov2680_dev *sensor, struct v4l2_mbus_framefmt *fmt)
 {
 	static const int ov2680_hv_flip_bayer_order[] = {
 		MEDIA_BUS_FMT_SBGGR10_1X10,
@@ -64,7 +64,7 @@ static void ov2680_set_bayer_order(struct ov2680_device *sensor, struct v4l2_mbu
 	fmt->code = ov2680_hv_flip_bayer_order[hv_flip];
 }
 
-static int ov2680_set_vflip(struct ov2680_device *sensor, s32 val)
+static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
 {
 	int ret;
 
@@ -79,7 +79,7 @@ static int ov2680_set_vflip(struct ov2680_device *sensor, s32 val)
 	return 0;
 }
 
-static int ov2680_set_hflip(struct ov2680_device *sensor, s32 val)
+static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
 {
 	int ret;
 
@@ -94,17 +94,17 @@ static int ov2680_set_hflip(struct ov2680_device *sensor, s32 val)
 	return 0;
 }
 
-static int ov2680_exposure_set(struct ov2680_device *sensor, u32 exp)
+static int ov2680_exposure_set(struct ov2680_dev *sensor, u32 exp)
 {
 	return ov_write_reg24(sensor->client, OV2680_REG_EXPOSURE_PK_HIGH, exp << 4);
 }
 
-static int ov2680_gain_set(struct ov2680_device *sensor, u32 gain)
+static int ov2680_gain_set(struct ov2680_dev *sensor, u32 gain)
 {
 	return ov_write_reg16(sensor->client, OV2680_REG_GAIN_PK, gain);
 }
 
-static int ov2680_test_pattern_set(struct ov2680_device *sensor, int value)
+static int ov2680_test_pattern_set(struct ov2680_dev *sensor, int value)
 {
 	int ret;
 
@@ -125,7 +125,7 @@ static int ov2680_test_pattern_set(struct ov2680_device *sensor, int value)
 static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
-	struct ov2680_device *sensor = to_ov2680_sensor(sd);
+	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
 	int ret;
 
 	/* Only apply changes to the controls if the device is powered up */
@@ -174,7 +174,7 @@ static int ov2680_init_registers(struct v4l2_subdev *sd)
 }
 
 static struct v4l2_mbus_framefmt *
-__ov2680_get_pad_format(struct ov2680_device *sensor,
+__ov2680_get_pad_format(struct ov2680_dev *sensor,
 			struct v4l2_subdev_state *state,
 			unsigned int pad, enum v4l2_subdev_format_whence which)
 {
@@ -184,7 +184,7 @@ __ov2680_get_pad_format(struct ov2680_device *sensor,
 	return &sensor->mode.fmt;
 }
 
-static void ov2680_fill_format(struct ov2680_device *sensor,
+static void ov2680_fill_format(struct ov2680_dev *sensor,
 			       struct v4l2_mbus_framefmt *fmt,
 			       unsigned int width, unsigned int height)
 {
@@ -195,7 +195,7 @@ static void ov2680_fill_format(struct ov2680_device *sensor,
 	ov2680_set_bayer_order(sensor, fmt);
 }
 
-static void ov2680_calc_mode(struct ov2680_device *sensor, int width, int height)
+static void ov2680_calc_mode(struct ov2680_dev *sensor, int width, int height)
 {
 	int orig_width = width;
 	int orig_height = height;
@@ -221,7 +221,7 @@ static void ov2680_calc_mode(struct ov2680_device *sensor, int width, int height
 	sensor->mode.vts = OV2680_LINES_PER_FRAME;
 }
 
-static int ov2680_set_mode(struct ov2680_device *sensor)
+static int ov2680_set_mode(struct ov2680_dev *sensor)
 {
 	struct i2c_client *client = sensor->client;
 	u8 pll_div, unknown, inc, fmt1, fmt2;
@@ -322,7 +322,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
-	struct ov2680_device *sensor = to_ov2680_sensor(sd);
+	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int width, height;
 
@@ -347,7 +347,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
-	struct ov2680_device *sensor = to_ov2680_sensor(sd);
+	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
 	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad, format->which);
@@ -390,7 +390,7 @@ static int ov2680_detect(struct i2c_client *client)
 
 static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	struct ov2680_device *sensor = to_ov2680_sensor(sd);
+	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
@@ -548,7 +548,7 @@ static const struct v4l2_subdev_ops ov2680_ops = {
 	.sensor = &ov2680_sensor_ops,
 };
 
-static int ov2680_init_controls(struct ov2680_device *sensor)
+static int ov2680_init_controls(struct ov2680_dev *sensor)
 {
 	static const char * const test_pattern_menu[] = {
 		"Disabled",
@@ -590,7 +590,7 @@ static int ov2680_init_controls(struct ov2680_device *sensor)
 static void ov2680_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov2680_device *sensor = to_ov2680_sensor(sd);
+	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
 
 	dev_dbg(&client->dev, "ov2680_remove...\n");
 
@@ -605,7 +605,7 @@ static void ov2680_remove(struct i2c_client *client)
 static int ov2680_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct ov2680_device *sensor;
+	struct ov2680_dev *sensor;
 	int ret;
 
 	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
@@ -673,7 +673,7 @@ static int ov2680_probe(struct i2c_client *client)
 static int ov2680_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov2680_device *sensor = to_ov2680_sensor(sd);
+	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
 
 	gpiod_set_value_cansleep(sensor->powerdown, 1);
 	return 0;
@@ -682,7 +682,7 @@ static int ov2680_suspend(struct device *dev)
 static int ov2680_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov2680_device *sensor = to_ov2680_sensor(sd);
+	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
 
 	/* according to DS, at least 5ms is needed after DOVDD (enabled by ACPI) */
 	usleep_range(5000, 6000);
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index a3eeb0c2de5c..077ca6ee08b6 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -106,7 +106,7 @@
 /*
  * ov2680 device structure.
  */
-struct ov2680_device {
+struct ov2680_dev {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct mutex input_lock;
@@ -151,12 +151,12 @@ struct ov2680_reg {
 	u32 val;	/* @set value for read/mod/write, @mask */
 };
 
-#define to_ov2680_sensor(x) container_of(x, struct ov2680_device, sd)
+#define to_ov2680_sensor(x) container_of(x, struct ov2680_dev, sd)
 
 static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 {
-	struct ov2680_device *sensor =
-		container_of(ctrl->handler, struct ov2680_device, ctrls.handler);
+	struct ov2680_dev *sensor =
+		container_of(ctrl->handler, struct ov2680_dev, ctrls.handler);
 
 	return &sensor->sd;
 }
-- 
2.40.1

