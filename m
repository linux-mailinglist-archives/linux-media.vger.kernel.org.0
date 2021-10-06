Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA403423D1C
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 13:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238326AbhJFLqy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Oct 2021 07:46:54 -0400
Received: from ni.piap.pl ([195.187.100.5]:47468 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238124AbhJFLqx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 07:46:53 -0400
From:   Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] i.MX6: Support 16-bit BT.1120 video input
Date:   Wed, 06 Oct 2021 08:13:48 +0200
Message-ID: <m34k9uml6s.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Confirmed to work with ADV7610 HDMI receiver.

Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>

diff --git a/drivers/gpu/ipu-v3/ipu-csi.c b/drivers/gpu/ipu-v3/ipu-csi.c
index 658c173bebdf..2893b68f1f7a 100644
--- a/drivers/gpu/ipu-v3/ipu-csi.c
+++ b/drivers/gpu/ipu-v3/ipu-csi.c
@@ -261,10 +261,24 @@ static int mbus_code_to_bus_cfg(struct ipu_csi_bus_config *cfg, u32 mbus_code,
 		cfg->data_width = IPU_CSI_DATA_WIDTH_8;
 		break;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+		if (mbus_type == V4L2_MBUS_BT656) {
+			cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_YUV422_UYVY;
+			cfg->data_width = IPU_CSI_DATA_WIDTH_8;
+		} else {
+			cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_BAYER;
+			cfg->data_width = IPU_CSI_DATA_WIDTH_16;
+		}
+		cfg->mipi_dt = MIPI_DT_YUV422;
+		break;
 	case MEDIA_BUS_FMT_YUYV8_1X16:
-		cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_BAYER;
+		if (mbus_type == V4L2_MBUS_BT656) {
+			cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_YUV422_YUYV;
+			cfg->data_width = IPU_CSI_DATA_WIDTH_8;
+		} else {
+			cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_BAYER;
+			cfg->data_width = IPU_CSI_DATA_WIDTH_16;
+		}
 		cfg->mipi_dt = MIPI_DT_YUV422;
-		cfg->data_width = IPU_CSI_DATA_WIDTH_16;
 		break;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
@@ -352,7 +366,7 @@ static int fill_csi_bus_cfg(struct ipu_csi_bus_config *csicfg,
 			    const struct v4l2_mbus_config *mbus_cfg,
 			    const struct v4l2_mbus_framefmt *mbus_fmt)
 {
-	int ret;
+	int ret, is_bt1120;
 
 	memset(csicfg, 0, sizeof(*csicfg));
 
@@ -373,11 +387,18 @@ static int fill_csi_bus_cfg(struct ipu_csi_bus_config *csicfg,
 		break;
 	case V4L2_MBUS_BT656:
 		csicfg->ext_vsync = 0;
+		/* UYVY10_1X20 etc. should be supported as well */
+		is_bt1120 = mbus_fmt->code == MEDIA_BUS_FMT_UYVY8_1X16 ||
+			    mbus_fmt->code == MEDIA_BUS_FMT_YUYV8_1X16;
 		if (V4L2_FIELD_HAS_BOTH(mbus_fmt->field) ||
 		    mbus_fmt->field == V4L2_FIELD_ALTERNATE)
-			csicfg->clk_mode = IPU_CSI_CLK_MODE_CCIR656_INTERLACED;
+			csicfg->clk_mode = is_bt1120 ?
+				IPU_CSI_CLK_MODE_CCIR1120_INTERLACED_SDR :
+				IPU_CSI_CLK_MODE_CCIR656_INTERLACED;
 		else
-			csicfg->clk_mode = IPU_CSI_CLK_MODE_CCIR656_PROGRESSIVE;
+			csicfg->clk_mode = is_bt1120 ?
+				IPU_CSI_CLK_MODE_CCIR1120_PROGRESSIVE_SDR :
+				IPU_CSI_CLK_MODE_CCIR656_PROGRESSIVE;
 		break;
 	case V4L2_MBUS_CSI2_DPHY:
 		/*
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 45f9d797b9da..ba93512f8c71 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -139,6 +139,8 @@ static inline bool is_parallel_16bit_bus(struct v4l2_fwnode_endpoint *ep)
  * Check for conditions that require the IPU to handle the
  * data internally as generic data, aka passthrough mode:
  * - raw bayer media bus formats, or
+ * - BT.656 and BT.1120 (8/10-bit YUV422) data can always be processed
+ *   on-the-fly
  * - the CSI is receiving from a 16-bit parallel bus, or
  * - the CSI is receiving from an 8-bit parallel bus and the incoming
  *   media bus format is other than UYVY8_2X8/YUYV8_2X8.
@@ -147,6 +149,9 @@ static inline bool requires_passthrough(struct v4l2_fwnode_endpoint *ep,
 					struct v4l2_mbus_framefmt *infmt,
 					const struct imx_media_pixfmt *incc)
 {
+	if (ep->bus_type == V4L2_MBUS_BT656) // including BT.1120
+		return 0;
+
 	return incc->bayer || is_parallel_16bit_bus(ep) ||
 		(is_parallel_bus(ep) &&
 		 infmt->code != MEDIA_BUS_FMT_UYVY8_2X8 &&

-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
