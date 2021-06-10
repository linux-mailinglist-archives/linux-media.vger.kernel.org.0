Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7933A2EC2
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 16:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbhFJO6g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 10:58:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45088 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbhFJO6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 10:58:35 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D64218C1;
        Thu, 10 Jun 2021 16:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623336997;
        bh=wzEh+mugPkPKBH2WUWL9k/3ZVxQ5ATAxNSi06a4QQoc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hKZfC6LIBZnRo9fsMOld5e6JstVt7LA5wZZuIxlN6wqUJstK/altAw3ljc6HknBqD
         urGcP658Z9l6KBsAaCyt6a0E5x5jyEJlFIUIdk4kM7wuHa/VIMTqPSEjPsLnq9tcbV
         0VcElfXMu4M/RyO/AoLV9bg5QcxQyueINaqpuXyU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 6/9] media: platform: changes for subdev-wide state struct
Date:   Thu, 10 Jun 2021 17:56:03 +0300
Message-Id: <20210610145606.3468235-7-tomi.valkeinen@ideasonboard.com>
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

This patch does the required changes for drivers/media/platform/

Note that this patch is meant to be squashed into the main patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c |  19 +--
 drivers/media/platform/atmel/atmel-isi.c      |  19 +--
 drivers/media/platform/cadence/cdns-csi2tx.c  |  14 +--
 .../media/platform/exynos4-is/fimc-capture.c  |  22 ++--
 drivers/media/platform/exynos4-is/fimc-isp.c  |  37 +++---
 drivers/media/platform/exynos4-is/fimc-lite.c |  39 +++---
 drivers/media/platform/exynos4-is/mipi-csis.c |  17 +--
 .../media/platform/marvell-ccic/mcam-core.c   |   5 +-
 drivers/media/platform/omap3isp/ispccdc.c     |  85 +++++++------
 drivers/media/platform/omap3isp/ispccp2.c     |  49 ++++----
 drivers/media/platform/omap3isp/ispcsi2.c     |  41 ++++---
 drivers/media/platform/omap3isp/isppreview.c  |  69 ++++++-----
 drivers/media/platform/omap3isp/ispresizer.c  |  70 ++++++-----
 drivers/media/platform/pxa_camera.c           |   5 +-
 .../media/platform/qcom/camss/camss-csid.c    |  35 +++---
 .../media/platform/qcom/camss/camss-csiphy.c  |  40 ++++---
 .../media/platform/qcom/camss/camss-ispif.c   |  36 +++---
 drivers/media/platform/qcom/camss/camss-vfe.c |  84 ++++++-------
 drivers/media/platform/rcar-vin/rcar-csi2.c   |   8 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |  10 +-
 drivers/media/platform/renesas-ceu.c          |   7 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 112 ++++++++++--------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  95 +++++++++------
 drivers/media/platform/stm32/stm32-dcmi.c     |  14 ++-
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  16 +--
 drivers/media/platform/ti-vpe/cal-camerarx.c  |  35 +++---
 drivers/media/platform/via-camera.c           |   5 +-
 drivers/media/platform/video-mux.c            |  22 ++--
 drivers/media/platform/vsp1/vsp1_brx.c        |  34 +++---
 drivers/media/platform/vsp1/vsp1_clu.c        |  13 +-
 drivers/media/platform/vsp1/vsp1_entity.c     |  59 ++++-----
 drivers/media/platform/vsp1/vsp1_entity.h     |  20 ++--
 drivers/media/platform/vsp1/vsp1_histo.c      |  51 ++++----
 drivers/media/platform/vsp1/vsp1_hsit.c       |  14 ++-
 drivers/media/platform/vsp1/vsp1_lif.c        |  13 +-
 drivers/media/platform/vsp1/vsp1_lut.c        |  13 +-
 drivers/media/platform/vsp1/vsp1_rwpf.c       |  32 ++---
 drivers/media/platform/vsp1/vsp1_rwpf.h       |   2 +-
 drivers/media/platform/vsp1/vsp1_sru.c        |  22 ++--
 drivers/media/platform/vsp1/vsp1_uds.c        |  22 ++--
 drivers/media/platform/vsp1/vsp1_uif.c        |  27 +++--
 .../media/platform/xilinx/xilinx-csi2rxss.c   |  26 ++--
 drivers/media/platform/xilinx/xilinx-tpg.c    |  25 ++--
 drivers/media/platform/xilinx/xilinx-vip.c    |  12 +-
 drivers/media/platform/xilinx/xilinx-vip.h    |   4 +-
 45 files changed, 788 insertions(+), 611 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 46c6e3e20f33..19daa49bf604 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1095,7 +1095,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 }
 
 static void isc_try_fse(struct isc_device *isc,
-			struct v4l2_subdev_pad_config *pad_cfg)
+			struct v4l2_subdev_state *sd_state)
 {
 	int ret;
 	struct v4l2_subdev_frame_size_enum fse = {};
@@ -1111,17 +1111,17 @@ static void isc_try_fse(struct isc_device *isc,
 	fse.which = V4L2_SUBDEV_FORMAT_TRY;
 
 	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, enum_frame_size,
-			       pad_cfg, &fse);
+			       sd_state, &fse);
 	/*
 	 * Attempt to obtain format size from subdev. If not available,
 	 * just use the maximum ISC can receive.
 	 */
 	if (ret) {
-		pad_cfg->try_crop.width = isc->max_width;
-		pad_cfg->try_crop.height = isc->max_height;
+		sd_state->pads->try_crop.width = isc->max_width;
+		sd_state->pads->try_crop.height = isc->max_height;
 	} else {
-		pad_cfg->try_crop.width = fse.max_width;
-		pad_cfg->try_crop.height = fse.max_height;
+		sd_state->pads->try_crop.width = fse.max_width;
+		sd_state->pads->try_crop.height = fse.max_height;
 	}
 }
 
@@ -1132,6 +1132,9 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
 	struct isc_format *sd_fmt = NULL, *direct_fmt = NULL;
 	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg = {};
+	struct v4l2_subdev_state pad_state = {
+		.pads = &pad_cfg
+		};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -1229,11 +1232,11 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
 		goto isc_try_fmt_err;
 
 	/* Obtain frame sizes if possible to have crop requirements ready */
-	isc_try_fse(isc, &pad_cfg);
+	isc_try_fse(isc, &pad_state);
 
 	v4l2_fill_mbus_format(&format.format, pixfmt, mbus_code);
 	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, set_fmt,
-			       &pad_cfg, &format);
+			       &pad_state, &format);
 	if (ret < 0)
 		goto isc_try_fmt_subdev_err;
 
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 5b1dd358f2e6..095d80c4f59e 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -557,7 +557,7 @@ static const struct isi_format *find_format_by_fourcc(struct atmel_isi *isi,
 }
 
 static void isi_try_fse(struct atmel_isi *isi, const struct isi_format *isi_fmt,
-			struct v4l2_subdev_pad_config *pad_cfg)
+			struct v4l2_subdev_state *sd_state)
 {
 	int ret;
 	struct v4l2_subdev_frame_size_enum fse = {
@@ -566,17 +566,17 @@ static void isi_try_fse(struct atmel_isi *isi, const struct isi_format *isi_fmt,
 	};
 
 	ret = v4l2_subdev_call(isi->entity.subdev, pad, enum_frame_size,
-			       pad_cfg, &fse);
+			       sd_state, &fse);
 	/*
 	 * Attempt to obtain format size from subdev. If not available,
 	 * just use the maximum ISI can receive.
 	 */
 	if (ret) {
-		pad_cfg->try_crop.width = MAX_SUPPORT_WIDTH;
-		pad_cfg->try_crop.height = MAX_SUPPORT_HEIGHT;
+		sd_state->pads->try_crop.width = MAX_SUPPORT_WIDTH;
+		sd_state->pads->try_crop.height = MAX_SUPPORT_HEIGHT;
 	} else {
-		pad_cfg->try_crop.width = fse.max_width;
-		pad_cfg->try_crop.height = fse.max_height;
+		sd_state->pads->try_crop.width = fse.max_width;
+		sd_state->pads->try_crop.height = fse.max_height;
 	}
 }
 
@@ -586,6 +586,9 @@ static int isi_try_fmt(struct atmel_isi *isi, struct v4l2_format *f,
 	const struct isi_format *isi_fmt;
 	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg = {};
+	struct v4l2_subdev_state pad_state = {
+		.pads = &pad_cfg
+		};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -603,10 +606,10 @@ static int isi_try_fmt(struct atmel_isi *isi, struct v4l2_format *f,
 
 	v4l2_fill_mbus_format(&format.format, pixfmt, isi_fmt->mbus_code);
 
-	isi_try_fse(isi, isi_fmt, &pad_cfg);
+	isi_try_fse(isi, isi_fmt, &pad_state);
 
 	ret = v4l2_subdev_call(isi->entity.subdev, pad, set_fmt,
-			       &pad_cfg, &format);
+			       &pad_state, &format);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 765ae408970a..5a67fba73ddd 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -156,7 +156,7 @@ static const struct csi2tx_fmt *csi2tx_get_fmt_from_mbus(u32 mbus)
 }
 
 static int csi2tx_enum_mbus_code(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad || code->index >= ARRAY_SIZE(csi2tx_formats))
