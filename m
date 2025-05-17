Return-Path: <linux-media+bounces-32673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA5ABA9D4
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FD8A9E4BD0
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68E57260B;
	Sat, 17 May 2025 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DcYp6jVo"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D21F8BCB
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482162; cv=none; b=r3XFFyh+TwO4nJhX6o/MnH5Ivsr/0e07CUzcpkO3pmHycNCGZre6jAzqhnpJ7MOGIhKOomk9gtSMEcyFonSl6lA8TN9MfaNozVtL20r2T8ensaLz8IXGIGUnaUhevKEWs5S7IrA8Jgc+GmItF9ypEmdvpt2a0F+l09JxrcR2cGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482162; c=relaxed/simple;
	bh=JmUPvt561himc+cPtrwfNumti7HrU8kHiOPTW5GWkIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpJUj8gIRCGm5OgtfepME/NkRiZSQUnbOEbeSRCSAmxSoyuWuAGeb/wQVLkr5RsrwuHzkHmGguDGoJ2xO9Zk/0L3TwOhR9rWSmhHk/F0R7nBE2iZriJXwxmSF3WKg7MkDUKN7CBWmm6i7pmmipqHBmh3TMkjqc/lfcloKvjhd0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DcYp6jVo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F4GSR6FtDxSGEAddPd3LESrIeg1JdpX+26lA7h3FiT4=;
	b=DcYp6jVo0n3/NER2m28ImI5HOSKjiX3NPN+pa+8so6B03G05j5+xVpJiKiUTNKMaj+s9gH
	dSp8bgMzYda6Kn3b28CHk29RBOHSTPoZnrpDK4oCD3SR+Xu4nqcV23YjdINmr/aixTbC19
	FmCGmhvGtwBGbe9JQ8kR3dvdTbNZ/hI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-184-ee8mnVIcOPextX8LuX3Ctw-1; Sat,
 17 May 2025 07:42:38 -0400
X-MC-Unique: ee8mnVIcOPextX8LuX3Ctw-1
X-Mimecast-MFC-AGG-ID: ee8mnVIcOPextX8LuX3Ctw_1747482157
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23DA218003FC;
	Sat, 17 May 2025 11:42:37 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6B39518003FC;
	Sat, 17 May 2025 11:42:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 15/23] media: atomisp: gc0310: Switch to using the sub-device state lock
Date: Sat, 17 May 2025 13:40:58 +0200
Message-ID: <20250517114106.43494-16-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 5d25be0f4cf4..a099f0975e1d 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -86,8 +86,6 @@
 struct gc0310_device {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
-	/* Protect against concurrent changes to controls */
-	struct mutex input_lock;
 
 	struct regmap *regmap;
 	struct gpio_desc *reset;
@@ -481,8 +479,6 @@ static int gc0310_enable_streams(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
 
-	mutex_lock(&sensor->input_lock);
-
 	ret = pm_runtime_get_sync(&client->dev);
 	if (ret)
 		goto error_power_down;
@@ -516,7 +512,6 @@ static int gc0310_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		pm_runtime_put(&client->dev);
 
-	mutex_unlock(&sensor->input_lock);
 	return ret;
 }
 
@@ -528,8 +523,6 @@ static int gc0310_disable_streams(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	mutex_lock(&sensor->input_lock);
-
 	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
 		  GC0310_REGISTER_PAGE_3, &ret);
 	cci_write(sensor->regmap, GC0310_SW_STREAM_REG,
@@ -538,7 +531,6 @@ static int gc0310_disable_streams(struct v4l2_subdev *sd,
 		  GC0310_REGISTER_PAGE_0, &ret);
 
 	pm_runtime_put(&client->dev);
-	mutex_unlock(&sensor->input_lock);
 	return ret;
 }
 
@@ -629,7 +621,6 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
 	v4l2_ctrl_handler_init(hdl, 8);
 
 	/* Use the same lock for controls as for everything else */
-	hdl->lock = &sensor->input_lock;
 	sensor->sd.ctrl_handler = hdl;
 
 	exp_max = GC0310_NATIVE_HEIGHT + GC0310_V_BLANK_DEFAULT;
@@ -683,9 +674,9 @@ static void gc0310_remove(struct i2c_client *client)
 	dev_dbg(&client->dev, "gc0310_remove...\n");
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
-	mutex_destroy(&sensor->input_lock);
 	pm_runtime_disable(&client->dev);
 }
 
@@ -768,7 +759,6 @@ static int gc0310_probe(struct i2c_client *client)
 				     "getting powerdown GPIO\n");
 	}
 
-	mutex_init(&sensor->input_lock);
 	v4l2_i2c_subdev_init(&sensor->sd, client, &gc0310_ops);
 	gc0310_fill_format(&sensor->mode.fmt);
 
@@ -803,6 +793,13 @@ static int gc0310_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	sensor->sd.state_lock = sensor->ctrls.handler.lock;
+	ret = v4l2_subdev_init_finalize(&sensor->sd);
+	if (ret) {
+		gc0310_remove(client);
+		return ret;
+	}
+
 	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
 	if (ret) {
 		gc0310_remove(client);
-- 
2.49.0


