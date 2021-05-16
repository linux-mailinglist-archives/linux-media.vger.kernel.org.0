Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DD0381C10
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbhEPCTg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhEPCTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:19:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A66FC06138A
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 18:55:15 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25D9810CA;
        Sun, 16 May 2021 03:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129503;
        bh=qsUkLz6XFzXqyF8zzqb8lHi/ffZ3YQiJyQdTUU6qBHo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fZhZoNsXQPDbWaook7yfaW+VLgr9gM0u+BHNimN3IpzZMGSuii3jum6b07do9Dxaj
         mNuHIsvXLt55400iZq7n9z4L5bsDuBEi2mblq39ueU1Z2PPQE+65QxgNsEmnHqRqgT
         owFNNFeH5dDcLoLXkP6NkiiGDJcH1AvKgpX2UnZk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 08/25] media: imx: imx7_mipi_csis: Set the CLKSETTLE register field
Date:   Sun, 16 May 2021 04:44:24 +0300
Message-Id: <20210516014441.5508-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set the CLKSETTLE field explicitly, with a value hardcoded to 0. This
brings no functional change, but prepares for calculation of the
CLKSETTLE value.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index eea865ba486d..224d3ac9c9bf 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -310,6 +310,7 @@ struct csi_state {
 
 	u32 clk_frequency;
 	u32 hs_settle;
+	u32 clk_settle;
 
 	struct reset_control *mrst;
 
@@ -540,11 +541,15 @@ static int mipi_csis_calculate_params(struct csi_state *state)
 
 	/*
 	 * The HSSETTLE counter value is document in a table, but can also
-	 * easily be calculated.
+	 * easily be calculated. Hardcode the CLKSETTLE value to 0 for now
+	 * (which is documented as corresponding to CSI-2 v0.87 to v1.00) until
+	 * we figure out how to compute it correctly.
 	 */
 	state->hs_settle = (lane_rate - 5000000) / 45000000;
-	dev_dbg(state->dev, "lane rate %u, Ths_settle %u\n",
-		lane_rate, state->hs_settle);
+	state->clk_settle = 0;
+
+	dev_dbg(state->dev, "lane rate %u, Tclk_settle %u, Ths_settle %u\n",
+		lane_rate, state->clk_settle, state->hs_settle);
 
 	return 0;
 }
@@ -563,7 +568,8 @@ static void mipi_csis_set_params(struct csi_state *state)
 	__mipi_csis_set_format(state);
 
 	mipi_csis_write(state, MIPI_CSIS_DPHY_CMN_CTRL,
-			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(state->hs_settle));
+			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(state->hs_settle) |
+			MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(state->clk_settle));
 
 	val = (0 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET)
 	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET)
-- 
Regards,

Laurent Pinchart

