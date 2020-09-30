Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCE527ECCC
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731006AbgI3P3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:52 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44648 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730994AbgI3P3K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:10 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 0943D634C96
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:51 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 052/100] ccs-pll: Use correct VT divisor for calculating VT SYS divisor
Date:   Wed, 30 Sep 2020 18:28:10 +0300
Message-Id: <20200930152858.8471-53-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the correct video timing divisor to calculate the SYS divisor. Instead
of the current value, the minimum was used. This could have resulted in a
too low SYS divisor.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index dd30949efb6b..a2cc961366c3 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -365,14 +365,14 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 
 			/* Check if this one is better. */
 			if (pix_div * sys_div
-			    <= roundup(min_vt_div, best_pix_div))
+			    <= roundup(vt_div, best_pix_div))
 				best_pix_div = pix_div;
 		}
 		if (best_pix_div < INT_MAX >> 1)
 			break;
 	}
 
-	pll->vt_bk.sys_clk_div = DIV_ROUND_UP(min_vt_div, best_pix_div);
+	pll->vt_bk.sys_clk_div = DIV_ROUND_UP(vt_div, best_pix_div);
 	pll->vt_bk.pix_clk_div = best_pix_div;
 
 	pll->vt_bk.sys_clk_freq_hz =
-- 
2.27.0

