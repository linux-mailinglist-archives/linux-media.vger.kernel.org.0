Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624012CC4C1
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730542AbgLBSNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:13:08 -0500
Received: from retiisi.eu ([95.216.213.190]:33612 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728241AbgLBSNI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:13:08 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D3B41634C97;
        Wed,  2 Dec 2020 20:08:31 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 13/38] ccs-pll: Fix comment on check against maximum PLL multiplier
Date:   Wed,  2 Dec 2020 20:06:16 +0200
Message-Id: <20201202180641.17401-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The comment is about minimum PLL multiplier but the related check really
deals with the maximum PLL multiplier.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 78897a7c1448..f4c41d61e332 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -203,7 +203,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 			   / div);
 	dev_dbg(dev, "more_mul_max: max_op_sys_clk_div check: %u\n",
 		more_mul_max);
-	/* Ensure we won't go above min_pll_multiplier. */
+	/* Ensure we won't go above max_pll_multiplier. */
 	more_mul_max = min(more_mul_max,
 			   DIV_ROUND_UP(op_lim_fr->max_pll_multiplier, mul));
 	dev_dbg(dev, "more_mul_max: min_pll_multiplier check: %u\n",
-- 
2.27.0

