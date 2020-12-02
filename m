Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32BA82CC4AC
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbgLBSLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:11:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728916AbgLBSLX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 13:11:23 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B142C0613D4
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 10:09:43 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 17BDB634C8B;
        Wed,  2 Dec 2020 20:08:31 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 03/38] ccs-pll: Use correct VT divisor for calculating VT SYS divisor
Date:   Wed,  2 Dec 2020 20:06:06 +0200
Message-Id: <20201202180641.17401-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
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
index b2f0fa14ff92..ea0f84fc8a90 100644
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

