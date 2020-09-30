Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A5927ECB7
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731099AbgI3P3b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:31 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44680 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731044AbgI3P3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:15 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 0E6C6634CBD
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 079/100] ccs-pll: Fix VT post-PLL divisor calculation
Date:   Wed, 30 Sep 2020 18:28:37 +0300
Message-Id: <20200930152858.8471-80-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
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
index c0f3f68e55d8..52dea3894229 100644
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

