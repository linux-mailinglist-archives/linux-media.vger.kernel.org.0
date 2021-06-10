Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C1C3A2EC5
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 16:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbhFJO6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 10:58:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45088 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhFJO6g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 10:58:36 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF1905C7D;
        Thu, 10 Jun 2021 16:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623336999;
        bh=EhT8NeyKoECwNasHSXXA7s1xdvgooXzazoH1jl/IbGY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FPYZ1X/RINoDmGzBtkG8/za9ZUDbFq1YpryR7BEli6wR6buiPhA/LriuojqkwdkZ1
         MhW/xdKvHAE4n/+q9Jo3OXC+om92nfsH1s9lxhSECJJngkySz/3zdcTtgDDr+aj9cC
         HX7qXi2VwSThOVMruKThXPDchgTsmD6jEPbtM9d4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 9/9] media: staging: changes for subdev-wide state struct
Date:   Thu, 10 Jun 2021 17:56:06 +0300
Message-Id: <20210610145606.3468235-10-tomi.valkeinen@ideasonboard.com>
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

This patch does the required changes for drivers/staging/media/

Note that this patch is meant to be squashed into the main patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 10 +--
 .../media/atomisp/i2c/atomisp-gc2235.c        | 10 +--
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 12 +--
 .../media/atomisp/i2c/atomisp-ov2680.c        | 10 +--
 .../media/atomisp/i2c/atomisp-ov2722.c        | 10 +--
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c | 10 +--
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 33 +++++---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 28 ++++---
 .../staging/media/atomisp/pci/atomisp_csi2.h  |  2 +-
 .../staging/media/atomisp/pci/atomisp_file.c  | 14 ++--
 .../staging/media/atomisp/pci/atomisp_fops.c  |  6 +-
 .../media/atomisp/pci/atomisp_subdev.c        | 64 ++++++++-------
 .../media/atomisp/pci/atomisp_subdev.h        |  9 +-
 .../staging/media/atomisp/pci/atomisp_tpg.c   | 12 +--
 drivers/staging/media/imx/imx-ic-prp.c        | 19 +++--
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 31 +++----
 drivers/staging/media/imx/imx-media-csi.c     | 82 ++++++++++---------
 drivers/staging/media/imx/imx-media-utils.c   |  4 +-
 drivers/staging/media/imx/imx-media-vdic.c    | 24 +++---
 drivers/staging/media/imx/imx-media.h         |  2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    | 12 +--
 drivers/staging/media/imx/imx7-media-csi.c    | 33 ++++----
 drivers/staging/media/imx/imx7-mipi-csis.c    | 34 ++++----
 drivers/staging/media/ipu3/ipu3-v4l2.c        | 26 +++---
 drivers/staging/media/omap4iss/iss_csi2.c     | 37 +++++----
 drivers/staging/media/omap4iss/iss_ipipe.c    | 37 +++++----
 drivers/staging/media/omap4iss/iss_ipipeif.c  | 47 ++++++-----
 drivers/staging/media/omap4iss/iss_resizer.c  | 39 +++++----
 drivers/staging/media/tegra-video/csi.c       | 10 +--
 drivers/staging/media/tegra-video/vi.c        | 24 +++---
 30 files changed, 370 insertions(+), 321 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 6c5a378a2eb5..687888d643df 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -965,7 +965,7 @@ static int startup(struct v4l2_subdev *sd)
 }
 
 static int gc0310_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -999,7 +999,7 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 		mutex_unlock(&dev->input_lock);
 		return 0;
 	}
@@ -1032,7 +1032,7 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int gc0310_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -1205,7 +1205,7 @@ static int gc0310_g_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int gc0310_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= MAX_FMTS)
@@ -1216,7 +1216,7 @@ static int gc0310_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int gc0310_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	int index = fse->index;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 38defa0f8151..9363c1a52ae9 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -769,7 +769,7 @@ static int startup(struct v4l2_subdev *sd)
 }
 
 static int gc2235_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -798,7 +798,7 @@ static int gc2235_set_fmt(struct v4l2_subdev *sd,
 	}
 	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 		mutex_unlock(&dev->input_lock);
 		return 0;
 	}
@@ -827,7 +827,7 @@ static int gc2235_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int gc2235_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -966,7 +966,7 @@ static int gc2235_g_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int gc2235_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= MAX_FMTS)
@@ -977,7 +977,7 @@ static int gc2235_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int gc2235_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	int index = fse->index;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 0a6f8f68b215..11196180a206 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -803,7 +803,7 @@ static int mt9m114_get_intg_factor(struct i2c_client *client,
 }
 
 static int mt9m114_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -824,7 +824,7 @@ static int mt9m114_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int mt9m114_set_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -848,7 +848,7 @@ static int mt9m114_set_fmt(struct v4l2_subdev *sd,
 
 	mt9m114_try_res(&width, &height);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 		return 0;
 	}
 	res_index = mt9m114_to_res(width, height);
@@ -1168,7 +1168,7 @@ static int mt9m114_s_exposure_metering(struct v4l2_subdev *sd, s32 val)
  * This function is for touch exposure feature.
  */
 static int mt9m114_s_exposure_selection(struct v4l2_subdev *sd,
-					struct v4l2_subdev_pad_config *cfg,
+					struct v4l2_subdev_state *sd_state,
 					struct v4l2_subdev_selection *sel)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -1731,7 +1731,7 @@ static int mt9m114_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int mt9m114_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index)
@@ -1742,7 +1742,7 @@ static int mt9m114_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mt9m114_enum_frame_size(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	unsigned int index = fse->index;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index eb1ecd198c22..2111e4a478c1 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -914,7 +914,7 @@ static int get_resolution_index(int w, int h)
 }
 
 static int ov2680_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -951,7 +951,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	}
 	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 		mutex_unlock(&dev->input_lock);
 		return 0;
 	}
@@ -1002,7 +1002,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2680_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -1161,7 +1161,7 @@ static int ov2680_g_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= MAX_FMTS)
@@ -1172,7 +1172,7 @@ static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	int index = fse->index;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 90a985ee25fa..90d0871a78a3 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -876,7 +876,7 @@ static int startup(struct v4l2_subdev *sd)
 }
 
 static int ov2722_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -906,7 +906,7 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 	}
 	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 		mutex_unlock(&dev->input_lock);
 		return 0;
 	}
@@ -961,7 +961,7 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov2722_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -1104,7 +1104,7 @@ static int ov2722_g_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int ov2722_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= MAX_FMTS)
@@ -1115,7 +1115,7 @@ static int ov2722_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov2722_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	int index = fse->index;
diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index e698b63d6cb7..0828ca9ab6f2 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -1577,7 +1577,7 @@ static int startup(struct v4l2_subdev *sd)
 }
 
 static int ov5693_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -1608,7 +1608,7 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 
 	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 		mutex_unlock(&dev->input_lock);
 		return 0;
 	}
@@ -1676,7 +1676,7 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int ov5693_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -1825,7 +1825,7 @@ static int ov5693_g_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int ov5693_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= MAX_FMTS)
@@ -1836,7 +1836,7 @@ static int ov5693_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ov5693_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	int index = fse->index;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 24d8eaccb9c6..366161cff560 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4842,6 +4842,9 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_state pad_state = {
+		.pads = &pad_cfg
+		};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -4877,7 +4880,7 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 		snr_mbus_fmt->width, snr_mbus_fmt->height);
 
 	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-			       pad, set_fmt, &pad_cfg, &format);
+			       pad, set_fmt, &pad_state, &format);
 	if (ret)
 		return ret;
 
@@ -5252,11 +5255,11 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		   atomisp_output_fmts[] in atomisp_v4l2.c */
 		vf_ffmt.code = V4L2_MBUS_FMT_CUSTOM_YUV420;
 
-		atomisp_subdev_set_selection(&asd->subdev, fh.pad,
+		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     ATOMISP_SUBDEV_PAD_SOURCE_VF,
 					     V4L2_SEL_TGT_COMPOSE, 0, &vf_size);
-		atomisp_subdev_set_ffmt(&asd->subdev, fh.pad,
+		atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
 					V4L2_SUBDEV_FORMAT_ACTIVE,
 					ATOMISP_SUBDEV_PAD_SOURCE_VF, &vf_ffmt);
 		asd->video_out_vf.sh_fmt = IA_CSS_FRAME_FORMAT_NV12;
@@ -5493,6 +5496,9 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_state pad_state = {
+		.pads = &pad_cfg
+		};
 	struct v4l2_subdev_format vformat = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -5531,7 +5537,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 	    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO) {
 		vformat.which = V4L2_SUBDEV_FORMAT_TRY;
 		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-				       pad, set_fmt, &pad_cfg, &vformat);
+				       pad, set_fmt, &pad_state, &vformat);
 		if (ret)
 			return ret;
 		if (ffmt->width < req_ffmt->width ||
@@ -5569,7 +5575,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 		asd->params.video_dis_en = false;
 	}
 
-	atomisp_subdev_set_ffmt(&asd->subdev, fh.pad,
+	atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
 				V4L2_SUBDEV_FORMAT_ACTIVE,
 				ATOMISP_SUBDEV_PAD_SINK, ffmt);
 
@@ -5648,7 +5654,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 			}
 
 			atomisp_subdev_set_selection(
-			    &asd->subdev, fh.pad,
+			    &asd->subdev, fh.state,
 			    V4L2_SUBDEV_FORMAT_ACTIVE, source_pad,
 			    V4L2_SEL_TGT_COMPOSE, 0, &r);
 
@@ -5778,7 +5784,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 						ATOMISP_SUBDEV_PAD_SINK);
 
 	isp_source_fmt.code = format_bridge->mbus_code;
-	atomisp_subdev_set_ffmt(&asd->subdev, fh.pad,
+	atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
 				V4L2_SUBDEV_FORMAT_ACTIVE,
 				source_pad, &isp_source_fmt);
 
@@ -5897,13 +5903,13 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 			isp_sink_crop.height = f->fmt.pix.height;
 		}
 
-		atomisp_subdev_set_selection(&asd->subdev, fh.pad,
+		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     ATOMISP_SUBDEV_PAD_SINK,
 					     V4L2_SEL_TGT_CROP,
 					     V4L2_SEL_FLAG_KEEP_CONFIG,
 					     &isp_sink_crop);
-		atomisp_subdev_set_selection(&asd->subdev, fh.pad,
+		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     source_pad, V4L2_SEL_TGT_COMPOSE,
 					     0, &isp_sink_crop);
