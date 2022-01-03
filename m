Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D19B4834B0
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 17:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbiACQY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 11:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbiACQY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 11:24:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2896C061784;
        Mon,  3 Jan 2022 08:24:28 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEBA7E57;
        Mon,  3 Jan 2022 17:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641227066;
        bh=rRY7uN6RUh3Mec1MzsDgYTP5M6LopWZ8zitlZC9DrSo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DybIFxGEZTa47fGVNmODi6aDdQ51rkN410UwHi9E/fe4OSEfYbdSis/vTXq2Eui3T
         YLuhoTo999matotqvvggJekUlCqXuJOpZnVjvf6oCQYVdlUZmvbIRYJiXv+OOcOD8R
         BFYKAL23mfeUdIzay2uVOc2h1lTPnEQH/c9YVxbE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 2/8] media: i2c: ov6650: Drop implementation of .set_mbus_config()
Date:   Mon,  3 Jan 2022 18:24:08 +0200
Message-Id: <20220103162414.27723-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev .set_mbus_config() operation is deprecated. No code in the
kernel calls it, so drop its implementation from the ov6650 driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov6650.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index f67412150b16..455a627e35a0 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -944,42 +944,6 @@ static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/* Alter bus settings on camera side */
-static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
-				  unsigned int pad,
-				  struct v4l2_mbus_config *cfg)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = 0;
-
-	if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
-		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
-	else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
-		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
-	if (ret)
-		return ret;
-
-	if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
-		ret = ov6650_reg_rmw(client, REG_COMF, COMF_HREF_LOW, 0);
-	else if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
-		ret = ov6650_reg_rmw(client, REG_COMF, 0, COMF_HREF_LOW);
-	if (ret)
-		return ret;
-
-	if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
-		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_VSYNC_HIGH, 0);
-	else if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
-		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_VSYNC_HIGH);
-	if (ret)
-		return ret;
-
-	/*
-	 * Update the configuration to report what is actually applied to
-	 * the hardware.
-	 */
-	return ov6650_get_mbus_config(sd, pad, cfg);
-}
-
 static const struct v4l2_subdev_video_ops ov6650_video_ops = {
 	.s_stream	= ov6650_s_stream,
 	.g_frame_interval = ov6650_g_frame_interval,
@@ -993,7 +957,6 @@ static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
 	.get_fmt	= ov6650_get_fmt,
 	.set_fmt	= ov6650_set_fmt,
 	.get_mbus_config = ov6650_get_mbus_config,
-	.set_mbus_config = ov6650_set_mbus_config,
 };
 
 static const struct v4l2_subdev_ops ov6650_subdev_ops = {
-- 
Regards,

Laurent Pinchart

