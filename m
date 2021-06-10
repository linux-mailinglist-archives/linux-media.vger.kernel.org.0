Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E383A2EBF
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 16:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbhFJO6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 10:58:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45088 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhFJO6c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 10:58:32 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2E9E1571;
        Thu, 10 Jun 2021 16:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623336994;
        bh=9qaGrF7qY0JE3Tax6S1rwEajHcslPd4YrNJZoCfaxfA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rLgpdhHMnsRbvp6OVx67bJ6curGY335Q+mwM/rR/b7LtmGQmzhuJCSyOCCUjBJ+Vf
         Y7v0mnExPLFNl7ei8ISrk1/INtX57FvYGA41MaMbb0QyGy52TRGyi/zBYhNRlkBANP
         7lbgfnyldjo6jXgWuc9t01Ci5O4MbnLv8Ws2UDEY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pavel Machek <pavel@ucw.cz>, Shawn Tu <shawnx.tu@intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Leon Luo <leonl@leopardimaging.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Heungjun Kim <riverful.kim@samsung.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mickael Guene <mickael.guene@st.com>,
        Mats Randgaard <matrandg@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 4/9] media: i2c: changes for subdev-wide state struct
Date:   Thu, 10 Jun 2021 17:56:01 +0300
Message-Id: <20210610145606.3468235-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
References: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Patch "media: v4l2-subdev: add subdev-wide state struct" changes how
subdev state is managed, adding a new struct to hold all the v4l2 subdev
state.

This patch does the required changes for drivers/media/i2c/

Note that this patch is meant to be squashed into the main patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/adv7170.c              |  6 +-
 drivers/media/i2c/adv7175.c              |  6 +-
 drivers/media/i2c/adv7180.c              | 18 ++---
 drivers/media/i2c/adv7183.c              |  8 +--
 drivers/media/i2c/adv748x/adv748x-afe.c  | 13 ++--
 drivers/media/i2c/adv748x/adv748x-csi2.c | 14 ++--
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 13 ++--
 drivers/media/i2c/adv7511-v4l2.c         | 10 +--
 drivers/media/i2c/adv7604.c              | 12 ++--
 drivers/media/i2c/adv7842.c              | 12 ++--
 drivers/media/i2c/ak881x.c               |  6 +-
 drivers/media/i2c/ccs/ccs-core.c         | 84 +++++++++++++-----------
 drivers/media/i2c/cx25840/cx25840-core.c |  2 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 23 ++++---
 drivers/media/i2c/hi556.c                | 15 +++--
 drivers/media/i2c/imx208.c               | 19 +++---
 drivers/media/i2c/imx214.c               | 37 ++++++-----
 drivers/media/i2c/imx219.c               | 30 +++++----
 drivers/media/i2c/imx258.c               | 19 +++---
 drivers/media/i2c/imx274.c               | 38 +++++------
 drivers/media/i2c/imx290.c               | 20 +++---
 drivers/media/i2c/imx319.c               | 18 ++---
 drivers/media/i2c/imx334.c               | 28 ++++----
 drivers/media/i2c/imx355.c               | 18 ++---
 drivers/media/i2c/m5mols/m5mols_core.c   | 21 +++---
 drivers/media/i2c/max9286.c              | 17 ++---
 drivers/media/i2c/ml86v7667.c            |  4 +-
 drivers/media/i2c/mt9m001.c              | 18 ++---
 drivers/media/i2c/mt9m032.c              | 38 ++++++-----
 drivers/media/i2c/mt9m111.c              | 18 ++---
 drivers/media/i2c/mt9p031.c              | 45 +++++++------
 drivers/media/i2c/mt9t001.c              | 44 ++++++++-----
 drivers/media/i2c/mt9t112.c              | 14 ++--
 drivers/media/i2c/mt9v011.c              |  6 +-
 drivers/media/i2c/mt9v032.c              | 44 ++++++++-----
 drivers/media/i2c/mt9v111.c              | 23 +++----
 drivers/media/i2c/noon010pc30.c          | 19 +++---
 drivers/media/i2c/ov02a10.c              | 17 ++---
 drivers/media/i2c/ov13858.c              | 18 ++---
 drivers/media/i2c/ov2640.c               | 16 ++---
 drivers/media/i2c/ov2659.c               | 14 ++--
 drivers/media/i2c/ov2680.c               | 23 +++----
 drivers/media/i2c/ov2685.c               | 10 +--
 drivers/media/i2c/ov2740.c               | 15 +++--
 drivers/media/i2c/ov5640.c               | 14 ++--
 drivers/media/i2c/ov5645.c               | 38 ++++++-----
 drivers/media/i2c/ov5647.c               | 26 ++++----
 drivers/media/i2c/ov5648.c               | 14 ++--
 drivers/media/i2c/ov5670.c               | 19 +++---
 drivers/media/i2c/ov5675.c               | 15 +++--
 drivers/media/i2c/ov5695.c               | 15 +++--
 drivers/media/i2c/ov6650.c               | 28 ++++----
 drivers/media/i2c/ov7251.c               | 39 ++++++-----
 drivers/media/i2c/ov7670.c               | 17 ++---
 drivers/media/i2c/ov772x.c               | 12 ++--
 drivers/media/i2c/ov7740.c               | 17 ++---
 drivers/media/i2c/ov8856.c               | 15 +++--
 drivers/media/i2c/ov8865.c               | 14 ++--
 drivers/media/i2c/ov9640.c               |  8 +--
 drivers/media/i2c/ov9650.c               | 17 ++---
 drivers/media/i2c/ov9734.c               | 15 +++--
 drivers/media/i2c/rdacm20.c              |  4 +-
 drivers/media/i2c/rdacm21.c              |  4 +-
 drivers/media/i2c/rj54n1cb0c.c           | 12 ++--
 drivers/media/i2c/s5c73m3/s5c73m3-core.c | 55 ++++++++--------
 drivers/media/i2c/s5k4ecgx.c             | 22 ++++---
 drivers/media/i2c/s5k6a3.c               | 19 +++---
 drivers/media/i2c/s5k6aa.c               | 39 ++++++-----
 drivers/media/i2c/saa6752hs.c            |  6 +-
 drivers/media/i2c/saa7115.c              |  2 +-
 drivers/media/i2c/saa717x.c              |  2 +-
 drivers/media/i2c/sr030pc30.c            |  8 +--
 drivers/media/i2c/st-mipid02.c           | 21 +++---
 drivers/media/i2c/tc358743.c             |  8 +--
 drivers/media/i2c/tda1997x.c             | 14 ++--
 drivers/media/i2c/tvp514x.c              | 12 ++--
 drivers/media/i2c/tvp5150.c              | 20 +++---
 drivers/media/i2c/tvp7002.c              | 11 ++--
 drivers/media/i2c/tw9910.c               | 10 +--
 drivers/media/i2c/vs6624.c               |  8 +--
 80 files changed, 792 insertions(+), 701 deletions(-)

diff --git a/drivers/media/i2c/adv7170.c b/drivers/media/i2c/adv7170.c
index e4e8fda51ad8..714e31f993e1 100644
--- a/drivers/media/i2c/adv7170.c
+++ b/drivers/media/i2c/adv7170.c
@@ -250,7 +250,7 @@ static int adv7170_s_routing(struct v4l2_subdev *sd,
 }
 
 static int adv7170_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= ARRAY_SIZE(adv7170_codes))
@@ -261,7 +261,7 @@ static int adv7170_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int adv7170_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -284,7 +284,7 @@ static int adv7170_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int adv7170_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
diff --git a/drivers/media/i2c/adv7175.c b/drivers/media/i2c/adv7175.c
index 0cdd8e033197..1813f67f0fe1 100644
--- a/drivers/media/i2c/adv7175.c
+++ b/drivers/media/i2c/adv7175.c
@@ -288,7 +288,7 @@ static int adv7175_s_routing(struct v4l2_subdev *sd,
 }
 
 static int adv7175_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= ARRAY_SIZE(adv7175_codes))
@@ -299,7 +299,7 @@ static int adv7175_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int adv7175_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -322,7 +322,7 @@ static int adv7175_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int adv7175_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 44bb6fe85644..fa5bc55bc944 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -633,7 +633,7 @@ static void adv7180_exit_controls(struct adv7180_state *state)
 }
 
 static int adv7180_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index != 0)
@@ -699,13 +699,13 @@ static int adv7180_set_field_mode(struct adv7180_state *state)
 }
 
 static int adv7180_get_pad_format(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *format)
 {
 	struct adv7180_state *state = to_state(sd);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
+		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
 	} else {
 		adv7180_mbus_fmt(sd, &format->format);
 		format->format.field = state->field;
@@ -715,7 +715,7 @@ static int adv7180_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int adv7180_set_pad_format(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *format)
 {
 	struct adv7180_state *state = to_state(sd);
@@ -742,7 +742,7 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
 			adv7180_set_power(state, true);
 		}
 	} else {
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		*framefmt = format->format;
 	}
 
@@ -750,14 +750,14 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
 }
 
 static int adv7180_init_cfg(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg)
+			    struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = {
-		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
-			: V4L2_SUBDEV_FORMAT_ACTIVE,
+		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
+		: V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 
-	return adv7180_set_pad_format(sd, cfg, &fmt);
+	return adv7180_set_pad_format(sd, sd_state, &fmt);
 }
 
 static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
index 8bcd632c081a..92cafdea3f1f 100644
--- a/drivers/media/i2c/adv7183.c
+++ b/drivers/media/i2c/adv7183.c
@@ -409,7 +409,7 @@ static int adv7183_g_input_status(struct v4l2_subdev *sd, u32 *status)
 }
 
 static int adv7183_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index > 0)
@@ -420,7 +420,7 @@ static int adv7183_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int adv7183_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct adv7183 *decoder = to_adv7183(sd);
@@ -443,12 +443,12 @@ static int adv7183_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		decoder->fmt = *fmt;
 	else
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 	return 0;
 }
 
 static int adv7183_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct adv7183 *decoder = to_adv7183(sd);
diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index 4052cf67bf16..02eabe10ab97 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -331,7 +331,7 @@ static int adv748x_afe_propagate_pixelrate(struct adv748x_afe *afe)
 }
 
 static int adv748x_afe_enum_mbus_code(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index != 0)
@@ -343,7 +343,7 @@ static int adv748x_afe_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int adv748x_afe_get_format(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_format *sdformat)
 {
 	struct adv748x_afe *afe = adv748x_sd_to_afe(sd);
@@ -354,7 +354,8 @@ static int adv748x_afe_get_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sdformat->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mbusformat = v4l2_subdev_get_try_format(sd, cfg, sdformat->pad);
+		mbusformat = v4l2_subdev_get_try_format(sd, sd_state,
+							sdformat->pad);
 		sdformat->format = *mbusformat;
 	} else {
 		adv748x_afe_fill_format(afe, &sdformat->format);
@@ -365,7 +366,7 @@ static int adv748x_afe_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv748x_afe_set_format(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_format *sdformat)
 {
 	struct v4l2_mbus_framefmt *mbusformat;
@@ -375,9 +376,9 @@ static int adv748x_afe_set_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		return adv748x_afe_get_format(sd, cfg, sdformat);
+		return adv748x_afe_get_format(sd, sd_state, sdformat);
 
-	mbusformat = v4l2_subdev_get_try_format(sd, cfg, sdformat->pad);
+	mbusformat = v4l2_subdev_get_try_format(sd, sd_state, sdformat->pad);
 	*mbusformat = sdformat->format;
 
 	return 0;
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index fa9278a08fde..589e9644fcdc 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -141,26 +141,26 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
 
 static struct v4l2_mbus_framefmt *
 adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    unsigned int pad, u32 which)
 {
 	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
 
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(sd, cfg, pad);
+		return v4l2_subdev_get_try_format(sd, sd_state, pad);
 
 	return &tx->format;
 }
 
 static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
 	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
 	struct adv748x_state *state = tx->state;
 	struct v4l2_mbus_framefmt *mbusformat;
 
-	mbusformat = adv748x_csi2_get_pad_format(sd, cfg, sdformat->pad,
+	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
 						 sdformat->which);
 	if (!mbusformat)
 		return -EINVAL;
@@ -175,7 +175,7 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
 	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
@@ -183,7 +183,7 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mbusformat;
 	int ret = 0;
 
-	mbusformat = adv748x_csi2_get_pad_format(sd, cfg, sdformat->pad,
+	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
 						 sdformat->which);
 	if (!mbusformat)
 		return -EINVAL;
@@ -193,7 +193,7 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 	if (sdformat->pad == ADV748X_CSI2_SOURCE) {
 		const struct v4l2_mbus_framefmt *sink_fmt;
 
-		sink_fmt = adv748x_csi2_get_pad_format(sd, cfg,
+		sink_fmt = adv748x_csi2_get_pad_format(sd, sd_state,
 						       ADV748X_CSI2_SINK,
 						       sdformat->which);
 
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index c557f8fdf11a..52fa7bd75660 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -409,7 +409,7 @@ static int adv748x_hdmi_propagate_pixelrate(struct adv748x_hdmi *hdmi)
 }
 
 static int adv748x_hdmi_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index != 0)
@@ -421,7 +421,7 @@ static int adv748x_hdmi_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int adv748x_hdmi_get_format(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
 	struct adv748x_hdmi *hdmi = adv748x_sd_to_hdmi(sd);
@@ -431,7 +431,8 @@ static int adv748x_hdmi_get_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sdformat->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mbusformat = v4l2_subdev_get_try_format(sd, cfg, sdformat->pad);
+		mbusformat = v4l2_subdev_get_try_format(sd, sd_state,
+							sdformat->pad);
 		sdformat->format = *mbusformat;
 	} else {
 		adv748x_hdmi_fill_format(hdmi, &sdformat->format);
@@ -442,7 +443,7 @@ static int adv748x_hdmi_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv748x_hdmi_set_format(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
 	struct v4l2_mbus_framefmt *mbusformat;
@@ -451,9 +452,9 @@ static int adv748x_hdmi_set_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		return adv748x_hdmi_get_format(sd, cfg, sdformat);
+		return adv748x_hdmi_get_format(sd, sd_state, sdformat);
 
-	mbusformat = v4l2_subdev_get_try_format(sd, cfg, sdformat->pad);
+	mbusformat = v4l2_subdev_get_try_format(sd, sd_state, sdformat->pad);
 	*mbusformat = sdformat->format;
 
 	return 0;
diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 5fc6c06edda1..41f4e749a859 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1216,7 +1216,7 @@ static int adv7511_get_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 }
 
 static int adv7511_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad != 0)
@@ -1247,7 +1247,7 @@ static void adv7511_fill_format(struct adv7511_state *state,
 }
 
 static int adv7511_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct adv7511_state *state = get_adv7511_state(sd);
@@ -1261,7 +1261,7 @@ static int adv7511_get_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
 		format->format.code = fmt->code;
 		format->format.colorspace = fmt->colorspace;
 		format->format.ycbcr_enc = fmt->ycbcr_enc;
@@ -1279,7 +1279,7 @@ static int adv7511_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int adv7511_set_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct adv7511_state *state = get_adv7511_state(sd);
@@ -1316,7 +1316,7 @@ static int adv7511_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
 		fmt->code = format->format.code;
 		fmt->colorspace = format->format.colorspace;
 		fmt->ycbcr_enc = format->format.ycbcr_enc;
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 3049aa2fd0f0..122e1fdccd96 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -1833,7 +1833,7 @@ static int adv76xx_s_routing(struct v4l2_subdev *sd,
 }
 
 static int adv76xx_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct adv76xx_state *state = to_state(sd);
@@ -1913,7 +1913,7 @@ static void adv76xx_setup_format(struct adv76xx_state *state)
 }
 
 static int adv76xx_get_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct adv76xx_state *state = to_state(sd);
@@ -1926,7 +1926,7 @@ static int adv76xx_get_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
 		format->format.code = fmt->code;
 	} else {
 		format->format.code = state->format->code;
@@ -1936,7 +1936,7 @@ static int adv76xx_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv76xx_get_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct adv76xx_state *state = to_state(sd);
@@ -1956,7 +1956,7 @@ static int adv76xx_get_selection(struct v4l2_subdev *sd,
 }
 
 static int adv76xx_set_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct adv76xx_state *state = to_state(sd);
@@ -1975,7 +1975,7 @@ static int adv76xx_set_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
 		fmt->code = format->format.code;
 	} else {
 		state->format = info;
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 78e61fe6f2f0..263713963a00 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -1993,7 +1993,7 @@ static int adv7842_s_routing(struct v4l2_subdev *sd,
 }
 
 static int adv7842_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(adv7842_formats))
@@ -2069,7 +2069,7 @@ static void adv7842_setup_format(struct adv7842_state *state)
 }
 
 static int adv7842_get_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct adv7842_state *state = to_state(sd);
@@ -2097,7 +2097,7 @@ static int adv7842_get_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
 		format->format.code = fmt->code;
 	} else {
 		format->format.code = state->format->code;
@@ -2107,7 +2107,7 @@ static int adv7842_get_format(struct v4l2_subdev *sd,
 }
 
 static int adv7842_set_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct adv7842_state *state = to_state(sd);
@@ -2117,7 +2117,7 @@ static int adv7842_set_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (state->mode == ADV7842_MODE_SDP)
-		return adv7842_get_format(sd, cfg, format);
+		return adv7842_get_format(sd, sd_state, format);
 
 	info = adv7842_format_info(state, format->format.code);
 	if (info == NULL)
@@ -2129,7 +2129,7 @@ static int adv7842_set_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
 		fmt->code = format->format.code;
 	} else {
 		state->format = info;
diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
index 1adaf470c75a..dc569d5a4d9d 100644
--- a/drivers/media/i2c/ak881x.c
+++ b/drivers/media/i2c/ak881x.c
@@ -91,7 +91,7 @@ static int ak881x_s_register(struct v4l2_subdev *sd,
 #endif
 
 static int ak881x_fill_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -111,7 +111,7 @@ static int ak881x_fill_fmt(struct v4l2_subdev *sd,
 }
 
 static int ak881x_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index)
@@ -122,7 +122,7 @@ static int ak881x_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ak881x_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a349189a38db..a9403a227c6b 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1944,7 +1944,7 @@ static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
 }
 
 static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
@@ -1997,13 +1997,13 @@ static u32 __ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
 }
 
 static int __ccs_get_format(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt->format = *v4l2_subdev_get_try_format(subdev, cfg,
+		fmt->format = *v4l2_subdev_get_try_format(subdev, sd_state,
 							  fmt->pad);
 	} else {
 		struct v4l2_rect *r;
@@ -2023,21 +2023,21 @@ static int __ccs_get_format(struct v4l2_subdev *subdev,
 }
 
 static int ccs_get_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	int rval;
 
 	mutex_lock(&sensor->mutex);
-	rval = __ccs_get_format(subdev, cfg, fmt);
+	rval = __ccs_get_format(subdev, sd_state, fmt);
 	mutex_unlock(&sensor->mutex);
 
 	return rval;
 }
 
 static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_rect **crops,
 				 struct v4l2_rect **comps, int which)
 {
@@ -2054,24 +2054,25 @@ static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
 		if (crops) {
 			for (i = 0; i < subdev->entity.num_pads; i++)
 				crops[i] = v4l2_subdev_get_try_crop(subdev,
-								    cfg, i);
+								    sd_state,
+								    i);
 		}
 		if (comps)
-			*comps = v4l2_subdev_get_try_compose(subdev, cfg,
+			*comps = v4l2_subdev_get_try_compose(subdev, sd_state,
 							     CCS_PAD_SINK);
 	}
 }
 
 /* Changes require propagation only on sink pad. */
 static void ccs_propagate(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *cfg, int which,
+			  struct v4l2_subdev_state *sd_state, int which,
 			  int target)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crops[CCS_PADS];
 
-	ccs_get_crop_compose(subdev, cfg, crops, &comp, which);
+	ccs_get_crop_compose(subdev, sd_state, crops, &comp, which);
 
 	switch (target) {
 	case V4L2_SEL_TGT_CROP:
@@ -2111,7 +2112,7 @@ static const struct ccs_csi_data_format
 }
 
 static int ccs_set_format_source(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
@@ -2122,7 +2123,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 	unsigned int i;
 	int rval;
 
-	rval = __ccs_get_format(subdev, cfg, fmt);
+	rval = __ccs_get_format(subdev, sd_state, fmt);
 	if (rval)
 		return rval;
 
@@ -2164,7 +2165,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 }
 
 static int ccs_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
