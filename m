Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86205677BF2
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbjAWMzp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbjAWMzo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0099038
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478493;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bdIXTawJTduh811KfBvk9GD+FMR9V4IQSL778HiVQ6c=;
        b=VZRY/hmkxSZ3WgPdMaA4VyenYrT0HM6ByvUZ7l7DW1c+EDgC96EKnjUOAxJ3exAoOQGWwa
        fb68IpMAx+ffY3fqatKKS1Rlq/PsXmEaRrvXKF4s/psc6dA5oXiYr5ZQoFXXmPL8uec05i
        3I1GWr+7Phh47Hb/Ay1hohcHM6z8QAE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202--ah8cFJbMEqYJcME93wuJA-1; Mon, 23 Jan 2023 07:54:50 -0500
X-MC-Unique: -ah8cFJbMEqYJcME93wuJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BD2A2805581;
        Mon, 23 Jan 2023 12:54:49 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F2FCFC15BA0;
        Mon, 23 Jan 2023 12:54:46 +0000 (UTC)
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
Subject: [PATCH 54/57] media: atomisp: ov2722: Power on sensor from set_fmt() callback
Date:   Mon, 23 Jan 2023 13:52:02 +0100
Message-Id: <20230123125205.622152-55-hdegoede@redhat.com>
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

Depending on which order userspace makes various v4l2 calls, the sensor
might still be powered down when set_fmt is called.

What should really happen here is delay the writing of the mode-related
registers till streaming is started, but for now use the same quick fix
as the atomisp_ov2680 / atomisp_gc0310 code and call power_up() from
set_fmt() in combination with keeping track of the power-state to avoid
doing the power-up sequence twice.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 12 ++++++++++++
 drivers/staging/media/atomisp/i2c/ov2722.h         |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index e09c80d1f9ec..5d2e6e2e72f0 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -528,6 +528,9 @@ static int power_up(struct v4l2_subdev *sd)
 		return -ENODEV;
 	}
 
+	if (dev->power_on == 1)
+		return 0; /* Already on */
+
 	/* power control */
 	ret = power_ctrl(sd, 1);
 	if (ret)
@@ -552,6 +555,7 @@ static int power_up(struct v4l2_subdev *sd)
 	/* according to DS, 20ms is needed between PWDN and i2c access */
 	msleep(20);
 
+	dev->power_on = 1;
 	return 0;
 
 fail_clk:
@@ -575,6 +579,9 @@ static int power_down(struct v4l2_subdev *sd)
 		return -ENODEV;
 	}
 
+	if (dev->power_on == 0)
+		return 0; /* Already off */
+
 	ret = dev->platform_data->flisclk_ctrl(sd, 0);
 	if (ret)
 		dev_err(&client->dev, "flisclk failed\n");
@@ -592,6 +599,7 @@ static int power_down(struct v4l2_subdev *sd)
 	if (ret)
 		dev_err(&client->dev, "vprog failed.\n");
 
+	dev->power_on = 0;
 	return ret;
 }
 
@@ -669,6 +677,9 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&dev->input_lock);
 
+	/* s_power has not been called yet for std v4l2 clients (camorama) */
+	power_up(sd);
+
 	dev->pixels_per_line = dev->res->pixels_per_line;
 	dev->lines_per_frame = dev->res->lines_per_frame;
 
@@ -959,6 +970,7 @@ static int ov2722_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	mutex_init(&dev->input_lock);
+	dev->power_on = -1;
 
 	dev->res = &ov2722_res_preview[0];
 	v4l2_i2c_subdev_init(&dev->sd, client, &ov2722_ops);
diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index 020743a944c4..640d3ffcaa5c 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -198,7 +198,7 @@ struct ov2722_device {
 	struct ov2722_resolution *res;
 
 	struct camera_sensor_platform_data *platform_data;
-	int run_mode;
+	int power_on;
 	u16 pixels_per_line;
 	u16 lines_per_frame;
 	u8 type;
-- 
2.39.0