@@ -169,20 +169,20 @@ static int csi2tx_enum_mbus_code(struct v4l2_subdev *subdev,
 
 static struct v4l2_mbus_framefmt *
 __csi2tx_get_pad_format(struct v4l2_subdev *subdev,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *fmt)
 {
 	struct csi2tx_priv *csi2tx = v4l2_subdev_to_csi2tx(subdev);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(subdev, cfg,
+		return v4l2_subdev_get_try_format(subdev, sd_state,
 						  fmt->pad);
 
 	return &csi2tx->pad_fmts[fmt->pad];
 }
 
 static int csi2tx_get_pad_format(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	const struct v4l2_mbus_framefmt *format;
@@ -191,7 +191,7 @@ static int csi2tx_get_pad_format(struct v4l2_subdev *subdev,
 	if (fmt->pad == CSI2TX_PAD_SOURCE)
 		return -EINVAL;
 
-	format = __csi2tx_get_pad_format(subdev, cfg, fmt);
+	format = __csi2tx_get_pad_format(subdev, sd_state, fmt);
 	if (!format)
 		return -EINVAL;
 
@@ -201,7 +201,7 @@ static int csi2tx_get_pad_format(struct v4l2_subdev *subdev,
 }
 
 static int csi2tx_set_pad_format(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
 	const struct v4l2_mbus_framefmt *src_format = &fmt->format;
@@ -214,7 +214,7 @@ static int csi2tx_set_pad_format(struct v4l2_subdev *subdev,
 	if (!csi2tx_get_fmt_from_mbus(fmt->format.code))
 		src_format = &fmt_default;
 
-	dst_format = __csi2tx_get_pad_format(subdev, cfg, fmt);
+	dst_format = __csi2tx_get_pad_format(subdev, sd_state, fmt);
 	if (!dst_format)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index 0da36443173c..7ff4024003f4 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -1454,7 +1454,7 @@ void fimc_sensor_notify(struct v4l2_subdev *sd, unsigned int notification,
 }
 
 static int fimc_subdev_enum_mbus_code(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct fimc_fmt *fmt;
@@ -1467,7 +1467,7 @@ static int fimc_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int fimc_subdev_get_fmt(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
 	struct fimc_dev *fimc = v4l2_get_subdevdata(sd);
@@ -1476,7 +1476,7 @@ static int fimc_subdev_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mf;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		fmt->format = *mf;
 		return 0;
 	}
@@ -1508,7 +1508,7 @@ static int fimc_subdev_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_subdev_set_fmt(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
 	struct fimc_dev *fimc = v4l2_get_subdevdata(sd);
@@ -1531,7 +1531,7 @@ static int fimc_subdev_set_fmt(struct v4l2_subdev *sd,
 	mf->colorspace = V4L2_COLORSPACE_JPEG;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*mf = fmt->format;
 		return 0;
 	}
@@ -1574,7 +1574,7 @@ static int fimc_subdev_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_subdev_get_selection(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
 	struct fimc_dev *fimc = v4l2_get_subdevdata(sd);
@@ -1601,10 +1601,10 @@ static int fimc_subdev_get_selection(struct v4l2_subdev *sd,
 		return 0;
 
 	case V4L2_SEL_TGT_CROP:
-		try_sel = v4l2_subdev_get_try_crop(sd, cfg, sel->pad);
+		try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		try_sel = v4l2_subdev_get_try_compose(sd, cfg, sel->pad);
+		try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
 		f = &ctx->d_frame;
 		break;
 	default:
@@ -1630,7 +1630,7 @@ static int fimc_subdev_get_selection(struct v4l2_subdev *sd,
 }
 
 static int fimc_subdev_set_selection(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
 {
 	struct fimc_dev *fimc = v4l2_get_subdevdata(sd);
@@ -1648,10 +1648,10 @@ static int fimc_subdev_set_selection(struct v4l2_subdev *sd,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		try_sel = v4l2_subdev_get_try_crop(sd, cfg, sel->pad);
+		try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		try_sel = v4l2_subdev_get_try_compose(sd, cfg, sel->pad);
+		try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
 		f = &ctx->d_frame;
 		break;
 	default:
diff --git a/drivers/media/platform/exynos4-is/fimc-isp.c b/drivers/media/platform/exynos4-is/fimc-isp.c
index 74b49d30901e..855235bea46d 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp.c
@@ -106,7 +106,7 @@ static const struct media_entity_operations fimc_is_subdev_media_ops = {
 };
 
 static int fimc_is_subdev_enum_mbus_code(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
 	const struct fimc_fmt *fmt;
@@ -119,14 +119,14 @@ static int fimc_is_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int fimc_isp_subdev_get_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
 	struct fimc_isp *isp = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf = &fmt->format;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*mf = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		*mf = *v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		return 0;
 	}
 
@@ -156,7 +156,7 @@ static int fimc_isp_subdev_get_fmt(struct v4l2_subdev *sd,
 }
 
 static void __isp_subdev_try_format(struct fimc_isp *isp,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
 	struct v4l2_mbus_framefmt *mf = &fmt->format;
@@ -172,8 +172,9 @@ static void __isp_subdev_try_format(struct fimc_isp *isp,
 		mf->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	} else {
 		if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-			format = v4l2_subdev_get_try_format(&isp->subdev, cfg,
-						FIMC_ISP_SD_PAD_SINK);
+			format = v4l2_subdev_get_try_format(&isp->subdev,
+							    sd_state,
+							    FIMC_ISP_SD_PAD_SINK);
 		else
 			format = &isp->sink_fmt;
 
@@ -191,7 +192,7 @@ static void __isp_subdev_try_format(struct fimc_isp *isp,
 }
 
 static int fimc_isp_subdev_set_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
 	struct fimc_isp *isp = v4l2_get_subdevdata(sd);
@@ -203,10 +204,10 @@ static int fimc_isp_subdev_set_fmt(struct v4l2_subdev *sd,
 		 __func__, fmt->pad, mf->code, mf->width, mf->height);
 
 	mutex_lock(&isp->subdev_lock);
-	__isp_subdev_try_format(isp, cfg, fmt);
+	__isp_subdev_try_format(isp, sd_state, fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*mf = fmt->format;
 
 		/* Propagate format to the source pads */
@@ -217,8 +218,10 @@ static int fimc_isp_subdev_set_fmt(struct v4l2_subdev *sd,
 			for (pad = FIMC_ISP_SD_PAD_SRC_FIFO;
 					pad < FIMC_ISP_SD_PADS_NUM; pad++) {
 				format.pad = pad;
-				__isp_subdev_try_format(isp, cfg, &format);
-				mf = v4l2_subdev_get_try_format(sd, cfg, pad);
+				__isp_subdev_try_format(isp, sd_state,
+							&format);
+				mf = v4l2_subdev_get_try_format(sd, sd_state,
+								pad);
 				*mf = format.format;
 			}
 		}
@@ -230,7 +233,8 @@ static int fimc_isp_subdev_set_fmt(struct v4l2_subdev *sd,
 				isp->sink_fmt = *mf;
 
 				format.pad = FIMC_ISP_SD_PAD_SRC_DMA;
-				__isp_subdev_try_format(isp, cfg, &format);
+				__isp_subdev_try_format(isp, sd_state,
+							&format);
 
 				isp->src_fmt = format.format;
 				__is_set_frame_size(is, &isp->src_fmt);
@@ -370,15 +374,18 @@ static int fimc_isp_subdev_open(struct v4l2_subdev *sd,
 		.field = V4L2_FIELD_NONE,
 	};
 
-	format = v4l2_subdev_get_try_format(sd, fh->pad, FIMC_ISP_SD_PAD_SINK);
+	format = v4l2_subdev_get_try_format(sd, fh->state,
+					    FIMC_ISP_SD_PAD_SINK);
 	*format = fmt;
 
-	format = v4l2_subdev_get_try_format(sd, fh->pad, FIMC_ISP_SD_PAD_SRC_FIFO);
+	format = v4l2_subdev_get_try_format(sd, fh->state,
+					    FIMC_ISP_SD_PAD_SRC_FIFO);
 	fmt.width = DEFAULT_PREVIEW_STILL_WIDTH;
 	fmt.height = DEFAULT_PREVIEW_STILL_HEIGHT;
 	*format = fmt;
 
-	format = v4l2_subdev_get_try_format(sd, fh->pad, FIMC_ISP_SD_PAD_SRC_DMA);
+	format = v4l2_subdev_get_try_format(sd, fh->state,
+					    FIMC_ISP_SD_PAD_SRC_DMA);
 	*format = fmt;
 
 	return 0;
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index 4d8b18078ff3..aaa3af0493ce 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -550,7 +550,7 @@ static const struct v4l2_file_operations fimc_lite_fops = {
  */
 
 static const struct fimc_fmt *fimc_lite_subdev_try_fmt(struct fimc_lite *fimc,
-					struct v4l2_subdev_pad_config *cfg,
+					struct v4l2_subdev_state *sd_state,
 					struct v4l2_subdev_format *format)
 {
 	struct flite_drvdata *dd = fimc->dd;
@@ -574,14 +574,16 @@ static const struct fimc_fmt *fimc_lite_subdev_try_fmt(struct fimc_lite *fimc,
 		struct v4l2_rect *rect;
 
 		if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-			sink_fmt = v4l2_subdev_get_try_format(&fimc->subdev, cfg,
-						FLITE_SD_PAD_SINK);
+			sink_fmt = v4l2_subdev_get_try_format(&fimc->subdev,
+							      sd_state,
+							      FLITE_SD_PAD_SINK);
 
 			mf->code = sink_fmt->code;
 			mf->colorspace = sink_fmt->colorspace;
 
-			rect = v4l2_subdev_get_try_crop(&fimc->subdev, cfg,
-						FLITE_SD_PAD_SINK);
+			rect = v4l2_subdev_get_try_crop(&fimc->subdev,
+							sd_state,
+							FLITE_SD_PAD_SINK);
 		} else {
 			mf->code = sink->fmt->mbus_code;
 			mf->colorspace = sink->fmt->colorspace;
@@ -1002,7 +1004,7 @@ static const struct media_entity_operations fimc_lite_subdev_media_ops = {
 };
 
 static int fimc_lite_subdev_enum_mbus_code(struct v4l2_subdev *sd,
-					   struct v4l2_subdev_pad_config *cfg,
+					   struct v4l2_subdev_state *sd_state,
 					   struct v4l2_subdev_mbus_code_enum *code)
 {
 	const struct fimc_fmt *fmt;
@@ -1016,16 +1018,16 @@ static int fimc_lite_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 
 static struct v4l2_mbus_framefmt *__fimc_lite_subdev_get_try_fmt(
 		struct v4l2_subdev *sd,
-		struct v4l2_subdev_pad_config *cfg, unsigned int pad)
+		struct v4l2_subdev_state *sd_state, unsigned int pad)
 {
 	if (pad != FLITE_SD_PAD_SINK)
 		pad = FLITE_SD_PAD_SOURCE_DMA;
 
-	return v4l2_subdev_get_try_format(sd, cfg, pad);
+	return v4l2_subdev_get_try_format(sd, sd_state, pad);
 }
 
 static int fimc_lite_subdev_get_fmt(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
 	struct fimc_lite *fimc = v4l2_get_subdevdata(sd);
@@ -1033,7 +1035,7 @@ static int fimc_lite_subdev_get_fmt(struct v4l2_subdev *sd,
 	struct flite_frame *f = &fimc->inp_frame;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = __fimc_lite_subdev_get_try_fmt(sd, cfg, fmt->pad);
+		mf = __fimc_lite_subdev_get_try_fmt(sd, sd_state, fmt->pad);
 		fmt->format = *mf;
 		return 0;
 	}
@@ -1056,7 +1058,7 @@ static int fimc_lite_subdev_get_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_lite_subdev_set_fmt(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
 	struct fimc_lite *fimc = v4l2_get_subdevdata(sd);
@@ -1078,17 +1080,18 @@ static int fimc_lite_subdev_set_fmt(struct v4l2_subdev *sd,
 		return -EBUSY;
 	}
 
-	ffmt = fimc_lite_subdev_try_fmt(fimc, cfg, fmt);
+	ffmt = fimc_lite_subdev_try_fmt(fimc, sd_state, fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *src_fmt;
 
-		mf = __fimc_lite_subdev_get_try_fmt(sd, cfg, fmt->pad);
+		mf = __fimc_lite_subdev_get_try_fmt(sd, sd_state, fmt->pad);
 		*mf = fmt->format;
 
 		if (fmt->pad == FLITE_SD_PAD_SINK) {
 			unsigned int pad = FLITE_SD_PAD_SOURCE_DMA;
-			src_fmt = __fimc_lite_subdev_get_try_fmt(sd, cfg, pad);
+			src_fmt = __fimc_lite_subdev_get_try_fmt(sd, sd_state,
+								 pad);
 			*src_fmt = *mf;
 		}
 
@@ -1116,7 +1119,7 @@ static int fimc_lite_subdev_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int fimc_lite_subdev_get_selection(struct v4l2_subdev *sd,
-					  struct v4l2_subdev_pad_config *cfg,
+					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
 	struct fimc_lite *fimc = v4l2_get_subdevdata(sd);
@@ -1128,7 +1131,7 @@ static int fimc_lite_subdev_get_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sel->r = *v4l2_subdev_get_try_crop(sd, cfg, sel->pad);
+		sel->r = *v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
 		return 0;
 	}
 
@@ -1151,7 +1154,7 @@ static int fimc_lite_subdev_get_selection(struct v4l2_subdev *sd,
 }
 
 static int fimc_lite_subdev_set_selection(struct v4l2_subdev *sd,
-					  struct v4l2_subdev_pad_config *cfg,
+					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_selection *sel)
 {
 	struct fimc_lite *fimc = v4l2_get_subdevdata(sd);
@@ -1165,7 +1168,7 @@ static int fimc_lite_subdev_set_selection(struct v4l2_subdev *sd,
 	fimc_lite_try_crop(fimc, &sel->r);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_crop(sd, cfg, sel->pad) = sel->r;
+		*v4l2_subdev_get_try_crop(sd, sd_state, sel->pad) = sel->r;
 	} else {
 		unsigned long flags;
 		spin_lock_irqsave(&fimc->slock, flags);
diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
index ebf39c856894..32b23329b033 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -537,7 +537,7 @@ static int s5pcsis_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int s5pcsis_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index >= ARRAY_SIZE(s5pcsis_formats))
@@ -565,23 +565,25 @@ static struct csis_pix_format const *s5pcsis_try_format(
 }
 
 static struct v4l2_mbus_framefmt *__s5pcsis_get_format(
-		struct csis_state *state, struct v4l2_subdev_pad_config *cfg,
+		struct csis_state *state, struct v4l2_subdev_state *sd_state,
 		enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return cfg ? v4l2_subdev_get_try_format(&state->sd, cfg, 0) : NULL;
+		return sd_state ? v4l2_subdev_get_try_format(&state->sd,
+							     sd_state, 0) : NULL;
 
 	return &state->format;
 }
 
-static int s5pcsis_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int s5pcsis_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct csis_state *state = sd_to_csis_state(sd);
 	struct csis_pix_format const *csis_fmt;
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = __s5pcsis_get_format(state, cfg, fmt->which);
+	mf = __s5pcsis_get_format(state, sd_state, fmt->which);
 
 	if (fmt->pad == CSIS_PAD_SOURCE) {
 		if (mf) {
@@ -602,13 +604,14 @@ static int s5pcsis_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 	return 0;
 }
 
-static int s5pcsis_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int s5pcsis_get_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct csis_state *state = sd_to_csis_state(sd);
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = __s5pcsis_get_format(state, cfg, fmt->which);
+	mf = __s5pcsis_get_format(state, sd_state, fmt->which);
 	if (!mf)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index ea87110d9073..070a0f3fc337 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -1350,6 +1350,9 @@ static int mcam_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
 	struct mcam_format_struct *f;
 	struct v4l2_pix_format *pix = &fmt->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_state pad_state = {
+		.pads = &pad_cfg
+		};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -1358,7 +1361,7 @@ static int mcam_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
 	f = mcam_find_format(pix->pixelformat);
 	pix->pixelformat = f->pixelformat;
 	v4l2_fill_mbus_format(&format.format, pix, f->mbus_code);
-	ret = sensor_call(cam, pad, set_fmt, &pad_cfg, &format);
+	ret = sensor_call(cam, pad, set_fmt, &pad_state, &format);
 	v4l2_fill_pix_format(pix, &format.format);
 	pix->bytesperline = pix->width * f->bpp;
 	switch (f->pixelformat) {
diff --git a/drivers/media/platform/omap3isp/ispccdc.c b/drivers/media/platform/omap3isp/ispccdc.c
index 4e8905ef362f..108b5e9f82cb 100644
--- a/drivers/media/platform/omap3isp/ispccdc.c
+++ b/drivers/media/platform/omap3isp/ispccdc.c
@@ -29,7 +29,8 @@
 #define CCDC_MIN_HEIGHT		32
 
 static struct v4l2_mbus_framefmt *
-__ccdc_get_format(struct isp_ccdc_device *ccdc, struct v4l2_subdev_pad_config *cfg,
+__ccdc_get_format(struct isp_ccdc_device *ccdc,
+		  struct v4l2_subdev_state *sd_state,
 		  unsigned int pad, enum v4l2_subdev_format_whence which);
 
 static const unsigned int ccdc_fmts[] = {
@@ -1936,21 +1937,25 @@ static int ccdc_set_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static struct v4l2_mbus_framefmt *
-__ccdc_get_format(struct isp_ccdc_device *ccdc, struct v4l2_subdev_pad_config *cfg,
+__ccdc_get_format(struct isp_ccdc_device *ccdc,
+		  struct v4l2_subdev_state *sd_state,
 		  unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ccdc->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&ccdc->subdev, sd_state,
+						  pad);
 	else
 		return &ccdc->formats[pad];
 }
 
 static struct v4l2_rect *
-__ccdc_get_crop(struct isp_ccdc_device *ccdc, struct v4l2_subdev_pad_config *cfg,
+__ccdc_get_crop(struct isp_ccdc_device *ccdc,
+		struct v4l2_subdev_state *sd_state,
 		enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&ccdc->subdev, cfg, CCDC_PAD_SOURCE_OF);
+		return v4l2_subdev_get_try_crop(&ccdc->subdev, sd_state,
+						CCDC_PAD_SOURCE_OF);
 	else
 		return &ccdc->crop;
 }
@@ -1963,7 +1968,8 @@ __ccdc_get_crop(struct isp_ccdc_device *ccdc, struct v4l2_subdev_pad_config *cfg
  * @fmt: Format
  */
 static void
-ccdc_try_format(struct isp_ccdc_device *ccdc, struct v4l2_subdev_pad_config *cfg,
+ccdc_try_format(struct isp_ccdc_device *ccdc,
+		struct v4l2_subdev_state *sd_state,
 		unsigned int pad, struct v4l2_mbus_framefmt *fmt,
 		enum v4l2_subdev_format_whence which)
 {
@@ -1999,7 +2005,8 @@ ccdc_try_format(struct isp_ccdc_device *ccdc, struct v4l2_subdev_pad_config *cfg
 	case CCDC_PAD_SOURCE_OF:
 		pixelcode = fmt->code;
 		field = fmt->field;
-		*fmt = *__ccdc_get_format(ccdc, cfg, CCDC_PAD_SINK, which);
+		*fmt = *__ccdc_get_format(ccdc, sd_state, CCDC_PAD_SINK,
+					  which);
 
 		/* In SYNC mode the bridge converts YUV formats from 2X8 to
 		 * 1X16. In BT.656 no such conversion occurs. As we don't know
@@ -2024,7 +2031,7 @@ ccdc_try_format(struct isp_ccdc_device *ccdc, struct v4l2_subdev_pad_config *cfg
 		}
 
 		/* Hardcode the output size to the crop rectangle size. */
-		crop = __ccdc_get_crop(ccdc, cfg, which);
+		crop = __ccdc_get_crop(ccdc, sd_state, which);
 		fmt->width = crop->width;
 		fmt->height = crop->height;
 
@@ -2041,7 +2048,8 @@ ccdc_try_format(struct isp_ccdc_device *ccdc, struct v4l2_subdev_pad_config *cfg
 		break;
 
 	case CCDC_PAD_SOURCE_VP:
-		*fmt = *__ccdc_get_format(ccdc, cfg, CCDC_PAD_SINK, which);
+		*fmt = *__ccdc_get_format(ccdc, sd_state, CCDC_PAD_SINK,
+					  which);
 
 		/* The video port interface truncates the data to 10 bits. */
 		info = omap3isp_video_format_info(fmt->code);
@@ -2118,7 +2126,7 @@ static void ccdc_try_crop(struct isp_ccdc_device *ccdc,
  * return -EINVAL or zero on success
  */
 static int ccdc_enum_mbus_code(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct isp_ccdc_device *ccdc = v4l2_get_subdevdata(sd);
@@ -2133,7 +2141,7 @@ static int ccdc_enum_mbus_code(struct v4l2_subdev *sd,
 		break;
 
 	case CCDC_PAD_SOURCE_OF:
-		format = __ccdc_get_format(ccdc, cfg, code->pad,
+		format = __ccdc_get_format(ccdc, sd_state, code->pad,
 					   code->which);
 
 		if (format->code == MEDIA_BUS_FMT_YUYV8_2X8 ||
@@ -2164,7 +2172,7 @@ static int ccdc_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index != 0)
 			return -EINVAL;
 
-		format = __ccdc_get_format(ccdc, cfg, code->pad,
+		format = __ccdc_get_format(ccdc, sd_state, code->pad,
 					   code->which);
 
 		/* A pixel code equal to 0 means that the video port doesn't
@@ -2184,7 +2192,7 @@ static int ccdc_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ccdc_enum_frame_size(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct isp_ccdc_device *ccdc = v4l2_get_subdevdata(sd);
@@ -2196,7 +2204,7 @@ static int ccdc_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	ccdc_try_format(ccdc, cfg, fse->pad, &format, fse->which);
+	ccdc_try_format(ccdc, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -2206,7 +2214,7 @@ static int ccdc_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	ccdc_try_format(ccdc, cfg, fse->pad, &format, fse->which);
+	ccdc_try_format(ccdc, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -2224,7 +2232,8 @@ static int ccdc_enum_frame_size(struct v4l2_subdev *sd,
  *
  * Return 0 on success or a negative error code otherwise.
  */
-static int ccdc_get_selection(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int ccdc_get_selection(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_selection *sel)
 {
 	struct isp_ccdc_device *ccdc = v4l2_get_subdevdata(sd);
@@ -2240,12 +2249,13 @@ static int ccdc_get_selection(struct v4l2_subdev *sd, struct v4l2_subdev_pad_con
 		sel->r.width = INT_MAX;
 		sel->r.height = INT_MAX;
 
-		format = __ccdc_get_format(ccdc, cfg, CCDC_PAD_SINK, sel->which);
+		format = __ccdc_get_format(ccdc, sd_state, CCDC_PAD_SINK,
+					   sel->which);
 		ccdc_try_crop(ccdc, format, &sel->r);
 		break;
 
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *__ccdc_get_crop(ccdc, cfg, sel->which);
+		sel->r = *__ccdc_get_crop(ccdc, sd_state, sel->which);
 		break;
 
 	default:
@@ -2266,7 +2276,8 @@ static int ccdc_get_selection(struct v4l2_subdev *sd, struct v4l2_subdev_pad_con
  *
  * Return 0 on success or a negative error code otherwise.
  */
-static int ccdc_set_selection(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int ccdc_set_selection(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_selection *sel)
 {
 	struct isp_ccdc_device *ccdc = v4l2_get_subdevdata(sd);
@@ -2285,17 +2296,19 @@ static int ccdc_set_selection(struct v4l2_subdev *sd, struct v4l2_subdev_pad_con
 	 * rectangle.
 	 */
 	if (sel->flags & V4L2_SEL_FLAG_KEEP_CONFIG) {
-		sel->r = *__ccdc_get_crop(ccdc, cfg, sel->which);
+		sel->r = *__ccdc_get_crop(ccdc, sd_state, sel->which);
 		return 0;
 	}
 
-	format = __ccdc_get_format(ccdc, cfg, CCDC_PAD_SINK, sel->which);
+	format = __ccdc_get_format(ccdc, sd_state, CCDC_PAD_SINK, sel->which);
 	ccdc_try_crop(ccdc, format, &sel->r);
-	*__ccdc_get_crop(ccdc, cfg, sel->which) = sel->r;
+	*__ccdc_get_crop(ccdc, sd_state, sel->which) = sel->r;
 
 	/* Update the source format. */
-	format = __ccdc_get_format(ccdc, cfg, CCDC_PAD_SOURCE_OF, sel->which);
-	ccdc_try_format(ccdc, cfg, CCDC_PAD_SOURCE_OF, format, sel->which);
+	format = __ccdc_get_format(ccdc, sd_state, CCDC_PAD_SOURCE_OF,
+				   sel->which);
+	ccdc_try_format(ccdc, sd_state, CCDC_PAD_SOURCE_OF, format,
+			sel->which);
 
 	return 0;
 }
@@ -2309,13 +2322,14 @@ static int ccdc_set_selection(struct v4l2_subdev *sd, struct v4l2_subdev_pad_con
  * Return 0 on success or -EINVAL if the pad is invalid or doesn't correspond
  * to the format type.
  */
-static int ccdc_get_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int ccdc_get_format(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct isp_ccdc_device *ccdc = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __ccdc_get_format(ccdc, cfg, fmt->pad, fmt->which);
+	format = __ccdc_get_format(ccdc, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
@@ -2332,24 +2346,25 @@ static int ccdc_get_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
  * Return 0 on success or -EINVAL if the pad is invalid or doesn't correspond
  * to the format type.
  */
-static int ccdc_set_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int ccdc_set_format(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct isp_ccdc_device *ccdc = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 
-	format = __ccdc_get_format(ccdc, cfg, fmt->pad, fmt->which);
+	format = __ccdc_get_format(ccdc, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
-	ccdc_try_format(ccdc, cfg, fmt->pad, &fmt->format, fmt->which);
+	ccdc_try_format(ccdc, sd_state, fmt->pad, &fmt->format, fmt->which);
 	*format = fmt->format;
 
 	/* Propagate the format from sink to source */
 	if (fmt->pad == CCDC_PAD_SINK) {
 		/* Reset the crop rectangle. */
-		crop = __ccdc_get_crop(ccdc, cfg, fmt->which);
+		crop = __ccdc_get_crop(ccdc, sd_state, fmt->which);
 		crop->left = 0;
 		crop->top = 0;
 		crop->width = fmt->format.width;
@@ -2358,16 +2373,16 @@ static int ccdc_set_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
 		ccdc_try_crop(ccdc, &fmt->format, crop);
 
 		/* Update the source formats. */
-		format = __ccdc_get_format(ccdc, cfg, CCDC_PAD_SOURCE_OF,
+		format = __ccdc_get_format(ccdc, sd_state, CCDC_PAD_SOURCE_OF,
 					   fmt->which);
 		*format = fmt->format;
-		ccdc_try_format(ccdc, cfg, CCDC_PAD_SOURCE_OF, format,
+		ccdc_try_format(ccdc, sd_state, CCDC_PAD_SOURCE_OF, format,
 				fmt->which);
 
-		format = __ccdc_get_format(ccdc, cfg, CCDC_PAD_SOURCE_VP,
+		format = __ccdc_get_format(ccdc, sd_state, CCDC_PAD_SOURCE_VP,
 					   fmt->which);
 		*format = fmt->format;
-		ccdc_try_format(ccdc, cfg, CCDC_PAD_SOURCE_VP, format,
+		ccdc_try_format(ccdc, sd_state, CCDC_PAD_SOURCE_VP, format,
 				fmt->which);
 	}
 
@@ -2454,7 +2469,7 @@ static int ccdc_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	ccdc_set_format(sd, fh ? fh->pad : NULL, &format);
+	ccdc_set_format(sd, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/omap3isp/ispccp2.c b/drivers/media/platform/omap3isp/ispccp2.c
index d0a49cdfd22d..acb58b6ddba1 100644
--- a/drivers/media/platform/omap3isp/ispccp2.c
+++ b/drivers/media/platform/omap3isp/ispccp2.c
@@ -618,11 +618,13 @@ static const unsigned int ccp2_fmts[] = {
  * return format structure or NULL on error
  */
 static struct v4l2_mbus_framefmt *
-__ccp2_get_format(struct isp_ccp2_device *ccp2, struct v4l2_subdev_pad_config *cfg,
-		     unsigned int pad, enum v4l2_subdev_format_whence which)
+__ccp2_get_format(struct isp_ccp2_device *ccp2,
+		  struct v4l2_subdev_state *sd_state,
+		  unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ccp2->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&ccp2->subdev, sd_state,
+						  pad);
 	else
 		return &ccp2->formats[pad];
 }
@@ -636,7 +638,8 @@ __ccp2_get_format(struct isp_ccp2_device *ccp2, struct v4l2_subdev_pad_config *c
  * @which : wanted subdev format
  */
 static void ccp2_try_format(struct isp_ccp2_device *ccp2,
-			       struct v4l2_subdev_pad_config *cfg, unsigned int pad,
+			       struct v4l2_subdev_state *sd_state,
+			       unsigned int pad,
 			       struct v4l2_mbus_framefmt *fmt,
 			       enum v4l2_subdev_format_whence which)
 {
@@ -670,7 +673,8 @@ static void ccp2_try_format(struct isp_ccp2_device *ccp2,
 		 * When CCP2 write to memory feature will be added this
 		 * should be changed properly.
 		 */
-		format = __ccp2_get_format(ccp2, cfg, CCP2_PAD_SINK, which);
+		format = __ccp2_get_format(ccp2, sd_state, CCP2_PAD_SINK,
+					   which);
 		memcpy(fmt, format, sizeof(*fmt));
 		fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 		break;
@@ -688,7 +692,7 @@ static void ccp2_try_format(struct isp_ccp2_device *ccp2,
  * return -EINVAL or zero on success
  */
 static int ccp2_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct isp_ccp2_device *ccp2 = v4l2_get_subdevdata(sd);
@@ -703,8 +707,8 @@ static int ccp2_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index != 0)
 			return -EINVAL;
 
-		format = __ccp2_get_format(ccp2, cfg, CCP2_PAD_SINK,
-					      code->which);
+		format = __ccp2_get_format(ccp2, sd_state, CCP2_PAD_SINK,
+					   code->which);
 		code->code = format->code;
 	}
 
@@ -712,7 +716,7 @@ static int ccp2_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int ccp2_enum_frame_size(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct isp_ccp2_device *ccp2 = v4l2_get_subdevdata(sd);
@@ -724,7 +728,7 @@ static int ccp2_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	ccp2_try_format(ccp2, cfg, fse->pad, &format, fse->which);
+	ccp2_try_format(ccp2, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -734,7 +738,7 @@ static int ccp2_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	ccp2_try_format(ccp2, cfg, fse->pad, &format, fse->which);
+	ccp2_try_format(ccp2, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -748,13 +752,14 @@ static int ccp2_enum_frame_size(struct v4l2_subdev *sd,
  * @fmt   : pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
-static int ccp2_get_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
-			      struct v4l2_subdev_format *fmt)
+static int ccp2_get_format(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_format *fmt)
 {
 	struct isp_ccp2_device *ccp2 = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __ccp2_get_format(ccp2, cfg, fmt->pad, fmt->which);
+	format = __ccp2_get_format(ccp2, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
@@ -769,25 +774,27 @@ static int ccp2_get_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
  * @fmt   : pointer to v4l2 subdev format structure
  * returns zero
  */
-static int ccp2_set_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
-			      struct v4l2_subdev_format *fmt)
+static int ccp2_set_format(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_format *fmt)
 {
 	struct isp_ccp2_device *ccp2 = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __ccp2_get_format(ccp2, cfg, fmt->pad, fmt->which);
+	format = __ccp2_get_format(ccp2, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
-	ccp2_try_format(ccp2, cfg, fmt->pad, &fmt->format, fmt->which);
+	ccp2_try_format(ccp2, sd_state, fmt->pad, &fmt->format, fmt->which);
 	*format = fmt->format;
 
 	/* Propagate the format from sink to source */
 	if (fmt->pad == CCP2_PAD_SINK) {
-		format = __ccp2_get_format(ccp2, cfg, CCP2_PAD_SOURCE,
+		format = __ccp2_get_format(ccp2, sd_state, CCP2_PAD_SOURCE,
 					   fmt->which);
 		*format = fmt->format;
-		ccp2_try_format(ccp2, cfg, CCP2_PAD_SOURCE, format, fmt->which);
+		ccp2_try_format(ccp2, sd_state, CCP2_PAD_SOURCE, format,
+				fmt->which);
 	}
 
 	return 0;
@@ -812,7 +819,7 @@ static int ccp2_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	ccp2_set_format(sd, fh ? fh->pad : NULL, &format);
+	ccp2_set_format(sd, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/omap3isp/ispcsi2.c b/drivers/media/platform/omap3isp/ispcsi2.c
index fd493c5e4e24..6302e0c94034 100644
--- a/drivers/media/platform/omap3isp/ispcsi2.c
+++ b/drivers/media/platform/omap3isp/ispcsi2.c
@@ -827,17 +827,20 @@ static const struct isp_video_operations csi2_ispvideo_ops = {
  */
 
 static struct v4l2_mbus_framefmt *
-__csi2_get_format(struct isp_csi2_device *csi2, struct v4l2_subdev_pad_config *cfg,
+__csi2_get_format(struct isp_csi2_device *csi2,
+		  struct v4l2_subdev_state *sd_state,
 		  unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csi2->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
+						  pad);
 	else
 		return &csi2->formats[pad];
 }
 
 static void
-csi2_try_format(struct isp_csi2_device *csi2, struct v4l2_subdev_pad_config *cfg,
+csi2_try_format(struct isp_csi2_device *csi2,
+		struct v4l2_subdev_state *sd_state,
 		unsigned int pad, struct v4l2_mbus_framefmt *fmt,
 		enum v4l2_subdev_format_whence which)
 {
@@ -867,7 +870,8 @@ csi2_try_format(struct isp_csi2_device *csi2, struct v4l2_subdev_pad_config *cfg
 		 * compression.
 		 */
 		pixelcode = fmt->code;
-		format = __csi2_get_format(csi2, cfg, CSI2_PAD_SINK, which);
+		format = __csi2_get_format(csi2, sd_state, CSI2_PAD_SINK,
+					   which);
 		memcpy(fmt, format, sizeof(*fmt));
 
 		/*
@@ -893,7 +897,7 @@ csi2_try_format(struct isp_csi2_device *csi2, struct v4l2_subdev_pad_config *cfg
  * return -EINVAL or zero on success
  */
 static int csi2_enum_mbus_code(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct isp_csi2_device *csi2 = v4l2_get_subdevdata(sd);
@@ -906,7 +910,7 @@ static int csi2_enum_mbus_code(struct v4l2_subdev *sd,
 
 		code->code = csi2_input_fmts[code->index];
 	} else {
-		format = __csi2_get_format(csi2, cfg, CSI2_PAD_SINK,
+		format = __csi2_get_format(csi2, sd_state, CSI2_PAD_SINK,
 					   code->which);
 		switch (code->index) {
 		case 0:
@@ -930,7 +934,7 @@ static int csi2_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int csi2_enum_frame_size(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct isp_csi2_device *csi2 = v4l2_get_subdevdata(sd);
@@ -942,7 +946,7 @@ static int csi2_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	csi2_try_format(csi2, cfg, fse->pad, &format, fse->which);
+	csi2_try_format(csi2, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -952,7 +956,7 @@ static int csi2_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	csi2_try_format(csi2, cfg, fse->pad, &format, fse->which);
+	csi2_try_format(csi2, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -966,13 +970,14 @@ static int csi2_enum_frame_size(struct v4l2_subdev *sd,
  * @fmt: pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
-static int csi2_get_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int csi2_get_format(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct isp_csi2_device *csi2 = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __csi2_get_format(csi2, cfg, fmt->pad, fmt->which);
+	format = __csi2_get_format(csi2, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
@@ -987,25 +992,27 @@ static int csi2_get_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config
  * @fmt: pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
-static int csi2_set_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int csi2_set_format(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct isp_csi2_device *csi2 = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __csi2_get_format(csi2, cfg, fmt->pad, fmt->which);
+	format = __csi2_get_format(csi2, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
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
@@ -1030,7 +1037,7 @@ static int csi2_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	csi2_set_format(sd, fh ? fh->pad : NULL, &format);
+	csi2_set_format(sd, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/omap3isp/isppreview.c b/drivers/media/platform/omap3isp/isppreview.c
index 607b7685c982..53aedec7990d 100644
--- a/drivers/media/platform/omap3isp/isppreview.c
+++ b/drivers/media/platform/omap3isp/isppreview.c
@@ -1679,21 +1679,25 @@ static int preview_set_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static struct v4l2_mbus_framefmt *
-__preview_get_format(struct isp_prev_device *prev, struct v4l2_subdev_pad_config *cfg,
+__preview_get_format(struct isp_prev_device *prev,
+		     struct v4l2_subdev_state *sd_state,
 		     unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&prev->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&prev->subdev, sd_state,
+						  pad);
 	else
 		return &prev->formats[pad];
 }
 
 static struct v4l2_rect *
-__preview_get_crop(struct isp_prev_device *prev, struct v4l2_subdev_pad_config *cfg,
+__preview_get_crop(struct isp_prev_device *prev,
+		   struct v4l2_subdev_state *sd_state,
 		   enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&prev->subdev, cfg, PREV_PAD_SINK);
+		return v4l2_subdev_get_try_crop(&prev->subdev, sd_state,
+						PREV_PAD_SINK);
 	else
 		return &prev->crop;
 }
@@ -1729,7 +1733,8 @@ static const unsigned int preview_output_fmts[] = {
  * engine limits and the format and crop rectangles on other pads.
  */
 static void preview_try_format(struct isp_prev_device *prev,
-			       struct v4l2_subdev_pad_config *cfg, unsigned int pad,
+			       struct v4l2_subdev_state *sd_state,
+			       unsigned int pad,
 			       struct v4l2_mbus_framefmt *fmt,
 			       enum v4l2_subdev_format_whence which)
 {
@@ -1770,7 +1775,8 @@ static void preview_try_format(struct isp_prev_device *prev,
 
 	case PREV_PAD_SOURCE:
 		pixelcode = fmt->code;
-		*fmt = *__preview_get_format(prev, cfg, PREV_PAD_SINK, which);
+		*fmt = *__preview_get_format(prev, sd_state, PREV_PAD_SINK,
+					     which);
 
 		switch (pixelcode) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
@@ -1788,7 +1794,7 @@ static void preview_try_format(struct isp_prev_device *prev,
 		 * is not supported yet, hardcode the output size to the crop
 		 * rectangle size.
 		 */
-		crop = __preview_get_crop(prev, cfg, which);
+		crop = __preview_get_crop(prev, sd_state, which);
 		fmt->width = crop->width;
 		fmt->height = crop->height;
 
@@ -1862,7 +1868,7 @@ static void preview_try_crop(struct isp_prev_device *prev,
  * return -EINVAL or zero on success
  */
 static int preview_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	switch (code->pad) {
@@ -1886,7 +1892,7 @@ static int preview_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int preview_enum_frame_size(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct isp_prev_device *prev = v4l2_get_subdevdata(sd);
@@ -1898,7 +1904,7 @@ static int preview_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	preview_try_format(prev, cfg, fse->pad, &format, fse->which);
+	preview_try_format(prev, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -1908,7 +1914,7 @@ static int preview_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	preview_try_format(prev, cfg, fse->pad, &format, fse->which);
+	preview_try_format(prev, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -1926,7 +1932,7 @@ static int preview_enum_frame_size(struct v4l2_subdev *sd,
  * Return 0 on success or a negative error code otherwise.
  */
 static int preview_get_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct isp_prev_device *prev = v4l2_get_subdevdata(sd);
@@ -1942,13 +1948,13 @@ static int preview_get_selection(struct v4l2_subdev *sd,
 		sel->r.width = INT_MAX;
 		sel->r.height = INT_MAX;
 
-		format = __preview_get_format(prev, cfg, PREV_PAD_SINK,
+		format = __preview_get_format(prev, sd_state, PREV_PAD_SINK,
 					      sel->which);
 		preview_try_crop(prev, format, &sel->r);
 		break;
 
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *__preview_get_crop(prev, cfg, sel->which);
+		sel->r = *__preview_get_crop(prev, sd_state, sel->which);
 		break;
 
 	default:
@@ -1969,7 +1975,7 @@ static int preview_get_selection(struct v4l2_subdev *sd,
  * Return 0 on success or a negative error code otherwise.
  */
 static int preview_set_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct isp_prev_device *prev = v4l2_get_subdevdata(sd);
@@ -1988,17 +1994,20 @@ static int preview_set_selection(struct v4l2_subdev *sd,
 	 * rectangle.
 	 */
 	if (sel->flags & V4L2_SEL_FLAG_KEEP_CONFIG) {
-		sel->r = *__preview_get_crop(prev, cfg, sel->which);
+		sel->r = *__preview_get_crop(prev, sd_state, sel->which);
 		return 0;
 	}
 
-	format = __preview_get_format(prev, cfg, PREV_PAD_SINK, sel->which);
+	format = __preview_get_format(prev, sd_state, PREV_PAD_SINK,
+				      sel->which);
 	preview_try_crop(prev, format, &sel->r);
-	*__preview_get_crop(prev, cfg, sel->which) = sel->r;
+	*__preview_get_crop(prev, sd_state, sel->which) = sel->r;
 
 	/* Update the source format. */
-	format = __preview_get_format(prev, cfg, PREV_PAD_SOURCE, sel->which);
-	preview_try_format(prev, cfg, PREV_PAD_SOURCE, format, sel->which);
+	format = __preview_get_format(prev, sd_state, PREV_PAD_SOURCE,
+				      sel->which);
+	preview_try_format(prev, sd_state, PREV_PAD_SOURCE, format,
+			   sel->which);
 
 	return 0;
 }
@@ -2010,13 +2019,14 @@ static int preview_set_selection(struct v4l2_subdev *sd,
  * @fmt: pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
-static int preview_get_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int preview_get_format(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct isp_prev_device *prev = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __preview_get_format(prev, cfg, fmt->pad, fmt->which);
+	format = __preview_get_format(prev, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
@@ -2031,24 +2041,25 @@ static int preview_get_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_con
  * @fmt: pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
-static int preview_set_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int preview_set_format(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct isp_prev_device *prev = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 
-	format = __preview_get_format(prev, cfg, fmt->pad, fmt->which);
+	format = __preview_get_format(prev, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
-	preview_try_format(prev, cfg, fmt->pad, &fmt->format, fmt->which);
+	preview_try_format(prev, sd_state, fmt->pad, &fmt->format, fmt->which);
 	*format = fmt->format;
 
 	/* Propagate the format from sink to source */
 	if (fmt->pad == PREV_PAD_SINK) {
 		/* Reset the crop rectangle. */
-		crop = __preview_get_crop(prev, cfg, fmt->which);
+		crop = __preview_get_crop(prev, sd_state, fmt->which);
 		crop->left = 0;
 		crop->top = 0;
 		crop->width = fmt->format.width;
@@ -2057,9 +2068,9 @@ static int preview_set_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_con
 		preview_try_crop(prev, &fmt->format, crop);
 
 		/* Update the source format. */
-		format = __preview_get_format(prev, cfg, PREV_PAD_SOURCE,
+		format = __preview_get_format(prev, sd_state, PREV_PAD_SOURCE,
 					      fmt->which);
-		preview_try_format(prev, cfg, PREV_PAD_SOURCE, format,
+		preview_try_format(prev, sd_state, PREV_PAD_SOURCE, format,
 				   fmt->which);
 	}
 
@@ -2086,7 +2097,7 @@ static int preview_init_formats(struct v4l2_subdev *sd,
 	format.format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	preview_set_format(sd, fh ? fh->pad : NULL, &format);
+	preview_set_format(sd, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/omap3isp/ispresizer.c b/drivers/media/platform/omap3isp/ispresizer.c
index 78d9dd7ea2da..ed2fb0c7a57e 100644
--- a/drivers/media/platform/omap3isp/ispresizer.c
+++ b/drivers/media/platform/omap3isp/ispresizer.c
@@ -114,11 +114,12 @@ static const struct isprsz_coef filter_coefs = {
  * return zero
  */
 static struct v4l2_mbus_framefmt *
-__resizer_get_format(struct isp_res_device *res, struct v4l2_subdev_pad_config *cfg,
+__resizer_get_format(struct isp_res_device *res,
+		     struct v4l2_subdev_state *sd_state,
 		     unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&res->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&res->subdev, sd_state, pad);
 	else
 		return &res->formats[pad];
 }
@@ -130,11 +131,13 @@ __resizer_get_format(struct isp_res_device *res, struct v4l2_subdev_pad_config *
  * @which : wanted subdev crop rectangle
  */
 static struct v4l2_rect *
-__resizer_get_crop(struct isp_res_device *res, struct v4l2_subdev_pad_config *cfg,
+__resizer_get_crop(struct isp_res_device *res,
+		   struct v4l2_subdev_state *sd_state,
 		   enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&res->subdev, cfg, RESZ_PAD_SINK);
+		return v4l2_subdev_get_try_crop(&res->subdev, sd_state,
+						RESZ_PAD_SINK);
 	else
 		return &res->crop.request;
 }
@@ -1220,7 +1223,7 @@ static void resizer_try_crop(const struct v4l2_mbus_framefmt *sink,
  * Return 0 on success or a negative error code otherwise.
  */
 static int resizer_get_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct isp_res_device *res = v4l2_get_subdevdata(sd);
@@ -1231,9 +1234,9 @@ static int resizer_get_selection(struct v4l2_subdev *sd,
 	if (sel->pad != RESZ_PAD_SINK)
 		return -EINVAL;
 
-	format_sink = __resizer_get_format(res, cfg, RESZ_PAD_SINK,
+	format_sink = __resizer_get_format(res, sd_state, RESZ_PAD_SINK,
 					   sel->which);
-	format_source = __resizer_get_format(res, cfg, RESZ_PAD_SOURCE,
+	format_source = __resizer_get_format(res, sd_state, RESZ_PAD_SOURCE,
 					     sel->which);
 
 	switch (sel->target) {
@@ -1248,7 +1251,7 @@ static int resizer_get_selection(struct v4l2_subdev *sd,
 		break;
 
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *__resizer_get_crop(res, cfg, sel->which);
+		sel->r = *__resizer_get_crop(res, sd_state, sel->which);
 		resizer_calc_ratios(res, &sel->r, format_source, &ratio);
 		break;
 
@@ -1273,7 +1276,7 @@ static int resizer_get_selection(struct v4l2_subdev *sd,
  * Return 0 on success or a negative error code otherwise.
  */
 static int resizer_set_selection(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
 	struct isp_res_device *res = v4l2_get_subdevdata(sd);
@@ -1287,9 +1290,9 @@ static int resizer_set_selection(struct v4l2_subdev *sd,
 	    sel->pad != RESZ_PAD_SINK)
 		return -EINVAL;
 
-	format_sink = __resizer_get_format(res, cfg, RESZ_PAD_SINK,
+	format_sink = __resizer_get_format(res, sd_state, RESZ_PAD_SINK,
 					   sel->which);
-	format_source = *__resizer_get_format(res, cfg, RESZ_PAD_SOURCE,
+	format_source = *__resizer_get_format(res, sd_state, RESZ_PAD_SOURCE,
 					      sel->which);
 
 	dev_dbg(isp->dev, "%s(%s): req %ux%u -> (%d,%d)/%ux%u -> %ux%u\n",
@@ -1307,7 +1310,7 @@ static int resizer_set_selection(struct v4l2_subdev *sd,
 	 * stored the mangled rectangle.
 	 */
 	resizer_try_crop(format_sink, &format_source, &sel->r);
-	*__resizer_get_crop(res, cfg, sel->which) = sel->r;
+	*__resizer_get_crop(res, sd_state, sel->which) = sel->r;
 	resizer_calc_ratios(res, &sel->r, &format_source, &ratio);
 
 	dev_dbg(isp->dev, "%s(%s): got %ux%u -> (%d,%d)/%ux%u -> %ux%u\n",
@@ -1317,7 +1320,8 @@ static int resizer_set_selection(struct v4l2_subdev *sd,
 		format_source.width, format_source.height);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*__resizer_get_format(res, cfg, RESZ_PAD_SOURCE, sel->which) =
+		*__resizer_get_format(res, sd_state, RESZ_PAD_SOURCE,
+				      sel->which) =
 			format_source;
 		return 0;
 	}
@@ -1328,7 +1332,7 @@ static int resizer_set_selection(struct v4l2_subdev *sd,
 	 */
 	spin_lock_irqsave(&res->lock, flags);
 
-	*__resizer_get_format(res, cfg, RESZ_PAD_SOURCE, sel->which) =
+	*__resizer_get_format(res, sd_state, RESZ_PAD_SOURCE, sel->which) =
 		format_source;
 
 	res->ratio = ratio;
@@ -1371,7 +1375,8 @@ static unsigned int resizer_max_in_width(struct isp_res_device *res)
  * @which : wanted subdev format
  */
 static void resizer_try_format(struct isp_res_device *res,
-			       struct v4l2_subdev_pad_config *cfg, unsigned int pad,
+			       struct v4l2_subdev_state *sd_state,
+			       unsigned int pad,
 			       struct v4l2_mbus_framefmt *fmt,
 			       enum v4l2_subdev_format_whence which)
 {
@@ -1392,10 +1397,11 @@ static void resizer_try_format(struct isp_res_device *res,
 		break;
 
 	case RESZ_PAD_SOURCE:
-		format = __resizer_get_format(res, cfg, RESZ_PAD_SINK, which);
+		format = __resizer_get_format(res, sd_state, RESZ_PAD_SINK,
+					      which);
 		fmt->code = format->code;
 
-		crop = *__resizer_get_crop(res, cfg, which);
+		crop = *__resizer_get_crop(res, sd_state, which);
 		resizer_calc_ratios(res, &crop, fmt, &ratio);
 		break;
 	}
@@ -1412,7 +1418,7 @@ static void resizer_try_format(struct isp_res_device *res,
  * return -EINVAL or zero on success
  */
 static int resizer_enum_mbus_code(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct isp_res_device *res = v4l2_get_subdevdata(sd);
@@ -1427,7 +1433,7 @@ static int resizer_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index != 0)
 			return -EINVAL;
 
-		format = __resizer_get_format(res, cfg, RESZ_PAD_SINK,
+		format = __resizer_get_format(res, sd_state, RESZ_PAD_SINK,
 					      code->which);
 		code->code = format->code;
 	}
@@ -1436,7 +1442,7 @@ static int resizer_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int resizer_enum_frame_size(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct isp_res_device *res = v4l2_get_subdevdata(sd);
@@ -1448,7 +1454,7 @@ static int resizer_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	resizer_try_format(res, cfg, fse->pad, &format, fse->which);
+	resizer_try_format(res, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -1458,7 +1464,7 @@ static int resizer_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	resizer_try_format(res, cfg, fse->pad, &format, fse->which);
+	resizer_try_format(res, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -1472,13 +1478,14 @@ static int resizer_enum_frame_size(struct v4l2_subdev *sd,
  * @fmt   : pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
-static int resizer_get_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int resizer_get_format(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct isp_res_device *res = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __resizer_get_format(res, cfg, fmt->pad, fmt->which);
+	format = __resizer_get_format(res, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
@@ -1493,33 +1500,34 @@ static int resizer_get_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_con
  * @fmt   : pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
-static int resizer_set_format(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *cfg,
+static int resizer_set_format(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct isp_res_device *res = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 
-	format = __resizer_get_format(res, cfg, fmt->pad, fmt->which);
+	format = __resizer_get_format(res, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
-	resizer_try_format(res, cfg, fmt->pad, &fmt->format, fmt->which);
+	resizer_try_format(res, sd_state, fmt->pad, &fmt->format, fmt->which);
 	*format = fmt->format;
 
 	if (fmt->pad == RESZ_PAD_SINK) {
 		/* reset crop rectangle */
-		crop = __resizer_get_crop(res, cfg, fmt->which);
+		crop = __resizer_get_crop(res, sd_state, fmt->which);
 		crop->left = 0;
 		crop->top = 0;
 		crop->width = fmt->format.width;
 		crop->height = fmt->format.height;
 
 		/* Propagate the format from sink to source */
-		format = __resizer_get_format(res, cfg, RESZ_PAD_SOURCE,
+		format = __resizer_get_format(res, sd_state, RESZ_PAD_SOURCE,
 					      fmt->which);
 		*format = fmt->format;
-		resizer_try_format(res, cfg, RESZ_PAD_SOURCE, format,
+		resizer_try_format(res, sd_state, RESZ_PAD_SOURCE, format,
 				   fmt->which);
 	}
 
@@ -1570,7 +1578,7 @@ static int resizer_init_formats(struct v4l2_subdev *sd,
 	format.format.code = MEDIA_BUS_FMT_YUYV8_1X16;
 	format.format.width = 4096;
 	format.format.height = 4096;
-	resizer_set_format(sd, fh ? fh->pad : NULL, &format);
+	resizer_set_format(sd, fh ? fh->state : NULL, &format);
 
 	return 0;
 }
diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index dd510ee9b58a..ec4c010644ca 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -1792,6 +1792,9 @@ static int pxac_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
 	const struct pxa_camera_format_xlate *xlate;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_state pad_state = {
+		.pads = &pad_cfg
+		};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -1816,7 +1819,7 @@ static int pxac_vidioc_try_fmt_vid_cap(struct file *filp, void *priv,
 			      pixfmt == V4L2_PIX_FMT_YUV422P ? 4 : 0);
 
 	v4l2_fill_mbus_format(mf, pix, xlate->code);
-	ret = sensor_call(pcdev, pad, set_fmt, &pad_cfg, &format);
+	ret = sensor_call(pcdev, pad, set_fmt, &pad_state, &format);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 251f4c4afe19..a1637b78568b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -245,12 +245,13 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
  */
 static struct v4l2_mbus_framefmt *
 __csid_get_format(struct csid_device *csid,
-		  struct v4l2_subdev_pad_config *cfg,
+		  struct v4l2_subdev_state *sd_state,
 		  unsigned int pad,
 		  enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csid->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&csid->subdev, sd_state,
+						  pad);
 
 	return &csid->fmt[pad];
 }
@@ -264,7 +265,7 @@ __csid_get_format(struct csid_device *csid,
  * @which: wanted subdev format
  */
 static void csid_try_format(struct csid_device *csid,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    unsigned int pad,
 			    struct v4l2_mbus_framefmt *fmt,
 			    enum v4l2_subdev_format_whence which)
@@ -297,7 +298,7 @@ static void csid_try_format(struct csid_device *csid,
 			/* keep pad formats in sync */
 			u32 code = fmt->code;
 
-			*fmt = *__csid_get_format(csid, cfg,
+			*fmt = *__csid_get_format(csid, sd_state,
 						      MSM_CSID_PAD_SINK, which);
 			fmt->code = csid->ops->src_pad_code(csid, fmt->code, 0, code);
 		} else {
@@ -331,7 +332,7 @@ static void csid_try_format(struct csid_device *csid,
  * return -EINVAL or zero on success
  */
 static int csid_enum_mbus_code(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
@@ -345,7 +346,7 @@ static int csid_enum_mbus_code(struct v4l2_subdev *sd,
 		if (csid->testgen_mode->cur.val == 0) {
 			struct v4l2_mbus_framefmt *sink_fmt;
 
-			sink_fmt = __csid_get_format(csid, cfg,
+			sink_fmt = __csid_get_format(csid, sd_state,
 						     MSM_CSID_PAD_SINK,
 						     code->which);
 
@@ -372,7 +373,7 @@ static int csid_enum_mbus_code(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int csid_enum_frame_size(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
@@ -384,7 +385,7 @@ static int csid_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	csid_try_format(csid, cfg, fse->pad, &format, fse->which);
+	csid_try_format(csid, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -394,7 +395,7 @@ static int csid_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	csid_try_format(csid, cfg, fse->pad, &format, fse->which);
+	csid_try_format(csid, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -410,13 +411,13 @@ static int csid_enum_frame_size(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csid_get_format(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __csid_get_format(csid, cfg, fmt->pad, fmt->which);
+	format = __csid_get_format(csid, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
@@ -434,26 +435,26 @@ static int csid_get_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csid_set_format(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __csid_get_format(csid, cfg, fmt->pad, fmt->which);
+	format = __csid_get_format(csid, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
-	csid_try_format(csid, cfg, fmt->pad, &fmt->format, fmt->which);
+	csid_try_format(csid, sd_state, fmt->pad, &fmt->format, fmt->which);
 	*format = fmt->format;
 
 	/* Propagate the format from sink to source */
 	if (fmt->pad == MSM_CSID_PAD_SINK) {
-		format = __csid_get_format(csid, cfg, MSM_CSID_PAD_SRC,
+		format = __csid_get_format(csid, sd_state, MSM_CSID_PAD_SRC,
 					   fmt->which);
 
 		*format = fmt->format;
-		csid_try_format(csid, cfg, MSM_CSID_PAD_SRC, format,
+		csid_try_format(csid, sd_state, MSM_CSID_PAD_SRC, format,
 				fmt->which);
 	}
 
@@ -482,7 +483,7 @@ static int csid_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		}
 	};
 
-	return csid_set_format(sd, fh ? fh->pad : NULL, &format);
+	return csid_set_format(sd, fh ? fh->state : NULL, &format);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 35470cbaea86..24eec16197e7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -338,12 +338,13 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
  */
 static struct v4l2_mbus_framefmt *
 __csiphy_get_format(struct csiphy_device *csiphy,
-		    struct v4l2_subdev_pad_config *cfg,
+		    struct v4l2_subdev_state *sd_state,
 		    unsigned int pad,
 		    enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csiphy->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&csiphy->subdev, sd_state,
+						  pad);
 
 	return &csiphy->fmt[pad];
 }
@@ -357,7 +358,7 @@ __csiphy_get_format(struct csiphy_device *csiphy,
  * @which: wanted subdev format
  */
 static void csiphy_try_format(struct csiphy_device *csiphy,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      unsigned int pad,
 			      struct v4l2_mbus_framefmt *fmt,
 			      enum v4l2_subdev_format_whence which)
@@ -387,7 +388,8 @@ static void csiphy_try_format(struct csiphy_device *csiphy,
 	case MSM_CSIPHY_PAD_SRC:
 		/* Set and return a format same as sink pad */
 
-		*fmt = *__csiphy_get_format(csiphy, cfg, MSM_CSID_PAD_SINK,
+		*fmt = *__csiphy_get_format(csiphy, sd_state,
+					    MSM_CSID_PAD_SINK,
 					    which);
 
 		break;
@@ -402,7 +404,7 @@ static void csiphy_try_format(struct csiphy_device *csiphy,
  * return -EINVAL or zero on success
  */
 static int csiphy_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
@@ -417,7 +419,8 @@ static int csiphy_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		format = __csiphy_get_format(csiphy, cfg, MSM_CSIPHY_PAD_SINK,
+		format = __csiphy_get_format(csiphy, sd_state,
+					     MSM_CSIPHY_PAD_SINK,
 					     code->which);
 
 		code->code = format->code;
@@ -434,7 +437,7 @@ static int csiphy_enum_mbus_code(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int csiphy_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
@@ -446,7 +449,7 @@ static int csiphy_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	csiphy_try_format(csiphy, cfg, fse->pad, &format, fse->which);
+	csiphy_try_format(csiphy, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -456,7 +459,7 @@ static int csiphy_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	csiphy_try_format(csiphy, cfg, fse->pad, &format, fse->which);
+	csiphy_try_format(csiphy, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -472,13 +475,13 @@ static int csiphy_enum_frame_size(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csiphy_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __csiphy_get_format(csiphy, cfg, fmt->pad, fmt->which);
+	format = __csiphy_get_format(csiphy, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
@@ -496,26 +499,29 @@ static int csiphy_get_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csiphy_set_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __csiphy_get_format(csiphy, cfg, fmt->pad, fmt->which);
+	format = __csiphy_get_format(csiphy, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
-	csiphy_try_format(csiphy, cfg, fmt->pad, &fmt->format, fmt->which);
+	csiphy_try_format(csiphy, sd_state, fmt->pad, &fmt->format,
+			  fmt->which);
 	*format = fmt->format;
 
 	/* Propagate the format from sink to source */
 	if (fmt->pad == MSM_CSIPHY_PAD_SINK) {
-		format = __csiphy_get_format(csiphy, cfg, MSM_CSIPHY_PAD_SRC,
+		format = __csiphy_get_format(csiphy, sd_state,
+					     MSM_CSIPHY_PAD_SRC,
 					     fmt->which);
 
 		*format = fmt->format;
-		csiphy_try_format(csiphy, cfg, MSM_CSIPHY_PAD_SRC, format,
+		csiphy_try_format(csiphy, sd_state, MSM_CSIPHY_PAD_SRC,
+				  format,
 				  fmt->which);
 	}
 
@@ -545,7 +551,7 @@ static int csiphy_init_formats(struct v4l2_subdev *sd,
 		}
 	};
 
-	return csiphy_set_format(sd, fh ? fh->pad : NULL, &format);
+	return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index 1b716182d35c..ba5d65f6ef34 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -874,12 +874,13 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
  */
 static struct v4l2_mbus_framefmt *
 __ispif_get_format(struct ispif_line *line,
-		   struct v4l2_subdev_pad_config *cfg,
+		   struct v4l2_subdev_state *sd_state,
 		   unsigned int pad,
 		   enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&line->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&line->subdev, sd_state,
+						  pad);
 
 	return &line->fmt[pad];
 }
@@ -893,7 +894,7 @@ __ispif_get_format(struct ispif_line *line,
  * @which: wanted subdev format
  */
 static void ispif_try_format(struct ispif_line *line,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     unsigned int pad,
 			     struct v4l2_mbus_framefmt *fmt,
 			     enum v4l2_subdev_format_whence which)
@@ -923,7 +924,7 @@ static void ispif_try_format(struct ispif_line *line,
 	case MSM_ISPIF_PAD_SRC:
 		/* Set and return a format same as sink pad */
 
-		*fmt = *__ispif_get_format(line, cfg, MSM_ISPIF_PAD_SINK,
+		*fmt = *__ispif_get_format(line, sd_state, MSM_ISPIF_PAD_SINK,
 					   which);
 
 		break;
@@ -940,7 +941,7 @@ static void ispif_try_format(struct ispif_line *line,
  * return -EINVAL or zero on success
  */
 static int ispif_enum_mbus_code(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct ispif_line *line = v4l2_get_subdevdata(sd);
@@ -955,7 +956,8 @@ static int ispif_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		format = __ispif_get_format(line, cfg, MSM_ISPIF_PAD_SINK,
+		format = __ispif_get_format(line, sd_state,
+					    MSM_ISPIF_PAD_SINK,
 					    code->which);
 
 		code->code = format->code;
@@ -972,7 +974,7 @@ static int ispif_enum_mbus_code(struct v4l2_subdev *sd,
  * return -EINVAL or zero on success
  */
 static int ispif_enum_frame_size(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct ispif_line *line = v4l2_get_subdevdata(sd);
@@ -984,7 +986,7 @@ static int ispif_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	ispif_try_format(line, cfg, fse->pad, &format, fse->which);
+	ispif_try_format(line, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -994,7 +996,7 @@ static int ispif_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	ispif_try_format(line, cfg, fse->pad, &format, fse->which);
+	ispif_try_format(line, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -1010,13 +1012,13 @@ static int ispif_enum_frame_size(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int ispif_get_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct ispif_line *line = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __ispif_get_format(line, cfg, fmt->pad, fmt->which);
+	format = __ispif_get_format(line, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
@@ -1034,26 +1036,26 @@ static int ispif_get_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int ispif_set_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct ispif_line *line = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __ispif_get_format(line, cfg, fmt->pad, fmt->which);
+	format = __ispif_get_format(line, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
-	ispif_try_format(line, cfg, fmt->pad, &fmt->format, fmt->which);
+	ispif_try_format(line, sd_state, fmt->pad, &fmt->format, fmt->which);
 	*format = fmt->format;
 
 	/* Propagate the format from sink to source */
 	if (fmt->pad == MSM_ISPIF_PAD_SINK) {
-		format = __ispif_get_format(line, cfg, MSM_ISPIF_PAD_SRC,
+		format = __ispif_get_format(line, sd_state, MSM_ISPIF_PAD_SRC,
 					    fmt->which);
 
 		*format = fmt->format;
-		ispif_try_format(line, cfg, MSM_ISPIF_PAD_SRC, format,
+		ispif_try_format(line, sd_state, MSM_ISPIF_PAD_SRC, format,
 				 fmt->which);
 	}
 
@@ -1082,7 +1084,7 @@ static int ispif_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		}
 	};
 
-	return ispif_set_format(sd, fh ? fh->pad : NULL, &format);
+	return ispif_set_format(sd, fh ? fh->state : NULL, &format);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 27ab20c5b57e..e0f3a36f3f3f 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -763,12 +763,13 @@ static int vfe_set_stream(struct v4l2_subdev *sd, int enable)
  */
 static struct v4l2_mbus_framefmt *
 __vfe_get_format(struct vfe_line *line,
-		 struct v4l2_subdev_pad_config *cfg,
+		 struct v4l2_subdev_state *sd_state,
 		 unsigned int pad,
 		 enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&line->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&line->subdev, sd_state,
+						  pad);
 
 	return &line->fmt[pad];
 }
@@ -783,11 +784,11 @@ __vfe_get_format(struct vfe_line *line,
  */
 static struct v4l2_rect *
 __vfe_get_compose(struct vfe_line *line,
-		  struct v4l2_subdev_pad_config *cfg,
+		  struct v4l2_subdev_state *sd_state,
 		  enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_compose(&line->subdev, cfg,
+		return v4l2_subdev_get_try_compose(&line->subdev, sd_state,
 						   MSM_VFE_PAD_SINK);
 
 	return &line->compose;
@@ -803,11 +804,11 @@ __vfe_get_compose(struct vfe_line *line,
  */
 static struct v4l2_rect *
 __vfe_get_crop(struct vfe_line *line,
-	       struct v4l2_subdev_pad_config *cfg,
+	       struct v4l2_subdev_state *sd_state,
 	       enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&line->subdev, cfg,
+		return v4l2_subdev_get_try_crop(&line->subdev, sd_state,
 						MSM_VFE_PAD_SRC);
 
 	return &line->crop;
@@ -822,7 +823,7 @@ __vfe_get_crop(struct vfe_line *line,
  * @which: wanted subdev format
  */
 static void vfe_try_format(struct vfe_line *line,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   unsigned int pad,
 			   struct v4l2_mbus_framefmt *fmt,
 			   enum v4l2_subdev_format_whence which)
@@ -854,14 +855,15 @@ static void vfe_try_format(struct vfe_line *line,
 		/* Set and return a format same as sink pad */
 		code = fmt->code;
 
-		*fmt = *__vfe_get_format(line, cfg, MSM_VFE_PAD_SINK, which);
+		*fmt = *__vfe_get_format(line, sd_state, MSM_VFE_PAD_SINK,
+					 which);
 
 		fmt->code = vfe_src_pad_code(line, fmt->code, 0, code);
 
 		if (line->id == VFE_LINE_PIX) {
 			struct v4l2_rect *rect;
 
-			rect = __vfe_get_crop(line, cfg, which);
+			rect = __vfe_get_crop(line, sd_state, which);
 
 			fmt->width = rect->width;
 			fmt->height = rect->height;
@@ -881,13 +883,13 @@ static void vfe_try_format(struct vfe_line *line,
  * @which: wanted subdev format
  */
 static void vfe_try_compose(struct vfe_line *line,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_rect *rect,
 			    enum v4l2_subdev_format_whence which)
 {
 	struct v4l2_mbus_framefmt *fmt;
 
-	fmt = __vfe_get_format(line, cfg, MSM_VFE_PAD_SINK, which);
+	fmt = __vfe_get_format(line, sd_state, MSM_VFE_PAD_SINK, which);
 
 	if (rect->width > fmt->width)
 		rect->width = fmt->width;
@@ -920,13 +922,13 @@ static void vfe_try_compose(struct vfe_line *line,
  * @which: wanted subdev format
  */
 static void vfe_try_crop(struct vfe_line *line,
-			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_state *sd_state,
 			 struct v4l2_rect *rect,
 			 enum v4l2_subdev_format_whence which)
 {
 	struct v4l2_rect *compose;
 
-	compose = __vfe_get_compose(line, cfg, which);
+	compose = __vfe_get_compose(line, sd_state, which);
 
 	if (rect->width > compose->width)
 		rect->width = compose->width;
@@ -964,7 +966,7 @@ static void vfe_try_crop(struct vfe_line *line,
  * return -EINVAL or zero on success
  */
 static int vfe_enum_mbus_code(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct vfe_line *line = v4l2_get_subdevdata(sd);
@@ -977,7 +979,7 @@ static int vfe_enum_mbus_code(struct v4l2_subdev *sd,
 	} else {
 		struct v4l2_mbus_framefmt *sink_fmt;
 
-		sink_fmt = __vfe_get_format(line, cfg, MSM_VFE_PAD_SINK,
+		sink_fmt = __vfe_get_format(line, sd_state, MSM_VFE_PAD_SINK,
 					    code->which);
 
 		code->code = vfe_src_pad_code(line, sink_fmt->code,
@@ -998,7 +1000,7 @@ static int vfe_enum_mbus_code(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_enum_frame_size(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct vfe_line *line = v4l2_get_subdevdata(sd);
@@ -1010,7 +1012,7 @@ static int vfe_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = 1;
 	format.height = 1;
-	vfe_try_format(line, cfg, fse->pad, &format, fse->which);
+	vfe_try_format(line, sd_state, fse->pad, &format, fse->which);
 	fse->min_width = format.width;
 	fse->min_height = format.height;
 
@@ -1020,7 +1022,7 @@ static int vfe_enum_frame_size(struct v4l2_subdev *sd,
 	format.code = fse->code;
 	format.width = -1;
 	format.height = -1;
-	vfe_try_format(line, cfg, fse->pad, &format, fse->which);
+	vfe_try_format(line, sd_state, fse->pad, &format, fse->which);
 	fse->max_width = format.width;
 	fse->max_height = format.height;
 
@@ -1036,13 +1038,13 @@ static int vfe_enum_frame_size(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_get_format(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct vfe_line *line = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __vfe_get_format(line, cfg, fmt->pad, fmt->which);
+	format = __vfe_get_format(line, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
@@ -1052,7 +1054,7 @@ static int vfe_get_format(struct v4l2_subdev *sd,
 }
 
 static int vfe_set_selection(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel);
 
 /*
@@ -1064,17 +1066,17 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_set_format(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct vfe_line *line = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __vfe_get_format(line, cfg, fmt->pad, fmt->which);
+	format = __vfe_get_format(line, sd_state, fmt->pad, fmt->which);
 	if (format == NULL)
 		return -EINVAL;
 
-	vfe_try_format(line, cfg, fmt->pad, &fmt->format, fmt->which);
+	vfe_try_format(line, sd_state, fmt->pad, &fmt->format, fmt->which);
 	*format = fmt->format;
 
 	if (fmt->pad == MSM_VFE_PAD_SINK) {
@@ -1082,11 +1084,11 @@ static int vfe_set_format(struct v4l2_subdev *sd,
 		int ret;
 
 		/* Propagate the format from sink to source */
-		format = __vfe_get_format(line, cfg, MSM_VFE_PAD_SRC,
+		format = __vfe_get_format(line, sd_state, MSM_VFE_PAD_SRC,
 					  fmt->which);
 
 		*format = fmt->format;
-		vfe_try_format(line, cfg, MSM_VFE_PAD_SRC, format,
+		vfe_try_format(line, sd_state, MSM_VFE_PAD_SRC, format,
 			       fmt->which);
 
 		if (line->id != VFE_LINE_PIX)
@@ -1098,7 +1100,7 @@ static int vfe_set_format(struct v4l2_subdev *sd,
 		sel.target = V4L2_SEL_TGT_COMPOSE;
 		sel.r.width = fmt->format.width;
 		sel.r.height = fmt->format.height;
-		ret = vfe_set_selection(sd, cfg, &sel);
+		ret = vfe_set_selection(sd, sd_state, &sel);
 		if (ret < 0)
 			return ret;
 	}
@@ -1115,7 +1117,7 @@ static int vfe_set_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_get_selection(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vfe_line *line = v4l2_get_subdevdata(sd);
@@ -1131,7 +1133,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
 		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 			fmt.pad = sel->pad;
 			fmt.which = sel->which;
-			ret = vfe_get_format(sd, cfg, &fmt);
+			ret = vfe_get_format(sd, sd_state, &fmt);
 			if (ret < 0)
 				return ret;
 
@@ -1141,7 +1143,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
 			sel->r.height = fmt.format.height;
 			break;
 		case V4L2_SEL_TGT_COMPOSE:
-			rect = __vfe_get_compose(line, cfg, sel->which);
+			rect = __vfe_get_compose(line, sd_state, sel->which);
 			if (rect == NULL)
 				return -EINVAL;
 
@@ -1153,7 +1155,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
 	else if (sel->pad == MSM_VFE_PAD_SRC)
 		switch (sel->target) {
 		case V4L2_SEL_TGT_CROP_BOUNDS:
-			rect = __vfe_get_compose(line, cfg, sel->which);
+			rect = __vfe_get_compose(line, sd_state, sel->which);
 			if (rect == NULL)
 				return -EINVAL;
 
@@ -1163,7 +1165,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
 			sel->r.height = rect->height;
 			break;
 		case V4L2_SEL_TGT_CROP:
-			rect = __vfe_get_crop(line, cfg, sel->which);
+			rect = __vfe_get_crop(line, sd_state, sel->which);
 			if (rect == NULL)
 				return -EINVAL;
 
@@ -1185,7 +1187,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int vfe_set_selection(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vfe_line *line = v4l2_get_subdevdata(sd);
@@ -1199,11 +1201,11 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
 		sel->pad == MSM_VFE_PAD_SINK) {
 		struct v4l2_subdev_selection crop = { 0 };
 
-		rect = __vfe_get_compose(line, cfg, sel->which);
+		rect = __vfe_get_compose(line, sd_state, sel->which);
 		if (rect == NULL)
 			return -EINVAL;
 
-		vfe_try_compose(line, cfg, &sel->r, sel->which);
+		vfe_try_compose(line, sd_state, &sel->r, sel->which);
 		*rect = sel->r;
 
 		/* Reset source crop selection */
@@ -1211,28 +1213,28 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
 		crop.pad = MSM_VFE_PAD_SRC;
 		crop.target = V4L2_SEL_TGT_CROP;
 		crop.r = *rect;
-		ret = vfe_set_selection(sd, cfg, &crop);
+		ret = vfe_set_selection(sd, sd_state, &crop);
 	} else if (sel->target == V4L2_SEL_TGT_CROP &&
 		sel->pad == MSM_VFE_PAD_SRC) {
 		struct v4l2_subdev_format fmt = { 0 };
 
-		rect = __vfe_get_crop(line, cfg, sel->which);
+		rect = __vfe_get_crop(line, sd_state, sel->which);
 		if (rect == NULL)
 			return -EINVAL;
 
-		vfe_try_crop(line, cfg, &sel->r, sel->which);
+		vfe_try_crop(line, sd_state, &sel->r, sel->which);
 		*rect = sel->r;
 
 		/* Reset source pad format width and height */
 		fmt.which = sel->which;
 		fmt.pad = MSM_VFE_PAD_SRC;
-		ret = vfe_get_format(sd, cfg, &fmt);
+		ret = vfe_get_format(sd, sd_state, &fmt);
 		if (ret < 0)
 			return ret;
 
 		fmt.format.width = rect->width;
 		fmt.format.height = rect->height;
-		ret = vfe_set_format(sd, cfg, &fmt);
+		ret = vfe_set_format(sd, sd_state, &fmt);
 	} else {
 		ret = -EINVAL;
 	}
@@ -1262,7 +1264,7 @@ static int vfe_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		}
 	};
 
-	return vfe_set_format(sd, fh ? fh->pad : NULL, &format);
+	return vfe_set_format(sd, fh ? fh->state : NULL, &format);
 }
 
 /*
diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index b87d5453e418..a128bf80e42c 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -717,7 +717,7 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *format)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
@@ -729,7 +729,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		priv->mf = format->format;
 	} else {
-		framefmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
 		*framefmt = format->format;
 	}
 
@@ -737,7 +737,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 }
 
 static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *format)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
@@ -745,7 +745,7 @@ static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		format->format = priv->mf;
 	else
-		format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
+		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
 
 	return 0;
 }
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index b1e9f86caa5c..cca15a10c0b3 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -243,7 +243,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 			   struct v4l2_rect *src_rect)
 {
 	struct v4l2_subdev *sd = vin_to_source(vin);
-	struct v4l2_subdev_pad_config *pad_cfg;
+	struct v4l2_subdev_state *sd_state;
 	struct v4l2_subdev_format format = {
 		.which = which,
 		.pad = vin->parallel.source_pad,
@@ -252,8 +252,8 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	u32 width, height;
 	int ret;
 
-	pad_cfg = v4l2_subdev_alloc_pad_config(sd);
-	if (pad_cfg == NULL)
+	sd_state = v4l2_subdev_alloc_state(sd);
+	if (sd_state == NULL)
 		return -ENOMEM;
 
 	if (!rvin_format_from_pixel(vin, pix->pixelformat))
@@ -266,7 +266,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	width = pix->width;
 	height = pix->height;
 
-	ret = v4l2_subdev_call(sd, pad, set_fmt, pad_cfg, &format);
+	ret = v4l2_subdev_call(sd, pad, set_fmt, sd_state, &format);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		goto done;
 	ret = 0;
@@ -288,7 +288,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 
 	rvin_format_align(vin, pix);
 done:
-	v4l2_subdev_free_pad_config(pad_cfg);
+	v4l2_subdev_free_state(sd_state);
 
 	return ret;
 }
diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index 17f01b6e3fe0..f432032c7084 100644
--- a/drivers/media/platform/renesas-ceu.c
+++ b/drivers/media/platform/renesas-ceu.c
@@ -794,6 +794,9 @@ static int __ceu_try_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt
 	struct v4l2_pix_format_mplane *pix = &v4l2_fmt->fmt.pix_mp;
 	struct v4l2_subdev *v4l2_sd = ceu_sd->v4l2_sd;
 	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_state pad_state = {
+		.pads = &pad_cfg
+		};
 	const struct ceu_fmt *ceu_fmt;
 	u32 mbus_code_old;
 	u32 mbus_code;
@@ -850,13 +853,13 @@ static int __ceu_try_fmt(struct ceu_device *ceudev, struct v4l2_format *v4l2_fmt
 	 * time.
 	 */
 	sd_format.format.code = mbus_code;
-	ret = v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_cfg, &sd_format);
+	ret = v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_state, &sd_format);
 	if (ret) {
 		if (ret == -EINVAL) {
 			/* fallback */
 			sd_format.format.code = mbus_code_old;
 			ret = v4l2_subdev_call(v4l2_sd, pad, set_fmt,
-					       &pad_cfg, &sd_format);
+					       &pad_state, &sd_format);
 		}
 
 		if (ret)
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2e5b57e3aedc..d596bc040005 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -208,24 +208,30 @@ static struct v4l2_subdev *rkisp1_get_remote_sensor(struct v4l2_subdev *sd)
 
 static struct v4l2_mbus_framefmt *
 rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       unsigned int pad, u32 which)
 {
+	struct v4l2_subdev_state state = {
+		.pads = isp->pad_cfg
+		};
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&isp->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&isp->sd, sd_state, pad);
 	else
-		return v4l2_subdev_get_try_format(&isp->sd, isp->pad_cfg, pad);
+		return v4l2_subdev_get_try_format(&isp->sd, &state, pad);
 }
 
 static struct v4l2_rect *
 rkisp1_isp_get_pad_crop(struct rkisp1_isp *isp,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			unsigned int pad, u32 which)
 {
+	struct v4l2_subdev_state state = {
+		.pads = isp->pad_cfg
+		};
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&isp->sd, cfg, pad);
+		return v4l2_subdev_get_try_crop(&isp->sd, sd_state, pad);
 	else
-		return v4l2_subdev_get_try_crop(&isp->sd, isp->pad_cfg, pad);
+		return v4l2_subdev_get_try_crop(&isp->sd, &state, pad);
 }
 
 /* ----------------------------------------------------------------------------
@@ -561,7 +567,7 @@ static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
  */
 
 static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_mbus_code_enum *code)
 {
 	unsigned int i, dir;
@@ -601,7 +607,7 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_size_enum *fse)
 {
 	const struct rkisp1_isp_mbus_info *mbus_info;
@@ -634,37 +640,37 @@ static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg)
+				  struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 	struct v4l2_rect *sink_crop, *src_crop;
 
-	sink_fmt = v4l2_subdev_get_try_format(sd, cfg,
+	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
 					      RKISP1_ISP_PAD_SINK_VIDEO);
 	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
 	sink_fmt->field = V4L2_FIELD_NONE;
 	sink_fmt->code = RKISP1_DEF_SINK_PAD_FMT;
 
-	sink_crop = v4l2_subdev_get_try_crop(sd, cfg,
+	sink_crop = v4l2_subdev_get_try_crop(sd, sd_state,
 					     RKISP1_ISP_PAD_SINK_VIDEO);
 	sink_crop->width = RKISP1_DEFAULT_WIDTH;
 	sink_crop->height = RKISP1_DEFAULT_HEIGHT;
 	sink_crop->left = 0;
 	sink_crop->top = 0;
 
-	src_fmt = v4l2_subdev_get_try_format(sd, cfg,
+	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
 					     RKISP1_ISP_PAD_SOURCE_VIDEO);
 	*src_fmt = *sink_fmt;
 	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
 
-	src_crop = v4l2_subdev_get_try_crop(sd, cfg,
+	src_crop = v4l2_subdev_get_try_crop(sd, sd_state,
 					    RKISP1_ISP_PAD_SOURCE_VIDEO);
 	*src_crop = *sink_crop;
 
-	sink_fmt = v4l2_subdev_get_try_format(sd, cfg,
+	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
 					      RKISP1_ISP_PAD_SINK_PARAMS);
-	src_fmt = v4l2_subdev_get_try_format(sd, cfg,
+	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
 					     RKISP1_ISP_PAD_SOURCE_STATS);
 	sink_fmt->width = 0;
 	sink_fmt->height = 0;
@@ -676,7 +682,7 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 }
 
 static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_mbus_framefmt *format,
 				   unsigned int which)
 {
@@ -684,9 +690,9 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 	struct v4l2_mbus_framefmt *src_fmt;
 	const struct v4l2_rect *src_crop;
 
-	src_fmt = rkisp1_isp_get_pad_fmt(isp, cfg,
+	src_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
 					 RKISP1_ISP_PAD_SOURCE_VIDEO, which);
-	src_crop = rkisp1_isp_get_pad_crop(isp, cfg,
+	src_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
 					   RKISP1_ISP_PAD_SOURCE_VIDEO, which);
 
 	src_fmt->code = format->code;
@@ -717,17 +723,17 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 }
 
 static void rkisp1_isp_set_src_crop(struct rkisp1_isp *isp,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_rect *r, unsigned int which)
 {
 	struct v4l2_mbus_framefmt *src_fmt;
 	const struct v4l2_rect *sink_crop;
 	struct v4l2_rect *src_crop;
 
-	src_crop = rkisp1_isp_get_pad_crop(isp, cfg,
+	src_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
 					   RKISP1_ISP_PAD_SOURCE_VIDEO,
 					   which);
-	sink_crop = rkisp1_isp_get_pad_crop(isp, cfg,
+	sink_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
 					    RKISP1_ISP_PAD_SINK_VIDEO,
 					    which);
 
@@ -740,21 +746,23 @@ static void rkisp1_isp_set_src_crop(struct rkisp1_isp *isp,
 	*r = *src_crop;
 
 	/* Propagate to out format */
-	src_fmt = rkisp1_isp_get_pad_fmt(isp, cfg,
+	src_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
 					 RKISP1_ISP_PAD_SOURCE_VIDEO, which);
-	rkisp1_isp_set_src_fmt(isp, cfg, src_fmt, which);
+	rkisp1_isp_set_src_fmt(isp, sd_state, src_fmt, which);
 }
 
 static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_rect *r, unsigned int which)
 {
 	struct v4l2_rect *sink_crop, *src_crop;
 	struct v4l2_mbus_framefmt *sink_fmt;
 
-	sink_crop = rkisp1_isp_get_pad_crop(isp, cfg, RKISP1_ISP_PAD_SINK_VIDEO,
+	sink_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
+					    RKISP1_ISP_PAD_SINK_VIDEO,
 					    which);
-	sink_fmt = rkisp1_isp_get_pad_fmt(isp, cfg, RKISP1_ISP_PAD_SINK_VIDEO,
+	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
+					  RKISP1_ISP_PAD_SINK_VIDEO,
 					  which);
 
 	sink_crop->left = ALIGN(r->left, 2);
@@ -766,13 +774,13 @@ static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
 	*r = *sink_crop;
 
 	/* Propagate to out crop */
-	src_crop = rkisp1_isp_get_pad_crop(isp, cfg,
+	src_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
 					   RKISP1_ISP_PAD_SOURCE_VIDEO, which);
-	rkisp1_isp_set_src_crop(isp, cfg, src_crop, which);
+	rkisp1_isp_set_src_crop(isp, sd_state, src_crop, which);
 }
 
 static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_mbus_framefmt *format,
 				    unsigned int which)
 {
@@ -780,7 +788,8 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
 	struct v4l2_mbus_framefmt *sink_fmt;
 	struct v4l2_rect *sink_crop;
 
-	sink_fmt = rkisp1_isp_get_pad_fmt(isp, cfg, RKISP1_ISP_PAD_SINK_VIDEO,
+	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
+					  RKISP1_ISP_PAD_SINK_VIDEO,
 					  which);
 	sink_fmt->code = format->code;
 	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
@@ -801,36 +810,40 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
 	*format = *sink_fmt;
 
 	/* Propagate to in crop */
-	sink_crop = rkisp1_isp_get_pad_crop(isp, cfg, RKISP1_ISP_PAD_SINK_VIDEO,
+	sink_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
+					    RKISP1_ISP_PAD_SINK_VIDEO,
 					    which);
-	rkisp1_isp_set_sink_crop(isp, cfg, sink_crop, which);
+	rkisp1_isp_set_sink_crop(isp, sd_state, sink_crop, which);
 }
 
 static int rkisp1_isp_get_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
 
 	mutex_lock(&isp->ops_lock);
-	fmt->format = *rkisp1_isp_get_pad_fmt(isp, cfg, fmt->pad, fmt->which);
+	fmt->format = *rkisp1_isp_get_pad_fmt(isp, sd_state, fmt->pad,
+					      fmt->which);
 	mutex_unlock(&isp->ops_lock);
 	return 0;
 }
 
 static int rkisp1_isp_set_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
 
 	mutex_lock(&isp->ops_lock);
 	if (fmt->pad == RKISP1_ISP_PAD_SINK_VIDEO)
-		rkisp1_isp_set_sink_fmt(isp, cfg, &fmt->format, fmt->which);
+		rkisp1_isp_set_sink_fmt(isp, sd_state, &fmt->format,
+					fmt->which);
 	else if (fmt->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
-		rkisp1_isp_set_src_fmt(isp, cfg, &fmt->format, fmt->which);
+		rkisp1_isp_set_src_fmt(isp, sd_state, &fmt->format,
+				       fmt->which);
 	else
-		fmt->format = *rkisp1_isp_get_pad_fmt(isp, cfg, fmt->pad,
+		fmt->format = *rkisp1_isp_get_pad_fmt(isp, sd_state, fmt->pad,
 						      fmt->which);
 
 	mutex_unlock(&isp->ops_lock);
@@ -838,7 +851,7 @@ static int rkisp1_isp_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_isp_get_selection(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
 	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
@@ -854,20 +867,20 @@ static int rkisp1_isp_get_selection(struct v4l2_subdev *sd,
 		if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO) {
 			struct v4l2_mbus_framefmt *fmt;
 
-			fmt = rkisp1_isp_get_pad_fmt(isp, cfg, sel->pad,
+			fmt = rkisp1_isp_get_pad_fmt(isp, sd_state, sel->pad,
 						     sel->which);
 			sel->r.height = fmt->height;
 			sel->r.width = fmt->width;
 			sel->r.left = 0;
 			sel->r.top = 0;
 		} else {
-			sel->r = *rkisp1_isp_get_pad_crop(isp, cfg,
-						RKISP1_ISP_PAD_SINK_VIDEO,
-						sel->which);
+			sel->r = *rkisp1_isp_get_pad_crop(isp, sd_state,
+							  RKISP1_ISP_PAD_SINK_VIDEO,
+							  sel->which);
 		}
 		break;
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *rkisp1_isp_get_pad_crop(isp, cfg, sel->pad,
+		sel->r = *rkisp1_isp_get_pad_crop(isp, sd_state, sel->pad,
 						  sel->which);
 		break;
 	default:
@@ -878,7 +891,7 @@ static int rkisp1_isp_get_selection(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_isp_set_selection(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
 	struct rkisp1_device *rkisp1 =
@@ -893,9 +906,9 @@ static int rkisp1_isp_set_selection(struct v4l2_subdev *sd,
 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 	mutex_lock(&isp->ops_lock);
 	if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO)
-		rkisp1_isp_set_sink_crop(isp, cfg, &sel->r, sel->which);
+		rkisp1_isp_set_sink_crop(isp, sd_state, &sel->r, sel->which);
 	else if (sel->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
-		rkisp1_isp_set_src_crop(isp, cfg, &sel->r, sel->which);
+		rkisp1_isp_set_src_crop(isp, sd_state, &sel->r, sel->which);
 	else
 		ret = -EINVAL;
 
@@ -1037,6 +1050,9 @@ static const struct v4l2_subdev_ops rkisp1_isp_ops = {
 
 int rkisp1_isp_register(struct rkisp1_device *rkisp1)
 {
+	struct v4l2_subdev_state state = {
+		.pads = rkisp1->isp.pad_cfg
+		};
 	struct rkisp1_isp *isp = &rkisp1->isp;
 	struct media_pad *pads = isp->pads;
 	struct v4l2_subdev *sd = &isp->sd;
@@ -1069,7 +1085,7 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
 		goto err_cleanup_media_entity;
 	}
 
-	rkisp1_isp_init_config(sd, rkisp1->isp.pad_cfg);
+	rkisp1_isp_init_config(sd, &state);
 	return 0;
 
 err_cleanup_media_entity:
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 79deed8adcea..2070f4b06705 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -180,24 +180,30 @@ static const struct rkisp1_rsz_config rkisp1_rsz_config_sp = {
 
 static struct v4l2_mbus_framefmt *
 rkisp1_rsz_get_pad_fmt(struct rkisp1_resizer *rsz,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *sd_state,
 		       unsigned int pad, u32 which)
 {
+	struct v4l2_subdev_state state = {
+		.pads = rsz->pad_cfg
+		};
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&rsz->sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&rsz->sd, sd_state, pad);
 	else
-		return v4l2_subdev_get_try_format(&rsz->sd, rsz->pad_cfg, pad);
+		return v4l2_subdev_get_try_format(&rsz->sd, &state, pad);
 }
 
 static struct v4l2_rect *
 rkisp1_rsz_get_pad_crop(struct rkisp1_resizer *rsz,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			unsigned int pad, u32 which)
 {
+	struct v4l2_subdev_state state = {
+		.pads = rsz->pad_cfg
+		};
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&rsz->sd, cfg, pad);
+		return v4l2_subdev_get_try_crop(&rsz->sd, sd_state, pad);
 	else
-		return v4l2_subdev_get_try_crop(&rsz->sd, rsz->pad_cfg, pad);
+		return v4l2_subdev_get_try_crop(&rsz->sd, &state, pad);
 }
 
 /* ----------------------------------------------------------------------------
@@ -451,12 +457,15 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
  */
 
 static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct rkisp1_resizer *rsz =
 		container_of(sd, struct rkisp1_resizer, sd);
 	struct v4l2_subdev_pad_config dummy_cfg;
+	struct v4l2_subdev_state pad_state = {
+		.pads = &dummy_cfg
+		};
 	u32 pad = code->pad;
 	int ret;
 
@@ -481,7 +490,7 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
 	/* supported mbus codes on the sink pad are the same as isp src pad */
 	code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
 	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
-			       &dummy_cfg, code);
+			       &pad_state, code);
 
 	/* restore pad */
 	code->pad = pad;
@@ -490,24 +499,27 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg)
+				  struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 	struct v4l2_rect *sink_crop;
 
-	sink_fmt = v4l2_subdev_get_try_format(sd, cfg, RKISP1_RSZ_PAD_SRC);
+	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+					      RKISP1_RSZ_PAD_SRC);
 	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
 	sink_fmt->field = V4L2_FIELD_NONE;
 	sink_fmt->code = RKISP1_DEF_FMT;
 
-	sink_crop = v4l2_subdev_get_try_crop(sd, cfg, RKISP1_RSZ_PAD_SINK);
+	sink_crop = v4l2_subdev_get_try_crop(sd, sd_state,
+					     RKISP1_RSZ_PAD_SINK);
 	sink_crop->width = RKISP1_DEFAULT_WIDTH;
 	sink_crop->height = RKISP1_DEFAULT_HEIGHT;
 	sink_crop->left = 0;
 	sink_crop->top = 0;
 
-	src_fmt = v4l2_subdev_get_try_format(sd, cfg, RKISP1_RSZ_PAD_SINK);
+	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+					     RKISP1_RSZ_PAD_SINK);
 	*src_fmt = *sink_fmt;
 
 	/* NOTE: there is no crop in the source pad, only in the sink */
@@ -516,15 +528,17 @@ static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
 }
 
 static void rkisp1_rsz_set_src_fmt(struct rkisp1_resizer *rsz,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_mbus_framefmt *format,
 				   unsigned int which)
 {
 	const struct rkisp1_isp_mbus_info *sink_mbus_info;
 	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
 
-	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
-	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
+	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SINK,
+					  which);
+	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SRC,
+					 which);
 	sink_mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
 
 	/* for YUV formats, userspace can change the mbus code on the src pad if it is supported */
@@ -543,7 +557,7 @@ static void rkisp1_rsz_set_src_fmt(struct rkisp1_resizer *rsz,
 }
 
 static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_rect *r,
 				     unsigned int which)
 {
@@ -551,8 +565,10 @@ static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
 	struct v4l2_mbus_framefmt *sink_fmt;
 	struct v4l2_rect *sink_crop;
 
-	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
-	sink_crop = rkisp1_rsz_get_pad_crop(rsz, cfg, RKISP1_RSZ_PAD_SINK,
+	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SINK,
+					  which);
+	sink_crop = rkisp1_rsz_get_pad_crop(rsz, sd_state,
+					    RKISP1_RSZ_PAD_SINK,
 					    which);
 
 	/* Not crop for MP bayer raw data */
@@ -579,7 +595,7 @@ static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
 }
 
 static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_mbus_framefmt *format,
 				    unsigned int which)
 {
@@ -587,9 +603,12 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 	struct v4l2_rect *sink_crop;
 
-	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
-	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
-	sink_crop = rkisp1_rsz_get_pad_crop(rsz, cfg, RKISP1_RSZ_PAD_SINK,
+	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SINK,
+					  which);
+	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SRC,
+					 which);
+	sink_crop = rkisp1_rsz_get_pad_crop(rsz, sd_state,
+					    RKISP1_RSZ_PAD_SINK,
 					    which);
 	if (rsz->id == RKISP1_SELFPATH)
 		sink_fmt->code = MEDIA_BUS_FMT_YUYV8_2X8;
@@ -617,24 +636,25 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 	*format = *sink_fmt;
 
 	/* Update sink crop */
-	rkisp1_rsz_set_sink_crop(rsz, cfg, sink_crop, which);
+	rkisp1_rsz_set_sink_crop(rsz, sd_state, sink_crop, which);
 }
 
 static int rkisp1_rsz_get_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct rkisp1_resizer *rsz =
 		container_of(sd, struct rkisp1_resizer, sd);
 
 	mutex_lock(&rsz->ops_lock);
-	fmt->format = *rkisp1_rsz_get_pad_fmt(rsz, cfg, fmt->pad, fmt->which);
+	fmt->format = *rkisp1_rsz_get_pad_fmt(rsz, sd_state, fmt->pad,
+					      fmt->which);
 	mutex_unlock(&rsz->ops_lock);
 	return 0;
 }
 
 static int rkisp1_rsz_set_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct rkisp1_resizer *rsz =
@@ -642,16 +662,18 @@ static int rkisp1_rsz_set_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&rsz->ops_lock);
 	if (fmt->pad == RKISP1_RSZ_PAD_SINK)
-		rkisp1_rsz_set_sink_fmt(rsz, cfg, &fmt->format, fmt->which);
+		rkisp1_rsz_set_sink_fmt(rsz, sd_state, &fmt->format,
+					fmt->which);
 	else
-		rkisp1_rsz_set_src_fmt(rsz, cfg, &fmt->format, fmt->which);
+		rkisp1_rsz_set_src_fmt(rsz, sd_state, &fmt->format,
+				       fmt->which);
 
 	mutex_unlock(&rsz->ops_lock);
 	return 0;
 }
 
 static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
 	struct rkisp1_resizer *rsz =
@@ -665,7 +687,8 @@ static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
 	mutex_lock(&rsz->ops_lock);
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		mf_sink = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK,
+		mf_sink = rkisp1_rsz_get_pad_fmt(rsz, sd_state,
+						 RKISP1_RSZ_PAD_SINK,
 						 sel->which);
 		sel->r.height = mf_sink->height;
 		sel->r.width = mf_sink->width;
@@ -673,7 +696,8 @@ static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
 		sel->r.top = 0;
 		break;
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *rkisp1_rsz_get_pad_crop(rsz, cfg, RKISP1_RSZ_PAD_SINK,
+		sel->r = *rkisp1_rsz_get_pad_crop(rsz, sd_state,
+						  RKISP1_RSZ_PAD_SINK,
 						  sel->which);
 		break;
 	default:
@@ -685,7 +709,7 @@ static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
 }
 
 static int rkisp1_rsz_set_selection(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
 	struct rkisp1_resizer *rsz =
@@ -698,7 +722,7 @@ static int rkisp1_rsz_set_selection(struct v4l2_subdev *sd,
 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 
 	mutex_lock(&rsz->ops_lock);
-	rkisp1_rsz_set_sink_crop(rsz, cfg, &sel->r, sel->which);
+	rkisp1_rsz_set_sink_crop(rsz, sd_state, &sel->r, sel->which);
 	mutex_unlock(&rsz->ops_lock);
 
 	return 0;
@@ -764,6 +788,9 @@ static void rkisp1_rsz_unregister(struct rkisp1_resizer *rsz)
 
 static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 {
+	struct v4l2_subdev_state state = {
+		.pads = rsz->pad_cfg
+		};
 	static const char * const dev_names[] = {
 		RKISP1_RSZ_MP_DEV_NAME,
 		RKISP1_RSZ_SP_DEV_NAME
@@ -802,7 +829,7 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 		goto err_cleanup_media_entity;
 	}
 
-	rkisp1_rsz_init_config(sd, rsz->pad_cfg);
+	rkisp1_rsz_init_config(sd, &state);
 	return 0;
 
 err_cleanup_media_entity:
diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index b33c6e7ae0a1..d914ccef9831 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -600,7 +600,7 @@ static struct media_entity *dcmi_find_source(struct stm32_dcmi *dcmi)
 }
 
 static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
-			       struct v4l2_subdev_pad_config *pad_cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *format)
 {
 	struct media_entity *entity = &dcmi->source->entity;
@@ -642,7 +642,7 @@ static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
 			format->format.width, format->format.height);
 
 		fmt.pad = pad->index;
-		ret = v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
+		ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
 		if (ret < 0) {
 			dev_err(dcmi->dev, "%s: Failed to set format 0x%x %ux%u on \"%s\":%d pad (%d)\n",
 				__func__, format->format.code,
@@ -978,6 +978,9 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 	struct dcmi_framesize sd_fsize;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_state pad_state = {
+		.pads = &pad_cfg
+		};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -1013,7 +1016,7 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
 	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
-			       &pad_cfg, &format);
+			       &pad_state, &format);
 	if (ret < 0)
 		return ret;
 
@@ -1163,6 +1166,9 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
 	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_state pad_state = {
+		.pads = &pad_cfg
+		};
 	int ret;
 
 	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
@@ -1176,7 +1182,7 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
 	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
-			       &pad_cfg, &format);
+			       &pad_state, &format);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 54b909987caa..3872027ed2fa 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -271,25 +271,26 @@ static const struct v4l2_mbus_framefmt sun4i_csi_pad_fmt_default = {
 };
 
 static int sun4i_csi_subdev_init_cfg(struct v4l2_subdev *subdev,
-				     struct v4l2_subdev_pad_config *cfg)
+				     struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *fmt;
 
-	fmt = v4l2_subdev_get_try_format(subdev, cfg, CSI_SUBDEV_SINK);
+	fmt = v4l2_subdev_get_try_format(subdev, sd_state, CSI_SUBDEV_SINK);
 	*fmt = sun4i_csi_pad_fmt_default;
 
 	return 0;
 }
 
 static int sun4i_csi_subdev_get_fmt(struct v4l2_subdev *subdev,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
 	struct sun4i_csi *csi = container_of(subdev, struct sun4i_csi, subdev);
 	struct v4l2_mbus_framefmt *subdev_fmt;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		subdev_fmt = v4l2_subdev_get_try_format(subdev, cfg, fmt->pad);
+		subdev_fmt = v4l2_subdev_get_try_format(subdev, sd_state,
+							fmt->pad);
 	else
 		subdev_fmt = &csi->subdev_fmt;
 
@@ -299,14 +300,15 @@ static int sun4i_csi_subdev_get_fmt(struct v4l2_subdev *subdev,
 }
 
 static int sun4i_csi_subdev_set_fmt(struct v4l2_subdev *subdev,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_format *fmt)
 {
 	struct sun4i_csi *csi = container_of(subdev, struct sun4i_csi, subdev);
 	struct v4l2_mbus_framefmt *subdev_fmt;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		subdev_fmt = v4l2_subdev_get_try_format(subdev, cfg, fmt->pad);
+		subdev_fmt = v4l2_subdev_get_try_format(subdev, sd_state,
+							fmt->pad);
 	else
 		subdev_fmt = &csi->subdev_fmt;
 
@@ -325,7 +327,7 @@ static int sun4i_csi_subdev_set_fmt(struct v4l2_subdev *subdev,
 
 static int
 sun4i_csi_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_mbus_code_enum *mbus)
 {
 	if (mbus->index >= ARRAY_SIZE(sun4i_csi_formats))
diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index cbe6114908de..124a4e2bdefe 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -586,12 +586,12 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
 
 static struct v4l2_mbus_framefmt *
 cal_camerarx_get_pad_format(struct cal_camerarx *phy,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    unsigned int pad, u32 which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&phy->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&phy->subdev, sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &phy->formats[pad];
 	default:
@@ -611,7 +611,7 @@ static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
-					  struct v4l2_subdev_pad_config *cfg,
+					  struct v4l2_subdev_state *sd_state,
 					  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -623,7 +623,7 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		fmt = cal_camerarx_get_pad_format(phy, cfg,
+		fmt = cal_camerarx_get_pad_format(phy, sd_state,
 						  CAL_CAMERARX_PAD_SINK,
 						  code->which);
 		code->code = fmt->code;
@@ -639,7 +639,7 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
-					   struct v4l2_subdev_pad_config *cfg,
+					   struct v4l2_subdev_state *sd_state,
 					   struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -652,7 +652,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->pad == CAL_CAMERARX_PAD_SOURCE) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = cal_camerarx_get_pad_format(phy, cfg,
+		fmt = cal_camerarx_get_pad_format(phy, sd_state,
 						  CAL_CAMERARX_PAD_SINK,
 						  fse->which);
 		if (fse->code != fmt->code)
@@ -679,20 +679,21 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	fmt = cal_camerarx_get_pad_format(phy, cfg, format->pad, format->which);
+	fmt = cal_camerarx_get_pad_format(phy, sd_state, format->pad,
+					  format->which);
 	format->format = *fmt;
 
 	return 0;
 }
 
 static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *format)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
@@ -702,7 +703,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 
 	/* No transcoding, source and sink formats must match. */
 	if (format->pad == CAL_CAMERARX_PAD_SOURCE)
-		return cal_camerarx_sd_get_fmt(sd, cfg, format);
+		return cal_camerarx_sd_get_fmt(sd, sd_state, format);
 
 	/*
 	 * Default to the first format is the requested media bus code isn't
@@ -727,11 +728,13 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 	format->format.code = fmtinfo->code;
 
 	/* Store the format and propagate it to the source pad. */
-	fmt = cal_camerarx_get_pad_format(phy, cfg, CAL_CAMERARX_PAD_SINK,
+	fmt = cal_camerarx_get_pad_format(phy, sd_state,
+					  CAL_CAMERARX_PAD_SINK,
 					  format->which);
 	*fmt = format->format;
 
-	fmt = cal_camerarx_get_pad_format(phy, cfg, CAL_CAMERARX_PAD_SOURCE,
+	fmt = cal_camerarx_get_pad_format(phy, sd_state,
+					  CAL_CAMERARX_PAD_SOURCE,
 					  format->which);
 	*fmt = format->format;
 
@@ -742,11 +745,11 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg)
+				    struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format format = {
-		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
-		       : V4L2_SUBDEV_FORMAT_ACTIVE,
+		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
+		: V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad = CAL_CAMERARX_PAD_SINK,
 		.format = {
 			.width = 640,
@@ -760,7 +763,7 @@ static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
 		},
 	};
 
-	return cal_camerarx_sd_set_fmt(sd, cfg, &format);
+	return cal_camerarx_sd_set_fmt(sd, sd_state, &format);
 }
 
 static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
diff --git a/drivers/media/platform/via-camera.c b/drivers/media/platform/via-camera.c
index ed0ad68c5c48..3655573e8581 100644
--- a/drivers/media/platform/via-camera.c
+++ b/drivers/media/platform/via-camera.c
@@ -844,6 +844,9 @@ static int viacam_do_try_fmt(struct via_camera *cam,
 {
 	int ret;
 	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_state pad_state = {
+		.pads = &pad_cfg
+		};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -852,7 +855,7 @@ static int viacam_do_try_fmt(struct via_camera *cam,
 	upix->pixelformat = f->pixelformat;
 	viacam_fmt_pre(upix, spix);
 	v4l2_fill_mbus_format(&format.format, spix, f->mbus_code);
-	ret = sensor_call(cam, pad, set_fmt, &pad_cfg, &format);
+	ret = sensor_call(cam, pad, set_fmt, &pad_state, &format);
 	v4l2_fill_pix_format(spix, &format.format);
 	viacam_fmt_post(upix, spix);
 	return ret;
diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 133122e38515..f7e2a5e48ccf 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -140,14 +140,14 @@ static const struct v4l2_subdev_video_ops video_mux_subdev_video_ops = {
 
 static struct v4l2_mbus_framefmt *
 __video_mux_get_pad_format(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   unsigned int pad, u32 which)
 {
 	struct video_mux *vmux = v4l2_subdev_to_video_mux(sd);
 
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(sd, cfg, pad);
+		return v4l2_subdev_get_try_format(sd, sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &vmux->format_mbus[pad];
 	default:
@@ -156,14 +156,15 @@ __video_mux_get_pad_format(struct v4l2_subdev *sd,
 }
 
 static int video_mux_get_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *sdformat)
 {
 	struct video_mux *vmux = v4l2_subdev_to_video_mux(sd);
 
 	mutex_lock(&vmux->lock);
 
-	sdformat->format = *__video_mux_get_pad_format(sd, cfg, sdformat->pad,
+	sdformat->format = *__video_mux_get_pad_format(sd, sd_state,
+						       sdformat->pad,
 						       sdformat->which);
 
 	mutex_unlock(&vmux->lock);
@@ -172,7 +173,7 @@ static int video_mux_get_format(struct v4l2_subdev *sd,
 }
 
 static int video_mux_set_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *sdformat)
 {
 	struct video_mux *vmux = v4l2_subdev_to_video_mux(sd);
@@ -180,12 +181,13 @@ static int video_mux_set_format(struct v4l2_subdev *sd,
 	struct media_pad *pad = &vmux->pads[sdformat->pad];
 	u16 source_pad = sd->entity.num_pads - 1;
 
-	mbusformat = __video_mux_get_pad_format(sd, cfg, sdformat->pad,
-					    sdformat->which);
+	mbusformat = __video_mux_get_pad_format(sd, sd_state, sdformat->pad,
+						sdformat->which);
 	if (!mbusformat)
 		return -EINVAL;
 
-	source_mbusformat = __video_mux_get_pad_format(sd, cfg, source_pad,
+	source_mbusformat = __video_mux_get_pad_format(sd, sd_state,
+						       source_pad,
 						       sdformat->which);
 	if (!source_mbusformat)
 		return -EINVAL;
@@ -310,7 +312,7 @@ static int video_mux_set_format(struct v4l2_subdev *sd,
 }
 
 static int video_mux_init_cfg(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg)
+			      struct v4l2_subdev_state *sd_state)
 {
 	struct video_mux *vmux = v4l2_subdev_to_video_mux(sd);
 	struct v4l2_mbus_framefmt *mbusformat;
@@ -319,7 +321,7 @@ static int video_mux_init_cfg(struct v4l2_subdev *sd,
 	mutex_lock(&vmux->lock);
 
 	for (i = 0; i < sd->entity.num_pads; i++) {
-		mbusformat = v4l2_subdev_get_try_format(sd, cfg, i);
+		mbusformat = v4l2_subdev_get_try_format(sd, sd_state, i);
 		*mbusformat = video_mux_format_mbus_default;
 	}
 
diff --git a/drivers/media/platform/vsp1/vsp1_brx.c b/drivers/media/platform/vsp1/vsp1_brx.c
index 2d86c718a5cf..89385b4cabe5 100644
--- a/drivers/media/platform/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/vsp1/vsp1_brx.c
@@ -65,7 +65,7 @@ static const struct v4l2_ctrl_ops brx_ctrl_ops = {
  */
 
 static int brx_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	static const unsigned int codes[] = {
@@ -73,12 +73,12 @@ static int brx_enum_mbus_code(struct v4l2_subdev *subdev,
 		MEDIA_BUS_FMT_AYUV8_1X32,
 	};
 
-	return vsp1_subdev_enum_mbus_code(subdev, cfg, code, codes,
+	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
 					  ARRAY_SIZE(codes));
 }
 
 static int brx_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index)
@@ -97,14 +97,14 @@ static int brx_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static struct v4l2_rect *brx_get_compose(struct vsp1_brx *brx,
-					 struct v4l2_subdev_pad_config *cfg,
+					 struct v4l2_subdev_state *sd_state,
 					 unsigned int pad)
 {
-	return v4l2_subdev_get_try_compose(&brx->entity.subdev, cfg, pad);
+	return v4l2_subdev_get_try_compose(&brx->entity.subdev, sd_state, pad);
 }
 
 static void brx_try_format(struct vsp1_brx *brx,
-			   struct v4l2_subdev_pad_config *config,
+			   struct v4l2_subdev_state *sd_state,
 			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
 {
 	struct v4l2_mbus_framefmt *format;
@@ -119,7 +119,7 @@ static void brx_try_format(struct vsp1_brx *brx,
 
 	default:
 		/* The BRx can't perform format conversion. */
-		format = vsp1_entity_get_pad_format(&brx->entity, config,
+		format = vsp1_entity_get_pad_format(&brx->entity, sd_state,
 						    BRX_PAD_SINK(0));
 		fmt->code = format->code;
 		break;
@@ -132,17 +132,18 @@ static void brx_try_format(struct vsp1_brx *brx,
 }
 
 static int brx_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_brx *brx = to_brx(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
 	mutex_lock(&brx->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&brx->entity, cfg, fmt->which);
+	config = vsp1_entity_get_pad_config(&brx->entity, sd_state,
+					    fmt->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
@@ -181,11 +182,11 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 }
 
 static int brx_get_selection(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_brx *brx = to_brx(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 
 	if (sel->pad == brx->entity.source_pad)
 		return -EINVAL;
@@ -199,7 +200,7 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
 		return 0;
 
 	case V4L2_SEL_TGT_COMPOSE:
-		config = vsp1_entity_get_pad_config(&brx->entity, cfg,
+		config = vsp1_entity_get_pad_config(&brx->entity, sd_state,
 						    sel->which);
 		if (!config)
 			return -EINVAL;
@@ -215,11 +216,11 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int brx_set_selection(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_brx *brx = to_brx(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *compose;
 	int ret = 0;
@@ -232,7 +233,8 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&brx->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&brx->entity, cfg, sel->which);
+	config = vsp1_entity_get_pad_config(&brx->entity, sd_state,
+					    sel->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
diff --git a/drivers/media/platform/vsp1/vsp1_clu.c b/drivers/media/platform/vsp1/vsp1_clu.c
index a47b23bf5abf..c5217fee24f1 100644
--- a/drivers/media/platform/vsp1/vsp1_clu.c
+++ b/drivers/media/platform/vsp1/vsp1_clu.c
@@ -123,27 +123,28 @@ static const unsigned int clu_codes[] = {
 };
 
 static int clu_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
-	return vsp1_subdev_enum_mbus_code(subdev, cfg, code, clu_codes,
+	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, clu_codes,
 					  ARRAY_SIZE(clu_codes));
 }
 
 static int clu_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
-	return vsp1_subdev_enum_frame_size(subdev, cfg, fse, CLU_MIN_SIZE,
+	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+					   CLU_MIN_SIZE,
 					   CLU_MIN_SIZE, CLU_MAX_SIZE,
 					   CLU_MAX_SIZE);
 }
 
 static int clu_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, cfg, fmt, clu_codes,
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, clu_codes,
 					  ARRAY_SIZE(clu_codes),
 					  CLU_MIN_SIZE, CLU_MIN_SIZE,
 					  CLU_MAX_SIZE, CLU_MAX_SIZE);
diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
index aa9d2286056e..6f51e5c75543 100644
--- a/drivers/media/platform/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/vsp1/vsp1_entity.c
@@ -103,7 +103,7 @@ void vsp1_entity_configure_partition(struct vsp1_entity *entity,
 /**
  * vsp1_entity_get_pad_config - Get the pad configuration for an entity
  * @entity: the entity
- * @cfg: the TRY pad configuration
+ * @sd_state: the TRY state
  * @which: configuration selector (ACTIVE or TRY)
  *
  * When called with which set to V4L2_SUBDEV_FORMAT_ACTIVE the caller must hold
@@ -114,9 +114,9 @@ void vsp1_entity_configure_partition(struct vsp1_entity *entity,
  * and simply returned when requested. The ACTIVE configuration comes from the
  * entity structure.
  */
-struct v4l2_subdev_pad_config *
+struct v4l2_subdev_state *
 vsp1_entity_get_pad_config(struct vsp1_entity *entity,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   enum v4l2_subdev_format_whence which)
 {
 	switch (which) {
@@ -124,14 +124,14 @@ vsp1_entity_get_pad_config(struct vsp1_entity *entity,
 		return entity->config;
 	case V4L2_SUBDEV_FORMAT_TRY:
 	default:
-		return cfg;
+		return sd_state;
 	}
 }
 
 /**
  * vsp1_entity_get_pad_format - Get a pad format from storage for an entity
  * @entity: the entity
- * @cfg: the configuration storage
+ * @sd_state: the state storage
  * @pad: the pad number
  *
  * Return the format stored in the given configuration for an entity's pad. The
@@ -139,16 +139,16 @@ vsp1_entity_get_pad_config(struct vsp1_entity *entity,
  */
 struct v4l2_mbus_framefmt *
 vsp1_entity_get_pad_format(struct vsp1_entity *entity,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   unsigned int pad)
 {
-	return v4l2_subdev_get_try_format(&entity->subdev, cfg, pad);
+	return v4l2_subdev_get_try_format(&entity->subdev, sd_state, pad);
 }
 
 /**
  * vsp1_entity_get_pad_selection - Get a pad selection from storage for entity
  * @entity: the entity
- * @cfg: the configuration storage
+ * @sd_state: the state storage
  * @pad: the pad number
  * @target: the selection target
  *
@@ -158,14 +158,16 @@ vsp1_entity_get_pad_format(struct vsp1_entity *entity,
  */
 struct v4l2_rect *
 vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      unsigned int pad, unsigned int target)
 {
 	switch (target) {
 	case V4L2_SEL_TGT_COMPOSE:
-		return v4l2_subdev_get_try_compose(&entity->subdev, cfg, pad);
+		return v4l2_subdev_get_try_compose(&entity->subdev, sd_state,
+						   pad);
 	case V4L2_SEL_TGT_CROP:
-		return v4l2_subdev_get_try_crop(&entity->subdev, cfg, pad);
+		return v4l2_subdev_get_try_crop(&entity->subdev, sd_state,
+						pad);
 	default:
 		return NULL;
 	}
@@ -180,7 +182,7 @@ vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
  * function can be used as a handler for the subdev pad::init_cfg operation.
  */
 int vsp1_entity_init_cfg(struct v4l2_subdev *subdev,
-			 struct v4l2_subdev_pad_config *cfg)
+			 struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_subdev_format format;
 	unsigned int pad;
@@ -189,10 +191,10 @@ int vsp1_entity_init_cfg(struct v4l2_subdev *subdev,
 		memset(&format, 0, sizeof(format));
 
 		format.pad = pad;
-		format.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
+		format.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
 			     : V4L2_SUBDEV_FORMAT_ACTIVE;
 
-		v4l2_subdev_call(subdev, pad, set_fmt, cfg, &format);
+		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
 	}
 
 	return 0;
@@ -208,13 +210,13 @@ int vsp1_entity_init_cfg(struct v4l2_subdev *subdev,
  * a direct drop-in for the operation handler.
  */
 int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_entity *entity = to_vsp1_entity(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 
-	config = vsp1_entity_get_pad_config(entity, cfg, fmt->which);
+	config = vsp1_entity_get_pad_config(entity, sd_state, fmt->which);
 	if (!config)
 		return -EINVAL;
 
@@ -239,7 +241,7 @@ int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
  * the sink pad.
  */
 int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_mbus_code_enum *code,
 			       const unsigned int *codes, unsigned int ncodes)
 {
@@ -251,7 +253,7 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 
 		code->code = codes[code->index];
 	} else {
-		struct v4l2_subdev_pad_config *config;
+		struct v4l2_subdev_state *config;
 		struct v4l2_mbus_framefmt *format;
 
 		/*
@@ -261,7 +263,8 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
 		if (code->index)
 			return -EINVAL;
 
-		config = vsp1_entity_get_pad_config(entity, cfg, code->which);
+		config = vsp1_entity_get_pad_config(entity, sd_state,
+						    code->which);
 		if (!config)
 			return -EINVAL;
 
@@ -290,17 +293,17 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
  * source pad size identical to the sink pad.
  */
 int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_size_enum *fse,
 				unsigned int min_width, unsigned int min_height,
 				unsigned int max_width, unsigned int max_height)
 {
 	struct vsp1_entity *entity = to_vsp1_entity(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
-	config = vsp1_entity_get_pad_config(entity, cfg, fse->which);
+	config = vsp1_entity_get_pad_config(entity, sd_state, fse->which);
 	if (!config)
 		return -EINVAL;
 
@@ -353,14 +356,14 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
  * source pad.
  */
 int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt,
 			       const unsigned int *codes, unsigned int ncodes,
 			       unsigned int min_width, unsigned int min_height,
 			       unsigned int max_width, unsigned int max_height)
 {
 	struct vsp1_entity *entity = to_vsp1_entity(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *selection;
 	unsigned int i;
@@ -368,7 +371,7 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 
 	mutex_lock(&entity->lock);
 
-	config = vsp1_entity_get_pad_config(entity, cfg, fmt->which);
+	config = vsp1_entity_get_pad_config(entity, sd_state, fmt->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
@@ -672,7 +675,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	 * Allocate the pad configuration to store formats and selection
 	 * rectangles.
 	 */
-	entity->config = v4l2_subdev_alloc_pad_config(&entity->subdev);
+	entity->config = v4l2_subdev_alloc_state(&entity->subdev);
 	if (entity->config == NULL) {
 		media_entity_cleanup(&entity->subdev.entity);
 		return -ENOMEM;
@@ -687,6 +690,6 @@ void vsp1_entity_destroy(struct vsp1_entity *entity)
 		entity->ops->destroy(entity);
 	if (entity->subdev.ctrl_handler)
 		v4l2_ctrl_handler_free(entity->subdev.ctrl_handler);
-	v4l2_subdev_free_pad_config(entity->config);
+	v4l2_subdev_free_state(entity->config);
 	media_entity_cleanup(&entity->subdev.entity);
 }
diff --git a/drivers/media/platform/vsp1/vsp1_entity.h b/drivers/media/platform/vsp1/vsp1_entity.h
index a1ceb37bb837..f22724439cdc 100644
--- a/drivers/media/platform/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/vsp1/vsp1_entity.h
@@ -115,7 +115,7 @@ struct vsp1_entity {
 	unsigned int sink_pad;
 
 	struct v4l2_subdev subdev;
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 
 	struct mutex lock;	/* Protects the pad config */
 };
@@ -136,20 +136,20 @@ int vsp1_entity_link_setup(struct media_entity *entity,
 			   const struct media_pad *local,
 			   const struct media_pad *remote, u32 flags);
 
-struct v4l2_subdev_pad_config *
+struct v4l2_subdev_state *
 vsp1_entity_get_pad_config(struct vsp1_entity *entity,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   enum v4l2_subdev_format_whence which);
 struct v4l2_mbus_framefmt *
 vsp1_entity_get_pad_format(struct vsp1_entity *entity,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   unsigned int pad);
 struct v4l2_rect *
 vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      unsigned int pad, unsigned int target);
 int vsp1_entity_init_cfg(struct v4l2_subdev *subdev,
-			 struct v4l2_subdev_pad_config *cfg);
+			 struct v4l2_subdev_state *sd_state);
 
 void vsp1_entity_route_setup(struct vsp1_entity *entity,
 			     struct vsp1_pipeline *pipe,
@@ -173,20 +173,20 @@ void vsp1_entity_configure_partition(struct vsp1_entity *entity,
 struct media_pad *vsp1_entity_remote_pad(struct media_pad *pad);
 
 int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt);
 int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt,
 			       const unsigned int *codes, unsigned int ncodes,
 			       unsigned int min_width, unsigned int min_height,
 			       unsigned int max_width, unsigned int max_height);
 int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_mbus_code_enum *code,
 			       const unsigned int *codes, unsigned int ncodes);
 int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_size_enum *fse,
 				unsigned int min_w, unsigned int min_h,
 				unsigned int max_w, unsigned int max_h);
diff --git a/drivers/media/platform/vsp1/vsp1_histo.c b/drivers/media/platform/vsp1/vsp1_histo.c
index a91e142bcb94..5e5013d2cd2a 100644
--- a/drivers/media/platform/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/vsp1/vsp1_histo.c
@@ -170,7 +170,7 @@ static const struct vb2_ops histo_video_queue_qops = {
  */
 
 static int histo_enum_mbus_code(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
@@ -180,28 +180,30 @@ static int histo_enum_mbus_code(struct v4l2_subdev *subdev,
 		return 0;
 	}
 
-	return vsp1_subdev_enum_mbus_code(subdev, cfg, code, histo->formats,
+	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code,
+					  histo->formats,
 					  histo->num_formats);
 }
 
 static int histo_enum_frame_size(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->pad != HISTO_PAD_SINK)
 		return -EINVAL;
 
-	return vsp1_subdev_enum_frame_size(subdev, cfg, fse, HISTO_MIN_SIZE,
+	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+					   HISTO_MIN_SIZE,
 					   HISTO_MIN_SIZE, HISTO_MAX_SIZE,
 					   HISTO_MAX_SIZE);
 }
 
 static int histo_get_selection(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	int ret = 0;
@@ -211,7 +213,8 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&histo->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&histo->entity, cfg, sel->which);
+	config = vsp1_entity_get_pad_config(&histo->entity, sd_state,
+					    sel->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
@@ -256,15 +259,15 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_crop(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *config,
-			 struct v4l2_subdev_selection *sel)
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *selection;
 
 	/* The crop rectangle must be inside the input frame. */
-	format = vsp1_entity_get_pad_format(&histo->entity, config,
+	format = vsp1_entity_get_pad_format(&histo->entity, sd_state,
 					    HISTO_PAD_SINK);
 	sel->r.left = clamp_t(unsigned int, sel->r.left, 0, format->width - 1);
 	sel->r.top = clamp_t(unsigned int, sel->r.top, 0, format->height - 1);
@@ -274,11 +277,11 @@ static int histo_set_crop(struct v4l2_subdev *subdev,
 				format->height - sel->r.top);
 
 	/* Set the crop rectangle and reset the compose rectangle. */
-	selection = vsp1_entity_get_pad_selection(&histo->entity, config,
+	selection = vsp1_entity_get_pad_selection(&histo->entity, sd_state,
 						  sel->pad, V4L2_SEL_TGT_CROP);
 	*selection = sel->r;
 
-	selection = vsp1_entity_get_pad_selection(&histo->entity, config,
+	selection = vsp1_entity_get_pad_selection(&histo->entity, sd_state,
 						  sel->pad,
 						  V4L2_SEL_TGT_COMPOSE);
 	*selection = sel->r;
@@ -287,7 +290,7 @@ static int histo_set_crop(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_compose(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *config,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
@@ -303,7 +306,8 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
 	sel->r.left = 0;
 	sel->r.top = 0;
 
-	crop = vsp1_entity_get_pad_selection(&histo->entity, config, sel->pad,
+	crop = vsp1_entity_get_pad_selection(&histo->entity, sd_state,
+					     sel->pad,
 					     V4L2_SEL_TGT_CROP);
 
 	/*
@@ -329,7 +333,7 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
 	ratio = 1 << (crop->height * 2 / sel->r.height / 3);
 	sel->r.height = crop->height / ratio;
 
-	compose = vsp1_entity_get_pad_selection(&histo->entity, config,
+	compose = vsp1_entity_get_pad_selection(&histo->entity, sd_state,
 						sel->pad,
 						V4L2_SEL_TGT_COMPOSE);
 	*compose = sel->r;
@@ -338,11 +342,11 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
 }
 
 static int histo_set_selection(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	int ret;
 
 	if (sel->pad != HISTO_PAD_SINK)
@@ -350,7 +354,8 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&histo->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&histo->entity, cfg, sel->which);
+	config = vsp1_entity_get_pad_config(&histo->entity, sd_state,
+					    sel->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
@@ -369,7 +374,7 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
 }
 
 static int histo_get_format(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	if (fmt->pad == HISTO_PAD_SOURCE) {
@@ -381,19 +386,19 @@ static int histo_get_format(struct v4l2_subdev *subdev,
 		return 0;
 	}
 
-	return vsp1_subdev_get_pad_format(subdev, cfg, fmt);
+	return vsp1_subdev_get_pad_format(subdev, sd_state, fmt);
 }
 
 static int histo_set_format(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
 
 	if (fmt->pad != HISTO_PAD_SINK)
-		return histo_get_format(subdev, cfg, fmt);
+		return histo_get_format(subdev, sd_state, fmt);
 
-	return vsp1_subdev_set_pad_format(subdev, cfg, fmt,
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
 					  histo->formats, histo->num_formats,
 					  HISTO_MIN_SIZE, HISTO_MIN_SIZE,
 					  HISTO_MAX_SIZE, HISTO_MAX_SIZE);
diff --git a/drivers/media/platform/vsp1/vsp1_hsit.c b/drivers/media/platform/vsp1/vsp1_hsit.c
index d5ebd9d08c8a..361a870380c2 100644
--- a/drivers/media/platform/vsp1/vsp1_hsit.c
+++ b/drivers/media/platform/vsp1/vsp1_hsit.c
@@ -34,7 +34,7 @@ static inline void vsp1_hsit_write(struct vsp1_hsit *hsit,
  */
 
 static int hsit_enum_mbus_code(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct vsp1_hsit *hsit = to_hsit(subdev);
@@ -52,26 +52,28 @@ static int hsit_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int hsit_enum_frame_size(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
-	return vsp1_subdev_enum_frame_size(subdev, cfg, fse, HSIT_MIN_SIZE,
+	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+					   HSIT_MIN_SIZE,
 					   HSIT_MIN_SIZE, HSIT_MAX_SIZE,
 					   HSIT_MAX_SIZE);
 }
 
 static int hsit_set_format(struct v4l2_subdev *subdev,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_hsit *hsit = to_hsit(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
 	mutex_lock(&hsit->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&hsit->entity, cfg, fmt->which);
+	config = vsp1_entity_get_pad_config(&hsit->entity, sd_state,
+					    fmt->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
diff --git a/drivers/media/platform/vsp1/vsp1_lif.c b/drivers/media/platform/vsp1/vsp1_lif.c
index 14ed5d7bd061..6a6857ac9327 100644
--- a/drivers/media/platform/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/vsp1/vsp1_lif.c
@@ -40,27 +40,28 @@ static const unsigned int lif_codes[] = {
 };
 
 static int lif_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
-	return vsp1_subdev_enum_mbus_code(subdev, cfg, code, lif_codes,
+	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, lif_codes,
 					  ARRAY_SIZE(lif_codes));
 }
 
 static int lif_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
-	return vsp1_subdev_enum_frame_size(subdev, cfg, fse, LIF_MIN_SIZE,
+	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+					   LIF_MIN_SIZE,
 					   LIF_MIN_SIZE, LIF_MAX_SIZE,
 					   LIF_MAX_SIZE);
 }
 
 static int lif_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, cfg, fmt, lif_codes,
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, lif_codes,
 					  ARRAY_SIZE(lif_codes),
 					  LIF_MIN_SIZE, LIF_MIN_SIZE,
 					  LIF_MAX_SIZE, LIF_MAX_SIZE);
diff --git a/drivers/media/platform/vsp1/vsp1_lut.c b/drivers/media/platform/vsp1/vsp1_lut.c
index 9f88842d7048..ac6802a325f5 100644
--- a/drivers/media/platform/vsp1/vsp1_lut.c
+++ b/drivers/media/platform/vsp1/vsp1_lut.c
@@ -99,27 +99,28 @@ static const unsigned int lut_codes[] = {
 };
 
 static int lut_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
-	return vsp1_subdev_enum_mbus_code(subdev, cfg, code, lut_codes,
+	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, lut_codes,
 					  ARRAY_SIZE(lut_codes));
 }
 
 static int lut_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
-	return vsp1_subdev_enum_frame_size(subdev, cfg, fse, LUT_MIN_SIZE,
+	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+					   LUT_MIN_SIZE,
 					   LUT_MIN_SIZE, LUT_MAX_SIZE,
 					   LUT_MAX_SIZE);
 }
 
 static int lut_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, cfg, fmt, lut_codes,
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, lut_codes,
 					  ARRAY_SIZE(lut_codes),
 					  LUT_MIN_SIZE, LUT_MIN_SIZE,
 					  LUT_MAX_SIZE, LUT_MAX_SIZE);
diff --git a/drivers/media/platform/vsp1/vsp1_rwpf.c b/drivers/media/platform/vsp1/vsp1_rwpf.c
index 049bdd958e56..22a82d218152 100644
--- a/drivers/media/platform/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/vsp1/vsp1_rwpf.c
@@ -17,9 +17,9 @@
 #define RWPF_MIN_HEIGHT				1
 
 struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
-				     struct v4l2_subdev_pad_config *config)
+				     struct v4l2_subdev_state *sd_state)
 {
-	return v4l2_subdev_get_try_crop(&rwpf->entity.subdev, config,
+	return v4l2_subdev_get_try_crop(&rwpf->entity.subdev, sd_state,
 					RWPF_PAD_SINK);
 }
 
@@ -28,7 +28,7 @@ struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
  */
 
 static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
 	static const unsigned int codes[] = {
@@ -46,28 +46,30 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
-				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
 
-	return vsp1_subdev_enum_frame_size(subdev, cfg, fse, RWPF_MIN_WIDTH,
+	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+					   RWPF_MIN_WIDTH,
 					   RWPF_MIN_HEIGHT, rwpf->max_width,
 					   rwpf->max_height);
 }
 
 static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
 	mutex_lock(&rwpf->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&rwpf->entity, cfg, fmt->which);
+	config = vsp1_entity_get_pad_config(&rwpf->entity, sd_state,
+					    fmt->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
@@ -128,11 +130,11 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
@@ -145,7 +147,8 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&rwpf->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&rwpf->entity, cfg, sel->which);
+	config = vsp1_entity_get_pad_config(&rwpf->entity, sd_state,
+					    sel->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
@@ -176,11 +179,11 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	int ret = 0;
@@ -197,7 +200,8 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&rwpf->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&rwpf->entity, cfg, sel->which);
+	config = vsp1_entity_get_pad_config(&rwpf->entity, sd_state,
+					    sel->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
diff --git a/drivers/media/platform/vsp1/vsp1_rwpf.h b/drivers/media/platform/vsp1/vsp1_rwpf.h
index 2f3582590618..eac5c04c2239 100644
--- a/drivers/media/platform/vsp1/vsp1_rwpf.h
+++ b/drivers/media/platform/vsp1/vsp1_rwpf.h
@@ -84,6 +84,6 @@ int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols);
 extern const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops;
 
 struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
-				     struct v4l2_subdev_pad_config *config);
+				     struct v4l2_subdev_state *sd_state);
 
 #endif /* __VSP1_RWPF_H__ */
diff --git a/drivers/media/platform/vsp1/vsp1_sru.c b/drivers/media/platform/vsp1/vsp1_sru.c
index 2b65457ee12f..b614a2aea461 100644
--- a/drivers/media/platform/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/vsp1/vsp1_sru.c
@@ -106,7 +106,7 @@ static const struct v4l2_ctrl_config sru_intensity_control = {
  */
 
 static int sru_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	static const unsigned int codes[] = {
@@ -114,20 +114,21 @@ static int sru_enum_mbus_code(struct v4l2_subdev *subdev,
 		MEDIA_BUS_FMT_AYUV8_1X32,
 	};
 
-	return vsp1_subdev_enum_mbus_code(subdev, cfg, code, codes,
+	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
 					  ARRAY_SIZE(codes));
 }
 
 static int sru_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct vsp1_sru *sru = to_sru(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
-	config = vsp1_entity_get_pad_config(&sru->entity, cfg, fse->which);
+	config = vsp1_entity_get_pad_config(&sru->entity, sd_state,
+					    fse->which);
 	if (!config)
 		return -EINVAL;
 
@@ -164,7 +165,7 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static void sru_try_format(struct vsp1_sru *sru,
-			   struct v4l2_subdev_pad_config *config,
+			   struct v4l2_subdev_state *sd_state,
 			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
 {
 	struct v4l2_mbus_framefmt *format;
@@ -184,7 +185,7 @@ static void sru_try_format(struct vsp1_sru *sru,
 
 	case SRU_PAD_SOURCE:
 		/* The SRU can't perform format conversion. */
-		format = vsp1_entity_get_pad_format(&sru->entity, config,
+		format = vsp1_entity_get_pad_format(&sru->entity, sd_state,
 						    SRU_PAD_SINK);
 		fmt->code = format->code;
 
@@ -216,17 +217,18 @@ static void sru_try_format(struct vsp1_sru *sru,
 }
 
 static int sru_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_sru *sru = to_sru(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
 	mutex_lock(&sru->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&sru->entity, cfg, fmt->which);
+	config = vsp1_entity_get_pad_config(&sru->entity, sd_state,
+					    fmt->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
diff --git a/drivers/media/platform/vsp1/vsp1_uds.c b/drivers/media/platform/vsp1/vsp1_uds.c
index 5fc04c082d1a..1c290cda005a 100644
--- a/drivers/media/platform/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/vsp1/vsp1_uds.c
@@ -111,7 +111,7 @@ static unsigned int uds_compute_ratio(unsigned int input, unsigned int output)
  */
 
 static int uds_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	static const unsigned int codes[] = {
@@ -119,20 +119,21 @@ static int uds_enum_mbus_code(struct v4l2_subdev *subdev,
 		MEDIA_BUS_FMT_AYUV8_1X32,
 	};
 
-	return vsp1_subdev_enum_mbus_code(subdev, cfg, code, codes,
+	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
 					  ARRAY_SIZE(codes));
 }
 
 static int uds_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct vsp1_uds *uds = to_uds(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
-	config = vsp1_entity_get_pad_config(&uds->entity, cfg, fse->which);
+	config = vsp1_entity_get_pad_config(&uds->entity, sd_state,
+					    fse->which);
 	if (!config)
 		return -EINVAL;
 
@@ -164,7 +165,7 @@ static int uds_enum_frame_size(struct v4l2_subdev *subdev,
 }
 
 static void uds_try_format(struct vsp1_uds *uds,
-			   struct v4l2_subdev_pad_config *config,
+			   struct v4l2_subdev_state *sd_state,
 			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
 {
 	struct v4l2_mbus_framefmt *format;
@@ -184,7 +185,7 @@ static void uds_try_format(struct vsp1_uds *uds,
 
 	case UDS_PAD_SOURCE:
 		/* The UDS scales but can't perform format conversion. */
-		format = vsp1_entity_get_pad_format(&uds->entity, config,
+		format = vsp1_entity_get_pad_format(&uds->entity, sd_state,
 						    UDS_PAD_SINK);
 		fmt->code = format->code;
 
@@ -200,17 +201,18 @@ static void uds_try_format(struct vsp1_uds *uds,
 }
 
 static int uds_set_format(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_uds *uds = to_uds(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
 	mutex_lock(&uds->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&uds->entity, cfg, fmt->which);
+	config = vsp1_entity_get_pad_config(&uds->entity, sd_state,
+					    fmt->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
diff --git a/drivers/media/platform/vsp1/vsp1_uif.c b/drivers/media/platform/vsp1/vsp1_uif.c
index 467d1072577b..83d7f17df80e 100644
--- a/drivers/media/platform/vsp1/vsp1_uif.c
+++ b/drivers/media/platform/vsp1/vsp1_uif.c
@@ -54,38 +54,39 @@ static const unsigned int uif_codes[] = {
 };
 
 static int uif_enum_mbus_code(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
-	return vsp1_subdev_enum_mbus_code(subdev, cfg, code, uif_codes,
+	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, uif_codes,
 					  ARRAY_SIZE(uif_codes));
 }
 
 static int uif_enum_frame_size(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_frame_size_enum *fse)
 {
-	return vsp1_subdev_enum_frame_size(subdev, cfg, fse, UIF_MIN_SIZE,
+	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+					   UIF_MIN_SIZE,
 					   UIF_MIN_SIZE, UIF_MAX_SIZE,
 					   UIF_MAX_SIZE);
 }
 
 static int uif_set_format(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
-	return vsp1_subdev_set_pad_format(subdev, cfg, fmt, uif_codes,
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, uif_codes,
 					  ARRAY_SIZE(uif_codes),
 					  UIF_MIN_SIZE, UIF_MIN_SIZE,
 					  UIF_MAX_SIZE, UIF_MAX_SIZE);
 }
 
 static int uif_get_selection(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_uif *uif = to_uif(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	int ret = 0;
 
@@ -94,7 +95,8 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&uif->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&uif->entity, cfg, sel->which);
+	config = vsp1_entity_get_pad_config(&uif->entity, sd_state,
+					    sel->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
@@ -127,11 +129,11 @@ static int uif_get_selection(struct v4l2_subdev *subdev,
 }
 
 static int uif_set_selection(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct vsp1_uif *uif = to_uif(subdev);
-	struct v4l2_subdev_pad_config *config;
+	struct v4l2_subdev_state *config;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *selection;
 	int ret = 0;
@@ -142,7 +144,8 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
 
 	mutex_lock(&uif->entity.lock);
 
-	config = vsp1_entity_get_pad_config(&uif->entity, cfg, sel->which);
+	config = vsp1_entity_get_pad_config(&uif->entity, sd_state,
+					    sel->which);
 	if (!config) {
 		ret = -EINVAL;
 		goto done;
diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index fff7ddec6745..b1baf9d7b6ec 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -681,12 +681,13 @@ static int xcsi2rxss_s_stream(struct v4l2_subdev *sd, int enable)
 
 static struct v4l2_mbus_framefmt *
 __xcsi2rxss_get_pad_format(struct xcsi2rxss_state *xcsi2rxss,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   unsigned int pad, u32 which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&xcsi2rxss->subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&xcsi2rxss->subdev,
+						  sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &xcsi2rxss->format;
 	default:
@@ -697,7 +698,7 @@ __xcsi2rxss_get_pad_format(struct xcsi2rxss_state *xcsi2rxss,
 /**
  * xcsi2rxss_init_cfg - Initialise the pad format config to default
  * @sd: Pointer to V4L2 Sub device structure
- * @cfg: Pointer to sub device pad information structure
+ * @sd_state: Pointer to sub device state structure
  *
  * This function is used to initialize the pad format with the default
  * values.
@@ -705,7 +706,7 @@ __xcsi2rxss_get_pad_format(struct xcsi2rxss_state *xcsi2rxss,
  * Return: 0 on success
  */
 static int xcsi2rxss_init_cfg(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg)
+			      struct v4l2_subdev_state *sd_state)
 {
 	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
 	struct v4l2_mbus_framefmt *format;
@@ -713,7 +714,7 @@ static int xcsi2rxss_init_cfg(struct v4l2_subdev *sd,
 
 	mutex_lock(&xcsi2rxss->lock);
 	for (i = 0; i < XCSI_MEDIA_PADS; i++) {
-		format = v4l2_subdev_get_try_format(sd, cfg, i);
+		format = v4l2_subdev_get_try_format(sd, sd_state, i);
 		*format = xcsi2rxss->default_format;
 	}
 	mutex_unlock(&xcsi2rxss->lock);
@@ -724,7 +725,7 @@ static int xcsi2rxss_init_cfg(struct v4l2_subdev *sd,
 /**
  * xcsi2rxss_get_format - Get the pad format
  * @sd: Pointer to V4L2 Sub device structure
- * @cfg: Pointer to sub device pad information structure
+ * @sd_state: Pointer to sub device state structure
  * @fmt: Pointer to pad level media bus format
  *
  * This function is used to get the pad format information.
@@ -732,13 +733,14 @@ static int xcsi2rxss_init_cfg(struct v4l2_subdev *sd,
  * Return: 0 on success
  */
 static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
 	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
 
 	mutex_lock(&xcsi2rxss->lock);
-	fmt->format = *__xcsi2rxss_get_pad_format(xcsi2rxss, cfg, fmt->pad,
+	fmt->format = *__xcsi2rxss_get_pad_format(xcsi2rxss, sd_state,
+						  fmt->pad,
 						  fmt->which);
 	mutex_unlock(&xcsi2rxss->lock);
 
@@ -748,7 +750,7 @@ static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
 /**
  * xcsi2rxss_set_format - This is used to set the pad format
  * @sd: Pointer to V4L2 Sub device structure
- * @cfg: Pointer to sub device pad information structure
+ * @sd_state: Pointer to sub device state structure
  * @fmt: Pointer to pad level media bus format
  *
  * This function is used to set the pad format. Since the pad format is fixed
@@ -759,7 +761,7 @@ static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
  * Return: 0 on success
  */
 static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
 {
 	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
@@ -773,7 +775,7 @@ static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
 	 * CSI format cannot be changed at runtime.
 	 * Ensure that format to set is copied to over to CSI pad format
 	 */
-	__format = __xcsi2rxss_get_pad_format(xcsi2rxss, cfg,
+	__format = __xcsi2rxss_get_pad_format(xcsi2rxss, sd_state,
 					      fmt->pad, fmt->which);
 
 	/* only sink pad format can be updated */
@@ -811,7 +813,7 @@ static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
  * Return: -EINVAL or zero on success
  */
 static int xcsi2rxss_enum_mbus_code(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct xcsi2rxss_state *state = to_xcsi2rxssstate(sd);
diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index ed01bedb5db6..0f2d5a0edf0c 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -251,12 +251,13 @@ static int xtpg_s_stream(struct v4l2_subdev *subdev, int enable)
 
 static struct v4l2_mbus_framefmt *
 __xtpg_get_pad_format(struct xtpg_device *xtpg,
-		      struct v4l2_subdev_pad_config *cfg,
+		      struct v4l2_subdev_state *sd_state,
 		      unsigned int pad, u32 which)
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&xtpg->xvip.subdev, cfg, pad);
+		return v4l2_subdev_get_try_format(&xtpg->xvip.subdev,
+						  sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &xtpg->formats[pad];
 	default:
@@ -265,25 +266,26 @@ __xtpg_get_pad_format(struct xtpg_device *xtpg,
 }
 
 static int xtpg_get_format(struct v4l2_subdev *subdev,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct xtpg_device *xtpg = to_tpg(subdev);
 
-	fmt->format = *__xtpg_get_pad_format(xtpg, cfg, fmt->pad, fmt->which);
+	fmt->format = *__xtpg_get_pad_format(xtpg, sd_state, fmt->pad,
+					     fmt->which);
 
 	return 0;
 }
 
 static int xtpg_set_format(struct v4l2_subdev *subdev,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
 {
 	struct xtpg_device *xtpg = to_tpg(subdev);
 	struct v4l2_mbus_framefmt *__format;
 	u32 bayer_phase;
 
-	__format = __xtpg_get_pad_format(xtpg, cfg, fmt->pad, fmt->which);
+	__format = __xtpg_get_pad_format(xtpg, sd_state, fmt->pad, fmt->which);
 
 	/* In two pads mode the source pad format is always identical to the
 	 * sink pad format.
@@ -306,7 +308,8 @@ static int xtpg_set_format(struct v4l2_subdev *subdev,
 
 	/* Propagate the format to the source pad. */
 	if (xtpg->npads == 2) {
-		__format = __xtpg_get_pad_format(xtpg, cfg, 1, fmt->which);
+		__format = __xtpg_get_pad_format(xtpg, sd_state, 1,
+						 fmt->which);
 		*__format = fmt->format;
 	}
 
@@ -318,12 +321,12 @@ static int xtpg_set_format(struct v4l2_subdev *subdev,
  */
 
 static int xtpg_enum_frame_size(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct v4l2_mbus_framefmt *format;
 
-	format = v4l2_subdev_get_try_format(subdev, cfg, fse->pad);
+	format = v4l2_subdev_get_try_format(subdev, sd_state, fse->pad);
 
 	if (fse->index || fse->code != format->code)
 		return -EINVAL;
@@ -351,11 +354,11 @@ static int xtpg_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 	struct xtpg_device *xtpg = to_tpg(subdev);
 	struct v4l2_mbus_framefmt *format;
 
-	format = v4l2_subdev_get_try_format(subdev, fh->pad, 0);
+	format = v4l2_subdev_get_try_format(subdev, fh->state, 0);
 	*format = xtpg->default_format;
 
 	if (xtpg->npads == 2) {
-		format = v4l2_subdev_get_try_format(subdev, fh->pad, 1);
+		format = v4l2_subdev_get_try_format(subdev, fh->state, 1);
 		*format = xtpg->default_format;
 	}
 
diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index 6ad61b08a31a..07d16a007d5f 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -234,7 +234,7 @@ EXPORT_SYMBOL_GPL(xvip_cleanup_resources);
 /**
  * xvip_enum_mbus_code - Enumerate the media format code
  * @subdev: V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code: returning media bus code
  *
  * Enumerate the media bus code of the subdevice. Return the corresponding
@@ -246,7 +246,7 @@ EXPORT_SYMBOL_GPL(xvip_cleanup_resources);
  * is not valid.
  */
 int xvip_enum_mbus_code(struct v4l2_subdev *subdev,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct v4l2_mbus_framefmt *format;
@@ -260,7 +260,7 @@ int xvip_enum_mbus_code(struct v4l2_subdev *subdev,
 	if (code->index)
 		return -EINVAL;
 
-	format = v4l2_subdev_get_try_format(subdev, cfg, code->pad);
+	format = v4l2_subdev_get_try_format(subdev, sd_state, code->pad);
 
 	code->code = format->code;
 
@@ -271,7 +271,7 @@ EXPORT_SYMBOL_GPL(xvip_enum_mbus_code);
 /**
  * xvip_enum_frame_size - Enumerate the media bus frame size
  * @subdev: V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fse: returning media bus frame size
  *
  * This function is a drop-in implementation of the subdev enum_frame_size pad
@@ -284,7 +284,7 @@ EXPORT_SYMBOL_GPL(xvip_enum_mbus_code);
  * if the index or the code is not valid.
  */
 int xvip_enum_frame_size(struct v4l2_subdev *subdev,
-			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_state *sd_state,
 			 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct v4l2_mbus_framefmt *format;
@@ -295,7 +295,7 @@ int xvip_enum_frame_size(struct v4l2_subdev *subdev,
 	if (fse->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	format = v4l2_subdev_get_try_format(subdev, cfg, fse->pad);
+	format = v4l2_subdev_get_try_format(subdev, sd_state, fse->pad);
 
 	if (fse->index || fse->code != format->code)
 		return -EINVAL;
diff --git a/drivers/media/platform/xilinx/xilinx-vip.h b/drivers/media/platform/xilinx/xilinx-vip.h
index a528a32ea1dc..d0b0e0600952 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.h
+++ b/drivers/media/platform/xilinx/xilinx-vip.h
@@ -125,10 +125,10 @@ const struct xvip_video_format *xvip_of_get_format(struct device_node *node);
 void xvip_set_format_size(struct v4l2_mbus_framefmt *format,
 			  const struct v4l2_subdev_format *fmt);
 int xvip_enum_mbus_code(struct v4l2_subdev *subdev,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_mbus_code_enum *code);
 int xvip_enum_frame_size(struct v4l2_subdev *subdev,
-			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_state *sd_state,
 			 struct v4l2_subdev_frame_size_enum *fse);
 
 static inline u32 xvip_read(struct xvip_device *xvip, u32 addr)
-- 
2.25.1

