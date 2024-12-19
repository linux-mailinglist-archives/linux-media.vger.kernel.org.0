Return-Path: <linux-media+bounces-23838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9929F8438
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 20:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C0D316AB1F
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496181AF0D2;
	Thu, 19 Dec 2024 19:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XNfumc/c"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C55F1AE875
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 19:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734636464; cv=none; b=SbpkvQLYCfN3X61+WD8gVXazF0wjwGQstw1eugdk/VW8aY8yB7KTfI2S5v2ZoBSR3ObPxrkgSObRRQV4rZcfGWweOE47JuFWqT/oj9cEGboIRFKnxbi9SKX+rqlVhq3IeRSmOTWCGTfkRsuRFubkI8suwDB5vq2ODAJy5HqAyqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734636464; c=relaxed/simple;
	bh=rhSCqziON7+14u7OBaNNV9k7+fErnAmk6BFRL8cXoaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDKkxwN2GVU6ZsmWOCbHXdi47qEQXh7O4ZaslBAvp4l0xzh7Y2BEAQNNa7bWDmda1mocgkdw43a8faIi9BNWegqNyJmT67jo/dXC3zcdPzYdpVi+FlEk0w3tRXndtvnZhdJrfMJuhIp5biqZ0jx3u4NLSUk6LU6Qxu5VqWfPHDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XNfumc/c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734636461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VRw238MAW+UJfIy6g6dnCMsFwkQucdw9S+CCRP7i5d4=;
	b=XNfumc/cBafXBU9eMAEH5CnS+ulAK6Z02stiLW7rWUYW6EsudoVl/8XERmvoCMVby5IHhj
	HuTecIOYfUYaODJkkvnQDN8gAy3EQyZ9nQ8Bt9t+BKRhhpFCSHOul6QK6fqdBxeLrNuH1Q
	9rolRKBiIZtfoFa0FPFuOhl50d15WRg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-46roa5vcNrCesGDLcoKHqA-1; Thu,
 19 Dec 2024 14:27:38 -0500
X-MC-Unique: 46roa5vcNrCesGDLcoKHqA-1
X-Mimecast-MFC-AGG-ID: 46roa5vcNrCesGDLcoKHqA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA75B19560B3;
	Thu, 19 Dec 2024 19:27:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3CB37195608A;
	Thu, 19 Dec 2024 19:27:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/4] media: hi556: Add missing '\n' to hi556 error messages
Date: Thu, 19 Dec 2024 20:27:31 +0100
Message-ID: <20241219192733.45659-2-hdegoede@redhat.com>
In-Reply-To: <20241219192733.45659-1-hdegoede@redhat.com>
References: <20241219192733.45659-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Many hi556 dev_err() error messages miss a terminating '\n', add
the missing '\n' to these.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/hi556.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index c28eca2f86f6..960d6c2d3d93 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -719,7 +719,7 @@ static int hi556_write_reg_list(struct hi556 *hi556,
 				      r_list->regs[i].val);
 		if (ret) {
 			dev_err_ratelimited(&client->dev,
-					    "failed to write reg 0x%4.4x. error = %d",
+					    "failed to write reg 0x%4.4x. error = %d\n",
 					    r_list->regs[i].address, ret);
 			return ret;
 		}
@@ -926,7 +926,7 @@ static int hi556_identify_module(struct hi556 *hi556)
 		return ret;
 
 	if (val != HI556_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
 			HI556_CHIP_ID, val);
 		return -ENXIO;
 	}
@@ -1002,14 +1002,14 @@ static int hi556_start_streaming(struct hi556 *hi556)
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = hi556_write_reg_list(hi556, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set plls");
+		dev_err(&client->dev, "failed to set plls\n");
 		return ret;
 	}
 
 	reg_list = &hi556->cur_mode->reg_list;
 	ret = hi556_write_reg_list(hi556, reg_list);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode");
+		dev_err(&client->dev, "failed to set mode\n");
 		return ret;
 	}
 
@@ -1021,7 +1021,7 @@ static int hi556_start_streaming(struct hi556 *hi556)
 			      HI556_REG_VALUE_16BIT, HI556_MODE_STREAMING);
 
 	if (ret) {
-		dev_err(&client->dev, "failed to set stream");
+		dev_err(&client->dev, "failed to set stream\n");
 		return ret;
 	}
 
@@ -1034,7 +1034,7 @@ static void hi556_stop_streaming(struct hi556 *hi556)
 
 	if (hi556_write_reg(hi556, HI556_REG_MODE_SELECT,
 			    HI556_REG_VALUE_16BIT, HI556_MODE_STANDBY))
-		dev_err(&client->dev, "failed to set stream");
+		dev_err(&client->dev, "failed to set stream\n");
 }
 
 static int hi556_set_stream(struct v4l2_subdev *sd, int enable)
@@ -1229,25 +1229,25 @@ static int hi556_check_hwcfg(struct device *dev)
 
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret) {
-		dev_err(dev, "can't get clock frequency");
+		dev_err(dev, "can't get clock frequency\n");
 		goto check_hwcfg_error;
 	}
 
 	if (mclk != HI556_MCLK) {
-		dev_err(dev, "external clock %d is not supported", mclk);
+		dev_err(dev, "external clock %d is not supported\n", mclk);
 		ret = -EINVAL;
 		goto check_hwcfg_error;
 	}
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
-		dev_err(dev, "number of CSI2 data lanes %d is not supported",
+		dev_err(dev, "number of CSI2 data lanes %d is not supported\n",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
 		goto check_hwcfg_error;
 	}
 
 	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_err(dev, "no link frequencies defined");
+		dev_err(dev, "no link frequencies defined\n");
 		ret = -EINVAL;
 		goto check_hwcfg_error;
 	}
@@ -1260,7 +1260,7 @@ static int hi556_check_hwcfg(struct device *dev)
 		}
 
 		if (j == bus_cfg.nr_of_link_frequencies) {
-			dev_err(dev, "no link frequency %lld supported",
+			dev_err(dev, "no link frequency %lld supported\n",
 				link_freq_menu_items[i]);
 			ret = -EINVAL;
 			goto check_hwcfg_error;
@@ -1334,7 +1334,7 @@ static int hi556_probe(struct i2c_client *client)
 
 	ret = hi556_check_hwcfg(&client->dev);
 	if (ret) {
-		dev_err(&client->dev, "failed to check HW configuration: %d",
+		dev_err(&client->dev, "failed to check HW configuration: %d\n",
 			ret);
 		return ret;
 	}
@@ -1372,7 +1372,7 @@ static int hi556_probe(struct i2c_client *client)
 
 		ret = hi556_identify_module(hi556);
 		if (ret) {
-			dev_err(&client->dev, "failed to find sensor: %d", ret);
+			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
 			goto probe_error_power_off;
 		}
 	}
@@ -1381,7 +1381,7 @@ static int hi556_probe(struct i2c_client *client)
 	hi556->cur_mode = &supported_modes[0];
 	ret = hi556_init_controls(hi556);
 	if (ret) {
-		dev_err(&client->dev, "failed to init controls: %d", ret);
+		dev_err(&client->dev, "failed to init controls: %d\n", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
@@ -1392,13 +1392,13 @@ static int hi556_probe(struct i2c_client *client)
 	hi556->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&hi556->sd.entity, 1, &hi556->pad);
 	if (ret) {
-		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		dev_err(&client->dev, "failed to init entity pads: %d\n", ret);
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&hi556->sd);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+		dev_err(&client->dev, "failed to register V4L2 subdev: %d\n",
 			ret);
 		goto probe_error_media_entity_cleanup;
 	}
-- 
2.47.1


