Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF8F2F3B39
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 20:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436812AbhALTwb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 14:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406358AbhALTwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 14:52:31 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46213C061795
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 11:51:51 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 95C231F45508
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 5/6] media: ov6650: Use the generic clock framework
Date:   Tue, 12 Jan 2021 16:49:18 -0300
Message-Id: <20210112194919.50176-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112194919.50176-1-ezequiel@collabora.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit ce548396a433 ("media: mach-omap1: board-ams-delta.c: remove soc_camera dependencies")
removed the last in-tree user of this sensor. New users
will be required to use the generic clock framework,
so it's possible to convert the driver to use it.

Convert the driver to use the CCF, and drop the legacy
v4l2-clk API.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index d73f9f540932..85dd13694bd2 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -22,13 +22,13 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/v4l2-mediabus.h>
 #include <linux/module.h>
 
-#include <media/v4l2-clk.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 
@@ -194,7 +194,7 @@ struct ov6650 {
 		struct v4l2_ctrl *blue;
 		struct v4l2_ctrl *red;
 	};
-	struct v4l2_clk		*clk;
+	struct clk		*clk;
 	bool			half_scale;	/* scale down output by 2 */
 	struct v4l2_rect	rect;		/* sensor cropping window */
 	struct v4l2_fract	tpf;		/* as requested with s_frame_interval */
@@ -459,9 +459,9 @@ static int ov6650_s_power(struct v4l2_subdev *sd, int on)
 	int ret = 0;
 
 	if (on)
-		ret = v4l2_clk_enable(priv->clk);
+		ret = clk_prepare_enable(priv->clk);
 	else
-		v4l2_clk_disable(priv->clk);
+		clk_disable_unprepare(priv->clk);
 
 	return ret;
 }
@@ -821,14 +821,14 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 	u8 pidh, pidl, midh, midl;
 	int i, ret = 0;
 
-	priv->clk = v4l2_clk_get(&client->dev, NULL);
+	priv->clk = devm_clk_get(&client->dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		ret = PTR_ERR(priv->clk);
-		dev_err(&client->dev, "v4l2_clk request err: %d\n", ret);
+		dev_err(&client->dev, "clk request err: %d\n", ret);
 		return ret;
 	}
 
-	rate = v4l2_clk_get_rate(priv->clk);
+	rate = clk_get_rate(priv->clk);
 	for (i = 0; rate && i < ARRAY_SIZE(ov6650_xclk); i++) {
 		if (rate != ov6650_xclk[i].rate)
 			continue;
@@ -839,8 +839,8 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 		break;
 	}
 	for (i = 0; !xclk && i < ARRAY_SIZE(ov6650_xclk); i++) {
-		ret = v4l2_clk_set_rate(priv->clk, ov6650_xclk[i].rate);
-		if (ret || v4l2_clk_get_rate(priv->clk) != ov6650_xclk[i].rate)
+		ret = clk_set_rate(priv->clk, ov6650_xclk[i].rate);
+		if (ret || clk_get_rate(priv->clk) != ov6650_xclk[i].rate)
 			continue;
 
 		xclk = &ov6650_xclk[i];
@@ -852,12 +852,12 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 		dev_err(&client->dev, "unable to get supported clock rate\n");
 		if (!ret)
 			ret = -EINVAL;
-		goto eclkput;
+		return ret;
 	}
 
 	ret = ov6650_s_power(sd, 1);
 	if (ret < 0)
-		goto eclkput;
+		return ret;
 
 	msleep(20);
 
@@ -899,11 +899,6 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 
 done:
 	ov6650_s_power(sd, 0);
-	if (!ret)
-		return 0;
-eclkput:
-	v4l2_clk_put(priv->clk);
-
 	return ret;
 }
 
@@ -1089,7 +1084,6 @@ static int ov6650_remove(struct i2c_client *client)
 {
 	struct ov6650 *priv = to_ov6650(client);
 
-	v4l2_clk_put(priv->clk);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_ctrl_handler_free(&priv->hdl);
 	return 0;
-- 
2.29.2

