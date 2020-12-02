Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 174012CC4AE
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgLBSLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:11:24 -0500
Received: from retiisi.eu ([95.216.213.190]:33484 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbgLBSLY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:11:24 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 2811E634C8C;
        Wed,  2 Dec 2020 20:08:31 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 04/38] ccs-pll: End search if there are no better values available
Date:   Wed,  2 Dec 2020 20:06:07 +0200
Message-Id: <20201202180641.17401-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VT divisor search can be ended if we've already found the value that
corresponds exactly the total divisor, as there are no better (lower)
values available.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index ea0f84fc8a90..22e29127804a 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -352,6 +352,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		     sys_div <= max_sys_div;
 		     sys_div += 2 - (sys_div & 1)) {
 			uint16_t pix_div = DIV_ROUND_UP(vt_div, sys_div);
+			uint16_t rounded_div;
 
 			if (pix_div < lim->vt_bk.min_pix_clk_div
 			    || pix_div > lim->vt_bk.max_pix_clk_div) {
@@ -363,10 +364,15 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 				continue;
 			}
 
+			rounded_div = roundup(vt_div, best_pix_div);
+
 			/* Check if this one is better. */
-			if (pix_div * sys_div
-			    <= roundup(vt_div, best_pix_div))
+			if (pix_div * sys_div <= rounded_div)
 				best_pix_div = pix_div;
+
+			/* Bail out if we've already found the best value. */
+			if (vt_div == rounded_div)
+				break;
 		}
 		if (best_pix_div < INT_MAX >> 1)
 			break;
-- 
2.27.0

