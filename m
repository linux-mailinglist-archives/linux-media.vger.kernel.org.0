Return-Path: <linux-media+bounces-334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A27EB0AA
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 14:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1215D1F24AA5
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 13:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA523FE4C;
	Tue, 14 Nov 2023 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n2wAAf39"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2C03FE52
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 13:15:17 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4923CB
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 05:15:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 909B6D49;
	Tue, 14 Nov 2023 14:14:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699967684;
	bh=E1wVdhlNos8MBo7R5Rv6n6GCKmZ7QEdVxREPJTavss4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n2wAAf39KL/0p8IuzZ3qm3nQHTQT+3JS84zJGDFvl0MaQ3dMu1P7bUQFGXnmfAS6T
	 gt7JSyfAoph1Jatf2o84vnzj5NSxswWjDNs3e0y4C6EzCaGScpAK7k1l4z3FVJVGGU
	 A/B0EmGglfRo8GJO3gKKcQQPpD9gUY5RNIjmuvZE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Maxime Ripard <mripard@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Benoit Parrot <bparrot@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 2/2] media: v4l2-subdev: Rename .init_cfg() operation to .init_state()
Date: Tue, 14 Nov 2023 15:15:12 +0200
Message-ID: <20231114131512.24615-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114131512.24615-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20231114131512.24615-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The subdev .init_cfg() operation is affected by two issues:

- It has long been extended to initialize a whole v4l2_subdev_state
  instead of just a v4l2_subdev_pad_config, but its name has stuck
  around.

- Despite operating on a whole subdev state and not being directly
  exposed to the subdev users (either in-kernel or through the userspace
  API), .init_cfg() is categorized as a subdev pad operation.

This participates in making the subdev API confusing for new developers.
Fix it by renaming the operation to .init_state(), and make it a subdev
internal operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/adv7180.c                   | 10 ++--
 drivers/media/i2c/ccs/ccs-core.c              |  6 +--
 drivers/media/i2c/ds90ub913.c                 | 10 ++--
 drivers/media/i2c/ds90ub953.c                 | 10 ++--
 drivers/media/i2c/ds90ub960.c                 | 11 ++--
 drivers/media/i2c/hi846.c                     | 10 ++--
 drivers/media/i2c/imx214.c                    | 12 +++--
 drivers/media/i2c/imx219.c                    |  9 ++--
 drivers/media/i2c/imx290.c                    | 10 ++--
 drivers/media/i2c/imx296.c                    | 10 ++--
 drivers/media/i2c/imx334.c                    | 12 +++--
 drivers/media/i2c/imx335.c                    | 12 +++--
 drivers/media/i2c/imx412.c                    | 12 +++--
 drivers/media/i2c/imx415.c                    | 10 ++--
 drivers/media/i2c/mt9m001.c                   | 10 ++--
 drivers/media/i2c/mt9m111.c                   | 10 ++--
 drivers/media/i2c/mt9m114.c                   | 16 +++---
 drivers/media/i2c/mt9p031.c                   |  8 +--
 drivers/media/i2c/mt9v111.c                   | 10 ++--
 drivers/media/i2c/ov01a10.c                   | 10 ++--
 drivers/media/i2c/ov02a10.c                   | 10 ++--
 drivers/media/i2c/ov2640.c                    | 10 ++--
 drivers/media/i2c/ov2680.c                    | 10 ++--
 drivers/media/i2c/ov2740.c                    | 10 ++--
 drivers/media/i2c/ov5640.c                    | 10 ++--
 drivers/media/i2c/ov5645.c                    | 12 +++--
 drivers/media/i2c/ov5670.c                    | 10 ++--
 drivers/media/i2c/ov7251.c                    | 12 +++--
 drivers/media/i2c/ov8858.c                    | 10 ++--
 drivers/media/i2c/ov9282.c                    | 12 +++--
 drivers/media/i2c/st-vgxy61.c                 | 10 ++--
 drivers/media/i2c/tc358746.c                  | 10 ++--
 drivers/media/i2c/tda1997x.c                  | 10 ++--
 drivers/media/i2c/tvp5150.c                   |  6 +--
 drivers/media/pci/intel/ivsc/mei_csi.c        | 10 ++--
 drivers/media/platform/cadence/cdns-csi2rx.c  | 10 ++--
 .../platform/microchip/microchip-csi2dc.c     | 10 ++--
 .../platform/microchip/microchip-isc-scaler.c | 10 ++--
 drivers/media/platform/nxp/imx-mipi-csis.c    | 10 ++--
 drivers/media/platform/nxp/imx7-media-csi.c   |  6 +--
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 10 ++--
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     | 10 ++--
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 10 ++--
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 10 ++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 10 ++--
 .../media/platform/renesas/vsp1/vsp1_brx.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_clu.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_entity.c | 53 +++++++++----------
 .../media/platform/renesas/vsp1/vsp1_entity.h |  2 -
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  1 -
 .../media/platform/renesas/vsp1/vsp1_lif.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_lut.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  1 -
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  1 -
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  1 -
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 10 ++--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 10 ++--
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 10 ++--
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  9 ++--
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 10 ++--
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 10 ++--
 .../sun8i_a83t_mipi_csi2.c                    | 10 ++--
 drivers/media/platform/ti/cal/cal-camerarx.c  | 10 ++--
 drivers/media/platform/video-mux.c            | 10 ++--
 .../media/platform/xilinx/xilinx-csi2rxss.c   | 10 ++--
 .../media/test-drivers/vimc/vimc-debayer.c    | 11 ++--
 drivers/media/test-drivers/vimc/vimc-scaler.c | 11 ++--
 drivers/media/test-drivers/vimc/vimc-sensor.c | 11 ++--
 drivers/media/v4l2-core/v4l2-subdev.c         |  8 +--
 drivers/staging/media/imx/imx-ic-prp.c        |  2 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  2 +-
 drivers/staging/media/imx/imx-media-csi.c     |  2 +-
 drivers/staging/media/imx/imx-media-utils.c   |  8 +--
 drivers/staging/media/imx/imx-media-vdic.c    |  2 +-
 drivers/staging/media/imx/imx-media.h         |  4 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  2 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 10 ++--
 include/media/v4l2-subdev.h                   |  7 +--
 81 files changed, 456 insertions(+), 245 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 444c322d756a..e10811cce801 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -813,8 +813,8 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int adv7180_init_cfg(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state)
