Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5BA42EAEDF
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbhAEPjm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:39:42 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728694AbhAEPjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:39:41 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8FAA3D7;
        Tue,  5 Jan 2021 16:30:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860621;
        bh=lprdwajOzEHnCQ60Yz3Qq6HBnwqWgU44/+uHWYeZS5c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SAXiNiD+ZTGVzyzRjDbB1I6M6xAEGlxLvPGkuEjDE6HYlH/tZR+qhL+jmbCT2Kzxm
         9whmw8fKU1hRRD8ODbi/jzictODkQOOkEuP9fI233aoPucP9ZLYqTIIiXz0OLr0Q17
         JoAzGBn+pFxZRgMlYIfEOCjnzukG38z6R5KjiZtQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 66/75] media: imx: imx7_mipi_csis: Inline mipi_csis_set_hsync_settle()
Date:   Tue,  5 Jan 2021 17:28:43 +0200
Message-Id: <20210105152852.5733-67-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mipi_csis_set_hsync_settle() is small, called from a single place,
and misnamed (HS stands for high speed, not horizontal sync). Inline it
in its only caller, and refactor the HSSETTLE register field macros
while at it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 938503601c60..4e85611fcdc6 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -108,8 +108,8 @@
 
 /* D-PHY common control */
 #define MIPI_CSIS_DPHYCTRL			0x24
-#define MIPI_CSIS_DPHYCTRL_HSS_MASK		(0xff << 24)
-#define MIPI_CSIS_DPHYCTRL_HSS_OFFSET		24
+#define MIPI_CSIS_DPHYCTRL_HSSETTLE(n)		((n) << 24)
+#define MIPI_CSIS_DPHYCTRL_HSSETTLE_MASK	GENMASK(31, 24)
 #define MIPI_CSIS_DPHYCTRL_SCLKS_MASK		(0x3 << 22)
 #define MIPI_CSIS_DPHYCTRL_SCLKS_OFFSET		22
 #define MIPI_CSIS_DPHYCTRL_DPDN_SWAP_CLK	BIT(6)
@@ -482,15 +482,6 @@ static void __mipi_csis_set_format(struct csi_state *state)
 	mipi_csis_write(state, MIPI_CSIS_ISPRESOL_CH0, val);
 }
 
-static void mipi_csis_set_hsync_settle(struct csi_state *state, int hs_settle)
-{
-	u32 val = mipi_csis_read(state, MIPI_CSIS_DPHYCTRL);
-
-	val = (val & ~MIPI_CSIS_DPHYCTRL_HSS_MASK) | (hs_settle << 24);
-
-	mipi_csis_write(state, MIPI_CSIS_DPHYCTRL, val);
-}
-
 static void mipi_csis_set_params(struct csi_state *state)
 {
 	int lanes = state->bus.num_data_lanes;
@@ -504,7 +495,10 @@ static void mipi_csis_set_params(struct csi_state *state)
 
 	__mipi_csis_set_format(state);
 
-	mipi_csis_set_hsync_settle(state, state->hs_settle);
+	val = mipi_csis_read(state, MIPI_CSIS_DPHYCTRL);
+	val = (val & ~MIPI_CSIS_DPHYCTRL_HSSETTLE_MASK)
+	    | MIPI_CSIS_DPHYCTRL_HSSETTLE(state->hs_settle);
+	mipi_csis_write(state, MIPI_CSIS_DPHYCTRL, val);
 
 	val = (0 << MIPI_CSIS_ISPSYNC_HSYNC_LINTV_OFFSET) |
 		(0 << MIPI_CSIS_ISPSYNC_VSYNC_SINTV_OFFSET) |
-- 
Regards,

Laurent Pinchart