@@ -2176,7 +2177,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	if (fmt->pad == ssd->source_pad) {
 		int rval;
 
-		rval = ccs_set_format_source(subdev, cfg, fmt);
+		rval = ccs_set_format_source(subdev, sd_state, fmt);
 
 		mutex_unlock(&sensor->mutex);
 
@@ -2198,7 +2199,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 		      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 		      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
 
-	ccs_get_crop_compose(subdev, cfg, crops, NULL, fmt->which);
+	ccs_get_crop_compose(subdev, sd_state, crops, NULL, fmt->which);
 
 	crops[ssd->sink_pad]->left = 0;
 	crops[ssd->sink_pad]->top = 0;
@@ -2206,7 +2207,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	crops[ssd->sink_pad]->height = fmt->format.height;
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		ssd->sink_fmt = *crops[ssd->sink_pad];
-	ccs_propagate(subdev, cfg, fmt->which, V4L2_SEL_TGT_CROP);
+	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
 
 	mutex_unlock(&sensor->mutex);
 
@@ -2258,7 +2259,7 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
 }
 
 static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel,
 				   struct v4l2_rect **crops,
 				   struct v4l2_rect *comp)
@@ -2306,7 +2307,7 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
  * result.
  */
 static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel,
 				   struct v4l2_rect **crops,
 				   struct v4l2_rect *comp)
@@ -2421,25 +2422,25 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 }
 /* We're only called on source pads. This function sets scaling. */
 static int ccs_set_compose(struct v4l2_subdev *subdev,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_selection *sel)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crops[CCS_PADS];
 
-	ccs_get_crop_compose(subdev, cfg, crops, &comp, sel->which);
+	ccs_get_crop_compose(subdev, sd_state, crops, &comp, sel->which);
 
 	sel->r.top = 0;
 	sel->r.left = 0;
 
 	if (ssd == sensor->binner)
-		ccs_set_compose_binner(subdev, cfg, sel, crops, comp);
+		ccs_set_compose_binner(subdev, sd_state, sel, crops, comp);
 	else
-		ccs_set_compose_scaler(subdev, cfg, sel, crops, comp);
+		ccs_set_compose_scaler(subdev, sd_state, sel, crops, comp);
 
 	*comp = sel->r;
-	ccs_propagate(subdev, cfg, sel->which, V4L2_SEL_TGT_COMPOSE);
+	ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_COMPOSE);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return ccs_pll_blanking_update(sensor);
@@ -2486,7 +2487,7 @@ static int __ccs_sel_supported(struct v4l2_subdev *subdev,
 }
 
 static int ccs_set_crop(struct v4l2_subdev *subdev,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_selection *sel)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
@@ -2494,7 +2495,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	struct v4l2_rect *src_size, *crops[CCS_PADS];
 	struct v4l2_rect _r;
 
-	ccs_get_crop_compose(subdev, cfg, crops, NULL, sel->which);
+	ccs_get_crop_compose(subdev, sd_state, crops, NULL, sel->which);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		if (sel->pad == ssd->sink_pad)
@@ -2505,16 +2506,18 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 		if (sel->pad == ssd->sink_pad) {
 			_r.left = 0;
 			_r.top = 0;
-			_r.width = v4l2_subdev_get_try_format(subdev, cfg,
+			_r.width = v4l2_subdev_get_try_format(subdev,
+							      sd_state,
 							      sel->pad)
 				->width;
-			_r.height = v4l2_subdev_get_try_format(subdev, cfg,
+			_r.height = v4l2_subdev_get_try_format(subdev,
+							       sd_state,
 							       sel->pad)
 				->height;
 			src_size = &_r;
 		} else {
 			src_size = v4l2_subdev_get_try_compose(
-				subdev, cfg, ssd->sink_pad);
+				subdev, sd_state, ssd->sink_pad);
 		}
 	}
 
@@ -2532,7 +2535,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	*crops[sel->pad] = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
-		ccs_propagate(subdev, cfg, sel->which, V4L2_SEL_TGT_CROP);
+		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
@@ -2546,7 +2549,7 @@ static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
 }
 
 static int __ccs_get_selection(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_selection *sel)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