+static int adv7180_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = {
 		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
@@ -929,7 +929,6 @@ static const struct v4l2_subdev_core_ops adv7180_core_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops adv7180_pad_ops = {
-	.init_cfg = adv7180_init_cfg,
 	.enum_mbus_code = adv7180_enum_mbus_code,
 	.set_fmt = adv7180_set_pad_format,
 	.get_fmt = adv7180_get_pad_format,
@@ -947,6 +946,10 @@ static const struct v4l2_subdev_ops adv7180_ops = {
 	.sensor = &adv7180_sensor_ops,
 };
 
+static const struct v4l2_subdev_internal_ops adv7180_internal_ops = {
+	.init_state = adv7180_init_state,
+};
+
 static irqreturn_t adv7180_irq(int irq, void *devid)
 {
 	struct adv7180_state *state = devid;
@@ -1458,6 +1461,7 @@ static int adv7180_probe(struct i2c_client *client)
 	state->input = 0;
 	sd = &state->sd;
 	v4l2_i2c_subdev_init(sd, client, &adv7180_ops);
+	sd->internal_ops = &adv7180_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 
 	ret = adv7180_init_controls(state);
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index d210b6c87db4..6fd162fe394a 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3015,8 +3015,8 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 	return 0;
 }
 
-static int ccs_init_cfg(struct v4l2_subdev *sd,
-			struct v4l2_subdev_state *sd_state)
+static int ccs_init_state(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(sd);
 	struct ccs_sensor *sensor = ssd->sensor;
@@ -3064,7 +3064,6 @@ static const struct v4l2_subdev_video_ops ccs_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
-	.init_cfg = ccs_init_cfg,
 	.enum_mbus_code = ccs_enum_mbus_code,
 	.get_fmt = ccs_get_format,
 	.set_fmt = ccs_set_format,
@@ -3088,6 +3087,7 @@ static const struct media_entity_operations ccs_entity_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops ccs_internal_src_ops = {
+	.init_state = ccs_init_state,
 	.registered = ccs_registered,
 	.unregistered = ccs_unregistered,
 };
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 8bb6be956780..ca9bb29dab89 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -443,8 +443,8 @@ static int ub913_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ub913_init_cfg(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *state)
+static int ub913_init_state(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_route routes[] = {
 		{
@@ -503,7 +503,6 @@ static const struct v4l2_subdev_pad_ops ub913_pad_ops = {
 	.get_frame_desc = ub913_get_frame_desc,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub913_set_fmt,
-	.init_cfg = ub913_init_cfg,
 };
 
 static const struct v4l2_subdev_ops ub913_subdev_ops = {
@@ -511,6 +510,10 @@ static const struct v4l2_subdev_ops ub913_subdev_ops = {
 	.pad = &ub913_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ub913_internal_ops = {
+	.init_state = ub913_init_state,
+};
+
 static const struct media_entity_operations ub913_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -744,6 +747,7 @@ static int ub913_subdev_init(struct ub913_data *priv)
 	int ret;
 
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub913_subdev_ops);
+	priv->sd.internal_ops = &ub913_internal_ops;
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &ub913_entity_ops;
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 4eb08e3a31c7..16f88db14981 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -575,8 +575,8 @@ static int ub953_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ub953_init_cfg(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *state)
+static int ub953_init_state(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_route routes[] = {
 		{
@@ -713,7 +713,6 @@ static const struct v4l2_subdev_pad_ops ub953_pad_ops = {
 	.get_frame_desc = ub953_get_frame_desc,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub953_set_fmt,
-	.init_cfg = ub953_init_cfg,
 };
 
 static const struct v4l2_subdev_core_ops ub953_subdev_core_ops = {
@@ -727,6 +726,10 @@ static const struct v4l2_subdev_ops ub953_subdev_ops = {
 	.pad = &ub953_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ub953_internal_ops = {
+	.init_state = ub953_init_state,
+};
+
 static const struct media_entity_operations ub953_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -1240,6 +1243,7 @@ static int ub953_subdev_init(struct ub953_data *priv)
 	int ret;
 
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub953_subdev_ops);
+	priv->sd.internal_ops = &ub953_internal_ops;
 
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 1d1476098c92..ffe5f25f8647 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2906,8 +2906,8 @@ static int ub960_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ub960_init_cfg(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *state)
+static int ub960_init_state(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state)
 {
 	struct ub960_data *priv = sd_to_ub960(sd);
 
@@ -2938,8 +2938,6 @@ static const struct v4l2_subdev_pad_ops ub960_pad_ops = {
 
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub960_set_fmt,
-
-	.init_cfg = ub960_init_cfg,
 };
 
 static int ub960_log_status(struct v4l2_subdev *sd)
@@ -3091,6 +3089,10 @@ static const struct v4l2_subdev_core_ops ub960_subdev_core_ops = {
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
+static const struct v4l2_subdev_internal_ops ub960_internal_ops = {
+	.init_state = ub960_init_state,
+};
+
 static const struct v4l2_subdev_ops ub960_subdev_ops = {
 	.core = &ub960_subdev_core_ops,
 	.pad = &ub960_pad_ops,
@@ -3650,6 +3652,7 @@ static int ub960_create_subdev(struct ub960_data *priv)
 	int ret;
 
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub960_subdev_ops);
+	priv->sd.internal_ops = &ub960_internal_ops;
 
 	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
 	priv->sd.ctrl_handler = &priv->ctrl_handler;
diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 0595080c2211..9c565ec033d4 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1871,8 +1871,8 @@ static int hi846_get_selection(struct v4l2_subdev *sd,
 	}
 }
 
-static int hi846_init_cfg(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *sd_state)
+static int hi846_init_state(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *sd_state)
 {
 	struct hi846 *hi846 = to_hi846(sd);
 	struct v4l2_mbus_framefmt *mf;
@@ -1895,7 +1895,6 @@ static const struct v4l2_subdev_video_ops hi846_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops hi846_pad_ops = {
-	.init_cfg = hi846_init_cfg,
 	.enum_frame_size = hi846_enum_frame_size,
 	.enum_mbus_code = hi846_enum_mbus_code,
 	.set_fmt = hi846_set_format,
@@ -1908,6 +1907,10 @@ static const struct v4l2_subdev_ops hi846_subdev_ops = {
 	.pad = &hi846_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops hi846_internal_ops = {
+	.init_state = hi846_init_state,
+};
+
 static const struct media_entity_operations hi846_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -2071,6 +2074,7 @@ static int hi846_probe(struct i2c_client *client)
 		return ret;
 
 	v4l2_i2c_subdev_init(&hi846->sd, client, &hi846_subdev_ops);
+	hi846->sd.internal_ops = &hi846_internal_ops;
 
 	mutex_init(&hi846->mutex);
 
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 8bc7b114c57d..474c95572bf6 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -633,8 +633,8 @@ static int imx214_get_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int imx214_entity_init_cfg(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_state *sd_state)
+static int imx214_entity_init_state(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = { };
 
@@ -839,7 +839,6 @@ static const struct v4l2_subdev_pad_ops imx214_subdev_pad_ops = {
 	.get_fmt = imx214_get_format,
 	.set_fmt = imx214_set_format,
 	.get_selection = imx214_get_selection,
-	.init_cfg = imx214_entity_init_cfg,
 };
 
 static const struct v4l2_subdev_ops imx214_subdev_ops = {
@@ -848,6 +847,10 @@ static const struct v4l2_subdev_ops imx214_subdev_ops = {
 	.pad = &imx214_subdev_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops imx214_internal_ops = {
+	.init_state = imx214_entity_init_state,
+};
+
 static const struct regmap_config sensor_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
@@ -957,6 +960,7 @@ static int imx214_probe(struct i2c_client *client)
 	}
 
 	v4l2_i2c_subdev_init(&imx214->sd, client, &imx214_subdev_ops);
+	imx214->sd.internal_ops = &imx214_internal_ops;
 
 	/*
 	 * Enable power initially, to avoid warnings
@@ -1021,7 +1025,7 @@ static int imx214_probe(struct i2c_client *client)
 		goto free_ctrl;
 	}
 
-	imx214_entity_init_cfg(&imx214->sd, NULL);
+	imx214_entity_init_state(&imx214->sd, NULL);
 
 	ret = v4l2_async_register_subdev_sensor(&imx214->sd);
 	if (ret < 0) {
diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 675795ac2e83..e17ef2e9d9d0 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -905,8 +905,8 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
-static int imx219_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *state)
+static int imx219_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
@@ -933,7 +933,6 @@ static const struct v4l2_subdev_video_ops imx219_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
-	.init_cfg = imx219_init_cfg,
 	.enum_mbus_code = imx219_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx219_set_pad_format,
@@ -947,6 +946,9 @@ static const struct v4l2_subdev_ops imx219_subdev_ops = {
 	.pad = &imx219_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops imx219_internal_ops = {
+	.init_state = imx219_init_state,
+};
 
 /* -----------------------------------------------------------------------------
  * Power management
@@ -1098,6 +1100,7 @@ static int imx219_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
+	imx219->sd.internal_ops = &imx219_internal_ops;
 
 	/* Check the hardware configuration in device tree */
 	if (imx219_check_hwcfg(dev, imx219))
diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index aa8cfbcd40aa..52ba6188911b 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1195,8 +1195,8 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
 	}
 }
 
-static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_state *sd_state)
+static int imx290_entity_init_state(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
@@ -1221,7 +1221,6 @@ static const struct v4l2_subdev_video_ops imx290_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
-	.init_cfg = imx290_entity_init_cfg,
 	.enum_mbus_code = imx290_enum_mbus_code,
 	.enum_frame_size = imx290_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
@@ -1235,6 +1234,10 @@ static const struct v4l2_subdev_ops imx290_subdev_ops = {
 	.pad = &imx290_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops imx290_internal_ops = {
+	.init_state = imx290_entity_init_state,
+};
+
 static const struct media_entity_operations imx290_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -1248,6 +1251,7 @@ static int imx290_subdev_init(struct imx290 *imx290)
 	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
 
 	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
+	imx290->sd.internal_ops = &imx290_internal_ops;
 	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	imx290->sd.dev = imx290->dev;
diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index 8399cca496a7..83149fa729c4 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -798,8 +798,8 @@ static int imx296_set_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int imx296_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *state)
+static int imx296_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_selection sel = {
 		.target = V4L2_SEL_TGT_CROP,
@@ -830,7 +830,6 @@ static const struct v4l2_subdev_pad_ops imx296_subdev_pad_ops = {
 	.set_fmt = imx296_set_format,
 	.get_selection = imx296_get_selection,
 	.set_selection = imx296_set_selection,
-	.init_cfg = imx296_init_cfg,
 };
 
 static const struct v4l2_subdev_ops imx296_subdev_ops = {
@@ -838,12 +837,17 @@ static const struct v4l2_subdev_ops imx296_subdev_ops = {
 	.pad = &imx296_subdev_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops imx296_internal_ops = {
+	.init_state = imx296_init_state,
+};
+
 static int imx296_subdev_init(struct imx296 *sensor)
 {
 	struct i2c_client *client = to_i2c_client(sensor->dev);
 	int ret;
 
 	v4l2_i2c_subdev_init(&sensor->subdev, client, &imx296_subdev_ops);
+	sensor->subdev.internal_ops = &imx296_internal_ops;
 
 	ret = imx296_ctrls_init(sensor);
 	if (ret < 0)
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 42cf71c1f6fd..6725b3e2a73e 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -935,14 +935,14 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 }
 
 /**
- * imx334_init_cfg() - Initialize sub-device state
+ * imx334_init_state() - Initialize sub-device state
  * @sd: pointer to imx334 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device state
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx334_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state)
+static int imx334_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct imx334 *imx334 = to_imx334(sd);
 	struct v4l2_subdev_format fmt = { 0 };
@@ -1190,7 +1190,6 @@ static const struct v4l2_subdev_video_ops imx334_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops imx334_pad_ops = {
-	.init_cfg = imx334_init_cfg,
 	.enum_mbus_code = imx334_enum_mbus_code,
 	.enum_frame_size = imx334_enum_frame_size,
 	.get_fmt = imx334_get_pad_format,
@@ -1202,6 +1201,10 @@ static const struct v4l2_subdev_ops imx334_subdev_ops = {
 	.pad = &imx334_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops imx334_internal_ops = {
+	.init_state = imx334_init_state,
+};
+
 /**
  * imx334_power_on() - Sensor power on sequence
  * @dev: pointer to i2c device
@@ -1359,6 +1362,7 @@ static int imx334_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx334->sd, client, &imx334_subdev_ops);
+	imx334->sd.internal_ops = &imx334_internal_ops;
 
 	ret = imx334_parse_hw_config(imx334);
 	if (ret) {
diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 0432f059e913..205a150971b7 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -618,14 +618,14 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 }
 
 /**
- * imx335_init_cfg() - Initialize sub-device state
+ * imx335_init_state() - Initialize sub-device state
  * @sd: pointer to imx335 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device configuration
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx335_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state)
+static int imx335_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct imx335 *imx335 = to_imx335(sd);
 	struct v4l2_subdev_format fmt = { 0 };
@@ -835,7 +835,6 @@ static const struct v4l2_subdev_video_ops imx335_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops imx335_pad_ops = {
-	.init_cfg = imx335_init_cfg,
 	.enum_mbus_code = imx335_enum_mbus_code,
 	.enum_frame_size = imx335_enum_frame_size,
 	.get_fmt = imx335_get_pad_format,
@@ -847,6 +846,10 @@ static const struct v4l2_subdev_ops imx335_subdev_ops = {
 	.pad = &imx335_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops imx335_internal_ops = {
+	.init_state = imx335_init_state,
+};
+
 /**
  * imx335_power_on() - Sensor power on sequence
  * @dev: pointer to i2c device
@@ -999,6 +1002,7 @@ static int imx335_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx335->sd, client, &imx335_subdev_ops);
+	imx335->sd.internal_ops = &imx335_internal_ops;
 
 	ret = imx335_parse_hw_config(imx335);
 	if (ret) {
diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 41d756a20f3c..0efce329525e 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -770,14 +770,14 @@ static int imx412_set_pad_format(struct v4l2_subdev *sd,
 }
 
 /**
- * imx412_init_cfg() - Initialize sub-device state
+ * imx412_init_state() - Initialize sub-device state
  * @sd: pointer to imx412 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device configuration
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state)
+static int imx412_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct imx412 *imx412 = to_imx412(sd);
 	struct v4l2_subdev_format fmt = { 0 };
@@ -997,7 +997,6 @@ static const struct v4l2_subdev_video_ops imx412_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops imx412_pad_ops = {
-	.init_cfg = imx412_init_cfg,
 	.enum_mbus_code = imx412_enum_mbus_code,
 	.enum_frame_size = imx412_enum_frame_size,
 	.get_fmt = imx412_get_pad_format,
@@ -1009,6 +1008,10 @@ static const struct v4l2_subdev_ops imx412_subdev_ops = {
 	.pad = &imx412_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops imx412_internal_ops = {
+	.init_state = imx412_init_state,
+};
+
 /**
  * imx412_power_on() - Sensor power on sequence
  * @dev: pointer to i2c device
@@ -1177,6 +1180,7 @@ static int imx412_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx412->sd, client, &imx412_subdev_ops);
+	imx412->sd.internal_ops = &imx412_internal_ops;
 
 	ret = imx412_parse_hw_config(imx412);
 	if (ret) {
diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 6436a32c4025..1e5f20c3ed82 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -880,8 +880,8 @@ static int imx415_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
-static int imx415_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *state)
+static int imx415_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_format format = {
 		.format = {
@@ -905,7 +905,6 @@ static const struct v4l2_subdev_pad_ops imx415_subdev_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx415_set_format,
 	.get_selection = imx415_get_selection,
-	.init_cfg = imx415_init_cfg,
 };
 
 static const struct v4l2_subdev_ops imx415_subdev_ops = {
@@ -913,12 +912,17 @@ static const struct v4l2_subdev_ops imx415_subdev_ops = {
 	.pad = &imx415_subdev_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops imx415_internal_ops = {
+	.init_state = imx415_init_state,
+};
+
 static int imx415_subdev_init(struct imx415 *sensor)
 {
 	struct i2c_client *client = to_i2c_client(sensor->dev);
 	int ret;
 
 	v4l2_i2c_subdev_init(&sensor->subdev, client, &imx415_subdev_ops);
+	sensor->subdev.internal_ops = &imx415_internal_ops;
 
 	ret = imx415_ctrls_init(sensor);
 	if (ret)
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 4c897bb07fed..ad1a3ab77411 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -650,8 +650,8 @@ static const struct v4l2_subdev_core_ops mt9m001_subdev_core_ops = {
 #endif
 };
 
-static int mt9m001_init_cfg(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state)
+static int mt9m001_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
@@ -708,7 +708,6 @@ static const struct v4l2_subdev_sensor_ops mt9m001_subdev_sensor_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mt9m001_subdev_pad_ops = {
-	.init_cfg	= mt9m001_init_cfg,
 	.enum_mbus_code = mt9m001_enum_mbus_code,
 	.get_selection	= mt9m001_get_selection,
 	.set_selection	= mt9m001_set_selection,
@@ -724,6 +723,10 @@ static const struct v4l2_subdev_ops mt9m001_subdev_ops = {
 	.pad	= &mt9m001_subdev_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops mt9m001_internal_ops = {
+	.init_state	= mt9m001_init_state,
+};
+
 static int mt9m001_probe(struct i2c_client *client)
 {
 	struct mt9m001 *mt9m001;
@@ -755,6 +758,7 @@ static int mt9m001_probe(struct i2c_client *client)
 		return PTR_ERR(mt9m001->reset_gpio);
 
 	v4l2_i2c_subdev_init(&mt9m001->subdev, client, &mt9m001_subdev_ops);
+	mt9m001->subdev.internal_ops = &mt9m001_internal_ops;
 	mt9m001->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 				 V4L2_SUBDEV_FL_HAS_EVENTS;
 	v4l2_ctrl_handler_init(&mt9m001->hdl, 4);
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 17ca92810b58..54a7a4c623ea 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1111,8 +1111,8 @@ static int mt9m111_s_stream(struct v4l2_subdev *sd, int enable)
 	return 0;
 }
 
-static int mt9m111_init_cfg(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state)
+static int mt9m111_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *format =
 		v4l2_subdev_state_get_format(sd_state, 0);
@@ -1156,7 +1156,6 @@ static const struct v4l2_subdev_video_ops mt9m111_subdev_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mt9m111_subdev_pad_ops = {
-	.init_cfg	= mt9m111_init_cfg,
 	.enum_mbus_code = mt9m111_enum_mbus_code,
 	.get_selection	= mt9m111_get_selection,
 	.set_selection	= mt9m111_set_selection,
@@ -1171,6 +1170,10 @@ static const struct v4l2_subdev_ops mt9m111_subdev_ops = {
 	.pad	= &mt9m111_subdev_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops mt9m111_internal_ops = {
+	.init_state	= mt9m111_init_state,
+};
+
 /*
  * Interface active, can use i2c. If it fails, it can indeed mean, that
  * this wasn't our capture interface, so, we wait for the right one
@@ -1275,6 +1278,7 @@ static int mt9m111_probe(struct i2c_client *client)
 	mt9m111->ctx = &context_b;
 
 	v4l2_i2c_subdev_init(&mt9m111->subdev, client, &mt9m111_subdev_ops);
+	mt9m111->subdev.internal_ops = &mt9m111_internal_ops;
 	mt9m111->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 				 V4L2_SUBDEV_FL_HAS_EVENTS;
 
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 23cf84f1a746..0a22f328981d 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1152,8 +1152,8 @@ static inline struct mt9m114 *pa_to_mt9m114(struct v4l2_subdev *sd)
 	return container_of(sd, struct mt9m114, pa.sd);
 }
 
-static int mt9m114_pa_init_cfg(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *state)
+static int mt9m114_pa_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state)
 {
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
@@ -1304,7 +1304,6 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {
-	.init_cfg = mt9m114_pa_init_cfg,
 	.enum_mbus_code = mt9m114_pa_enum_mbus_code,
 	.enum_frame_size = mt9m114_pa_enum_framesizes,
 	.get_fmt = v4l2_subdev_get_fmt,
@@ -1317,6 +1316,10 @@ static const struct v4l2_subdev_ops mt9m114_pa_ops = {
 	.pad = &mt9m114_pa_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops mt9m114_pa_internal_ops = {
+	.init_state = mt9m114_pa_init_state,
+};
+
 static int mt9m114_pa_init(struct mt9m114 *sensor)
 {
 	struct v4l2_ctrl_handler *hdl = &sensor->pa.hdl;
@@ -1329,6 +1332,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
 
 	/* Initialize the subdev. */
 	v4l2_subdev_init(sd, &mt9m114_pa_ops);
+	sd->internal_ops = &mt9m114_pa_internal_ops;
 	v4l2_i2c_subdev_set_name(sd, sensor->client, NULL, " pixel array");
 
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -1624,8 +1628,8 @@ static int mt9m114_ifp_s_frame_interval(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int mt9m114_ifp_init_cfg(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *state)
+static int mt9m114_ifp_init_state(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state)
 {
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 	struct v4l2_mbus_framefmt *format;
@@ -1968,7 +1972,6 @@ static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mt9m114_ifp_pad_ops = {
-	.init_cfg = mt9m114_ifp_init_cfg,
 	.enum_mbus_code = mt9m114_ifp_enum_mbus_code,
 	.enum_frame_size = mt9m114_ifp_enum_framesizes,
 	.enum_frame_interval = mt9m114_ifp_enum_frameintervals,
@@ -1984,6 +1987,7 @@ static const struct v4l2_subdev_ops mt9m114_ifp_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops mt9m114_ifp_internal_ops = {
+	.init_state = mt9m114_ifp_init_state,
 	.registered = mt9m114_ifp_registered,
 	.unregistered = mt9m114_ifp_unregistered,
 };
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 89bcd48748b9..596200d0248c 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -696,8 +696,8 @@ static int mt9p031_set_selection(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int mt9p031_init_cfg(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_state *sd_state)
+static int mt9p031_init_state(struct v4l2_subdev *subdev,
+			      struct v4l2_subdev_state *sd_state)
 {
 	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
 	struct v4l2_mbus_framefmt *format;
@@ -1041,7 +1041,6 @@ static const struct v4l2_subdev_video_ops mt9p031_subdev_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mt9p031_subdev_pad_ops = {
-	.init_cfg = mt9p031_init_cfg,
 	.enum_mbus_code = mt9p031_enum_mbus_code,
 	.enum_frame_size = mt9p031_enum_frame_size,
 	.get_fmt = mt9p031_get_format,
@@ -1057,6 +1056,7 @@ static const struct v4l2_subdev_ops mt9p031_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops mt9p031_subdev_internal_ops = {
+	.init_state = mt9p031_init_state,
 	.registered = mt9p031_registered,
 	.open = mt9p031_open,
 	.close = mt9p031_close,
@@ -1189,7 +1189,7 @@ static int mt9p031_probe(struct i2c_client *client)
 
 	mt9p031->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
-	ret = mt9p031_init_cfg(&mt9p031->subdev, NULL);
+	ret = mt9p031_init_state(&mt9p031->subdev, NULL);
 	if (ret)
 		goto done;
 
diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 6752582cb2c7..b186e9160d94 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -948,8 +948,8 @@ static int mt9v111_set_format(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int mt9v111_init_cfg(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_state *sd_state)
+static int mt9v111_init_state(struct v4l2_subdev *subdev,
+			      struct v4l2_subdev_state *sd_state)
 {
 	*v4l2_subdev_state_get_format(sd_state, 0) = mt9v111_def_fmt;
 
@@ -967,7 +967,6 @@ static const struct v4l2_subdev_video_ops mt9v111_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mt9v111_pad_ops = {
-	.init_cfg		= mt9v111_init_cfg,
 	.enum_mbus_code		= mt9v111_enum_mbus_code,
 	.enum_frame_size	= mt9v111_enum_frame_size,
 	.enum_frame_interval	= mt9v111_enum_frame_interval,
@@ -981,6 +980,10 @@ static const struct v4l2_subdev_ops mt9v111_ops = {
 	.pad	= &mt9v111_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops mt9v111_internal_ops = {
+	.init_state		= mt9v111_init_state,
+};
+
 static const struct media_entity_operations mt9v111_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -1194,6 +1197,7 @@ static int mt9v111_probe(struct i2c_client *client)
 	mt9v111->pending	= true;
 
 	v4l2_i2c_subdev_init(&mt9v111->sd, client, &mt9v111_ops);
+	mt9v111->sd.internal_ops = &mt9v111_internal_ops;
 
 	mt9v111->sd.flags	|= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	mt9v111->sd.entity.ops	= &mt9v111_subdev_entity_ops;
diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index c72280bb1f5b..7cca9294ea31 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -729,8 +729,8 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov01a10_init_cfg(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *state)
+static int ov01a10_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
@@ -813,7 +813,6 @@ static const struct v4l2_subdev_video_ops ov01a10_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov01a10_pad_ops = {
-	.init_cfg = ov01a10_init_cfg,
 	.set_fmt = ov01a10_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.get_selection = ov01a10_get_selection,
@@ -827,6 +826,10 @@ static const struct v4l2_subdev_ops ov01a10_subdev_ops = {
 	.pad = &ov01a10_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ov01a10_internal_ops = {
+	.init_state = ov01a10_init_state,
+};
+
 static const struct media_entity_operations ov01a10_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -872,6 +875,7 @@ static int ov01a10_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	v4l2_i2c_subdev_init(&ov01a10->sd, client, &ov01a10_subdev_ops);
+	ov01a10->sd.internal_ops = &ov01a10_internal_ops;
 
 	ret = ov01a10_identify_module(ov01a10);
 	if (ret)
diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 8454cb39a47b..6c30e1a0d814 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -511,8 +511,8 @@ static int __ov02a10_stop_stream(struct ov02a10 *ov02a10)
 					 SC_CTRL_MODE_STANDBY);
 }
 
-static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *sd_state)
+static int ov02a10_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
@@ -709,7 +709,6 @@ static const struct v4l2_subdev_video_ops ov02a10_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov02a10_pad_ops = {
-	.init_cfg = ov02a10_entity_init_cfg,
 	.enum_mbus_code = ov02a10_enum_mbus_code,
 	.enum_frame_size = ov02a10_enum_frame_sizes,
 	.get_fmt = ov02a10_get_fmt,
@@ -721,6 +720,10 @@ static const struct v4l2_subdev_ops ov02a10_subdev_ops = {
 	.pad	= &ov02a10_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ov02a10_internal_ops = {
+	.init_state = ov02a10_init_state,
+};
+
 static const struct media_entity_operations ov02a10_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -869,6 +872,7 @@ static int ov02a10_probe(struct i2c_client *client)
 				     "failed to check HW configuration\n");
 
 	v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
+	ov02a10->subdev.internal_ops = &ov02a10_internal_ops;
 
 	ov02a10->mipi_clock_voltage = OV02A10_MIPI_TX_SPEED_DEFAULT;
 	ov02a10->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 28911d5169f7..67c4bd2916e8 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -996,8 +996,8 @@ static int ov2640_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int ov2640_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state)
+static int ov2640_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *try_fmt =
 		v4l2_subdev_state_get_format(sd_state, 0);
@@ -1125,7 +1125,6 @@ static const struct v4l2_subdev_core_ops ov2640_subdev_core_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov2640_subdev_pad_ops = {
-	.init_cfg	= ov2640_init_cfg,
 	.enum_mbus_code = ov2640_enum_mbus_code,
 	.get_selection	= ov2640_get_selection,
 	.get_fmt	= ov2640_get_fmt,
@@ -1142,6 +1141,10 @@ static const struct v4l2_subdev_ops ov2640_subdev_ops = {
 	.video	= &ov2640_subdev_video_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ov2640_internal_ops = {
+	.init_state	= ov2640_init_state,
+};
+
 static int ov2640_probe_dt(struct i2c_client *client,
 		struct ov2640_priv *priv)
 {
@@ -1211,6 +1214,7 @@ static int ov2640_probe(struct i2c_client *client)
 	priv->cfmt_code = MEDIA_BUS_FMT_UYVY8_2X8;
 
 	v4l2_i2c_subdev_init(&priv->subdev, client, &ov2640_subdev_ops);
+	priv->subdev.internal_ops = &ov2640_internal_ops;
 	priv->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			      V4L2_SUBDEV_FL_HAS_EVENTS;
 	mutex_init(&priv->lock);
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 9b53ea9af45a..d34d1972dcd9 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -755,8 +755,8 @@ static int ov2680_set_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov2680_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state)
+static int ov2680_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
@@ -876,7 +876,6 @@ static const struct v4l2_subdev_video_ops ov2680_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
-	.init_cfg		= ov2680_init_cfg,
 	.enum_mbus_code		= ov2680_enum_mbus_code,
 	.enum_frame_size	= ov2680_enum_frame_size,
 	.enum_frame_interval	= ov2680_enum_frame_interval,
@@ -891,6 +890,10 @@ static const struct v4l2_subdev_ops ov2680_subdev_ops = {
 	.pad	= &ov2680_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ov2680_internal_ops = {
+	.init_state		= ov2680_init_state,
+};
+
 static int ov2680_mode_init(struct ov2680_dev *sensor)
 {
 	/* set initial mode */
@@ -915,6 +918,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	int ret = 0;
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
+	sensor->sd.internal_ops = &ov2680_internal_ops;
 
 	sensor->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 23cbd8b7846e..f0be51b343a7 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -879,8 +879,8 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov2740_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state)
+static int ov2740_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
 {
 	ov2740_update_pad_format(&supported_modes[0],
 				 v4l2_subdev_state_get_format(sd_state, 0));
@@ -897,7 +897,6 @@ static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
 	.set_fmt = ov2740_set_format,
 	.enum_mbus_code = ov2740_enum_mbus_code,
 	.enum_frame_size = ov2740_enum_frame_size,
-	.init_cfg = ov2740_init_cfg,
 };
 
 static const struct v4l2_subdev_ops ov2740_subdev_ops = {
@@ -905,6 +904,10 @@ static const struct v4l2_subdev_ops ov2740_subdev_ops = {
 	.pad = &ov2740_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ov2740_internal_ops = {
+	.init_state = ov2740_init_state,
+};
+
 static const struct media_entity_operations ov2740_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -1074,6 +1077,7 @@ static int ov2740_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
+	ov2740->sd.internal_ops = &ov2740_internal_ops;
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		ret = ov2740_identify_module(ov2740);
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 3f79a3b77044..6fd98b8cb181 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3744,8 +3744,8 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int ov5640_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *state)
+static int ov5640_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	struct v4l2_mbus_framefmt *fmt =
@@ -3776,7 +3776,6 @@ static const struct v4l2_subdev_video_ops ov5640_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5640_pad_ops = {
-	.init_cfg = ov5640_init_cfg,
 	.enum_mbus_code = ov5640_enum_mbus_code,
 	.get_fmt = ov5640_get_fmt,
 	.set_fmt = ov5640_set_fmt,
@@ -3791,6 +3790,10 @@ static const struct v4l2_subdev_ops ov5640_subdev_ops = {
 	.pad = &ov5640_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ov5640_internal_ops = {
+	.init_state = ov5640_init_state,
+};
+
 static int ov5640_get_regulators(struct ov5640_dev *sensor)
 {
 	int i;
@@ -3905,6 +3908,7 @@ static int ov5640_probe(struct i2c_client *client)
 		return PTR_ERR(sensor->reset_gpio);
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov5640_subdev_ops);
+	sensor->sd.internal_ops = &ov5640_internal_ops;
 
 	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			    V4L2_SUBDEV_FL_HAS_EVENTS;
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 695f4f673536..a26ac11c989d 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -934,8 +934,8 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov5645_entity_init_cfg(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_state *sd_state)
+static int ov5645_init_state(struct v4l2_subdev *subdev,
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = { 0 };
 
@@ -1023,7 +1023,6 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
-	.init_cfg = ov5645_entity_init_cfg,
 	.enum_mbus_code = ov5645_enum_mbus_code,
 	.enum_frame_size = ov5645_enum_frame_size,
 	.get_fmt = ov5645_get_format,
@@ -1036,6 +1035,10 @@ static const struct v4l2_subdev_ops ov5645_subdev_ops = {
 	.pad = &ov5645_subdev_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ov5645_internal_ops = {
+	.init_state = ov5645_init_state,
+};
+
 static int ov5645_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -1162,6 +1165,7 @@ static int ov5645_probe(struct i2c_client *client)
 	}
 
 	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
+	ov5645->sd.internal_ops = &ov5645_internal_ops;
 	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ov5645->sd.dev = &client->dev;
@@ -1220,7 +1224,7 @@ static int ov5645_probe(struct i2c_client *client)
 	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
 
-	ov5645_entity_init_cfg(&ov5645->sd, NULL);
+	ov5645_init_state(&ov5645->sd, NULL);
 
 	ret = v4l2_async_register_subdev(&ov5645->sd);
 	if (ret < 0) {
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 470d848f40d8..2aee85965cf7 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2196,8 +2196,8 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
 	return ret;
 }
 
-static int ov5670_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *state)
+static int ov5670_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
 {
 	struct v4l2_mbus_framefmt *fmt =
 				v4l2_subdev_state_get_format(state, 0);
@@ -2592,7 +2592,6 @@ static const struct v4l2_subdev_video_ops ov5670_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
-	.init_cfg = ov5670_init_cfg,
 	.enum_mbus_code = ov5670_enum_mbus_code,
 	.get_fmt = ov5670_get_pad_format,
 	.set_fmt = ov5670_set_pad_format,
@@ -2612,6 +2611,10 @@ static const struct v4l2_subdev_ops ov5670_subdev_ops = {
 	.sensor = &ov5670_sensor_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ov5670_internal_ops = {
+	.init_state = ov5670_init_state,
+};
+
 static const struct media_entity_operations ov5670_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -2675,6 +2678,7 @@ static int ov5670_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
+	ov5670->sd.internal_ops = &ov5670_internal_ops;
 
 	ret = ov5670_regulators_probe(ov5670);
 	if (ret)
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 774f5dfb8186..897a0763df4a 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1282,8 +1282,8 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int ov7251_entity_init_cfg(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_state *sd_state)
+static int ov7251_init_state(struct v4l2_subdev *subdev,
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = {
 		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
@@ -1441,7 +1441,6 @@ static const struct v4l2_subdev_video_ops ov7251_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
-	.init_cfg = ov7251_entity_init_cfg,
 	.enum_mbus_code = ov7251_enum_mbus_code,
 	.enum_frame_size = ov7251_enum_frame_size,
 	.enum_frame_interval = ov7251_enum_frame_ival,
@@ -1455,6 +1454,10 @@ static const struct v4l2_subdev_ops ov7251_subdev_ops = {
 	.pad = &ov7251_subdev_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ov7251_internal_ops = {
+	.init_state = ov7251_init_state,
+};
+
 static int ov7251_check_hwcfg(struct ov7251 *ov7251)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(ov7251->dev);
@@ -1693,6 +1696,7 @@ static int ov7251_probe(struct i2c_client *client)
 	}
 
 	v4l2_i2c_subdev_init(&ov7251->sd, client, &ov7251_subdev_ops);
+	ov7251->sd.internal_ops = &ov7251_internal_ops;
 	ov7251->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ov7251->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ov7251->sd.dev = &client->dev;
@@ -1750,7 +1754,7 @@ static int ov7251_probe(struct i2c_client *client)
 		goto free_entity;
 	}
 
-	ov7251_entity_init_cfg(&ov7251->sd, NULL);
+	ov7251_init_state(&ov7251->sd, NULL);
 
 	return 0;
 
diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 0e3776136136..174c65f76886 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1476,8 +1476,8 @@ static int ov8858_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov8858_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state)
+static int ov8858_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
 {
 	const struct ov8858_mode *def_mode = &ov8858_modes[0];
 	struct v4l2_subdev_format fmt = {
@@ -1494,7 +1494,6 @@ static int ov8858_init_cfg(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_pad_ops ov8858_pad_ops = {
-	.init_cfg = ov8858_init_cfg,
 	.enum_mbus_code = ov8858_enum_mbus_code,
 	.enum_frame_size = ov8858_enum_frame_sizes,
 	.get_fmt = v4l2_subdev_get_fmt,
@@ -1512,6 +1511,10 @@ static const struct v4l2_subdev_ops ov8858_subdev_ops = {
 	.pad	= &ov8858_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ov8858_internal_ops = {
+	.init_state = ov8858_init_state,
+};
+
 /* ----------------------------------------------------------------------------
  * Controls handling
  */
@@ -1899,6 +1902,7 @@ static int ov8858_probe(struct i2c_client *client)
 				     "Failed to get powerdown gpio\n");
 
 	v4l2_i2c_subdev_init(&ov8858->subdev, client, &ov8858_subdev_ops);
+	ov8858->subdev.internal_ops = &ov8858_internal_ops;
 
 	ret = ov8858_configure_regulators(ov8858);
 	if (ret)
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 1707bc22ca91..251a4b534914 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -876,14 +876,14 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 }
 
 /**
- * ov9282_init_cfg() - Initialize sub-device state
+ * ov9282_init_state() - Initialize sub-device state
  * @sd: pointer to ov9282 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device configuration
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int ov9282_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state)
+static int ov9282_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
 	struct v4l2_subdev_format fmt = { 0 };
@@ -1192,7 +1192,6 @@ static const struct v4l2_subdev_video_ops ov9282_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
-	.init_cfg = ov9282_init_cfg,
 	.enum_mbus_code = ov9282_enum_mbus_code,
 	.enum_frame_size = ov9282_enum_frame_size,
 	.get_fmt = ov9282_get_pad_format,
@@ -1206,6 +1205,10 @@ static const struct v4l2_subdev_ops ov9282_subdev_ops = {
 	.pad = &ov9282_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops ov9282_internal_ops = {
+	.init_state = ov9282_init_state,
+};
+
 /**
  * ov9282_power_on() - Sensor power on sequence
  * @dev: pointer to i2c device
@@ -1394,6 +1397,7 @@ static int ov9282_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov9282->sd, client, &ov9282_subdev_ops);
+	ov9282->sd.internal_ops = &ov9282_internal_ops;
 	v4l2_i2c_subdev_set_name(&ov9282->sd, client,
 				 device_get_match_data(ov9282->dev), NULL);
 
diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index 507cd9661e9d..98d8975dcd67 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -1322,8 +1322,8 @@ static int vgxy61_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int vgxy61_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state)
+static int vgxy61_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
 	struct v4l2_subdev_format fmt = { 0 };
@@ -1469,7 +1469,6 @@ static const struct v4l2_subdev_video_ops vgxy61_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
-	.init_cfg = vgxy61_init_cfg,
 	.enum_mbus_code = vgxy61_enum_mbus_code,
 	.get_fmt = vgxy61_get_fmt,
 	.set_fmt = vgxy61_set_fmt,
@@ -1482,6 +1481,10 @@ static const struct v4l2_subdev_ops vgxy61_subdev_ops = {
 	.pad = &vgxy61_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops vgxy61_internal_ops = {
+	.init_state = vgxy61_init_state,
+};
+
 static const struct media_entity_operations vgxy61_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -1842,6 +1845,7 @@ static int vgxy61_probe(struct i2c_client *client)
 		device_property_read_bool(dev, "st,strobe-gpios-polarity");
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &vgxy61_subdev_ops);
+	sensor->sd.internal_ops = &vgxy61_internal_ops;
 	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sensor->sd.entity.ops = &vgxy61_subdev_entity_ops;
diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 8be9c0f293e0..106de4271d2e 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -740,8 +740,8 @@ static int tc358746_s_stream(struct v4l2_subdev *sd, int enable)
 	return v4l2_subdev_call(src, video, s_stream, 0);
 }
 
-static int tc358746_init_cfg(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *state)
+static int tc358746_init_state(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state)
 {
 	struct v4l2_mbus_framefmt *fmt;
 
@@ -1038,7 +1038,6 @@ static const struct v4l2_subdev_video_ops tc358746_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops tc358746_pad_ops = {
-	.init_cfg = tc358746_init_cfg,
 	.enum_mbus_code = tc358746_enum_mbus_code,
 	.set_fmt = tc358746_set_fmt,
 	.get_fmt = v4l2_subdev_get_fmt,
@@ -1052,6 +1051,10 @@ static const struct v4l2_subdev_ops tc358746_ops = {
 	.pad = &tc358746_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops tc358746_internal_ops = {
+	.init_state = tc358746_init_state,
+};
+
 static const struct media_entity_operations tc358746_entity_ops = {
 	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 	.link_validate = v4l2_subdev_link_validate,
@@ -1282,6 +1285,7 @@ tc358746_init_subdev(struct tc358746 *tc358746, struct i2c_client *client)
 	int err;
 
 	v4l2_i2c_subdev_init(sd, client, &tc358746_ops);
+	sd->internal_ops = &tc358746_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	sd->entity.ops = &tc358746_entity_ops;
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 63c12b77ff1e..1ea703a9909f 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1734,8 +1734,8 @@ static const struct v4l2_subdev_video_ops tda1997x_video_ops = {
  * v4l2_subdev_pad_ops
  */
 
-static int tda1997x_init_cfg(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state)
+static int tda1997x_init_state(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *sd_state)
 {
 	struct tda1997x_state *state = to_state(sd);
 	struct v4l2_mbus_framefmt *mf;
@@ -1925,7 +1925,6 @@ static int tda1997x_enum_dv_timings(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_pad_ops tda1997x_pad_ops = {
-	.init_cfg = tda1997x_init_cfg,
 	.enum_mbus_code = tda1997x_enum_mbus_code,
 	.get_fmt = tda1997x_get_format,
 	.set_fmt = tda1997x_set_format,
@@ -2047,6 +2046,10 @@ static const struct v4l2_subdev_ops tda1997x_subdev_ops = {
 	.pad = &tda1997x_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops tda1997x_internal_ops = {
+	.init_state = tda1997x_init_state,
+};
+
 /* -----------------------------------------------------------------------------
  * v4l2_controls
  */
@@ -2588,6 +2591,7 @@ static int tda1997x_probe(struct i2c_client *client)
 	/* initialize subdev */
 	sd = &state->sd;
 	v4l2_i2c_subdev_init(sd, client, &tda1997x_subdev_ops);
+	sd->internal_ops = &tda1997x_internal_ops;
 	snprintf(sd->name, sizeof(sd->name), "%s %d-%04x",
 		 id->name, i2c_adapter_id(client->adapter),
 		 client->addr);
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 76a92bfb6fde..9fc586cfdcd8 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1209,8 +1209,8 @@ static int tvp5150_get_mbus_config(struct v4l2_subdev *sd,
 /****************************************************************************
 			V4L2 subdev pad ops
  ****************************************************************************/
-static int tvp5150_init_cfg(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state)
+static int tvp5150_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
 {
 	struct tvp5150 *decoder = to_tvp5150(sd);
 	v4l2_std_id std;
@@ -1722,7 +1722,6 @@ static const struct v4l2_subdev_vbi_ops tvp5150_vbi_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops tvp5150_pad_ops = {
-	.init_cfg = tvp5150_init_cfg,
 	.enum_mbus_code = tvp5150_enum_mbus_code,
 	.enum_frame_size = tvp5150_enum_frame_size,
 	.set_fmt = tvp5150_fill_fmt,
@@ -1741,6 +1740,7 @@ static const struct v4l2_subdev_ops tvp5150_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops tvp5150_internal_ops = {
+	.init_state = tvp5150_init_state,
 	.registered = tvp5150_registered,
 	.open = tvp5150_open,
 	.close = tvp5150_close,
diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 8bf90e2bd856..15b905f66ab7 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -346,8 +346,8 @@ mei_csi_get_pad_format(struct v4l2_subdev *sd,
 	}
 }
 
-static int mei_csi_init_cfg(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state)
+static int mei_csi_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *mbusformat;
 	struct mei_csi *csi = sd_to_csi(sd);
@@ -554,7 +554,6 @@ static const struct v4l2_subdev_video_ops mei_csi_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mei_csi_pad_ops = {
-	.init_cfg = mei_csi_init_cfg,
 	.get_fmt = mei_csi_get_fmt,
 	.set_fmt = mei_csi_set_fmt,
 };
@@ -564,6 +563,10 @@ static const struct v4l2_subdev_ops mei_csi_subdev_ops = {
 	.pad = &mei_csi_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops mei_csi_internal_ops = {
+	.init_state = mei_csi_init_state,
+};
+
 static const struct media_entity_operations mei_csi_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -747,6 +750,7 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
 
 	csi->subdev.dev = &cldev->dev;
 	v4l2_subdev_init(&csi->subdev, &mei_csi_subdev_ops);
+	csi->subdev.internal_ops = &mei_csi_internal_ops;
 	v4l2_set_subdevdata(&csi->subdev, csi);
 	csi->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
 			    V4L2_SUBDEV_FL_HAS_EVENTS;
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 0171ea7b834d..fead5426830e 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -418,8 +418,8 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int csi2rx_init_cfg(struct v4l2_subdev *subdev,
-			   struct v4l2_subdev_state *state)
+static int csi2rx_init_state(struct v4l2_subdev *subdev,
+			     struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_format format = {
 		.pad = CSI2RX_PAD_SINK,
@@ -441,7 +441,6 @@ static int csi2rx_init_cfg(struct v4l2_subdev *subdev,
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= csi2rx_set_fmt,
-	.init_cfg	= csi2rx_init_cfg,
 };
 
 static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
@@ -453,6 +452,10 @@ static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
 	.pad		= &csi2rx_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops csi2rx_internal_ops = {
+	.init_state	= csi2rx_init_state,
+};
+
 static const struct media_entity_operations csi2rx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -663,6 +666,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 	csi2rx->subdev.owner = THIS_MODULE;
 	csi2rx->subdev.dev = &pdev->dev;
 	v4l2_subdev_init(&csi2rx->subdev, &csi2rx_subdev_ops);
+	csi2rx->subdev.internal_ops = &csi2rx_internal_ops;
 	v4l2_set_subdevdata(&csi2rx->subdev, &pdev->dev);
 	snprintf(csi2rx->subdev.name, sizeof(csi2rx->subdev.name),
 		 "%s.%s", KBUILD_MODNAME, dev_name(&pdev->dev));
diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
index 87a2d092aad2..fee73260bb1e 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -435,8 +435,8 @@ static int csi2dc_s_stream(struct v4l2_subdev *csi2dc_sd, int enable)
 	return ret;
 }
 
-static int csi2dc_init_cfg(struct v4l2_subdev *csi2dc_sd,
-			   struct v4l2_subdev_state *sd_state)
+static int csi2dc_init_state(struct v4l2_subdev *csi2dc_sd,
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *v4l2_try_fmt =
 		v4l2_subdev_state_get_format(sd_state, 0);
@@ -461,7 +461,6 @@ static const struct v4l2_subdev_pad_ops csi2dc_pad_ops = {
 	.enum_mbus_code = csi2dc_enum_mbus_code,
 	.set_fmt = csi2dc_set_fmt,
 	.get_fmt = csi2dc_get_fmt,
-	.init_cfg = csi2dc_init_cfg,
 };
 
 static const struct v4l2_subdev_video_ops csi2dc_video_ops = {
@@ -473,6 +472,10 @@ static const struct v4l2_subdev_ops csi2dc_subdev_ops = {
 	.video = &csi2dc_video_ops,
 };
 
+static const struct v4l2_subdev_internal_ops csi2dc_internal_ops = {
+	.init_state = csi2dc_init_state,
+};
+
 static int csi2dc_async_bound(struct v4l2_async_notifier *notifier,
 			      struct v4l2_subdev *subdev,
 			      struct v4l2_async_connection *asd)
@@ -677,6 +680,7 @@ static int csi2dc_probe(struct platform_device *pdev)
 	}
 
 	v4l2_subdev_init(&csi2dc->csi2dc_sd, &csi2dc_subdev_ops);
+	csi2dc->csi2dc_sd.internal_ops = &csi2dc_internal_ops;
 
 	csi2dc->csi2dc_sd.owner = THIS_MODULE;
 	csi2dc->csi2dc_sd.dev = dev;
diff --git a/drivers/media/platform/microchip/microchip-isc-scaler.c b/drivers/media/platform/microchip/microchip-isc-scaler.c
index 58dffbc9fbcb..e83463543e21 100644
--- a/drivers/media/platform/microchip/microchip-isc-scaler.c
+++ b/drivers/media/platform/microchip/microchip-isc-scaler.c
@@ -145,8 +145,8 @@ static int isc_scaler_g_sel(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int isc_scaler_init_cfg(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *sd_state)
+static int isc_scaler_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *v4l2_try_fmt =
 		v4l2_subdev_state_get_format(sd_state, 0);
@@ -170,7 +170,6 @@ static const struct v4l2_subdev_pad_ops isc_scaler_pad_ops = {
 	.set_fmt = isc_scaler_set_fmt,
 	.get_fmt = isc_scaler_get_fmt,
 	.get_selection = isc_scaler_g_sel,
-	.init_cfg = isc_scaler_init_cfg,
 };
 
 static const struct media_entity_operations isc_scaler_entity_ops = {
@@ -181,11 +180,16 @@ static const struct v4l2_subdev_ops xisc_scaler_subdev_ops = {
 	.pad = &isc_scaler_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops isc_scaler_internal_ops = {
+	.init_state = isc_scaler_init_state,
+};
+
 int isc_scaler_init(struct isc_device *isc)
 {
 	int ret;
 
 	v4l2_subdev_init(&isc->scaler_sd, &xisc_scaler_subdev_ops);
+	isc->scaler_sd.internal_ops = &isc_scaler_internal_ops;
 
 	isc->scaler_sd.owner = THIS_MODULE;
 	isc->scaler_sd.dev = isc->dev;
diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index a2c748217376..b12e2435ef60 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1122,8 +1122,8 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	return 0;
 }
 
-static int mipi_csis_init_cfg(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state)
+static int mipi_csis_init_state(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = {
 		.pad = CSIS_PAD_SINK,
@@ -1163,7 +1163,6 @@ static const struct v4l2_subdev_video_ops mipi_csis_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mipi_csis_pad_ops = {
-	.init_cfg		= mipi_csis_init_cfg,
 	.enum_mbus_code		= mipi_csis_enum_mbus_code,
 	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= mipi_csis_set_fmt,
@@ -1176,6 +1175,10 @@ static const struct v4l2_subdev_ops mipi_csis_subdev_ops = {
 	.pad	= &mipi_csis_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops mipi_csis_internal_ops = {
+	.init_state		= mipi_csis_init_state,
+};
+
 /* -----------------------------------------------------------------------------
  * Media entity operations
  */
@@ -1350,6 +1353,7 @@ static int mipi_csis_subdev_init(struct mipi_csis_device *csis)
 	int ret;
 
 	v4l2_subdev_init(sd, &mipi_csis_subdev_ops);
+	sd->internal_ops = &mipi_csis_internal_ops;
 	sd->owner = THIS_MODULE;
 	snprintf(sd->name, sizeof(sd->name), "csis-%s",
 		 dev_name(csis->dev));
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index da29971acf26..1d6248211c76 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1728,8 +1728,8 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state)
+static int imx7_csi_init_state(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *sd_state)
 {
 	const struct imx7_csi_pixfmt *cc;
 	int i;
@@ -2005,7 +2005,6 @@ static const struct v4l2_subdev_video_ops imx7_csi_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops imx7_csi_pad_ops = {
-	.init_cfg	= imx7_csi_init_cfg,
 	.enum_mbus_code	= imx7_csi_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= imx7_csi_set_fmt,
@@ -2018,6 +2017,7 @@ static const struct v4l2_subdev_ops imx7_csi_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops imx7_csi_internal_ops = {
+	.init_state	= imx7_csi_init_state,
 	.registered	= imx7_csi_registered,
 	.unregistered	= imx7_csi_unregistered,
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 9401261eb239..575f17337388 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -176,8 +176,8 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
 	return sd;
 }
 
-static int mxc_isi_crossbar_init_cfg(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_state *state)
+static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state)
 {
 	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
 	struct v4l2_subdev_krouting routing = { };
@@ -404,7 +404,6 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
-	.init_cfg = mxc_isi_crossbar_init_cfg,
 	.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = mxc_isi_crossbar_set_fmt,
@@ -417,6 +416,10 @@ static const struct v4l2_subdev_ops mxc_isi_crossbar_subdev_ops = {
 	.pad = &mxc_isi_crossbar_subdev_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops mxc_isi_crossbar_internal_ops = {
+	.init_state = mxc_isi_crossbar_init_state,
+};
+
 static const struct media_entity_operations mxc_isi_cross_entity_ops = {
 	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 	.link_validate	= v4l2_subdev_link_validate,
@@ -438,6 +441,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 	xbar->isi = isi;
 
 	v4l2_subdev_init(sd, &mxc_isi_crossbar_subdev_ops);
+	sd->internal_ops = &mxc_isi_crossbar_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	strscpy(sd->name, "crossbar", sizeof(sd->name));
 	sd->dev = isi->dev;
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index 14c6da392803..d76eb58deb09 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -341,8 +341,8 @@ mxc_isi_pipe_get_pad_compose(struct mxc_isi_pipe *pipe,
 	return v4l2_subdev_state_get_compose(state, pad);
 }
 
-static int mxc_isi_pipe_init_cfg(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *state)
+static int mxc_isi_pipe_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
 {
 	struct mxc_isi_pipe *pipe = to_isi_pipe(sd);
 	struct v4l2_mbus_framefmt *fmt_source;
@@ -682,7 +682,6 @@ static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_pad_ops mxc_isi_pipe_subdev_pad_ops = {
-	.init_cfg = mxc_isi_pipe_init_cfg,
 	.enum_mbus_code = mxc_isi_pipe_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = mxc_isi_pipe_set_fmt,
@@ -694,6 +693,10 @@ static const struct v4l2_subdev_ops mxc_isi_pipe_subdev_ops = {
 	.pad = &mxc_isi_pipe_subdev_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops mxc_isi_pipe_internal_ops = {
+	.init_state = mxc_isi_pipe_init_state,
+};
+
 /* -----------------------------------------------------------------------------
  * IRQ handling
  */
@@ -767,6 +770,7 @@ int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id)
 
 	sd = &pipe->sd;
 	v4l2_subdev_init(sd, &mxc_isi_pipe_subdev_ops);
+	sd->internal_ops = &mxc_isi_pipe_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	snprintf(sd->name, sizeof(sd->name), "mxc_isi.%d", pipe->id);
 	sd->dev = isi->dev;
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 02a4c546a90a..ba2e81f24965 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -437,8 +437,8 @@ static int imx8mq_mipi_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int imx8mq_mipi_csi_init_cfg(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_state *sd_state)
+static int imx8mq_mipi_csi_init_state(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *fmt_sink;
 	struct v4l2_mbus_framefmt *fmt_source;
@@ -535,7 +535,6 @@ static const struct v4l2_subdev_video_ops imx8mq_mipi_csi_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops imx8mq_mipi_csi_pad_ops = {
-	.init_cfg		= imx8mq_mipi_csi_init_cfg,
 	.enum_mbus_code		= imx8mq_mipi_csi_enum_mbus_code,
 	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= imx8mq_mipi_csi_set_fmt,
@@ -546,6 +545,10 @@ static const struct v4l2_subdev_ops imx8mq_mipi_csi_subdev_ops = {
 	.pad	= &imx8mq_mipi_csi_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops imx8mq_mipi_csi_internal_ops = {
+	.init_state		= imx8mq_mipi_csi_init_state,
+};
+
 /* -----------------------------------------------------------------------------
  * Media entity operations
  */
@@ -760,6 +763,7 @@ static int imx8mq_mipi_csi_subdev_init(struct csi_state *state)
 	int ret;
 
 	v4l2_subdev_init(sd, &imx8mq_mipi_csi_subdev_ops);
+	sd->internal_ops = &imx8mq_mipi_csi_internal_ops;
 	sd->owner = THIS_MODULE;
 	snprintf(sd->name, sizeof(sd->name), "%s %s",
 		 MIPI_CSI2_SUBDEV_NAME, dev_name(state->dev));
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 04e61e783045..d20f4eff93a4 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -530,8 +530,8 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int rzg2l_csi2_init_config(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_state *sd_state)
+static int rzg2l_csi2_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = { .pad = RZG2L_CSI2_SINK, };
 
@@ -582,7 +582,6 @@ static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
 
 static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
 	.enum_mbus_code = rzg2l_csi2_enum_mbus_code,
-	.init_cfg = rzg2l_csi2_init_config,
 	.enum_frame_size = rzg2l_csi2_enum_frame_size,
 	.set_fmt = rzg2l_csi2_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
@@ -593,6 +592,10 @@ static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {
 	.pad	= &rzg2l_csi2_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops rzg2l_csi2_internal_ops = {
+	.init_state = rzg2l_csi2_init_state,
+};
+
 /* -----------------------------------------------------------------------------
  * Async handling and registration of subdevices and links.
  */
@@ -777,6 +780,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 
 	csi2->subdev.dev = &pdev->dev;
 	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
+	csi2->subdev.internal_ops = &rzg2l_csi2_internal_ops;
 	v4l2_set_subdevdata(&csi2->subdev, &pdev->dev);
 	snprintf(csi2->subdev.name, sizeof(csi2->subdev.name),
 		 "csi-%s", dev_name(&pdev->dev));
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 17a59dfc8363..9f351a05893e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -168,8 +168,8 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int rzg2l_cru_ip_init_config(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_state *sd_state)
+static int rzg2l_cru_ip_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format fmt = { .pad = RZG2L_CRU_IP_SINK, };
 
@@ -192,7 +192,6 @@ static const struct v4l2_subdev_video_ops rzg2l_cru_ip_video_ops = {
 static const struct v4l2_subdev_pad_ops rzg2l_cru_ip_pad_ops = {
 	.enum_mbus_code = rzg2l_cru_ip_enum_mbus_code,
 	.enum_frame_size = rzg2l_cru_ip_enum_frame_size,
-	.init_cfg = rzg2l_cru_ip_init_config,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = rzg2l_cru_ip_set_format,
 };
@@ -202,6 +201,10 @@ static const struct v4l2_subdev_ops rzg2l_cru_ip_subdev_ops = {
 	.pad = &rzg2l_cru_ip_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops rzg2l_cru_ip_internal_ops = {
+	.init_state = rzg2l_cru_ip_init_state,
+};
+
 static const struct media_entity_operations rzg2l_cru_ip_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -213,6 +216,7 @@ int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru)
 
 	ip->subdev.dev = cru->dev;
 	v4l2_subdev_init(&ip->subdev, &rzg2l_cru_ip_subdev_ops);
+	ip->subdev.internal_ops = &rzg2l_cru_ip_internal_ops;
 	v4l2_set_subdevdata(&ip->subdev, cru);
 	snprintf(ip->subdev.name, sizeof(ip->subdev.name),
 		 "cru-ip-%s", dev_name(cru->dev));
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 758525a03289..a8535c6e2c46 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -264,7 +264,6 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 }
 
 static const struct v4l2_subdev_pad_ops brx_pad_ops = {
-	.init_cfg = vsp1_entity_init_cfg,
 	.enum_mbus_code = brx_enum_mbus_code,
 	.enum_frame_size = brx_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
index 50a5c0dc0e86..625776a9bda4 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
@@ -155,7 +155,6 @@ static int clu_set_format(struct v4l2_subdev *subdev,
  */
 
 static const struct v4l2_subdev_pad_ops clu_pad_ops = {
-	.init_cfg = vsp1_entity_init_cfg,
 	.enum_mbus_code = clu_enum_mbus_code,
 	.enum_frame_size = clu_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 0280b8ff7ba9..0a5a7f9cc870 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -170,33 +170,6 @@ vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
 	}
 }
 
-/*
- * vsp1_entity_init_cfg - Initialize formats on all pads
- * @subdev: V4L2 subdevice
- * @sd_state: V4L2 subdev state
- *
- * Initialize all pad formats with default values in the given subdev state.
- * This function can be used as a handler for the subdev pad::init_cfg
- * operation.
- */
-int vsp1_entity_init_cfg(struct v4l2_subdev *subdev,
-			 struct v4l2_subdev_state *sd_state)
-{
-	unsigned int pad;
-
-	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
-		struct v4l2_subdev_format format = {
-			.pad = pad,
-			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
-			       : V4L2_SUBDEV_FORMAT_ACTIVE,
-		};
-
-		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
-	}
-
-	return 0;
-}
-
 /*
  * vsp1_subdev_get_pad_format - Subdev pad get_fmt handler
  * @subdev: V4L2 subdevice
@@ -424,6 +397,29 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 	return ret;
 }
 
+static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
+				  struct v4l2_subdev_state *sd_state)
+{
+	unsigned int pad;
+
+	/* Initialize all pad formats with default values. */
+	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
+		struct v4l2_subdev_format format = {
+			.pad = pad,
+			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
+			       : V4L2_SUBDEV_FORMAT_ACTIVE,
+		};
+
+		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops vsp1_entity_internal_ops = {
+	.init_state = vsp1_entity_init_state,
+};
+
 /* -----------------------------------------------------------------------------
  * Media Operations
  */
@@ -658,6 +654,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	/* Initialize the V4L2 subdev. */
 	subdev = &entity->subdev;
 	v4l2_subdev_init(subdev, ops);
+	subdev->internal_ops = &vsp1_entity_internal_ops;
 
 	subdev->entity.function = function;
 	subdev->entity.ops = &vsp1->media_ops;
@@ -666,7 +663,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	snprintf(subdev->name, sizeof(subdev->name), "%s %s",
 		 dev_name(vsp1->dev), name);
 
-	vsp1_entity_init_cfg(subdev, NULL);
+	vsp1_entity_init_state(subdev, NULL);
 
 	/*
 	 * Allocate the subdev state to store formats and selection
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index 8c737cadee81..735f32dde4b5 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -146,8 +146,6 @@ struct v4l2_rect *
 vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
 			      struct v4l2_subdev_state *sd_state,
 			      unsigned int pad, unsigned int target);
-int vsp1_entity_init_cfg(struct v4l2_subdev *subdev,
-			 struct v4l2_subdev_state *sd_state);
 
 void vsp1_entity_route_setup(struct vsp1_entity *entity,
 			     struct vsp1_pipeline *pipe,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
index 6342ac7bdf54..bc1299c29ac9 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
@@ -113,7 +113,6 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
 }
 
 static const struct v4l2_subdev_pad_ops hsit_pad_ops = {
-	.init_cfg = vsp1_entity_init_cfg,
 	.enum_mbus_code = hsit_enum_mbus_code,
 	.enum_frame_size = hsit_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
index 75c24df41a7a..b1d21a54837b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
@@ -68,7 +68,6 @@ static int lif_set_format(struct v4l2_subdev *subdev,
 }
 
 static const struct v4l2_subdev_pad_ops lif_pad_ops = {
-	.init_cfg = vsp1_entity_init_cfg,
 	.enum_mbus_code = lif_enum_mbus_code,
 	.enum_frame_size = lif_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
index ac6802a325f5..451d24ab0b56 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lut.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
@@ -131,7 +131,6 @@ static int lut_set_format(struct v4l2_subdev *subdev,
  */
 
 static const struct v4l2_subdev_pad_ops lut_pad_ops = {
-	.init_cfg = vsp1_entity_init_cfg,
 	.enum_mbus_code = lut_enum_mbus_code,
 	.enum_frame_size = lut_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index cb3ab351b7de..09fb6ffa14e2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -240,7 +240,6 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 }
 
 static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
-	.init_cfg = vsp1_entity_init_cfg,
 	.enum_mbus_code = vsp1_rwpf_enum_mbus_code,
 	.enum_frame_size = vsp1_rwpf_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index 2dd6f8575614..11e008aa9f20 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -252,7 +252,6 @@ static int sru_set_format(struct v4l2_subdev *subdev,
 }
 
 static const struct v4l2_subdev_pad_ops sru_pad_ops = {
-	.init_cfg = vsp1_entity_init_cfg,
 	.enum_mbus_code = sru_enum_mbus_code,
 	.enum_frame_size = sru_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
index 59ff4ae46cea..d89f1197b86c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -239,7 +239,6 @@ static int uds_set_format(struct v4l2_subdev *subdev,
  */
 
 static const struct v4l2_subdev_pad_ops uds_pad_ops = {
-	.init_cfg = vsp1_entity_init_cfg,
 	.enum_mbus_code = uds_enum_mbus_code,
 	.enum_frame_size = uds_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
index d84d10f35090..f66936a28a2a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
@@ -174,7 +174,6 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
  */
 
 static const struct v4l2_subdev_pad_ops uif_pad_ops = {
-	.init_cfg = vsp1_entity_init_cfg,
 	.enum_mbus_code = uif_enum_mbus_code,
 	.enum_frame_size = uif_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 47f4353a1784..e6642a2167ef 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -270,8 +270,8 @@ static int rkisp1_csi_enum_mbus_code(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
-static int rkisp1_csi_init_config(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_state *sd_state)
+static int rkisp1_csi_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 
@@ -405,7 +405,6 @@ static const struct v4l2_subdev_video_ops rkisp1_csi_video_ops = {
 
 static const struct v4l2_subdev_pad_ops rkisp1_csi_pad_ops = {
 	.enum_mbus_code = rkisp1_csi_enum_mbus_code,
-	.init_cfg = rkisp1_csi_init_config,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = rkisp1_csi_set_fmt,
 };
@@ -415,6 +414,10 @@ static const struct v4l2_subdev_ops rkisp1_csi_ops = {
 	.pad = &rkisp1_csi_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops rkisp1_csi_internal_ops = {
+	.init_state = rkisp1_csi_init_state,
+};
+
 int rkisp1_csi_register(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_csi *csi = &rkisp1->csi;
@@ -426,6 +429,7 @@ int rkisp1_csi_register(struct rkisp1_device *rkisp1)
 
 	sd = &csi->sd;
 	v4l2_subdev_init(sd, &rkisp1_csi_ops);
+	sd->internal_ops = &rkisp1_csi_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sd->entity.ops = &rkisp1_csi_media_ops;
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 96353648c032..ca6703bfd27b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -409,8 +409,8 @@ static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_state *sd_state)
+static int rkisp1_isp_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 	struct v4l2_rect *sink_crop, *src_crop;
@@ -769,7 +769,6 @@ static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
 	.enum_frame_size = rkisp1_isp_enum_frame_size,
 	.get_selection = rkisp1_isp_get_selection,
 	.set_selection = rkisp1_isp_set_selection,
-	.init_cfg = rkisp1_isp_init_config,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = rkisp1_isp_set_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
@@ -880,6 +879,10 @@ static const struct v4l2_subdev_ops rkisp1_isp_ops = {
 	.pad = &rkisp1_isp_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops rkisp1_isp_internal_ops = {
+	.init_state = rkisp1_isp_init_state,
+};
+
 int rkisp1_isp_register(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_isp *isp = &rkisp1->isp;
@@ -890,6 +893,7 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
 	isp->rkisp1 = rkisp1;
 
 	v4l2_subdev_init(sd, &rkisp1_isp_ops);
+	sd->internal_ops = &rkisp1_isp_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	sd->entity.ops = &rkisp1_isp_media_ops;
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 9f94b9f60c35..f7af360dcb28 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -366,8 +366,8 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_state *sd_state)
+static int rkisp1_rsz_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 	struct v4l2_rect *sink_crop;
@@ -605,7 +605,6 @@ static const struct v4l2_subdev_pad_ops rkisp1_rsz_pad_ops = {
 	.enum_mbus_code = rkisp1_rsz_enum_mbus_code,
 	.get_selection = rkisp1_rsz_get_selection,
 	.set_selection = rkisp1_rsz_set_selection,
-	.init_cfg = rkisp1_rsz_init_config,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = rkisp1_rsz_set_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
@@ -652,6 +651,10 @@ static const struct v4l2_subdev_ops rkisp1_rsz_ops = {
 	.pad = &rkisp1_rsz_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops rkisp1_rsz_internal_ops = {
+	.init_state = rkisp1_rsz_init_state,
+};
+
 static void rkisp1_rsz_unregister(struct rkisp1_resizer *rsz)
 {
 	if (!rsz->rkisp1)
@@ -681,6 +684,7 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 	}
 
 	v4l2_subdev_init(sd, &rkisp1_rsz_ops);
+	sd->internal_ops = &rkisp1_rsz_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sd->entity.ops = &rkisp1_rsz_media_ops;
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index ad13d447d483..097a3a08ef7d 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -211,6 +211,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 
 	/* Initialize subdev */
 	v4l2_subdev_init(subdev, &sun4i_csi_subdev_ops);
+	subdev->internal_ops = &sun4i_csi_subdev_internal_ops;
 	subdev->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	subdev->owner = THIS_MODULE;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
index 8eeed87bfb13..4e0c2df45d4d 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
@@ -89,6 +89,7 @@ enum csi_subdev_pads {
 };
 
 extern const struct v4l2_subdev_ops sun4i_csi_subdev_ops;
+extern const struct v4l2_subdev_internal_ops sun4i_csi_subdev_internal_ops;
 
 struct sun4i_csi_format {
 	u32			mbus;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index c37bb1d76ef6..744197b0fccb 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -266,8 +266,8 @@ static const struct v4l2_mbus_framefmt sun4i_csi_pad_fmt_default = {
 	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
 };
 
-static int sun4i_csi_subdev_init_cfg(struct v4l2_subdev *subdev,
-				     struct v4l2_subdev_state *sd_state)
+static int sun4i_csi_subdev_init_state(struct v4l2_subdev *subdev,
+				       struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *fmt;
 
@@ -334,7 +334,6 @@ sun4i_csi_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 
 static const struct v4l2_subdev_pad_ops sun4i_csi_subdev_pad_ops = {
 	.link_validate	= v4l2_subdev_link_validate_default,
-	.init_cfg	= sun4i_csi_subdev_init_cfg,
 	.get_fmt	= sun4i_csi_subdev_get_fmt,
 	.set_fmt	= sun4i_csi_subdev_set_fmt,
 	.enum_mbus_code	= sun4i_csi_subdev_enum_mbus_code,
@@ -344,6 +343,10 @@ const struct v4l2_subdev_ops sun4i_csi_subdev_ops = {
 	.pad = &sun4i_csi_subdev_pad_ops,
 };
 
+const struct v4l2_subdev_internal_ops sun4i_csi_subdev_internal_ops = {
+	.init_state	= sun4i_csi_subdev_init_state,
+};
+
 int sun4i_csi_v4l2_register(struct sun4i_csi *csi)
 {
 	struct video_device *vdev = &csi->vdev;
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index d57481feee05..d006d9dd0170 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -501,8 +501,8 @@ sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 	mbus_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int sun6i_csi_bridge_init_cfg(struct v4l2_subdev *subdev,
-				     struct v4l2_subdev_state *state)
+static int sun6i_csi_bridge_init_state(struct v4l2_subdev *subdev,
+				       struct v4l2_subdev_state *state)
 {
 	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
 	unsigned int pad = SUN6I_CSI_BRIDGE_PAD_SINK;
@@ -581,7 +581,6 @@ static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
 }
 
 static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops = {
-	.init_cfg	= sun6i_csi_bridge_init_cfg,
 	.enum_mbus_code	= sun6i_csi_bridge_enum_mbus_code,
 	.get_fmt	= sun6i_csi_bridge_get_fmt,
 	.set_fmt	= sun6i_csi_bridge_set_fmt,
@@ -592,6 +591,10 @@ static const struct v4l2_subdev_ops sun6i_csi_bridge_subdev_ops = {
 	.pad	= &sun6i_csi_bridge_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops sun6i_csi_bridge_internal_ops = {
+	.init_state	= sun6i_csi_bridge_init_state,
+};
+
 /* Media Entity */
 
 static const struct media_entity_operations sun6i_csi_bridge_entity_ops = {
@@ -782,6 +785,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
+	subdev->internal_ops = &sun6i_csi_bridge_internal_ops;
 	strscpy(subdev->name, SUN6I_CSI_BRIDGE_NAME, sizeof(subdev->name));
 	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	subdev->owner = THIS_MODULE;
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index d2c9f5d20496..f9d4dc45b490 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -305,8 +305,8 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 	mbus_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int sun6i_mipi_csi2_init_cfg(struct v4l2_subdev *subdev,
-				    struct v4l2_subdev_state *state)
+static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
+				      struct v4l2_subdev_state *state)
 {
 	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
 	unsigned int pad = SUN6I_MIPI_CSI2_PAD_SINK;
@@ -385,7 +385,6 @@ static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
 }
 
 static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops = {
-	.init_cfg	= sun6i_mipi_csi2_init_cfg,
 	.enum_mbus_code	= sun6i_mipi_csi2_enum_mbus_code,
 	.get_fmt	= sun6i_mipi_csi2_get_fmt,
 	.set_fmt	= sun6i_mipi_csi2_set_fmt,
@@ -396,6 +395,10 @@ static const struct v4l2_subdev_ops sun6i_mipi_csi2_subdev_ops = {
 	.pad	= &sun6i_mipi_csi2_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops sun6i_mipi_csi2_internal_ops = {
+	.init_state	= sun6i_mipi_csi2_init_state,
+};
+
 /* Media Entity */
 
 static const struct media_entity_operations sun6i_mipi_csi2_entity_ops = {
@@ -504,6 +507,7 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
+	subdev->internal_ops = &sun6i_mipi_csi2_internal_ops;
 	strscpy(subdev->name, SUN6I_MIPI_CSI2_NAME, sizeof(subdev->name));
 	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	subdev->owner = THIS_MODULE;
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index d6275954af98..4a5698eb12b7 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -338,8 +338,8 @@ sun8i_a83t_mipi_csi2_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 	mbus_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int sun8i_a83t_mipi_csi2_init_cfg(struct v4l2_subdev *subdev,
-					 struct v4l2_subdev_state *state)
+static int sun8i_a83t_mipi_csi2_init_state(struct v4l2_subdev *subdev,
+					   struct v4l2_subdev_state *state)
 {
 	struct sun8i_a83t_mipi_csi2_device *csi2_dev =
 		v4l2_get_subdevdata(subdev);
@@ -422,7 +422,6 @@ static int sun8i_a83t_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
 }
 
 static const struct v4l2_subdev_pad_ops sun8i_a83t_mipi_csi2_pad_ops = {
-	.init_cfg	= sun8i_a83t_mipi_csi2_init_cfg,
 	.enum_mbus_code	= sun8i_a83t_mipi_csi2_enum_mbus_code,
 	.get_fmt	= sun8i_a83t_mipi_csi2_get_fmt,
 	.set_fmt	= sun8i_a83t_mipi_csi2_set_fmt,
@@ -433,6 +432,10 @@ static const struct v4l2_subdev_ops sun8i_a83t_mipi_csi2_subdev_ops = {
 	.pad	= &sun8i_a83t_mipi_csi2_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops sun8i_a83t_mipi_csi2_internal_ops = {
+	.init_state	= sun8i_a83t_mipi_csi2_init_state,
+};
+
 /* Media Entity */
 
 static const struct media_entity_operations sun8i_a83t_mipi_csi2_entity_ops = {
@@ -542,6 +545,7 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun8i_a83t_mipi_csi2_subdev_ops);
+	subdev->internal_ops = &sun8i_a83t_mipi_csi2_internal_ops;
 	strscpy(subdev->name, SUN8I_A83T_MIPI_CSI2_NAME, sizeof(subdev->name));
 	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	subdev->owner = THIS_MODULE;
diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 61433744c6c4..4afc2ad00330 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -721,8 +721,8 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_state *state)
+static int cal_camerarx_sd_init_state(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_format format = {
 		.which = state ? V4L2_SUBDEV_FORMAT_TRY
@@ -782,7 +782,6 @@ static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
-	.init_cfg = cal_camerarx_sd_init_cfg,
 	.enum_mbus_code = cal_camerarx_sd_enum_mbus_code,
 	.enum_frame_size = cal_camerarx_sd_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
@@ -795,6 +794,10 @@ static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
 	.pad = &cal_camerarx_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops cal_camerarx_internal_ops = {
+	.init_state = cal_camerarx_sd_init_state,
+};
+
 static struct media_entity_operations cal_camerarx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -846,6 +849,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	/* Initialize the V4L2 subdev and media entity. */
 	sd = &phy->subdev;
 	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
+	sd->internal_ops = &cal_camerarx_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 06a28531ed02..31e9e92e723e 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -282,8 +282,8 @@ static int video_mux_set_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int video_mux_init_cfg(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state)
+static int video_mux_init_state(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state)
 {
 	struct video_mux *vmux = v4l2_subdev_to_video_mux(sd);
 	struct v4l2_mbus_framefmt *mbusformat;
@@ -302,7 +302,6 @@ static int video_mux_init_cfg(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_pad_ops video_mux_pad_ops = {
-	.init_cfg = video_mux_init_cfg,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = video_mux_set_format,
 };
@@ -312,6 +311,10 @@ static const struct v4l2_subdev_ops video_mux_subdev_ops = {
 	.video = &video_mux_subdev_video_ops,
 };
 
+static const struct v4l2_subdev_internal_ops video_mux_internal_ops = {
+	.init_state = video_mux_init_state,
+};
+
 static int video_mux_notify_bound(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *sd,
 				  struct v4l2_async_connection *asd)
@@ -400,6 +403,7 @@ static int video_mux_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, vmux);
 
 	v4l2_subdev_init(&vmux->subdev, &video_mux_subdev_ops);
+	vmux->subdev.internal_ops = &video_mux_internal_ops;
 	snprintf(vmux->subdev.name, sizeof(vmux->subdev.name), "%pOFn", np);
 	vmux->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	vmux->subdev.dev = dev;
diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index bca8ec94ee35..f953d5474ae0 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -661,8 +661,8 @@ __xcsi2rxss_get_pad_format(struct xcsi2rxss_state *xcsi2rxss,
 	}
 }
 
-static int xcsi2rxss_init_cfg(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state)
+static int xcsi2rxss_init_state(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state)
 {
 	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
 	struct v4l2_mbus_framefmt *format;
@@ -780,7 +780,6 @@ static const struct v4l2_subdev_video_ops xcsi2rxss_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops xcsi2rxss_pad_ops = {
-	.init_cfg = xcsi2rxss_init_cfg,
 	.get_fmt = xcsi2rxss_get_format,
 	.set_fmt = xcsi2rxss_set_format,
 	.enum_mbus_code = xcsi2rxss_enum_mbus_code,
@@ -793,6 +792,10 @@ static const struct v4l2_subdev_ops xcsi2rxss_ops = {
 	.pad = &xcsi2rxss_pad_ops
 };
 
+static const struct v4l2_subdev_internal_ops xcsi2rxss_internal_ops = {
+	.init_state = xcsi2rxss_init_state,
+};
+
 static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
 {
 	struct device *dev = xcsi2rxss->dev;
@@ -970,6 +973,7 @@ static int xcsi2rxss_probe(struct platform_device *pdev)
 	/* Initialize V4L2 subdevice and media entity */
 	subdev = &xcsi2rxss->subdev;
 	v4l2_subdev_init(subdev, &xcsi2rxss_ops);
+	subdev->internal_ops = &xcsi2rxss_internal_ops;
 	subdev->dev = dev;
 	strscpy(subdev->name, dev_name(dev), sizeof(subdev->name));
 	subdev->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index a2fb32c97c84..d72ed086e00b 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -150,8 +150,8 @@ static bool vimc_debayer_src_code_is_valid(u32 code)
 	return false;
 }
 
-static int vimc_debayer_init_cfg(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state)
+static int vimc_debayer_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state)
 {
 	struct vimc_debayer_device *vdebayer = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
@@ -307,7 +307,6 @@ static int vimc_debayer_set_fmt(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_pad_ops vimc_debayer_pad_ops = {
-	.init_cfg		= vimc_debayer_init_cfg,
 	.enum_mbus_code		= vimc_debayer_enum_mbus_code,
 	.enum_frame_size	= vimc_debayer_enum_frame_size,
 	.get_fmt		= vimc_debayer_get_fmt,
@@ -395,6 +394,10 @@ static const struct v4l2_subdev_ops vimc_debayer_ops = {
 	.video = &vimc_debayer_video_ops,
 };
 
+static const struct v4l2_subdev_internal_ops vimc_debayer_internal_ops = {
+	.init_state = vimc_debayer_init_state,
+};
+
 static unsigned int vimc_debayer_get_val(const u8 *bytes,
 					 const unsigned int n_bytes)
 {
@@ -595,6 +598,8 @@ static struct vimc_ent_device *vimc_debayer_add(struct vimc_device *vimc,
 	if (ret)
 		goto err_free_hdl;
 
+	vdebayer->sd.internal_ops = &vimc_debayer_internal_ops;
+
 	vdebayer->ved.process_frame = vimc_debayer_process_frame;
 	vdebayer->ved.dev = vimc->mdev.dev;
 	vdebayer->mean_win_size = vimc_debayer_ctrl_mean_win_size.def;
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index f6592a789f1e..afe13d6af321 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -70,8 +70,8 @@ vimc_scaler_get_crop_bound_sink(const struct v4l2_mbus_framefmt *sink_fmt)
 	return r;
 }
 
-static int vimc_scaler_init_cfg(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state)
+static int vimc_scaler_init_state(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *mf;
 	struct v4l2_rect *r;
@@ -292,7 +292,6 @@ static int vimc_scaler_set_selection(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_pad_ops vimc_scaler_pad_ops = {
-	.init_cfg		= vimc_scaler_init_cfg,
 	.enum_mbus_code		= vimc_scaler_enum_mbus_code,
 	.enum_frame_size	= vimc_scaler_enum_frame_size,
 	.get_fmt		= vimc_scaler_get_fmt,
@@ -347,6 +346,10 @@ static const struct v4l2_subdev_ops vimc_scaler_ops = {
 	.video = &vimc_scaler_video_ops,
 };
 
+static const struct v4l2_subdev_internal_ops vimc_scaler_internal_ops = {
+	.init_state = vimc_scaler_init_state,
+};
+
 static void vimc_scaler_fill_src_frame(const struct vimc_scaler_device *const vscaler,
 				    const u8 *const sink_frame)
 {
@@ -424,6 +427,8 @@ static struct vimc_ent_device *vimc_scaler_add(struct vimc_device *vimc,
 		return ERR_PTR(ret);
 	}
 
+	vscaler->sd.internal_ops = &vimc_scaler_internal_ops;
+
 	vscaler->ved.process_frame = vimc_scaler_process_frame;
 	vscaler->ved.dev = vimc->mdev.dev;
 
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 676ab503f0ca..5e34b1aed95e 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -41,8 +41,8 @@ static const struct v4l2_mbus_framefmt fmt_default = {
 	.colorspace = V4L2_COLORSPACE_SRGB,
 };
 
-static int vimc_sensor_init_cfg(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state)
+static int vimc_sensor_init_state(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state)
 {
 	unsigned int i;
 
@@ -183,7 +183,6 @@ static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_pad_ops vimc_sensor_pad_ops = {
-	.init_cfg		= vimc_sensor_init_cfg,
 	.enum_mbus_code		= vimc_sensor_enum_mbus_code,
 	.enum_frame_size	= vimc_sensor_enum_frame_size,
 	.get_fmt		= vimc_sensor_get_fmt,
@@ -294,6 +293,10 @@ static const struct v4l2_subdev_ops vimc_sensor_ops = {
 	.video = &vimc_sensor_video_ops,
 };
 
+static const struct v4l2_subdev_internal_ops vimc_sensor_internal_ops = {
+	.init_state = vimc_sensor_init_state,
+};
+
 static int vimc_sensor_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct vimc_sensor_device *vsensor =
@@ -429,6 +432,8 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
 	if (ret)
 		goto err_free_tpg;
 
+	vsensor->sd.internal_ops = &vimc_sensor_internal_ops;
+
 	vsensor->ved.process_frame = vimc_sensor_process_frame;
 	vsensor->ved.dev = vimc->mdev.dev;
 
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 89290342e0bf..b7acffa95ba9 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1472,9 +1472,11 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 	 * There can be no race at this point, but we lock the state anyway to
 	 * satisfy lockdep checks.
 	 */
-	v4l2_subdev_lock_state(state);
-	ret = v4l2_subdev_call(sd, pad, init_cfg, state);
-	v4l2_subdev_unlock_state(state);
+	if (sd->internal_ops && sd->internal_ops->init_state) {
+		v4l2_subdev_lock_state(state);
+		sd->internal_ops->init_state(sd, state);
+		v4l2_subdev_unlock_state(state);
+	}
 
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		goto err;
diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 61d69f19657e..8bd9be49cc08 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -448,7 +448,6 @@ static int prp_registered(struct v4l2_subdev *sd)
 }
 
 static const struct v4l2_subdev_pad_ops prp_pad_ops = {
-	.init_cfg = imx_media_init_cfg,
 	.enum_mbus_code = prp_enum_mbus_code,
 	.get_fmt = prp_get_fmt,
 	.set_fmt = prp_set_fmt,
@@ -472,6 +471,7 @@ static const struct v4l2_subdev_ops prp_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops prp_internal_ops = {
+	.init_state = imx_media_init_state,
 	.registered = prp_registered,
 };
 
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index ec73c901079e..04878f07eeba 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1296,7 +1296,6 @@ static void prp_unregistered(struct v4l2_subdev *sd)
 }
 
 static const struct v4l2_subdev_pad_ops prp_pad_ops = {
-	.init_cfg = imx_media_init_cfg,
 	.enum_mbus_code = prp_enum_mbus_code,
 	.enum_frame_size = prp_enum_frame_size,
 	.get_fmt = prp_get_fmt,
@@ -1320,6 +1319,7 @@ static const struct v4l2_subdev_ops prp_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops prp_internal_ops = {
+	.init_state = imx_media_init_state,
 	.registered = prp_registered,
 	.unregistered = prp_unregistered,
 };
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 33902f5daf80..2fc94011fe4d 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1866,7 +1866,6 @@ static const struct v4l2_subdev_video_ops csi_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops csi_pad_ops = {
-	.init_cfg = imx_media_init_cfg,
 	.enum_mbus_code = csi_enum_mbus_code,
 	.enum_frame_size = csi_enum_frame_size,
 	.enum_frame_interval = csi_enum_frame_interval,
@@ -1884,6 +1883,7 @@ static const struct v4l2_subdev_ops csi_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops csi_internal_ops = {
+	.init_state = imx_media_init_state,
 	.registered = csi_registered,
 	.unregistered = csi_unregistered,
 };
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index ec4349ab48cd..1b5af8945e6b 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -426,10 +426,10 @@ EXPORT_SYMBOL_GPL(imx_media_init_mbus_fmt);
 
 /*
  * Initializes the TRY format to the ACTIVE format on all pads
- * of a subdev. Can be used as the .init_cfg pad operation.
+ * of a subdev. Can be used as the .init_state internal operation.
  */
-int imx_media_init_cfg(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_state *sd_state)
+int imx_media_init_state(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *mf_try;
 	unsigned int pad;
@@ -451,7 +451,7 @@ int imx_media_init_cfg(struct v4l2_subdev *sd,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(imx_media_init_cfg);
+EXPORT_SYMBOL_GPL(imx_media_init_state);
 
 /*
  * Default the colorspace in tryfmt to SRGB if set to an unsupported
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 792bca1d2d25..810b38ea3ab9 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -882,7 +882,6 @@ static void vdic_unregistered(struct v4l2_subdev *sd)
 }
 
 static const struct v4l2_subdev_pad_ops vdic_pad_ops = {
-	.init_cfg = imx_media_init_cfg,
 	.enum_mbus_code = vdic_enum_mbus_code,
 	.get_fmt = vdic_get_fmt,
 	.set_fmt = vdic_set_fmt,
@@ -906,6 +905,7 @@ static const struct v4l2_subdev_ops vdic_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops vdic_internal_ops = {
+	.init_state = imx_media_init_state,
 	.registered = vdic_registered,
 	.unregistered = vdic_unregistered,
 };
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 2640cd34dce2..f095d9134fee 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -192,8 +192,8 @@ static inline int imx_media_enum_ipu_formats(u32 *code, u32 index,
 int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 			    u32 width, u32 height, u32 code, u32 field,
 			    const struct imx_media_pixfmt **cc);
-int imx_media_init_cfg(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_state *sd_state);
+int imx_media_init_state(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_state *sd_state);
 void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 			       bool ic_route);
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 6906220ee89e..0d8b42061623 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -619,7 +619,6 @@ static const struct v4l2_subdev_video_ops csi2_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops csi2_pad_ops = {
-	.init_cfg = imx_media_init_cfg,
 	.get_fmt = csi2_get_fmt,
 	.set_fmt = csi2_set_fmt,
 };
@@ -631,6 +630,7 @@ static const struct v4l2_subdev_ops csi2_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
+	.init_state = imx_media_init_state,
 	.registered = csi2_registered,
 };
 
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
index b2ce0d4fae95..46a334b602f1 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
@@ -256,8 +256,8 @@ sun6i_isp_proc_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 	mbus_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int sun6i_isp_proc_init_cfg(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_state *state)
+static int sun6i_isp_proc_init_state(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *state)
 {
 	struct sun6i_isp_device *isp_dev = v4l2_get_subdevdata(subdev);
 	unsigned int pad = SUN6I_ISP_PROC_PAD_SINK_CSI;
@@ -336,7 +336,6 @@ static int sun6i_isp_proc_set_fmt(struct v4l2_subdev *subdev,
 }
 
 static const struct v4l2_subdev_pad_ops sun6i_isp_proc_pad_ops = {
-	.init_cfg	= sun6i_isp_proc_init_cfg,
 	.enum_mbus_code	= sun6i_isp_proc_enum_mbus_code,
 	.get_fmt	= sun6i_isp_proc_get_fmt,
 	.set_fmt	= sun6i_isp_proc_set_fmt,
@@ -347,6 +346,10 @@ static const struct v4l2_subdev_ops sun6i_isp_proc_subdev_ops = {
 	.pad	= &sun6i_isp_proc_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops sun6i_isp_proc_internal_ops = {
+	.init_state = sun6i_isp_proc_init_state,
+};
+
 /* Media Entity */
 
 static const struct media_entity_operations sun6i_isp_proc_entity_ops = {
@@ -501,6 +504,7 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp_dev)
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun6i_isp_proc_subdev_ops);
+	subdev->internal_ops = &sun6i_isp_proc_internal_ops;
 	strscpy(subdev->name, SUN6I_ISP_PROC_NAME, sizeof(subdev->name));
 	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	subdev->owner = THIS_MODULE;
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 33c8e5c93a3d..311b8dc7a644 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -771,7 +771,6 @@ struct v4l2_subdev_state {
 /**
  * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
  *
- * @init_cfg: initialize the subdev state to default values
  * @enum_mbus_code: callback for VIDIOC_SUBDEV_ENUM_MBUS_CODE() ioctl handler
  *		    code.
  * @enum_frame_size: callback for VIDIOC_SUBDEV_ENUM_FRAME_SIZE() ioctl handler
@@ -836,8 +835,6 @@ struct v4l2_subdev_state {
  *	directly, use v4l2_subdev_disable_streams() instead.
  */
 struct v4l2_subdev_pad_ops {
-	int (*init_cfg)(struct v4l2_subdev *sd,
-			struct v4l2_subdev_state *state);
 	int (*enum_mbus_code)(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_mbus_code_enum *code);
@@ -914,6 +911,8 @@ struct v4l2_subdev_ops {
 /**
  * struct v4l2_subdev_internal_ops - V4L2 subdev internal ops
  *
+ * @init_state: initialize the subdev state to default values
+ *
  * @registered: called when this subdev is registered. When called the v4l2_dev
  *	field is set to the correct v4l2_device.
  *
@@ -939,6 +938,8 @@ struct v4l2_subdev_ops {
  *	these ops.
  */
 struct v4l2_subdev_internal_ops {
+	int (*init_state)(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state);
 	int (*registered)(struct v4l2_subdev *sd);
 	void (*unregistered)(struct v4l2_subdev *sd);
 	int (*open)(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh);
-- 
Regards,

Laurent Pinchart


