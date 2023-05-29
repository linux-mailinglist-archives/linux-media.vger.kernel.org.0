Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0F87147F2
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjE2Kil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjE2Kik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:38:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03466C9
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WS6yNjI4tALccp6/+zbvrJSk4ZWcCeoFi1ps5hlEJLA=;
        b=DMwlwCAllcHqFF0y7PzUYgISpvArfBEwOQLpKKO9KYU761CviklqAHtwEFkHzsIEE3gb/M
        8yIKHN0ncUvJvRekbWbTzm0xVTjJNy85Zx3RI8UYQ40A8PHsdBEXT9z2tlu0jvHXRxQGuv
        aKtUXXHfumpypBWUxqHEGo2qj8OuRWs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-xfeFMDObNDWJCfPFE0XhcQ-1; Mon, 29 May 2023 06:37:57 -0400
X-MC-Unique: xfeFMDObNDWJCfPFE0XhcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4933885A5AA;
        Mon, 29 May 2023 10:37:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B60FB2166B2B;
        Mon, 29 May 2023 10:37:55 +0000 (UTC)
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
Subject: [PATCH 03/21] media: atomisp: ov2680: s/input_lock/lock/
Date:   Mon, 29 May 2023 12:37:23 +0200
Message-Id: <20230529103741.11904-4-hdegoede@redhat.com>
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

s/input_lock/lock/ lock is used by the generic drivers/media/i2c/ov2680.c
driver. Bring the atomisp ov2680 code inline to make it easier to port
changes between the two, with the end goal of getting rid of
the atomisp specific version.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/i2c/atomisp-ov2680.c   | 16 ++++++++--------
 drivers/staging/media/atomisp/i2c/ov2680.h       |  3 ++-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index cd6557c9a4c9..8bcfa5ae2ea0 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -337,9 +337,9 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
-	mutex_lock(&sensor->input_lock);
+	mutex_lock(&sensor->lock);
 	ov2680_calc_mode(sensor, fmt->width, fmt->height);
-	mutex_unlock(&sensor->input_lock);
+	mutex_unlock(&sensor->lock);
 	return 0;
 }
 
@@ -394,7 +394,7 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	mutex_lock(&sensor->input_lock);
+	mutex_lock(&sensor->lock);
 
 	if (sensor->is_streaming == enable) {
 		dev_warn(&client->dev, "stream already %s\n", enable ? "started" : "stopped");
@@ -427,14 +427,14 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 	v4l2_ctrl_activate(sensor->ctrls.vflip, !enable);
 	v4l2_ctrl_activate(sensor->ctrls.hflip, !enable);
 
-	mutex_unlock(&sensor->input_lock);
+	mutex_unlock(&sensor->lock);
 	return 0;
 
 error_power_down:
 	pm_runtime_put(sensor->sd.dev);
 	sensor->is_streaming = false;
 error_unlock:
-	mutex_unlock(&sensor->input_lock);
+	mutex_unlock(&sensor->lock);
 	return ret;
 }
 
@@ -564,7 +564,7 @@ static int ov2680_init_controls(struct ov2680_dev *sensor)
 
 	v4l2_ctrl_handler_init(hdl, 4);
 
-	hdl->lock = &sensor->input_lock;
+	hdl->lock = &sensor->lock;
 
 	ctrls->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
 	ctrls->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
@@ -597,7 +597,7 @@ static void ov2680_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(&sensor->sd);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
-	mutex_destroy(&sensor->input_lock);
+	mutex_destroy(&sensor->lock);
 	fwnode_handle_put(sensor->ep_fwnode);
 	pm_runtime_disable(&client->dev);
 }
@@ -612,7 +612,7 @@ static int ov2680_probe(struct i2c_client *client)
 	if (!sensor)
 		return -ENOMEM;
 
-	mutex_init(&sensor->input_lock);
+	mutex_init(&sensor->lock);
 
 	sensor->client = client;
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_ops);
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 077ca6ee08b6..4bcdd9fd0ce7 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -109,7 +109,8 @@
 struct ov2680_dev {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
-	struct mutex input_lock;
+	/* Protect against concurrent changes to controls */
+	struct mutex lock;
 	struct i2c_client *client;
 	struct gpio_desc *powerdown;
 	struct fwnode_handle *ep_fwnode;
-- 
2.40.1

