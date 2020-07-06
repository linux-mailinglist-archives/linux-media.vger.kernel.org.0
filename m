Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 544FF215EBF
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729998AbgGFSiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729790AbgGFSiq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:46 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F015D2121;
        Mon,  6 Jul 2020 20:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060698;
        bh=nvjSOvMZp/G9QOqaYz+bo+xQ3YnSKb2qIZ8lxQ1pbNM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=shCwBwHrAuKDJy7vLNUlAZ+1Au4vkLoezvV1ZCioHBLVu6ylMUnmYf3gPFd9Dso2f
         umxGkuZoydgvqOEZk7UWNF9Zz+ZGrhYZaazTx0OUrhXriTOG6rwfrN8t2Ah3jpUzci
         Cx+xTXAJ16+rz/oL7RekZtUSfX+prjKYFp6xwItg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 079/108] media: ti-vpe: cal: Don't store external rate in cal_camerarx
Date:   Mon,  6 Jul 2020 21:36:40 +0300
Message-Id: <20200706183709.12238-80-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The external pixel rate is retrieved when starting the camerarx and only
used then. There's no need to store it in the cal_camerarx structure, it
can be returned by cal_camerarx_get_external_info() and explicitly
passed to cal_camerarx_config().

While at it, rename cal_camerarx_get_external_info() to
cal_camerarx_get_external_rate() to better reflect the function's
purpose.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Fix rate calculation on 32-bit platforms
---
 drivers/media/platform/ti-vpe/cal.c | 35 +++++++++++++++++------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 50fe6c19c417..8b1815bbf1a7 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -272,7 +272,6 @@ struct cal_camerarx {
 	struct v4l2_fwnode_endpoint	endpoint;
 	struct device_node	*sensor_node;
 	struct v4l2_subdev	*sensor;
-	unsigned int		external_rate;
 };
 
 struct cal_dev {
@@ -481,9 +480,10 @@ static void cal_quickdump_regs(struct cal_dev *cal)
  * ------------------------------------------------------------------
  */
 
-static int cal_camerarx_get_external_info(struct cal_camerarx *phy)
+static s64 cal_camerarx_get_external_rate(struct cal_camerarx *phy)
 {
 	struct v4l2_ctrl *ctrl;
+	s64 rate;
 
 	if (!phy->sensor)
 		return -ENODEV;
@@ -495,10 +495,10 @@ static int cal_camerarx_get_external_info(struct cal_camerarx *phy)
 		return -EPIPE;
 	}
 
-	phy->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
-	phy_dbg(3, phy, "sensor Pixel Rate: %u\n", phy->external_rate);
+	rate = v4l2_ctrl_g_ctrl_int64(ctrl);
+	phy_dbg(3, phy, "sensor Pixel Rate: %llu\n", rate);
 
-	return 0;
+	return rate;
 }
 
 static void cal_camerarx_lane_config(struct cal_camerarx *phy)
@@ -554,7 +554,7 @@ static void cal_camerarx_disable(struct cal_camerarx *phy)
 #define TCLK_MISS	1
 #define TCLK_SETTLE	14
 
-static void cal_camerarx_config(struct cal_camerarx *phy,
+static void cal_camerarx_config(struct cal_camerarx *phy, s64 external_rate,
 				const struct cal_fmt *fmt)
 {
 	unsigned int reg0, reg1;
@@ -565,9 +565,16 @@ static void cal_camerarx_config(struct cal_camerarx *phy,
 	u32 num_lanes = mipi_csi2->num_data_lanes;
 
 	/* DPHY timing configuration */
-	/* CSI-2 is DDR and we only count used lanes. */
-	csi2_ddrclk_khz = phy->external_rate / 1000
-		/ (2 * num_lanes) * fmt->bpp;
+
+	/*
+	 * CSI-2 is DDR and we only count used lanes.
+	 *
+	 * csi2_ddrclk_khz = external_rate / 1000
+	 *		   / (2 * num_lanes) * fmt->bpp;
+	 */
+	csi2_ddrclk_khz = div_s64(external_rate * fmt->bpp,
+				  2 * num_lanes * 1000);
+
 	phy_dbg(1, phy, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
 
 	/* THS_TERM: Programmed value = floor(20 ns/DDRClk period) */
@@ -667,13 +674,14 @@ static void cal_camerarx_wait_stop_state(struct cal_camerarx *phy)
 static int cal_camerarx_start(struct cal_camerarx *phy,
 			      const struct cal_fmt *fmt)
 {
+	s64 external_rate;
 	u32 sscounter;
 	u32 val;
 	int ret;
 
-	ret = cal_camerarx_get_external_info(phy);
-	if (ret < 0)
-		return ret;
+	external_rate = cal_camerarx_get_external_rate(phy);
+	if (external_rate < 0)
+		return external_rate;
 
 	ret = v4l2_subdev_call(phy->sensor, core, s_power, 1);
 	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
@@ -719,7 +727,7 @@ static int cal_camerarx_start(struct cal_camerarx *phy,
 	reg_read(phy, CAL_CSI2_PHY_REG0);
 
 	/* Program the PHY timing parameters. */
-	cal_camerarx_config(phy, fmt);
+	cal_camerarx_config(phy, external_rate, fmt);
 
 	/*
 	 *    b. Assert the FORCERXMODE signal.
@@ -1039,7 +1047,6 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 
 	phy->cal = cal;
 	phy->instance = instance;
-	phy->external_rate = 192000000;
 
 	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						(instance == 0) ?
-- 
Regards,

Laurent Pinchart

