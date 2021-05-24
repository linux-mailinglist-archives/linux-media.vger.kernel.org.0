Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B9D38E4E4
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbhEXLKy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbhEXLKv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:10:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F53C061574
        for <linux-media@vger.kernel.org>; Mon, 24 May 2021 04:09:23 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09B0C140C;
        Mon, 24 May 2021 13:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854559;
        bh=HUkXXKC+Hipjl0iUiJp7K4WWS3RgMQExQPljoB6tDVA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fHyA3HRs3uKNwpUSdC/idtuxo3Z7kUHjxl6RwZNknaj5qYA3313WH7Km68uTeDlLF
         Xd01tquWeRRGmF4GMxfNxOcYz1c80c+dCvcS2YEe1jCK1fZ7XieSxSHwm9Z6E3dGvO
         9f6pzj4WQeYJeJh8p37EAwEtHAkcc9rQAXgMa9uY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 06/38] media: ti-vpe: cal: use v4l2_get_link_freq
Date:   Mon, 24 May 2021 14:08:37 +0300
Message-Id: <20210524110909.672432-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CAL driver uses V4L2_CID_PIXEL_RATE to get the required pixel rate, and
then changes that value to link rate before configuring the registers.

Rewrite the code to use v4l2_get_link_freq(), which simplifies the code
as we get the link rate directly, and it also adds support for
V4L2_CID_LINK_FREQ.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 52 +++++++-------------
 1 file changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 92d39ef45625..3bc63a5e9317 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -45,22 +45,23 @@ static inline void camerarx_write(struct cal_camerarx *phy, u32 offset, u32 val)
  * ------------------------------------------------------------------
  */
 
-static s64 cal_camerarx_get_external_rate(struct cal_camerarx *phy)
+static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
 {
-	struct v4l2_ctrl *ctrl;
-	s64 rate;
+	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
+	u32 num_lanes = mipi_csi2->num_data_lanes;
+	u32 bpp = phy->fmtinfo->bpp;
+	s64 freq;
 
-	ctrl = v4l2_ctrl_find(phy->source->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		phy_err(phy, "no pixel rate control in subdev: %s\n",
+	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
+	if (freq < 0) {
+		phy_err(phy, "failed to get link freq for subdev '%s'\n",
 			phy->source->name);
-		return -EPIPE;
+		return freq;
 	}
 
-	rate = v4l2_ctrl_g_ctrl_int64(ctrl);
-	phy_dbg(3, phy, "Source Pixel Rate: %llu\n", rate);
+	phy_dbg(3, phy, "Source Link Freq: %llu\n", freq);
 
-	return rate;
+	return freq;
 }
 
 static void cal_camerarx_lane_config(struct cal_camerarx *phy)
@@ -116,34 +117,19 @@ void cal_camerarx_disable(struct cal_camerarx *phy)
 #define TCLK_MISS	1
 #define TCLK_SETTLE	14
 
-static void cal_camerarx_config(struct cal_camerarx *phy, s64 external_rate)
+static void cal_camerarx_config(struct cal_camerarx *phy, s64 link_freq)
 {
 	unsigned int reg0, reg1;
 	unsigned int ths_term, ths_settle;
-	unsigned int csi2_ddrclk_khz;
-	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
-			&phy->endpoint.bus.mipi_csi2;
-	u32 num_lanes = mipi_csi2->num_data_lanes;
 
 	/* DPHY timing configuration */
 
-	/*
-	 * CSI-2 is DDR and we only count used lanes.
-	 *
-	 * csi2_ddrclk_khz = external_rate / 1000
-	 *		   / (2 * num_lanes) * phy->fmtinfo->bpp;
-	 */
-	csi2_ddrclk_khz = div_s64(external_rate * phy->fmtinfo->bpp,
-				  2 * num_lanes * 1000);
-
-	phy_dbg(1, phy, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
-
 	/* THS_TERM: Programmed value = floor(20 ns/DDRClk period) */
-	ths_term = 20 * csi2_ddrclk_khz / 1000000;
+	ths_term = div_s64(20 * link_freq, 1000 * 1000 * 1000);
 	phy_dbg(1, phy, "ths_term: %d (0x%02x)\n", ths_term, ths_term);
 
 	/* THS_SETTLE: Programmed value = floor(105 ns/DDRClk period) + 4 */
-	ths_settle = (105 * csi2_ddrclk_khz / 1000000) + 4;
+	ths_settle = div_s64(105 * link_freq, 1000 * 1000 * 1000) + 4;
 	phy_dbg(1, phy, "ths_settle: %d (0x%02x)\n", ths_settle, ths_settle);
 
 	reg0 = camerarx_read(phy, CAL_CSI2_PHY_REG0);
@@ -270,14 +256,14 @@ static void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
 
 static int cal_camerarx_start(struct cal_camerarx *phy)
 {
-	s64 external_rate;
+	s64 link_freq;
 	u32 sscounter;
 	u32 val;
 	int ret;
 
-	external_rate = cal_camerarx_get_external_rate(phy);
-	if (external_rate < 0)
-		return external_rate;
+	link_freq = cal_camerarx_get_ext_link_freq(phy);
+	if (link_freq < 0)
+		return link_freq;
 
 	ret = v4l2_subdev_call(phy->source, core, s_power, 1);
 	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
@@ -325,7 +311,7 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	camerarx_read(phy, CAL_CSI2_PHY_REG0);
 
 	/* Program the PHY timing parameters. */
-	cal_camerarx_config(phy, external_rate);
+	cal_camerarx_config(phy, link_freq);
 
 	/*
 	 *    b. Assert the FORCERXMODE signal.
-- 
2.25.1

