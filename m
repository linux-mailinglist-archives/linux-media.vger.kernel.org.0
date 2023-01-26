Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6136167D7CB
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 22:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbjAZVe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 16:34:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbjAZVe5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 16:34:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99975587
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 13:34:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AB102B3;
        Thu, 26 Jan 2023 22:34:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674768895;
        bh=fq/tqmiEHJYmdREOvGhBYEzNeJd4x622TasjCNhIc2Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eO5E8L08+et1u8HyQtxEhdTVZAAWJo33pIEb2OkY2WhWT6xlBIPdRwilS/MFPlUzG
         5ZSdMM7aj8tmn5Ity3Qfd+OcbDoFiHpQnyH80RToihlCSzxlsPtnzdTkXyS6FMFJct
         5y/IWhDOvcWieWTkAVS9nva7E/f22vYgb6ZfD2UM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 3/5] media: imx-mipi-csis: Pass format explicitly to internal functions
Date:   Thu, 26 Jan 2023 23:34:35 +0200
Message-Id: <20230126213437.20796-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
References: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for usage of the subdev active state that will replace the
csis_fmt and format_mbus fields stored in the mipi_csis_device
structure, pass the format explicitly to the functions called when
starting streaming to avoid accessing those two fields. Not functional
change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 34 +++++++++++++---------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 4e1363ff5646..38ed88646632 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -560,9 +560,10 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
 }
 
 /* Called with the csis.lock mutex held */
-static void __mipi_csis_set_format(struct mipi_csis_device *csis)
+static void __mipi_csis_set_format(struct mipi_csis_device *csis,
+				   const struct v4l2_mbus_framefmt *format,
+				   const struct csis_pix_format *csis_fmt)
 {
-	struct v4l2_mbus_framefmt *mf = &csis->format_mbus[CSIS_PAD_SINK];
 	u32 val;
 
 	/* Color format */
@@ -583,25 +584,26 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis)
 	 *
 	 * TODO: Verify which other formats require DUAL (or QUAD) modes.
 	 */
-	if (csis->csis_fmt->data_type == MIPI_CSI2_DATA_TYPE_YUV422_8)
+	if (csis_fmt->data_type == MIPI_CSI2_DATA_TYPE_YUV422_8)
 		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
 
-	val |= MIPI_CSIS_ISPCFG_FMT(csis->csis_fmt->data_type);
+	val |= MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
 	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(0), val);
 
 	/* Pixel resolution */
-	val = mf->width | (mf->height << 16);
+	val = format->width | (format->height << 16);
 	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0), val);
 }
 
-static int mipi_csis_calculate_params(struct mipi_csis_device *csis)
+static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
+				      const struct csis_pix_format *csis_fmt)
 {
 	s64 link_freq;
 	u32 lane_rate;
 
 	/* Calculate the line rate from the pixel rate. */
 	link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
-				       csis->csis_fmt->width,
+				       csis_fmt->width,
 				       csis->bus.num_data_lanes * 2);
 	if (link_freq < 0) {
 		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
@@ -643,7 +645,9 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis)
 	return 0;
 }
 
-static void mipi_csis_set_params(struct mipi_csis_device *csis)
+static void mipi_csis_set_params(struct mipi_csis_device *csis,
+				 const struct v4l2_mbus_framefmt *format,
+				 const struct csis_pix_format *csis_fmt)
 {
 	int lanes = csis->bus.num_data_lanes;
 	u32 val;
@@ -655,7 +659,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis)
 		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
 
-	__mipi_csis_set_format(csis);
+	__mipi_csis_set_format(csis, format, csis_fmt);
 
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL,
 			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(csis->hs_settle) |
@@ -728,10 +732,12 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
 	return ret;
 }
 
-static void mipi_csis_start_stream(struct mipi_csis_device *csis)
+static void mipi_csis_start_stream(struct mipi_csis_device *csis,
+				   const struct v4l2_mbus_framefmt *format,
+				   const struct csis_pix_format *csis_fmt)
 {
 	mipi_csis_sw_reset(csis);
-	mipi_csis_set_params(csis);
+	mipi_csis_set_params(csis, format, csis_fmt);
 	mipi_csis_system_enable(csis, true);
 	mipi_csis_enable_interrupts(csis, true);
 }
@@ -935,6 +941,8 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
 static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
+	const struct v4l2_mbus_framefmt *format = &csis->format_mbus[CSIS_PAD_SINK];
+	const struct csis_pix_format *csis_fmt = csis->csis_fmt;
 	int ret;
 
 	if (!enable) {
@@ -953,7 +961,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 		return 0;
 	}
 
-	ret = mipi_csis_calculate_params(csis);
+	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		return ret;
 
@@ -965,7 +973,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&csis->lock);
 
-	mipi_csis_start_stream(csis);
+	mipi_csis_start_stream(csis, format, csis_fmt);
 	ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
 	if (ret < 0)
 		goto error;
-- 
Regards,

Laurent Pinchart

