Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDA42F3B36
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 20:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436763AbhALTwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 14:52:25 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44248 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406358AbhALTwZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 14:52:25 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5CA821F45505
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 3/6] media: ov9640: Use the generic clock framework
Date:   Tue, 12 Jan 2021 16:49:16 -0300
Message-Id: <20210112194919.50176-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112194919.50176-1-ezequiel@collabora.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 63839882c597 ("media: mach-pxa: palmz72/pcm990: remove soc_camera dependencies")
removed the last in-tree user of this sensor. New users
will be required to use the generic clock framework,
so it's possible to convert the driver to use it.

Convert the driver to use the CCF, and drop the legacy
v4l2-clk API.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/i2c/ov9640.c | 15 ++++++---------
 drivers/media/i2c/ov9640.h |  2 +-
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index e2a25240fc85..d36b04c49628 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -17,6 +17,7 @@
  * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
  */
 
+#include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
@@ -26,7 +27,6 @@
 #include <linux/videodev2.h>
 
 #include <media/v4l2-async.h>
-#include <media/v4l2-clk.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -333,13 +333,13 @@ static int ov9640_s_power(struct v4l2_subdev *sd, int on)
 	if (on) {
 		gpiod_set_value(priv->gpio_power, 1);
 		usleep_range(1000, 2000);
-		ret = v4l2_clk_enable(priv->clk);
+		ret = clk_prepare_enable(priv->clk);
 		usleep_range(1000, 2000);
 		gpiod_set_value(priv->gpio_reset, 0);
 	} else {
 		gpiod_set_value(priv->gpio_reset, 1);
 		usleep_range(1000, 2000);
-		v4l2_clk_disable(priv->clk);
+		clk_disable_unprepare(priv->clk);
 		usleep_range(1000, 2000);
 		gpiod_set_value(priv->gpio_power, 0);
 	}
@@ -719,7 +719,7 @@ static int ov9640_probe(struct i2c_client *client,
 
 	priv->subdev.ctrl_handler = &priv->hdl;
 
-	priv->clk = v4l2_clk_get(&client->dev, "mclk");
+	priv->clk = devm_clk_get(&client->dev, "mclk");
 	if (IS_ERR(priv->clk)) {
 		ret = PTR_ERR(priv->clk);
 		goto ectrlinit;
@@ -727,17 +727,15 @@ static int ov9640_probe(struct i2c_client *client,
 
 	ret = ov9640_video_probe(client);
 	if (ret)
-		goto eprobe;
+		goto ectrlinit;
 
 	priv->subdev.dev = &client->dev;
 	ret = v4l2_async_register_subdev(&priv->subdev);
 	if (ret)
-		goto eprobe;
+		goto ectrlinit;
 
 	return 0;
 
-eprobe:
-	v4l2_clk_put(priv->clk);
 ectrlinit:
 	v4l2_ctrl_handler_free(&priv->hdl);
 
@@ -749,7 +747,6 @@ static int ov9640_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov9640_priv *priv = to_ov9640_sensor(sd);
 
-	v4l2_clk_put(priv->clk);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_ctrl_handler_free(&priv->hdl);
 
diff --git a/drivers/media/i2c/ov9640.h b/drivers/media/i2c/ov9640.h
index a8ed6992c1a8..c105594b2472 100644
--- a/drivers/media/i2c/ov9640.h
+++ b/drivers/media/i2c/ov9640.h
@@ -196,7 +196,7 @@ struct ov9640_reg {
 struct ov9640_priv {
 	struct v4l2_subdev		subdev;
 	struct v4l2_ctrl_handler	hdl;
-	struct v4l2_clk			*clk;
+	struct clk			*clk;
 	struct gpio_desc		*gpio_power;
 	struct gpio_desc		*gpio_reset;
 
-- 
2.29.2

