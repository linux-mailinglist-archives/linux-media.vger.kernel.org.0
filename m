Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344B42D82B1
	for <lists+linux-media@lfdr.de>; Sat, 12 Dec 2020 00:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393665AbgLKXWg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 18:22:36 -0500
Received: from retiisi.eu ([95.216.213.190]:49048 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407118AbgLKXWX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 18:22:23 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 6EFC2634C87
        for <linux-media@vger.kernel.org>; Sat, 12 Dec 2020 01:20:14 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] ccs-pll: Fix link frequency for C-PHY
Date:   Sat, 12 Dec 2020 01:12:55 +0200
Message-Id: <20201211231255.30352-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The highest fundamental frequency signal for C-PHY is half of the symbol
rate which is similar to D-PHY. Take this into account in ccs-pll.

Also remove the outdated comment.

Fixes: 8030aa4f9c51 ("media: ccs-pll: Add C-PHY support")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index eb7b6f01f623..58ca47e904a1 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -772,14 +772,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 
 	switch (pll->bus_type) {
 	case CCS_PLL_BUS_TYPE_CSI2_DPHY:
-		/* CSI transfers 2 bits per clock per lane; thus times 2 */
-		op_sys_clk_freq_hz_sdr = pll->link_freq * 2
-			* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
-			   1 : pll->csi2.lanes);
-		break;
 	case CCS_PLL_BUS_TYPE_CSI2_CPHY:
-		op_sys_clk_freq_hz_sdr =
-			pll->link_freq
+		op_sys_clk_freq_hz_sdr = pll->link_freq * 2
 			* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
 			   1 : pll->csi2.lanes);
 		break;
-- 
2.29.2

