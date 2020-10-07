Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFEB285AE9
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgJGIqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:19 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57060 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728036AbgJGIqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:15 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id EF97B634CE0
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:21 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 085/106] ccs-pll: Fix VT post-PLL divisor calculation
Date:   Wed,  7 Oct 2020 11:45:36 +0300
Message-Id: <20201007084557.25843-76-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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