@@ -2559,13 +2562,14 @@ static int __ccs_get_selection(struct v4l2_subdev *subdev,
 	if (ret)
 		return ret;
 
-	ccs_get_crop_compose(subdev, cfg, crops, &comp, sel->which);
+	ccs_get_crop_compose(subdev, sd_state, crops, &comp, sel->which);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		sink_fmt = ssd->sink_fmt;
 	} else {
 		struct v4l2_mbus_framefmt *fmt =
-			v4l2_subdev_get_try_format(subdev, cfg, ssd->sink_pad);
+			v4l2_subdev_get_try_format(subdev, sd_state,
+						   ssd->sink_pad);
 
 		sink_fmt.left = 0;
 		sink_fmt.top = 0;
@@ -2596,21 +2600,21 @@ static int __ccs_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int ccs_get_selection(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	int rval;
 
 	mutex_lock(&sensor->mutex);
-	rval = __ccs_get_selection(subdev, cfg, sel);
+	rval = __ccs_get_selection(subdev, sd_state, sel);
 	mutex_unlock(&sensor->mutex);
 
 	return rval;
 }
 
 static int ccs_set_selection(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
@@ -2634,10 +2638,10 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		ret = ccs_set_crop(subdev, cfg, sel);
+		ret = ccs_set_crop(subdev, sd_state, sel);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		ret = ccs_set_compose(subdev, cfg, sel);
+		ret = ccs_set_compose(subdev, sd_state, sel);
 		break;
 	default:
 		ret = -EINVAL;
@@ -3028,9 +3032,9 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	for (i = 0; i < ssd->npads; i++) {
 		struct v4l2_mbus_framefmt *try_fmt =
-			v4l2_subdev_get_try_format(sd, fh->pad, i);
+			v4l2_subdev_get_try_format(sd, fh->state, i);
 		struct v4l2_rect *try_crop =
-			v4l2_subdev_get_try_crop(sd, fh->pad, i);
+			v4l2_subdev_get_try_crop(sd, fh->state, i);
 		struct v4l2_rect *try_comp;
 
 		ccs_get_native_size(ssd, try_crop);
@@ -3043,7 +3047,7 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		if (ssd != sensor->pixel_array)
 			continue;
 
-		try_comp = v4l2_subdev_get_try_compose(sd, fh->pad, i);
+		try_comp = v4l2_subdev_get_try_compose(sd, fh->state, i);
 		*try_comp = *try_crop;
 	}
 
diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index e2e935f78986..dc31944c7d5b 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -1746,7 +1746,7 @@ static int cx25840_s_ctrl(struct v4l2_ctrl *ctrl)
 /* ----------------------------------------------------------------------- */
 
 static int cx25840_set_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index bb3eac5e005e..c7b91c0c03b5 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -882,7 +882,7 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
  */
 #define MAX_FMTS 4
 static int et8ek8_enum_mbus_code(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct et8ek8_reglist **list =
@@ -920,7 +920,7 @@ static int et8ek8_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int et8ek8_enum_frame_size(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct et8ek8_reglist **list =
@@ -958,7 +958,7 @@ static int et8ek8_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int et8ek8_enum_frame_ival(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct et8ek8_reglist **list =
@@ -990,12 +990,13 @@ static int et8ek8_enum_frame_ival(struct v4l2_subdev *subdev,
 
 static struct v4l2_mbus_framefmt *
 __et8ek8_get_pad_format(struct et8ek8_sensor *sensor,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&sensor->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&sensor->subdev, sd_state,
+						  pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &sensor->format;
 	default:
@@ -1004,13 +1005,14 @@ __et8ek8_get_pad_format(struct et8ek8_sensor *sensor,
 }
 
 static int et8ek8_get_pad_format(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __et8ek8_get_pad_format(sensor, cfg, fmt->pad, fmt->which);
+	format = __et8ek8_get_pad_format(sensor, sd_state, fmt->pad,
+					 fmt->which);
 	if (!format)
 		return -EINVAL;
 
@@ -1020,14 +1022,15 @@ static int et8ek8_get_pad_format(struct v4l2_subdev *subdev,
 }
 
 static int et8ek8_set_pad_format(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct et8ek8_reglist *reglist;
 
-	format = __et8ek8_get_pad_format(sensor, cfg, fmt->pad, fmt->which);
+	format = __et8ek8_get_pad_format(sensor, sd_state, fmt->pad,
+					 fmt->which);
 	if (!format)
 		return -EINVAL;
 
@@ -1327,7 +1330,7 @@ static int et8ek8_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	struct et8ek8_reglist *reglist;
 
 	reglist = et8ek8_reglist_find_type(&meta_reglist, ET8EK8_REGLIST_MODE);
-	format = __et8ek8_get_pad_format(sensor, fh->pad, 0,
+	format = __et8ek8_get_pad_format(sensor, fh->state, 0,
 					 V4L2_SUBDEV_FORMAT_TRY);
 	et8ek8_reglist_to_mbus(reglist, format);
 
diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 627ccfa34835..8db1cbedc1fd 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -875,7 +875,7 @@ static int __maybe_unused hi556_resume(struct device *dev)
 }
 
 static int hi556_set_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct hi556 *hi556 = to_hi556(sd);
@@ -890,7 +890,7 @@ static int hi556_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&hi556->mutex);
 	hi556_assign_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
+		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
 	} else {
 		hi556->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(hi556->link_freq, mode->link_freq_index);
@@ -917,14 +917,15 @@ static int hi556_set_format(struct v4l2_subdev *sd,
 }
 
 static int hi556_get_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct hi556 *hi556 = to_hi556(sd);
 
 	mutex_lock(&hi556->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&hi556->sd, cfg,
+		fmt->format = *v4l2_subdev_get_try_format(&hi556->sd,
+							  sd_state,
 							  fmt->pad);
 	else
 		hi556_assign_pad_format(hi556->cur_mode, &fmt->format);
@@ -935,7 +936,7 @@ static int hi556_get_format(struct v4l2_subdev *sd,
 }
 
 static int hi556_enum_mbus_code(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index > 0)
@@ -947,7 +948,7 @@ static int hi556_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int hi556_enum_frame_size(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= ARRAY_SIZE(supported_modes))
@@ -970,7 +971,7 @@ static int hi556_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&hi556->mutex);
 	hi556_assign_pad_format(&supported_modes[0],
-				v4l2_subdev_get_try_format(sd, fh->pad, 0));
+				v4l2_subdev_get_try_format(sd, fh->state, 0));
 	mutex_unlock(&hi556->mutex);
 
 	return 0;
diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index 9ed261ea7255..6f3d9c1b5879 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -395,7 +395,7 @@ static int imx208_write_regs(struct imx208 *imx208,
 static int imx208_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, fh->pad, 0);
+		v4l2_subdev_get_try_format(sd, fh->state, 0);
 
 	/* Initialize try_fmt */
 	try_fmt->width = supported_modes[0].width;
@@ -500,7 +500,7 @@ static const struct v4l2_ctrl_config imx208_digital_gain_control = {
 };
 
 static int imx208_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct imx208 *imx208 = to_imx208(sd);
@@ -514,7 +514,7 @@ static int imx208_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx208_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx208 *imx208 = to_imx208(sd);
@@ -544,11 +544,12 @@ static void imx208_mode_to_pad_format(struct imx208 *imx208,
 }
 
 static int __imx208_get_pad_format(struct imx208 *imx208,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&imx208->sd, cfg,
+		fmt->format = *v4l2_subdev_get_try_format(&imx208->sd,
+							  sd_state,
 							  fmt->pad);
 	else
 		imx208_mode_to_pad_format(imx208, imx208->cur_mode, fmt);
@@ -557,21 +558,21 @@ static int __imx208_get_pad_format(struct imx208 *imx208,
 }
 
 static int imx208_get_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx208 *imx208 = to_imx208(sd);
 	int ret;
 
 	mutex_lock(&imx208->imx208_mx);
-	ret = __imx208_get_pad_format(imx208, cfg, fmt);
+	ret = __imx208_get_pad_format(imx208, sd_state, fmt);
 	mutex_unlock(&imx208->imx208_mx);
 
 	return ret;
 }
 
 static int imx208_set_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx208 *imx208 = to_imx208(sd);
@@ -590,7 +591,7 @@ static int imx208_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	imx208_mode_to_pad_format(imx208, mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
+		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
 	} else {
 		imx208->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(imx208->link_freq, mode->link_freq_index);
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 1a770a530cf5..83c1737abeec 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -474,7 +474,7 @@ static int __maybe_unused imx214_power_off(struct device *dev)
 }
 
 static int imx214_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index > 0)
@@ -486,7 +486,7 @@ static int imx214_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx214_enum_frame_size(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->code != IMX214_MBUS_CODE)
@@ -534,13 +534,13 @@ static const struct v4l2_subdev_core_ops imx214_core_ops = {
 
 static struct v4l2_mbus_framefmt *
 __imx214_get_pad_format(struct imx214 *imx214,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			unsigned int pad,
 			enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&imx214->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&imx214->sd, sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &imx214->fmt;
 	default:
@@ -549,13 +549,14 @@ __imx214_get_pad_format(struct imx214 *imx214,
 }
 
 static int imx214_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
 	struct imx214 *imx214 = to_imx214(sd);
 
 	mutex_lock(&imx214->mutex);
-	format->format = *__imx214_get_pad_format(imx214, cfg, format->pad,
+	format->format = *__imx214_get_pad_format(imx214, sd_state,
+						  format->pad,
 						  format->which);
 	mutex_unlock(&imx214->mutex);
 
@@ -563,12 +564,13 @@ static int imx214_get_format(struct v4l2_subdev *sd,
 }
 
 static struct v4l2_rect *
-__imx214_get_pad_crop(struct imx214 *imx214, struct v4l2_subdev_pad_config *cfg,
+__imx214_get_pad_crop(struct imx214 *imx214,
+		      struct v4l2_subdev_state *sd_state,
 		      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&imx214->sd, cfg, pad);
+		return v4l2_subdev_get_try_crop(&imx214->sd, sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &imx214->crop;
 	default:
@@ -577,7 +579,7 @@ __imx214_get_pad_crop(struct imx214 *imx214, struct v4l2_subdev_pad_config *cfg,
 }
 
 static int imx214_set_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
 	struct imx214 *imx214 = to_imx214(sd);
@@ -587,7 +589,8 @@ static int imx214_set_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&imx214->mutex);
 
-	__crop = __imx214_get_pad_crop(imx214, cfg, format->pad, format->which);
+	__crop = __imx214_get_pad_crop(imx214, sd_state, format->pad,
+				       format->which);
 
 	mode = v4l2_find_nearest_size(imx214_modes,
 				      ARRAY_SIZE(imx214_modes), width, height,
@@ -597,7 +600,7 @@ static int imx214_set_format(struct v4l2_subdev *sd,
 	__crop->width = mode->width;
 	__crop->height = mode->height;
 
-	__format = __imx214_get_pad_format(imx214, cfg, format->pad,
+	__format = __imx214_get_pad_format(imx214, sd_state, format->pad,
 					   format->which);
 	__format->width = __crop->width;
 	__format->height = __crop->height;
@@ -617,7 +620,7 @@ static int imx214_set_format(struct v4l2_subdev *sd,
 }
 
 static int imx214_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	struct imx214 *imx214 = to_imx214(sd);
@@ -626,22 +629,22 @@ static int imx214_get_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	mutex_lock(&imx214->mutex);
-	sel->r = *__imx214_get_pad_crop(imx214, cfg, sel->pad,
+	sel->r = *__imx214_get_pad_crop(imx214, sd_state, sel->pad,
 					sel->which);
 	mutex_unlock(&imx214->mutex);
 	return 0;
 }
 
 static int imx214_entity_init_cfg(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg)
+				  struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = { };
 
-	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
 	fmt.format.width = imx214_modes[0].width;
 	fmt.format.height = imx214_modes[0].height;
 
-	imx214_set_format(subdev, cfg, &fmt);
+	imx214_set_format(subdev, sd_state, &fmt);
 
 	return 0;
 }
@@ -808,7 +811,7 @@ static int imx214_g_frame_interval(struct v4l2_subdev *subdev,
 }
 
 static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_interval_enum *fie)
 {
 	const struct imx214_mode *mode;
diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 74a0bf9b088b..e10af3f74b38 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -689,7 +689,7 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct imx219 *imx219 = to_imx219(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, fh->pad, 0);
+		v4l2_subdev_get_try_format(sd, fh->state, 0);
 	struct v4l2_rect *try_crop;
 
 	mutex_lock(&imx219->mutex);
@@ -702,7 +702,7 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->field = V4L2_FIELD_NONE;
 
 	/* Initialize try_crop rectangle. */
-	try_crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
+	try_crop = v4l2_subdev_get_try_crop(sd, fh->state, 0);
 	try_crop->top = IMX219_PIXEL_ARRAY_TOP;
 	try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
 	try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
@@ -803,7 +803,7 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
 };
 
 static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct imx219 *imx219 = to_imx219(sd);
@@ -819,7 +819,7 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx219_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx219 *imx219 = to_imx219(sd);
@@ -863,12 +863,13 @@ static void imx219_update_pad_format(struct imx219 *imx219,
 }
 
 static int __imx219_get_pad_format(struct imx219 *imx219,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *try_fmt =
-			v4l2_subdev_get_try_format(&imx219->sd, cfg, fmt->pad);
+			v4l2_subdev_get_try_format(&imx219->sd, sd_state,
+						   fmt->pad);
 		/* update the code which could change due to vflip or hflip: */
 		try_fmt->code = imx219_get_format_code(imx219, try_fmt->code);
 		fmt->format = *try_fmt;
@@ -882,21 +883,21 @@ static int __imx219_get_pad_format(struct imx219 *imx219,
 }
 
 static int imx219_get_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx219 *imx219 = to_imx219(sd);
 	int ret;
 
 	mutex_lock(&imx219->mutex);
-	ret = __imx219_get_pad_format(imx219, cfg, fmt);
+	ret = __imx219_get_pad_format(imx219, sd_state, fmt);
 	mutex_unlock(&imx219->mutex);
 
 	return ret;
 }
 
 static int imx219_set_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx219 *imx219 = to_imx219(sd);
@@ -922,7 +923,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	imx219_update_pad_format(imx219, mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else if (imx219->mode != mode ||
 		   imx219->fmt.code != fmt->format.code) {
@@ -979,12 +980,13 @@ static int imx219_set_framefmt(struct imx219 *imx219)
 }
 
 static const struct v4l2_rect *
-__imx219_get_pad_crop(struct imx219 *imx219, struct v4l2_subdev_pad_config *cfg,
+__imx219_get_pad_crop(struct imx219 *imx219,
+		      struct v4l2_subdev_state *sd_state,
 		      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&imx219->sd, cfg, pad);
+		return v4l2_subdev_get_try_crop(&imx219->sd, sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &imx219->mode->crop;
 	}
@@ -993,7 +995,7 @@ __imx219_get_pad_crop(struct imx219 *imx219, struct v4l2_subdev_pad_config *cfg,
 }
 
 static int imx219_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	switch (sel->target) {
@@ -1001,7 +1003,7 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 		struct imx219 *imx219 = to_imx219(sd);
 
 		mutex_lock(&imx219->mutex);
-		sel->r = *__imx219_get_pad_crop(imx219, cfg, sel->pad,
+		sel->r = *__imx219_get_pad_crop(imx219, sd_state, sel->pad,
 						sel->which);
 		mutex_unlock(&imx219->mutex);
 
diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 90529424d5b6..7ab9e5f9f267 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -710,7 +710,7 @@ static int imx258_write_regs(struct imx258 *imx258,
 static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, fh->pad, 0);
+		v4l2_subdev_get_try_format(sd, fh->state, 0);
 
 	/* Initialize try_fmt */
 	try_fmt->width = supported_modes[0].width;
@@ -820,7 +820,7 @@ static const struct v4l2_ctrl_ops imx258_ctrl_ops = {
 };
 
 static int imx258_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	/* Only one bayer order(GRBG) is supported */
@@ -833,7 +833,7 @@ static int imx258_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx258_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= ARRAY_SIZE(supported_modes))
@@ -860,11 +860,12 @@ static void imx258_update_pad_format(const struct imx258_mode *mode,
 }
 
 static int __imx258_get_pad_format(struct imx258 *imx258,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&imx258->sd, cfg,
+		fmt->format = *v4l2_subdev_get_try_format(&imx258->sd,
+							  sd_state,
 							  fmt->pad);
 	else
 		imx258_update_pad_format(imx258->cur_mode, fmt);
@@ -873,21 +874,21 @@ static int __imx258_get_pad_format(struct imx258 *imx258,
 }
 
 static int imx258_get_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx258 *imx258 = to_imx258(sd);
 	int ret;
 
 	mutex_lock(&imx258->mutex);
-	ret = __imx258_get_pad_format(imx258, cfg, fmt);
+	ret = __imx258_get_pad_format(imx258, sd_state, fmt);
 	mutex_unlock(&imx258->mutex);
 
 	return ret;
 }
 
 static int imx258_set_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx258 *imx258 = to_imx258(sd);
@@ -909,7 +910,7 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 		fmt->format.width, fmt->format.height);
 	imx258_update_pad_format(mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		imx258->cur_mode = mode;
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index ee2127436f0b..0dce92872176 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -996,7 +996,7 @@ static int imx274_binning_goodness(struct stimx274 *imx274,
  * Must be called with imx274->lock locked.
  *
  * @imx274: The device object
- * @cfg:    The pad config we are editing for TRY requests
+ * @sd_state: The subdev state we are editing for TRY requests
  * @which:  V4L2_SUBDEV_FORMAT_ACTIVE or V4L2_SUBDEV_FORMAT_TRY from the caller
  * @width:  Input-output parameter: set to the desired width before
  *          the call, contains the chosen value after returning successfully
@@ -1005,7 +1005,7 @@ static int imx274_binning_goodness(struct stimx274 *imx274,
  *          available (when called from set_fmt)
  */
 static int __imx274_change_compose(struct stimx274 *imx274,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   u32 which,
 				   u32 *width,
 				   u32 *height,
@@ -1019,8 +1019,8 @@ static int __imx274_change_compose(struct stimx274 *imx274,
 	int best_goodness = INT_MIN;
 
 	if (which == V4L2_SUBDEV_FORMAT_TRY) {
-		cur_crop = &cfg->try_crop;
-		tgt_fmt = &cfg->try_fmt;
+		cur_crop = &sd_state->pads->try_crop;
+		tgt_fmt = &sd_state->pads->try_fmt;
 	} else {
 		cur_crop = &imx274->crop;
 		tgt_fmt = &imx274->format;
@@ -1061,7 +1061,7 @@ static int __imx274_change_compose(struct stimx274 *imx274,
 /**
  * imx274_get_fmt - Get the pad format
  * @sd: Pointer to V4L2 Sub device structure
- * @cfg: Pointer to sub device pad information structure
+ * @sd_state: Pointer to sub device state structure
  * @fmt: Pointer to pad level media bus format
  *
  * This function is used to get the pad format information.
@@ -1069,7 +1069,7 @@ static int __imx274_change_compose(struct stimx274 *imx274,
  * Return: 0 on success
  */
 static int imx274_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct stimx274 *imx274 = to_imx274(sd);
@@ -1083,7 +1083,7 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
 /**
  * imx274_set_fmt - This is used to set the pad format
  * @sd: Pointer to V4L2 Sub device structure
- * @cfg: Pointer to sub device pad information structure
+ * @sd_state: Pointer to sub device state information structure
  * @format: Pointer to pad level media bus format
  *
  * This function is used to set the pad format.
@@ -1091,7 +1091,7 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
  * Return: 0 on success
  */
 static int imx274_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -1100,7 +1100,7 @@ static int imx274_set_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&imx274->lock);
 
-	err = __imx274_change_compose(imx274, cfg, format->which,
+	err = __imx274_change_compose(imx274, sd_state, format->which,
 				      &fmt->width, &fmt->height, 0);
 
 	if (err)
@@ -1113,7 +1113,7 @@ static int imx274_set_fmt(struct v4l2_subdev *sd,
 	 */
 	fmt->field = V4L2_FIELD_NONE;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 	else
 		imx274->format = *fmt;
 
@@ -1124,7 +1124,7 @@ static int imx274_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int imx274_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	struct stimx274 *imx274 = to_imx274(sd);
@@ -1144,8 +1144,8 @@ static int imx274_get_selection(struct v4l2_subdev *sd,
 	}
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		src_crop = &cfg->try_crop;
-		src_fmt = &cfg->try_fmt;
+		src_crop = &sd_state->pads->try_crop;
+		src_fmt = &sd_state->pads->try_fmt;
 	} else {
 		src_crop = &imx274->crop;
 		src_fmt = &imx274->format;
@@ -1179,7 +1179,7 @@ static int imx274_get_selection(struct v4l2_subdev *sd,
 }
 
 static int imx274_set_selection_crop(struct stimx274 *imx274,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
 	struct v4l2_rect *tgt_crop;
@@ -1216,7 +1216,7 @@ static int imx274_set_selection_crop(struct stimx274 *imx274,
 	sel->r = new_crop;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
-		tgt_crop = &cfg->try_crop;
+		tgt_crop = &sd_state->pads->try_crop;
 	else
 		tgt_crop = &imx274->crop;
 
@@ -1230,7 +1230,7 @@ static int imx274_set_selection_crop(struct stimx274 *imx274,
 
 	/* if crop size changed then reset the output image size */
 	if (size_changed)
-		__imx274_change_compose(imx274, cfg, sel->which,
+		__imx274_change_compose(imx274, sd_state, sel->which,
 					&new_crop.width, &new_crop.height,
 					sel->flags);
 
@@ -1240,7 +1240,7 @@ static int imx274_set_selection_crop(struct stimx274 *imx274,
 }
 
 static int imx274_set_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	struct stimx274 *imx274 = to_imx274(sd);
@@ -1249,13 +1249,13 @@ static int imx274_set_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sel->target == V4L2_SEL_TGT_CROP)
-		return imx274_set_selection_crop(imx274, cfg, sel);
+		return imx274_set_selection_crop(imx274, sd_state, sel);
 
 	if (sel->target == V4L2_SEL_TGT_COMPOSE) {
 		int err;
 
 		mutex_lock(&imx274->lock);
-		err =  __imx274_change_compose(imx274, cfg, sel->which,
+		err =  __imx274_change_compose(imx274, sd_state, sel->which,
 					       &sel->r.width, &sel->r.height,
 					       sel->flags);
 		mutex_unlock(&imx274->lock);
diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 06020e648a97..bf7a6c37ca5d 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -516,7 +516,7 @@ static const struct v4l2_ctrl_ops imx290_ctrl_ops = {
 };
 
 static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(imx290_formats))
@@ -528,7 +528,7 @@ static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx290_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	const struct imx290 *imx290 = to_imx290(sd);
@@ -550,7 +550,7 @@ static int imx290_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int imx290_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct imx290 *imx290 = to_imx290(sd);
@@ -559,7 +559,7 @@ static int imx290_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&imx290->lock);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		framefmt = v4l2_subdev_get_try_format(&imx290->sd, cfg,
+		framefmt = v4l2_subdev_get_try_format(&imx290->sd, sd_state,
 						      fmt->pad);
 	else
 		framefmt = &imx290->current_format;
@@ -596,8 +596,8 @@ static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
 }
 
 static int imx290_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
-		      struct v4l2_subdev_format *fmt)
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_format *fmt)
 {
 	struct imx290 *imx290 = to_imx290(sd);
 	const struct imx290_mode *mode;
@@ -624,7 +624,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.field = V4L2_FIELD_NONE;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		format = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		format = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 	} else {
 		format = &imx290->current_format;
 		imx290->current_mode = mode;
@@ -646,15 +646,15 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg)
+				  struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = { 0 };
 
-	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
 	fmt.format.width = 1920;
 	fmt.format.height = 1080;
 
-	imx290_set_fmt(subdev, cfg, &fmt);
+	imx290_set_fmt(subdev, sd_state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 4e0a8c9d271f..dba0854ab5aa 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -1860,7 +1860,7 @@ static int imx319_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct imx319 *imx319 = to_imx319(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, fh->pad, 0);
+		v4l2_subdev_get_try_format(sd, fh->state, 0);
 
 	mutex_lock(&imx319->mutex);
 
@@ -1947,7 +1947,7 @@ static const struct v4l2_ctrl_ops imx319_ctrl_ops = {
 };
 
 static int imx319_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct imx319 *imx319 = to_imx319(sd);
@@ -1963,7 +1963,7 @@ static int imx319_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx319_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx319 *imx319 = to_imx319(sd);
@@ -1997,14 +1997,14 @@ static void imx319_update_pad_format(struct imx319 *imx319,
 }
 
 static int imx319_do_get_pad_format(struct imx319 *imx319,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
 	struct v4l2_mbus_framefmt *framefmt;
 	struct v4l2_subdev *sd = &imx319->sd;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		imx319_update_pad_format(imx319, imx319->cur_mode, fmt);
@@ -2014,14 +2014,14 @@ static int imx319_do_get_pad_format(struct imx319 *imx319,
 }
 
 static int imx319_get_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx319 *imx319 = to_imx319(sd);
 	int ret;
 
 	mutex_lock(&imx319->mutex);
-	ret = imx319_do_get_pad_format(imx319, cfg, fmt);
+	ret = imx319_do_get_pad_format(imx319, sd_state, fmt);
 	mutex_unlock(&imx319->mutex);
 
 	return ret;
@@ -2029,7 +2029,7 @@ static int imx319_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 imx319_set_pad_format(struct v4l2_subdev *sd,
-		      struct v4l2_subdev_pad_config *cfg,
+		      struct v4l2_subdev_state *sd_state,
 		      struct v4l2_subdev_format *fmt)
 {
 	struct imx319 *imx319 = to_imx319(sd);
@@ -2055,7 +2055,7 @@ imx319_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	imx319_update_pad_format(imx319, mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		imx319->cur_mode = mode;
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 23f28606e570..062125501788 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -497,13 +497,13 @@ static const struct v4l2_ctrl_ops imx334_ctrl_ops = {
 /**
  * imx334_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
  * @sd: pointer to imx334 V4L2 sub-device structure
- * @cfg: V4L2 sub-device pad configuration
+ * @sd_state: V4L2 sub-device state
  * @code: V4L2 sub-device code enumeration need to be filled
  *
  * Return: 0 if successful, error code otherwise.
  */
 static int imx334_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index > 0)
@@ -517,13 +517,13 @@ static int imx334_enum_mbus_code(struct v4l2_subdev *sd,
 /**
  * imx334_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
  * @sd: pointer to imx334 V4L2 sub-device structure
- * @cfg: V4L2 sub-device pad configuration
+ * @sd_state: V4L2 sub-device state
  * @fsize: V4L2 sub-device size enumeration need to be filled
  *
  * Return: 0 if successful, error code otherwise.
  */
 static int imx334_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fsize)
 {
 	if (fsize->index > 0)
@@ -564,13 +564,13 @@ static void imx334_fill_pad_format(struct imx334 *imx334,
 /**
  * imx334_get_pad_format() - Get subdevice pad format
  * @sd: pointer to imx334 V4L2 sub-device structure
- * @cfg: V4L2 sub-device pad configuration
+ * @sd_state: V4L2 sub-device state
  * @fmt: V4L2 sub-device format need to be set
  *
  * Return: 0 if successful, error code otherwise.
  */
 static int imx334_get_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx334 *imx334 = to_imx334(sd);
@@ -580,7 +580,7 @@ static int imx334_get_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		imx334_fill_pad_format(imx334, imx334->cur_mode, fmt);
@@ -594,13 +594,13 @@ static int imx334_get_pad_format(struct v4l2_subdev *sd,
 /**
  * imx334_set_pad_format() - Set subdevice pad format
  * @sd: pointer to imx334 V4L2 sub-device structure
- * @cfg: V4L2 sub-device pad configuration
+ * @sd_state: V4L2 sub-device state
  * @fmt: V4L2 sub-device format need to be set
  *
  * Return: 0 if successful, error code otherwise.
  */
 static int imx334_set_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx334 *imx334 = to_imx334(sd);
@@ -615,7 +615,7 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		ret = imx334_update_controls(imx334, mode);
@@ -631,20 +631,20 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 /**
  * imx334_init_pad_cfg() - Initialize sub-device pad configuration
  * @sd: pointer to imx334 V4L2 sub-device structure
- * @cfg: V4L2 sub-device pad configuration
+ * @sd_state: V4L2 sub-device state
  *
  * Return: 0 if successful, error code otherwise.
  */
 static int imx334_init_pad_cfg(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg)
+			       struct v4l2_subdev_state *sd_state)
 {
 	struct imx334 *imx334 = to_imx334(sd);
 	struct v4l2_subdev_format fmt = { 0 };
 
-	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
 	imx334_fill_pad_format(imx334, &supported_mode, &fmt);
 
-	return imx334_set_pad_format(sd, cfg, &fmt);
+	return imx334_set_pad_format(sd, sd_state, &fmt);
 }
 
 /**
diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 93f13a04439a..cb51c81786bd 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1161,7 +1161,7 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct imx355 *imx355 = to_imx355(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, fh->pad, 0);
+		v4l2_subdev_get_try_format(sd, fh->state, 0);
 
 	mutex_lock(&imx355->mutex);
 
@@ -1248,7 +1248,7 @@ static const struct v4l2_ctrl_ops imx355_ctrl_ops = {
 };
 
 static int imx355_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct imx355 *imx355 = to_imx355(sd);
@@ -1264,7 +1264,7 @@ static int imx355_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx355_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx355 *imx355 = to_imx355(sd);
@@ -1298,14 +1298,14 @@ static void imx355_update_pad_format(struct imx355 *imx355,
 }
 
 static int imx355_do_get_pad_format(struct imx355 *imx355,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
 	struct v4l2_mbus_framefmt *framefmt;
 	struct v4l2_subdev *sd = &imx355->sd;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		imx355_update_pad_format(imx355, imx355->cur_mode, fmt);
@@ -1315,14 +1315,14 @@ static int imx355_do_get_pad_format(struct imx355 *imx355,
 }
 
 static int imx355_get_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx355 *imx355 = to_imx355(sd);
 	int ret;
 
 	mutex_lock(&imx355->mutex);
-	ret = imx355_do_get_pad_format(imx355, cfg, fmt);
+	ret = imx355_do_get_pad_format(imx355, sd_state, fmt);
 	mutex_unlock(&imx355->mutex);
 
 	return ret;
@@ -1330,7 +1330,7 @@ static int imx355_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 imx355_set_pad_format(struct v4l2_subdev *sd,
-		      struct v4l2_subdev_pad_config *cfg,
+		      struct v4l2_subdev_state *sd_state,
 		      struct v4l2_subdev_format *fmt)
 {
 	struct imx355 *imx355 = to_imx355(sd);
@@ -1356,7 +1356,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	imx355_update_pad_format(imx355, mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		imx355->cur_mode = mode;
diff --git a/drivers/media/i2c/m5mols/m5mols_core.c b/drivers/media/i2c/m5mols/m5mols_core.c
index 21666d705e37..e29be0242f07 100644
--- a/drivers/media/i2c/m5mols/m5mols_core.c
+++ b/drivers/media/i2c/m5mols/m5mols_core.c
@@ -539,17 +539,19 @@ static int __find_resolution(struct v4l2_subdev *sd,
 }
 
 static struct v4l2_mbus_framefmt *__find_format(struct m5mols_info *info,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				enum v4l2_subdev_format_whence which,
 				enum m5mols_restype type)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return cfg ? v4l2_subdev_get_try_format(&info->sd, cfg, 0) : NULL;
+		return sd_state ? v4l2_subdev_get_try_format(&info->sd,
+							     sd_state, 0) : NULL;
 
 	return &info->ffmt[type];
 }
 
-static int m5mols_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int m5mols_get_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct m5mols_info *info = to_m5mols(sd);
@@ -558,7 +560,7 @@ static int m5mols_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 
 	mutex_lock(&info->lock);
 
-	format = __find_format(info, cfg, fmt->which, info->res_type);
+	format = __find_format(info, sd_state, fmt->which, info->res_type);
 	if (format)
 		fmt->format = *format;
 	else
@@ -568,7 +570,8 @@ static int m5mols_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 	return ret;
 }
 
-static int m5mols_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int m5mols_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct m5mols_info *info = to_m5mols(sd);
@@ -582,7 +585,7 @@ static int m5mols_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 	if (ret < 0)
 		return ret;
 
-	sfmt = __find_format(info, cfg, fmt->which, type);
+	sfmt = __find_format(info, sd_state, fmt->which, type);
 	if (!sfmt)
 		return 0;
 
@@ -648,7 +651,7 @@ static int m5mols_set_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 
 static int m5mols_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (!code || code->index >= SIZE_DEFAULT_FFMT)
@@ -909,7 +912,9 @@ static const struct v4l2_subdev_core_ops m5mols_core_ops = {
  */
 static int m5mols_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	struct v4l2_mbus_framefmt *format = v4l2_subdev_get_try_format(sd, fh->pad, 0);
+	struct v4l2_mbus_framefmt *format = v4l2_subdev_get_try_format(sd,
+								       fh->state,
+								       0);
 
 	*format = m5mols_default_ffmt[0];
 	return 0;
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 6fd4d59fcc72..4631bfeeacc0 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -712,7 +712,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index > 0)
@@ -725,12 +725,12 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
 
 static struct v4l2_mbus_framefmt *
 max9286_get_pad_format(struct max9286_priv *priv,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       unsigned int pad, u32 which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&priv->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&priv->sd, sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &priv->fmt[pad];
 	default:
@@ -739,7 +739,7 @@ max9286_get_pad_format(struct max9286_priv *priv,
 }
 
 static int max9286_set_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
@@ -760,7 +760,8 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 		break;
 	}
 
-	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
+	cfg_fmt = max9286_get_pad_format(priv, sd_state, format->pad,
+					 format->which);
 	if (!cfg_fmt)
 		return -EINVAL;
 
@@ -772,7 +773,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int max9286_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
@@ -788,7 +789,7 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 	if (pad == MAX9286_SRC_PAD)
 		pad = __ffs(priv->bound_sources);
 
-	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);
+	cfg_fmt = max9286_get_pad_format(priv, sd_state, pad, format->which);
 	if (!cfg_fmt)
 		return -EINVAL;
 
@@ -832,7 +833,7 @@ static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 	unsigned int i;
 
 	for (i = 0; i < MAX9286_N_SINKS; i++) {
-		format = v4l2_subdev_get_try_format(subdev, fh->pad, i);
+		format = v4l2_subdev_get_try_format(subdev, fh->state, i);
 		max9286_init_format(format);
 	}
 
diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.c
index ff212335326a..4a1410ebb4c8 100644
--- a/drivers/media/i2c/ml86v7667.c
+++ b/drivers/media/i2c/ml86v7667.c
@@ -188,7 +188,7 @@ static int ml86v7667_g_input_status(struct v4l2_subdev *sd, u32 *status)
 }
 
 static int ml86v7667_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index > 0)
@@ -200,7 +200,7 @@ static int ml86v7667_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ml86v7667_fill_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct ml86v7667_priv *priv = to_ml86v7667(sd);
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 58c85a3bccf6..c9f0bd997ea7 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -254,7 +254,7 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int mt9m001_set_selection(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -295,7 +295,7 @@ static int mt9m001_set_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_get_selection(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -320,7 +320,7 @@ static int mt9m001_get_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -331,7 +331,7 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		format->format = *mf;
 		return 0;
 	}
@@ -377,7 +377,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -411,7 +411,7 @@ static int mt9m001_set_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return mt9m001_s_fmt(sd, fmt, mf);
-	cfg->try_fmt = *mf;
+	sd_state->pads->try_fmt = *mf;
 	return 0;
 }
 
@@ -657,12 +657,12 @@ static const struct v4l2_subdev_core_ops mt9m001_subdev_core_ops = {
 };
 
 static int mt9m001_init_cfg(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg)
+			    struct v4l2_subdev_state *sd_state)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, cfg, 0);
+		v4l2_subdev_get_try_format(sd, sd_state, 0);
 
 	try_fmt->width		= MT9M001_MAX_WIDTH;
 	try_fmt->height		= MT9M001_MAX_HEIGHT;
@@ -677,7 +677,7 @@ static int mt9m001_init_cfg(struct v4l2_subdev *sd,
 }
 
 static int mt9m001_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
diff --git a/drivers/media/i2c/mt9m032.c b/drivers/media/i2c/mt9m032.c
index 5a4c0f9d1eee..ba0c0ea91c95 100644
--- a/drivers/media/i2c/mt9m032.c
+++ b/drivers/media/i2c/mt9m032.c
@@ -304,7 +304,7 @@ static int mt9m032_setup_pll(struct mt9m032 *sensor)
  */
 
 static int mt9m032_enum_mbus_code(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index != 0)
@@ -315,7 +315,7 @@ static int mt9m032_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int mt9m032_enum_frame_size(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index != 0 || fse->code != MEDIA_BUS_FMT_Y8_1X8)
@@ -332,18 +332,19 @@ static int mt9m032_enum_frame_size(struct v4l2_subdev *subdev,
 /**
  * __mt9m032_get_pad_crop() - get crop rect
  * @sensor: pointer to the sensor struct
- * @cfg: v4l2_subdev_pad_config for getting the try crop rect from
+ * @sd_state: v4l2_subdev_state for getting the try crop rect from
  * @which: select try or active crop rect
  *
  * Returns a pointer the current active or fh relative try crop rect
  */
 static struct v4l2_rect *
-__mt9m032_get_pad_crop(struct mt9m032 *sensor, struct v4l2_subdev_pad_config *cfg,
+__mt9m032_get_pad_crop(struct mt9m032 *sensor,
+		       struct v4l2_subdev_state *sd_state,
 		       enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&sensor->subdev, cfg, 0);
+		return v4l2_subdev_get_try_crop(&sensor->subdev, sd_state, 0);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &sensor->crop;
 	default:
@@ -354,18 +355,20 @@ __mt9m032_get_pad_crop(struct mt9m032 *sensor, struct v4l2_subdev_pad_config *cf
 /**
  * __mt9m032_get_pad_format() - get format
  * @sensor: pointer to the sensor struct
- * @cfg: v4l2_subdev_pad_config for getting the try format from
+ * @sd_state: v4l2_subdev_state for getting the try format from
  * @which: select try or active format
  *
  * Returns a pointer the current active or fh relative try format
  */
 static struct v4l2_mbus_framefmt *
-__mt9m032_get_pad_format(struct mt9m032 *sensor, struct v4l2_subdev_pad_config *cfg,
+__mt9m032_get_pad_format(struct mt9m032 *sensor,
+			 struct v4l2_subdev_state *sd_state,
 			 enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&sensor->subdev, cfg, 0);
+		return v4l2_subdev_get_try_format(&sensor->subdev, sd_state,
+						  0);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &sensor->format;
 	default:
@@ -374,20 +377,20 @@ __mt9m032_get_pad_format(struct mt9m032 *sensor, struct v4l2_subdev_pad_config *
 }
 
 static int mt9m032_get_pad_format(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
 	struct mt9m032 *sensor = to_mt9m032(subdev);
 
 	mutex_lock(&sensor->lock);
-	fmt->format = *__mt9m032_get_pad_format(sensor, cfg, fmt->which);
+	fmt->format = *__mt9m032_get_pad_format(sensor, sd_state, fmt->which);
 	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
 
 static int mt9m032_set_pad_format(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
 	struct mt9m032 *sensor = to_mt9m032(subdev);
@@ -401,7 +404,7 @@ static int mt9m032_set_pad_format(struct v4l2_subdev *subdev,
 	}
 
 	/* Scaling is not supported, the format is thus fixed. */
-	fmt->format = *__mt9m032_get_pad_format(sensor, cfg, fmt->which);
+	fmt->format = *__mt9m032_get_pad_format(sensor, sd_state, fmt->which);
 	ret = 0;
 
 done:
@@ -410,7 +413,7 @@ static int mt9m032_set_pad_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9m032_get_pad_selection(struct v4l2_subdev *subdev,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
 	struct mt9m032 *sensor = to_mt9m032(subdev);
@@ -419,14 +422,14 @@ static int mt9m032_get_pad_selection(struct v4l2_subdev *subdev,
 		return -EINVAL;
 
 	mutex_lock(&sensor->lock);
-	sel->r = *__mt9m032_get_pad_crop(sensor, cfg, sel->which);
+	sel->r = *__mt9m032_get_pad_crop(sensor, sd_state, sel->which);
 	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
 
 static int mt9m032_set_pad_selection(struct v4l2_subdev *subdev,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
 	struct mt9m032 *sensor = to_mt9m032(subdev);
@@ -462,13 +465,14 @@ static int mt9m032_set_pad_selection(struct v4l2_subdev *subdev,
 	rect.height = min_t(unsigned int, rect.height,
 			    MT9M032_PIXEL_ARRAY_HEIGHT - rect.top);
 
-	__crop = __mt9m032_get_pad_crop(sensor, cfg, sel->which);
+	__crop = __mt9m032_get_pad_crop(sensor, sd_state, sel->which);
 
 	if (rect.width != __crop->width || rect.height != __crop->height) {
 		/* Reset the output image size if the crop rectangle size has
 		 * been modified.
 		 */
-		format = __mt9m032_get_pad_format(sensor, cfg, sel->which);
+		format = __mt9m032_get_pad_format(sensor, sd_state,
+						  sel->which);
 		format->width = rect.width;
 		format->height = rect.height;
 	}
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 0e11734f75aa..91a44359bcd3 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -449,7 +449,7 @@ static int mt9m111_reset(struct mt9m111 *mt9m111)
 }
 
 static int mt9m111_set_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -493,7 +493,7 @@ static int mt9m111_set_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9m111_get_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -518,7 +518,7 @@ static int mt9m111_get_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9m111_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -529,7 +529,7 @@ static int mt9m111_get_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-		mf = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
 		format->format = *mf;
 		return 0;
 #else
@@ -624,7 +624,7 @@ static int mt9m111_set_pixfmt(struct mt9m111 *mt9m111,
 }
 
 static int mt9m111_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -678,7 +678,7 @@ static int mt9m111_set_fmt(struct v4l2_subdev *sd,
 	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *mf;
+		sd_state->pads->try_fmt = *mf;
 		return 0;
 	}
 
@@ -1100,7 +1100,7 @@ static int mt9m111_s_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int mt9m111_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= ARRAY_SIZE(mt9m111_colour_fmts))
@@ -1119,11 +1119,11 @@ static int mt9m111_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int mt9m111_init_cfg(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg)
+			    struct v4l2_subdev_state *sd_state)
 {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 	struct v4l2_mbus_framefmt *format =
-		v4l2_subdev_get_try_format(sd, cfg, 0);
+		v4l2_subdev_get_try_format(sd, sd_state, 0);
 
 	format->width	= MT9M111_MAX_WIDTH;
 	format->height	= MT9M111_MAX_HEIGHT;
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index a633b934d93e..6eb88ef99783 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -470,7 +470,7 @@ static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
 }
 
 static int mt9p031_enum_mbus_code(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
@@ -483,7 +483,7 @@ static int mt9p031_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int mt9p031_enum_frame_size(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
@@ -501,12 +501,14 @@ static int mt9p031_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static struct v4l2_mbus_framefmt *
-__mt9p031_get_pad_format(struct mt9p031 *mt9p031, struct v4l2_subdev_pad_config *cfg,
+__mt9p031_get_pad_format(struct mt9p031 *mt9p031,
+			 struct v4l2_subdev_state *sd_state,
 			 unsigned int pad, u32 which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&mt9p031->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&mt9p031->subdev, sd_state,
+						  pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9p031->format;
 	default:
@@ -515,12 +517,14 @@ __mt9p031_get_pad_format(struct mt9p031 *mt9p031, struct v4l2_subdev_pad_config
 }
 
 static struct v4l2_rect *
-__mt9p031_get_pad_crop(struct mt9p031 *mt9p031, struct v4l2_subdev_pad_config *cfg,
-		     unsigned int pad, u32 which)
+__mt9p031_get_pad_crop(struct mt9p031 *mt9p031,
+		       struct v4l2_subdev_state *sd_state,
+		       unsigned int pad, u32 which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&mt9p031->subdev, cfg, pad);
+		return v4l2_subdev_get_try_crop(&mt9p031->subdev, sd_state,
+						pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9p031->crop;
 	default:
@@ -529,18 +533,18 @@ __mt9p031_get_pad_crop(struct mt9p031 *mt9p031, struct v4l2_subdev_pad_config *c
 }
 
 static int mt9p031_get_format(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
 
-	fmt->format = *__mt9p031_get_pad_format(mt9p031, cfg, fmt->pad,
+	fmt->format = *__mt9p031_get_pad_format(mt9p031, sd_state, fmt->pad,
 						fmt->which);
 	return 0;
 }
 
 static int mt9p031_set_format(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
@@ -551,7 +555,7 @@ static int mt9p031_set_format(struct v4l2_subdev *subdev,
 	unsigned int hratio;
 	unsigned int vratio;
 
-	__crop = __mt9p031_get_pad_crop(mt9p031, cfg, format->pad,
+	__crop = __mt9p031_get_pad_crop(mt9p031, sd_state, format->pad,
 					format->which);
 
 	/* Clamp the width and height to avoid dividing by zero. */
@@ -567,7 +571,7 @@ static int mt9p031_set_format(struct v4l2_subdev *subdev,
 	hratio = DIV_ROUND_CLOSEST(__crop->width, width);
 	vratio = DIV_ROUND_CLOSEST(__crop->height, height);
 
-	__format = __mt9p031_get_pad_format(mt9p031, cfg, format->pad,
+	__format = __mt9p031_get_pad_format(mt9p031, sd_state, format->pad,
 					    format->which);
 	__format->width = __crop->width / hratio;
 	__format->height = __crop->height / vratio;
@@ -578,7 +582,7 @@ static int mt9p031_set_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9p031_get_selection(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
@@ -586,12 +590,13 @@ static int mt9p031_get_selection(struct v4l2_subdev *subdev,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	sel->r = *__mt9p031_get_pad_crop(mt9p031, cfg, sel->pad, sel->which);
+	sel->r = *__mt9p031_get_pad_crop(mt9p031, sd_state, sel->pad,
+					 sel->which);
 	return 0;
 }
 
 static int mt9p031_set_selection(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
@@ -621,13 +626,15 @@ static int mt9p031_set_selection(struct v4l2_subdev *subdev,
 	rect.height = min_t(unsigned int, rect.height,
 			    MT9P031_PIXEL_ARRAY_HEIGHT - rect.top);
 
-	__crop = __mt9p031_get_pad_crop(mt9p031, cfg, sel->pad, sel->which);
+	__crop = __mt9p031_get_pad_crop(mt9p031, sd_state, sel->pad,
+					sel->which);
 
 	if (rect.width != __crop->width || rect.height != __crop->height) {
 		/* Reset the output image size if the crop rectangle size has
 		 * been modified.
 		 */
-		__format = __mt9p031_get_pad_format(mt9p031, cfg, sel->pad,
+		__format = __mt9p031_get_pad_format(mt9p031, sd_state,
+						    sel->pad,
 						    sel->which);
 		__format->width = rect.width;
 		__format->height = rect.height;
@@ -942,13 +949,13 @@ static int mt9p031_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 
-	crop = v4l2_subdev_get_try_crop(subdev, fh->pad, 0);
+	crop = v4l2_subdev_get_try_crop(subdev, fh->state, 0);
 	crop->left = MT9P031_COLUMN_START_DEF;
 	crop->top = MT9P031_ROW_START_DEF;
 	crop->width = MT9P031_WINDOW_WIDTH_DEF;
 	crop->height = MT9P031_WINDOW_HEIGHT_DEF;
 
-	format = v4l2_subdev_get_try_format(subdev, fh->pad, 0);
+	format = v4l2_subdev_get_try_format(subdev, fh->state, 0);
 
 	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
 		format->code = MEDIA_BUS_FMT_Y12_1X12;
diff --git a/drivers/media/i2c/mt9t001.c b/drivers/media/i2c/mt9t001.c
index 2e96ff5234b4..b651ee4a26e8 100644
--- a/drivers/media/i2c/mt9t001.c
+++ b/drivers/media/i2c/mt9t001.c
@@ -252,12 +252,14 @@ static int __mt9t001_set_power(struct mt9t001 *mt9t001, bool on)
  */
 
 static struct v4l2_mbus_framefmt *
-__mt9t001_get_pad_format(struct mt9t001 *mt9t001, struct v4l2_subdev_pad_config *cfg,
+__mt9t001_get_pad_format(struct mt9t001 *mt9t001,
+			 struct v4l2_subdev_state *sd_state,
 			 unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&mt9t001->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&mt9t001->subdev, sd_state,
+						  pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9t001->format;
 	default:
@@ -266,12 +268,14 @@ __mt9t001_get_pad_format(struct mt9t001 *mt9t001, struct v4l2_subdev_pad_config
 }
 
 static struct v4l2_rect *
-__mt9t001_get_pad_crop(struct mt9t001 *mt9t001, struct v4l2_subdev_pad_config *cfg,
+__mt9t001_get_pad_crop(struct mt9t001 *mt9t001,
+		       struct v4l2_subdev_state *sd_state,
 		       unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&mt9t001->subdev, cfg, pad);
+		return v4l2_subdev_get_try_crop(&mt9t001->subdev, sd_state,
+						pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9t001->crop;
 	default:
@@ -335,7 +339,7 @@ static int mt9t001_s_stream(struct v4l2_subdev *subdev, int enable)
 }
 
 static int mt9t001_enum_mbus_code(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index > 0)
@@ -346,7 +350,7 @@ static int mt9t001_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int mt9t001_enum_frame_size(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= 8 || fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
@@ -361,18 +365,19 @@ static int mt9t001_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int mt9t001_get_format(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
 
-	format->format = *__mt9t001_get_pad_format(mt9t001, cfg, format->pad,
+	format->format = *__mt9t001_get_pad_format(mt9t001, sd_state,
+						   format->pad,
 						   format->which);
 	return 0;
 }
 
 static int mt9t001_set_format(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
@@ -383,7 +388,7 @@ static int mt9t001_set_format(struct v4l2_subdev *subdev,
 	unsigned int hratio;
 	unsigned int vratio;
 
-	__crop = __mt9t001_get_pad_crop(mt9t001, cfg, format->pad,
+	__crop = __mt9t001_get_pad_crop(mt9t001, sd_state, format->pad,
 					format->which);
 
 	/* Clamp the width and height to avoid dividing by zero. */
@@ -399,7 +404,7 @@ static int mt9t001_set_format(struct v4l2_subdev *subdev,
 	hratio = DIV_ROUND_CLOSEST(__crop->width, width);
 	vratio = DIV_ROUND_CLOSEST(__crop->height, height);
 
-	__format = __mt9t001_get_pad_format(mt9t001, cfg, format->pad,
+	__format = __mt9t001_get_pad_format(mt9t001, sd_state, format->pad,
 					    format->which);
 	__format->width = __crop->width / hratio;
 	__format->height = __crop->height / vratio;
@@ -410,7 +415,7 @@ static int mt9t001_set_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9t001_get_selection(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
@@ -418,12 +423,13 @@ static int mt9t001_get_selection(struct v4l2_subdev *subdev,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	sel->r = *__mt9t001_get_pad_crop(mt9t001, cfg, sel->pad, sel->which);
+	sel->r = *__mt9t001_get_pad_crop(mt9t001, sd_state, sel->pad,
+					 sel->which);
 	return 0;
 }
 
 static int mt9t001_set_selection(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
@@ -455,13 +461,15 @@ static int mt9t001_set_selection(struct v4l2_subdev *subdev,
 	rect.height = min_t(unsigned int, rect.height,
 			    MT9T001_PIXEL_ARRAY_HEIGHT - rect.top);
 
-	__crop = __mt9t001_get_pad_crop(mt9t001, cfg, sel->pad, sel->which);
+	__crop = __mt9t001_get_pad_crop(mt9t001, sd_state, sel->pad,
+					sel->which);
 
 	if (rect.width != __crop->width || rect.height != __crop->height) {
 		/* Reset the output image size if the crop rectangle size has
 		 * been modified.
 		 */
-		__format = __mt9t001_get_pad_format(mt9t001, cfg, sel->pad,
+		__format = __mt9t001_get_pad_format(mt9t001, sd_state,
+						    sel->pad,
 						    sel->which);
 		__format->width = rect.width;
 		__format->height = rect.height;
@@ -798,13 +806,13 @@ static int mt9t001_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 
-	crop = v4l2_subdev_get_try_crop(subdev, fh->pad, 0);
+	crop = v4l2_subdev_get_try_crop(subdev, fh->state, 0);
 	crop->left = MT9T001_COLUMN_START_DEF;
 	crop->top = MT9T001_ROW_START_DEF;
 	crop->width = MT9T001_WINDOW_WIDTH_DEF + 1;
 	crop->height = MT9T001_WINDOW_HEIGHT_DEF + 1;
 
-	format = v4l2_subdev_get_try_format(subdev, fh->pad, 0);
+	format = v4l2_subdev_get_try_format(subdev, fh->state, 0);
 	format->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format->width = MT9T001_WINDOW_WIDTH_DEF + 1;
 	format->height = MT9T001_WINDOW_HEIGHT_DEF + 1;
diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index ae3c336eadf5..8d2e3caa9b28 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -872,8 +872,8 @@ static int mt9t112_set_params(struct mt9t112_priv *priv,
 }
 
 static int mt9t112_get_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
-		struct v4l2_subdev_selection *sel)
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct mt9t112_priv *priv = to_mt9t112(client);
@@ -897,7 +897,7 @@ static int mt9t112_get_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9t112_set_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -912,7 +912,7 @@ static int mt9t112_set_selection(struct v4l2_subdev *sd,
 }
 
 static int mt9t112_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -953,7 +953,7 @@ static int mt9t112_s_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9t112_set_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -982,13 +982,13 @@ static int mt9t112_set_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return mt9t112_s_fmt(sd, mf);
-	cfg->try_fmt = *mf;
+	sd_state->pads->try_fmt = *mf;
 
 	return 0;
 }
 
 static int mt9t112_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 46ef74a2ca36..7699e64e1127 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -327,7 +327,7 @@ static int mt9v011_reset(struct v4l2_subdev *sd, u32 val)
 }
 
 static int mt9v011_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index > 0)
@@ -338,7 +338,7 @@ static int mt9v011_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mt9v011_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -358,7 +358,7 @@ static int mt9v011_set_fmt(struct v4l2_subdev *sd,
 
 		set_res(sd);
 	} else {
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 	}
 
 	return 0;
diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 5bd3ae82992f..4cfdd3dfbd42 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -349,12 +349,14 @@ static int __mt9v032_set_power(struct mt9v032 *mt9v032, bool on)
  */
 
 static struct v4l2_mbus_framefmt *
-__mt9v032_get_pad_format(struct mt9v032 *mt9v032, struct v4l2_subdev_pad_config *cfg,
+__mt9v032_get_pad_format(struct mt9v032 *mt9v032,
+			 struct v4l2_subdev_state *sd_state,
 			 unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&mt9v032->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&mt9v032->subdev, sd_state,
+						  pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9v032->format;
 	default:
@@ -363,12 +365,14 @@ __mt9v032_get_pad_format(struct mt9v032 *mt9v032, struct v4l2_subdev_pad_config
 }
 
 static struct v4l2_rect *
-__mt9v032_get_pad_crop(struct mt9v032 *mt9v032, struct v4l2_subdev_pad_config *cfg,
+__mt9v032_get_pad_crop(struct mt9v032 *mt9v032,
+		       struct v4l2_subdev_state *sd_state,
 		       unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&mt9v032->subdev, cfg, pad);
+		return v4l2_subdev_get_try_crop(&mt9v032->subdev, sd_state,
+						pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9v032->crop;
 	default:
@@ -425,7 +429,7 @@ static int mt9v032_s_stream(struct v4l2_subdev *subdev, int enable)
 }
 
 static int mt9v032_enum_mbus_code(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct mt9v032 *mt9v032 = to_mt9v032(subdev);
@@ -438,7 +442,7 @@ static int mt9v032_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int mt9v032_enum_frame_size(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct mt9v032 *mt9v032 = to_mt9v032(subdev);
@@ -457,12 +461,13 @@ static int mt9v032_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int mt9v032_get_format(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct mt9v032 *mt9v032 = to_mt9v032(subdev);
 
-	format->format = *__mt9v032_get_pad_format(mt9v032, cfg, format->pad,
+	format->format = *__mt9v032_get_pad_format(mt9v032, sd_state,
+						   format->pad,
 						   format->which);
 	return 0;
 }
@@ -492,7 +497,7 @@ static unsigned int mt9v032_calc_ratio(unsigned int input, unsigned int output)
 }
 
 static int mt9v032_set_format(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct mt9v032 *mt9v032 = to_mt9v032(subdev);
@@ -503,7 +508,7 @@ static int mt9v032_set_format(struct v4l2_subdev *subdev,
 	unsigned int hratio;
 	unsigned int vratio;
 
-	__crop = __mt9v032_get_pad_crop(mt9v032, cfg, format->pad,
+	__crop = __mt9v032_get_pad_crop(mt9v032, sd_state, format->pad,
 					format->which);
 
 	/* Clamp the width and height to avoid dividing by zero. */
@@ -519,7 +524,7 @@ static int mt9v032_set_format(struct v4l2_subdev *subdev,
 	hratio = mt9v032_calc_ratio(__crop->width, width);
 	vratio = mt9v032_calc_ratio(__crop->height, height);
 
-	__format = __mt9v032_get_pad_format(mt9v032, cfg, format->pad,
+	__format = __mt9v032_get_pad_format(mt9v032, sd_state, format->pad,
 					    format->which);
 	__format->width = __crop->width / hratio;
 	__format->height = __crop->height / vratio;
@@ -536,7 +541,7 @@ static int mt9v032_set_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9v032_get_selection(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct mt9v032 *mt9v032 = to_mt9v032(subdev);
@@ -544,12 +549,13 @@ static int mt9v032_get_selection(struct v4l2_subdev *subdev,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	sel->r = *__mt9v032_get_pad_crop(mt9v032, cfg, sel->pad, sel->which);
+	sel->r = *__mt9v032_get_pad_crop(mt9v032, sd_state, sel->pad,
+					 sel->which);
 	return 0;
 }
 
 static int mt9v032_set_selection(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct mt9v032 *mt9v032 = to_mt9v032(subdev);
@@ -581,13 +587,15 @@ static int mt9v032_set_selection(struct v4l2_subdev *subdev,
 	rect.height = min_t(unsigned int,
 			    rect.height, MT9V032_PIXEL_ARRAY_HEIGHT - rect.top);
 
-	__crop = __mt9v032_get_pad_crop(mt9v032, cfg, sel->pad, sel->which);
+	__crop = __mt9v032_get_pad_crop(mt9v032, sd_state, sel->pad,
+					sel->which);
 
 	if (rect.width != __crop->width || rect.height != __crop->height) {
 		/* Reset the output image size if the crop rectangle size has
 		 * been modified.
 		 */
-		__format = __mt9v032_get_pad_format(mt9v032, cfg, sel->pad,
+		__format = __mt9v032_get_pad_format(mt9v032, sd_state,
+						    sel->pad,
 						    sel->which);
 		__format->width = rect.width;
 		__format->height = rect.height;
@@ -922,13 +930,13 @@ static int mt9v032_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 
-	crop = v4l2_subdev_get_try_crop(subdev, fh->pad, 0);
+	crop = v4l2_subdev_get_try_crop(subdev, fh->state, 0);
 	crop->left = MT9V032_COLUMN_START_DEF;
 	crop->top = MT9V032_ROW_START_DEF;
 	crop->width = MT9V032_WINDOW_WIDTH_DEF;
 	crop->height = MT9V032_WINDOW_HEIGHT_DEF;
 
-	format = v4l2_subdev_get_try_format(subdev, fh->pad, 0);
+	format = v4l2_subdev_get_try_format(subdev, fh->state, 0);
 
 	if (mt9v032->model->color)
 		format->code = MEDIA_BUS_FMT_SGRBG10_1X10;
diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 97c7527b74ed..b438f8c077d5 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -791,14 +791,14 @@ static int mt9v111_g_frame_interval(struct v4l2_subdev *sd,
 
 static struct v4l2_mbus_framefmt *__mt9v111_get_pad_format(
 					struct mt9v111_dev *mt9v111,
-					struct v4l2_subdev_pad_config *cfg,
+					struct v4l2_subdev_state *sd_state,
 					unsigned int pad,
 					enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
 #if IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API)
-		return v4l2_subdev_get_try_format(&mt9v111->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&mt9v111->sd, sd_state, pad);
 #else
 		return &cfg->try_fmt;
 #endif
@@ -810,7 +810,7 @@ static struct v4l2_mbus_framefmt *__mt9v111_get_pad_format(
 }
 
 static int mt9v111_enum_mbus_code(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index > ARRAY_SIZE(mt9v111_formats) - 1)
@@ -822,7 +822,7 @@ static int mt9v111_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int mt9v111_enum_frame_interval(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_interval_enum *fie)
 {
 	unsigned int i;
@@ -845,7 +845,7 @@ static int mt9v111_enum_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int mt9v111_enum_frame_size(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->pad || fse->index >= ARRAY_SIZE(mt9v111_frame_sizes))
@@ -860,7 +860,7 @@ static int mt9v111_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int mt9v111_get_format(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct mt9v111_dev *mt9v111 = sd_to_mt9v111(subdev);
@@ -869,7 +869,8 @@ static int mt9v111_get_format(struct v4l2_subdev *subdev,
 		return -EINVAL;
 
 	mutex_lock(&mt9v111->stream_mutex);
-	format->format = *__mt9v111_get_pad_format(mt9v111, cfg, format->pad,
+	format->format = *__mt9v111_get_pad_format(mt9v111, sd_state,
+						   format->pad,
 						   format->which);
 	mutex_unlock(&mt9v111->stream_mutex);
 
@@ -877,7 +878,7 @@ static int mt9v111_get_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9v111_set_format(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct mt9v111_dev *mt9v111 = sd_to_mt9v111(subdev);
@@ -925,7 +926,7 @@ static int mt9v111_set_format(struct v4l2_subdev *subdev,
 	new_fmt.height = mt9v111_frame_sizes[idx].height;
 
 	/* Update the device (or pad) format if it has changed. */
-	__fmt = __mt9v111_get_pad_format(mt9v111, cfg, format->pad,
+	__fmt = __mt9v111_get_pad_format(mt9v111, sd_state, format->pad,
 					 format->which);
 
 	/* Format hasn't changed, stop here. */
@@ -954,9 +955,9 @@ static int mt9v111_set_format(struct v4l2_subdev *subdev,
 }
 
 static int mt9v111_init_cfg(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_pad_config *cfg)
+			    struct v4l2_subdev_state *sd_state)
 {
-	cfg->try_fmt = mt9v111_def_fmt;
+	sd_state->pads->try_fmt = mt9v111_def_fmt;
 
 	return 0;
 }
diff --git a/drivers/media/i2c/noon010pc30.c b/drivers/media/i2c/noon010pc30.c
index 87d76a7f691a..f3ac379ef34a 100644
--- a/drivers/media/i2c/noon010pc30.c
+++ b/drivers/media/i2c/noon010pc30.c
@@ -488,7 +488,7 @@ static int noon010_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static int noon010_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(noon010_formats))
@@ -499,15 +499,15 @@ static int noon010_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int noon010_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct noon010_info *info = to_noon010(sd);
 	struct v4l2_mbus_framefmt *mf;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		if (cfg) {
-			mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+		if (sd_state) {
+			mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 			fmt->format = *mf;
 		}
 		return 0;
@@ -539,7 +539,8 @@ static const struct noon010_format *noon010_try_fmt(struct v4l2_subdev *sd,
 	return &noon010_formats[i];
 }
 
-static int noon010_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int noon010_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct noon010_info *info = to_noon010(sd);
@@ -554,8 +555,8 @@ static int noon010_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 	fmt->format.field = V4L2_FIELD_NONE;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		if (cfg) {
-			mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+		if (sd_state) {
+			mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 			*mf = fmt->format;
 		}
 		return 0;
@@ -637,7 +638,9 @@ static int noon010_log_status(struct v4l2_subdev *sd)
 
 static int noon010_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	struct v4l2_mbus_framefmt *mf = v4l2_subdev_get_try_format(sd, fh->pad, 0);
+	struct v4l2_mbus_framefmt *mf = v4l2_subdev_get_try_format(sd,
+								   fh->state,
+								   0);
 
 	mf->width = noon010_sizes[0].width;
 	mf->height = noon010_sizes[0].height;
diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index a1d7314b20a9..a3ce5500d355 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -295,7 +295,7 @@ static void ov02a10_fill_fmt(const struct ov02a10_mode *mode,
 }
 
 static int ov02a10_set_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct ov02a10 *ov02a10 = to_ov02a10(sd);
@@ -315,7 +315,7 @@ static int ov02a10_set_fmt(struct v4l2_subdev *sd,
 	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		frame_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		frame_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
 	else
 		frame_fmt = &ov02a10->fmt;
 
@@ -327,7 +327,7 @@ static int ov02a10_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov02a10_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct ov02a10 *ov02a10 = to_ov02a10(sd);
@@ -336,7 +336,8 @@ static int ov02a10_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&ov02a10->mutex);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state,
+							  fmt->pad);
 	} else {
 		fmt->format = ov02a10->fmt;
 		mbus_fmt->code = ov02a10->fmt.code;
@@ -349,7 +350,7 @@ static int ov02a10_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct ov02a10 *ov02a10 = to_ov02a10(sd);
@@ -363,7 +364,7 @@ static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov02a10_enum_frame_sizes(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= ARRAY_SIZE(supported_modes))
@@ -511,7 +512,7 @@ static int __ov02a10_stop_stream(struct ov02a10 *ov02a10)
 }
 
 static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg)
+				   struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
@@ -521,7 +522,7 @@ static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
 		}
 	};
 
-	ov02a10_set_fmt(sd, cfg, &fmt);
+	ov02a10_set_fmt(sd, sd_state, &fmt);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 9598c0b19603..7fc70af53e45 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1150,7 +1150,7 @@ static int ov13858_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct ov13858 *ov13858 = to_ov13858(sd);
 	struct v4l2_mbus_framefmt *try_fmt = v4l2_subdev_get_try_format(sd,
-									fh->pad,
+									fh->state,
 									0);
 
 	mutex_lock(&ov13858->mutex);
@@ -1275,7 +1275,7 @@ static const struct v4l2_ctrl_ops ov13858_ctrl_ops = {
 };
 
 static int ov13858_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	/* Only one bayer order(GRBG) is supported */
@@ -1288,7 +1288,7 @@ static int ov13858_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov13858_enum_frame_size(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= ARRAY_SIZE(supported_modes))
@@ -1315,14 +1315,14 @@ static void ov13858_update_pad_format(const struct ov13858_mode *mode,
 }
 
 static int ov13858_do_get_pad_format(struct ov13858 *ov13858,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_format *fmt)
 {
 	struct v4l2_mbus_framefmt *framefmt;
 	struct v4l2_subdev *sd = &ov13858->sd;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		ov13858_update_pad_format(ov13858->cur_mode, fmt);
@@ -1332,14 +1332,14 @@ static int ov13858_do_get_pad_format(struct ov13858 *ov13858,
 }
 
 static int ov13858_get_pad_format(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
 	struct ov13858 *ov13858 = to_ov13858(sd);
 	int ret;
 
 	mutex_lock(&ov13858->mutex);
-	ret = ov13858_do_get_pad_format(ov13858, cfg, fmt);
+	ret = ov13858_do_get_pad_format(ov13858, sd_state, fmt);
 	mutex_unlock(&ov13858->mutex);
 
 	return ret;
@@ -1347,7 +1347,7 @@ static int ov13858_get_pad_format(struct v4l2_subdev *sd,
 
 static int
 ov13858_set_pad_format(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
 	struct ov13858 *ov13858 = to_ov13858(sd);
@@ -1371,7 +1371,7 @@ ov13858_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	ov13858_update_pad_format(mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		ov13858->cur_mode = mode;
diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 4a4bd5b665a1..4b75da55b260 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -913,7 +913,7 @@ static int ov2640_set_params(struct i2c_client *client,
 }
 
 static int ov2640_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -925,7 +925,7 @@ static int ov2640_get_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-		mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		format->format = *mf;
 		return 0;
 #else
@@ -946,7 +946,7 @@ static int ov2640_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2640_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -996,7 +996,7 @@ static int ov2640_set_fmt(struct v4l2_subdev *sd,
 		/* select format */
 		priv->cfmt_code = mf->code;
 	} else {
-		cfg->try_fmt = *mf;
+		sd_state->pads->try_fmt = *mf;
 	}
 out:
 	mutex_unlock(&priv->lock);
@@ -1005,11 +1005,11 @@ static int ov2640_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2640_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg)
+			   struct v4l2_subdev_state *sd_state)
 {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, cfg, 0);
+		v4l2_subdev_get_try_format(sd, sd_state, 0);
 	const struct ov2640_win_size *win =
 		ov2640_select_win(SVGA_WIDTH, SVGA_HEIGHT);
 
@@ -1026,7 +1026,7 @@ static int ov2640_init_cfg(struct v4l2_subdev *sd,
 }
 
 static int ov2640_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= ARRAY_SIZE(ov2640_codes))
@@ -1037,7 +1037,7 @@ static int ov2640_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov2640_get_selection(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_selection *sel)
 {
 	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index befef14aa86b..13ded5b2aa66 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -980,7 +980,7 @@ static int ov2659_init(struct v4l2_subdev *sd, u32 val)
  */
 
 static int ov2659_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -996,7 +996,7 @@ static int ov2659_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov2659_enum_frame_sizes(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -1022,7 +1022,7 @@ static int ov2659_enum_frame_sizes(struct v4l2_subdev *sd,
 }
 
 static int ov2659_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -1034,7 +1034,7 @@ static int ov2659_get_fmt(struct v4l2_subdev *sd,
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 		struct v4l2_mbus_framefmt *mf;
 
-		mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		mutex_lock(&ov2659->lock);
 		fmt->format = *mf;
 		mutex_unlock(&ov2659->lock);
@@ -1084,7 +1084,7 @@ static void __ov2659_try_frame_size(struct v4l2_mbus_framefmt *mf,
 }
 
 static int ov2659_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -1114,7 +1114,7 @@ static int ov2659_set_fmt(struct v4l2_subdev *sd,
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*mf = fmt->format;
 #endif
 	} else {
@@ -1311,7 +1311,7 @@ static int ov2659_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format =
-				v4l2_subdev_get_try_format(sd, fh->pad, 0);
+				v4l2_subdev_get_try_format(sd, fh->state, 0);
 
 	dev_dbg(&client->dev, "%s:\n", __func__);
 
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 178dfe985a25..906c711f6821 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -645,7 +645,7 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
@@ -659,7 +659,7 @@ static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov2680_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
@@ -673,7 +673,8 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-		fmt = v4l2_subdev_get_try_format(&sensor->sd, cfg, format->pad);
+		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
+						 format->pad);
 #else
 		ret = -EINVAL;
 #endif
@@ -690,7 +691,7 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2680_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
@@ -721,7 +722,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-		try_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		format->format = *try_fmt;
 #endif
 		goto unlock;
@@ -743,22 +744,22 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2680_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg)
+			   struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = {
-		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
-				: V4L2_SUBDEV_FORMAT_ACTIVE,
+		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
+		: V4L2_SUBDEV_FORMAT_ACTIVE,
 		.format = {
 			.width = 800,
 			.height = 600,
 		}
 	};
 
-	return ov2680_set_fmt(sd, cfg, &fmt);
+	return ov2680_set_fmt(sd, sd_state, &fmt);
 }
 
 static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	int index = fse->index;
@@ -775,7 +776,7 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct v4l2_fract tpf;
diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 2f3836dd8eed..b6e010ea3249 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -328,7 +328,7 @@ static void ov2685_fill_fmt(const struct ov2685_mode *mode,
 }
 
 static int ov2685_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct ov2685 *ov2685 = to_ov2685(sd);
@@ -341,7 +341,7 @@ static int ov2685_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2685_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct ov2685 *ov2685 = to_ov2685(sd);
@@ -353,7 +353,7 @@ static int ov2685_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2685_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(supported_modes))
@@ -365,7 +365,7 @@ static int ov2685_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov2685_enum_frame_sizes(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	int index = fse->index;
@@ -493,7 +493,7 @@ static int ov2685_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&ov2685->mutex);
 
-	try_fmt = v4l2_subdev_get_try_format(sd, fh->pad, 0);
+	try_fmt = v4l2_subdev_get_try_format(sd, fh->state, 0);
 	/* Initialize try_fmt */
 	ov2685_fill_fmt(&supported_modes[0], try_fmt);
 
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 54779f720f9d..599369a3d192 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -810,7 +810,7 @@ static int __maybe_unused ov2740_resume(struct device *dev)
 }
 
 static int ov2740_set_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct ov2740 *ov2740 = to_ov2740(sd);
@@ -825,7 +825,7 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&ov2740->mutex);
 	ov2740_update_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
+		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
 	} else {
 		ov2740->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(ov2740->link_freq, mode->link_freq_index);
@@ -850,14 +850,15 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 }
 
 static int ov2740_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct ov2740 *ov2740 = to_ov2740(sd);
 
 	mutex_lock(&ov2740->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&ov2740->sd, cfg,
+		fmt->format = *v4l2_subdev_get_try_format(&ov2740->sd,
+							  sd_state,
 							  fmt->pad);
 	else
 		ov2740_update_pad_format(ov2740->cur_mode, &fmt->format);
@@ -868,7 +869,7 @@ static int ov2740_get_format(struct v4l2_subdev *sd,
 }
 
 static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index > 0)
@@ -880,7 +881,7 @@ static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= ARRAY_SIZE(supported_modes))
@@ -903,7 +904,7 @@ static int ov2740_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&ov2740->mutex);
 	ov2740_update_pad_format(&supported_modes[0],
-				 v4l2_subdev_get_try_format(sd, fh->pad, 0));
+				 v4l2_subdev_get_try_format(sd, fh->state, 0));
 	mutex_unlock(&ov2740->mutex);
 
 	return 0;
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 5b9cc71df473..f6e1e51e0375 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2227,7 +2227,7 @@ static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
 }
 
 static int ov5640_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
@@ -2239,7 +2239,7 @@ static int ov5640_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&sensor->lock);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt = v4l2_subdev_get_try_format(&sensor->sd, cfg,
+		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
 						 format->pad);
 	else
 		fmt = &sensor->fmt;
@@ -2285,7 +2285,7 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 }
 
 static int ov5640_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
@@ -2310,7 +2310,7 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 		goto out;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
 	else
 		fmt = &sensor->fmt;
 
@@ -2818,7 +2818,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 }
 
 static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->pad != 0)
@@ -2838,7 +2838,7 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
 
 static int ov5640_enum_frame_interval(
 	struct v4l2_subdev *sd,
-	struct v4l2_subdev_pad_config *cfg,
+	struct v4l2_subdev_state *sd_state,
 	struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
@@ -2924,7 +2924,7 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int ov5640_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad != 0)
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a6c17d15d754..368fa21e675e 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -837,7 +837,7 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
 };
 
 static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index > 0)
@@ -849,7 +849,7 @@ static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov5645_enum_frame_size(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->code != MEDIA_BUS_FMT_UYVY8_2X8)
@@ -868,13 +868,13 @@ static int ov5645_enum_frame_size(struct v4l2_subdev *subdev,
 
 static struct v4l2_mbus_framefmt *
 __ov5645_get_pad_format(struct ov5645 *ov5645,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			unsigned int pad,
 			enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&ov5645->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&ov5645->sd, sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov5645->fmt;
 	default:
@@ -883,23 +883,25 @@ __ov5645_get_pad_format(struct ov5645 *ov5645,
 }
 
 static int ov5645_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
 	struct ov5645 *ov5645 = to_ov5645(sd);
 
-	format->format = *__ov5645_get_pad_format(ov5645, cfg, format->pad,
+	format->format = *__ov5645_get_pad_format(ov5645, sd_state,
+						  format->pad,
 						  format->which);
 	return 0;
 }
 
 static struct v4l2_rect *
-__ov5645_get_pad_crop(struct ov5645 *ov5645, struct v4l2_subdev_pad_config *cfg,
+__ov5645_get_pad_crop(struct ov5645 *ov5645,
+		      struct v4l2_subdev_state *sd_state,
 		      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&ov5645->sd, cfg, pad);
+		return v4l2_subdev_get_try_crop(&ov5645->sd, sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov5645->crop;
 	default:
@@ -908,7 +910,7 @@ __ov5645_get_pad_crop(struct ov5645 *ov5645, struct v4l2_subdev_pad_config *cfg,
 }
 
 static int ov5645_set_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
 	struct ov5645 *ov5645 = to_ov5645(sd);
@@ -917,8 +919,8 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 	const struct ov5645_mode_info *new_mode;
 	int ret;
 
-	__crop = __ov5645_get_pad_crop(ov5645, cfg, format->pad,
-			format->which);
+	__crop = __ov5645_get_pad_crop(ov5645, sd_state, format->pad,
+				       format->which);
 
 	new_mode = v4l2_find_nearest_size(ov5645_mode_info_data,
 			       ARRAY_SIZE(ov5645_mode_info_data),
@@ -942,8 +944,8 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 		ov5645->current_mode = new_mode;
 	}
 
-	__format = __ov5645_get_pad_format(ov5645, cfg, format->pad,
-			format->which);
+	__format = __ov5645_get_pad_format(ov5645, sd_state, format->pad,
+					   format->which);
 	__format->width = __crop->width;
 	__format->height = __crop->height;
 	__format->code = MEDIA_BUS_FMT_UYVY8_2X8;
@@ -956,21 +958,21 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 }
 
 static int ov5645_entity_init_cfg(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg)
+				  struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = { 0 };
 
-	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
 	fmt.format.width = 1920;
 	fmt.format.height = 1080;
 
-	ov5645_set_format(subdev, cfg, &fmt);
+	ov5645_set_format(subdev, sd_state, &fmt);
 
 	return 0;
 }
 
 static int ov5645_get_selection(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_selection *sel)
 {
 	struct ov5645 *ov5645 = to_ov5645(sd);
@@ -978,7 +980,7 @@ static int ov5645_get_selection(struct v4l2_subdev *sd,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	sel->r = *__ov5645_get_pad_crop(ov5645, cfg, sel->pad,
+	sel->r = *__ov5645_get_pad_crop(ov5645, sd_state, sel->pad,
 					sel->which);
 	return 0;
 }
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 38faa74755e3..d346d18ce629 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -856,12 +856,13 @@ static const struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
 };
 
 static const struct v4l2_rect *
-__ov5647_get_pad_crop(struct ov5647 *ov5647, struct v4l2_subdev_pad_config *cfg,
+__ov5647_get_pad_crop(struct ov5647 *ov5647,
+		      struct v4l2_subdev_state *sd_state,
 		      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&ov5647->sd, cfg, pad);
+		return v4l2_subdev_get_try_crop(&ov5647->sd, sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov5647->mode->crop;
 	}
@@ -918,7 +919,7 @@ static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
 };
 
 static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index > 0)
@@ -930,7 +931,7 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	const struct v4l2_mbus_framefmt *fmt;
@@ -949,7 +950,7 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -959,7 +960,8 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&sensor->lock);
 	switch (format->which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		sensor_format = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		sensor_format = v4l2_subdev_get_try_format(sd, sd_state,
+							   format->pad);
 		break;
 	default:
 		sensor_format = &sensor->mode->format;
@@ -973,7 +975,7 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -987,7 +989,7 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	/* Update the sensor mode and apply at it at streamon time. */
 	mutex_lock(&sensor->lock);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, cfg, format->pad) = mode->format;
+		*v4l2_subdev_get_try_format(sd, sd_state, format->pad) = mode->format;
 	} else {
 		int exposure_max, exposure_def;
 		int hblank, vblank;
@@ -1020,7 +1022,7 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5647_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	switch (sel->target) {
@@ -1028,7 +1030,7 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
 		struct ov5647 *sensor = to_sensor(sd);
 
 		mutex_lock(&sensor->lock);
-		sel->r = *__ov5647_get_pad_crop(sensor, cfg, sel->pad,
+		sel->r = *__ov5647_get_pad_crop(sensor, sd_state, sel->pad,
 						sel->which);
 		mutex_unlock(&sensor->lock);
 
@@ -1104,8 +1106,8 @@ static int ov5647_detect(struct v4l2_subdev *sd)
 static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *format =
-				v4l2_subdev_get_try_format(sd, fh->pad, 0);
-	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
+				v4l2_subdev_get_try_format(sd, fh->state, 0);
+	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, fh->state, 0);
 
 	crop->left = OV5647_PIXEL_ARRAY_LEFT;
 	crop->top = OV5647_PIXEL_ARRAY_TOP;
diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 07e64ff0be3f..947d437ed0ef 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2188,7 +2188,7 @@ static const struct v4l2_subdev_video_ops ov5648_subdev_video_ops = {
 /* Subdev Pad Operations */
 
 static int ov5648_enum_mbus_code(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *config,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code_enum)
 {
 	if (code_enum->index >= ARRAY_SIZE(ov5648_mbus_codes))
@@ -2217,7 +2217,7 @@ static void ov5648_mbus_format_fill(struct v4l2_mbus_framefmt *mbus_format,
 }
 
 static int ov5648_get_fmt(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *config,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov5648_sensor *sensor = ov5648_subdev_sensor(subdev);
@@ -2226,7 +2226,7 @@ static int ov5648_get_fmt(struct v4l2_subdev *subdev,
 	mutex_lock(&sensor->mutex);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_get_try_format(subdev, config,
+		*mbus_format = *v4l2_subdev_get_try_format(subdev, sd_state,
 							   format->pad);
 	else
 		ov5648_mbus_format_fill(mbus_format, sensor->state.mbus_code,
@@ -2238,7 +2238,7 @@ static int ov5648_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int ov5648_set_fmt(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *config,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov5648_sensor *sensor = ov5648_subdev_sensor(subdev);
@@ -2279,7 +2279,7 @@ static int ov5648_set_fmt(struct v4l2_subdev *subdev,
 	ov5648_mbus_format_fill(mbus_format, mbus_code, mode);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_get_try_format(subdev, config, format->pad) =
+		*v4l2_subdev_get_try_format(subdev, sd_state, format->pad) =
 			*mbus_format;
 	else if (sensor->state.mode != mode ||
 		 sensor->state.mbus_code != mbus_code)
@@ -2292,7 +2292,7 @@ static int ov5648_set_fmt(struct v4l2_subdev *subdev,
 }
 
 static int ov5648_enum_frame_size(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *config,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *size_enum)
 {
 	const struct ov5648_mode *mode;
@@ -2309,7 +2309,7 @@ static int ov5648_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int ov5648_enum_frame_interval(struct v4l2_subdev *subdev,
-				      struct v4l2_subdev_pad_config *config,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_interval_enum *interval_enum)
 {
 	const struct ov5648_mode *mode = NULL;
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 182f271f118f..49189926afd6 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -1937,7 +1937,7 @@ static int ov5670_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct ov5670 *ov5670 = to_ov5670(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
-				v4l2_subdev_get_try_format(sd, fh->pad, 0);
+				v4l2_subdev_get_try_format(sd, fh->state, 0);
 
 	mutex_lock(&ov5670->mutex);
 
@@ -2153,7 +2153,7 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
 }
 
 static int ov5670_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	/* Only one bayer order GRBG is supported */
@@ -2166,7 +2166,7 @@ static int ov5670_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov5670_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= ARRAY_SIZE(supported_modes))
@@ -2193,11 +2193,12 @@ static void ov5670_update_pad_format(const struct ov5670_mode *mode,
 }
 
 static int ov5670_do_get_pad_format(struct ov5670 *ov5670,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&ov5670->sd, cfg,
+		fmt->format = *v4l2_subdev_get_try_format(&ov5670->sd,
+							  sd_state,
 							  fmt->pad);
 	else
 		ov5670_update_pad_format(ov5670->cur_mode, fmt);
@@ -2206,21 +2207,21 @@ static int ov5670_do_get_pad_format(struct ov5670 *ov5670,
 }
 
 static int ov5670_get_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct ov5670 *ov5670 = to_ov5670(sd);
 	int ret;
 
 	mutex_lock(&ov5670->mutex);
-	ret = ov5670_do_get_pad_format(ov5670, cfg, fmt);
+	ret = ov5670_do_get_pad_format(ov5670, sd_state, fmt);
 	mutex_unlock(&ov5670->mutex);
 
 	return ret;
 }
 
 static int ov5670_set_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct ov5670 *ov5670 = to_ov5670(sd);
@@ -2238,7 +2239,7 @@ static int ov5670_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	ov5670_update_pad_format(mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
+		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
 	} else {
 		ov5670->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(ov5670->link_freq, mode->link_freq_index);
diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index e7e297a23960..da5850b7ad07 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -923,7 +923,7 @@ static int __maybe_unused ov5675_resume(struct device *dev)
 }
 
 static int ov5675_set_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct ov5675 *ov5675 = to_ov5675(sd);
@@ -938,7 +938,7 @@ static int ov5675_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&ov5675->mutex);
 	ov5675_update_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
+		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
 	} else {
 		ov5675->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(ov5675->link_freq, mode->link_freq_index);
@@ -964,14 +964,15 @@ static int ov5675_set_format(struct v4l2_subdev *sd,
 }
 
 static int ov5675_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct ov5675 *ov5675 = to_ov5675(sd);
 
 	mutex_lock(&ov5675->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&ov5675->sd, cfg,
+		fmt->format = *v4l2_subdev_get_try_format(&ov5675->sd,
+							  sd_state,
 							  fmt->pad);
 	else
 		ov5675_update_pad_format(ov5675->cur_mode, &fmt->format);
@@ -982,7 +983,7 @@ static int ov5675_get_format(struct v4l2_subdev *sd,
 }
 
 static int ov5675_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index > 0)
@@ -994,7 +995,7 @@ static int ov5675_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov5675_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= ARRAY_SIZE(supported_modes))
@@ -1017,7 +1018,7 @@ static int ov5675_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&ov5675->mutex);
 	ov5675_update_pad_format(&supported_modes[0],
-				 v4l2_subdev_get_try_format(sd, fh->pad, 0));
+				 v4l2_subdev_get_try_format(sd, fh->state, 0));
 	mutex_unlock(&ov5675->mutex);
 
 	return 0;
diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 469d941813c6..439385938a51 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -806,7 +806,7 @@ ov5695_find_best_fit(struct v4l2_subdev_format *fmt)
 }
 
 static int ov5695_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct ov5695 *ov5695 = to_ov5695(sd);
@@ -822,7 +822,7 @@ static int ov5695_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.field = V4L2_FIELD_NONE;
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
+		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
 #endif
 	} else {
 		ov5695->cur_mode = mode;
@@ -841,7 +841,7 @@ static int ov5695_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5695_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct ov5695 *ov5695 = to_ov5695(sd);
@@ -850,7 +850,8 @@ static int ov5695_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&ov5695->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state,
+							  fmt->pad);
 #else
 		mutex_unlock(&ov5695->mutex);
 		return -EINVAL;
@@ -867,7 +868,7 @@ static int ov5695_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5695_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index != 0)
@@ -878,7 +879,7 @@ static int ov5695_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov5695_enum_frame_sizes(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= ARRAY_SIZE(supported_modes))
@@ -1052,7 +1053,7 @@ static int ov5695_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct ov5695 *ov5695 = to_ov5695(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
-				v4l2_subdev_get_try_format(sd, fh->pad, 0);
+				v4l2_subdev_get_try_format(sd, fh->state, 0);
 	const struct ov5695_mode *def_mode = &supported_modes[0];
 
 	mutex_lock(&ov5695->mutex);
diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 85dd13694bd2..f67412150b16 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -467,7 +467,7 @@ static int ov6650_s_power(struct v4l2_subdev *sd, int on)
 }
 
 static int ov6650_get_selection(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -492,7 +492,7 @@ static int ov6650_get_selection(struct v4l2_subdev *sd,
 }
 
 static int ov6650_set_selection(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -535,7 +535,7 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
 }
 
 static int ov6650_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -550,9 +550,9 @@ static int ov6650_get_fmt(struct v4l2_subdev *sd,
 
 	/* update media bus format code and frame size */
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf->width = cfg->try_fmt.width;
-		mf->height = cfg->try_fmt.height;
-		mf->code = cfg->try_fmt.code;
+		mf->width = sd_state->pads->try_fmt.width;
+		mf->height = sd_state->pads->try_fmt.height;
+		mf->code = sd_state->pads->try_fmt.code;
 
 	} else {
 		mf->width = priv->rect.width >> priv->half_scale;
@@ -668,7 +668,7 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 }
 
 static int ov6650_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -701,15 +701,15 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		/* store media bus format code and frame size in pad config */
-		cfg->try_fmt.width = mf->width;
-		cfg->try_fmt.height = mf->height;
-		cfg->try_fmt.code = mf->code;
+		sd_state->pads->try_fmt.width = mf->width;
+		sd_state->pads->try_fmt.height = mf->height;
+		sd_state->pads->try_fmt.code = mf->code;
 
 		/* return default mbus frame format updated with pad config */
 		*mf = ov6650_def_fmt;
-		mf->width = cfg->try_fmt.width;
-		mf->height = cfg->try_fmt.height;
-		mf->code = cfg->try_fmt.code;
+		mf->width = sd_state->pads->try_fmt.width;
+		mf->height = sd_state->pads->try_fmt.height;
+		mf->code = sd_state->pads->try_fmt.code;
 
 	} else {
 		/* apply new media bus format code and frame size */
@@ -728,7 +728,7 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov6650_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= ARRAY_SIZE(ov6650_codes))
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 0c10203f822b..ebb299f207e5 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -898,7 +898,7 @@ static const struct v4l2_ctrl_ops ov7251_ctrl_ops = {
 };
 
 static int ov7251_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index > 0)
@@ -910,7 +910,7 @@ static int ov7251_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov7251_enum_frame_size(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->code != MEDIA_BUS_FMT_Y10_1X10)
@@ -928,7 +928,7 @@ static int ov7251_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int ov7251_enum_frame_ival(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_interval_enum *fie)
 {
 	unsigned int index = fie->index;
@@ -950,13 +950,13 @@ static int ov7251_enum_frame_ival(struct v4l2_subdev *subdev,
 
 static struct v4l2_mbus_framefmt *
 __ov7251_get_pad_format(struct ov7251 *ov7251,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			unsigned int pad,
 			enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&ov7251->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&ov7251->sd, sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov7251->fmt;
 	default:
@@ -965,13 +965,14 @@ __ov7251_get_pad_format(struct ov7251 *ov7251,
 }
 
 static int ov7251_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
 	struct ov7251 *ov7251 = to_ov7251(sd);
 
 	mutex_lock(&ov7251->lock);
-	format->format = *__ov7251_get_pad_format(ov7251, cfg, format->pad,
+	format->format = *__ov7251_get_pad_format(ov7251, sd_state,
+						  format->pad,
 						  format->which);
 	mutex_unlock(&ov7251->lock);
 
@@ -979,12 +980,13 @@ static int ov7251_get_format(struct v4l2_subdev *sd,
 }
 
 static struct v4l2_rect *
-__ov7251_get_pad_crop(struct ov7251 *ov7251, struct v4l2_subdev_pad_config *cfg,
+__ov7251_get_pad_crop(struct ov7251 *ov7251,
+		      struct v4l2_subdev_state *sd_state,
 		      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&ov7251->sd, cfg, pad);
+		return v4l2_subdev_get_try_crop(&ov7251->sd, sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov7251->crop;
 	default:
@@ -1027,7 +1029,7 @@ ov7251_find_mode_by_ival(struct ov7251 *ov7251, struct v4l2_fract *timeperframe)
 }
 
 static int ov7251_set_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
 	struct ov7251 *ov7251 = to_ov7251(sd);
@@ -1038,7 +1040,8 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&ov7251->lock);
 
-	__crop = __ov7251_get_pad_crop(ov7251, cfg, format->pad, format->which);
+	__crop = __ov7251_get_pad_crop(ov7251, sd_state, format->pad,
+				       format->which);
 
 	new_mode = v4l2_find_nearest_size(ov7251_mode_info_data,
 				ARRAY_SIZE(ov7251_mode_info_data),
@@ -1077,7 +1080,7 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 		ov7251->current_mode = new_mode;
 	}
 
-	__format = __ov7251_get_pad_format(ov7251, cfg, format->pad,
+	__format = __ov7251_get_pad_format(ov7251, sd_state, format->pad,
 					   format->which);
 	__format->width = __crop->width;
 	__format->height = __crop->height;
@@ -1098,24 +1101,24 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 }
 
 static int ov7251_entity_init_cfg(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg)
+				  struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = {
-		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
-			     : V4L2_SUBDEV_FORMAT_ACTIVE,
+		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
+		: V4L2_SUBDEV_FORMAT_ACTIVE,
 		.format = {
 			.width = 640,
 			.height = 480
 		}
 	};
 
-	ov7251_set_format(subdev, cfg, &fmt);
+	ov7251_set_format(subdev, sd_state, &fmt);
 
 	return 0;
 }
 
 static int ov7251_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	struct ov7251 *ov7251 = to_ov7251(sd);
@@ -1124,7 +1127,7 @@ static int ov7251_get_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	mutex_lock(&ov7251->lock);
-	sel->r = *__ov7251_get_pad_crop(ov7251, cfg, sel->pad,
+	sel->r = *__ov7251_get_pad_crop(ov7251, sd_state, sel->pad,
 					sel->which);
 	mutex_unlock(&ov7251->lock);
 
diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index d2df811b1a40..196746423116 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -960,7 +960,7 @@ static int ov7670_set_hw(struct v4l2_subdev *sd, int hstart, int hstop,
 
 
 static int ov7670_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= N_OV7670_FMTS)
@@ -1105,7 +1105,7 @@ static int ov7670_apply_fmt(struct v4l2_subdev *sd)
  * Set a format.
  */
 static int ov7670_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct ov7670_info *info = to_state(sd);
@@ -1122,7 +1122,8 @@ static int ov7670_set_fmt(struct v4l2_subdev *sd,
 		if (ret)
 			return ret;
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-		mbus_fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+						      format->pad);
 		*mbus_fmt = format->format;
 #endif
 		return 0;
@@ -1144,7 +1145,7 @@ static int ov7670_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov7670_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov7670_info *info = to_state(sd);
@@ -1154,7 +1155,7 @@ static int ov7670_get_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-		mbus_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		format->format = *mbus_fmt;
 		return 0;
 #else
@@ -1202,7 +1203,7 @@ static int ov7670_s_frame_interval(struct v4l2_subdev *sd,
 static int ov7670_frame_rates[] = { 30, 15, 10, 5, 1 };
 
 static int ov7670_enum_frame_interval(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct ov7670_info *info = to_state(sd);
@@ -1241,7 +1242,7 @@ static int ov7670_enum_frame_interval(struct v4l2_subdev *sd,
  * Frame size enumeration
  */
 static int ov7670_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct ov7670_info *info = to_state(sd);
@@ -1724,7 +1725,7 @@ static void ov7670_get_default_format(struct v4l2_subdev *sd,
 static int ov7670_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *format =
-				v4l2_subdev_get_try_format(sd, fh->pad, 0);
+				v4l2_subdev_get_try_format(sd, fh->state, 0);
 
 	ov7670_get_default_format(sd, format);
 
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index d94cf2d39c2a..78602a2f70b0 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1157,7 +1157,7 @@ static int ov772x_set_params(struct ov772x_priv *priv,
 }
 
 static int ov772x_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	struct ov772x_priv *priv = to_ov772x(sd);
@@ -1179,7 +1179,7 @@ static int ov772x_get_selection(struct v4l2_subdev *sd,
 }
 
 static int ov772x_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -1198,7 +1198,7 @@ static int ov772x_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov772x_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov772x_priv *priv = to_ov772x(sd);
@@ -1222,7 +1222,7 @@ static int ov772x_set_fmt(struct v4l2_subdev *sd,
 	mf->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *mf;
+		sd_state->pads->try_fmt = *mf;
 		return 0;
 	}
 
@@ -1320,7 +1320,7 @@ static const struct v4l2_subdev_core_ops ov772x_subdev_core_ops = {
 };
 
 static int ov772x_enum_frame_interval(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_interval_enum *fie)
 {
 	if (fie->pad || fie->index >= ARRAY_SIZE(ov772x_frame_intervals))
@@ -1338,7 +1338,7 @@ static int ov772x_enum_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int ov772x_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= ARRAY_SIZE(ov772x_cfmts))
diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index e0ff6506a543..2539cfee85c8 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -707,7 +707,7 @@ static const struct ov7740_pixfmt ov7740_formats[] = {
 #define N_OV7740_FMTS ARRAY_SIZE(ov7740_formats)
 
 static int ov7740_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= N_OV7740_FMTS)
@@ -719,7 +719,7 @@ static int ov7740_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov7740_enum_frame_interval(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_interval_enum *fie)
 {
 	if (fie->pad)
@@ -738,7 +738,7 @@ static int ov7740_enum_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int ov7740_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->pad)
@@ -801,7 +801,7 @@ static int ov7740_try_fmt_internal(struct v4l2_subdev *sd,
 }
 
 static int ov7740_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
@@ -823,7 +823,8 @@ static int ov7740_set_fmt(struct v4l2_subdev *sd,
 		if (ret)
 			goto error;
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-		mbus_fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+						      format->pad);
 		*mbus_fmt = format->format;
 #endif
 		mutex_unlock(&ov7740->mutex);
@@ -846,7 +847,7 @@ static int ov7740_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov7740_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
@@ -858,7 +859,7 @@ static int ov7740_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&ov7740->mutex);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-		mbus_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		format->format = *mbus_fmt;
 		ret = 0;
 #else
@@ -903,7 +904,7 @@ static int ov7740_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
 	struct v4l2_mbus_framefmt *format =
-				v4l2_subdev_get_try_format(sd, fh->pad, 0);
+				v4l2_subdev_get_try_format(sd, fh->state, 0);
 
 	mutex_lock(&ov7740->mutex);
 	ov7740_get_default_format(sd, format);
diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index a6bc665a6430..88e19f30d376 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2083,7 +2083,7 @@ static int __maybe_unused ov8856_resume(struct device *dev)
 }
 
 static int ov8856_set_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct ov8856 *ov8856 = to_ov8856(sd);
@@ -2098,7 +2098,7 @@ static int ov8856_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&ov8856->mutex);
 	ov8856_update_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
+		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
 	} else {
 		ov8856->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(ov8856->link_freq, mode->link_freq_index);
@@ -2129,14 +2129,15 @@ static int ov8856_set_format(struct v4l2_subdev *sd,
 }
 
 static int ov8856_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct ov8856 *ov8856 = to_ov8856(sd);
 
 	mutex_lock(&ov8856->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&ov8856->sd, cfg,
+		fmt->format = *v4l2_subdev_get_try_format(&ov8856->sd,
+							  sd_state,
 							  fmt->pad);
 	else
 		ov8856_update_pad_format(ov8856->cur_mode, &fmt->format);
@@ -2147,7 +2148,7 @@ static int ov8856_get_format(struct v4l2_subdev *sd,
 }
 
 static int ov8856_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	/* Only one bayer order GRBG is supported */
@@ -2160,7 +2161,7 @@ static int ov8856_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov8856_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct ov8856 *ov8856 = to_ov8856(sd);
@@ -2185,7 +2186,7 @@ static int ov8856_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&ov8856->mutex);
 	ov8856_update_pad_format(&ov8856->priv_lane->supported_modes[0],
-				 v4l2_subdev_get_try_format(sd, fh->pad, 0));
+				 v4l2_subdev_get_try_format(sd, fh->state, 0));
 	mutex_unlock(&ov8856->mutex);
 
 	return 0;
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index b16c82559800..ce50f3ea87b8 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2542,7 +2542,7 @@ static const struct v4l2_subdev_video_ops ov8865_subdev_video_ops = {
 /* Subdev Pad Operations */
 
 static int ov8865_enum_mbus_code(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *config,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code_enum)
 {
 	if (code_enum->index >= ARRAY_SIZE(ov8865_mbus_codes))
@@ -2571,7 +2571,7 @@ static void ov8865_mbus_format_fill(struct v4l2_mbus_framefmt *mbus_format,
 }
 
 static int ov8865_get_fmt(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *config,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov8865_sensor *sensor = ov8865_subdev_sensor(subdev);
@@ -2580,7 +2580,7 @@ static int ov8865_get_fmt(struct v4l2_subdev *subdev,
 	mutex_lock(&sensor->mutex);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_get_try_format(subdev, config,
+		*mbus_format = *v4l2_subdev_get_try_format(subdev, sd_state,
 							   format->pad);
 	else
 		ov8865_mbus_format_fill(mbus_format, sensor->state.mbus_code,
@@ -2592,7 +2592,7 @@ static int ov8865_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int ov8865_set_fmt(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *config,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct ov8865_sensor *sensor = ov8865_subdev_sensor(subdev);
@@ -2633,7 +2633,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	ov8865_mbus_format_fill(mbus_format, mbus_code, mode);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_get_try_format(subdev, config, format->pad) =
+		*v4l2_subdev_get_try_format(subdev, sd_state, format->pad) =
 			*mbus_format;
 	else if (sensor->state.mode != mode ||
 		 sensor->state.mbus_code != mbus_code)
@@ -2646,7 +2646,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 }
 
 static int ov8865_enum_frame_size(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *config,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *size_enum)
 {
 	const struct ov8865_mode *mode;
@@ -2663,7 +2663,7 @@ static int ov8865_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static int ov8865_enum_frame_interval(struct v4l2_subdev *subdev,
-				      struct v4l2_subdev_pad_config *config,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_interval_enum *interval_enum)
 {
 	const struct ov8865_mode *mode = NULL;
diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index d36b04c49628..0bab8c2cf160 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -519,7 +519,7 @@ static int ov9640_s_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov9640_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -547,13 +547,13 @@ static int ov9640_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return ov9640_s_fmt(sd, mf);
 
-	cfg->try_fmt = *mf;
+	sd_state->pads->try_fmt = *mf;
 
 	return 0;
 }
 
 static int ov9640_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= ARRAY_SIZE(ov9640_codes))
@@ -565,7 +565,7 @@ static int ov9640_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov9640_get_selection(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_selection *sel)
 {
 	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index a9f13dc2f053..c313e11a9754 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1070,7 +1070,7 @@ static void ov965x_get_default_format(struct v4l2_mbus_framefmt *mf)
 }
 
 static int ov965x_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(ov965x_formats))
@@ -1081,7 +1081,7 @@ static int ov965x_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov965x_enum_frame_sizes(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	int i = ARRAY_SIZE(ov965x_formats);
@@ -1167,14 +1167,14 @@ static int ov965x_s_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int ov965x_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct ov965x *ov965x = to_ov965x(sd);
 	struct v4l2_mbus_framefmt *mf;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		fmt->format = *mf;
 		return 0;
 	}
@@ -1212,7 +1212,7 @@ static void __ov965x_try_frame_size(struct v4l2_mbus_framefmt *mf,
 }
 
 static int ov965x_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	unsigned int index = ARRAY_SIZE(ov965x_formats);
@@ -1234,8 +1234,9 @@ static int ov965x_set_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&ov965x->lock);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		if (cfg) {
-			mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		if (sd_state) {
+			mf = v4l2_subdev_get_try_format(sd, sd_state,
+							fmt->pad);
 			*mf = fmt->format;
 		}
 	} else {
@@ -1364,7 +1365,7 @@ static int ov965x_s_stream(struct v4l2_subdev *sd, int on)
 static int ov965x_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *mf =
-		v4l2_subdev_get_try_format(sd, fh->pad, 0);
+		v4l2_subdev_get_try_format(sd, fh->state, 0);
 
 	ov965x_get_default_format(mf);
 	return 0;
diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index ba156683c533..af50c66cf5ce 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -705,7 +705,7 @@ static int __maybe_unused ov9734_resume(struct device *dev)
 }
 
 static int ov9734_set_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct ov9734 *ov9734 = to_ov9734(sd);
@@ -720,7 +720,7 @@ static int ov9734_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&ov9734->mutex);
 	ov9734_update_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
+		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
 	} else {
 		ov9734->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(ov9734->link_freq, mode->link_freq_index);
@@ -746,14 +746,15 @@ static int ov9734_set_format(struct v4l2_subdev *sd,
 }
 
 static int ov9734_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct ov9734 *ov9734 = to_ov9734(sd);
 
 	mutex_lock(&ov9734->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&ov9734->sd, cfg,
+		fmt->format = *v4l2_subdev_get_try_format(&ov9734->sd,
+							  sd_state,
 							  fmt->pad);
 	else
 		ov9734_update_pad_format(ov9734->cur_mode, &fmt->format);
@@ -764,7 +765,7 @@ static int ov9734_get_format(struct v4l2_subdev *sd,
 }
 
 static int ov9734_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index > 0)
@@ -776,7 +777,7 @@ static int ov9734_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov9734_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= ARRAY_SIZE(supported_modes))
@@ -799,7 +800,7 @@ static int ov9734_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&ov9734->mutex);
 	ov9734_update_pad_format(&supported_modes[0],
-				 v4l2_subdev_get_try_format(sd, fh->pad, 0));
+				 v4l2_subdev_get_try_format(sd, fh->state, 0));
 	mutex_unlock(&ov9734->mutex);
 
 	return 0;
diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 90eb73f0e6e9..a4b639cf8063 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -403,7 +403,7 @@ static int rdacm20_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index > 0)
@@ -415,7 +415,7 @@ static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int rdacm20_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 179d107f494c..5b78d8185773 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -281,7 +281,7 @@ static int rdacm21_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int rdacm21_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index > 0)
@@ -293,7 +293,7 @@ static int rdacm21_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int rdacm21_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index 4cc51e001874..2e4018c26912 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -488,7 +488,7 @@ static int reg_write_multiple(struct i2c_client *client,
 }
 
 static int rj54n1_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= ARRAY_SIZE(rj54n1_colour_fmts))
@@ -541,7 +541,7 @@ static int rj54n1_sensor_scale(struct v4l2_subdev *sd, s32 *in_w, s32 *in_h,
 			       s32 *out_w, s32 *out_h);
 
 static int rj54n1_set_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -578,7 +578,7 @@ static int rj54n1_set_selection(struct v4l2_subdev *sd,
 }
 
 static int rj54n1_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -603,7 +603,7 @@ static int rj54n1_get_selection(struct v4l2_subdev *sd,
 }
 
 static int rj54n1_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -973,7 +973,7 @@ static int rj54n1_reg_init(struct i2c_client *client)
 }
 
 static int rj54n1_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -1009,7 +1009,7 @@ static int rj54n1_set_fmt(struct v4l2_subdev *sd,
 			      &mf->height, 84, RJ54N1_MAX_HEIGHT, align, 0);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *mf;
+		sd_state->pads->try_fmt = *mf;
 		return 0;
 	}
 
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index 71804a70bc6d..e2b88c5e4f98 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -817,7 +817,7 @@ static const struct s5c73m3_frame_size *s5c73m3_find_frame_size(
 }
 
 static void s5c73m3_oif_try_format(struct s5c73m3 *state,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt,
 				   const struct s5c73m3_frame_size **fs)
 {
@@ -844,8 +844,8 @@ static void s5c73m3_oif_try_format(struct s5c73m3 *state,
 			*fs = state->oif_pix_size[RES_ISP];
 		else
 			*fs = s5c73m3_find_frame_size(
-						v4l2_subdev_get_try_format(sd, cfg,
-							OIF_ISP_PAD),
+						v4l2_subdev_get_try_format(sd, sd_state,
+									   OIF_ISP_PAD),
 						RES_ISP);
 		break;
 	}
@@ -854,7 +854,7 @@ static void s5c73m3_oif_try_format(struct s5c73m3 *state,
 }
 
 static void s5c73m3_try_format(struct s5c73m3 *state,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt,
 			      const struct s5c73m3_frame_size **fs)
 {
@@ -946,7 +946,7 @@ static int s5c73m3_oif_s_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int s5c73m3_oif_enum_frame_interval(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct s5c73m3 *state = oif_sd_to_s5c73m3(sd);
@@ -984,7 +984,7 @@ static int s5c73m3_oif_get_pad_code(int pad, int index)
 }
 
 static int s5c73m3_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct s5c73m3 *state = sensor_sd_to_s5c73m3(sd);
@@ -992,7 +992,8 @@ static int s5c73m3_get_fmt(struct v4l2_subdev *sd,
 	u32 code;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state,
+							  fmt->pad);
 		return 0;
 	}
 
@@ -1018,7 +1019,7 @@ static int s5c73m3_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5c73m3_oif_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct s5c73m3 *state = oif_sd_to_s5c73m3(sd);
@@ -1026,7 +1027,8 @@ static int s5c73m3_oif_get_fmt(struct v4l2_subdev *sd,
 	u32 code;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state,
+							  fmt->pad);
 		return 0;
 	}
 
@@ -1056,7 +1058,7 @@ static int s5c73m3_oif_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5c73m3_set_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	const struct s5c73m3_frame_size *frame_size = NULL;
@@ -1066,10 +1068,10 @@ static int s5c73m3_set_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&state->lock);
 
-	s5c73m3_try_format(state, cfg, fmt, &frame_size);
+	s5c73m3_try_format(state, sd_state, fmt, &frame_size);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*mf = fmt->format;
 	} else {
 		switch (fmt->pad) {
@@ -1095,7 +1097,7 @@ static int s5c73m3_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5c73m3_oif_set_fmt(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_state *sd_state,
 			 struct v4l2_subdev_format *fmt)
 {
 	const struct s5c73m3_frame_size *frame_size = NULL;
@@ -1105,13 +1107,14 @@ static int s5c73m3_oif_set_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&state->lock);
 
-	s5c73m3_oif_try_format(state, cfg, fmt, &frame_size);
+	s5c73m3_oif_try_format(state, sd_state, fmt, &frame_size);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*mf = fmt->format;
 		if (fmt->pad == OIF_ISP_PAD) {
-			mf = v4l2_subdev_get_try_format(sd, cfg, OIF_SOURCE_PAD);
+			mf = v4l2_subdev_get_try_format(sd, sd_state,
+							OIF_SOURCE_PAD);
 			mf->width = fmt->format.width;
 			mf->height = fmt->format.height;
 		}
@@ -1183,7 +1186,7 @@ static int s5c73m3_oif_set_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 }
 
 static int s5c73m3_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	static const int codes[] = {
@@ -1199,7 +1202,7 @@ static int s5c73m3_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int s5c73m3_oif_enum_mbus_code(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
 	int ret;
@@ -1214,7 +1217,7 @@ static int s5c73m3_oif_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int s5c73m3_enum_frame_size(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	int idx;
@@ -1241,7 +1244,7 @@ static int s5c73m3_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int s5c73m3_oif_enum_frame_size(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct s5c73m3 *state = oif_sd_to_s5c73m3(sd);
@@ -1259,7 +1262,7 @@ static int s5c73m3_oif_enum_frame_size(struct v4l2_subdev *sd,
 			if (fse->which == V4L2_SUBDEV_FORMAT_TRY) {
 				struct v4l2_mbus_framefmt *mf;
 
-				mf = v4l2_subdev_get_try_format(sd, cfg,
+				mf = v4l2_subdev_get_try_format(sd, sd_state,
 								OIF_ISP_PAD);
 
 				w = mf->width;
@@ -1315,11 +1318,11 @@ static int s5c73m3_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = v4l2_subdev_get_try_format(sd, fh->pad, S5C73M3_ISP_PAD);
+	mf = v4l2_subdev_get_try_format(sd, fh->state, S5C73M3_ISP_PAD);
 	s5c73m3_fill_mbus_fmt(mf, &s5c73m3_isp_resolutions[1],
 						S5C73M3_ISP_FMT);
 
-	mf = v4l2_subdev_get_try_format(sd, fh->pad, S5C73M3_JPEG_PAD);
+	mf = v4l2_subdev_get_try_format(sd, fh->state, S5C73M3_JPEG_PAD);
 	s5c73m3_fill_mbus_fmt(mf, &s5c73m3_jpeg_resolutions[1],
 					S5C73M3_JPEG_FMT);
 
@@ -1330,15 +1333,15 @@ static int s5c73m3_oif_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = v4l2_subdev_get_try_format(sd, fh->pad, OIF_ISP_PAD);
+	mf = v4l2_subdev_get_try_format(sd, fh->state, OIF_ISP_PAD);
 	s5c73m3_fill_mbus_fmt(mf, &s5c73m3_isp_resolutions[1],
 						S5C73M3_ISP_FMT);
 
-	mf = v4l2_subdev_get_try_format(sd, fh->pad, OIF_JPEG_PAD);
+	mf = v4l2_subdev_get_try_format(sd, fh->state, OIF_JPEG_PAD);
 	s5c73m3_fill_mbus_fmt(mf, &s5c73m3_jpeg_resolutions[1],
 					S5C73M3_JPEG_FMT);
 
-	mf = v4l2_subdev_get_try_format(sd, fh->pad, OIF_SOURCE_PAD);
+	mf = v4l2_subdev_get_try_format(sd, fh->state, OIF_SOURCE_PAD);
 	s5c73m3_fill_mbus_fmt(mf, &s5c73m3_isp_resolutions[1],
 						S5C73M3_ISP_FMT);
 	return 0;
diff --git a/drivers/media/i2c/s5k4ecgx.c b/drivers/media/i2c/s5k4ecgx.c
index 4e97309a67f4..af9a305242cd 100644
--- a/drivers/media/i2c/s5k4ecgx.c
+++ b/drivers/media/i2c/s5k4ecgx.c
@@ -525,7 +525,7 @@ static int s5k4ecgx_try_frame_size(struct v4l2_mbus_framefmt *mf,
 }
 
 static int s5k4ecgx_enum_mbus_code(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(s5k4ecgx_formats))
@@ -535,15 +535,16 @@ static int s5k4ecgx_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int s5k4ecgx_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
-			   struct v4l2_subdev_format *fmt)
+static int s5k4ecgx_get_fmt(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *sd_state,
+			    struct v4l2_subdev_format *fmt)
 {
 	struct s5k4ecgx *priv = to_s5k4ecgx(sd);
 	struct v4l2_mbus_framefmt *mf;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		if (cfg) {
-			mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+		if (sd_state) {
+			mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 			fmt->format = *mf;
 		}
 		return 0;
@@ -575,7 +576,8 @@ static const struct s5k4ecgx_pixfmt *s5k4ecgx_try_fmt(struct v4l2_subdev *sd,
 	return &s5k4ecgx_formats[i];
 }
 
-static int s5k4ecgx_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int s5k4ecgx_set_fmt(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct s5k4ecgx *priv = to_s5k4ecgx(sd);
@@ -590,8 +592,8 @@ static int s5k4ecgx_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_confi
 	fmt->format.field = V4L2_FIELD_NONE;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		if (cfg) {
-			mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+		if (sd_state) {
+			mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 			*mf = fmt->format;
 		}
 		return 0;
@@ -686,7 +688,9 @@ static int s5k4ecgx_registered(struct v4l2_subdev *sd)
  */
 static int s5k4ecgx_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	struct v4l2_mbus_framefmt *mf = v4l2_subdev_get_try_format(sd, fh->pad, 0);
+	struct v4l2_mbus_framefmt *mf = v4l2_subdev_get_try_format(sd,
+								   fh->state,
+								   0);
 
 	mf->width = s5k4ecgx_prev_sizes[0].size.width;
 	mf->height = s5k4ecgx_prev_sizes[0].size.height;
diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
index f26c168ef942..b97dd6149e90 100644
--- a/drivers/media/i2c/s5k6a3.c
+++ b/drivers/media/i2c/s5k6a3.c
@@ -99,7 +99,7 @@ static const struct v4l2_mbus_framefmt *find_sensor_format(
 }
 
 static int s5k6a3_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(s5k6a3_formats))
@@ -123,17 +123,18 @@ static void s5k6a3_try_format(struct v4l2_mbus_framefmt *mf)
 }
 
 static struct v4l2_mbus_framefmt *__s5k6a3_get_format(
-		struct s5k6a3 *sensor, struct v4l2_subdev_pad_config *cfg,
+		struct s5k6a3 *sensor, struct v4l2_subdev_state *sd_state,
 		u32 pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return cfg ? v4l2_subdev_get_try_format(&sensor->subdev, cfg, pad) : NULL;
+		return sd_state ? v4l2_subdev_get_try_format(&sensor->subdev,
+							     sd_state, pad) : NULL;
 
 	return &sensor->format;
 }
 
 static int s5k6a3_set_fmt(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
 	struct s5k6a3 *sensor = sd_to_s5k6a3(sd);
@@ -141,7 +142,7 @@ static int s5k6a3_set_fmt(struct v4l2_subdev *sd,
 
 	s5k6a3_try_format(&fmt->format);
 
-	mf = __s5k6a3_get_format(sensor, cfg, fmt->pad, fmt->which);
+	mf = __s5k6a3_get_format(sensor, sd_state, fmt->pad, fmt->which);
 	if (mf) {
 		mutex_lock(&sensor->lock);
 		*mf = fmt->format;
@@ -151,13 +152,13 @@ static int s5k6a3_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int s5k6a3_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct s5k6a3 *sensor = sd_to_s5k6a3(sd);
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = __s5k6a3_get_format(sensor, cfg, fmt->pad, fmt->which);
+	mf = __s5k6a3_get_format(sensor, sd_state, fmt->pad, fmt->which);
 
 	mutex_lock(&sensor->lock);
 	fmt->format = *mf;
@@ -173,7 +174,9 @@ static const struct v4l2_subdev_pad_ops s5k6a3_pad_ops = {
 
 static int s5k6a3_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	struct v4l2_mbus_framefmt *format = v4l2_subdev_get_try_format(sd, fh->pad, 0);
+	struct v4l2_mbus_framefmt *format = v4l2_subdev_get_try_format(sd,
+								       fh->state,
+								       0);
 
 	*format		= s5k6a3_formats[0];
 	format->width	= S5K6A3_DEFAULT_WIDTH;
diff --git a/drivers/media/i2c/s5k6aa.c b/drivers/media/i2c/s5k6aa.c
index e9be7323a22e..105a4b7d8354 100644
--- a/drivers/media/i2c/s5k6aa.c
+++ b/drivers/media/i2c/s5k6aa.c
@@ -997,7 +997,7 @@ static int s5k6aa_s_frame_interval(struct v4l2_subdev *sd,
  * V4L2 subdev pad level and video operations
  */
 static int s5k6aa_enum_frame_interval(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct s5k6aa *s5k6aa = to_s5k6aa(sd);
@@ -1024,7 +1024,7 @@ static int s5k6aa_enum_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int s5k6aa_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(s5k6aa_formats))
@@ -1035,7 +1035,7 @@ static int s5k6aa_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int s5k6aa_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	int i = ARRAY_SIZE(s5k6aa_formats);
@@ -1057,14 +1057,15 @@ static int s5k6aa_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static struct v4l2_rect *
-__s5k6aa_get_crop_rect(struct s5k6aa *s5k6aa, struct v4l2_subdev_pad_config *cfg,
+__s5k6aa_get_crop_rect(struct s5k6aa *s5k6aa,
+		       struct v4l2_subdev_state *sd_state,
 		       enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return &s5k6aa->ccd_rect;
 
 	WARN_ON(which != V4L2_SUBDEV_FORMAT_TRY);
-	return v4l2_subdev_get_try_crop(&s5k6aa->sd, cfg, 0);
+	return v4l2_subdev_get_try_crop(&s5k6aa->sd, sd_state, 0);
 }
 
 static void s5k6aa_try_format(struct s5k6aa *s5k6aa,
@@ -1088,7 +1089,8 @@ static void s5k6aa_try_format(struct s5k6aa *s5k6aa,
 	mf->field	= V4L2_FIELD_NONE;
 }
 
-static int s5k6aa_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int s5k6aa_get_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct s5k6aa *s5k6aa = to_s5k6aa(sd);
@@ -1097,7 +1099,7 @@ static int s5k6aa_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 	memset(fmt->reserved, 0, sizeof(fmt->reserved));
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		fmt->format = *mf;
 		return 0;
 	}
@@ -1109,7 +1111,8 @@ static int s5k6aa_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 	return 0;
 }
 
-static int s5k6aa_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int s5k6aa_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct s5k6aa *s5k6aa = to_s5k6aa(sd);
@@ -1122,8 +1125,8 @@ static int s5k6aa_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 	s5k6aa_try_format(s5k6aa, &fmt->format);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
-		crop = v4l2_subdev_get_try_crop(sd, cfg, 0);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		crop = v4l2_subdev_get_try_crop(sd, sd_state, 0);
 	} else {
 		if (s5k6aa->streaming) {
 			ret = -EBUSY;
@@ -1163,7 +1166,7 @@ static int s5k6aa_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 }
 
 static int s5k6aa_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	struct s5k6aa *s5k6aa = to_s5k6aa(sd);
@@ -1175,7 +1178,7 @@ static int s5k6aa_get_selection(struct v4l2_subdev *sd,
 	memset(sel->reserved, 0, sizeof(sel->reserved));
 
 	mutex_lock(&s5k6aa->lock);
-	rect = __s5k6aa_get_crop_rect(s5k6aa, cfg, sel->which);
+	rect = __s5k6aa_get_crop_rect(s5k6aa, sd_state, sel->which);
 	sel->r = *rect;
 	mutex_unlock(&s5k6aa->lock);
 
@@ -1186,7 +1189,7 @@ static int s5k6aa_get_selection(struct v4l2_subdev *sd,
 }
 
 static int s5k6aa_set_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	struct s5k6aa *s5k6aa = to_s5k6aa(sd);
@@ -1198,13 +1201,13 @@ static int s5k6aa_set_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	mutex_lock(&s5k6aa->lock);
-	crop_r = __s5k6aa_get_crop_rect(s5k6aa, cfg, sel->which);
+	crop_r = __s5k6aa_get_crop_rect(s5k6aa, sd_state, sel->which);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		mf = &s5k6aa->preset->mbus_fmt;
 		s5k6aa->apply_crop = 1;
 	} else {
-		mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 	}
 	v4l_bound_align_image(&sel->r.width, mf->width,
 			      S5K6AA_WIN_WIDTH_MAX, 1,
@@ -1425,8 +1428,10 @@ static int s5k6aa_initialize_ctrls(struct s5k6aa *s5k6aa)
  */
 static int s5k6aa_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	struct v4l2_mbus_framefmt *format = v4l2_subdev_get_try_format(sd, fh->pad, 0);
-	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
+	struct v4l2_mbus_framefmt *format = v4l2_subdev_get_try_format(sd,
+								       fh->state,
+								       0);
+	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, fh->state, 0);
 
 	format->colorspace = s5k6aa_formats[0].colorspace;
 	format->code = s5k6aa_formats[0].code;
diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.c
index 6171ced809bb..a7f043cad149 100644
--- a/drivers/media/i2c/saa6752hs.c
+++ b/drivers/media/i2c/saa6752hs.c
@@ -543,7 +543,7 @@ static int saa6752hs_init(struct v4l2_subdev *sd, u32 leading_null_bytes)
 }
 
 static int saa6752hs_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *f = &format->format;
@@ -563,7 +563,7 @@ static int saa6752hs_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int saa6752hs_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *f = &format->format;
@@ -595,7 +595,7 @@ static int saa6752hs_set_fmt(struct v4l2_subdev *sd,
 	f->colorspace = V4L2_COLORSPACE_SMPTE170M;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *f;
+		sd_state->pads->try_fmt = *f;
 		return 0;
 	}
 
diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index 88dc6baac639..a958bbc2c33d 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1167,7 +1167,7 @@ static int saa711x_s_sliced_fmt(struct v4l2_subdev *sd, struct v4l2_sliced_vbi_f
 }
 
 static int saa711x_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
diff --git a/drivers/media/i2c/saa717x.c b/drivers/media/i2c/saa717x.c
index ba103a6a1875..adf905360171 100644
--- a/drivers/media/i2c/saa717x.c
+++ b/drivers/media/i2c/saa717x.c
@@ -980,7 +980,7 @@ static int saa717x_s_register(struct v4l2_subdev *sd, const struct v4l2_dbg_regi
 #endif
 
 static int saa717x_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
diff --git a/drivers/media/i2c/sr030pc30.c b/drivers/media/i2c/sr030pc30.c
index 46924024faa8..19c0252df2f1 100644
--- a/drivers/media/i2c/sr030pc30.c
+++ b/drivers/media/i2c/sr030pc30.c
@@ -468,7 +468,7 @@ static int sr030pc30_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static int sr030pc30_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (!code || code->pad ||
@@ -480,7 +480,7 @@ static int sr030pc30_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int sr030pc30_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf;
@@ -525,7 +525,7 @@ static const struct sr030pc30_format *try_fmt(struct v4l2_subdev *sd,
 
 /* Return nearest media bus frame format. */
 static int sr030pc30_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct sr030pc30_info *info = sd ? to_sr030pc30(sd) : NULL;
@@ -541,7 +541,7 @@ static int sr030pc30_set_fmt(struct v4l2_subdev *sd,
 
 	fmt = try_fmt(sd, mf);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *mf;
+		sd_state->pads->try_fmt = *mf;
 		return 0;
 	}
 
diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 7f07ef56fbbd..f630b88cbfaa 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -643,7 +643,7 @@ static int mipid02_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int mipid02_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct mipid02_dev *bridge = to_mipid02_dev(sd);
@@ -670,7 +670,7 @@ static int mipid02_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mipid02_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
@@ -687,7 +687,8 @@ static int mipid02_get_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt = v4l2_subdev_get_try_format(&bridge->sd, cfg, format->pad);
+		fmt = v4l2_subdev_get_try_format(&bridge->sd, sd_state,
+						 format->pad);
 	else
 		fmt = &bridge->fmt;
 
@@ -704,7 +705,7 @@ static int mipid02_get_fmt(struct v4l2_subdev *sd,
 }
 
 static void mipid02_set_fmt_source(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *format)
 {
 	struct mipid02_dev *bridge = to_mipid02_dev(sd);
@@ -718,11 +719,11 @@ static void mipid02_set_fmt_source(struct v4l2_subdev *sd,
 	if (format->which != V4L2_SUBDEV_FORMAT_TRY)
 		return;
 
-	*v4l2_subdev_get_try_format(sd, cfg, format->pad) = format->format;
+	*v4l2_subdev_get_try_format(sd, sd_state, format->pad) = format->format;
 }
 
 static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *format)
 {
 	struct mipid02_dev *bridge = to_mipid02_dev(sd);
@@ -731,7 +732,7 @@ static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
 	format->format.code = get_fmt_code(format->format.code);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
 	else
 		fmt = &bridge->fmt;
 
@@ -739,7 +740,7 @@ static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
 }
 
 static int mipid02_set_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct mipid02_dev *bridge = to_mipid02_dev(sd);
@@ -762,9 +763,9 @@ static int mipid02_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	if (format->pad == MIPID02_SOURCE)
-		mipid02_set_fmt_source(sd, cfg, format);
+		mipid02_set_fmt_source(sd, sd_state, format);
 	else
-		mipid02_set_fmt_sink(sd, cfg, format);
+		mipid02_set_fmt_sink(sd, sd_state, format);
 
 error:
 	mutex_unlock(&bridge->lock);
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index f21da11caf22..3205cd8298dd 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1649,7 +1649,7 @@ static int tc358743_s_stream(struct v4l2_subdev *sd, int enable)
 /* --------------- PAD OPS --------------- */
 
 static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	switch (code->index) {
@@ -1666,7 +1666,7 @@ static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int tc358743_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct tc358743_state *state = to_state(sd);
@@ -1702,13 +1702,13 @@ static int tc358743_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int tc358743_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct tc358743_state *state = to_state(sd);
 
 	u32 code = format->format.code; /* is overwritten by get_fmt */
-	int ret = tc358743_get_fmt(sd, cfg, format);
+	int ret = tc358743_get_fmt(sd, sd_state, format);
 
 	format->format.code = code;
 
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 89bb7e6dc7a4..91e6db847bb5 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1718,19 +1718,19 @@ static const struct v4l2_subdev_video_ops tda1997x_video_ops = {
  */
 
 static int tda1997x_init_cfg(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg)
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct tda1997x_state *state = to_state(sd);
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = v4l2_subdev_get_try_format(sd, cfg, 0);
+	mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
 	mf->code = state->mbus_codes[0];
 
 	return 0;
 }
 
 static int tda1997x_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct tda1997x_state *state = to_state(sd);
@@ -1762,7 +1762,7 @@ static void tda1997x_fill_format(struct tda1997x_state *state,
 }
 
 static int tda1997x_get_format(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *format)
 {
 	struct tda1997x_state *state = to_state(sd);
@@ -1775,7 +1775,7 @@ static int tda1997x_get_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
 		format->format.code = fmt->code;
 	} else
 		format->format.code = state->mbus_code;
@@ -1784,7 +1784,7 @@ static int tda1997x_get_format(struct v4l2_subdev *sd,
 }
 
 static int tda1997x_set_format(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *format)
 {
 	struct tda1997x_state *state = to_state(sd);
@@ -1809,7 +1809,7 @@ static int tda1997x_set_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
+		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
 		*fmt = format->format;
 	} else {
 		int ret = tda1997x_setup_format(state, format->format.code);
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index a7fbe5b400c2..cee60f945036 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -853,13 +853,13 @@ static const struct v4l2_ctrl_ops tvp514x_ctrl_ops = {
 /**
  * tvp514x_enum_mbus_code() - V4L2 decoder interface handler for enum_mbus_code
  * @sd: pointer to standard V4L2 sub-device structure
- * @cfg: pad configuration
+ * @sd_state: subdev state
  * @code: pointer to v4l2_subdev_mbus_code_enum structure
  *
  * Enumertaes mbus codes supported
  */
 static int tvp514x_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	u32 pad = code->pad;
@@ -880,13 +880,13 @@ static int tvp514x_enum_mbus_code(struct v4l2_subdev *sd,
 /**
  * tvp514x_get_pad_format() - V4L2 decoder interface handler for get pad format
  * @sd: pointer to standard V4L2 sub-device structure
- * @cfg: pad configuration
+ * @sd_state: subdev state
  * @format: pointer to v4l2_subdev_format structure
  *
  * Retrieves pad format which is active or tried based on requirement
  */
 static int tvp514x_get_pad_format(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *format)
 {
 	struct tvp514x_decoder *decoder = to_decoder(sd);
@@ -912,13 +912,13 @@ static int tvp514x_get_pad_format(struct v4l2_subdev *sd,
 /**
  * tvp514x_set_pad_format() - V4L2 decoder interface handler for set pad format
  * @sd: pointer to standard V4L2 sub-device structure
- * @cfg: pad configuration
+ * @sd_state: subdev state
  * @fmt: pointer to v4l2_subdev_format structure
  *
  * Set pad format for the output pad
  */
 static int tvp514x_set_pad_format(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
 	struct tvp514x_decoder *decoder = to_decoder(sd);
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 374a9da75e4d..30c63552556d 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1027,7 +1027,7 @@ static void tvp5150_set_default(v4l2_std_id std, struct v4l2_rect *crop)
 
 static struct v4l2_rect *
 tvp5150_get_pad_crop(struct tvp5150 *decoder,
-		     struct v4l2_subdev_pad_config *cfg, unsigned int pad,
+		     struct v4l2_subdev_state *sd_state, unsigned int pad,
 		     enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
@@ -1035,7 +1035,7 @@ tvp5150_get_pad_crop(struct tvp5150 *decoder,
 		return &decoder->rect;
 	case V4L2_SUBDEV_FORMAT_TRY:
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-		return v4l2_subdev_get_try_crop(&decoder->sd, cfg, pad);
+		return v4l2_subdev_get_try_crop(&decoder->sd, sd_state, pad);
 #else
 		return ERR_PTR(-EINVAL);
 #endif
@@ -1045,7 +1045,7 @@ tvp5150_get_pad_crop(struct tvp5150 *decoder,
 }
 
 static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *f;
@@ -1104,7 +1104,7 @@ static void tvp5150_set_hw_selection(struct v4l2_subdev *sd,
 }
 
 static int tvp5150_set_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
@@ -1138,7 +1138,7 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
 	    sel->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
-	crop = tvp5150_get_pad_crop(decoder, cfg, sel->pad, sel->which);
+	crop = tvp5150_get_pad_crop(decoder, sd_state, sel->pad, sel->which);
 	if (IS_ERR(crop))
 		return PTR_ERR(crop);
 
@@ -1156,7 +1156,7 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
 }
 
 static int tvp5150_get_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct tvp5150 *decoder = container_of(sd, struct tvp5150, sd);
@@ -1180,7 +1180,7 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
 			sel->r.height = TVP5150_V_MAX_OTHERS;
 		return 0;
 	case V4L2_SEL_TGT_CROP:
-		crop = tvp5150_get_pad_crop(decoder, cfg, sel->pad,
+		crop = tvp5150_get_pad_crop(decoder, sd_state, sel->pad,
 					    sel->which);
 		if (IS_ERR(crop))
 			return PTR_ERR(crop);
@@ -1208,7 +1208,7 @@ static int tvp5150_get_mbus_config(struct v4l2_subdev *sd,
 			V4L2 subdev pad ops
  ****************************************************************************/
 static int tvp5150_init_cfg(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg)
+			    struct v4l2_subdev_state *sd_state)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
 	v4l2_std_id std;
@@ -1229,7 +1229,7 @@ static int tvp5150_init_cfg(struct v4l2_subdev *sd,
 }
 
 static int tvp5150_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index)
@@ -1240,7 +1240,7 @@ static int tvp5150_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int tvp5150_enum_frame_size(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index ada4ec5ef782..2de18833b07b 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -797,7 +797,8 @@ static const struct v4l2_ctrl_ops tvp7002_ctrl_ops = {
  * Enumerate supported digital video formats for pad.
  */
 static int
-tvp7002_enum_mbus_code(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+tvp7002_enum_mbus_code(struct v4l2_subdev *sd,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_mbus_code_enum *code)
 {
 	/* Check requested format index is within range */
@@ -818,7 +819,8 @@ tvp7002_enum_mbus_code(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cf
  * get video format for pad.
  */
 static int
-tvp7002_get_pad_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+tvp7002_get_pad_format(struct v4l2_subdev *sd,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
 	struct tvp7002 *tvp7002 = to_tvp7002(sd);
@@ -841,10 +843,11 @@ tvp7002_get_pad_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cf
  * set video format for pad.
  */
 static int
-tvp7002_set_pad_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+tvp7002_set_pad_format(struct v4l2_subdev *sd,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *fmt)
 {
-	return tvp7002_get_pad_format(sd, cfg, fmt);
+	return tvp7002_get_pad_format(sd, sd_state, fmt);
 }
 
 /* V4L2 core operation handlers */
diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index a25a350b0ddc..09f5b3986928 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -720,7 +720,7 @@ static int tw9910_set_frame(struct v4l2_subdev *sd, u32 *width, u32 *height)
 }
 
 static int tw9910_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -746,7 +746,7 @@ static int tw9910_get_selection(struct v4l2_subdev *sd,
 }
 
 static int tw9910_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -797,7 +797,7 @@ static int tw9910_s_fmt(struct v4l2_subdev *sd,
 }
 
 static int tw9910_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *mf = &format->format;
@@ -829,7 +829,7 @@ static int tw9910_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return tw9910_s_fmt(sd, mf);
 
-	cfg->try_fmt = *mf;
+	sd_state->pads->try_fmt = *mf;
 
 	return 0;
 }
@@ -886,7 +886,7 @@ static const struct v4l2_subdev_core_ops tw9910_subdev_core_ops = {
 };
 
 static int tw9910_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index)
diff --git a/drivers/media/i2c/vs6624.c b/drivers/media/i2c/vs6624.c
index c292c92e37b9..29003dec6f2d 100644
--- a/drivers/media/i2c/vs6624.c
+++ b/drivers/media/i2c/vs6624.c
@@ -546,7 +546,7 @@ static int vs6624_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static int vs6624_enum_mbus_code(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= ARRAY_SIZE(vs6624_formats))
@@ -557,7 +557,7 @@ static int vs6624_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int vs6624_set_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -587,7 +587,7 @@ static int vs6624_set_fmt(struct v4l2_subdev *sd,
 	fmt->colorspace = vs6624_formats[index].colorspace;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 		return 0;
 	}
 
@@ -637,7 +637,7 @@ static int vs6624_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int vs6624_get_fmt(struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_format *format)
 {
 	struct vs6624 *sensor = to_vs6624(sd);
-- 
2.25.1

