Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DABA27ECC8
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730633AbgI3P3t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:29:49 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44656 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730856AbgI3P3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:12 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B4BCD634CE8
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:51 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 063/100] ccs-pll: Fix check for PLL multiplier upper bound
Date:   Wed, 30 Sep 2020 18:28:21 +0300
Message-Id: <20200930152858.8471-64-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
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
index 0e474ca65712..c4230c082078 100644
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

