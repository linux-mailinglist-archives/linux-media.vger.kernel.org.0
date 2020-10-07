Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C14285B15
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgJGIqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:53 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57038 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgJGIqM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:12 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id BE48D634CE6
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:20 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 069/106] ccs-pll: Fix check for PLL multiplier upper bound
Date:   Wed,  7 Oct 2020 11:45:20 +0300
Message-Id: <20201007084557.25843-60-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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

