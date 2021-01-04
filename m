Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30D42E9B6C
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 17:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbhADQ6m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 11:58:42 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33796 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbhADQ6m (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 11:58:42 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B85301F44B70
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 4/6] media: mt9m111: Use the generic clock framework
Date:   Mon,  4 Jan 2021 13:57:37 -0300
Message-Id: <20210104165739.116404-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210104165739.116404-1-ezequiel@collabora.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This sensor driver has a proper device-tree binding, and also
all its platform-data based in-tree users have been converted to use
the generic clock framework.

Convert the driver to use the CCF, and drop the legacy
v4l2-clk API.

Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/i2c/mt9m111.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 69697386ffcd..0e11734f75aa 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2008, Robert Jarzmik <robert.jarzmik@free.fr>
  */
+#include <linux/clk.h>
 #include <linux/videodev2.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
@@ -16,7 +17,6 @@
 #include <linux/property.h>
 
 #include <media/v4l2-async.h>
-#include <media/v4l2-clk.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -232,7 +232,7 @@ struct mt9m111 {
 	struct v4l2_ctrl *gain;
 	struct mt9m111_context *ctx;
 	struct v4l2_rect rect;	/* cropping rectangle */
-	struct v4l2_clk *clk;
+	struct clk *clk;
 	unsigned int width;	/* output */
 	unsigned int height;	/* sizes */
 	struct v4l2_fract frame_interval;
@@ -977,7 +977,7 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
 	struct i2c_client *client = v4l2_get_subdevdata(&mt9m111->subdev);
 	int ret;
 
-	ret = v4l2_clk_enable(mt9m111->clk);
+	ret = clk_prepare_enable(mt9m111->clk);
 	if (ret < 0)
 		return ret;
 
@@ -995,7 +995,7 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
 	regulator_disable(mt9m111->regulator);
 
 out_clk_disable:
-	v4l2_clk_disable(mt9m111->clk);
+	clk_disable_unprepare(mt9m111->clk);
 
 	dev_err(&client->dev, "Failed to resume the sensor: %d\n", ret);
 
@@ -1006,7 +1006,7 @@ static void mt9m111_power_off(struct mt9m111 *mt9m111)
 {
 	mt9m111_suspend(mt9m111);
 	regulator_disable(mt9m111->regulator);
-	v4l2_clk_disable(mt9m111->clk);
+	clk_disable_unprepare(mt9m111->clk);
 }
 
 static int mt9m111_s_power(struct v4l2_subdev *sd, int on)
@@ -1266,7 +1266,7 @@ static int mt9m111_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	mt9m111->clk = v4l2_clk_get(&client->dev, "mclk");
+	mt9m111->clk = devm_clk_get(&client->dev, "mclk");
 	if (IS_ERR(mt9m111->clk))
 		return PTR_ERR(mt9m111->clk);
 
@@ -1311,7 +1311,7 @@ static int mt9m111_probe(struct i2c_client *client)
 	mt9m111->subdev.ctrl_handler = &mt9m111->hdl;
 	if (mt9m111->hdl.error) {
 		ret = mt9m111->hdl.error;
-		goto out_clkput;
+		return ret;
 	}
 
 #ifdef CONFIG_MEDIA_CONTROLLER
@@ -1354,8 +1354,6 @@ static int mt9m111_probe(struct i2c_client *client)
 out_hdlfree:
 #endif
 	v4l2_ctrl_handler_free(&mt9m111->hdl);
-out_clkput:
-	v4l2_clk_put(mt9m111->clk);
 
 	return ret;
 }
@@ -1366,7 +1364,6 @@ static int mt9m111_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(&mt9m111->subdev);
 	media_entity_cleanup(&mt9m111->subdev.entity);
-	v4l2_clk_put(mt9m111->clk);
 	v4l2_ctrl_handler_free(&mt9m111->hdl);
 
 	return 0;
-- 
2.29.2