@@ -5922,7 +5928,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 					 f->fmt.pix.height);
 		}
 
-		atomisp_subdev_set_selection(&asd->subdev, fh.pad,
+		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     source_pad,
 					     V4L2_SEL_TGT_COMPOSE, 0,
@@ -5956,14 +5962,14 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 						       f->fmt.pix.width,
 						       ATOM_ISP_STEP_HEIGHT);
 			}
-			atomisp_subdev_set_selection(&asd->subdev, fh.pad,
+			atomisp_subdev_set_selection(&asd->subdev, fh.state,
 						     V4L2_SUBDEV_FORMAT_ACTIVE,
 						     ATOMISP_SUBDEV_PAD_SINK,
 						     V4L2_SEL_TGT_CROP,
 						     V4L2_SEL_FLAG_KEEP_CONFIG,
 						     &sink_crop);
 		}
-		atomisp_subdev_set_selection(&asd->subdev, fh.pad,
+		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     source_pad,
 					     V4L2_SEL_TGT_COMPOSE, 0,
@@ -6054,7 +6060,8 @@ int atomisp_set_fmt_file(struct video_device *vdev, struct v4l2_format *f)
 	ffmt.height = f->fmt.pix.height;
 	ffmt.code = format_bridge->mbus_code;
 
-	atomisp_subdev_set_ffmt(&asd->subdev, fh.pad, V4L2_SUBDEV_FORMAT_ACTIVE,
+	atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
+				V4L2_SUBDEV_FORMAT_ACTIVE,
 				ATOMISP_SUBDEV_PAD_SINK, &ffmt);
 
 	return 0;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 060b8765ae96..56456e59bf89 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -25,13 +25,13 @@
 static struct v4l2_mbus_framefmt *__csi2_get_format(struct
 	atomisp_mipi_csi2_device
 	* csi2,
-	struct
-	v4l2_subdev_pad_config *cfg,
+	struct v4l2_subdev_state *sd_state,
 	enum
 	v4l2_subdev_format_whence
 	which, unsigned int pad) {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csi2->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
+						  pad);
 	else
 		return &csi2->formats[pad];
 }
