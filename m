Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8A12279D4
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 09:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgGUHuJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 03:50:09 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:58447 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgGUHuI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 03:50:08 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4AC1740015;
        Tue, 21 Jul 2020 07:50:00 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        jmkrzyszt@gmail.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8.1 03/10] media: i2c: ov6650: Use new [get|set]_mbus_config ops
Date:   Tue, 21 Jul 2020 09:53:17 +0200
Message-Id: <20200721075317.80874-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717145324.292820-4-jacopo+renesas@jmondi.org>
References: <20200717145324.292820-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new get_mbus_config and set_mbus_config pad operations in place
of the video operations currently in use.

Compared to other drivers where the same conversion has been performed,
ov6650 proved to be a bit more tricky, as the existing g_mbus_config
implementation did not report the currently applied configuration but
the set of all possible configuration options.

Adapt the driver to support the semantic of the two newly introduced
operations:
- get_mbus_config reports the current media bus configuration
- set_mbus_config applies only changes explicitly requested and updates
  the provided cfg parameter to report what has actually been applied to
  the hardware.

Compile-tested only.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
v8 -> v8.1

- Return error on register write fails in set_mbus_config() as suggested
  by Janusz.

---
 drivers/media/i2c/ov6650.c | 53 ++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 91906b94f978..48493af81198 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -921,55 +921,74 @@ static const struct v4l2_subdev_core_ops ov6650_core_ops = {
 };

 /* Request bus settings on camera side */
-static int ov6650_g_mbus_config(struct v4l2_subdev *sd,
-				struct v4l2_mbus_config *cfg)
+static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
+				  unsigned int pad,
+				  struct v4l2_mbus_config *cfg)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	u8 comj, comf;
+	int ret;
+
+	ret = ov6650_reg_read(client, REG_COMJ, &comj);
+	if (ret)
+		return ret;

-	cfg->flags = V4L2_MBUS_MASTER |
-		V4L2_MBUS_PCLK_SAMPLE_RISING | V4L2_MBUS_PCLK_SAMPLE_FALLING |
-		V4L2_MBUS_HSYNC_ACTIVE_HIGH | V4L2_MBUS_HSYNC_ACTIVE_LOW |
-		V4L2_MBUS_VSYNC_ACTIVE_HIGH | V4L2_MBUS_VSYNC_ACTIVE_LOW |
-		V4L2_MBUS_DATA_ACTIVE_HIGH;
+	ret = ov6650_reg_read(client, REG_COMF, &comf);
+	if (ret)
+		return ret;
+
+	cfg->flags = V4L2_MBUS_MASTER | V4L2_MBUS_DATA_ACTIVE_HIGH
+		   | ((comj & COMJ_VSYNC_HIGH)  ? V4L2_MBUS_VSYNC_ACTIVE_HIGH
+						: V4L2_MBUS_VSYNC_ACTIVE_LOW)
+		   | ((comf & COMF_HREF_LOW)    ? V4L2_MBUS_HSYNC_ACTIVE_LOW
+						: V4L2_MBUS_HSYNC_ACTIVE_HIGH)
+		   | ((comj & COMJ_PCLK_RISING) ? V4L2_MBUS_PCLK_SAMPLE_RISING
+						: V4L2_MBUS_PCLK_SAMPLE_FALLING);
 	cfg->type = V4L2_MBUS_PARALLEL;

 	return 0;
 }

 /* Alter bus settings on camera side */
-static int ov6650_s_mbus_config(struct v4l2_subdev *sd,
-				const struct v4l2_mbus_config *cfg)
+static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
+				  unsigned int pad,
+				  struct v4l2_mbus_config *cfg)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
+	int ret = 0;

 	if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
 		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
-	else
+	else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
 		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
 	if (ret)
 		return ret;

 	if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
 		ret = ov6650_reg_rmw(client, REG_COMF, COMF_HREF_LOW, 0);
-	else
+	else if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
 		ret = ov6650_reg_rmw(client, REG_COMF, 0, COMF_HREF_LOW);
 	if (ret)
 		return ret;

 	if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
 		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_VSYNC_HIGH, 0);
-	else
+	else if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
 		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_VSYNC_HIGH);
+	if (ret)
+		return ret;

-	return ret;
+	/*
+	 * Update the configuration to report what is actually applied to
+	 * the hardware.
+	 */
+	return ov6650_get_mbus_config(sd, pad, cfg);
 }

 static const struct v4l2_subdev_video_ops ov6650_video_ops = {
 	.s_stream	= ov6650_s_stream,
 	.g_frame_interval = ov6650_g_frame_interval,
 	.s_frame_interval = ov6650_s_frame_interval,
-	.g_mbus_config	= ov6650_g_mbus_config,
-	.s_mbus_config	= ov6650_s_mbus_config,
 };

 static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
@@ -978,6 +997,8 @@ static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
 	.set_selection	= ov6650_set_selection,
 	.get_fmt	= ov6650_get_fmt,
 	.set_fmt	= ov6650_set_fmt,
+	.get_mbus_config = ov6650_get_mbus_config,
+	.set_mbus_config = ov6650_set_mbus_config,
 };

 static const struct v4l2_subdev_ops ov6650_subdev_ops = {
--
2.27.0

