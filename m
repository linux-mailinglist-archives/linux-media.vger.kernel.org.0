Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84892CC4C0
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729406AbgLBSNH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729090AbgLBSNG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 13:13:06 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5959FC0613D4
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 10:11:26 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 0671E634C99;
        Wed,  2 Dec 2020 20:08:32 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 15/38] ccs-pll: Use explicit 32-bit unsigned type
Date:   Wed,  2 Dec 2020 20:06:18 +0200
Message-Id: <20201202180641.17401-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use uint32_t instead of unsigned int for a variable that contains
explicitly 32-bit numbers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index b23e959000a4..d33a2575329c 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -177,7 +177,7 @@ __ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	uint32_t more_mul_factor;
 	uint32_t min_vt_div, max_vt_div, vt_div;
 	uint32_t min_sys_div, max_sys_div;
-	unsigned int i;
+	uint32_t i;
 
 	/*
 	 * Get pre_pll_clk_div so that our pll_op_clk_freq_hz won't be
@@ -406,7 +406,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	uint16_t max_op_pre_pll_clk_div;
 	uint32_t lane_op_clock_ratio;
 	uint32_t mul, div;
-	unsigned int i;
+	uint32_t i;
 	int rval = -EINVAL;
 
 	if (pll->flags & CCS_PLL_FLAG_NO_OP_CLOCKS) {
-- 
2.27.0