@@ -44,7 +44,7 @@ static struct v4l2_mbus_framefmt *__csi2_get_format(struct
  * return -EINVAL or zero on success
 */
 static int csi2_enum_mbus_code(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
 	const struct atomisp_in_fmt_conv *ic = atomisp_in_fmt_conv;
@@ -70,13 +70,13 @@ static int csi2_enum_mbus_code(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
 */
 static int csi2_get_format(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct atomisp_mipi_csi2_device *csi2 = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __csi2_get_format(csi2, cfg, fmt->which, fmt->pad);
+	format = __csi2_get_format(csi2, sd_state, fmt->which, fmt->pad);
 
 	fmt->format = *format;
 
@@ -84,12 +84,14 @@ static int csi2_get_format(struct v4l2_subdev *sd,
 }
 
 int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  unsigned int which, uint16_t pad,
 			  struct v4l2_mbus_framefmt *ffmt)
 {
 	struct atomisp_mipi_csi2_device *csi2 = v4l2_get_subdevdata(sd);
-	struct v4l2_mbus_framefmt *actual_ffmt = __csi2_get_format(csi2, cfg, which, pad);
+	struct v4l2_mbus_framefmt *actual_ffmt = __csi2_get_format(csi2,
+								   sd_state,
+								   which, pad);
 
 	if (pad == CSI2_PAD_SINK) {
 		const struct atomisp_in_fmt_conv *ic;
@@ -110,12 +112,14 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 
 		tmp_ffmt = *ffmt = *actual_ffmt;
 
-		return atomisp_csi2_set_ffmt(sd, cfg, which, CSI2_PAD_SOURCE,
+		return atomisp_csi2_set_ffmt(sd, sd_state, which,
+					     CSI2_PAD_SOURCE,
 					     &tmp_ffmt);
 	}
 
 	/* FIXME: DPCM decompression */
-	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, cfg, which, CSI2_PAD_SINK);
+	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
+						  CSI2_PAD_SINK);
 
 	return 0;
 }
@@ -129,10 +133,10 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
 */
 static int csi2_set_format(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
-	return atomisp_csi2_set_ffmt(sd, cfg, fmt->which, fmt->pad,
+	return atomisp_csi2_set_ffmt(sd, sd_state, fmt->which, fmt->pad,
 				     &fmt->format);
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
index 59261e8f1a1a..e35711be8a37 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
@@ -44,7 +44,7 @@ struct atomisp_mipi_csi2_device {
 };
 
 int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  unsigned int which, uint16_t pad,
 			  struct v4l2_mbus_framefmt *ffmt);
 int atomisp_mipi_csi2_init(struct atomisp_device *isp);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_file.c b/drivers/staging/media/atomisp/pci/atomisp_file.c
index e568ca99c45a..4570a9ab100b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_file.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_file.c
@@ -80,7 +80,7 @@ static int file_input_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int file_input_get_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -104,16 +104,16 @@ static int file_input_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int file_input_set_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 
 	if (format->pad)
 		return -EINVAL;
-	file_input_get_fmt(sd, cfg, format);
+	file_input_get_fmt(sd, sd_state, format);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 	return 0;
 }
 
@@ -130,7 +130,7 @@ static int file_input_s_power(struct v4l2_subdev *sd, int on)
 }
 
 static int file_input_enum_mbus_code(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_mbus_code_enum *code)
 {
 	/*to fake*/
@@ -138,7 +138,7 @@ static int file_input_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int file_input_enum_frame_size(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_size_enum *fse)
 {
 	/*to fake*/
@@ -146,7 +146,7 @@ static int file_input_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int file_input_enum_frame_ival(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_interval_enum
 				      *fie)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 26d05474a035..022efd4151c0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -963,7 +963,7 @@ static int atomisp_release(struct file *file)
 	if (!isp->sw_contex.file_input && asd->fmt_auto->val) {
 		struct v4l2_mbus_framefmt isp_sink_fmt = { 0 };
 
-		atomisp_subdev_set_ffmt(&asd->subdev, fh.pad,
+		atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
 					V4L2_SUBDEV_FORMAT_ACTIVE,
 					ATOMISP_SUBDEV_PAD_SINK, &isp_sink_fmt);
 	}
@@ -975,7 +975,7 @@ static int atomisp_release(struct file *file)
 	if (isp->sw_contex.file_input && asd->fmt_auto->val) {
 		struct v4l2_mbus_framefmt isp_sink_fmt = { 0 };
 
-		atomisp_subdev_set_ffmt(&asd->subdev, fh.pad,
+		atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
 					V4L2_SUBDEV_FORMAT_ACTIVE,
 					ATOMISP_SUBDEV_PAD_SINK, &isp_sink_fmt);
 	}
@@ -1016,7 +1016,7 @@ static int atomisp_release(struct file *file)
 
 done:
 	if (!acc_node) {
-		atomisp_subdev_set_selection(&asd->subdev, fh.pad,
+		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
 					     atomisp_subdev_source_pad(vdev),
 					     V4L2_SEL_TGT_COMPOSE, 0,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index aeabd07bf518..12f22ad007c7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -213,7 +213,7 @@ static int isp_subdev_unsubscribe_event(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int isp_subdev_enum_mbus_code(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(atomisp_in_fmt_conv) - 1)
@@ -246,7 +246,7 @@ static int isp_subdev_validate_rect(struct v4l2_subdev *sd, uint32_t pad,
 }
 
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
-	struct v4l2_subdev_pad_config *cfg,
+	struct v4l2_subdev_state *sd_state,
 	u32 which, uint32_t pad,
 	uint32_t target)
 {
@@ -255,9 +255,9 @@ struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 	if (which == V4L2_SUBDEV_FORMAT_TRY) {
 		switch (target) {
 		case V4L2_SEL_TGT_CROP:
-			return v4l2_subdev_get_try_crop(sd, cfg, pad);
+			return v4l2_subdev_get_try_crop(sd, sd_state, pad);
 		case V4L2_SEL_TGT_COMPOSE:
-			return v4l2_subdev_get_try_compose(sd, cfg, pad);
+			return v4l2_subdev_get_try_compose(sd, sd_state, pad);
 		}
 	}
 
@@ -273,19 +273,20 @@ struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 
 struct v4l2_mbus_framefmt
 *atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_pad_config *cfg, uint32_t which,
+			 struct v4l2_subdev_state *sd_state, uint32_t which,
 			 uint32_t pad)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(sd, cfg, pad);
+		return v4l2_subdev_get_try_format(sd, sd_state, pad);
 
 	return &isp_sd->fmt[pad].fmt;
 }
 
 static void isp_get_fmt_rect(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg, uint32_t which,
+			     struct v4l2_subdev_state *sd_state,
+			     uint32_t which,
 			     struct v4l2_mbus_framefmt **ffmt,
 			     struct v4l2_rect *crop[ATOMISP_SUBDEV_PADS_NUM],
 			     struct v4l2_rect *comp[ATOMISP_SUBDEV_PADS_NUM])
@@ -293,16 +294,16 @@ static void isp_get_fmt_rect(struct v4l2_subdev *sd,
 	unsigned int i;
 
 	for (i = 0; i < ATOMISP_SUBDEV_PADS_NUM; i++) {
-		ffmt[i] = atomisp_subdev_get_ffmt(sd, cfg, which, i);
-		crop[i] = atomisp_subdev_get_rect(sd, cfg, which, i,
+		ffmt[i] = atomisp_subdev_get_ffmt(sd, sd_state, which, i);
+		crop[i] = atomisp_subdev_get_rect(sd, sd_state, which, i,
 						  V4L2_SEL_TGT_CROP);
-		comp[i] = atomisp_subdev_get_rect(sd, cfg, which, i,
+		comp[i] = atomisp_subdev_get_rect(sd, sd_state, which, i,
 						  V4L2_SEL_TGT_COMPOSE);
 	}
 }
 
 static void isp_subdev_propagate(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 u32 which, uint32_t pad, uint32_t target,
 				 uint32_t flags)
 {
@@ -313,7 +314,7 @@ static void isp_subdev_propagate(struct v4l2_subdev *sd,
 	if (flags & V4L2_SEL_FLAG_KEEP_CONFIG)
 		return;
 
-	isp_get_fmt_rect(sd, cfg, which, ffmt, crop, comp);
+	isp_get_fmt_rect(sd, sd_state, which, ffmt, crop, comp);
 
 	switch (pad) {
 	case ATOMISP_SUBDEV_PAD_SINK: {
@@ -323,7 +324,7 @@ static void isp_subdev_propagate(struct v4l2_subdev *sd,
 		r.width = ffmt[pad]->width;
 		r.height = ffmt[pad]->height;
 
-		atomisp_subdev_set_selection(sd, cfg, which, pad,
+		atomisp_subdev_set_selection(sd, sd_state, which, pad,
 					     target, flags, &r);
 		break;
 	}
@@ -331,7 +332,7 @@ static void isp_subdev_propagate(struct v4l2_subdev *sd,
 }
 
 static int isp_subdev_get_selection(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
 	struct v4l2_rect *rec;
@@ -340,7 +341,7 @@ static int isp_subdev_get_selection(struct v4l2_subdev *sd,
 	if (rval)
 		return rval;
 
-	rec = atomisp_subdev_get_rect(sd, cfg, sel->which, sel->pad,
+	rec = atomisp_subdev_get_rect(sd, sd_state, sel->which, sel->pad,
 				      sel->target);
 	if (!rec)
 		return -EINVAL;
@@ -365,7 +366,7 @@ static const char *atomisp_pad_str(unsigned int pad)
 }
 
 int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 u32 which, uint32_t pad, uint32_t target,
 				 u32 flags, struct v4l2_rect *r)
 {
@@ -382,7 +383,7 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 
 	stream_id = atomisp_source_pad_to_stream_id(isp_sd, vdev_pad);
 
-	isp_get_fmt_rect(sd, cfg, which, ffmt, crop, comp);
+	isp_get_fmt_rect(sd, sd_state, which, ffmt, crop, comp);
 
 	dev_dbg(isp->dev,
 		"sel: pad %s tgt %s l %d t %d w %d h %d which %s f 0x%8.8x\n",
@@ -450,7 +451,8 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 				struct v4l2_rect tmp = *crop[pad];
 
 				atomisp_subdev_set_selection(
-				    sd, cfg, which, i, V4L2_SEL_TGT_COMPOSE,
+				    sd, sd_state, which, i,
+				    V4L2_SEL_TGT_COMPOSE,
 				    flags, &tmp);
 			}
 		}
@@ -551,9 +553,9 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 		ffmt[pad]->height = comp[pad]->height;
 	}
 
-	if (!atomisp_subdev_get_rect(sd, cfg, which, pad, target))
+	if (!atomisp_subdev_get_rect(sd, sd_state, which, pad, target))
 		return -EINVAL;
-	*r = *atomisp_subdev_get_rect(sd, cfg, which, pad, target);
+	*r = *atomisp_subdev_get_rect(sd, sd_state, which, pad, target);
 
 	dev_dbg(isp->dev, "sel actual: l %d t %d w %d h %d\n",
 		r->left, r->top, r->width, r->height);
@@ -562,7 +564,7 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 }
 
 static int isp_subdev_set_selection(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
 	int rval = isp_subdev_validate_rect(sd, sel->pad, sel->target);
@@ -570,7 +572,8 @@ static int isp_subdev_set_selection(struct v4l2_subdev *sd,
 	if (rval)
 		return rval;
 
-	return atomisp_subdev_set_selection(sd, cfg, sel->which, sel->pad,
+	return atomisp_subdev_set_selection(sd, sd_state, sel->which,
+					    sel->pad,
 					    sel->target, sel->flags, &sel->r);
 }
 
@@ -609,13 +612,14 @@ static int atomisp_get_sensor_bin_factor(struct atomisp_sub_device *asd)
 }
 
 void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg, uint32_t which,
+			     struct v4l2_subdev_state *sd_state,
+			     uint32_t which,
 			     u32 pad, struct v4l2_mbus_framefmt *ffmt)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 	struct atomisp_device *isp = isp_sd->isp;
 	struct v4l2_mbus_framefmt *__ffmt =
-	    atomisp_subdev_get_ffmt(sd, cfg, which, pad);
+	    atomisp_subdev_get_ffmt(sd, sd_state, which, pad);
 	u16 vdev_pad = atomisp_subdev_source_pad(sd->devnode);
 	enum atomisp_input_stream_id stream_id;
 
@@ -640,7 +644,7 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 
 		*__ffmt = *ffmt;
 
-		isp_subdev_propagate(sd, cfg, which, pad,
+		isp_subdev_propagate(sd, sd_state, which, pad,
 				     V4L2_SEL_TGT_CROP, 0);
 
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
@@ -679,10 +683,11 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int isp_subdev_get_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
-	fmt->format = *atomisp_subdev_get_ffmt(sd, cfg, fmt->which, fmt->pad);
+	fmt->format = *atomisp_subdev_get_ffmt(sd, sd_state, fmt->which,
+					       fmt->pad);
 
 	return 0;
 }
@@ -698,10 +703,11 @@ static int isp_subdev_get_format(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int isp_subdev_set_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
-	atomisp_subdev_set_ffmt(sd, cfg, fmt->which, fmt->pad, &fmt->format);
+	atomisp_subdev_set_ffmt(sd, sd_state, fmt->which, fmt->pad,
+				&fmt->format);
 
 	return 0;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 330a77eed8aa..d6fcfab6352d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -437,19 +437,20 @@ uint16_t atomisp_subdev_source_pad(struct video_device *vdev);
 /* Get pointer to appropriate format */
 struct v4l2_mbus_framefmt
 *atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_pad_config *cfg, uint32_t which,
+			 struct v4l2_subdev_state *sd_state, uint32_t which,
 			 uint32_t pad);
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
-	struct v4l2_subdev_pad_config *cfg,
+	struct v4l2_subdev_state *sd_state,
 	u32 which, uint32_t pad,
 	uint32_t target);
 int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 u32 which, uint32_t pad, uint32_t target,
 				 u32 flags, struct v4l2_rect *r);
 /* Actually set the format */
 void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg, uint32_t which,
+			     struct v4l2_subdev_state *sd_state,
+			     uint32_t which,
 			     u32 pad, struct v4l2_mbus_framefmt *ffmt);
 
 int atomisp_update_run_mode(struct atomisp_sub_device *asd);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_tpg.c b/drivers/staging/media/atomisp/pci/atomisp_tpg.c
index 1def80bab180..e29a96da5f98 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_tpg.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_tpg.c
@@ -29,7 +29,7 @@ static int tpg_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int tpg_get_fmt(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *format)
 {
 	/*to fake*/
@@ -37,7 +37,7 @@ static int tpg_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int tpg_set_fmt(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
@@ -47,7 +47,7 @@ static int tpg_set_fmt(struct v4l2_subdev *sd,
 	/* only raw8 grbg is supported by TPG */
 	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		cfg->try_fmt = *fmt;
+		sd_state->pads->try_fmt = *fmt;
 		return 0;
 	}
 	return 0;
@@ -65,7 +65,7 @@ static int tpg_s_power(struct v4l2_subdev *sd, int on)
 }
 
 static int tpg_enum_mbus_code(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	/*to fake*/
@@ -73,7 +73,7 @@ static int tpg_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int tpg_enum_frame_size(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	/*to fake*/
@@ -81,7 +81,7 @@ static int tpg_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int tpg_enum_frame_ival(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_interval_enum *fie)
 {
 	/*to fake*/
diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index f21ed881295f..ac5fb332088e 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -79,13 +79,13 @@ static void prp_stop(struct prp_priv *priv)
 }
 
 static struct v4l2_mbus_framefmt *
-__prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_pad_config *cfg,
+__prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
 	      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	struct imx_ic_priv *ic_priv = priv->ic_priv;
 
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ic_priv->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&ic_priv->sd, sd_state, pad);
 	else
 		return &priv->format_mbus;
 }
@@ -95,7 +95,7 @@ __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_pad_config *cfg,
  */
 
 static int prp_enum_mbus_code(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
@@ -115,7 +115,8 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 			ret = -EINVAL;
 			goto out;
 		}
-		infmt = __prp_get_fmt(priv, cfg, PRP_SINK_PAD, code->which);
+		infmt = __prp_get_fmt(priv, sd_state, PRP_SINK_PAD,
+				      code->which);
 		code->code = infmt->code;
 		break;
 	default:
@@ -127,7 +128,7 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int prp_get_fmt(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
@@ -139,7 +140,7 @@ static int prp_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&priv->lock);
 
-	fmt = __prp_get_fmt(priv, cfg, sdformat->pad, sdformat->which);
+	fmt = __prp_get_fmt(priv, sd_state, sdformat->pad, sdformat->which);
 	if (!fmt) {
 		ret = -EINVAL;
 		goto out;
@@ -152,7 +153,7 @@ static int prp_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int prp_set_fmt(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
@@ -171,7 +172,7 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 		goto out;
 	}
 
-	infmt = __prp_get_fmt(priv, cfg, PRP_SINK_PAD, sdformat->which);
+	infmt = __prp_get_fmt(priv, sd_state, PRP_SINK_PAD, sdformat->which);
 
 	switch (sdformat->pad) {
 	case PRP_SINK_PAD:
@@ -201,7 +202,7 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 
 	imx_media_try_colorimetry(&sdformat->format, true);
 
-	fmt = __prp_get_fmt(priv, cfg, sdformat->pad, sdformat->which);
+	fmt = __prp_get_fmt(priv, sd_state, sdformat->pad, sdformat->which);
 	*fmt = sdformat->format;
 out:
 	mutex_unlock(&priv->lock);
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index d990553de87b..9b81cfbcd777 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -787,13 +787,13 @@ static void prp_stop(struct prp_priv *priv)
 }
 
 static struct v4l2_mbus_framefmt *
-__prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_pad_config *cfg,
+__prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
 	      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	struct imx_ic_priv *ic_priv = priv->ic_priv;
 
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ic_priv->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&ic_priv->sd, sd_state, pad);
 	else
 		return &priv->format_mbus[pad];
 }
@@ -841,7 +841,7 @@ static bool prp_bound_align_output(struct v4l2_mbus_framefmt *outfmt,
  */
 
 static int prp_enum_mbus_code(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad >= PRPENCVF_NUM_PADS)
@@ -852,7 +852,7 @@ static int prp_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int prp_get_fmt(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
@@ -864,7 +864,7 @@ static int prp_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&priv->lock);
 
-	fmt = __prp_get_fmt(priv, cfg, sdformat->pad, sdformat->which);
+	fmt = __prp_get_fmt(priv, sd_state, sdformat->pad, sdformat->which);
 	if (!fmt) {
 		ret = -EINVAL;
 		goto out;
@@ -877,7 +877,7 @@ static int prp_get_fmt(struct v4l2_subdev *sd,
 }
 
 static void prp_try_fmt(struct prp_priv *priv,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat,
 			const struct imx_media_pixfmt **cc)
 {
@@ -894,7 +894,8 @@ static void prp_try_fmt(struct prp_priv *priv,
 		sdformat->format.code = (*cc)->codes[0];
 	}
 
-	infmt = __prp_get_fmt(priv, cfg, PRPENCVF_SINK_PAD, sdformat->which);
+	infmt = __prp_get_fmt(priv, sd_state, PRPENCVF_SINK_PAD,
+			      sdformat->which);
 
 	if (sdformat->pad == PRPENCVF_SRC_PAD) {
 		sdformat->format.field = infmt->field;
@@ -920,7 +921,7 @@ static void prp_try_fmt(struct prp_priv *priv,
 }
 
 static int prp_set_fmt(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
@@ -938,9 +939,9 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 		goto out;
 	}
 
-	prp_try_fmt(priv, cfg, sdformat, &cc);
+	prp_try_fmt(priv, sd_state, sdformat, &cc);
 
-	fmt = __prp_get_fmt(priv, cfg, sdformat->pad, sdformat->which);
+	fmt = __prp_get_fmt(priv, sd_state, sdformat->pad, sdformat->which);
 	*fmt = sdformat->format;
 
 	/* propagate a default format to source pad */
@@ -952,9 +953,9 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 		format.pad = PRPENCVF_SRC_PAD;
 		format.which = sdformat->which;
 		format.format = sdformat->format;
-		prp_try_fmt(priv, cfg, &format, &outcc);
+		prp_try_fmt(priv, sd_state, &format, &outcc);
 
-		outfmt = __prp_get_fmt(priv, cfg, PRPENCVF_SRC_PAD,
+		outfmt = __prp_get_fmt(priv, sd_state, PRPENCVF_SRC_PAD,
 				       sdformat->which);
 		*outfmt = format.format;
 		if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
@@ -970,7 +971,7 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int prp_enum_frame_size(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
@@ -988,7 +989,7 @@ static int prp_enum_frame_size(struct v4l2_subdev *sd,
 	format.format.code = fse->code;
 	format.format.width = 1;
 	format.format.height = 1;
-	prp_try_fmt(priv, cfg, &format, &cc);
+	prp_try_fmt(priv, sd_state, &format, &cc);
 	fse->min_width = format.format.width;
 	fse->min_height = format.format.height;
 
@@ -1000,7 +1001,7 @@ static int prp_enum_frame_size(struct v4l2_subdev *sd,
 	format.format.code = fse->code;
 	format.format.width = -1;
 	format.format.height = -1;
-	prp_try_fmt(priv, cfg, &format, &cc);
+	prp_try_fmt(priv, sd_state, &format, &cc);
 	fse->max_width = format.format.width;
 	fse->max_height = format.format.height;
 out:
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index e3bfd635a89a..d2f1d40b2d5a 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1139,31 +1139,32 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 }
 
 static struct v4l2_mbus_framefmt *
-__csi_get_fmt(struct csi_priv *priv, struct v4l2_subdev_pad_config *cfg,
+__csi_get_fmt(struct csi_priv *priv, struct v4l2_subdev_state *sd_state,
 	      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&priv->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&priv->sd, sd_state, pad);
 	else
 		return &priv->format_mbus[pad];
 }
 
 static struct v4l2_rect *
-__csi_get_crop(struct csi_priv *priv, struct v4l2_subdev_pad_config *cfg,
+__csi_get_crop(struct csi_priv *priv, struct v4l2_subdev_state *sd_state,
 	       enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&priv->sd, cfg, CSI_SINK_PAD);
+		return v4l2_subdev_get_try_crop(&priv->sd, sd_state,
+						CSI_SINK_PAD);
 	else
 		return &priv->crop;
 }
 
 static struct v4l2_rect *
-__csi_get_compose(struct csi_priv *priv, struct v4l2_subdev_pad_config *cfg,
+__csi_get_compose(struct csi_priv *priv, struct v4l2_subdev_state *sd_state,
 		  enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_compose(&priv->sd, cfg,
+		return v4l2_subdev_get_try_compose(&priv->sd, sd_state,
 						   CSI_SINK_PAD);
 	else
 		return &priv->compose;
@@ -1171,7 +1172,7 @@ __csi_get_compose(struct csi_priv *priv, struct v4l2_subdev_pad_config *cfg,
 
 static void csi_try_crop(struct csi_priv *priv,
 			 struct v4l2_rect *crop,
-			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_state *sd_state,
 			 struct v4l2_mbus_framefmt *infmt,
 			 struct v4l2_fwnode_endpoint *upstream_ep)
 {
@@ -1210,7 +1211,7 @@ static void csi_try_crop(struct csi_priv *priv,
 }
 
 static int csi_enum_mbus_code(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
@@ -1221,7 +1222,7 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 
 	mutex_lock(&priv->lock);
 
-	infmt = __csi_get_fmt(priv, cfg, CSI_SINK_PAD, code->which);
+	infmt = __csi_get_fmt(priv, sd_state, CSI_SINK_PAD, code->which);
 	incc = imx_media_find_mbus_format(infmt->code, PIXFMT_SEL_ANY);
 
 	switch (code->pad) {
@@ -1263,7 +1264,7 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int csi_enum_frame_size(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
@@ -1282,7 +1283,7 @@ static int csi_enum_frame_size(struct v4l2_subdev *sd,
 		fse->min_height = MIN_H;
 		fse->max_height = MAX_H;
 	} else {
-		crop = __csi_get_crop(priv, cfg, fse->which);
+		crop = __csi_get_crop(priv, sd_state, fse->which);
 
 		fse->min_width = fse->index & 1 ?
 			crop->width / 2 : crop->width;
@@ -1297,7 +1298,7 @@ static int csi_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int csi_enum_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
@@ -1313,7 +1314,7 @@ static int csi_enum_frame_interval(struct v4l2_subdev *sd,
 	mutex_lock(&priv->lock);
 
 	input_fi = &priv->frame_interval[CSI_SINK_PAD];
-	crop = __csi_get_crop(priv, cfg, fie->which);
+	crop = __csi_get_crop(priv, sd_state, fie->which);
 
 	if ((fie->width != crop->width && fie->width != crop->width / 2) ||
 	    (fie->height != crop->height && fie->height != crop->height / 2)) {
@@ -1333,7 +1334,7 @@ static int csi_enum_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int csi_get_fmt(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
@@ -1345,7 +1346,7 @@ static int csi_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&priv->lock);
 
-	fmt = __csi_get_fmt(priv, cfg, sdformat->pad, sdformat->which);
+	fmt = __csi_get_fmt(priv, sd_state, sdformat->pad, sdformat->which);
 	if (!fmt) {
 		ret = -EINVAL;
 		goto out;
@@ -1358,11 +1359,11 @@ static int csi_get_fmt(struct v4l2_subdev *sd,
 }
 
 static void csi_try_field(struct csi_priv *priv,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *sdformat)
 {
 	struct v4l2_mbus_framefmt *infmt =
-		__csi_get_fmt(priv, cfg, CSI_SINK_PAD, sdformat->which);
+		__csi_get_fmt(priv, sd_state, CSI_SINK_PAD, sdformat->which);
 
 	/*
 	 * no restrictions on sink pad field type except must
@@ -1408,7 +1409,7 @@ static void csi_try_field(struct csi_priv *priv,
 
 static void csi_try_fmt(struct csi_priv *priv,
 			struct v4l2_fwnode_endpoint *upstream_ep,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat,
 			struct v4l2_rect *crop,
 			struct v4l2_rect *compose,
@@ -1418,7 +1419,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 	struct v4l2_mbus_framefmt *infmt;
 	u32 code;
 
-	infmt = __csi_get_fmt(priv, cfg, CSI_SINK_PAD, sdformat->which);
+	infmt = __csi_get_fmt(priv, sd_state, CSI_SINK_PAD, sdformat->which);
 
 	switch (sdformat->pad) {
 	case CSI_SRC_PAD_DIRECT:
@@ -1445,7 +1446,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 			}
 		}
 
-		csi_try_field(priv, cfg, sdformat);
+		csi_try_field(priv, sd_state, sdformat);
 
 		/* propagate colorimetry from sink */
 		sdformat->format.colorspace = infmt->colorspace;
@@ -1469,7 +1470,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 			sdformat->format.code = (*cc)->codes[0];
 		}
 
-		csi_try_field(priv, cfg, sdformat);
+		csi_try_field(priv, sd_state, sdformat);
 
 		/* Reset crop and compose rectangles */
 		crop->left = 0;
@@ -1478,7 +1479,8 @@ static void csi_try_fmt(struct csi_priv *priv,
 		crop->height = sdformat->format.height;
 		if (sdformat->format.field == V4L2_FIELD_ALTERNATE)
 			crop->height *= 2;
-		csi_try_crop(priv, crop, cfg, &sdformat->format, upstream_ep);
+		csi_try_crop(priv, crop, sd_state, &sdformat->format,
+			     upstream_ep);
 		compose->left = 0;
 		compose->top = 0;
 		compose->width = crop->width;
@@ -1492,7 +1494,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 }
 
 static int csi_set_fmt(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       struct v4l2_subdev_format *sdformat)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
@@ -1518,12 +1520,13 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 		goto out;
 	}
 
-	crop = __csi_get_crop(priv, cfg, sdformat->which);
-	compose = __csi_get_compose(priv, cfg, sdformat->which);
+	crop = __csi_get_crop(priv, sd_state, sdformat->which);
+	compose = __csi_get_compose(priv, sd_state, sdformat->which);
 
-	csi_try_fmt(priv, &upstream_ep, cfg, sdformat, crop, compose, &cc);
+	csi_try_fmt(priv, &upstream_ep, sd_state, sdformat, crop, compose,
+		    &cc);
 
-	fmt = __csi_get_fmt(priv, cfg, sdformat->pad, sdformat->which);
+	fmt = __csi_get_fmt(priv, sd_state, sdformat->pad, sdformat->which);
 	*fmt = sdformat->format;
 
 	if (sdformat->pad == CSI_SINK_PAD) {
@@ -1538,10 +1541,11 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 			format.pad = pad;
 			format.which = sdformat->which;
 			format.format = sdformat->format;
-			csi_try_fmt(priv, &upstream_ep, cfg, &format,
+			csi_try_fmt(priv, &upstream_ep, sd_state, &format,
 				    NULL, compose, &outcc);
 
-			outfmt = __csi_get_fmt(priv, cfg, pad, sdformat->which);
+			outfmt = __csi_get_fmt(priv, sd_state, pad,
+					       sdformat->which);
 			*outfmt = format.format;
 
 			if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
@@ -1558,7 +1562,7 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int csi_get_selection(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
@@ -1571,9 +1575,9 @@ static int csi_get_selection(struct v4l2_subdev *sd,
 
 	mutex_lock(&priv->lock);
 
-	infmt = __csi_get_fmt(priv, cfg, CSI_SINK_PAD, sel->which);
-	crop = __csi_get_crop(priv, cfg, sel->which);
-	compose = __csi_get_compose(priv, cfg, sel->which);
+	infmt = __csi_get_fmt(priv, sd_state, CSI_SINK_PAD, sel->which);
+	crop = __csi_get_crop(priv, sd_state, sel->which);
+	compose = __csi_get_compose(priv, sd_state, sel->which);
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -1622,7 +1626,7 @@ static int csi_set_scale(u32 *compose, u32 crop, u32 flags)
 }
 
 static int csi_set_selection(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
@@ -1647,9 +1651,9 @@ static int csi_set_selection(struct v4l2_subdev *sd,
 		goto out;
 	}
 
-	infmt = __csi_get_fmt(priv, cfg, CSI_SINK_PAD, sel->which);
-	crop = __csi_get_crop(priv, cfg, sel->which);
-	compose = __csi_get_compose(priv, cfg, sel->which);
+	infmt = __csi_get_fmt(priv, sd_state, CSI_SINK_PAD, sel->which);
+	crop = __csi_get_crop(priv, sd_state, sel->which);
+	compose = __csi_get_compose(priv, sd_state, sel->which);
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
@@ -1665,7 +1669,7 @@ static int csi_set_selection(struct v4l2_subdev *sd,
 			goto out;
 		}
 
-		csi_try_crop(priv, &sel->r, cfg, infmt, &upstream_ep);
+		csi_try_crop(priv, &sel->r, sd_state, infmt, &upstream_ep);
 
 		*crop = sel->r;
 
@@ -1706,7 +1710,7 @@ static int csi_set_selection(struct v4l2_subdev *sd,
 	for (pad = CSI_SINK_PAD + 1; pad < CSI_NUM_PADS; pad++) {
 		struct v4l2_mbus_framefmt *outfmt;
 
-		outfmt = __csi_get_fmt(priv, cfg, pad, sel->which);
+		outfmt = __csi_get_fmt(priv, sd_state, pad, sel->which);
 		outfmt->width = compose->width;
 		outfmt->height = compose->height;
 	}
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 5128915a5d6f..6f90acf9c725 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -429,7 +429,7 @@ EXPORT_SYMBOL_GPL(imx_media_init_mbus_fmt);
  * of a subdev. Can be used as the .init_cfg pad operation.
  */
 int imx_media_init_cfg(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg)
+		       struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *mf_try;
 	struct v4l2_subdev_format format;
@@ -445,7 +445,7 @@ int imx_media_init_cfg(struct v4l2_subdev *sd,
 		if (ret)
 			continue;
 
-		mf_try = v4l2_subdev_get_try_format(sd, cfg, pad);
+		mf_try = v4l2_subdev_get_try_format(sd, sd_state, pad);
 		*mf_try = format.format;
 	}
 
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index abf290bda98d..3c2093c520ba 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -532,17 +532,17 @@ static int vdic_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static struct v4l2_mbus_framefmt *
-__vdic_get_fmt(struct vdic_priv *priv, struct v4l2_subdev_pad_config *cfg,
+__vdic_get_fmt(struct vdic_priv *priv, struct v4l2_subdev_state *sd_state,
 	       unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&priv->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&priv->sd, sd_state, pad);
 	else
 		return &priv->format_mbus[pad];
 }
 
 static int vdic_enum_mbus_code(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad >= VDIC_NUM_PADS)
@@ -553,7 +553,7 @@ static int vdic_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int vdic_get_fmt(struct v4l2_subdev *sd,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
 	struct vdic_priv *priv = v4l2_get_subdevdata(sd);
@@ -565,7 +565,7 @@ static int vdic_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&priv->lock);
 
-	fmt = __vdic_get_fmt(priv, cfg, sdformat->pad, sdformat->which);
+	fmt = __vdic_get_fmt(priv, sd_state, sdformat->pad, sdformat->which);
 	if (!fmt) {
 		ret = -EINVAL;
 		goto out;
@@ -578,7 +578,7 @@ static int vdic_get_fmt(struct v4l2_subdev *sd,
 }
 
 static void vdic_try_fmt(struct vdic_priv *priv,
-			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_state *sd_state,
 			 struct v4l2_subdev_format *sdformat,
 			 const struct imx_media_pixfmt **cc)
 {
@@ -594,7 +594,7 @@ static void vdic_try_fmt(struct vdic_priv *priv,
 		sdformat->format.code = (*cc)->codes[0];
 	}
 
-	infmt = __vdic_get_fmt(priv, cfg, priv->active_input_pad,
+	infmt = __vdic_get_fmt(priv, sd_state, priv->active_input_pad,
 			       sdformat->which);
 
 	switch (sdformat->pad) {
@@ -620,7 +620,7 @@ static void vdic_try_fmt(struct vdic_priv *priv,
 }
 
 static int vdic_set_fmt(struct v4l2_subdev *sd,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
 	struct vdic_priv *priv = v4l2_get_subdevdata(sd);
@@ -638,9 +638,9 @@ static int vdic_set_fmt(struct v4l2_subdev *sd,
 		goto out;
 	}
 
-	vdic_try_fmt(priv, cfg, sdformat, &cc);
+	vdic_try_fmt(priv, sd_state, sdformat, &cc);
 
-	fmt = __vdic_get_fmt(priv, cfg, sdformat->pad, sdformat->which);
+	fmt = __vdic_get_fmt(priv, sd_state, sdformat->pad, sdformat->which);
 	*fmt = sdformat->format;
 
 	/* propagate format to source pad */
@@ -653,9 +653,9 @@ static int vdic_set_fmt(struct v4l2_subdev *sd,
 		format.pad = VDIC_SRC_PAD_DIRECT;
 		format.which = sdformat->which;
 		format.format = sdformat->format;
-		vdic_try_fmt(priv, cfg, &format, &outcc);
+		vdic_try_fmt(priv, sd_state, &format, &outcc);
 
-		outfmt = __vdic_get_fmt(priv, cfg, VDIC_SRC_PAD_DIRECT,
+		outfmt = __vdic_get_fmt(priv, sd_state, VDIC_SRC_PAD_DIRECT,
 					sdformat->which);
 		*outfmt = format.format;
 		if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 492d9a64e704..6740e7917458 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -193,7 +193,7 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 			    u32 width, u32 height, u32 code, u32 field,
 			    const struct imx_media_pixfmt **cc);
 int imx_media_init_cfg(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg);
+		       struct v4l2_subdev_state *sd_state);
 void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 			       bool ic_route);
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index fc2378ac04b7..9de0ebd439dc 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -508,17 +508,17 @@ static int csi2_link_setup(struct media_entity *entity,
 }
 
 static struct v4l2_mbus_framefmt *
-__csi2_get_fmt(struct csi2_dev *csi2, struct v4l2_subdev_pad_config *cfg,
+__csi2_get_fmt(struct csi2_dev *csi2, struct v4l2_subdev_state *sd_state,
 	       unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csi2->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&csi2->sd, sd_state, pad);
 	else
 		return &csi2->format_mbus;
 }
 
 static int csi2_get_fmt(struct v4l2_subdev *sd,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
 	struct csi2_dev *csi2 = sd_to_dev(sd);
@@ -526,7 +526,7 @@ static int csi2_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&csi2->lock);
 
-	fmt = __csi2_get_fmt(csi2, cfg, sdformat->pad, sdformat->which);
+	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
 
 	sdformat->format = *fmt;
 
@@ -536,7 +536,7 @@ static int csi2_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int csi2_set_fmt(struct v4l2_subdev *sd,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
 	struct csi2_dev *csi2 = sd_to_dev(sd);
@@ -557,7 +557,7 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	if (sdformat->pad != CSI2_SINK_PAD)
 		sdformat->format = csi2->format_mbus;
 
-	fmt = __csi2_get_fmt(csi2, cfg, sdformat->pad, sdformat->which);
+	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
 
 	*fmt = sdformat->format;
 out:
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index f85a2f5f1413..894c4de31790 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -724,7 +724,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg)
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
@@ -732,7 +732,7 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 	int i;
 
 	for (i = 0; i < IMX7_CSI_PADS_NUM; i++) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, i);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
 
 		ret = imx_media_init_mbus_fmt(mf, 800, 600, 0, V4L2_FIELD_NONE,
 					      &csi->cc[i]);
@@ -745,18 +745,18 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 
 static struct v4l2_mbus_framefmt *
 imx7_csi_get_format(struct imx7_csi *csi,
-		    struct v4l2_subdev_pad_config *cfg,
+		    struct v4l2_subdev_state *sd_state,
 		    unsigned int pad,
 		    enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csi->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&csi->sd, sd_state, pad);
 
 	return &csi->format_mbus[pad];
 }
 
 static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
@@ -765,7 +765,8 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 
 	mutex_lock(&csi->lock);
 
-	in_fmt = imx7_csi_get_format(csi, cfg, IMX7_CSI_PAD_SINK, code->which);
+	in_fmt = imx7_csi_get_format(csi, sd_state, IMX7_CSI_PAD_SINK,
+				     code->which);
 
 	switch (code->pad) {
 	case IMX7_CSI_PAD_SINK:
@@ -791,7 +792,7 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx7_csi_get_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *sdformat)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
@@ -800,7 +801,8 @@ static int imx7_csi_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&csi->lock);
 
-	fmt = imx7_csi_get_format(csi, cfg, sdformat->pad, sdformat->which);
+	fmt = imx7_csi_get_format(csi, sd_state, sdformat->pad,
+				  sdformat->which);
 	if (!fmt) {
 		ret = -EINVAL;
 		goto out_unlock;
@@ -815,7 +817,7 @@ static int imx7_csi_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int imx7_csi_try_fmt(struct imx7_csi *csi,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *sdformat,
 			    const struct imx_media_pixfmt **cc)
 {
@@ -823,7 +825,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 	struct v4l2_mbus_framefmt *in_fmt;
 	u32 code;
 
-	in_fmt = imx7_csi_get_format(csi, cfg, IMX7_CSI_PAD_SINK,
+	in_fmt = imx7_csi_get_format(csi, sd_state, IMX7_CSI_PAD_SINK,
 				     sdformat->which);
 	if (!in_fmt)
 		return -EINVAL;
@@ -868,7 +870,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 }
 
 static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *sdformat)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
@@ -889,11 +891,12 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 		goto out_unlock;
 	}
 
-	ret = imx7_csi_try_fmt(csi, cfg, sdformat, &cc);
+	ret = imx7_csi_try_fmt(csi, sd_state, sdformat, &cc);
 	if (ret < 0)
 		goto out_unlock;
 
-	fmt = imx7_csi_get_format(csi, cfg, sdformat->pad, sdformat->which);
+	fmt = imx7_csi_get_format(csi, sd_state, sdformat->pad,
+				  sdformat->which);
 	if (!fmt) {
 		ret = -EINVAL;
 		goto out_unlock;
@@ -906,11 +909,11 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 		format.pad = IMX7_CSI_PAD_SRC;
 		format.which = sdformat->which;
 		format.format = sdformat->format;
-		if (imx7_csi_try_fmt(csi, cfg, &format, &outcc)) {
+		if (imx7_csi_try_fmt(csi, sd_state, &format, &outcc)) {
 			ret = -EINVAL;
 			goto out_unlock;
 		}
-		outfmt = imx7_csi_get_format(csi, cfg, IMX7_CSI_PAD_SRC,
+		outfmt = imx7_csi_get_format(csi, sd_state, IMX7_CSI_PAD_SRC,
 					     sdformat->which);
 		*outfmt = format.format;
 
diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 9cd3c86fee58..ead696eb4610 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -880,26 +880,26 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 
 static struct v4l2_mbus_framefmt *
 mipi_csis_get_format(struct csi_state *state,
-		     struct v4l2_subdev_pad_config *cfg,
+		     struct v4l2_subdev_state *sd_state,
 		     enum v4l2_subdev_format_whence which,
 		     unsigned int pad)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&state->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&state->sd, sd_state, pad);
 
 	return &state->format_mbus;
 }
 
 static int mipi_csis_init_cfg(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg)
+			      struct v4l2_subdev_state *sd_state)
 {
 	struct csi_state *state = mipi_sd_to_csis_state(sd);
 	struct v4l2_mbus_framefmt *fmt_sink;
 	struct v4l2_mbus_framefmt *fmt_source;
 	enum v4l2_subdev_format_whence which;
 
-	which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
-	fmt_sink = mipi_csis_get_format(state, cfg, which, CSIS_PAD_SINK);
+	which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt_sink = mipi_csis_get_format(state, sd_state, which, CSIS_PAD_SINK);
 
 	fmt_sink->code = MEDIA_BUS_FMT_UYVY8_1X16;
 	fmt_sink->width = MIPI_CSIS_DEF_PIX_WIDTH;
@@ -918,23 +918,25 @@ static int mipi_csis_init_cfg(struct v4l2_subdev *sd,
 	 * configuration, cfg is NULL, which indicates there's no source pad
 	 * configuration to set.
 	 */
-	if (!cfg)
+	if (!sd_state)
 		return 0;
 
-	fmt_source = mipi_csis_get_format(state, cfg, which, CSIS_PAD_SOURCE);
+	fmt_source = mipi_csis_get_format(state, sd_state, which,
+					  CSIS_PAD_SOURCE);
 	*fmt_source = *fmt_sink;
 
 	return 0;
 }
 
 static int mipi_csis_get_fmt(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *sdformat)
 {
 	struct csi_state *state = mipi_sd_to_csis_state(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	fmt = mipi_csis_get_format(state, cfg, sdformat->which, sdformat->pad);
+	fmt = mipi_csis_get_format(state, sd_state, sdformat->which,
+				   sdformat->pad);
 
 	mutex_lock(&state->lock);
 	sdformat->format = *fmt;
@@ -944,7 +946,7 @@ static int mipi_csis_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct csi_state *state = mipi_sd_to_csis_state(sd);
@@ -959,7 +961,8 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		fmt = mipi_csis_get_format(state, cfg, code->which, code->pad);
+		fmt = mipi_csis_get_format(state, sd_state, code->which,
+					   code->pad);
 		code->code = fmt->code;
 		return 0;
 	}
@@ -976,7 +979,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *sdformat)
 {
 	struct csi_state *state = mipi_sd_to_csis_state(sd);
@@ -989,7 +992,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	 * modified.
 	 */
 	if (sdformat->pad == CSIS_PAD_SOURCE)
-		return mipi_csis_get_fmt(sd, cfg, sdformat);
+		return mipi_csis_get_fmt(sd, sd_state, sdformat);
 
 	if (sdformat->pad != CSIS_PAD_SINK)
 		return -EINVAL;
@@ -1029,7 +1032,8 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 			      &sdformat->format.height, 1,
 			      CSIS_MAX_PIX_HEIGHT, 0, 0);
 
-	fmt = mipi_csis_get_format(state, cfg, sdformat->which, sdformat->pad);
+	fmt = mipi_csis_get_format(state, sd_state, sdformat->which,
+				   sdformat->pad);
 
 	mutex_lock(&state->lock);
 
@@ -1040,7 +1044,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	sdformat->format = *fmt;
 
 	/* Propagate the format from sink to source. */
-	fmt = mipi_csis_get_format(state, cfg, sdformat->which,
+	fmt = mipi_csis_get_format(state, sd_state, sdformat->which,
 				   CSIS_PAD_SOURCE);
 	*fmt = sdformat->format;
 
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 6d9c49b39531..38a240764509 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -36,7 +36,7 @@ static int imgu_subdev_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	/* Initialize try_fmt */
 	for (i = 0; i < IMGU_NODE_NUM; i++) {
 		struct v4l2_mbus_framefmt *try_fmt =
-			v4l2_subdev_get_try_format(sd, fh->pad, i);
+			v4l2_subdev_get_try_format(sd, fh->state, i);
 
 		try_fmt->width = try_crop.width;
 		try_fmt->height = try_crop.height;
@@ -44,8 +44,8 @@ static int imgu_subdev_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		try_fmt->field = V4L2_FIELD_NONE;
 	}
 
-	*v4l2_subdev_get_try_crop(sd, fh->pad, IMGU_NODE_IN) = try_crop;
-	*v4l2_subdev_get_try_compose(sd, fh->pad, IMGU_NODE_IN) = try_crop;
+	*v4l2_subdev_get_try_crop(sd, fh->state, IMGU_NODE_IN) = try_crop;
+	*v4l2_subdev_get_try_compose(sd, fh->state, IMGU_NODE_IN) = try_crop;
 
 	return 0;
 }
@@ -120,7 +120,7 @@ static int imgu_subdev_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int imgu_subdev_get_fmt(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
 	struct imgu_device *imgu = v4l2_get_subdevdata(sd);
@@ -136,7 +136,7 @@ static int imgu_subdev_get_fmt(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		fmt->format = imgu_pipe->nodes[pad].pad_fmt;
 	} else {
-		mf = v4l2_subdev_get_try_format(sd, cfg, pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, pad);
 		fmt->format = *mf;
 	}
 
@@ -144,7 +144,7 @@ static int imgu_subdev_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int imgu_subdev_set_fmt(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
 	struct imgu_media_pipe *imgu_pipe;
@@ -161,7 +161,7 @@ static int imgu_subdev_set_fmt(struct v4l2_subdev *sd,
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		mf = v4l2_subdev_get_try_format(sd, cfg, pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, pad);
 	else
 		mf = &imgu_pipe->nodes[pad].pad_fmt;
 
@@ -189,7 +189,7 @@ static int imgu_subdev_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int imgu_subdev_get_selection(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
 	struct v4l2_rect *try_sel, *r;
@@ -202,11 +202,11 @@ static int imgu_subdev_get_selection(struct v4l2_subdev *sd,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		try_sel = v4l2_subdev_get_try_crop(sd, cfg, sel->pad);
+		try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
 		r = &imgu_sd->rect.eff;
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		try_sel = v4l2_subdev_get_try_compose(sd, cfg, sel->pad);
+		try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
 		r = &imgu_sd->rect.bds;
 		break;
 	default:
@@ -222,7 +222,7 @@ static int imgu_subdev_get_selection(struct v4l2_subdev *sd,
 }
 
 static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
 	struct imgu_device *imgu = v4l2_get_subdevdata(sd);
@@ -241,11 +241,11 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		try_sel = v4l2_subdev_get_try_crop(sd, cfg, sel->pad);
+		try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
 		rect = &imgu_sd->rect.eff;
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		try_sel = v4l2_subdev_get_try_compose(sd, cfg, sel->pad);
+		try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
 		rect = &imgu_sd->rect.bds;
 		break;
 	default:
diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/staging/media/omap4iss/iss_csi2.c
index a6dc2d2b1228..124ab2f44fbf 100644
--- a/drivers/staging/media/omap4iss/iss_csi2.c
+++ b/drivers/staging/media/omap4iss/iss_csi2.c
@@ -825,19 +825,20 @@ static const struct iss_video_operations csi2_issvideo_ops = {
 
 static struct v4l2_mbus_framefmt *
 __csi2_get_format(struct iss_csi2_device *csi2,
-		  struct v4l2_subdev_pad_config *cfg,
+		  struct v4l2_subdev_state *sd_state,
 		  unsigned int pad,
 		  enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csi2->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
+						  pad);
 
 	return &csi2->formats[pad];
 }
 
 static void
 csi2_try_format(struct iss_csi2_device *csi2,
-		struct v4l2_subdev_pad_config *cfg,
+		struct v4l2_subdev_state *sd_state,
 		unsigned int pad,
 		struct v4l2_mbus_framefmt *fmt,
 		enum v4l2_subdev_format_whence which)
@@ -868,7 +869,8 @@ csi2_try_format(struct iss_csi2_device *csi2,
 		 * compression.
 		 */
 		pixelcode = fmt->code;
-		format = __csi2_get_format(csi2, cfg, CSI2_PAD_SINK, which);
+		format = __csi2_get_format(csi2, sd_state, CSI2_PAD_SINK,
+					   which);
 		memcpy(fmt, format, sizeof(*fmt));
 
 		/*
@@ -894,7 +896,7 @@ csi2_try_format(struct iss_csi2_device *csi2,
  * return -EINVAL or zero on success
  */
 static int csi2_enum_mbus_code(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct iss_csi2_device *csi2 = v4l2_get_subdevdata(sd);
@@ -907,7 +909,7 @@ static int csi2_enum_mbus_code(struct v4l2_subdev *sd,
 
 		code->code = csi2_input_fmts[code->index];
 	} else {
-		format = __csi2_get_format(csi2, cfg, CSI2_PAD_SINK,
+		format = __csi2_get_format(csi2, sd_state, CSI2_PAD_SINK,
 					   code->which);
 		switch (code->index) {
 		case 0:
@@ -931,7 +933,7 @@ static int csi2_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int csi2_enum_frame_size(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct iss_csi2_device *csi2 = v4l2_get_subdevdata(sd);
@@ -943,7 +945,7 @@ static int csi2_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	csi2_try_format(csi2, cfg, fse->pad, &format, fse->which);
+	csi2_try_format(csi2, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -953,7 +955,7 @@ static int csi2_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	csi2_try_format(csi2, cfg, fse->pad, &format, fse->which);
+	csi2_try_format(csi2, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -968,13 +970,13 @@ static int csi2_enum_frame_size(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int csi2_get_format(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct iss_csi2_device *csi2 = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __csi2_get_format(csi2, cfg, fmt->pad, fmt->which);
+	format = __csi2_get_format(csi2, sd_state, fmt->pad, fmt->which);
 	if (!format)
 		return -EINVAL;
 
@@ -990,25 +992,26 @@ static int csi2_get_format(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int csi2_set_format(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct iss_csi2_device *csi2 = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __csi2_get_format(csi2, cfg, fmt->pad, fmt->which);
+	format = __csi2_get_format(csi2, sd_state, fmt->pad, fmt->which);
 	if (!format)
 		return -EINVAL;
 
-	csi2_try_format(csi2, cfg, fmt->pad, &fmt->format, fmt->which);
+	csi2_try_format(csi2, sd_state, fmt->pad, &fmt->format, fmt->which);
 	*format = fmt->format;
 
 	/* Propagate the format from sink to source */
 	if (fmt->pad == CSI2_PAD_SINK) {
-		format = __csi2_get_format(csi2, cfg, CSI2_PAD_SOURCE,
+		format = __csi2_get_format(csi2, sd_state, CSI2_PAD_SOURCE,
 					   fmt->which);
 		*format = fmt->format;
-		csi2_try_format(csi2, cfg, CSI2_PAD_SOURCE, format, fmt->which);
+		csi2_try_format(csi2, sd_state, CSI2_PAD_SOURCE, format,
+				fmt->which);
 	}
 
 	return 0;
@@ -1050,7 +1053,7 @@ static int csi2_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	csi2_set_format(sd, fh ? fh->pad : NULL, &format);
+	csi2_set_format(sd, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/staging/media/omap4iss/iss_ipipe.c b/drivers/staging/media/omap4iss/iss_ipipe.c
index 26be078b69f3..23f707cb336f 100644
--- a/drivers/staging/media/omap4iss/iss_ipipe.c
+++ b/drivers/staging/media/omap4iss/iss_ipipe.c
@@ -21,7 +21,7 @@
 
 static struct v4l2_mbus_framefmt *
 __ipipe_get_format(struct iss_ipipe_device *ipipe,
-		   struct v4l2_subdev_pad_config *cfg,
+		   struct v4l2_subdev_state *sd_state,
 		   unsigned int pad,
 		   enum v4l2_subdev_format_whence which);
 
@@ -175,12 +175,13 @@ static int ipipe_set_stream(struct v4l2_subdev *sd, int enable)
 
 static struct v4l2_mbus_framefmt *
 __ipipe_get_format(struct iss_ipipe_device *ipipe,
-		   struct v4l2_subdev_pad_config *cfg,
+		   struct v4l2_subdev_state *sd_state,
 		   unsigned int pad,
 		   enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ipipe->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&ipipe->subdev, sd_state,
+						  pad);
 
 	return &ipipe->formats[pad];
 }
@@ -194,7 +195,7 @@ __ipipe_get_format(struct iss_ipipe_device *ipipe,
  */
 static void
 ipipe_try_format(struct iss_ipipe_device *ipipe,
-		 struct v4l2_subdev_pad_config *cfg,
+		 struct v4l2_subdev_state *sd_state,
 		 unsigned int pad,
 		 struct v4l2_mbus_framefmt *fmt,
 		 enum v4l2_subdev_format_whence which)
@@ -222,7 +223,8 @@ ipipe_try_format(struct iss_ipipe_device *ipipe,
 		break;
 
 	case IPIPE_PAD_SOURCE_VP:
-		format = __ipipe_get_format(ipipe, cfg, IPIPE_PAD_SINK, which);
+		format = __ipipe_get_format(ipipe, sd_state, IPIPE_PAD_SINK,
+					    which);
 		memcpy(fmt, format, sizeof(*fmt));
 
 		fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
@@ -243,7 +245,7 @@ ipipe_try_format(struct iss_ipipe_device *ipipe,
  * return -EINVAL or zero on success
  */
 static int ipipe_enum_mbus_code(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
 	switch (code->pad) {
@@ -270,7 +272,7 @@ static int ipipe_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ipipe_enum_frame_size(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct iss_ipipe_device *ipipe = v4l2_get_subdevdata(sd);
@@ -282,7 +284,7 @@ static int ipipe_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	ipipe_try_format(ipipe, cfg, fse->pad, &format, fse->which);
+	ipipe_try_format(ipipe, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -292,7 +294,7 @@ static int ipipe_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	ipipe_try_format(ipipe, cfg, fse->pad, &format, fse->which);
+	ipipe_try_format(ipipe, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -309,13 +311,13 @@ static int ipipe_enum_frame_size(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int ipipe_get_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct iss_ipipe_device *ipipe = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __ipipe_get_format(ipipe, cfg, fmt->pad, fmt->which);
+	format = __ipipe_get_format(ipipe, sd_state, fmt->pad, fmt->which);
 	if (!format)
 		return -EINVAL;
 
@@ -333,25 +335,26 @@ static int ipipe_get_format(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int ipipe_set_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct iss_ipipe_device *ipipe = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __ipipe_get_format(ipipe, cfg, fmt->pad, fmt->which);
+	format = __ipipe_get_format(ipipe, sd_state, fmt->pad, fmt->which);
 	if (!format)
 		return -EINVAL;
 
-	ipipe_try_format(ipipe, cfg, fmt->pad, &fmt->format, fmt->which);
+	ipipe_try_format(ipipe, sd_state, fmt->pad, &fmt->format, fmt->which);
 	*format = fmt->format;
 
 	/* Propagate the format from sink to source */
 	if (fmt->pad == IPIPE_PAD_SINK) {
-		format = __ipipe_get_format(ipipe, cfg, IPIPE_PAD_SOURCE_VP,
+		format = __ipipe_get_format(ipipe, sd_state,
+					    IPIPE_PAD_SOURCE_VP,
 					    fmt->which);
 		*format = fmt->format;
-		ipipe_try_format(ipipe, cfg, IPIPE_PAD_SOURCE_VP, format,
+		ipipe_try_format(ipipe, sd_state, IPIPE_PAD_SOURCE_VP, format,
 				 fmt->which);
 	}
 
@@ -392,7 +395,7 @@ static int ipipe_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	ipipe_set_format(sd, fh ? fh->pad : NULL, &format);
+	ipipe_set_format(sd, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/staging/media/omap4iss/iss_ipipeif.c b/drivers/staging/media/omap4iss/iss_ipipeif.c
index c2978d02e797..5e7f25cd53ac 100644
--- a/drivers/staging/media/omap4iss/iss_ipipeif.c
+++ b/drivers/staging/media/omap4iss/iss_ipipeif.c
@@ -357,11 +357,12 @@ static int ipipeif_set_stream(struct v4l2_subdev *sd, int enable)
 
 static struct v4l2_mbus_framefmt *
 __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
-		     struct v4l2_subdev_pad_config *cfg, unsigned int pad,
+		     struct v4l2_subdev_state *sd_state, unsigned int pad,
 		     enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ipipeif->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
+						  pad);
 	return &ipipeif->formats[pad];
 }
 
@@ -374,7 +375,7 @@ __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
  */
 static void
 ipipeif_try_format(struct iss_ipipeif_device *ipipeif,
-		   struct v4l2_subdev_pad_config *cfg, unsigned int pad,
+		   struct v4l2_subdev_state *sd_state, unsigned int pad,
 		   struct v4l2_mbus_framefmt *fmt,
 		   enum v4l2_subdev_format_whence which)
 {
@@ -403,7 +404,8 @@ ipipeif_try_format(struct iss_ipipeif_device *ipipeif,
 		break;
 
 	case IPIPEIF_PAD_SOURCE_ISIF_SF:
-		format = __ipipeif_get_format(ipipeif, cfg, IPIPEIF_PAD_SINK,
+		format = __ipipeif_get_format(ipipeif, sd_state,
+					      IPIPEIF_PAD_SINK,
 					      which);
 		memcpy(fmt, format, sizeof(*fmt));
 
@@ -418,7 +420,8 @@ ipipeif_try_format(struct iss_ipipeif_device *ipipeif,
 		break;
 
 	case IPIPEIF_PAD_SOURCE_VP:
-		format = __ipipeif_get_format(ipipeif, cfg, IPIPEIF_PAD_SINK,
+		format = __ipipeif_get_format(ipipeif, sd_state,
+					      IPIPEIF_PAD_SINK,
 					      which);
 		memcpy(fmt, format, sizeof(*fmt));
 
@@ -442,7 +445,7 @@ ipipeif_try_format(struct iss_ipipeif_device *ipipeif,
  * return -EINVAL or zero on success
  */
 static int ipipeif_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct iss_ipipeif_device *ipipeif = v4l2_get_subdevdata(sd);
@@ -462,7 +465,8 @@ static int ipipeif_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index != 0)
 			return -EINVAL;
 
-		format = __ipipeif_get_format(ipipeif, cfg, IPIPEIF_PAD_SINK,
+		format = __ipipeif_get_format(ipipeif, sd_state,
+					      IPIPEIF_PAD_SINK,
 					      code->which);
 
 		code->code = format->code;
@@ -476,7 +480,7 @@ static int ipipeif_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ipipeif_enum_frame_size(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct iss_ipipeif_device *ipipeif = v4l2_get_subdevdata(sd);
@@ -488,7 +492,7 @@ static int ipipeif_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	ipipeif_try_format(ipipeif, cfg, fse->pad, &format, fse->which);
+	ipipeif_try_format(ipipeif, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -498,7 +502,7 @@ static int ipipeif_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	ipipeif_try_format(ipipeif, cfg, fse->pad, &format, fse->which);
+	ipipeif_try_format(ipipeif, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -515,13 +519,13 @@ static int ipipeif_enum_frame_size(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int ipipeif_get_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct iss_ipipeif_device *ipipeif = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __ipipeif_get_format(ipipeif, cfg, fmt->pad, fmt->which);
+	format = __ipipeif_get_format(ipipeif, sd_state, fmt->pad, fmt->which);
 	if (!format)
 		return -EINVAL;
 
@@ -539,33 +543,36 @@ static int ipipeif_get_format(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int ipipeif_set_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct iss_ipipeif_device *ipipeif = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __ipipeif_get_format(ipipeif, cfg, fmt->pad, fmt->which);
+	format = __ipipeif_get_format(ipipeif, sd_state, fmt->pad, fmt->which);
 	if (!format)
 		return -EINVAL;
 
-	ipipeif_try_format(ipipeif, cfg, fmt->pad, &fmt->format, fmt->which);
+	ipipeif_try_format(ipipeif, sd_state, fmt->pad, &fmt->format,
+			   fmt->which);
 	*format = fmt->format;
 
 	/* Propagate the format from sink to source */
 	if (fmt->pad == IPIPEIF_PAD_SINK) {
-		format = __ipipeif_get_format(ipipeif, cfg,
+		format = __ipipeif_get_format(ipipeif, sd_state,
 					      IPIPEIF_PAD_SOURCE_ISIF_SF,
 					      fmt->which);
 		*format = fmt->format;
-		ipipeif_try_format(ipipeif, cfg, IPIPEIF_PAD_SOURCE_ISIF_SF,
+		ipipeif_try_format(ipipeif, sd_state,
+				   IPIPEIF_PAD_SOURCE_ISIF_SF,
 				   format, fmt->which);
 
-		format = __ipipeif_get_format(ipipeif, cfg,
+		format = __ipipeif_get_format(ipipeif, sd_state,
 					      IPIPEIF_PAD_SOURCE_VP,
 					      fmt->which);
 		*format = fmt->format;
-		ipipeif_try_format(ipipeif, cfg, IPIPEIF_PAD_SOURCE_VP, format,
+		ipipeif_try_format(ipipeif, sd_state, IPIPEIF_PAD_SOURCE_VP,
+				   format,
 				   fmt->which);
 	}
 
@@ -608,7 +615,7 @@ static int ipipeif_init_formats(struct v4l2_subdev *sd,
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	ipipeif_set_format(sd, fh ? fh->pad : NULL, &format);
+	ipipeif_set_format(sd, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/staging/media/omap4iss/iss_resizer.c b/drivers/staging/media/omap4iss/iss_resizer.c
index 3b6875cbca9b..a5f8f9f1ab16 100644
--- a/drivers/staging/media/omap4iss/iss_resizer.c
+++ b/drivers/staging/media/omap4iss/iss_resizer.c
@@ -416,11 +416,12 @@ static int resizer_set_stream(struct v4l2_subdev *sd, int enable)
 
 static struct v4l2_mbus_framefmt *
 __resizer_get_format(struct iss_resizer_device *resizer,
-		     struct v4l2_subdev_pad_config *cfg, unsigned int pad,
+		     struct v4l2_subdev_state *sd_state, unsigned int pad,
 		     enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&resizer->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&resizer->subdev, sd_state,
+						  pad);
 	return &resizer->formats[pad];
 }
 
@@ -433,7 +434,7 @@ __resizer_get_format(struct iss_resizer_device *resizer,
  */
 static void
 resizer_try_format(struct iss_resizer_device *resizer,
-		   struct v4l2_subdev_pad_config *cfg, unsigned int pad,
+		   struct v4l2_subdev_state *sd_state, unsigned int pad,
 		   struct v4l2_mbus_framefmt *fmt,
 		   enum v4l2_subdev_format_whence which)
 {
@@ -461,7 +462,8 @@ resizer_try_format(struct iss_resizer_device *resizer,
 
 	case RESIZER_PAD_SOURCE_MEM:
 		pixelcode = fmt->code;
-		format = __resizer_get_format(resizer, cfg, RESIZER_PAD_SINK,
+		format = __resizer_get_format(resizer, sd_state,
+					      RESIZER_PAD_SINK,
 					      which);
 		memcpy(fmt, format, sizeof(*fmt));
 
@@ -492,7 +494,7 @@ resizer_try_format(struct iss_resizer_device *resizer,
  * return -EINVAL or zero on success
  */
 static int resizer_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct iss_resizer_device *resizer = v4l2_get_subdevdata(sd);
@@ -507,7 +509,8 @@ static int resizer_enum_mbus_code(struct v4l2_subdev *sd,
 		break;
 
 	case RESIZER_PAD_SOURCE_MEM:
-		format = __resizer_get_format(resizer, cfg, RESIZER_PAD_SINK,
+		format = __resizer_get_format(resizer, sd_state,
+					      RESIZER_PAD_SINK,
 					      code->which);
 
 		if (code->index == 0) {
@@ -537,7 +540,7 @@ static int resizer_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int resizer_enum_frame_size(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct iss_resizer_device *resizer = v4l2_get_subdevdata(sd);
@@ -549,7 +552,7 @@ static int resizer_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	resizer_try_format(resizer, cfg, fse->pad, &format, fse->which);
+	resizer_try_format(resizer, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -559,7 +562,7 @@ static int resizer_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	resizer_try_format(resizer, cfg, fse->pad, &format, fse->which);
+	resizer_try_format(resizer, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -576,13 +579,13 @@ static int resizer_enum_frame_size(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int resizer_get_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct iss_resizer_device *resizer = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __resizer_get_format(resizer, cfg, fmt->pad, fmt->which);
+	format = __resizer_get_format(resizer, sd_state, fmt->pad, fmt->which);
 	if (!format)
 		return -EINVAL;
 
@@ -600,26 +603,28 @@ static int resizer_get_format(struct v4l2_subdev *sd,
  * to the format type.
  */
 static int resizer_set_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct iss_resizer_device *resizer = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __resizer_get_format(resizer, cfg, fmt->pad, fmt->which);
+	format = __resizer_get_format(resizer, sd_state, fmt->pad, fmt->which);
 	if (!format)
 		return -EINVAL;
 
-	resizer_try_format(resizer, cfg, fmt->pad, &fmt->format, fmt->which);
+	resizer_try_format(resizer, sd_state, fmt->pad, &fmt->format,
+			   fmt->which);
 	*format = fmt->format;
 
 	/* Propagate the format from sink to source */
 	if (fmt->pad == RESIZER_PAD_SINK) {
-		format = __resizer_get_format(resizer, cfg,
+		format = __resizer_get_format(resizer, sd_state,
 					      RESIZER_PAD_SOURCE_MEM,
 					      fmt->which);
 		*format = fmt->format;
-		resizer_try_format(resizer, cfg, RESIZER_PAD_SOURCE_MEM, format,
+		resizer_try_format(resizer, sd_state, RESIZER_PAD_SOURCE_MEM,
+				   format,
 				   fmt->which);
 	}
 
@@ -662,7 +667,7 @@ static int resizer_init_formats(struct v4l2_subdev *sd,
 	format.format.code = MEDIA_BUS_FMT_UYVY8_1X16;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	resizer_set_format(sd, fh ? fh->pad : NULL, &format);
+	resizer_set_format(sd, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index e938bf4c48b6..b26e44adb2be 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -64,7 +64,7 @@ static const struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] = {
  * V4L2 Subdevice Pad Operations
  */
 static int csi_enum_bus_code(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
@@ -79,7 +79,7 @@ static int csi_enum_bus_code(struct v4l2_subdev *subdev,
 }
 
 static int csi_get_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
@@ -127,7 +127,7 @@ static void csi_chan_update_blank_intervals(struct tegra_csi_channel *csi_chan,
 }
 
 static int csi_enum_framesizes(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	unsigned int i;
@@ -154,7 +154,7 @@ static int csi_enum_framesizes(struct v4l2_subdev *subdev,
 }
 
 static int csi_enum_frameintervals(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
@@ -181,7 +181,7 @@ static int csi_enum_frameintervals(struct v4l2_subdev *subdev,
 }
 
 static int csi_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index b76e9110e706..89709cd06d4d 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -493,7 +493,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	const struct tegra_video_format *fmtinfo;
 	struct v4l2_subdev *subdev;
 	struct v4l2_subdev_format fmt;
-	struct v4l2_subdev_pad_config *pad_cfg;
+	struct v4l2_subdev_state *sd_state;
 	struct v4l2_subdev_frame_size_enum fse = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -507,8 +507,8 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	if (!subdev)
 		return -ENODEV;
 
-	pad_cfg = v4l2_subdev_alloc_pad_config(subdev);
-	if (!pad_cfg)
+	sd_state = v4l2_subdev_alloc_state(subdev);
+	if (!sd_state)
 		return -ENOMEM;
 	/*
 	 * Retrieve the format information and if requested format isn't
@@ -532,33 +532,33 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	 * If not available, try to get crop boundary from subdev.
 	 */
 	fse.code = fmtinfo->code;
-	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, pad_cfg, &fse);
+	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
 		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
-			pad_cfg->try_crop.width = 0;
-			pad_cfg->try_crop.height = 0;
+			sd_state->pads->try_crop.width = 0;
+			sd_state->pads->try_crop.height = 0;
 		} else {
 			ret = v4l2_subdev_call(subdev, pad, get_selection,
 					       NULL, &sdsel);
 			if (ret)
 				return -EINVAL;
 
-			pad_cfg->try_crop.width = sdsel.r.width;
-			pad_cfg->try_crop.height = sdsel.r.height;
+			sd_state->pads->try_crop.width = sdsel.r.width;
+			sd_state->pads->try_crop.height = sdsel.r.height;
 		}
 	} else {
-		pad_cfg->try_crop.width = fse.max_width;
-		pad_cfg->try_crop.height = fse.max_height;
+		sd_state->pads->try_crop.width = fse.max_width;
+		sd_state->pads->try_crop.height = fse.max_height;
 	}
 
-	ret = v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
+	ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
 	if (ret < 0)
 		return ret;
 
 	v4l2_fill_pix_format(pix, &fmt.format);
 	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
 
-	v4l2_subdev_free_pad_config(pad_cfg);
+	v4l2_subdev_free_state(sd_state);
 
 	return 0;
 }
-- 
2.25.1

