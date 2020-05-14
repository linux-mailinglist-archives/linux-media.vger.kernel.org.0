Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D98E1D2CF9
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 12:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgENKgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 06:36:11 -0400
Received: from ni.piap.pl ([195.187.100.5]:46536 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgENKgL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 06:36:11 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id BDC1644334B;
        Thu, 14 May 2020 12:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl BDC1644334B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1589452568; bh=P6nSXf2tbniKu7It57rJcA9N0dxpYHC7AWpD48u7uwI=;
        h=From:To:Cc:Subject:Date:From;
        b=oDUbU3JAO9SnHaIuDGNFp/eOo8PyKu0/fUwrUhpq1u3iPLMI/S2ggzMZdCFTivYW5
         teg3T3RKaJXhOfbJbSMYVHY+hObbdAtsIXCfIhPRryndCRBChWE5ij+UsSCp9+MvdT
         ZeKotydhAtbDHgwY89+jD241GSmq3+SNxwk0oqKk=
From:   khalasa@piap.pl (Krzysztof =?utf-8?Q?Ha=C5=82asa?=)
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] MEDIA: i.MX6: Support 16-bit BT.1120 video input
Date:   Thu, 14 May 2020 12:36:07 +0200
Message-ID: <m3tv0ivm5k.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security 8.0 for Linux Mail Server, version 8.0.1.721, not scanned, whitelist
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for BT.1120 mode (16-bit version of BT.656)
on i.MX6.

Basically, BT.1120 sends Y data over one set of 8 lines, and at the same
time sends multiplexed U/V data over another set of 8 lines. Everything
uses the same single clock input. DE signal may optionally be used,
H and V syncs are not used. The start and stop codes are the same as in
BT.656 mode, and are transmitted in both Y and U/V channels.

It appears the proper format designation for this mode is
MEDIA_BUS_FMT_YUYV8_1X16. It could be extended to support 10-bit data as
well (YUYV10_1X20), but I don't have necessary hardware to easily test
it.

Note that both these 8-bit (tested) and 10-bit modes, according to the
docs, can be used directly, without the so called "passthrough".
Also note the hardware bus width should not be used when determining the
exact transfer mode - data format should be used for this (we can have
a "narrow" device connected to a "wide" bus).

This patch assumes BT.1120 uses SDR signaling. It will need to be
modified if/when there is hw using DDR.

Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>

