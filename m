Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3BC6D31C0
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjDAPAx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjDAPAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAC81CBA4
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361199;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pkgaf5c4d1VhFzjzxgJCnOcCSZwf5jijmDkhU+8kZ8Y=;
        b=JjufkcWwtDhtYjhbKHH6KKZl/ZjetJWWVreCQ7jT2aLeKt+KBKcxAi3nvxhf9cDHnCfEQz
        jLMpIOL5hgycyooaB7Ho1XD8wun6P4156soFS4HfQnepCYdO6F1s2THVf8MF1EPWCvSE+2
        QfqsYmXhZlZ8mFHeeJd6dNFK0PANigo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-BoVStUByNLq80bc9suS1LQ-1; Sat, 01 Apr 2023 10:59:58 -0400
X-MC-Unique: BoVStUByNLq80bc9suS1LQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 983DE3C0253E;
        Sat,  1 Apr 2023 14:59:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 135C3400F59;
        Sat,  1 Apr 2023 14:59:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 12/28] media: atomisp: gc0310: Add exposure and gain controls
Date:   Sat,  1 Apr 2023 16:59:10 +0200
Message-Id: <20230401145926.596216-13-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add exposure and gain controls. This allows controlling
the exposure and gain through standard v4l2 IOCTLs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 93 ++++++++++++++++---
 drivers/staging/media/atomisp/i2c/gc0310.h    |  7 +-
 2 files changed, 86 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 115493641010..6c0877ab96e3 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -57,14 +57,64 @@ static int gc0310_write_reg_array(struct i2c_client *client,
 	return 0;
 }
 
+static int gc0310_exposure_set(struct gc0310_device *dev, u32 exp)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&dev->sd);
+
+	return i2c_smbus_write_word_swapped(client, GC0310_AEC_PK_EXPO_H, exp);
+}
+
+static int gc0310_gain_set(struct gc0310_device *dev, u32 gain)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&dev->sd);
+	u8 again, dgain;
+	int ret;
+
+	/* Taken from original driver, this never sets dgain lower then 32? */
+
+	/* Change 0 - 95 to 32 - 127 */
+	gain += 32;
+
+	if (gain < 64) {
+		again = 0x0; /* sqrt(2) */
+		dgain = gain;
+	} else {
+		again = 0x2; /* 2 * sqrt(2) */
+		dgain = gain / 2;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, GC0310_AGC_ADJ, again);
+	if (ret)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, GC0310_DGC_ADJ, dgain);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 {
-	int ret = 0;
+	struct gc0310_device *dev =
+		container_of(ctrl->handler, struct gc0310_device, ctrls.handler);
+	int ret;
+
+	if (!dev->power_on)
+		return 0;
 
 	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE:
+		ret = gc0310_exposure_set(dev, ctrl->val);
+		break;
+	case V4L2_CID_GAIN:
+		ret = gc0310_gain_set(dev, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
+		break;
 	}
+
 	return ret;
 }
 
@@ -83,13 +133,18 @@ static int gc0310_init(struct v4l2_subdev *sd)
 	/* set initial registers */
 	ret = gc0310_write_reg_array(client, gc0310_reset_register,
 				     ARRAY_SIZE(gc0310_reset_register));
+	if (ret)
+		goto out_unlock;
 
 	/* restore settings */
 	gc0310_res = gc0310_res_preview;
 	N_RES = N_RES_PREVIEW;
 
-	mutex_unlock(&dev->input_lock);
+	/* restore value of all ctrls */
+	ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
 
+out_unlock:
+	mutex_unlock(&dev->input_lock);
 	return ret;
 }
 
@@ -545,6 +600,26 @@ static const struct v4l2_subdev_ops gc0310_ops = {
 	.sensor = &gc0310_sensor_ops,
 };
 
+static int gc0310_init_controls(struct gc0310_device *dev)
+{
+	struct v4l2_ctrl_handler *hdl = &dev->ctrls.handler;
+
+	v4l2_ctrl_handler_init(hdl, 2);
+
+	/* Use same lock for controls as for everything else. */
+	hdl->lock = &dev->input_lock;
+	dev->sd.ctrl_handler = hdl;
+
+	dev->ctrls.exposure =
+		v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_EXPOSURE, 0, 4095, 1, 1023);
+
+	/* 32 steps at base gain 1 + 64 half steps at base gain 2 */
+	dev->ctrls.gain =
+		v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_GAIN, 0, 95, 1, 31);
+
+	return hdl->error;
+}
+
 static void gc0310_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
@@ -556,7 +631,7 @@ static void gc0310_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
-	v4l2_ctrl_handler_free(&dev->ctrl_handler);
+	v4l2_ctrl_handler_free(&dev->ctrls.handler);
 	kfree(dev);
 }
 
@@ -595,21 +670,13 @@ static int gc0310_probe(struct i2c_client *client)
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
 	dev->format.code = MEDIA_BUS_FMT_SGRBG8_1X8;
 	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	ret = v4l2_ctrl_handler_init(&dev->ctrl_handler, 0);
+
+	ret = gc0310_init_controls(dev);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
 	}
 
-	if (dev->ctrl_handler.error) {
-		gc0310_remove(client);
-		return dev->ctrl_handler.error;
-	}
-
-	/* Use same lock for controls as for everything else. */
-	dev->ctrl_handler.lock = &dev->input_lock;
-	dev->sd.ctrl_handler = &dev->ctrl_handler;
-
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
 	if (ret)
 		gc0310_remove(client);
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index 540334bc7b0e..c15ca2b807f9 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -126,12 +126,17 @@ struct gc0310_device {
 	struct media_pad pad;
 	struct v4l2_mbus_framefmt format;
 	struct mutex input_lock;
-	struct v4l2_ctrl_handler ctrl_handler;
 
 	struct camera_sensor_platform_data *platform_data;
 	struct gc0310_resolution *res;
 	u8 type;
 	bool power_on;
+
+	struct gc0310_ctrls {
+		struct v4l2_ctrl_handler handler;
+		struct v4l2_ctrl *exposure;
+		struct v4l2_ctrl *gain;
+	} ctrls;
 };
 
 /**
-- 
2.39.1

