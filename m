Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D20C2CC4D0
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389367AbgLBSOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:14:25 -0500
Received: from retiisi.eu ([95.216.213.190]:33612 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389271AbgLBSOZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:14:25 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 41072634CCF;
        Wed,  2 Dec 2020 20:08:33 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 30/38] ccs-pll: Fix VT post-PLL divisor calculation
Date:   Wed,  2 Dec 2020 20:06:33 +0200
Message-Id: <20201202180641.17401-31-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PLL calculator only searched even total divisor values apart from one,
but this is wrong: the total divisor is odd in cases where system divisor
is one. Fix this by including odd total PLL values where system divisor is
one to the search.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 7512f0313010..4321989b9013 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -347,14 +347,16 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
 	 * into a value which is not smaller than div, the desired
 	 * divisor.
 	 */
-	for (vt_div = min_vt_div; vt_div <= max_vt_div;
-	     vt_div += 2 - (vt_div & 1)) {
-		for (sys_div = min_sys_div;
-		     sys_div <= max_sys_div;
+	for (vt_div = min_vt_div; vt_div <= max_vt_div; vt_div++) {
+		uint16_t __max_sys_div = vt_div & 1 ? 1 : max_sys_div;
+
+		for (sys_div = min_sys_div; sys_div <= __max_sys_div;
 		     sys_div += 2 - (sys_div & 1)) {
-			uint16_t pix_div = DIV_ROUND_UP(vt_div, sys_div);
+			uint16_t pix_div;
 			uint16_t rounded_div;
 
+			pix_div = DIV_ROUND_UP(vt_div, sys_div);
+
 			if (pix_div < lim->vt_bk.min_pix_clk_div
 			    || pix_div > lim->vt_bk.max_pix_clk_div) {
 				dev_dbg(dev,
-- 
2.27.0