diff --git a/drivers/gpu/ipu-v3/ipu-csi.c b/drivers/gpu/ipu-v3/ipu-csi.c
index 658c173bebdf..e352757f3f0f 100644
--- a/drivers/gpu/ipu-v3/ipu-csi.c
+++ b/drivers/gpu/ipu-v3/ipu-csi.c
@@ -250,22 +250,18 @@ static int mbus_code_to_bus_cfg(struct ipu_csi_bus_co=
nfig *cfg, u32 mbus_code,
 		cfg->mipi_dt =3D MIPI_DT_RGB888;
 		cfg->data_width =3D IPU_CSI_DATA_WIDTH_8;
 		break;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 		cfg->data_fmt =3D CSI_SENS_CONF_DATA_FMT_YUV422_UYVY;
 		cfg->mipi_dt =3D MIPI_DT_YUV422;
 		cfg->data_width =3D IPU_CSI_DATA_WIDTH_8;
 		break;
+	case MEDIA_BUS_FMT_YUYV8_1X16:
 	case MEDIA_BUS_FMT_YUYV8_2X8:
 		cfg->data_fmt =3D CSI_SENS_CONF_DATA_FMT_YUV422_YUYV;
 		cfg->mipi_dt =3D MIPI_DT_YUV422;
 		cfg->data_width =3D IPU_CSI_DATA_WIDTH_8;
 		break;
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-	case MEDIA_BUS_FMT_YUYV8_1X16:
-		cfg->data_fmt =3D CSI_SENS_CONF_DATA_FMT_BAYER;
-		cfg->mipi_dt =3D MIPI_DT_YUV422;
-		cfg->data_width =3D IPU_CSI_DATA_WIDTH_16;
-		break;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
@@ -352,7 +348,7 @@ static int fill_csi_bus_cfg(struct ipu_csi_bus_config *=
csicfg,
 			    const struct v4l2_mbus_config *mbus_cfg,
 			    const struct v4l2_mbus_framefmt *mbus_fmt)
 {
-	int ret;
+	int ret, is_bt1120;
=20
 	memset(csicfg, 0, sizeof(*csicfg));
=20
@@ -373,11 +369,18 @@ static int fill_csi_bus_cfg(struct ipu_csi_bus_config=
 *csicfg,
 		break;
 	case V4L2_MBUS_BT656:
 		csicfg->ext_vsync =3D 0;
+		/* UYVY10_1X20 etc. could be supported as well */
+		is_bt1120 =3D mbus_fmt->code =3D=3D MEDIA_BUS_FMT_UYVY8_1X16 ||
+			mbus_fmt->code =3D=3D MEDIA_BUS_FMT_YUYV8_1X16;
 		if (V4L2_FIELD_HAS_BOTH(mbus_fmt->field) ||
 		    mbus_fmt->field =3D=3D V4L2_FIELD_ALTERNATE)
-			csicfg->clk_mode =3D IPU_CSI_CLK_MODE_CCIR656_INTERLACED;
+			csicfg->clk_mode =3D is_bt1120 ?
+				IPU_CSI_CLK_MODE_CCIR1120_INTERLACED_SDR :
+				IPU_CSI_CLK_MODE_CCIR656_INTERLACED;
 		else
-			csicfg->clk_mode =3D IPU_CSI_CLK_MODE_CCIR656_PROGRESSIVE;
+			csicfg->clk_mode =3D is_bt1120 ?
+				IPU_CSI_CLK_MODE_CCIR1120_PROGRESSIVE_SDR :
+				IPU_CSI_CLK_MODE_CCIR656_PROGRESSIVE;
 		break;
 	case V4L2_MBUS_CSI2_DPHY:
 		/*
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/me=
dia/imx/imx-media-csi.c
index d9e5388ffeb5..3d1d184a0ba7 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -123,27 +123,21 @@ static inline bool is_parallel_bus(struct v4l2_fwnode=
_endpoint *ep)
 	return ep->bus_type !=3D V4L2_MBUS_CSI2_DPHY;
 }
=20
-static inline bool is_parallel_16bit_bus(struct v4l2_fwnode_endpoint *ep)
-{
-	return is_parallel_bus(ep) && ep->bus.parallel.bus_width >=3D 16;
-}
-
 /*
  * Check for conditions that require the IPU to handle the
  * data internally as generic data, aka passthrough mode:
  * - raw bayer media bus formats, or
- * - the CSI is receiving from a 16-bit parallel bus, or
- * - the CSI is receiving from an 8-bit parallel bus and the incoming
- *   media bus format is other than UYVY8_2X8/YUYV8_2X8.
+ * - other unsupported modes such as JPEG, Y8 etc.
  */
 static inline bool requires_passthrough(struct v4l2_fwnode_endpoint *ep,
 					struct v4l2_mbus_framefmt *infmt,
 					const struct imx_media_pixfmt *incc)
 {
-	return incc->bayer || is_parallel_16bit_bus(ep) ||
-		(is_parallel_bus(ep) &&
+	return incc->bayer || (is_parallel_bus(ep) &&
 		 infmt->code !=3D MEDIA_BUS_FMT_UYVY8_2X8 &&
-		 infmt->code !=3D MEDIA_BUS_FMT_YUYV8_2X8);
+		 infmt->code !=3D MEDIA_BUS_FMT_UYVY8_1X16 &&
+		 infmt->code !=3D MEDIA_BUS_FMT_YUYV8_2X8 &&
+		 infmt->code !=3D MEDIA_BUS_FMT_YUYV8_1X16);
 }
=20
 /*

--=20
Krzysztof Halasa

=C5=81UKASIEWICZ Research Network
Industrial Research Institute for Automation and Measurements PIAP
Al. Jerozolimskie 202, 02-486 Warsaw, Poland
