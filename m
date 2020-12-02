Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFF32CC4B9
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbgLBSMl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387531AbgLBSMl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 13:12:41 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3CFC0613CF
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 10:11:25 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id E7009634C98;
        Wed,  2 Dec 2020 20:08:31 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 14/38] ccs-pll: Fix check for PLL multiplier upper bound
Date:   Wed,  2 Dec 2020 20:06:17 +0200
Message-Id: <20201202180641.17401-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The additional multiplier (for higher VT timing) of the PLL multiplier was
checked against the upper limit but the result was rounded up, possibly
producing too high additional multiplier. Round down instead to keep
within hardware limits.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index f4c41d61e332..b23e959000a4 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -204,8 +204,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	dev_dbg(dev, "more_mul_max: max_op_sys_clk_div check: %u\n",
 		more_mul_max);
 	/* Ensure we won't go above max_pll_multiplier. */
-	more_mul_max = min(more_mul_max,
-			   DIV_ROUND_UP(op_lim_fr->max_pll_multiplier, mul));
+	more_mul_max = min(more_mul_max, op_lim_fr->max_pll_multiplier / mul);
 	dev_dbg(dev, "more_mul_max: min_pll_multiplier check: %u\n",
 		more_mul_max);
 
-- 
2.27.0

