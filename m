Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7631831B4D5
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhBOEkP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhBOEkL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:40:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA55C0613D6
        for <linux-media@vger.kernel.org>; Sun, 14 Feb 2021 20:39:30 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A30E128FF;
        Mon, 15 Feb 2021 05:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363345;
        bh=eDyW6Vh/crsKvqqa68DILG6ty96jKG15DntA1/oE7Hw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dh3cDd+IpfHSGMLgdKgtsj413yph2TlGkiHotuXmFNgy5gfl1E1nSPXpQT0x3c4xy
         JwGoAYb8gKuXIhCMX54Qy5kGI3TWIebdJRD73AmBv+BtPY0puLTzECmoJVXpfRyPoO
         UOOQkiIS28oQDfhS1ETIflWU2ruKRScmuBTrJlUA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 68/77] media: imx: imx7_mipi_csis: Inline mipi_csis_set_hsync_settle()
Date:   Mon, 15 Feb 2021 06:27:32 +0200
Message-Id: <20210215042741.28850-69-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index a705797559dd..a5f00983bd92 100644
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

